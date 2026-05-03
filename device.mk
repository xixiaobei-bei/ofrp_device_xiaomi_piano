#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure virtual_ab_ota compression_with_xor.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp config common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# API
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fuse.passthrough.enable=true \
    ro.twrp.device_version=Xiaomi_Pad8_Pro

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey

# Required modules
TWRP_REQUIRED_MODULES += \
    prebuilt

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
