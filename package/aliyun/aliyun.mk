################################################################################
#
# Aliyun iot gateway sdk for arm-linux platforms
#
################################################################################

ALIYUN_VERSION = master
ALIYUN_SITE = https://github.com/IoT-devel/aliyun-iotkit-embedded.git
ALIYUN_SITE_METHOD = git
ALIYUN_LICENSE = Apache-2.0
ALIYUN_LICENSE_FILES = LICENSE

ALIYUN_MAKE_OPTS = \
	OVERRIDE_CC="$(TARGET_CC)" \
	OVERRIDE_AR="$(TARGET_AR)" \

define ALIYUN_BUILD_CMDS
	cd $(@D)/ && $(MAKE) distclean 
	$(TARGET_MAKE_ENV) $(MAKE) $(ALIYUN_MAKE_OPTS) -C $(@D) 
endef

define ALIYUN_INSTALL_TARGET_CMDS
	cp -dpfr $(@D)/output/release/bin/* $(TARGET_DIR)/usr/sbin/
	cp -dpfr $(@D)/exec/* $(TARGET_DIR)/usr/sbin/
endef

$(eval $(generic-package))
