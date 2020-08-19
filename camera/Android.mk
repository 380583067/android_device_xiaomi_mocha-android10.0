LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    Camera3Wrapper.cpp \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog  libcamera_client libutils libgui libhidltransport libcamera_metadata libsensor android.hidl.token@1.0-utils android.hardware.graphics.bufferqueue@1.0

LOCAL_C_INCLUDES += \
    framework/native/include \
    system/core/include \
    system/media/camera/include

LOCAL_HEADER_LIBRARIES := libnativebase_headers

LOCAL_32_BIT_ONLY := true
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
