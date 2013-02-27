# Check for target product
ifeq (jellybam_endeavoru,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/jellybam/overlay/aokp/device/common

# include JELLYBAM common configuration
include vendor/jellybam/config/jellybam_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/endeavoru/cm.mk)

PRODUCT_NAME := jellybam_endeavoru

# JELLYBAM bootanimation
PRODUCT_COPY_FILES += \
    vendor/jellybam/prebuilt/common/bootanimation/xhdpi.zip:system/media/bootanimation.zip

# WIFI DATA FIX
PRODUCT_COPY_FILES += \
    vendor/jellybam/prebuilt/endeavoru/system/bin/fild:system/bin/fild \
    vendor/jellybam/prebuilt/endeavoru/system/bin/getnvm.sh:system/bin/getnvm.sh \
    vendor/jellybam/prebuilt/endeavoru/system/bin/hostapd:system/bin/hostapd \
    vendor/jellybam/prebuilt/endeavoru/system/bin/hostapd_cli:system/bin/hostapd_cli \
    vendor/jellybam/prebuilt/endeavoru/system/bin/hox-uim-sysfs:system/bin/hox-uim-sysfs \
    vendor/jellybam/prebuilt/endeavoru/system/bin/nvm_client:system/bin/nvm_client \
    vendor/jellybam/prebuilt/endeavoru/system/bin/ugexec:system/bin/ugexec \
    vendor/jellybam/prebuilt/endeavoru/system/bin/wpa_cli:system/bin/wpa_cli \
    vendor/jellybam/prebuilt/endeavoru/system/bin/wpa_supplicant:system/bin/wpa_supplicant \
    vendor/jellybam/prebuilt/endeavoru/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    vendor/jellybam/prebuilt/endeavoru/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/jellybam/prebuilt/endeavoru/system/etc/wifi/TQS_D_1.7.ini:system/etc/wifi/TQS_D_1.7.ini \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libbt-aptx-4.0.3.so:system/lib/libbt-aptx-4.0.3.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libhtccamera.so:system/lib/libhtccamera.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libnvcpud_client.so:system/lib/libnvcpud_client.so \
    venndor/jellybam/prebuilt/endeavoru/system/lib/libolaworks.so:system/lib/libolaworks.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libscaladoutil.so:system/lib/libscaladoutil.so \		
    vendor/jellybam/prebuilt/endeavoru/system/lib/libwvdrm_L1.so:system/lib/libwvdrm_L1.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libcapsjava.so:system/lib/libcapsjava.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libhtc-opt2.so:system/lib/libhtc-opt2.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libpn544_fw.so:system/lib/libpn544_fw.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libsrscorehtc.so:system/lib/libsrscorehtc.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libwvm.so:system/lib/libwvm.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libdumppcm.so:system/lib/libdumppcm.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libhtcsunny2engine.so:system/lib/libhtcsunny2engine.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libnvmm_misc.so:system/lib/libnvmm_misc.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libpos.so:system/lib/libpos.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libsrsprocessing.so:system/lib/libsrsprocessing.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libWVStreamControlAPI_L1.so:system/lib/libWVStreamControlAPI_L1.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libfmchr.so:system/lib/libfmchr.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libhtcsunnyengine.so:system/lib/libhtcsunnyengine.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libnvmm_vp6_video.so:system/lib/libnvmm_vp6_video.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libril-icera.so:system/lib/libril-icera.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libsuplhelperservicejni.so:system/lib/libsuplhelperservicejni.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libfmradio.so:system/lib/libfmradio.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libOlaBase.so:system/lib/libOlaBase.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libscaladoapi.so:system/lib/libscaladoapi.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libfmstack.so:system/lib/libfmstack.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libmpl_jni.so:system/lib/libmpl_jni.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libOlaEngine.so:system/lib/libOlaEngine.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libscalado_htcalbum2.so:system/lib/libscalado_htcalbum2.so \
    vendor/jellybam/prebuilt/endeavoru/system/lib/libwpa_client.so:system/lib/libwpa_client.so

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/jellybam/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/jellybam/tools/addprojects.py $(PRODUCT_NAME))

endif

