//CBLDB23C JOB 1,NOTIFY=&SYSUID
//COMPILE  EXEC DB2CBL,MBR=CBLDB23
//BIND.SYSTSIN  DD *,SYMBOLS=CNVTSYS
 DSN SYSTEM(DBDG)
 BIND PLAN(&SYSUID) PKLIST(&SYSUID..CBLDB23) MEMBER(CBLDB23) -
      ACT(REP) ISO(CS) ENCODING(EBCDIC)
