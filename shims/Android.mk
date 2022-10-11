LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ims_shimmy.cpp
LOCAL_MULTILIB := 64
LOCAL_MODULE := libims_shim
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
