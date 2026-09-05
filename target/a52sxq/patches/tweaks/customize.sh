# UN1CA A52s performance/autonomy profile
# Keep background work on efficiency cores while preserving the foreground cluster.
LINE="$(sed -n '/\/dev\/cpuset\/background\/cpus/=' "$WORK_DIR/vendor/bin/init.kernel.post_boot-yupik.sh")"
if [ -n "$LINE" ]; then
    sed -i \
        "$LINE cecho 0-1 > /dev/cpuset/background/cpus\necho 0-3 > /dev/cpuset/restricted/cpus" \
        "$WORK_DIR/vendor/bin/init.kernel.post_boot-yupik.sh"
fi

# Adaptive refresh/idle timers: lower idle overhead without disabling thermal controls.
echo "Applying A52s adaptive refresh and idle timers"
SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "true"
if [ -f "$WORK_DIR/vendor/default.prop" ]; then
    sed -i \
        "/use_content_detection/ a ro.surface_flinger.set_idle_timer_ms=3000\nro.surface_flinger.set_touch_timer_ms=500\nro.surface_flinger.set_display_power_timer_ms=1000" \
        "$WORK_DIR/vendor/default.prop"
fi

# One UI 6.1 AOD fullscreen capability. The feature is native to the framework;
# this only exposes it in floating_feature.xml and does not alter panel refresh policy.
FEATURE="SEC_FLOATING_FEATURE_LCD_CONFIG_AOD_FULLSCREEN"
FLOATING_FEATURE="$WORK_DIR/system/etc/floating_feature.xml"
if [ -f "$FLOATING_FEATURE" ]; then
    echo "Enabling native fullscreen AOD capability"
    if grep -q "<$FEATURE>" "$FLOATING_FEATURE"; then
        sed -i "s|<$FEATURE>[^<]*</$FEATURE>|<$FEATURE>1</$FEATURE>|" "$FLOATING_FEATURE"
    else
        sed -i "/<\/SecFloatingFeatureSet>/i\\    <$FEATURE>1</$FEATURE>" "$FLOATING_FEATURE"
    fi
fi
