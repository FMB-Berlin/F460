#Makefile at top of application tree
TOP = .
include $(TOP)/configure/CONFIG
DIRS := $(DIRS) $(filter-out $(DIRS), configure)

# If StreamDevice is here, build it too
SD_DIR := $(firstword $(wildcard StreamDevice))
ifneq (,$(SD_DIR))
	DIRS := $(DIRS) StreamDevice
endif

DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *App))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard iocBoot))

define DIR_template
 $(1)_DEPEND_DIRS = configure
endef
$(foreach dir, $(filter-out configure,$(DIRS)),$(eval $(call DIR_template,$(dir))))

iocBoot_DEPEND_DIRS += $(filter %App,$(DIRS))

include $(TOP)/configure/RULES_TOP

