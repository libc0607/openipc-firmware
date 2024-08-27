################################################################################
#
# rtl8188fu-openipc-fpv
#
################################################################################

ifeq ($(LOCAL_DOWNLOAD),y)
RTL8188FU_OPENIPC_FPV_SITE_METHOD = git
RTL8188FU_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8188fu-20230217
RTL8188FU_OPENIPC_FPV_VERSION = $(shell git ls-remote $(RTL8188FU_OPENIPC_FPV_SITE) HEAD | head -1 | cut -f1)
else
RTL8188FU_OPENIPC_FPV_SITE = https://github.com/libc0607/rtl8188fu-20230217/archive
RTL8188FU_OPENIPC_FPV_SOURCE = master.tar.gz
endif

RTL8188FU_OPENIPC_FPV_LICENSE = GPL-2.0
RTL8188FU_OPENIPC_FPV_LICENSE_FILES = COPYING

RTL8188FU_OPENIPC_FPV_MODULE_MAKE_OPTS = CONFIG_RTL8188FU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
