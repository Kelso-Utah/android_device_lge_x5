#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Specific overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/x5/overlay

# Configs
PRODUCT_COPY_FILES += \
    device/lge/x5/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/x5/prebuilt/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/lge/x5/prebuilt/usr/idc/touch_dev.idc:system/usr/idc/touch_dev.idc \
    device/lge/x5/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lge/x5/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/lge/x5/prebuilt/etc/init.d/10lightfixer:system/etc/init.d/10lightfixer \
    device/lge/x5/prebuilt/etc/init.d/10lightshal:system/etc/init.d/10lightshal

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.ril.sh:system/etc/init.qcom.ril.sh

# GPS for volt
PRODUCT_COPY_FILES += \
    device/lge/x5/gps/etc/gps.conf:system/etc/gps.conf

# Build our own lights hal for volt
PRODUCT_PACKAGES += \
    lights.x5

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Common specific options
BOARD_HAS_QCOM_WCNSS := true

# Inherit from msm8226-common
$(call inherit-product, device/lge/msm8226-common/msm8226.mk)
$(call inherit-product, vendor/lge/x5/x5-vendor.mk)

