#
# Copyright (C) 2018 The LineageOS Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm64_ab.mk)

# call the proprietary setup
#$(call inherit-product-if-exists, vendor/huawei/victoria/victoria-vendor.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920 
TARGET_SCREEN_WIDTH := 1080

# Lawnchair
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    $(LOCAL_PATH)/prebuilt/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

PRODUCT_PACKAGES += \
    Lawnchair

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Audio
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# bfm
#PRODUCT_PACKAGES += \
#    bfm-ctl

# Camera
PRODUCT_PACKAGES += \
    Snap

# Device init scripts
PRODUCT_PACKAGES += \
    init.hi3660.rc

# Display
PRODUCT_PACKAGES += \
    libion

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

# LineageHw
#PRODUCT_PACKAGES += \
#    lineage.touch@1.0-service.hi3660

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    device/generic/common/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service
