#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/permissions/com.google.android.media.effects.xml
etc/permissions/features.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/resolv.conf
etc/sysctl.conf
framework/com.google.widevine.software.drm.jar
framework/com.google.android.media.effects.jar
framework/com.google.android.maps.jar
vendor/etc/audio_effects.conf
app/Vending.apk
app/LatinImeDictionaryPack.apk
app/NetworkLocation.apk
app/GoogleFeedback.apk
app/Gmail.apk
app/GoogleBackupTransport.apk
app/OneTimeInitializer.apk
app/MediaUploader.apk
app/GoogleContactsSyncAdapter.apk
app/SetupWizard.apk
app/SpareParts.apk
app/GoogleCalendarSyncAdapter.apk
app/GooglePartnerSetup.apk
app/ChromeBookmarksSyncAdapter.apk
app/GoogleLoginService.apk
app/VisualizationWallpapers.apk
app/DSPManager.apk
app/GoogleServicesFramework.apk
app/YouTube.apk
app/GmsCore.apk
app/Music.apk
app/Hangouts.apk
lib/libgtalk_stabilize.so
lib/libgtalk_jni.so
lib/libvideochat_jni.so
lib/libspeexwrapper.so
lib/libvorbisencoder.so
lib/libfrsdk.so
lib/libjni_latinimegoogle.so
lib/soundfx/libcyanogen-dsp.so
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
