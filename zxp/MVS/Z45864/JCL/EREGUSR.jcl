//EREGUSRJ JOB 1,NOTIFY=&SYSUID                                         JOB04145
//*
//*   VSAM ÝKSDS¨ CREATION AND LOAD JOB FOR REGISTERED USERS FILE
//*
// EXPORT SYMLIST=(*)
// SET ENTITY='EREGUSR'
//*
//DEFINE  EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *,SYMBOLS=CNVTSYS
  DELETE &SYSUID..PSVS.&ENTITY.
  SET MAXCC=0
  DEFINE CLUSTER ( NAME ( &SYSUID..PSVS.&ENTITY. ) -
            VOLUME(VPWRKB) TRACKS(1) RECORDSIZE(100,100) -
            INDEXED KEYS(8 0) -
            REUSE SHAREOPTIONS(2) SPANNED SPEED -
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
