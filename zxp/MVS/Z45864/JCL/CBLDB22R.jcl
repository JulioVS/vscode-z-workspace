//CBLDB22R JOB 1,NOTIFY=&SYSUID,REGION=0M
//********************************************************************
//*        RUN                                                       *
//********************************************************************
//RUN     EXEC PGM=IKJEFT01
//STEPLIB  DD DSN=DSND10.SDSNLOAD,DISP=SHR
//REPORT   DD SYSOUT=*
//RECIN    DD *
LINCOLN
//SYSTSIN  DD *,SYMBOLS=CNVTSYS
 DSN SYSTEM(DBDG)
 RUN PROGRAM(CBLDB22) PLAN(&SYSUID) LIB('&SYSUID..LOAD')
 END
//SYSIN    DD DUMMY
//SYSUDUMP DD DUMMY
//CEEDUMP  DD DUMMY
//SYSTSPRT DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
/*
