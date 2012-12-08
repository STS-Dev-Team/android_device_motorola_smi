# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit enhanced nfc config 
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration for Moto Razr i
$(call inherit-product, device/motorola/smi/full_smi.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/smi/overlay

#
# Setup device specific product configuration.
#
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_DEVICE := smi
PRODUCT_NAME := cm_smi
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := XT890
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := Razr i

#Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=XT890 BUILD_FINGERPRINT="motorola/XT890_rtgb/smi:4.0.4/8.7.1I-110_IFW-31/1348340390:user/release-keys" PRIVATE_BUILD_DESC="smi-user 4.0.4 8.7.1I-110_IFW-31 1348340390 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := RazrI
