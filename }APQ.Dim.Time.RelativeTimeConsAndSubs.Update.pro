601,100
602,"}APQ.Dim.Time.RelativeTimeConsAndSubs.Update"
562,"VIEW"
586,"}APQ Time Relative Time Lookup"
585,"}APQ Time Relative Time Lookup"
564,
565,"wwM;2NC8_6ouOpksHgVbGfqaO7<ExlQ[RcCCA>AlKh^zsfzXw1rm>s4>faHSqbu^@\5vN8EiyXYhXh\D:8\v@Su[9LANNaU4KV6>0U>ifSjW99a3P<ZjPsuEsS9@5dXh^;tgfZ>4XtHcXG3_B\BhUu3J@fFaCbfQ:NIZ@nT59URnU742QpNluy4B:ZCBQe_Dq_NpIyr;"
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
589,
568,""""
570,}TI_Dummy_View
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDim
561,2
2
2
590,2
pDoProcessLogging,"1"
pDim,""
637,2
pDoProcessLogging,"Log to process logging cube"
pDim,"Time dimension to update? (Blank=ALL)"
577,4
vDim
vTimePeriod
vMeasure
vValue
578,4
2
2
2
2
579,4
1
2
3
4
580,4
0
0
0
0
581,4
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,92
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
### Purpose:
### Update relative time hierarchies and subsets

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDim:' | pDim;
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

### Setup

cCubSrc         = '}APQ Time Relative Time Lookup';
cCubSettings    = '}APQ Settings';
cDimTDims       = '}APQ Time Dimensions';
cDimTPer        = '}APQ Time Relative Time Periods';
cDimM           = '}APQ Time Relative Time Lookup Measure';
cDimSubs        = '}APQ Dimension Subsets';
cSubPrefix      = CellGetS( cCubSettings, 'Std Rel Time Subset Prefix', 'String' );
cViewSrcPrefix  = CellGetS( cCubSettings, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | GetProcessName;
cSubSrc         = cViewSrc;
sDelimList      = CellGetS( cCubSettings, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubSettings, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubSettings, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubSettings, 'pEleDelim', 'String' );
cAPQSubSrc      = 'APQ Internal -  RelativeTime';
nErr            = 0;
sErr            = '';

### Validate params

IF( pDim @<> '' );
   IF( DimIx( cDimTDims, pDim ) = 0 % DimensionExists( pDim ) = 0 );
      nErr = 1;
      sErr = 'Invalid time dimension: ' | pDim;
   EndIF;
EndIF;

IF( nErr <> 0 );
   DatasourceType = 'NULL';
   ItemReject( sErr );
   ProcessBreak;
EndIF;

### Create Source View

sProc = '}bedrock.cube.view.create';
sFilter = cDimM | sDelimEleStart | 'Final Value';
# As view skips consolidations and pDim parameter will be converted to the constituent hierarchies
IF( pDim @<> '' );
   sFilter = sFilter | sDelimDim | cDimTDims | sDelimEleStart | pDim;
EndIF;
ExecuteProcess( sProc, 'pLogOutput', 0,
    'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
    'pSuppressZero', 1, 'pSuppressConsol', 1, 'pSuppressRules', 0,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1
);

DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

### END Prolog
573,52
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
  nMetaDataRecordCount = nMetaDataRecordCount + 1;
EndIF;

######################
### Metadata script

# In the case of default hierarchy convert to primary dimenson name
IF( Scan( ':', vDim ) > 0 );
    IF( SubSt( vDim, 1, Scan( ':', vDim ) - 1 ) @= Trim( SubSt( vDim, Scan( ':', vDim ) + 1, Long( vDim ) ) ) );
        vDim = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
    EndIF;
EndIF;

# Skips
IF( DimensionExists( vDim ) = 0 );
  ItemSkip;
EndIF;

IF( DimIx( vDim, vTimePeriod ) = 0 );
  ItemSkip;
EndIF;

IF( DimIx( vDim, sValue ) = 0 );
  ItemSkip;
EndIF;

vTimePeriod = DimensionElementPrincipalName( vDim, vTimePeriod );
While( 1 <= ElCompN( vDim, vTimePeriod ) );
  sChild = ElComp( vDim, vTimePeriod, 1 );
  DimensionElementComponentDelete( vDim, vTimePeriod, sChild );
End;

DimensionElementComponentAdd( vDim, vTimePeriod, sValue, 1 );

######################
### END Metadata
574,87
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

# In the case of default hierarchy convert to primary dimenson name
IF( Scan( ':', vDim ) > 0 );
    sDimMain = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
    IF( Trim( SubSt( vDim, Scan( ':', vDim ) + 1, Long( vDim ) ) ) @= sDimMain );
        vDim = sDimMain;
    EndIF;
Else;
    sDimMain = vDim;
EndIF;

# Skips
IF( DimensionExists( vDim )  = 0 );
  ItemSkip;
EndIF;

IF( DimIx( vDim, vTimePeriod ) = 0 );
  ItemSkip;
EndIF;

IF( DimIx( vDim, sValue ) = 0 );
  ItemSkip;
EndIF;

# Get subset name
sSub = cSubPrefix | vTimePeriod;

# Update subset
IF( CellGetS( cCubSrc, vDim, vTimePeriod, 'CreateSubset' ) @= 'Y' );
  IF( SubsetExists( vDim, sSub ) = 1 );
    SubsetDeleteAllElements( vDim, sSub );
  Else;
    SubsetCreate( vDim, sSub );
  EndIF;
  sAlias = CellGetS( cCubSrc, vDim, vTimePeriod, 'Alias' );
  IF( DimIx( '}ElementAttributes_' | sDimMain, sAlias ) > 0 );
    SubsetAliasSet( vDim, sSub, sAlias );
  EndIF;
  SubsetElementInsert( vDim, sSub, sValue, 1 );
  If( Scan( ':', vDim ) = 0 );
      sDimSub = vDim|':'|vDim|':'|sSub;
  Else;
      sDimSub = vDim|':'|sSub;
  EndIf;
  If( DimIx( cDimSubs, sDimSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, sDimSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, sDimSub, 'Source' );
  EndIf;
ElseIF( SubsetExists( vDim, sSub ) = 1 );
  # Destroy subset. Use bedrock process in case subset used in view will cause minor error not fatal error.
  LogOutput( 'INFO', Expand('Attempting to delete subset %sSub% in dimension %vDim%.') );
    nRet = ExecuteProcess( '}bedrock.hier.sub.delete',
        'pLogOutput', 0,
        'pDim', vDim,
        'pHier', '',
        'pSub', sSub,
        'pDelim', sDelimList,
        'pMode', 0
    );
    IF( nRet <> ProcessExitNormal );
        LogOutput( 'WARN', Expand('Subset %sSub% in dimension %vDim% could not be deleted. Subset may be used in a view.') );
    EndIF;
EndIF;

######################
### END Data
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
