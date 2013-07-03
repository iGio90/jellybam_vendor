# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=ModernBam.wav \
  ro.config.notification_sound=Jellybam.ogg \
  ro.config.alarm_alert=Cesium.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/pa/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/pa/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# Installer
PRODUCT_COPY_FILES += \
    vendor/jellybam/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/jellybam/prebuilt/common/etc/persist.conf:system/etc/persist.conf

#Embed superuser into settings 
SUPERUSER_EMBEDDED := true

# T-Mobile theme engine
include vendor/pa/config/themes_common.mk

# JELLYBAM THINGS
PRODUCT_COPY_FILES += \
    vendor/jellybam/prebuilt/common/bootanimation/sound.ogg:system/media/sound.ogg \
    vendor/jellybam/prebuilt/common/media/audio/ringtones/ClassicBam.mp3:system/media/audio/ringtones/ClassicBam.mp3 \
    vendor/jellybam/prebuilt/common/media/audio/ringtones/ModernBam.wav:system/media/audio/ringtones/ModernBam.wav \
    vendor/jellybam/prebuilt/common/media/audio/notifications/Jellybam.ogg:system/media/audio/notifications/Jellybam.ogg \
    vendor/jellybam/prebuilt/common/etc/bamlog.txt:system/etc/bamlog.txt \
    vendor/jellybam/prebuilt/common/etc/permissions/com.sonyericsson.audioeffectif.xml:system/etc/permissions/com.sonyericsson.audioeffectif.xml \
    vendor/jellybam/prebuilt/common/etc/permissions/touchwiz.xml:system/etc/permissions/touchwiz.xml \
    vendor/jellybam/prebuilt/common/etc/permissions/vtmanager_library.xml:system/etc/permissions/vtmanager_library.xml \
    vendor/jellybam/prebuilt/common/xml/twframework.jar:system/framework/twframework.jar \
    vendor/jellybam/prebuilt/common/xml/twframework-res.apk:system/framework/twframework-res.apk \
    vendor/jellybam/prebuilt/common/libs/libglcanvas.so:system/lib/libglcanvas.so \
    vendor/jellybam/prebuilt/common/libs/libdrawglfunction.so:system/lib/libdrawglfunction.so \
    vendor/jellybam/prebuilt/common/libs/libdhwr.so:system/lib/libdhwr.so \
    vendor/jellybam/prebuilt/common/libs/libswiqibmpcnv.so:system/lib/libswiqibmpcnv.so \
    vendor/jellybam/prebuilt/common/libs/libxloudwrapper.so:system/lib/soundfx/libxloudwrapper.so \
    vendor/jellybam/prebuilt/common/xml/update_me.xml:system/update_me.xml \
    vendor/jellybam/prebuilt/common/etc/be_movie:system/etc/be_movie \
    vendor/jellybam/prebuilt/common/etc/be_photo:system/etc/be_photo \
    vendor/jellybam/prebuilt/common/xml/features.xml:system/etc/permissions/features.xml \
    vendor/jellybam/prebuilt/common/xml/com.sonyericsson.audioeffectif.xml:system/etc/permissions/com.sonyericsson.audioeffectif.xml \
    vendor/jellybam/prebuilt/common/xml/com.sonyericsson.android.SwIqiBmp.xml:system/etc/permissions/com.sonyericsson.android.SwIqiBmp.xml \
    vendor/jellybam/prebuilt/common/xml/twframework.jar:system/framework/twframework.jar \
    vendor/jellybam/prebuilt/common/xml/twframework-res.apk:system/framework/twframework-res.apk \
    vendor/jellybam/prebuilt/common/xml/semc_audioeffectif.jar:system/framework/semc_audioeffectif.jar \
    vendor/jellybam/prebuilt/common/xml/com.sonyericsson.android.SwIqiBmp.jar:system/framework/com.sonyericsson.android.SwIqiBmp.jar \
    vendor/jellybam/prebuilt/common/gapps/addon.d/80-gapps.sh:system/addon.d/70-gapps.sh \
    vendor/jellybam/prebuilt/common/gapps/addon.d/71-gapps-faceunlock.sh:system/addon.d/71-gapps-faceunlock.sh \
    vendor/jellybam/prebuilt/common/gapps/etc/audio_effects.conf:system/etc/audio_effects.conf \
    vendor/jellybam/prebuilt/common/gapps/etc/g.prop:system/etc/g.prop \
    vendor/jellybam/prebuilt/common/gapps/etc/resolv.conf:system/etc/resolv.conf \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/features.xml:system/etc/permissions/features.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    vendor/jellybam/prebuilt/common/gapps/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/jellybam/prebuilt/common/gapps/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    vendor/jellybam/prebuilt/common/gapps/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    vendor/jellybam/prebuilt/common/gapps/lib/libcyanogen-dsp.so:system/lib/libcyanogen-dsp.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libfacelock_jni.so:system/lib/libfacelock_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libfrsdk.so:system/lib/libfrsdk.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgcomm_jni.so:system/lib/libgcomm_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgtalk_stabilize.so:system/lib/libgtalk_stabilize.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libvideochat_jni.so:system/lib/libvideochat_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/de-DE_gl0_sg.bin:system/tts/lang_pico/de-DE_gl0_sg.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/de-DE_ta.bin:system/tts/lang_pico/de-DE_ta.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/es-ES_ta.bin:system/tts/lang_pico/es-ES_ta.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/es-ES_zl0_sg.bin:system/tts/lang_pico/es-ES_zl0_sg.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/fr-FR_nk0_sg.bin:system/tts/lang_pico/fr-FR_nk0_sg.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/fr-FR_ta.bin:system/tts/lang_pico/fr-FR_ta.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/it-IT_cm0_sg.bin:system/tts/lang_pico/it-IT_cm0_sg.bin \
    vendor/jellybam/prebuilt/common/gapps/tts/lang_pico/it-IT_ta.bin:system/tts/lang_pico/it-IT_ta.bin \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/acoustic_model:system/usr/srec/en-US/acoustic_model \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/c_fst:system/usr/srec/en-US/c_fst \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/clg:system/usr/srec/en-US/clg \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/compile_grammar.config:system/usr/srec/en-US/compile_grammar.config \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/contacts.abnf:system/usr/srec/en-US/contacts.abnf \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/dict:system/usr/srec/en-US/dict \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/dictation.config:system/usr/srec/en-US/dictation.config \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/embed_phone_nn_model:system/usr/srec/en-US/embed_phone_nn_model \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/embed_phone_nn_state_sym:system/usr/srec/en-US/embed_phone_nn_state_sym \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/endpointer_dictation.config:system/usr/srec/en-US/endpointer_dictation.config \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/endpointer_voicesearch.config:system/usr/srec/en-US/endpointer_voicesearch.config \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/ep_acoustic_model:system/usr/srec/en-US/ep_acoustic_model \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/g2p_fst:system/usr/srec/en-US/g2p_fst \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/google_hotword_clg:system/usr/srec/en-US/google_hotword_clg \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/google_hotword.config:system/usr/srec/en-US/google_hotword.config \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/google_hotword_logistic:system/usr/srec/en-US/google_hotword_logistic \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/grammar.config:system/usr/srec/en-US/grammar.config \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/hmmsyms:system/usr/srec/en-US/hmmsyms \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/hotword_symbols:system/usr/srec/en-US/hotword_symbols \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/lintrans_model:system/usr/srec/en-US/lintrans_model \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/metadata:system/usr/srec/en-US/metadata \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/normalizer:system/usr/srec/en-US/normalizer \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/norm_fst:system/usr/srec/en-US/norm_fst \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/offensive_word_normalizer:system/usr/srec/en-US/offensive_word_normalizer \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/phonelist:system/usr/srec/en-US/phonelist \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/rescoring_lm:system/usr/srec/en-US/rescoring_lm \
    vendor/jellybam/prebuilt/common/gapps/usr/srec/en-US/symbols:system/usr/srec/en-US/symbols \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-2/full_model.bin \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-r0-ri30.4a-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-r0-ri30.4a-v24/full_model.bin \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rn30-ri30.5-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rn30-ri30.5-v24/full_model.bin \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rp30-ri30.5-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rp30-ri30.5-v24/full_model.bin \
    vendor/jellybam/prebuilt/common/gapps/vendor/pittpatt/models/recognition/face.face.y0-y0-22-b-N/full_model.bin:system/vendor/pittpatt/models/recognition/face.face.y0-y0-22-b-N/full_model.bin

