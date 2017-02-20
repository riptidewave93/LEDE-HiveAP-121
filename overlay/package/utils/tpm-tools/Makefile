#
# Copyright (C) 2017 Chris Blake (chrisrblake93@gmail.com)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tpm-tools
PKG_VERSION:=1.3.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.sourceforge.net/project/trousers/$(PKG_NAME)/$(PKG_VERSION)
PKG_MD5SUM:=85a978c4e03fefd4b73cbeadde7c4d0b
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=CPL-1.0
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/tpm-tools
	SECTION:=utils
	CATEGORY:=Utilities
  DEPENDS+=+trousers +libopenssl
  TITLE:=TPM Management Tools
  URL:=http://trousers.sourceforge.net/man.html
endef

define Package/tpm-tools/description
	This program installs management tools for the TPM hardware
endef

TARGET_LDFLAGS += -lz -lpthread -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS+= \
  --prefix=/usr \
	--disable-pkcs11-support

SBIN_BINARIES:= \
	tpm_changeownerauth \
	tpm_clear \
	tpm_createek \
	tpm_getpubek \
	tpm_nvdefine \
	tpm_nvinfo \
	tpm_nvread \
	tpm_nvrelease \
	tpm_nvwrite \
	tpm_resetdalock \
	tpm_restrictpubek \
	tpm_restrictsrk \
	tpm_revokeek \
	tpm_selftest \
	tpm_setactive \
	tpm_setclearable \
	tpm_setenable \
	tpm_setoperatorauth \
	tpm_setownable \
	tpm_setpresence \
	tpm_takeownership \
	tpm_version

define Package/tpm-tools/install
	$(INSTALL_DIR) $(1)/usr/sbin
	for file in $(SBIN_BINARIES); do \
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tpm_mgmt/$$$$file \
		  $(1)/usr/sbin/$$$$file; \
	done
endef

$(eval $(call BuildPackage,tpm-tools))
