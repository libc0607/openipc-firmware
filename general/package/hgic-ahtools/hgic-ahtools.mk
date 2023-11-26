################################################################################
#
# hgic-ahtools
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
HGIC_AHTOOLS_SITE_METHOD = git
HGIC_AHTOOLS_SITE = https://github.com/libc0607/hgic_ah_fmac
HGIC_AHTOOLS_VERSION = $(shell git ls-remote $(HGIC_AHTOOLS_SITE) HEAD | head -1 | cut -f1)
else
HGIC_AHTOOLS_SITE = https://github.com/libc0607/hgic_ah_fmac/archive
HGIC_AHTOOLS_SOURCE = main.tar.gz
endif

HGIC_AHTOOLS_MAKE_OPTS = \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CXX)"
	
define HGIC_AHTOOLS_BUILD_CMDS
	$(MAKE) $(HGIC_AHTOOLS_MAKE_OPTS) -C $(@D)/tools/test_app all
endef

define HGIC_AHTOOLS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/tools/test_app/bin/hgota $(TARGET_DIR)/usr/bin/hgota
	$(INSTALL) -m 0755 -D $(@D)/tools/test_app/bin/libnetat $(TARGET_DIR)/usr/bin/libnetat
	$(INSTALL) -m 0755 -D $(@D)/tools/test_app/bin/hgpriv $(TARGET_DIR)/usr/bin/hgpriv
	$(INSTALL) -m 0755 -D $(@D)/tools/test_app/bin/hgicf $(TARGET_DIR)/usr/bin/hgicf
endef

$(eval $(generic-package))
