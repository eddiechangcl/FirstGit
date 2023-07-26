601,100
602,"}APQ.Server.Restart"
562,"NULL"
586,
585,
564,
565,"emIYPaAbCagtsoPC;y7K4AzIenqu9TcpDL;tArQE>;vE@bfrE[11i`Qg^eFy7;Lqr\0\Pky<eFewN?8zK>hxMQVT:Nu9W^OsG23i[=Oi3tL0Au8ukrj3`O3bJnr[bmZjbUl`O5<Rj_Y[apz5uIjSz0U<XPP0aq3ZUMJS]gIhb1hUJ;ufm9J>qoaX3sfWzYoBHGTB@g3L"
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
567,","
588,"."
589,","
568,""""
570,
571,
569,0
592,0
599,1000
560,6
pDoProcessLogging
pDebug
pDoSaveData
pDeletePersistentFeeders
pServerName
pWait
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1"
pDebug,"0"
pDoSaveData,"1"
pDeletePersistentFeeders,"0"
pServerName,""
pWait,"300"
637,6
pDoProcessLogging,"Optional: Record in process log"
pDebug,"Optional: Debug log"
pDoSaveData,"Optional: Save data first. Default=1"
pDeletePersistentFeeders,"Optional: Delete persistent feeders (Force feeders recalculation - Increase server start-up time!). Default=0"
pServerName,"Optional: TM1 windows service name (Blank = read value from }APQ Settings)"
pWait,"Optional: Wating time between calling net stop and net start commands (in seconds). If blank default=300."
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,142
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
#  Process to restart the TM1 server
#    
# Scheduled processing:
# * every weekend
#
# Warning:
# * If scheduled as part of a chore then this process **must be the last process in the chore**
#EndRegion @DOC
##############################################################################################################################

##############################################################################################################################
#Region Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDebug:%pDebug% & pDoSaveData:%pDoSaveData% & pDeletePersistentFeeders:%pDeletePersistentFeeders% & pServerName:%pServerName% & pWait:pWait' );
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
cBatchDir       = CellGetS( cCubInfo, 'Location: Scripts', 'String' );
cBatchDir       = cBatchDir | IF( SubSt( cBatchDir, Long( cBatchDir ), 1 ) @<> '\', '\', '' );
cServiceName    = CellGetS( cCubInfo, 'Windows Service Name', 'String' );

cBatCmd     = cBatchDir | sThisProcName | '.bat';
nErr        = 0;
sErr        = '';

sServiceName = cServiceName;
If( Trim(pServerName) @<> '');
  sServiceName = Trim(pServerName);
EndIf;

DatasourceASCIIQuoteCharacter='';

### Debug

sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugLoc       = CellGetS( cCubInfo, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.txt';
nDebug          = StringToNumber( pDebug );
pWait           = If( pWait @= '', '300', pWait );
pDoSaveData     = If( pDoSaveData @<> '0', '1', '0' ); 
pDeletePersistentFeeders = If( pDeletePersistentFeeders @<> '1', '0', '1' ); 

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
   AsciiOutput( sDebugFile, '' );
EndIF;

### Test parameters

nErr = IF( CellGetN( cCubInfo, 'Customer Name', 'Numeric' ) + CellGetN( cCubInfo, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( FileExists( cBatchDir ) = 0 );
  nErr = nErr + 1;
  sErr = 'Invalid batch dir.';
EndIF;

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

### Delete persistent feeders
### USE WITH CARE: force feeders recalculations and significantly increase the server start-up time!

IF (pDeletePersistentFeeders @= '1');
  DeleteAllPersistentFeeders;
EndIF;

### Save data

IF( pDoSaveData @= '1' );
  sProc = '}bedrock.server.savedataall';
  IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, 'Executing ' | sProc );
  EndIF;
  ExecuteProcess( sProc, 'pLogOutput', nDebug );
  IF( pDebug @>= '1' );
       AsciiOutput( sDebugFile, 'SaveDataAll finished ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
       AsciiOutput( sDebugFile, '' );
  EndIF;
EndIF;

# Create bath file
AsciiOutput(cBatCmd, 'net stop %1 > nul');
AsciiOutput(cBatCmd, 'timeout %2 > nul');
AsciiOutput(cBatCmd, 'net start %1 > nul');

# Create command
sCommand = '"' | cBatCmd | '" "' | sServiceName | '" ' | pWait;

### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, '' );
   AsciiOutput( sDebugFile, 'Command: ' | sCommand );
   AsciiOutput( sDebugFile, 'Pre-processing finished ' | TimSt( Now, '\Y\m\d \h:\i:\s' ) );
EndIF;


### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,28
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

##############################################################################################################
#Region - Finalize Logging
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime=Now();sProcessErrorLogFile=GetProcessErrorFileName;sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessFinishTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessFinishTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessCompletedFlag');
  CellPutN(nMetaDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataRecordCount');CellPutN(nDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataRecordCount');
  CellPutN(PrologMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nPrologMinorErrorCount');CellPutN(MetadataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataMinorErrorCount');
  CellPutN(DataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataMinorErrorCount');CellPutN(ProcessReturnCode,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessReturnCode');
  CellPutS(sProcessErrorLogFile,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sProcessErrorLogFile');nCountTime=nCountTime+1;End;
  If(nDataRecordCount>0);If(cCubTgt@<>'');CellPutN(nProcessFinishTime,sCubLogCube,cCubTgt,'nLastTimeUpdate');CellPutS(sThisProcName,sCubLogCube,cCubTgt,'sProcess');CellPutS(sProcessRunBy,sCubLogCube,cCubTgt,'sProcessRunBy');EndIf;EndIf;
EndIF;
#EndRegion - Finalize Logging
##############################################################################################################
ExecuteCommand( sCommand, 0 );
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
