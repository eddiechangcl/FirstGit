601,100
602,"}APQ.Cub.UserLastActive.Update.1.ReadUsrConLog"
562,"CHARACTERDELIMITED"
586,"C:\TM1Models\Apliqode_Dev\Log\usrcon.log"
585,"C:\TM1Models\Apliqode_Dev\Log\usrcon.log"
564,
565,"hbcg:Cu7yqkm=9bKYLCm90:?6QIb3PzsBkrWCibw\fRaf?f?t1[:`hr6XwDQxt}`N29rG]wi=xVZi5Sxq9GcdV\8zZwW4zK4jC;0mZHZ[tmsE^k9v2u0G10FT_GKyiNAvr>1H@Eh2A\Co1ms:p7}UpcaifiNb5?8Na9c3hO:DS[:q1QTiYUjCiZ86Jiub_Xr6Tb[taD"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,"|"
588,"."
589,"'"
568,""""
570,
571,
569,0
592,0
599,1000
560,2
pSourceFile
pDoProcessLogging
561,2
2
2
590,2
pSourceFile,""
pDoProcessLogging,"1"
637,2
pSourceFile,"usrcon.log file"
pDoProcessLogging,"enter in process log"
577,1
vLogLine
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
603,0
572,106
###################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

# This process processes a specific usrcon.log file in the server logging directory and loads the date stamp when a user last logged in or logged out of the server

# NOTE: requires the change to the tm1s-log.properties file prescribed in the root framework template CFG directory
## Additional Login/Logout Loggers
#log4j.appender.USR=org.apache.log4j.SharedMemoryAppender
#log4j.appender.USR.File=usrcon.log
#log4j.appender.USR.MaxFileSize=5 MB
#log4j.appender.USR.MaxBackupIndex=10
#log4j.appender.USR.TimeZone=Local
#log4j.logger.TM1.Login=DEBUG, USR

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pSourceFile:' | pSourceFile;
### Params
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################

### Constants ###

cProcess    = sThisProcName;
pCube       = '}APQ User Last Active';
cCube       = pCube;
cCubTgt     = pCube;
cDim        = '}Clients';
pDim        = '}APQ Clients';
cDimTgt     = pDim;
cMeasure    = 'Last Login';
cMeasure2   = cMeasure | ' Ordinal';

### Initialise variables ###

nTotRecords = 0;
nCPropRecords = 0;

### Validate Parameters ###

nErrors     = 0;

# If no source file exists then abort
IF( FileExists(pSourceFile) = 0 );
  nErrors = nErrors + 1;
  sMessage = 'Invalid source file:' | pSourceFile;
  ItemReject( sMessage );
EndIF;

# If no cube name specified then abort
IF( CubeExists(pCube) = 0 );
  nErrors = nErrors + 1;
  sMessage = 'Invalid cube!';
  ItemReject( sMessage );
EndIF;

# If no dim name specified then abort
IF( DimensionExists(pDim) = 0 );
  nErrors = nErrors + 1;
  sMessage = 'Invalid dimension!';
  ItemReject( sMessage );
EndIF;

IF( DimIx( '}ElementAttributes_' | pDim, 'LAST_ACTIVE' ) = 0 ); AttrInsert( pDim, '', 'LAST_ACTIVE', 'S' ); EndIF;

IF( nErrors <> 0 );
  ProcessBreak;
EndIF;

### Set Data Source ###

pTitleRows = 0;
pDelimiter = '%';
pQuote = '';

DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = pSourceFile;
DatasourceASCIIHeaderRecords = pTitleRows;
DatasourceASCIIDelimiter = pDelimiter;
DatasourceASCIIQuoteCharacter = pQuote;

### End Prolog ###

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,134
###################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

nTotRecords = nTotRecords + 1;

# Convert log line to fields
# delimiter in logfile is 3 consecutive spaces
vDelimiter = '   ';

# Variables
nNextCol = 1;
vBlock = vLogLine;
vCol = '';
vCol1 = '';
vCol2 = '';
vCol3 = '';
vCol4 = '';
vCol5 = '';
vCol6 = '';

# fields
vThreadID = '';
vTransID = '';
vLogLevel = '';
vDateTime = '';
vLogger = '';
vMsg = '';

# logging variables
vLogObject = '';
vLogUser = '';
vLogTime = '';
vRunFrom = '';
vError = NumberToString(0);
vErrorFile = '';
vNote = '';

# Loop through columns 
While( nNextCol <> 0 );

   # check where next block begins
   nNextCol = SCAN(vDelimiter, vBlock );
   IF( nNextCol <> 0 );
      vCol = TRIM(SUBST( vBlock,1, nNextCol ));
      vBlock = DELET( vBlock, 1, nNextCol );
   Else;
      vCol = vBlock;
   EndIF;

   IF( vCol1 @= '');
      vCol1 = vCol; 
   ElseIF( vCol2 @= '');
      vCol2 = vCol;
   ElseIF( vCol3 @= ''); 
      vCol3 = vCol;
   ElseIF( vCol4 @= ''); 
      vCol4 = vCol;
   ElseIF( vCol5 @= ''); 
      vCol5 = vCol;
   ElseIF( vCol6 @= ''); 
      vCol6 = vCol;
   Else;
   EndIF;
	
End;

# set values for fields
IF( vCol1 @<> ''); vThreadID = TRIM(vCol1); EndIf;
IF( vCol3 @<> ''); vLogLevel = TRIM(vCol3); EndIf;
IF( vCol4 @<> ''); vDateTime = TRIM(vCol4); EndIf;
IF( vCol5 @<> ''); vLogger = TRIM(vCol5); EndIf;
IF( vCol6 @<> ''); vMsg = TRIM(vCol6); EndIf;

# Skip all records in transaction log which are not for TM1.Login logger
IF( vLogger @<> 'TM1.Login' );
   ItemSkip;
EndIF;

IF( Scan( 'Login', vMsg ) = 1 % Scan( 'Logout', vMsg ) = 1 );
   # OK
Else;
   ItemSkip;
EndIF;

vUser = Trim( SubSt( vMsg, Scan( 'User', vMsg ) + 5, Long( vMsg ) ) );

# Skip if client no longer exists
IF( DimIx( cDim, vUser ) = 0 );
   ItemSkip;
EndIF;
IF( DimIx( pDim, vUser ) = 0 );
   ItemSkip;
EndIF;

# Else update user properties cube
# Format timestamp string is YYYY-MM-DD HH:MM:SS.nnn format to DD.MM.YYYY HH:MM
sTimeStamp = SubSt(vDateTime, 9, 2) |'.'| SubSt(vDateTime, 6, 2) |'.'| SubSt(vDateTime, 1, 4) |' '| SubSt(vDateTime, 12, 5);
sTimeStampOrd = SubSt(vDateTime, 1, 4) | SubSt(vDateTime, 6, 2) | SubSt(vDateTime, 9, 2) | SubSt(vDateTime, 12, 2) | SubSt(vDateTime, 15, 2) | SubSt(vDateTime, 18, 2);

# Test the current ordinal value
sCurrentLast = CellGetS( cCube, vUser, cMeasure2 );

# If the time stamp is after the current value then update
IF( sCurrentLast @= '' % sTimeStampOrd @> sCurrentLast );

   CellPutS( sTimeStamp, cCube, vUser, cMeasure );
   CellPutS( sTimeStampOrd, cCube, vUser, cMeasure2 );

   # update user LAST_ACTIVE attribute
   AttrPutS( vDateTime, cDimTgt, vUser, 'LAST_ACTIVE' );

EndIF;

### End Data ###

575,27
###################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While( nCountTime <= nTotalLogTime );    sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
  CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' ); CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
  CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' ); CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
  CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' ); CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
  CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );  nCountTime = nCountTime + 1; End;
  IF( nDataRecordCount > 0 ); IF( cCubTgt @<> '' ); CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' ); EndIF; EndIF;
EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### END Epilog
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,1
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