### AOKP ###
# AOKP Packages
PRODUCT_PACKAGES += \
    PerformanceControl \
    PermissionsManager

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

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/jellybam/overlay/aokp/common

### PARANOID ###
# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

# ParanoidAndroid Proprietary
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk \
    vendor/jellybam/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/jellybam/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

BOARD := $(subst jellybam_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

# Add PA release version
PA_VERSION_MAJOR = 3
PA_VERSION_MINOR = 6
PA_VERSION_MAINTENANCE = 0
PA_PREF_REVISION = 1
VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := pa_$(BOARD)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

# JELLYBAM version
BAM_VERSION_MAJOR = 8
BAM_VERSION_MINOR = 3
BAM_VERSION_MAINTENANCE = 0
BAM_VERSION := $(BAM_VERSION_MAJOR).$(BAM_VERSION_MINOR).$(BAM_VERSION_MAINTENANCE)

TARGET_CUSTOM_RELEASETOOL := vendor/jellybam/tools/squisher

# goo.im properties
ifneq ($(DEVELOPER_VERSION),true)
    PRODUCT_PROPERTY_OVERRIDES += \
      ro.goo.developerid=JellyBam \
      ro.goo.rom=JellyBam \
      ro.goo.version=$(BAM_VERSION) \
      ro.goo.product.device=$(BOARD)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.jellybam.version=$(BAM_VERSION) \
    ro.bamrom.version=jellybam-v$(BAM_VERSION)_$(BOARD) \
    ro.modversion=$(PA_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.papref.revision=$(PA_PREF_REVISION) \
    ro.aokp.version=$(BOARD)_jb-mr1_build-6 \
    ro.romstats.url=http://www.bam-android.com/stats/ \
    ro.romstats.name=jellybam
    ro.romstats.version=$(BAM_VERSION) \
    ro.romstats.tframe=7 \
    ro_otaplatform.changelog_url=https://raw.github.com/iGio90/jellybam_vendor/bam6/prebuilt/common/etc/bamlog.txt \
    ro_otaplatform.gapps_url=http://goo.im/devs/paranoidandroid/roms/gapps \
    ro_otaplatform.gapps_version=ro.addon.pa_version \
    ro_otaplatform.backup_files=/system/etc/paranoid/properties.conf
