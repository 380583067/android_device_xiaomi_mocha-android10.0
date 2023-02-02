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

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

#DIDIM
PRODUCT_PROPERTY_OVERRIDES += \
persist.tegra.didim.enable = 1 \
persist.tegra.didim.video = 5 \
persist.tegra.didim.normal = 3 \

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609\
    ro.sf.lcd_density=320 \
    persist.tegra.compositor=glcomposer \
    persist.tegra.decompression=cde-client \
    ro.hardware.vulkan=nvgpu \
    debug.sf.latch_unsignaled=1 \
    debug.sf.disable_backpressure=1 \
    persist.tegra.compositor=gldrawtexture \
    ro.input.noresample=1 \
    ro.com.google.clientidbase=android-nvidia \
    ro.zygote.disable_gl_preload=true \
    persist.vendor.tegra.composite.policy=composite-yuv \
    debug.hwc.force_gpu=1 \
    persist.sys.ui.hw=false \
    debug.hwui.use_buffer_age=false \
    debug.hwui.renderer=opengl \
    debug.sf.latch_unsignaled=1 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2 \
    debug.sf.disable_hwc=1

# Lineage genuine
PRODUCT_PROPERTY_OVERRIDES += \
    persist.lineage.nofool=true

# LMKD options
PRODUCT_PROPERTY_OVERRIDES += \
 ro.lmk.low=1001 \
 ro.lmk.medium=800  \
 ro.lmk.critical=0 \
 ro.lmk.critical_upgrade=false \
 ro.lmk.upgrade_pressure=100 \
 ro.lmk.downgrade_pressure=100 \
 ro.lmk.kill_heaviest_task=true \
 ro.lmk.kill_timeout_ms=100 \
 ro.lmk.use_minfree_levels=tru \

# OMX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# PBC
PRODUCT_PROPERTY_OVERRIDES += \
pbc.enabled=0 \
pbc.log=0 \
pbc.board_power_threshold=20000 \
pbc.low_polling_freq_threshold=1000 \
pbc.rails=cpu,core,dram,gpu \
pbc.cpu.power=/sys/bus/i2c/devices/7-0045/power1_input \
pbc.cpu.cap=/dev/cpu_freq_max \
pbc.cpu.cap.af=/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies \
pbc.core.power=/sys/bus/i2c/devices/7-0043/power1_input \
pbc.dram.power=/sys/bus/i2c/devices/7-0049/power1_input \
pbc.gpu.power=/sys/bus/i2c/devices/7-004b/power1_input \
pbc.gpu.cap=/dev/gpu_freq_max \
pbc.gpu.cap.af=/sys/devices/platform/host1x/gk20a.0/devfreq/gk20a.0/available_frequencies

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes
    
# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    wifi.interface=wlan0 \
    ap.interface=wlan0 \
    persist.tegra.nvmmlite = 1 \
    persist.wlan.ti.calibrated = 0


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
  persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.usb.config=mtp,adb \
  ro.secure=0 \
  ro.adb.secure=0 

# Vendor Patch Level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2018-01-05