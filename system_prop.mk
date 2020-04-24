# AptX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bt.enableAptXHD=true


# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.disable_hwc=1 \
    debug.hwui.profile=true

# Lineage genuine
PRODUCT_PROPERTY_OVERRIDES += \
    persist.lineage.nofool=true

# OMX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=false

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1
