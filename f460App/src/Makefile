TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = f460
# f460.dbd will be created and installed
DBD += f460.dbd

# f460.dbd will be made up from these files:
f460_DBD += base.dbd

# Include dbd files from all support applications:
f460_DBD += asyn.dbd
f460_DBD += stream.dbd
f460_DBD += drvAsynIPPort.dbd
f460_DBD += drvAsynSerialPort.dbd
f460_DBD += calcSupport.dbd
f460_DBD += asSupport.dbd
f460_DBD += calcoutRecord.dbd
f460_DBD += system.dbd

# Add all the support libraries needed by this IOC
f460_LIBS += calc sscan stream asyn autosave

# f460_registerRecordDeviceDriver.cpp derives from f460.dbd
f460_SRCS += f460_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
f460_SRCS_DEFAULT += f460Main.cpp
f460_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#f460_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
f460_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

