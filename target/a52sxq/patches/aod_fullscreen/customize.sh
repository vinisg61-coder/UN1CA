#!/usr/bin/env bash

# The native fullscreen capability itself is enabled in target/a52sxq/sff.sh.
# This patch sets the initial per-user AOD state during SettingsProvider setup.
APPLY_PATCH "system" "system/priv-app/SettingsProvider/SettingsProvider.apk" \
    "$MODPATH/SettingsProvider.apk/0001-Set-AOD-always-on-defaults.patch"
