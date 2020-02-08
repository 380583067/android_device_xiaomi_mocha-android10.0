# AptX

# Lineage genuine
PRODUCT_PROPERTY_OVERRIDES += \
    persist.lineage.nofool=true

# OMX
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Storage
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.sys.sdcardfs=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1

#By Pablito2020

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp
	
PRODUCT_PROPERTY_OVERRIDES += \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.usb.config=mtp,adb
