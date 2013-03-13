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

#Embed superuser into settings 
SUPERUSER_EMBEDDED := true

# T-Mobile theme engine
include vendor/pa/config/themes_common.mk

# JELLYBAM THINGS
PRODUCT_COPY_FILES += \
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
    vendor/jellybam/prebuilt/common/gapps/addon.d/70-gapps.sh:system/addon.d/70-gapps.sh \
    vendor/jellybam/prebuilt/common/gapps/addon.d/71-gapps-faceunlock.sh:system/addon.d/71-gapps-faceunlock.sh \
    vendor/jellybam/prebuilt/common/gapps/etc/g.prop:system/etc/g.prop \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/permissions/features.xml:system/etc/permissions/features.xml \
    vendor/jellybam/prebuilt/common/gapps/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    vendor/jellybam/prebuilt/common/gapps/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    vendor/jellybam/prebuilt/common/gapps/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    vendor/jellybam/prebuilt/common/gapps/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    vendor/jellybam/prebuilt/common/gapps/lib/libfacelock_jni.so:system/lib/libfacelock_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libfrsdk.so:system/lib/libfrsdk.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgcomm_jni.so:system/lib/libgcomm_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libgtalk_stabilize.so:system/lib/libgtalk_stabilize.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
    vendor/jellybam/prebuilt/common/gapps/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
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
    ROMControl

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
PA_VERSION_MINOR = 1
PA_VERSION_MAINTENANCE = 0
PA_PREF_REVISION = 1
VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := pa_$(BOARD)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

# JELLYBAM version
BAM_VERSION_MAJOR = 6
BAM_VERSION_MINOR = 8
BAM_VERSION_MAINTENANCE = 0
BAM_VERSION := $(BAM_VERSION_MAJOR).$(BAM_VERSION_MINOR).$(BAM_VERSION_MAINTENANCE)

# JELLYBAM release
BAM_RELEASE = STABLE

TARGET_CUSTOM_RELEASETOOL := vendor/jellybam/tools/squisher

PRODUCT_PROPERTY_OVERRIDES += \
    ro.jellybam.version=$(BAM_VERSION) \
    ro.bamrom.version=jellybam-v$(BAM_VERSION)_$(BOARD)-$(BAM_RELEASE) \
    ro.modversion=$(PA_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.papref.revision=$(PA_PREF_REVISION) \
    ro.aokp.version=$(BOARD)_jb-mr1_build-4
