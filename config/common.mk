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

# JELLYBAM THINGS
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/apps/AudioEffectService.apk:system/app/AudioEffectService.apk \
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
    vendor/cm/prebuilt/common/apps/SecWallpaperChooser.apk:system/app/SecWallpaperChooser.apk \
    vendor/cm/prebuilt/common/libs/libdrawglfunction.so:system/lib/libdrawglfunction.so \
    vendor/cm/prebuilt/common/libs/libswiqibmpcnv.so:system/lib/libswiqibmpcnv.so \
    vendor/cm/prebuilt/common/libs/libxloudwrapper.so:system/lib/soundfx/libxloudwrapper.so \
    vendor/cm/prebuilt/common/xml/update_me.xml:system/update_me.xml \
    vendor/cm/prebuilt/common/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    vendor/cm/prebuilt/common/etc/audio_effects.conf:system/etc/audio_effects.conf \
    vendor/cm/prebuilt/common/etc/be_movie:system/etc/be_movie \
    vendor/cm/prebuilt/common/etc/be_photo:system/etc/be_photo \
    vendor/cm/prebuilt/common/xml/features.xml:system/etc/permissions/features.xml \
    vendor/cm/prebuilt/common/xml/touchwiz.xml:system/etc/permissions/touchwiz.xml \
    vendor/cm/prebuilt/common/xml/vtmanager_library.xml:system/etc/permissions/vtmanager_library.xml \
    vendor/cm/prebuilt/common/xml/com.sonyericsson.audioeffectif.xml:system/etc/permissions/com.sonyericsson.audioeffectif.xml \
    vendor/cm/prebuilt/common/xml/com.sonyericsson.android.SwIqiBmp.xml:system/etc/permissions/com.sonyericsson.android.SwIqiBmp.xml \
    vendor/cm/prebuilt/common/xml/twframework.jar:system/framework/twframework.jar \
    vendor/cm/prebuilt/common/xml/twframework-res.apk:system/framework/twframework-res.apk \
    vendor/cm/prebuilt/common/xml/semc_audioeffectif.jar:system/framework/semc_audioeffectif.jar \
    vendor/cm/prebuilt/common/xml/com.sonyericsson.android.SwIqiBmp.jar:system/framework/com.sonyericsson.android.SwIqiBmp.jar \
    vendor/cm/prebuilt/common/gapps/addon.d/70-gapps.sh:system/addon.d/70-gapps.sh \
    vendor/cm/prebuilt/common/gapps/addon.d/71-gapps-faceunlock.sh:system/addon.d/71-gapps-faceunlock.sh \
    vendor/cm/prebuilt/common/gapps/app/ChromeBookmarksSyncAdapter.apk:system/app/ChromeBookmarksSyncAdapter.apk \
    vendor/cm/prebuilt/common/gapps/app/FaceLock.apk:system/app/FaceLock.apk \
    vendor/cm/prebuilt/common/gapps/app/GenieWidget.apk:system/app/GenieWidget.apk \
    vendor/cm/prebuilt/common/gapps/app/Gmail2.apk:system/app/Gmail2.apk \
    vendor/cm/prebuilt/common/gapps/app/GmsCore.apk:system/app/GmsCore.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleEars.apk:system/app/GoogleEars.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleLoginService.apk:system/app/GoogleLoginService.apk \
    vendor/cm/prebuilt/common/gapps/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    vendor/cm/prebuilt/common/gapps/app/GoogleTTS.apk:system/app/GoogleTTS.apk \
    vendor/cm/prebuilt/common/gapps/app/LatinImeDictionaryPack.apk:system/app/LatinImeDictionaryPack.apk \
    vendor/cm/prebuilt/common/gapps/app/MediaUploader.apk:system/app/MediaUploader.apk \
    vendor/cm/prebuilt/common/gapps/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    vendor/cm/prebuilt/common/gapps/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    vendor/cm/prebuilt/common/gapps/app/Phonesky.apk:system/app/Phonesky.apk \
    vendor/cm/prebuilt/common/gapps/app/QuickSearchBox.apk:system/app/QuickSearchBox.apk \
    vendor/cm/prebuilt/common/gapps/app/SetupWizard.apk:system/app/SetupWizard.apk \
    vendor/cm/prebuilt/common/gapps/app/Talk.apk:system/app/Talk.apk \
    vendor/cm/prebuilt/common/gapps/app/Talkback.apk:system/app/Talkback.apk \
    vendor/cm/prebuilt/common/gapps/app/VoiceSearchStub.apk:system/app/VoiceSearchStub.apk \
    vendor/cm/prebuilt/common/gapps/app/PicasaSyncAdapter.apk:system/app/PicasaSyncAdapter.apk \
    vendor/cm/prebuilt/common/gapps/app/YouTube.apk:system/app/YouTube.apk \
    vendor/cm/prebuilt/common/gapps/etc/g.prop:system/etc/g.prop \
    vendor/cm/prebuilt/common/gapps/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/cm/prebuilt/common/gapps/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    vendor/cm/prebuilt/common/gapps/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/cm/prebuilt/common/gapps/etc/permissions/features.xml:system/etc/permissions/features.xml \
    vendor/cm/prebuilt/common/gapps/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    vendor/cm/prebuilt/common/gapps/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/cm/prebuilt/common/gapps/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    vendor/cm/prebuilt/common/gapps/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    vendor/cm/prebuilt/common/gapps/lib/libfacelock_jni.so:system/lib/libfacelock_jni.so \
    vendor/cm/prebuilt/common/gapps/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \
    vendor/cm/prebuilt/common/gapps/lib/libfrsdk.so:system/lib/libfrsdk.so \
    vendor/cm/prebuilt/common/gapps/lib/libgcomm_jni.so:system/lib/libgcomm_jni.so \
    vendor/cm/prebuilt/common/gapps/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    vendor/cm/prebuilt/common/gapps/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \
    vendor/cm/prebuilt/common/gapps/lib/libgtalk_stabilize.so:system/lib/libgtalk_stabilize.so \
    vendor/cm/prebuilt/common/gapps/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/cm/prebuilt/common/gapps/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
    vendor/cm/prebuilt/common/gapps/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    vendor/cm/prebuilt/common/gapps/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/de-DE_gl0_sg.bin:system/tts/lang_pico/de-DE_gl0_sg.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/de-DE_ta.bin:system/tts/lang_pico/de-DE_ta.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/es-ES_ta.bin:system/tts/lang_pico/es-ES_ta.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/es-ES_zl0_sg.bin:system/tts/lang_pico/es-ES_zl0_sg.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/fr-FR_nk0_sg.bin:system/tts/lang_pico/fr-FR_nk0_sg.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/fr-FR_ta.bin:system/tts/lang_pico/fr-FR_ta.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/it-IT_cm0_sg.bin:system/tts/lang_pico/it-IT_cm0_sg.bin \
    vendor/cm/prebuilt/common/gapps/tts/lang_pico/it-IT_ta.bin:system/tts/lang_pico/it-IT_ta.bin \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/acoustic_model:system/usr/srec/en-US/acoustic_model \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/c_fst:system/usr/srec/en-US/c_fst \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/clg:system/usr/srec/en-US/clg \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/compile_grammar.config:system/usr/srec/en-US/compile_grammar.config \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/contacts.abnf:system/usr/srec/en-US/contacts.abnf \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/dict:system/usr/srec/en-US/dict \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/dictation.config:system/usr/srec/en-US/dictation.config \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/embed_phone_nn_model:system/usr/srec/en-US/embed_phone_nn_model \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/embed_phone_nn_state_sym:system/usr/srec/en-US/embed_phone_nn_state_sym \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/endpointer_dictation.config:system/usr/srec/en-US/endpointer_dictation.config \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/endpointer_voicesearch.config:system/usr/srec/en-US/endpointer_voicesearch.config \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/ep_acoustic_model:system/usr/srec/en-US/ep_acoustic_model \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/g2p_fst:system/usr/srec/en-US/g2p_fst \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/google_hotword_clg:system/usr/srec/en-US/google_hotword_clg \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/google_hotword.config:system/usr/srec/en-US/google_hotword.config \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/google_hotword_logistic:system/usr/srec/en-US/google_hotword_logistic \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/grammar.config:system/usr/srec/en-US/grammar.config \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/hmmsyms:system/usr/srec/en-US/hmmsyms \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/hotword_symbols:system/usr/srec/en-US/hotword_symbols \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/lintrans_model:system/usr/srec/en-US/lintrans_model \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/metadata:system/usr/srec/en-US/metadata \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/normalizer:system/usr/srec/en-US/normalizer \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/norm_fst:system/usr/srec/en-US/norm_fst \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/offensive_word_normalizer:system/usr/srec/en-US/offensive_word_normalizer \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/phonelist:system/usr/srec/en-US/phonelist \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/rescoring_lm:system/usr/srec/en-US/rescoring_lm \
    vendor/cm/prebuilt/common/gapps/usr/srec/en-US/symbols:system/usr/srec/en-US/symbols \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-2/full_model.bin \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-r0-ri30.4a-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-r0-ri30.4a-v24/full_model.bin \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rn30-ri30.5-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rn30-ri30.5-v24/full_model.bin \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rp30-ri30.5-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rp30-ri30.5-v24/full_model.bin \
    vendor/cm/prebuilt/common/gapps/vendor/pittpatt/models/recognition/face.face.y0-y0-22-b-N/full_model.bin:system/vendor/pittpatt/models/recognition/face.face.y0-y0-22-b-N/full_model.bin

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
