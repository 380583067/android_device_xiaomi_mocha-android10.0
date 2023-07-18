ifeq ($(BOARD_HAVE_QCOM_FM),true)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    FmIoctlsInterface.cpp \
    ConfigFmThs.cpp \
    FmPerformanceParams.cpp \
    ConfFileParser.cpp \
    FmRadioController.cpp \
    LibfmJni.cpp

LOCAL_C_INCLUDES := $(JNI_H_INCLUDE) \
    frameworks/base/core/jni/include \
    frameworks/base/include/media

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libdl \
    liblog \
    libmedia \
    libnativehelper \

ifeq ($(TARGET_QCOM_NO_FM_FIRMWARE),true)
    LOCAL_CFLAGS += -DQCOM_NO_FM_FIRMWARE
endif

LOCAL_MODULE := libfmjni
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
endif # BOARD_HAVE_QCOM_FM