#!/usr/bin/env bash
# Copyright (c) 2026
# SPDX-License-Identifier: GPL-3.0-or-later

# Integrates bone-machine's SM7325 KernelSU-Next/SUSFS One UI kernel into
# the UN1CA target work directory. The integration is opt-in.

set -e

source "$SRC_DIR/scripts/utils/build_utils.sh" || exit 1

if [[ "${TARGET_BONE_KERNEL_ENABLED:-false}" != "true" ]]; then
    LOG "Bone-machine kernel integration disabled"
    exit 0
fi

if [[ "${TARGET_CODENAME:-}" != "a52sxq" || "${TARGET_PLATFORM:-}" != "sm7325" ]]; then
    LOGE "Bone-machine integration is restricted to a52sxq/sm7325"
    exit 1
fi

KERNEL_REPO="${TARGET_BONE_KERNEL_REPO:-bone-machine/android_kernel_samsung_sm7325_a52s_5g}"
KERNEL_BRANCH="${TARGET_BONE_KERNEL_BRANCH:-ksu-next-susfs-oneui}"
KERNEL_MODE="${TARGET_BONE_KERNEL_MODE:-release}"
KERNEL_SOURCE_DIR="${TARGET_BONE_KERNEL_SOURCE_DIR:-}"
[[ "$KERNEL_SOURCE_DIR" == "none" ]] && KERNEL_SOURCE_DIR=""
KERNEL_RELEASE_URL="${TARGET_BONE_KERNEL_RELEASE_URL:-https://github.com/bone-machine/android_kernel_samsung_sm7325_a52s_5g/releases/download/v3.2.0-legacy/bone-machine_One-UI_KSU-Next-v3.2.0-legacy_SUSFS_a52sxq.zip}"

TMP_ROOT="$(mktemp -d "$OUT_DIR/bone-kernel.XXXXXX")"
trap 'rm -rf "$TMP_ROOT"' EXIT INT

KERNEL_ZIP=""

DOWNLOAD_RELEASE()
{
    KERNEL_ZIP="$TMP_ROOT/bone-machine.zip"
    LOG "Downloading bone-machine SUSFS One UI kernel"
    curl -fL --retry 3 --retry-delay 2 "$KERNEL_RELEASE_URL" -o "$KERNEL_ZIP" || return 1
}

