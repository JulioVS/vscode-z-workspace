//ESONRULJ JOB 1,NOTIFY=&SYSUID                                         JOB04145
//*
//*   VSAM [RRDS] CREATION AND LOAD JOB FOR SIGN-ON RULES FILE
//*
// EXPORT SYMLIST=(*)
// SET ENTITY='ESONRUL'
//*
//DEFINE  EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *,SYMBOLS=CNVTSYS
  DELETE &SYSUID..PSVS.&ENTITY.
  SET MAXCC=0
  DEFINE CLUSTER ( NAME ( &SYSUID..PSVS.&ENTITY. ) -
            VOLUME(VPWRKB) TRACKS(1,1) RECORDSIZE(10,10) -
            NUMBERED -
            CONTROLINTERVALSIZE(4096) )
/*
//REPRO   EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//I1        DD DISP=SHR,DSN=&SYSUID..DATA.&ENTITY.
//O1        DD DISP=SHR,DSN=&SYSUID..PSVS.&ENTITY.
//SYSIN     DD *,SYMBOLS=CNVTSYS
  REPRO INFILE(I1) OUTFILE(O1)
/*
//LISTPRT EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *,SYMBOLS=CNVTSYS
  LISTCAT ENTRIES( &SYSUID..PSVS.&ENTITY. )
  PRINT INDATASET( &SYSUID..PSVS.&ENTITY. )
/*
