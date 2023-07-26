601,100
602,"}APQ.Cub.ProcessExecutionLog.Export"
562,"VIEW"
586,"}APQ Process Execution Log"
585,"}APQ Process Execution Log"
564,"apliqo_reader"
565,"d@[gnYPj>pFlfYKqWBaxLh8aXj9Dx9RYqoXiRNt@[WDl`sP2\1D?P2SubM1_BmFC19ri<Y?MHbB4J90JcpimHi7D4=234zT?1XvA`a?YOB\`o7aIU;L63GIvrxSr>NE9WX@Z_ZK;R<EKyOxNhcfZGHtm_[9Yfm[<YK\R5q^d`Jzaa?qyLbXa6rjfFSY^4xq`A=4R<iYm"
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
From 	[Table];
567,","
588,"."
589,","
568,""""
570,}TI_Dummy_View
571,All
569,0
592,0
599,1000
560,7
pDoProcessLogging
pYear
pDayFrom
pDayTo
pProcess
pTitleRow
pDebug
561,7
2
2
2
2
2
2
2
590,7
pDoProcessLogging,"1"
pYear,""
pDayFrom,""
pDayTo,""
pProcess,""
pTitleRow,"1"
pDebug,"0"
637,7
pDoProcessLogging,"Record in process log"
pYear,"The year to export. Blank = ALL"
pDayFrom,"Day from. Enter as MMM-DD format. Blank = JAN-01"
pDayTo,"Dar to. Enter as MMM-DD format. Blank = DEC-31"
pProcess,"Process. Wildcard string to match against process names"
pTitleRow,"Include title row in export"
pDebug,"Write debug log?"
577,7
vYear
vDay
vMin
vSec
vProc
vMeas
Value
578,7
2
2
2
2
2
2
2
579,7
1
2
3
4
5
6
7
580,7
0
0
0
0
0
0
0
581,7
0
0
0
0
0
0
0
582,7
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,235
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

########################################################################################
### PURPOSE:
### 	Export process logging records from }APQ Process Execution Log to a text file.
### 	A data range filter can be given. The default is to export all dates
### 	A wildcard filter for process name can also be given to restrict the processes
### DATA SOURCE:
### 	}APQ Process Execution Log
### INTENDED USAGE:
### 	Export process logging data to external systems

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pYear:' | pYear |' & '| 'pDayFrom:' | pDayFrom |' & '| 'pDayTo:' | pDayTo |' & '| 'pProcess:' | pProcess |' & '| 'pTitleRow:' | pTitleRow |' & '| 'pDebug:' | pDebug;
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

######################
### Inits - declare constants

cCubSrc         = '}APQ Process Execution Log';
cDimYear        = '}APQ Time Year';
cDimDay         = '}APQ Time Day in Year';
cDimProc        = '}APQ Processes';
cDimMeas        = cCubSrc | ' Measure';

cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cServer         = CellGetS( cCubParam, 'TM1 Server Name', 'String' );
cLoggingLoc     = GetProcessErrorFileDirectory;
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| TimSt( Now(), '\Y\m\d\h\i\s' );
sDebugFile      = cDebugFile | '_Prolog.log';
cExportLoc      = CellGetS( cCubParam, 'Location: Export', 'String' );
cExportLoc      = cExportLoc | IF( SubSt( cExportLoc, Long( cExportLoc ), 1 ) @<> '\', '\', '' );
cExportFile     = cExportLoc | cCubSrc |'_Export_'| TimSt( Now(), '\Y\m\d\h\i\s' ) | '.txt';
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';
nDebug          = StringToNumber(pDebug);
DatasourceASCIIQuoteCharacter = '';

######################
### Initialise Debug

IF( pDebug @>= '1' );

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters:' );
  AsciiOutput( sDebugFile, 'pYear: ' | pYear );
  AsciiOutput( sDebugFile, 'pDayFrom: ' | pDayFrom );
  AsciiOutput( sDebugFile, 'pDayTo: ' | pDayTo );
  AsciiOutput( sDebugFile, 'pProcess: ' | pProcess );
  AsciiOutput( sDebugFile, 'pDayTitleRow: ' |  pTitleRow );
  AsciiOutput( sDebugFile, '' );

EndIF;

######################
### Test parameters

IF( pYear @<> '' );
  IF( DimIx( cDimYear, pYear ) = 0 );
    nErr = nErr + 1;
    IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
    sErr = 'Invalid year:' | pYear;
  EndIF;
EndIF;

IF( pDayFrom @<>  '' );
  IF( DimIx( cDimDay, pDayFrom ) = 0 );
    nErr = nErr + 1;
    IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
    sErr = 'Invalid day:' | pDayFrom;
  EndIF;
Else;
  pDayFrom = 'JAN-01';
EndIF;

IF( pDayTo @<>  '' );
  IF( DimIx( cDimDay, pDayTo ) = 0 );
    nErr = nErr + 1;
    IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
    sErr = 'Invalid day:' | pDayTo;
  EndIF;
Else;
  pDayTo = 'DEC-31';
EndIF;

IF( pDayFrom @= 'Last Day' % pDayFrom @= 'Current Day' % pDayFrom @= 'Next Day' );
  pDayFrom = ElComp( cDimDay, pDayFrom, 1 );
EndIF;
IF( pDayTo @= 'Last Day' % pDayTo @= 'Current Day' % pDayTo @= 'Next Day' );
  pDayTo = ElComp( cDimDay, pDayTo, 1 );
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Validation tests failed with messages: ' | sErr );
  EndIF;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Create the view to assign as data source for the process

sProc = '}bedrock.cube.view.create';
sFilter = cDimMeas | sDelimEleStart | 'nProcessStartTime';
IF( pYear @<> '' );
    sFilter = sFilter | sDelimDim | cDimYear | sDelimEleStart | pYear;
EndIF;
bSuppressNull = 1;
bSuppressC = 1;
bSuppressRule = 1;

IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Creating Datasource View with filter: ' | sFilter );
EndIF;

ExecuteProcess( sProc, 'pLogOutput', nDebug,
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1
);

### Modify source view if needed for date range and process name

IF( pDayFrom @= 'JAN-01' & pDayTo @= 'DEC-31' );
  # nothing all days are selected so no need to add date to view
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Date range is UNFILTERED.' );
  EndIF;
Else;
  sProc = '}bedrock.hier.sub.create.bymdx';
  sMDX = '{[' | cDimDay | '].[Leaves].[' | pDayFrom | ']:[' | cDimDay | '].[Leaves].[' | pDayTo | ']}';
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Filtering dim }APQ Day in Year with MDX: '  | sMDX );
  EndIF;
  # avoid different level issues due to relative time by using leaves
  ExecuteProcess( sProc, 'pLogOutput', nDebug, 
	'pDim', cDimDay|':Leaves', 'pSub', cSubSrc, 'pMDXExpr', sMDX, 
	'pConvertToStatic', 1, 'pTemp', 1
  );
  SubsetCreate( cDimDay, cSubSrc, 1 );
  # copy elements from leaves subset to default hier subset
  nMax = HierarchySubsetGetSize( cDimDay, 'Leaves', cSubSrc );
  nCtr = 1;
  While( nCtr <= nMax );
      sEle = HierarchySubsetGetElementName( cDimDay, 'Leaves', cSubSrc, nCtr );
      SubsetElementInsert( cDimDay, cSubSrc, sEle, nCtr );
      nCtr = nCtr + 1;
  End;
  ViewSubsetAssign( cCubSrc, cViewSrc, cDimDay, cSubSrc );
EndIF;

IF( pProcess @= '' );
  # nothing all processes are selected so no need to add to view
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Process names are UNFILTERED.' );
  EndIF;
Else;
  sProc = '}bedrock.hier.sub.create.bymdx';
  sMDX = '{TM1FILTERBYPATTERN( {TM1SUBSETALL( [' | cDimProc | '] )}, "*' | pProcess | '*")}';
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Filtering dim }APQ Day in Year with MDX: '  | sMDX );
  EndIF;
  ExecuteProcess( sProc,
	'pLogOutput', nDebug, 
	'pDim', cDimProc,
	'pSub', cSubSrc,
	'pMDXExpr', sMDX,
	'pConvertToStatic', 1,
	'pTemp', 1
  );
  ViewSubsetAssign( cCubSrc, cViewSrc, cDimProc, cSubSrc );
EndIF;

######################
### Assign data source

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Assigning View as process Datasource: ' | cViewSrc );
EndIF;

DataSourceType          = 'VIEW';
DataSourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

######################
### END Prolog
573,6

#****Begin: Generated Statements***
#****End: Generated Statements****



574,66
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

######################
### Logging - common script

nDataRecordCount = nDataRecordCount + 1;

sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

### Write title record

IF( pTitleRow @= '1' & nDataRecordCount = 1 );
  IF( pDebug @>= '1' );
    sDebugFile = cDebugFile | '_Data.log';
    AsciiOutput( sDebugFile, 'Writing title record.' );
  EndIF;
  ASCIIOutput( cExportFile, 'Server', 'Process', 'Run By', 'Start Time', 'End Time', 'Metadata Records', 'Data Records', 'Minor Error Count', 'Process Exit Code', 'Parameters', 'Error Log' );
EndIF;

### Skips

IF( vDay @= 'D000' % vMin @= 'Total Day Entry' % vSec @= 'Last Entry' );
  ItemSkip;
EndIF;

### Get variables to write out

sRunBy = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sRunBy' );
sStart = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sProcessStartTime' );
sEnd = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sProcessFinishTime' );
sMetaRecords = NumberToString( CellGetN( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'nMetaDataRecordCount' ) );
sDataRecords = NumberToString( CellGetN( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'nDataRecordCount' ) );
sMinorErrors = NumberToString( CellGetN( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'nTotalMinorErrorCount' ) );
sExitCode = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sProcessReturnCode' );
sParams = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sParams' );
sErrLog = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sProcessErrorLogFile' );
IF( sErrLog @<> '' );
  sErrLog = cLoggingLoc | sErrLog;
EndIF;
IF( sExitCode @= 'ProcessExitByQuit' & sEnd @= '' );
  sEnd = sStart;
EndIF;

### Write out

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Writing log for:', vYear, vDay, vMin, vProc );
EndIF;

ASCIIOutput( cExportFile, cServer, vProc,sRunBy, sStart, sEnd, sMetaRecords, sDataRecords, sMinorErrors, sExitCode, sParams, sErrLog );

######################
### END Data
575,30
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

######################
### Epilog script

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
1217,0
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
