ifeq (jellybam_i9100,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/jellybam_i9100.mk
endif
ifeq (jellybam_i9100g,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/jellybam_i9100g.mk
endif
ifeq (jellybam_i9300,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/jellybam_i9300.mk
endif
ifeq (jellybam_maguro,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/jellybam_maguro.mk
endif
ifeq (jellybam_n7000,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/jellybam_n7000.mk
endif
ifeq (jellybam_n7100,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/jellybam_n7100.mk
endif
