# API
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# AptX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bt.enableAptXHD=true \
    persist.service.btui.use_aptx=1 \
    persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldacs

# BT
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.btmacaddr=00:00:00:00:00:00

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwc.force_gpu=1 \
    persist.sys.ui.hw=false \
    debug.hwui.use_buffer_age=false \
    debug.hwui.renderer=opengl \
    debug.sf.latch_unsignaled=1 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2

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
    ro.sys.sdcardfs=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
  persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.usb.config=mtp,adb
