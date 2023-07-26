601,100
602,"}APQ.Dim.UDC.Flat.Update"
562,"VIEW"
586,"}APQ Dimension Static Subsets And UDC"
585,"}APQ Dimension Static Subsets And UDC"
564,
565,"uGc9:B>tEW3r7@U^9sPIKaS5>T5kUu8R@JbPWoWCjO5tZl^v9ddb68_Q5=S8tgwg=:pTqRb><79XUqxqP;RClWHwmR[829[IBn9`=di5GKIFQlR2An43YA=vTRagk_XfZFAq^FHImCiqKIGyZ[VHhS;NrSTV]rK<z:y\ohh_<1fN2]fbXVP5u:Ebj_j^5=y[aY?b^qhB"
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
pDim,"Dimension (blank=All). Can be limited to a hierarchy using dim:sub"
577,6
vDim
vType
vSubIdx
vItemIdx
vMeas
vEle
578,6
2
2
2
2
2
2
579,6
1
2
3
4
5
6
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,6
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,118
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
### Update flat (single level) user defined consolidations

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

cCubSrc         = '}APQ Dimension Static Subsets And UDC';
cCubTgt         = cCubSrc;
cDimDim         = '}APQ Dimensions';
cDimTyp         = '}APQ Dimension Node Type';
cDimSubIdx      = '}APQ Dimension Use Index';
cDimItemIdx     = '}APQ Item Index';
cDimM           = '}APQ Dimension Static Subsets And UDC Measure';
cType           = 'Flat Consolidation';
cMeas           = 'ElementName';

cCubSettings    = '}APQ Settings';
cTopNode        = CellGetS( cCubSettings, 'Std Top Node Name', 'String' );
cUDCNode        = CellGetS( cCubSettings, 'Std UDC Parent Node Name', 'String' );
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubSettings, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
sDelimList      = CellGetS( cCubSettings, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubSettings, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubSettings, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubSettings, 'pEleDelim', 'String' );
nSubIdx         = 0;
sPrevDimUDC     = '';
sPrevDimHier    = '';

### Validate Framework
cTestVal1       = CellGetS( cCubSettings, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cCubSettings, 'Customer Name', 'String' );
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;

### Validate parameters
IF( pDim @<> '' );
  IF( DimensionExists( pDim ) = 0 );
    DatasourceType = 'NULL';
    LogOutput( 'WARN', Expand('%sThisProcName% pDim parameter invalid %pDim%.') );
    Processbreak;
  EndIF;      
  IF( Scan( ':', pDim ) > 0 );
      pHier = Trim( SubSt( pDim, Scan( ':', pDim ) + 1, 100 ) );
      pDim = SubSt( pDim, 1, Scan( ':', pDim ) - 1 );
      IF( HierarchyExists( pDim, pHier ) = 0 );
        DatasourceType = 'NULL';
        LogOutput( 'WARN', Expand('%sThisProcName% hierarchy does not exist %pDim%:%pHier%.') );
        Processbreak;
      EndIF;
  EndIF;
  IF( pHier @= 'Leaves' );
    DatasourceType = 'NULL';
    LogOutput( 'WARN', Expand('%sThisProcName% cannot create rollup in leaves hierarchy!') );
    Processbreak;
  EndIF;      
EndIF;

### Define View. Use temporary view
ViewCreate( cCubSrc, cViewSrc, 1 );
ViewExtractSkipZeroesSet( cCubSrc, cViewSrc, 1 );
ViewExtractSkipCalcsSet( cCubSrc, cViewSrc, 1 );
ViewExtractSkipRuleValuesSet( cCubSrc, cViewSrc, 1 );
SubsetCreate( cDimM, cSubSrc, 1 );
SubsetElementInsert( cDimM, cSubSrc, cMeas, 0 );
ViewSubsetAssign( cCubSrc, cViewSrc, cDimM, cSubSrc );
SubsetCreate( cDimTyp, cSubSrc, 1 );
SubsetElementInsert( cDimTyp, cSubSrc, cType, 0 );
ViewSubsetAssign( cCubSrc, cViewSrc, cDimTyp, cSubSrc );
If( DimensionExists( pDim ) = 1 );
    SubsetCreate( cDimDim, cSubSrc, 1 );
    SubsetElementInsert( cDimDim, cSubSrc, pDim, 0 );
    ViewSubsetAssign( cCubSrc, cViewSrc, cDimDim, cSubSrc );
EndIf;

DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;


######################
### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,127
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
### Metadata script

### Skips
IF( DimensionExists( vDim )  = 0 );
  ItemSkip;
EndIF;

sHier   = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'HierarchyUsed' );
IF( sHier @= pDim |':Leaves' );
  LogOutput( 'WARN', Expand('%sThisProcName% cannot create rollup in leaves hierachy! %sHier%') );
  ItemSkip;
