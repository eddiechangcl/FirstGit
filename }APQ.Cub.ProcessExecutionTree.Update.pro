601,100
602,"}APQ.Cub.ProcessExecutionTree.Update"
562,"VIEW"
586,"}APQ Process Execution Log"
585,"}APQ Process Execution Log"
564,
565,"kx]ZQcJ7i^4y=SuVK>Oz`ohoPjK`99Y}I??oBw;]\CdyVA4y65]zBsofDwCQ6G{0@fdWrG[<Et1c5=I;<fNgM;K0beFo[2n`nt5;]WG\K]=CgsfN4G7o73mx8lk5lCDWJjJ{ZsUD5_f2U4IjSE7=bSwY@e72DHO]AO4:mJih>[ZXa^eyo[SNQIjv06=X9eQsE;?YS6C"
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
570,}TI_Dummy_View
571,
569,0
592,0
599,1000
560,4
pClear
pDateFrom
pDateTo
pProcess
561,4
2
2
2
2
590,4
pClear,"0"
pDateFrom,""
pDateTo,""
pProcess,""
637,4
pClear,"Clear the existing process execution tree before the new load? It will clear all the historic outside of the scope of date to extract"
pDateFrom,"Date to process from. If blank yesterday"
pDateTo,"Date to process to. If blank today"
pProcess,"Process. Wildcard string to match against process names"
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
1
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
VarType=33ColType=827
603,0
572,221
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
### 	Process a set of process execution log records within a given date filter
### 	A unique N element will be created for each process execution and 3 alternate rollup paths created by process, by Runtime and by User 
### 	Note: this is not the standard approach for process logging as it inserts metadata and so by nature creates a server wide lock
###	Warning: For a busy server and large date filter range the dimension could become very large
### DATA SOURCE:
### 	}APQ Process Execution Log cube
### INTENDED USAGE:
### 	provide an alternate method of analysing process executions leveraging a hierarchy structure
########################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
pDoProcessLogging = '1';
sProcLogParams = 'pClear:' | pClear |' & '| 'pDateFrom:' | pDateFrom |' & '| 'pDateTo:' | pDateTo;
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
cCubTgt         = '}APQ Process Execution Tree';
cDimTgt         = cCubTgt;
cDimDate        = '}APQ Time Date Lookup';
cDimYear        = '}APQ Time Year';
cDimDay         = '}APQ Time Day in Year';
cDimMin         = '}APQ Time Minute';
cDimSec         = '}APQ Time Second';
cDimProc        = '}APQ Processes';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );

cDimMeas        = cCubSrc | ' Measure';
cSrcMeas        = 'Process Started Flag';
cTop            = 'Process Rollups';
cByProc         = 'Execution by Process';
cByDate         = 'Execution by Runtime';
cByUser         = 'Execution by User';

nErr            = 0;
sErr            = '';

######################
### Test parameters

IF( pDateFrom @= '' );
  pDateFrom = TimSt( Now() - 1, '\Y-\m-\d' );
EndIF;
IF( pDateTo @= '' );
  pDateTo   = TimSt( Now(), '\Y-\m-\d' );
EndIF;

IF( DimIx( cDimDate, pDateFrom ) = 0 );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = 'Invalid from date:' | pDateFrom;
Else;
  pDateFrom = DimensionElementPrincipalName( cDimDate, pDateFrom );
EndIF;

IF( DimIx( cDimDate, pDateTo ) = 0 );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = 'Invalid to date:' | pDateTo;
Else;
  pDateTo = DimensionElementPrincipalName( cDimDate, pDateTo );
EndIF;

IF( pDateTo @< pDateFrom );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = 'Date To cannot be less than date from.';
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### switch transaction logging off 

CellPutS( 'NO', '}CubeProperties', cCubTgt, 'LOGGING' );

######################
### Empty the target dimension

IF( pClear @>= '1' );
  DimensionDeleteAllElements( cDimTgt );
  DimensionElementInsert( cDimTgt, '', cTop, 'C' );
  DimensionElementInsert( cDimTgt, '', cByProc, 'C' );
  DimensionElementInsert( cDimTgt, '', cByDate, 'C' );
  DimensionElementInsert( cDimTgt, '', cByUser, 'C' );
  DimensionElementComponentAdd( cDimTgt, cTop, cByProc, 0 );
  DimensionElementComponentAdd( cDimTgt, cTop, cByDate, 0 );
  DimensionElementComponentAdd( cDimTgt, cTop, cByUser, 0 );
