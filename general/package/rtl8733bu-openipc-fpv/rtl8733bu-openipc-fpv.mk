################################################################################
#
# rtl8733bu-openipc-fpv
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
RTL8733BU_OPENIPC_FPV_SITE_METHOD = git
RTL8733BU_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8733bu-20230626
RTL8733BU_OPENIPC_FPV_VERSION = $(shell git ls-remote $(RTL8733BU_OPENIPC_FPV_SITE) HEAD | head -1 | cut -f1)
else
RTL8733BU_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8733bu-20230626/archive
RTL8733BU_OPENIPC_FPV_SOURCE = master.tar.gz
endif

RTL8733BU_OPENIPC_FPV_LICENSE = GPL-2.0
RTL8733BU_OPENIPC_FPV_LICENSE_FILES = COPYING

RTL8733BU_OPENIPC_FPV_MODULE_MAKE_OPTS = CONFIG_RTL8733BU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
