#!../../bin/linux-x86/f460

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/f460.dbd")
f460_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("STREAM_PROTOCOL_PATH", "${TOP}/f460App/Db")
epicsEnvSet("Sys", "E1:")
epicsEnvSet("Dev", "F460:")
epicsEnvSet("PORT", "E1")

drvAsynIPPortConfigure("$(PORT)", "10.0.0.11:4001")

#drvAsynSerialPortConfigure("$(PORT)", "/dev/ttyS0")
#asynOctetSetInputEos("$(PORT)",0,"\r\n")
#asynOctetSetOutputEos("$(PORT)",0,"\r\n")
#asynSetOption("$(PORT)", 0, "baud", "115200")
#asynSetOption("$(PORT)", 0, "bits", "8")
#asynSetOption("$(PORT)", 0, "parity", "none")
#asynSetOption("$(PORT)", 0, "stop", "1")
#asynSetOption("$(PORT)", 0, "clocal", "Y")
#asynSetOption("$(PORT)", 0, "crtscts", "N")
#asynSetTraceMask("$(PORT)",0,"0x9")
#asynSetTraceIOMask("$(PORT)",0,"0x2")

## Load records
dbLoadRecords("db/F460.db", "Sys=$(Sys),Dev=$(Dev),PORT=$(PORT),PINI=YES,BUFSZ=12,PREC=9")
dbLoadRecords("db/asyn.db", "Sys=$(Sys),Dev=$(Dev),PORT=$(PORT),ADDR=0")

cd ${TOP}/iocBoot/${IOC}/
< autosave.cmd

iocInit()
dbl > ${TOP}/opi/pvs.pvlist

create_monitor_set("info_settings.req", 30)
create_monitor_set("info_positions.req", 15)
#var streamDebug 1
