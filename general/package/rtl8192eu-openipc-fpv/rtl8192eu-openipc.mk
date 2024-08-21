################################################################################
#
# rtl8192eu-openipc-fpv
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
RTL8192EU_OPENIPC_FPV_SITE_METHOD = git
RTL8192EU_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8192eu-20220929
RTL8192EU_OPENIPC_FPV_VERSION = $(shell git ls-remote $(RTL8192EU_OPENIPC_FPV_SITE) HEAD | head -1 | cut -f1)
else
RTL8192EU_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8192eu-20220929/archive
RTL8192EU_OPENIPC_FPV_SOURCE = master.tar.gz
endif

RTL8192EU_OPENIPC_FPV_LICENSE = GPL-2.0
RTL8192EU_OPENIPC_FPV_LICENSE_FILES = COPYING

RTL8192EU_OPENIPC_FPV_MODULE_MAKE_OPTS = CONFIG_RTL8192EU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
