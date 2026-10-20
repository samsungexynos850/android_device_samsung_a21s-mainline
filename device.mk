#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a21s_mainline

# Inherit from mainline/common
$(call inherit-product, device/mainline/common/mainline_common.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Graphics
# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 280dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Graphics (allocator)
TARGET_GRAPHICS_ALLOCATOR_HAL := minigbm-upstream

# Graphics composer
TARGET_GRAPHICS_COMPOSER_HAL := drmfb-composer

# HIDL
PRODUCT_PACKAGES += \
    vndservicemanager

# Images
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init/fstab.exynos850:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.exynos850 \
    $(DEVICE_PATH)/init/init.mainline.exynos850.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mainline.exynos850.rc

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Keyboard
TARGET_ENABLE_FBKEYBOARD := true

# Mesa
TARGET_GRAPHICS := mesa
TARGET_GRAPHICS_EGL := angle
TARGET_GRAPHICS_VULKAN := mesa

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init/fstab.exynos850:$(TARGET_COPY_OUT_RAMDISK)/fstab.exynos850

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init/init.recovery.mainline.exynos850.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mainline.exynos850.rc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
