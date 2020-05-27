# AptX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bt.enableAptXHD=true

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwc.force_gpu=1 \
    debug.mdpcomp.maxlayer = 0 \
    debug.composition.type = gpu \
    dev.pm.gpu_samplingrate = 1 \
    debug.sf.hw = 1 \
    debug.egl.hw = 1 \
    persist.sys.ui.hw=true \
    debug.sf.disable_backpressure=1 \
    debug.sf.latch_unsignaled=1 \
    debug.hwui.renderer = skiagl \
    debug.hwui.render_dirty_regions=true \
    debug.hwui.profile.maxframes=5 \
    debug.hwc.max_hw_overlays=0 \
    debug.sf.disable_hwcomposer=1
   
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
