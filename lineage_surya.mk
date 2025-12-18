#
# Copyright (C) 2020-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from surya device
$(call inherit-product, device/xiaomi/surya/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Axion build flag
TARGET_DISABLE_EPPE := true
TARGET_ENABLE_BLUR := true
AXION_CAMERA_REAR_INFO := 64,13,2,2
AXION_CAMERA_FRONT_INFO := 20
AXION_MAINTAINER := Nothing_Here
AXION_PROCESSOR := Snapdragon_732G

# Charging
BYPASS_CHARGE_SUPPORTED ?= true

# CPU governor support
PERF_GOV_SUPPORTED := false
PERF_DEFAULT_GOV := schedutil
PERF_ANIM_OVERRIDE := false

# GPU
GPU_FREQS_PATH := /sys/devices/platform/28000000.mali/available_frequencies
GPU_MIN_FREQ_PATH := /sys/devices/platform/28000000.mali/hint_min_freq

# High Brightness Mode (HBM)
HBM_SUPPORTED := false
HBM_NODE := /sys/class/backlight/panel0-backlight/hbm_mode

# Flashlight strength
TORCH_STR_SUPPORTED := true

# doze fix
# for devices with doze/sensor related issues 
TARGET_NEEDS_DOZE_FIX := false

# [experimental] userspace simple lmk trial version 
# of https://github.com/kerneltoast/android_kernel_google_gs201/blob/16.0.0-sultan/drivers/android/simple_lmk.c ©kerneltoast
# Targets devices with prebuilt kernels or uslmk support across kernels
TARGET_USES_USLMK := false

# do not enable TARGET_IS_LOW_RAM if your device ram is greater than 4gb
# else OOM will most likely occur on operations where applications and camera can fill heap limit
# e.g uploading video/media on apps with camera preview
# this is a mitigation targets legacy devices 4gb below
# Using quicken is a trade-off: here we trade clean pages for dirty pages,
# extra cpu and battery. That's because the quicken files will be jit-ed in all
# the processes that load of shared apk and the code cache is not shared.
# Some notable apps that will be affected by this are gms and chrome.
TARGET_IS_LOW_RAM ?= false
PRODUCT_NAME := lineage_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := M2007J20CG
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="surya_global-user 12 RKQ1.211019.001 V14.0.2.0.SJGMIXM release-keys" \
    BuildFingerprint=POCO/surya_global/surya:12/RKQ1.211019.001/V14.0.2.0.SJGMIXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
