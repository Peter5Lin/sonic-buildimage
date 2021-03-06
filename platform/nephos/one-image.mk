# sonic nephos one image installer

SONIC_ONE_IMAGE = sonic-nephos.bin
$(SONIC_ONE_IMAGE)_MACHINE = nephos
$(SONIC_ONE_IMAGE)_IMAGE_TYPE = onie
$(SONIC_ONE_IMAGE)_INSTALLS += $(NEPHOS_MODULE)
$(SONIC_ONE_IMAGE)_INSTALLS += $(SYSTEMD_SONIC_GENERATOR)
$(SONIC_ONE_IMAGE)_LAZY_INSTALLS += $(INGRASYS_S9130_32X_PLATFORM_MODULE) \
                               $(INGRASYS_S9230_64X_PLATFORM_MODULE) \
                               $(ACCTON_AS7116_54X_PLATFORM_MODULE)  \
                               $(CIG_CS6436_56P_PLATFORM_MODULE) \
			       $(PEGATRON_PORSCHE_PLATFORM_MODULE) \
			       $(PEGATRON_FN_6254_DN_F_PLATFORM_MODULE)
ifeq ($(INSTALL_DEBUG_TOOLS),y)
$(SONIC_ONE_IMAGE)_DOCKERS += $(SONIC_INSTALL_DOCKER_DBG_IMAGES)
$(SONIC_ONE_IMAGE)_DOCKERS += $(filter-out $(patsubst %-$(DBG_IMAGE_MARK).gz,%.gz, $(SONIC_INSTALL_DOCKER_DBG_IMAGES)), $(SONIC_INSTALL_DOCKER_IMAGES))
else
$(SONIC_ONE_IMAGE)_DOCKERS = $(SONIC_INSTALL_DOCKER_IMAGES)
endif
SONIC_INSTALLERS += $(SONIC_ONE_IMAGE)
