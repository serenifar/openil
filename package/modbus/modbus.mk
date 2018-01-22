################################################################################
#
# A modbus simulator
#
################################################################################

MODBUS_VERSION = master
MODBUS_SITE = https://github.com/serenifar/modbus-codes.git
MODBUS_SITE_METHOD = git

MODBUS_MAKE_OPTS = \
	CC="$(TARGET_CC)" \

define MODBUS_BUILD_CMDS
	cd $(@D)/ && $(MAKE) clean 
	$(TARGET_MAKE_ENV) $(MAKE) $(MODBUS_MAKE_OPTS) -C $(@D) 
endef

define MODBUS_INSTALL_TARGET_CMDS
	cp -dpfr $(@D)/mbtcp_mstr $(TARGET_DIR)/usr/sbin/
endef

$(eval $(generic-package))
