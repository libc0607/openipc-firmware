################################################################################
#
# rtl8852bu-openipc
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
RTL8852BU_OPENIPC_SITE_METHOD = git
RTL8852BU_OPENIPC_SITE = https://github.com/morrownr/rtl8852bu
RTL8852BU_OPENIPC_VERSION = $(shell git ls-remote $(RTL8852BU_OPENIPC_SITE) HEAD | head -1 | cut -f1)
else
RTL8852BU_OPENIPC_SITE = https://github.com/morrownr/rtl8852bu/archive
RTL8852BU_OPENIPC_SOURCE = master.tar.gz
endif

RTL8852BU_OPENIPC_LICENSE = GPL-2.0
RTL8852BU_OPENIPC_LICENSE_FILES = COPYING

RTL8852BU_OPENIPC_MODULE_MAKE_OPTS = CONFIG_RTL8852BU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
