#
# Copyright (C) 2017 Chris Blake (chrisrblake93@gmail.com)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=trousers
PKG_VERSION:=0.3.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=ad508f97b406f6e48cd90e85d78e7ca8
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/trousers
	SECTION:=utils
	CATEGORY:=Utilities
  DEPENDS+=+zlib +libopenssl
  TITLE:=TrouSerS Trusted Computing software stack
  URL:=http://trousers.sourceforge.net/
endef

define Package/trousers/description
	This program installs the TrouSerS Trusted Computing Software Stack
endef

TARGET_LDFLAGS += -lz -lpthread -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

CONFIGURE_ARGS+= \
  --prefix=/usr \
	--disable-usercheck

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/trousers/
	$(CP) $(PKG_BUILD_DIR)/src/include/trousers/* $(1)/usr/include/trousers

	$(INSTALL_DIR) $(1)/usr/include/tss/
	$(CP) $(PKG_BUILD_DIR)/src/include/tss/* $(1)/usr/include/tss

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/src/tddl/libtddl.a $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/tspi/.libs/libtspi.so* $(1)/usr/lib
endef

define Package/trousers/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tcsd.init $(1)/etc/init.d/tcsd

	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/dist/tcsd.conf $(1)/etc

	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tcsd/tcsd $(1)/usr/sbin

	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/src/tddl/libtddl.a $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/tspi/.libs/libtspi.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,trousers))
