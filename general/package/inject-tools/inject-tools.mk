################################################################################
#
# inject-tools
#
################################################################################

define INJECT_TOOLS_EXTRACT_CMDS
	cp -av $(INJECT_TOOLS_PKGDIR)/src/* $(@D)/
endef

define INJECT_TOOLS_BUILD_CMDS
	(cd $(@D); $(TARGET_CC) -s tx_n_test.c -o tx_n_test)
endef

define INJECT_TOOLS_INSTALL_TARGET_CMDS
	install -m 0755 -D $(@D)/tx_n_test $(TARGET_DIR)/usr/bin/tx_n_test
endef

$(eval $(generic-package))
