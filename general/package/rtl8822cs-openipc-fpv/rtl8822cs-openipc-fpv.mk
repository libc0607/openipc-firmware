################################################################################
#
# rtl8822cs-openipc-fpv
#
################################################################################

RTL8822CS_OPENIPC_FPV_SITE_METHOD = git
RTL8822CS_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8822cs-20240221
RTL8822CS_OPENIPC_FPV_VERSION = $(shell git ls-remote $(RTL8822CS_OPENIPC_FPV_SITE) HEAD | head -1 | cut -f1)

RTL8822CS_OPENIPC_FPV_LICENSE = GPL-2.0
RTL8822CS_OPENIPC_FPV_LICENSE_FILES = COPYING


define RTL8822CS_OPENIPC_FPV_PLATFORM_INGENIC
	$(SED) "s:CONFIG_PLATFORM_I386_PC = y:CONFIG_PLATFORM_I386_PC = n:" \
		$(@D)/Makefile
	$(SED) "s:CONFIG_PLATFORM_INGENIC = n:CONFIG_PLATFORM_INGENIC = y:" \
		$(@D)/Makefile
endef

ifeq ($(OPENIPC_SOC_FAMILY),t31)
RTL8822CS_OPENIPC_FPV_POST_PATCH_HOOKS += RTL8822CS_OPENIPC_FPV_PLATFORM_INGENIC
endif

RTL8822CS_OPENIPC_FPV_MODULE_MAKE_OPTS = CONFIG_RTL8822CS=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
