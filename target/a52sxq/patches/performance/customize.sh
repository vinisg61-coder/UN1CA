# Safe runtime defaults for Android 16 ART Service and the A52s performance class.
# Profile-guided compilation improves frequently used code without forcing every method
# through full AOT compilation or increasing cold-boot work unnecessarily.
LOG "- Enabling ART JIT and profile-guided dexopt defaults"
SET_PROP "system" "dalvik.vm.usejit" "true"
SET_PROP "system" "dalvik.vm.dex2oat-swap" "true"
SET_PROP "system" "dalvik.vm.dex2oat-resolve-startup-strings" "true"
SET_PROP "system" "pm.dexopt.bg-dexopt" "speed-profile"
SET_PROP "system" "pm.dexopt.install" "speed-profile"
SET_PROP "system" "pm.dexopt.shared" "speed"
SET_PROP "system" "pm.dexopt.ab-ota" "speed-profile"

# Keep the A52s on the high-performance memory policy and use PSI instead of
# legacy minfree thresholds. This avoids unnecessary cached-app kills under normal use.
LOG "- Enabling high-performance memory policy and PSI-aware LMKD"
SET_PROP "system" "ro.config.low_ram" "false"
SET_PROP "system" "ro.lmk.use_psi" "true"
SET_PROP "system" "ro.lmk.use_minfree_levels" "false"
SET_PROP "system" "ro.lmk.kill_heaviest_task" "true"
SET_PROP "system" "ro.lmk.critical_upgrade" "false"

# Let RenderEngine request a higher-priority EGL context when the vendor driver supports it.
LOG "- Enabling SurfaceFlinger render context priority when supported"
SET_PROP "vendor" "ro.surface_flinger.use_context_priority" "true"
