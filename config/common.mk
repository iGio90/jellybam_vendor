PRODUCT_BRAND ?= cyanogenmod

# To deal with CM9 specifications
# TODO: remove once all devices have been switched
ifneq ($(TARGET_BOOTANIMATION_NAME),)
TARGET_SCREEN_DIMENSIONS := $(subst -, $(space), $(subst x, $(space), $(TARGET_BOOTANIMATION_NAME)))
ifeq ($(TARGET_SCREEN_WIDTH),)
TARGET_SCREEN_WIDTH := $(word 2, $(TARGET_SCREEN_DIMENSIONS))
endif
ifeq ($(TARGET_SCREEN_HEIGHT),)
TARGET_SCREEN_HEIGHT := $(word 3, $(TARGET_SCREEN_DIMENSIONS))
endif
endif

ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# clear TARGET_BOOTANIMATION_NAME in case it was set for CM9 purposes
TARGET_BOOTANIMATION_NAME :=

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/cm/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi;
  fi;
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

ifdef JELLYBAM_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmodnightly
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmod
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/cm/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# JELLYBAM APPS
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/apps/AudioEffectService.apk/system/app/AudioEffectService.apk \
    vendor/cm/prebuilt/common/apps/PerformanceControl.apk:system/app/PerformanceControl.apk \
    vendor/cm/prebuilt/common/apps/BamPapers.apk:system/app/BamPapers.apk \
    vendor/cm/prebuilt/common/apps/XPosedDPI.apk:system/app/XPosedDPI.apk \
    vendor/cm/prebuilt/common/apps/XPosedInstaller.apk:system/app/XPosedInstaller.apk \
    vendor/cm/prebuilt/common/apps/ATweakerFree.apk:system/app/ATweakerFree.apk \
    vendor/cm/prebuilt/common/apps/UpdateMe.apk:system/app/UpdateMe.apk \
    vendor/cm/prebuilt/common/apps/AccuweatherDaemon.apk:system/app/AccuweatherDaemon.apk \
    vendor/cm/prebuilt/common/apps/AccuweatherWidget.apk:system/app/AccuweatherWidget.apk \
    vendor/cm/prebuilt/common/apps/AccuweatherWidget_Main.apk:system/app/AccuweatherWidget_Main.apk \
    vendor/cm/prebuilt/common/apps/BadgeProvider.apk:system/app/BadgeProvider.apk \
    vendor/cm/prebuilt/common/apps/SamsungServiceMode.apk:system/app/SamsungServiceMode.apk \
    vendor/cm/prebuilt/common/apps/SamsungTTS.apk:system/app/SamsungTTS.apk \
    vendor/cm/prebuilt/common/apps/SamsungWidget_WeatherClock.apk:system/app/SamsungWidget_WeatherClock.apk \
    vendor/cm/prebuilt/common/apps/SecLauncher2.apk:system/app/SecLauncher2.apk \
    vendor/cm/prebuilt/common/apps/SecWallpaperChooser.apk:system/app/SecWallpaperChooser.apk 

# JELLYBAM XML
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/xml/update_me.xml:system/update_me.xml \
    vendor/cm/prebuilt/common/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    vendor/cm/prebuilt/common/etc/audio_effects.conf:system/etc/audio_effects.conf

# JELLYBAM LIBS
    vendor/cm/prebuilt/common/xml/libdrawglfunction.so:system/lib/libdrawglfunction.so \
    vendor/cm/prebuilt/common/xml/libxloudwrapper.so:system/lib/soundfx/libxloudwrapper.so

# JELLYBAM ETC PERMISSIONS
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/xml/features.xml:system/etc/permissions/features.xml \
    vendor/cm/prebuilt/common/xml/touchwiz.xml:system/etc/permissions/touchwiz.xml \
    vendor/cm/prebuilt/common/xml/vtmanager_library.xml:system/etc/permissions/vtmanager_library.xml \
    vendor/cm/prebuilt/common/xml/com.sonyericsson.audioeffectif.xml:system/etc/permissions

# JELLYBAM FRAMEWORKS
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/xml/twframework.jar:system/framework/twframework.jar \
    vendor/cm/prebuilt/common/xml/twframework-res.apk:system/framework/twframework-res.apk \
    vendor/cm/prebuilt/common/xml/semc_audioeffectif.jar:system/framework/semc_audioeffectif.jar
# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/cm/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/cm/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/cm/prebuilt/common/bin/blacklist:system/addon.d/blacklist


# init.d support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cm/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/cm/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Terminal Emulator
PRODUCT_COPY_FILES +=  \
    vendor/cm/proprietary/Term.apk:system/app/Term.apk \
    vendor/cm/proprietary/lib/armeabi/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/cm/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/cm/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/cm/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/cm/config/themes_common.mk

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    Superuser \
    su

# Optional CM packages
PRODUCT_PACKAGES += \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom CM packages
PRODUCT_PACKAGES += \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    CMWallpapers \
    Apollo \
    CMUpdater \
    CMFileManager \
    LockClock

# Extra tools in CM
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/common

PRODUCT_VERSION_MAJOR = 6
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0
JELLYBAM_BUILDTYPE = STABLE

JELLYBAM_VERSION = v$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(CM_BUILD)-$(JELLYBAM_BUILDTYPE)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.jellybam.version=$(JELLYBAM_VERSION) \
  ro.modversion=$(JELLYBAM_VERSION)


-include $(WORKSPACE)/hudson/image-auto-bits.mk