EndIF;

DimensionSortOrder( cDimTgt, 'ByName', 'Ascending', 'ByHierarchy', '' );

######################
### Handle the date range covering multiple years

IF( SubSt( pDateTo, 1, 4 ) @> SubSt( pDateFrom, 1, 4 ) );
  sDateFrom = NumberToString( StringToNumber( SubSt( pDateFrom, 1, 4 ) ) + 1 ) | '-01-01';
  sDateTo   = SubSt( pDateFrom, 1, 4 ) | '-12-31';
Else;
  sDateFrom = '';
  sDateTo   = pDateTo;
EndIF;

sYear       = SubSt( pDateFrom, 1, 4 );
sDayFrom    = SubSt( pDateFrom, 6, 5 );
sDayTo      = SubSt( sDateTo, 6, 5 );
sDayElFrom  = DimensionElementPrincipalName( cDimDay, sDayFrom );
sDayElTo    = DimensionElementPrincipalName( cDimDay, sDayTo );

######################
### Build the source view

sProc           = '}bedrock.cube.view.create';
sFilter         = cDimMeas | sDelimEleStart | cSrcMeas;
sFilter         = sFilter | sDelimDim | cDimYear | sDelimEleStart | sYear;
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 1;
ExecuteProcess( sProc, 'pLogOutput', 0, 
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1
);

### Modify source view if needed for date range and process name
IF( sDayElFrom @= 'D001' & sDayElTo @= 'D366' );
  # nothing all days are selected so no need to add date to view