BUILD_FROM_SOURCE()
{
    local SOURCE_DIR="$1"
    local LINK_ROOT="$TMP_ROOT/android_kernel_samsung_sm7325_a52s_5g"
    local BACKUP_DIR="$TMP_ROOT/baseimages-backup"
    local BUILD_STARTED
    local ZIP_CANDIDATE
    local BOOT_IMAGE
    local VENDOR_BOOT_IMAGE

    [ -d "$SOURCE_DIR" ] || {
        LOGE "Bone-machine source directory not found: $SOURCE_DIR"
        return 1
    }
    git -C "$SOURCE_DIR" rev-parse --git-dir >/dev/null 2>&1 || {
        LOGE "Bone-machine source directory is not a git repository: $SOURCE_DIR"
        return 1
    }

    local CURRENT_BRANCH
    CURRENT_BRANCH="$(git -C "$SOURCE_DIR" rev-parse --abbrev-ref HEAD)"
    if [[ "$CURRENT_BRANCH" != "$KERNEL_BRANCH" ]]; then
        LOGE "Bone-machine source is on '$CURRENT_BRANCH', expected '$KERNEL_BRANCH'"
        LOGE "Checkout the SUSFS One UI branch before building: git -C '$SOURCE_DIR' checkout '$KERNEL_BRANCH'"
        return 1
    fi

    BOOT_IMAGE="$WORK_DIR/kernel/boot.img"
    VENDOR_BOOT_IMAGE="$WORK_DIR/kernel/vendor_boot.img"
    [ -f "$BOOT_IMAGE" ] || {
        LOGE "UN1CA stock boot.img is missing from $WORK_DIR/kernel"
        return 1
    }
    [ -f "$VENDOR_BOOT_IMAGE" ] || {
        LOGE "UN1CA stock vendor_boot.img is missing from $WORK_DIR/kernel"
        return 1
    }

    # The upstream bone-machine script insists on the historical source-tree
    # basename. A symlink keeps the user's checkout untouched and satisfies it.
    ln -s "$SOURCE_DIR" "$LINK_ROOT"
    mkdir -p "$BACKUP_DIR"
    for image in boot.img vendor_boot.img; do
        if [ -f "$SOURCE_DIR/toolchain/baseimages/oneui/$image" ]; then
            cp -a "$SOURCE_DIR/toolchain/baseimages/oneui/$image" "$BACKUP_DIR/$image"
        fi
        cp -a "$WORK_DIR/kernel/$image" "$SOURCE_DIR/toolchain/baseimages/oneui/$image"
    done

    BUILD_STARTED="$(date +%s)"
    LOG "Building bone-machine branch $KERNEL_BRANCH from source"
    (
        cd "$LINK_ROOT"
        bash ./build_kernel_zip.sh
    ) || return 1

    ZIP_CANDIDATE="$(find "$SOURCE_DIR" -maxdepth 1 -type f -name '*_One-UI_*_a52sxq.zip' -newermt "@$BUILD_STARTED" -printf '%T@ %p\n' | sort -nr | head -n 1 | cut -d ' ' -f 2-)"
    [ -f "$ZIP_CANDIDATE" ] || {
        LOGE "Bone-machine build completed without producing a One UI kernel ZIP"
        return 1
    }
    KERNEL_ZIP="$ZIP_CANDIDATE"

    # Restore the source checkout's original templates even if the build used
    # the current UN1CA boot images as input.
    for image in boot.img vendor_boot.img; do
        if [ -f "$BACKUP_DIR/$image" ]; then
            cp -a "$BACKUP_DIR/$image" "$SOURCE_DIR/toolchain/baseimages/oneui/$image"
        else
            rm -f "$SOURCE_DIR/toolchain/baseimages/oneui/$image"
        fi
    done
}

case "$KERNEL_MODE" in
    release)
        if [ -n "$KERNEL_SOURCE_DIR" ]; then
            LOGE "TARGET_BONE_KERNEL_SOURCE_DIR is set but TARGET_BONE_KERNEL_MODE=release"
            LOGE "Use TARGET_BONE_KERNEL_MODE=source or unset TARGET_BONE_KERNEL_SOURCE_DIR"
            exit 1
        fi
        DOWNLOAD_RELEASE || exit 1
        ;;
    source)
        [ -n "$KERNEL_SOURCE_DIR" ] || {
            LOGE "TARGET_BONE_KERNEL_SOURCE_DIR is required in source mode"
            exit 1
        }
        BUILD_FROM_SOURCE "$KERNEL_SOURCE_DIR" || exit 1
        ;;
    *)
        LOGE "Unknown TARGET_BONE_KERNEL_MODE: $KERNEL_MODE (expected release or source)"
        exit 1
        ;;
esac

EXTRACT_DIR="$TMP_ROOT/extracted"
mkdir -p "$EXTRACT_DIR"

for image in boot.img vendor_boot.img dtbo.img; do
    unzip -p "$KERNEL_ZIP" "images/$image" > "$EXTRACT_DIR/$image" || {
        LOGE "Kernel ZIP does not contain images/$image"
        exit 1
    }
    [ -s "$EXTRACT_DIR/$image" ] || {
        LOGE "Extracted kernel image is empty: $image"
        exit 1
    }
done

mkdir -p "$WORK_DIR/kernel"
for image in boot.img vendor_boot.img dtbo.img; do
    cp -a "$EXTRACT_DIR/$image" "$WORK_DIR/kernel/$image" || exit 1
done

# Keep the source firmware's separate dt.img, if present. The bone-machine
# release intentionally ships boot/vendor_boot/dtbo only, matching its own
# recovery ZIP layout.
LOG "Integrated bone-machine SUSFS One UI kernel into $WORK_DIR/kernel"
LOG "Kernel source: $KERNEL_REPO ($KERNEL_BRANCH)"
LOG "Kernel mode: $KERNEL_MODE"

exit 0
