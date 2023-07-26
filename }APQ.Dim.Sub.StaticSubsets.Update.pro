601,100
602,"}APQ.Dim.Sub.StaticSubsets.Update"
562,"VIEW"
586,"}APQ Dimension Static Subsets And UDC"
585,"}APQ Dimension Static Subsets And UDC"
564,
565,"oQFTmyqUNBep0pUyKwRn_IGpKsNF?esSZb;:vE?U5Ojx`@kKtz=S[==:XAdg9L\FmUla]HzV9z&_<qct^uQCZNK[r?BA=pe[R1J8=yMjAOUOu;ZanGy7DK_ezS1nbN4tUyjXQ;J3tFgYF6mH:[k7]Ue22b=Qt0I^PpD>LJDy]Cw3m[n\Xs3ta|t?A8MFhxhzd<m]KWhL"
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
572,115
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
### Update user defined static subsets

##############################################################################################################
### Logging - common script
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
### Prolog script

### Setup

cCubSrc         = '}APQ Dimension Static Subsets And UDC';
cCubTgt         = cCubSrc;
cDimSub1        = '}APQ Dimension Subsets';
cDimSub2        = '}APQ Subsets';
cSysSettingCube = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cSysSettingCube, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cDimDim         = '}APQ Dimensions';
cDimTyp         = '}APQ Dimension Node Type';
cDimSubIdx      = '}APQ Dimension Use Index';
cDimItemIdx     = '}APQ Item Index';
cDimM           = '}APQ Dimension Static Subsets And UDC Measure';
sDelimList      = CellGetS( cSysSettingCube, 'pDelim', 'String' );
sDelimDim       = CellGetS( cSysSettingCube, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cSysSettingCube, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cSysSettingCube, 'pEleDelim', 'String' );

cAPQSubSrc      = 'Static Sub';
cType           = 'Static Subset';
cMeas           = 'ElementName';
pHier           = '';
bUpdateDirect   = 0;
nSubIdx         = 0;
sPrevDimSub     = '';
sPrevDimHier    = '';

### Validate Framework
cTestVal1       = CellGetS( cSysSettingCube, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cSysSettingCube, 'Customer Name', 'String' );
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
EndIF;

### Define View
sProc       = '}bedrock.cube.view.create';
sFilter     = cDimM | sDelimEleStart | cMeas | sDelimDim | cDimTyp | sDelimEleStart | cType;
IF( DimensionExists( pDim ) = 1 );
  sFilter   = sFilter | sDelimDim | cDimDim | sDelimEleStart | pDim;
EndIF;
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 1;
nRet    = ExecuteProcess( sProc,
    'pLogOutput', 0,
    'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
    'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle, 
    'pTemp', 1
);

DatasourceType = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView = cViewSrc;

### END Prolog
573,92
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

### Skips

IF( DimensionExists( vDim )  = 0 );
  ItemSkip;
EndIF;

sSub    = CellGetS( cCubTgt, vDim, cType, vSubIdx,  'Total Items', 'NodeName' );
IF( sSub @= '' );
  ItemSkip;
EndIF;

sHier   = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'HierarchyUsed' );
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

IF( DimIx( vDimHier, vEle ) = 0 );
  ItemSkip;
EndIF;

### Setup & counters

IF( SubsetExists( vDimHier, sSub ) = 0 );
  SubsetCreate( vDimHier, sSub, 0 );
EndIF;

sDimSub = vDim | sSub;

IF( sDimSub @= sPrevDimSub & vDimHier @= sPrevDimHier );
  nSubIdx = nSubIdx + 1;
Else;
  SubsetDeleteAllElements( vDimHier, sSub );
  nSubIdx = 1;
EndIF;
sPrevDimSub = sDimSub;
sPrevDimHier = vDimHier;

### Add elements to subset

