601,100
602,"}APQ.Server.Backup"
562,"NULL"
586,
585,
564,
565,"x;N8kV6xqP\Vq`JTS\G6S@b<ybI^>HkQ1nTjthojfcbas37`IlWfbc1qDGz7i64b?DKI[_DuC`HYWs7lo3=^jIs3lI]:OYsQTP>?]Bnsf01P?yA18TSsmfqrwJEgdZZdGQz86v2_wIb<F7]wzJ5MimNFJfsa1@yTSe1m]>@kN9X4IqWr4Gt5$[wwOBY:^SZ8oc9lMqA"
559,0
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,2
Select	*
From 	[].[];
567,","
588,"."
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,11
pDoProcessLogging
pDebug
pDoSaveData
pExclude
pFramework
pFull
pWeekly
pMonthly
pPurgeDayDays
pPurgeWkDays
pPurgeMthDays
561,11
2
2
2
2
2
2
2
2
2
2
2
590,11
pDoProcessLogging,"1"
pDebug,"0"
pDoSaveData,"1"
pExclude,"-x!*.blb -x!*.feeders -x!*.cma -x!*.csv -x!*.log -x!*.txt -x!*.feeders$ -x!*.cub$ -x!*.dim$ -x!*.log$ -x!*.sub$ -x!}Subsets_*.dim -x!}Hierarchies_*.dim -x!}Views_*.dim"
pFramework,"0"
pFull,"0"
pWeekly,"0"
pMonthly,"1"
pPurgeDayDays,"30"
pPurgeWkDays,"70"
pPurgeMthDays,"182"
637,11
pDoProcessLogging,"Record in process log"
pDebug,"Debug log"
pDoSaveData,"Save data first"
pExclude,"File type exclusion list"
pFramework,"Backup the APQ Framework directory rather than the main data directory"
pFull,"1 to do a full folders backup except Backup folder"
pWeekly,"Copy over latest weekly backup"
pMonthly,"Copy over latest monthly backup"
pPurgeDayDays,"Delete daily backups older than X days"
pPurgeWkDays,"Delete weekly backups older than X days"
pPurgeMthDays,"Delete monthly backups older than X days"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,280
##############################################################################################################################
#Region Header
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################################
#Region @DOC
# Description:
#  Process to create a back up of the application (after a save data if entered in the parameter)
#    
# Scheduled processing:
# * at least once a day - before midnight server time
#
# Note:
# * This process has a dependency on **7-zip** which must be available on the server in order for the backup process to work
#EndRegion @DOC
##############################################################################################################################

##############################################################################################################################
#Region Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDebug:%pDebug% & pDoSaveData:%pDoSaveData% & pExclude:%pExclude% & pFramework:%pFramework% & pFull:%pFull% & pWeekly:%pWeekly% & pMonthly:%pMonthly% pPurgeDayDays:%pPurgeDayDays% & pPurgeWkDays:%pPurgeWkDays% & pPurgeMthDays:%pPurgeMthDays%' );
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
#EndRegion Logging
##############################################################################################################################
#EndRegion Header
##############################################################################################################################
### Prolog script

### Inits - declare constants

cCubInfo        = '}APQ Settings';
# data dir needs to be passed relative to script location

sBkUpDir        = CellGetS( cCubInfo, 'Location: Backup', 'String' );
sExec           = CellGetS( cCubInfo, 'Location: 7Zip', 'String' );
cInstance       = CellGetS( cCubInfo, 'TM1 Server Name', 'String' );

While( Scan( ' ', cInstance ) > 0 );
   # forfiles can't accept space even enclosed in quotes so ensure file name has underscore not quote even if instance name contains spaces
   cInstance = Trim( SubSt( cInstance, 1, Scan( ' ', cInstance ) - 1 ) | '_' | SubSt( cInstance, Scan( ' ', cInstance ) + 1, Long( cInstance ) - Scan( ' ', cInstance ) ) );
End;
If( pFramework @= '1' );
   cInstance    = 'APQ.' | cInstance;
EndIf;

