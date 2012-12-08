DEVICE_FOLDER := device/motorola/smi

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/smi/smi-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/ramdisk/init.smi.rc:root/init.smi.rc \
    $(DEVICE_FOLDER)/ramdisk/init.smi.usb.rc:root/init.smi.usb.rc \
    $(DEVICE_FOLDER)/ramdisk/init.sc1.rc:root/init.sc1.rc \
    $(DEVICE_FOLDER)/ramdisk/init.sdcard.rc:root/init.sdcard.rc \
    $(DEVICE_FOLDER)/ramdisk/init.wifi.rc:root/init.wifi.rc \
    $(DEVICE_FOLDER)/ramdisk/init.xmm.rc:root/init.xmm.rc \
    $(DEVICE_FOLDER)/ramdisk/ueventd.smi.rc:root/ueventd.smi.rc \
    $(DEVICE_FOLDER)/ramdisk/android.fstab:root/android.fstab

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/idc/atmxt-i2c.idc:system/usr/idc/atmxt-i2c.idc \
    $(DEVICE_FOLDER)/prebuilt/idc/mxt224_touchscreen_0.idc:system/usr/idc/mxt224_touchscreen_0.idc

PRODUCT_PACKAGES += \
    apache-harmony-tests \
    bd_prov \
    bthelp \
    btcmd \
    depmod \
    dhcp6c \
    jcifs-1.3.16 \
    libglib-2.0 \
    libgmodule-2.0 \
    libgobject-2.0 \
    libgthread-2.0 \
    libpsb_drm \
    libmemrar \
    libwbxmlparser \
    libz \
    pack_intel \
    uim \
    unpack_intel

# Audio
PRODUCT_PACKAGES += \
    alsa.smi \
    alsa_aplay \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.smi \
    audio.primary.smi \
    libalsa-intf \
    libasound \
    libaudioutils


# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    dhcpcd.conf \
    hostapd.conf \
    wifical.sh \
    wpa_supplicant.conf \
    TQS_D_1.7.ini \
    TQS_D_1.7_127x.ini \
    crda \
    regulatory.bin \
    calibrator \
    busybox

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
	$(LOCAL_PATH)/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/watchdogd:recovery/root/sbin/watchdogd \
	$(LOCAL_PATH)/blobs/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat \

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product,$(SRC_TARGET_DIR)/product/generic_x86.mk)
$(call inherit-product, build/target/product/full_base_telephony.mk)
