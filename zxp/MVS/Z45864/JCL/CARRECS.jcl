//CARRECSJ   JOB CM1,NOTIFY=&SYSUID
//*
//* CICS BMS MAP ASSEMBLY JOB
//*
//SETLIB  JCLLIB ORDER=DFH620.CICS.SDFHPROC           IBM CICS PROCLIB
//*
//MAPSTEP   EXEC DFHMAPS,                             IBM MAP COMPILER
//            INDEX=DFH620.CICS,                      IBM CICS HLQ+MLQ
//            MAPLIB=&SYSUID..CICS.PROD.DFHLOAD,      MY CICS LOADLIB
//            DSCTLIB=&SYSUID..COPYLIB,               MY COPYBOOK LIB
//            MAPNAME=CARRECS                         MY SYMBOLIC NAME
//COPY.SYSUT1 DD DSN=&SYSUID..MAPS(CARRECS),          MY MAP SOURCE
//            DISP=SHR
//
