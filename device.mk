#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_AAPT_CONFIG += xlarge large
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536
TARGET_TEGRA_VERSION := t124

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)


$(call inherit-product-if-exists, vendor/xiaomi/mocha/mocha-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/xiaomi/mocha/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.tn8 \
    init.cal.rc \
    init.comms.rc \
    init.icera.rc \
    init.hdcp.rc \
    init.ray_touch.rc \
    init.t124.rc \
    init.tegra.rc \
    init.tlk.rc \
    init.tn8.rc \
    init.tn8.usb.rc \
    init.tn8_common.rc \
    init.ussrd.rc \
    power.tn8.rc \
    ueventd.tn8.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.blakemanager.xml:system/etc/permissions/com.nvidia.blakemanager.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml


# keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio.mocha.xml:system/etc/audio.mocha.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.tegra \
    libaudiohalcm \
    libaudio-resampler \
    libaudiospdif \
    libstagefrighthw \
    libtinycompress \
    tinycap_mocha \
    tinymix_mocha \
    tinyplay_mocha \
    libtinyalsa_mocha \
    libtinyalsa \
    xaplay


# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PACKAGES += \
    libbt-vendor

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    brcm-uim-sysfs \
    libfmjni

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/camera/model_frontal.xml:system/etc/model_frontal.xml

PRODUCT_PACKAGES += \
    camera.tegra

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Wifi
# All Shield devices xurrently use broadcom wifi / bluetooth modules
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4354/device-bcm.mk)
PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Light
#PRODUCT_PACKAGES += \
#    lights.tegra

# Missing symbols lib

PRODUCT_PACKAGES += \
    libmocha_camera \
    libmocha_omx \
    libpowerservice_client \
    libmocha_libc

PRODUCT_CHARACTERISTICS := tablet

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Comm Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Power
PRODUCT_PACKAGES += power.tegra

# Sensors
PRODUCT_PACKAGES += \
    sensors.tegra

# Multi HAL configuration file
PRODUCT_COPY_FILES += \
    device/xiaomi/mocha/sensors/etc/hals.conf:system/etc/sensors/hals.conf


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# Console Mode
$(call inherit-product-if-exists, vendor/xiaomi/mocha/consolemode-blobs.mk)