sWeek           = TIMST( NOW(), '\Y' ) |'W'| Trim( Str( INT( ( Now() - DayNo( TIMST( Now(), '\Y') | '-01-01' ) + 3 ) / 7 ), 2, 0 ) );
sFileNameWk     = cInstance | '_WkBk_' | sWeek | '.7z';
sFileNameMth    = cInstance | '_MthBk_' | TIMST(NOW(), '\Y\m', 1) | '.7z';
sFileNameWkPt   = cInstance | '_WkBk*';
sFileNameMthPt  = cInstance | '_MthBk*';

nPurgeDayDays   = Round( Numbr( pPurgeDayDays ) ); pPurgeDayDays = NumberToString( nPurgeDayDays );
nPurgeWkDays    = Round( Numbr( pPurgeWkDays ) ); pPurgeWkDays = NumberToString( nPurgeWkDays );
nPurgeMthDays   = Round( Numbr( pPurgeMthDays ) ); pPurgeMthDays = NumberToString( nPurgeMthDays );

nWait           = IF( pWeekly @= '1' % pMonthly @= '1', 1, 0 );
nErr            = 0;
sErr            = '';

### Debug

sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugLoc       = CellGetS( cCubInfo, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.txt';
nDebug          = StringToNumber( pDebug );

IF( pDebug @>= '1' );
   DatasourceASCIIQuoteCharacter = '';
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
   AsciiOutput( sDebugFile, '' );
EndIF;

### Test parameters

nErr = IF( CellGetN( cCubInfo, 'Customer Name', 'Numeric' ) + CellGetN( cCubInfo, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF ( pFull @= '0' );
   If( pFramework @= '1' );
      sDataDir = CellGetS( cCubInfo, 'Location: Framework', 'String' );
   Else;
      sDataDir = CellGetS( cCubInfo, 'Location: Data Dir', 'String' );
   EndIf;
   sFileName = cInstance | '_data_' | TIMST(NOW(), '\Y\m\d_\h\i', 1) | '.7z';
ELSEIF( pFull @= '1' );
   sDataDir = CellGetS( cCubInfo, 'Location: Instance', 'String' );
   sFileName = cInstance | '_Full_' | TIMST(NOW(), '\Y\m\d_\h\i', 1) | '.7z';
ELSE;
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Wrong value parameter for pFull.';
ENDIF;
sDataDir = IF( SubSt( sDataDir, Long( sDataDir ), 1 ) @= '\', Subst ( sDataDir, 1, Long( sDataDir ) -1 ), sDataDir );
sFileNameDayPt = SubSt( sFileName, 1, Long( sFileName ) - 17 ) | '*';

IF( FileExists( sDataDir ) = 0 );
  nErr = nErr + 1;
  sErr = 'Invalid data dir.';
EndIF;

sBkUpDirTgt = IF( SubSt( sBkUpDir, Long(sBkUpDir), 1 ) @<> '\', sBkUpDir | '\', sBkUpDir );
IF( FileExists( sBkUpDirTgt ) = 0 );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Invalid backup dir.';
EndIF;

IF( FileExists( sExec ) = 0 );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | '7Zip executable not found.';
EndIF;

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

### Do Backup

IF( pDoSaveData @= '1' );
  sProc = '}bedrock.server.savedataall';
  IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, 'Executing ' | sProc );
  EndIF;
  ExecuteProcess( sProc );
  IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, 'SaveDataAll finished ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
       AsciiOutput( sDebugFile, '' );
  EndIF;
EndIF;

# Speed compression high - quality compression : low
#sArgs = ' a -tzip ';
# Speed compression low - quality compression : high
sArgs = ' a ';

# Backup for Data folder only
IF ( pFull @= '0' );

   sCommand = '"' | sExec | '"' | sArgs | '"' | sBkUpDirTgt | sFileName | '" "' | sDataDir | '\*" -r ' | pExclude;

# Backup for Full folder except Backup & Logging Dir
ELSEIF( pFull @= '1' );

   # name of the backup folder to exclude it from the full backup
   sBackupFolderName = IF( SubSt( sBkUpDirTgt, Long(sBkUpDirTgt), 1 ) @= '\', Subst ( sBkUpDirTgt, 1, Long( sBkUpDirTgt ) -1 ), sBkUpDirTgt);
   nFind = 1;
   While ( nFind <> 0 );
      nLongFullPathBackup = Long ( sBackupFolderName );
      nFind = Scan ( '\', sBackupFolderName );
      IF ( nFind <> 0 );
         sBackupFolderName = Subst ( sBackupFolderName, nFind + 1, nLongFullPathBackup - nFind );
      EndIf;
   End;
   sBackupFolderName = sBackupFolderName | '\';

   # name of the log folder to exclude it from the full backup
   sLogFolderName = SubSt( GetProcessErrorFileDirectory, 1, Long( GetProcessErrorFileDirectory ) - 1 );
   nFind = 1;
   While ( nFind <> 0 );
      nLongFullPathBackup = Long ( sLogFolderName );
      nFind = Scan ( '\', sLogFolderName );
      IF ( nFind <> 0 );
         sLogFolderName = Subst ( sLogFolderName, nFind + 1, nLongFullPathBackup - nFind );
      EndIf;
   End;
   sLogFolderName = sLogFolderName | '\';

   sCommand = '"' | sExec | '"' | sArgs | '"' | sBkUpDirTgt | sFileName | '" "' | sDataDir | '" -r ' | pExclude | ' -xr!*'| sBackupFolderName | '* -xr!*'| sLogFolderName | '*';

ENDIF;

# Execute the command
IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sCommand );
EndIF;
IF( pDebug @<= '1' );
   ExecuteCommand ( sCommand, nWait );
EndIF;
IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Initial directory archive finished ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
   AsciiOutput( sDebugFile, '' );
EndIF;

### Copy Daily Backup to Weekly & Monthly

IF( pWeekly @= '1' );
   sCommand = 'cmd /c copy /y /b ' | '"' | sBkUpDirTgt | sFileName | '" "' | sBkUpDirTgt | sFileNameWk | '"';
   IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, sCommand );
   EndIF;
   IF( pDebug @<= '1' );
      ExecuteCommand ( sCommand, 0 );
   EndIF;
EndIF;

IF( pMonthly @= '1' );
   sCommand = 'cmd /c copy /y /b ' | '"' | sBkUpDirTgt | sFileName | '" "' | sBkUpDirTgt | sFileNameMth | '"';
   IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, sCommand );
   EndIF;
   IF( pDebug @<= '1' );
      ExecuteCommand ( sCommand, 0 );
   EndIF;
EndIF;

### Purge Backups

## Remove trailing slash\ from directory names if present
IF( SubSt( sBkUpDirTgt, Long( sBkUpDirTgt ), 1 ) @= '\' );
  sBkUpDirTgt = SubSt( sBkUpDirTgt, 1, Long( sBkUpDirTgt ) - 1 );
EndIF;

IF( nPurgeDayDays > 0 );
   sCommand = 'cmd /c forfiles -p "'| sBkUpDirTgt |'" -s -m ' | sFileNameDayPt | ' -d -' | pPurgeDayDays | ' -c "cmd /c del @path"';
   IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, sCommand );
   EndIF;
   IF( pDebug @<= '1' );
      ExecuteCommand ( sCommand, 0 );
   EndIF;
EndIF;

IF( nPurgeWkDays > 0 );
   sCommand = 'cmd /c forfiles -p "'| sBkUpDirTgt |'" -s -m ' | sFileNameWkPt | ' -d -' | pPurgeWkDays | ' -c "cmd /c del @path"';
   IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, sCommand );
   EndIF;
   IF( pDebug @<= '1' );
      ExecuteCommand ( sCommand, 0 );
   EndIF;
EndIF;

IF( nPurgeMthDays > 0 );
   sCommand = 'cmd /c forfiles -p "'| sBkUpDirTgt |'" -s -m ' | sFileNameMthPt | ' -d -' | pPurgeMthDays | ' -c "cmd /c del @path"';
   IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, sCommand );
   EndIF;
   IF( pDebug @<= '1' );
      ExecuteCommand ( sCommand, 0 );
   EndIF;
EndIF;

### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, '' );
   AsciiOutput( sDebugFile, 'Backup, Copy & Purge process finished ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
EndIF;


### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,27
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################################
#Region Logging
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
#EndRegion Logging
##############################################################################################################################
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
