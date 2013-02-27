# Check for target product
ifeq (jellybam_n7100,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_n7100

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/jellybam/overlay/aokp/device/common

# include JELLYBAM common configuration
include vendor/jellybam/config/jellybam_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/n7100/cm.mk)

PRODUCT_NAME := jellybam_n7100

# JELLYBAM bootanimation
PRODUCT_COPY_FILES += \
    vendor/jellybam/prebuilt/common/bootanimation/hdpi.zip:system/media/bootanimation.zip

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/jellybam/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/jellybam/tools/addprojects.py $(PRODUCT_NAME))

endif

