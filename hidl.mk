# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@4.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@4.0-impl 

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl\
    android.hardware.bluetooth@1.0-service\
    android.hardware.bluetooth.a2dp@1.0-impl

# Camera HAL
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-impl-legacy

# FM Radio HAL
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
   
# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.mocha

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-impl \
    android.hardware.media.omx@1.0-service

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service.mocha \
    power.tegra

# Renderscript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.mocha

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service 
    

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/manifest.xml:system/vendor/manifest.xml