vEle = DimensionElementPrincipalName( vDimHier, vEle );
SubsetElementInsert( vDimHier, sSub, vEle, 0 );
CellPutN( nSubIdx, cCubSrc, vDim, cType, vSubIdx, vItemIdx, 'NodeIndex' );
CellPutN( Now(), cCubTgt, vDim, cType, vSubIdx,  '0001', 'LastConstructN' );


######################
### END Metadata
574,121
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

### Skips

IF( StringToNumber( vItemIdx )  > 1 );
  ItemSkip;
EndIF;

IF( DimensionExists( vDim )  = 0 );
  ItemSkip;
EndIF;

sSub = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items', 'NodeName' );
IF( sSub @= '' );
  ItemSkip;
EndIF;
IF( SubsetExists( vDim, sSub ) = 0 );
  ItemSkip;
EndIF;

sHier = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'HierarchyUsed' );
sFreq = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'Regeneration Frequency' );
sDay = UPPER( SubSt( CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'Regeneration Day' ), 1, 3 ) );
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

### Set Alias

sAlias = CellGetS( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'AliasToSet' );
IF( sAlias @= '' );
  # nothing
Else;
  IF( DimIx ( '}ElementAttributes_' | vDim, sAlias ) = 0 );
    # nothing
  Else;
    SubsetAliasSet( vDimHier, sSub, sAlias );
  EndIF;
EndIF;

### Add subset to framework if not already existing
If( DimIx( cDimSub1, vDim |':'| sHier |':'| sSub ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %vDim%:%sHier%:%sSub%') );
    If( DimIx( cDimSub1, vDim ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', vDim, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', vDim, 1 ); 
        DimensionElementInsertDirect( cDimSub1, '', vDim |':'| sHier, 'C' );
        DimensionElementComponentAddDirect( cDimSub1, vDim, vDim |':'| sHier, 1 );
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', vDim |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', vDim |':'| sHier |':'| sSub, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, vDim |':'| sHier, vDim |':'| sHier |':'| sSub, 1 );
    If( SubsetExists( cDimSub1, vDim ) = 0 ); 
        SubsetCreate( cDimSub1, vDim ); 
    EndIf;
    SubsetElementInsert( cDimSub1, vDim, vDim |':'| sHier |':'| sSub, 0 );
    If( DimIx( cDimSub2, sSub ) = 0 ); 
        DimensionElementInsertDirect( cDimSub2, '', sSub, 'N' ); 
    EndIf;
    If( SubsetExists( cDimSub2, vDim ) = 0 ); 
        SubsetCreate( cDimSub2, vDim ); 
    EndIf;
    SubsetElementInsert( cDimSub2, vDim, sSub, 0 );
    nSubSiz = CellGetN( cCubTgt, vDim, cType, vSubIdx, 'Total Items',  'IsValid' );
    CellPutN( nSubSiz, cDimSub1, vDim |':'| sHier |':'| sSub, 'ElementCount' );
    CellPutS( vDim, cDimSub1, vDim |':'| sHier |':'| sSub, 'DimensionName' );
    CellPutS( sHier, cDimSub1, vDim |':'| sHier |':'| sSub, 'Hierarchy' );
    CellPutS( sSub, cDimSub1, vDim |':'| sHier |':'| sSub, 'SubsetName' );
    AttrPutS( sSub, cDimSub1, vDim |':'| sHier |':'| sSub, 'Caption' );
    AttrPutS( sHier, cDimSub1, vDim |':'| sHier, 'Caption' );
    CellPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sSub, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sSub, 'Source' );
Else;
    CellPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sSub, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sSub, 'Source' );
EndIf;

######################
### END Data
575,34
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

# Check for direct dimension updates
If( bUpdateDirect > 0 );
    DimensionUpdateDirect( cDimSub1 );
    DimensionUpdateDirect( cDimSub2 );
EndIf;

##############################################################################################################
### Logging - common script 	----------------- START
### ( Place as last code block on epilog )
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