Else;
  sProc = '}bedrock.hier.sub.create.bymdx';
  # use leaves to avoid element at different level issue from relative time
  sMDX  = '{[' | cDimDay | '].[Leaves].[' | sDayFrom | ']:[' | cDimDay | '].[Leaves].[' | sDayTo | ']}';
  ExecuteProcess( sProc, 'pLogOutput', 0, 
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
Else;
  sProc = '}bedrock.hier.sub.create.bymdx';
  sMDX  = '{TM1FILTERBYPATTERN( {TM1SUBSETALL( [' | cDimProc | '] )}, "*' | pProcess | '*")}';
  ExecuteProcess( sProc, 'pLogOutput', 0, 
	'pDim', cDimProc, 'pSub', cSubSrc, 'pMDXExpr', sMDX,
	'pConvertToStatic', 1, 'pTemp', 1 
  );
  ViewSubsetAssign( cCubSrc, cViewSrc, cDimProc, cSubSrc );
EndIF;

######################
### Assign data source

DataSourceType          = 'VIEW';
DataSourceNameForServer = cCubSrc;
DataSourceCubeView      = cViewSrc;


######################
### END Prolog
573,82
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

IF( pDoProcessLogging @= '1' );
  nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

######################
### Metadata script

# Skips
IF( vDay @= 'D000' ); ItemSkip; EndIF;
IF( vMin @= 'Total Day Entry' ); ItemSkip; EndIF;
IF( vSec @= 'Last Entry' ); ItemSkip; EndIF;

# Get process run ID
sRunIndex = NumberToString( CellGetN( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'nProcessExecutionIndex' ) );

# Get user
sUser = CellGetS( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'sRunBy' );

# Convert day to date
sDay = AttrS( cDimDay, vDay, 'MM-DD' );

# Build the process run unique ID
sID = vYear |'-'| sDay |' '| vMin |':'| vSec |' '| vProc |'.'| sRunIndex;

### Create unique run instance element
DimensionElementInsert( cDimTgt, '', sID, 'N' );

### By Process hierarchy
DimensionElementInsert( cDimTgt, '', vProc, 'C' );
DimensionElementComponentAdd( cDimTgt, cByProc, vProc, 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| SubSt( sDay, 1, 2 ) |' '| vProc, 'C' );
DimensionElementComponentAdd( cDimTgt, vProc, vYear |'-'| SubSt( sDay, 1, 2 ) |' '| vProc, 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| sDay |' '| vProc, 'C' );
DimensionElementComponentAdd( cDimTgt, vYear |'-'| SubSt( sDay, 1, 2 ) |' '| vProc, vYear |'-'| sDay |' '| vProc, 1 );

DimensionElementComponentAdd( cDimTgt, vYear |'-'| sDay |' '| vProc, sID, 1 );

### By Runtime hierarchy
DimensionElementInsert( cDimTgt, '', vYear, 'C' );
DimensionElementComponentAdd( cDimTgt, cByDate, vYear, 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| SubSt( sDay, 1, 2 ), 'C' );
DimensionElementComponentAdd( cDimTgt, vYear, vYear |'-'| SubSt( sDay, 1, 2 ), 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| sDay, 'C' );
DimensionElementComponentAdd( cDimTgt, vYear |'-'| SubSt( sDay, 1, 2 ), vYear |'-'| sDay, 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| sDay |' '| SubSt( vMin, 1, 2 ), 'C' );
DimensionElementComponentAdd( cDimTgt, vYear |'-'| sDay, vYear |'-'| sDay |' '| SubSt( vMin, 1, 2 ), 1 );

DimensionElementComponentAdd( cDimTgt, vYear |'-'| sDay |' '| SubSt( vMin, 1, 2 ), sID, 1 );

### By User hierarchy
IF( sUser @= '' );
  sUser = 'Undefined User';
ElseIF( SubSt( sUser, 1, 2 ) @= 'R*' );
  sUser = 'Chore: ' | SubSt( sUser, 3, Long( sUser ) );
EndIF;
DimensionElementInsert( cDimTgt, '', sUser, 'C' );
DimensionElementComponentAdd( cDimTgt, cByUser, sUser, 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| SubSt( sDay, 1, 2 ) |' '| sUser, 'C' );
DimensionElementComponentAdd( cDimTgt, sUser, vYear |'-'| SubSt( sDay, 1, 2 ) |' '| sUser, 1 );
DimensionElementInsert( cDimTgt, '', vYear |'-'| sDay |' '| sUser, 'C' );
DimensionElementComponentAdd( cDimTgt, vYear |'-'| SubSt( sDay, 1, 2 ) |' '| sUser, vYear |'-'| sDay |' '| sUser, 1 );

DimensionElementComponentAdd( cDimTgt, vYear |'-'| sDay |' '| sUser, sID, 1 );


######################
### END Metadata
574,60
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

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

# Skips
IF( vDay @= 'D000' ); ItemSkip; EndIF;
IF( vMin @= 'Total Day Entry' ); ItemSkip; EndIF;
IF( vSec @= 'Last Entry' ); ItemSkip; EndIF;

# Get process run ID
sRunIndex = NumberToString( CellGetN( cCubSrc, vYear, vDay, vMin, vSec, vProc, 'nProcessExecutionIndex' ) );

# Convert day to date
sDay = AttrS( cDimDay, vDay, 'MM-DD' );

# Build the process run unique ID
sID = vYear |'-'| sDay |' '| vMin |':'| vSec |' '| vProc |'.'| sRunIndex;

### Loop through all measures and send data to alternate cube

sDim = cDimMeas;
nMax = DIMSIZ( sDim );
nCtr = 1;
WHILE( nCtr <= nMax );
  sEl = DIMNM( sDim, nCtr );
  IF( DType( sDim, sEl ) @= 'N' );
    nValue = CellGetN( cCubSrc, vYear, vDay, vMin, vSec, vProc, sEl );
    IF( CellIsUpdateable( cCubTgt, sID, sEl ) = 1 );
      CellPutN( nValue, cCubTgt, sID, sEl );
    EndIF;
  ElseIF( DType( sDim, sEl ) @= 'S' );
    sValue = CellGets( cCubSrc, vYear, vDay, vMin, vSec, vProc, sEl );
    IF( CellIsUpdateable( cCubTgt, sID, sEl ) = 1 );
      CellPutS( sValue, cCubTgt, sID, sEl );
    EndIF;
  EndIF; 
  nCtr = nCtr + 1;
END;


######################
### END Data
575,47
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

######################
### For date range over multiple years recursively call process for subsequent years

IF( sDateFrom @<> '' );
  ExecuteProcess( sThisProcName, 
    'pClear', '0', 
    'pDateFrom', sDateFrom, 
    'pDateTo', pDateTo, 
    'pProcess', pProcess 
  );
EndIF;

######################
### Reenable data transaction logging to the target cube

CellPutS( 'YES', '}CubeProperties', cCubTgt, 'LOGGING' );

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
