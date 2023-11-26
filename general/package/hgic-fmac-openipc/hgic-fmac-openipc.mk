################################################################################
#
# hgic-fmac-openipc
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
HGIC_FMAC_OPENIPC_SITE_METHOD = git
HGIC_FMAC_OPENIPC_SITE = https://github.com/libc0607/hgic_ah_fmac
HGIC_FMAC_OPENIPC_VERSION = $(shell git ls-remote $(HGIC_FMAC_OPENIPC_SITE) HEAD | head -1 | cut -f1)
else
HGIC_FMAC_OPENIPC_SITE = https://github.com/libc0607/hgic_ah_fmac/archive
HGIC_FMAC_OPENIPC_SOURCE = main.tar.gz
endif

define HGIC_FMAC_OPENIPC_POSTEXTRACT_MAKEFILE
	rm $(@D)/Makefile
	cp $(@D)/Makefile.openipc $(@D)/Makefile
endef 
HGIC_FMAC_OPENIPC_POST_EXTRACT_HOOKS += HGIC_FMAC_OPENIPC_POSTEXTRACT_MAKEFILE

define HGIC_FMAC_OPENIPC_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc $(@D)/hgicf.conf
	$(INSTALL) -m 755 -d $(TARGET_DIR)/lib/firmware
	$(INSTALL) -m 644 -t $(TARGET_DIR)/lib/firmware $(@D)/hgicf_usb.bin
#	$(INSTALL) -m 644 -t $(TARGET_DIR)/lib/firmware $(@D)/hgicf_sdio.bin
endef

HGIC_FMAC_OPENIPC_LICENSE = GPL-2.0
HGIC_FMAC_OPENIPC_LICENSE_FILES = COPYING

$(eval $(kernel-module))
$(eval $(generic-package))
