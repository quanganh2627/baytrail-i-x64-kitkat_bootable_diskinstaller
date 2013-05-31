LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_USE_DISKINSTALLER),true)

LOCAL_SRC_FILES := \
	installer.c

LOCAL_C_INCLUDES := \
	system/extras/ext4_utils \
	system/core/libsparse/include

LOCAL_CFLAGS := -O2 -g -W -Wall -Werror

LOCAL_MODULE := diskinstaller
LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES := $(TARGET_DISK_CONFIG_LIB)
LOCAL_SYSTEM_SHARED_LIBRARIES := \
	libdiskconfig \
	libcutils \
	liblog \
	libext4_utils \
	libsparse \
	libz \
	libc

include $(BUILD_EXECUTABLE)

include $(call first-makefiles-under,$(LOCAL_PATH))
endif

