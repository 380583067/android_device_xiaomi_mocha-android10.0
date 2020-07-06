LOCAL_PATH:= $(call my-dir)

## libshim_atomic
include $(CLEAR_VARS)

LOCAL_SRC_FILES := atomic.cpp
LOCAL_MODULE := libshim_atomic
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CFLAGS := -O3 -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

## liblog
include $(CLEAR_VARS)

LOCAL_SRC_FILES := stdio_vsnprintf.cpp
LOCAL_C_INCLUDES := \
    bionic/libc \
    bionic/libc/stdio \
    bionic/libc/async_safe/include
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libs
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

## libshim_zw
include $(CLEAR_VARS)

LOCAL_SRC_FILES := zygote_whitelist.cpp
LOCAL_C_INCLUDES := frameworks/base/core/jni \
                    system/core/base/include
ifneq ($(ZYGOTE_WHITELIST_PATH_EXTRA),)
    LOCAL_CFLAGS += -DPATH_WHITELIST_EXTRA=$(ZYGOTE_WHITELIST_PATH_EXTRA)
endif
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libshim_zw
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