EndIF;

sUDC    = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items', 'NodeName' );
IF( sUDC @= '' );
  ItemSkip;
EndIF;

# Get additional measures
sFreq   = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'Regeneration Frequency' );
sDay    = UPPER( SubSt( CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'Regeneration Day' ), 1, 3 ) );
sDayNow = UPPER( SubSt( AttrS( '}APQ Time Date Lookup', Today( 1 ), 'WeekDay Name' ), 1, 3) );

# Only pay attention to schedule if running as part of a chore. If run by user then procees regardless
IF( DimIx( '}Clients', TM1User() ) = 0 );
  IF( sFreq @= 'Manual' );
    # exit as only run if executed by USER and not by CHORE
    ItemSkip;
  ElseIF( sFreq @= 'Weekly' & sDay @<> sDayNow );
    ItemSkip;
  EndIF;
EndIF;

IF( pHier @<> '' );
  IF( pDim |':'| pHier @<> sHier );
    ItemSkip;
  EndIF;
EndIF;

# Accomodate alternate hierarchies
IF( Scan( ':', sHier ) > 0 );
  vDimHier = sHier;
Else;
  vDimHier = vDim;
EndIF;

# For first item only unwind in case definition has changed & add USC consol to top node
IF( StringToNumber( vItemIdx )  = 1 );

  IF( DimIx( vDimHier, sUDC ) > 0 );
    nCtr = ElCompN( vDimHier, sUDC );
    While( nCtr > 0 );
        sEle = ElComp( vDimHier, sUDC, nCtr );
        DimensionElementComponentDeleteDirect( vDimHier, sUDC,  sELe );
        nCtr = nCtr - 1;
    End;
  EndIF;
  DimensionElementInsertDirect( vDimHier, '', sUDC, 'C' );
  IF(  Scan( '<dimension>', cTopNode ) = 0 );
    sTopNode = cTopNode;
  ElseIF( Scan( '<dimension>', cTopNode ) = 1 );
    sTopNode = vDim | SubSt( cTopNode, 12, Long( cTopNode ) - 11 );
  Else;
    sTopNode = SubSt( cTopNode, 1, Scan( '<dimension>', cTopNode ) - 1 ) | vDim | SubSt( cTopNode, Scan( '<dimension>', cTopNode ) + 11, Long( cTopNode ) - Scan( '<dimension>', cTopNode ) + 10 );
  EndIF;
  IF(  Scan( '<dimension>', cUDCNode ) = 0 );
    sUDCNode = cUDCNode;
  ElseIF( Scan( '<dimension>', cUDCNode ) = 1 );
    sUDCNode = vDim | SubSt( cUDCNode, 12, Long( cUDCNode ) - 11 );
  Else;
    sUDCNode = SubSt( cUDCNode, 1, Scan( '<dimension>', cUDCNode ) - 1 ) | vDim | SubSt( cUDCNode, Scan( '<dimension>', cUDCNode ) + 11, Long( cUDCNode ) - Scan( '<dimension>', cUDCNode ) + 10 );
  EndIF;
  DimensionElementInsertDirect( vDimHier, '', sUDCNode, 'C' );
  DimensionElementComponentAddDirect( vDimHier, sUDCNode, sUDC, 0 );
  IF( DimIx( vDimHier, sTopNode ) > 0 );
    DimensionElementComponentAddDirect( vDimHier, sTopNode, sUDCNode, 0 );       
  EndIF;

ElseIF( DimIx( vDimHier, vEle ) = 0 );
  ItemSkip;
ElseIF( CellGetN( cCubTgt, vDim, cType, vSubIdx, vItemIdx, 'IsValid' ) = 0 );
  # check in cube rules for circulur reference. If yes then will be flagged as invalid. Skip here to avoid error inserting component
  ItemSkip;
EndIF;

### Setup & counters
sDimUDC = vDim | sUDC;

IF( sDimUDC @= sPrevDimUDC & vDimHier @= sPrevDimHier );
  nSubIdx = nSubIdx + 1;
Else;
  nSubIdx = 1;
EndIF;
sPrevDimUDC = sDimUDC;
sPrevDimHier = vDimHier;

### Add elements to flat UDC
nWht = CellGetN( cCubSrc, vDim, cType, vSubIdx, vItemIdx, 'ElementWht' );
vEle = DimensionElementPrincipalName( vDimHier, vEle );
DimensionElementComponentAddDirect( vDimHier, sUDC, vEle, nWht );
CellPutN( nSubIdx, cCubSrc, vDim, cType, vSubIdx, vItemIdx, 'NodeIndex' );
CellPutN( Now(), cCubTgt, vDim, cType, vSubIdx, '0001', 'LastConstructN' );


######################
### END Data

575,29
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

# No need to remove source view & subs as now using temp objects

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
