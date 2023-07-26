601,100
602,"}APQ.Dim.Sub.SemiDynamicSubsets.Update"
562,"VIEW"
586,"}APQ Dimension SemiDynamic Subsets"
585,"}APQ Dimension SemiDynamic Subsets"
564,
565,"m?qDAd9jFdMAgz=zOAAPs\0sf_MBs2u>2^`Ro]LuAg\Ulwd6fpTn=zQD;l<XBo^83vZJ3wI>_KvpT8Nb>2B?m\OYvVVA4]z\vH36RVKfZVBUl3t4NqJ6oa[ya=mjbYH=tUpFQY`BlF6@2a98]JB5<OX20>X^qwXhHKxFF9b\^9pA1c7hLhre59k6jzDQy3RBVKR4T[m?qDAd9jFdMAgt=zOAAPs\0sf_MBs2u>0^`Ro]LuAg\Ulw`6fpTn=zQD;\yYBo>43vZjr3wI>_Kspd3Nb>2B?m\OYvVUA4]z\vHc2RVKfZVBUlSD9NqJ6oa[ya=mj<WH=4W0HQY`BlFfI2ai;]JB6<OX20>X^qwXhHkqFF9m\^9p14c7hLhreE9k6jzDQi4o^BVKR4T["
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
560,3
pDoProcessLogging
pDim
pForce
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pDim,""
pForce,"0"
637,3
pDoProcessLogging,"Log to process logging cube"
pDim,"Optional: Dimension (blank=All)"
pForce,"Optional: Force regeneration for subsets over time threshold?"
577,4
vDim
vSubIdx
vSubMeasure
Value
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
572,108
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
### Update semi dynamic subsets from MDX expressions

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDim:' | pDim | ' & pForce:' | pForce;
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
### Prolog script commences

### Setup

cCubSrc         = '}APQ Dimension SemiDynamic Subsets';
cCubTgt         = cCubSrc;
cDimDim         = '}APQ Dimensions';
cDimSubIdx      = '}APQ Item Index';
cDimM           = '}APQ Dimension SemiDynamic Subsets Measure';
cMeas           = 'SubsetName';
cDimSub1        = '}APQ Dimension Subsets';
cDimSub2        = '}APQ Subsets';
cSysSettingCube = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cSysSettingCube, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cTM1Version     = CellGetS( cSysSettingCube, 'TM1 Version', 'String' );
cVer1022        = '10.2.2';
nMaxMDXSec      = CellGetN( cSysSettingCube, 'Max sec for SemiDynamic subset refresh', 'Numeric' );
sDelimList      = CellGetS( cSysSettingCube, 'pDelim', 'String' );
sDelimDim       = CellGetS( cSysSettingCube, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cSysSettingCube, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cSysSettingCube, 'pEleDelim', 'String' );
cAPQSubSrc      = 'SemiDynamic Sub';
bUpdateDirect   = 0;

### Validate Framework
cTestVal1       = CellGetS( cSysSettingCube, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cSysSettingCube, 'Customer Name', 'String' );
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;

### Test Parameters
If( nMaxMDXSec  <= 0 );
    # if parameter is empty then we should have old default behavior and refresh all semi-dynamic subsets. Set value to be LARGE.
    LogOutput( 'INFO', sThisProcName | ': Max sec for SemiDynamic subset refresh=0, setting to 999.' );
    nMaxMDXSec = 999;
EndIf;
If( pForce @>= '1' );
    pForce = '1';
Else;
    pForce = '0';
EndIf;
If( pDim @<> '' );
    If( DimIx( cDimDim, pDim ) = 0 );
        DatasourceType = 'NULL';
        ItemReject( 'Dimension not found: ' | pDim );
    EndIf;
EndIf;

### Define View. Use temporary view
ViewCreate( cCubSrc, cViewSrc, 1 );
ViewExtractSkipZeroesSet( cCubSrc, cViewSrc, 1 );
ViewExtractSkipCalcsSet( cCubSrc, cViewSrc, 1 );
ViewExtractSkipRuleValuesSet( cCubSrc, cViewSrc, 1 );
SubsetCreate( cDimM, cSubSrc, 1 );
SubsetElementInsert( cDimM, cSubSrc, cMeas, 0 );
ViewSubsetAssign( cCubSrc, cViewSrc, cDimM, cSubSrc );
If( DimIx( cDimDim, pDim ) >= 1 );
    SubsetCreate( cDimDim, cSubSrc, 1 );
    SubsetElementInsert( cDimDim, cSubSrc, pDim, 0 );
    ViewSubsetAssign( cCubSrc, cViewSrc, cDimDim, cSubSrc );
EndIf;

# Set data source
DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

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

IF( DimensionExists( vDim )  = 0 );
  ItemSkip;
EndIF;

IF( vSubMeasure @<> cMeas );
  ItemSkip;
EndIF;

sMDX = CellGetS( cCubTgt, vDim, vSubIdx,  'SubsetExpression' );
IF( sValue @= '' % sMDX @= '' );
  ItemSkip;
EndIF;

sFreq = CellGetS( cCubTgt, vDim, vSubIdx,  'Regeneration Frequency' );
sDay = UPPER( SubSt( CellGetS( cCubTgt, vDim, vSubIdx,  'Regeneration Day' ), 1, 3 ) );
sDayNow = UPPER( SubSt( AttrS( '}APQ Time Date Lookup', Today( 1 ), 'WeekDay Name' ), 1, 3) );
IF( DimIx( '}Clients', TM1User() ) = 0 );
  IF( sFreq @= 'Manual' );
    # exit as only run if executed by USER and not by CHORE
    ItemSkip;
  ElseIF( sFreq @= 'Weekly' & sDay @<> sDayNow );
    ItemSkip;
  EndIF;
EndIF;

sDynamic        = CellGetS( cCubTgt, vDim, vSubIdx, 'KeepSubsetDynamic' );
nConvertStatic  = IF( sDynamic @= 'Y',0,1);
sHier           = CellGetS( cCubTgt, vDim, vSubIdx, 'HierarchyUsed' );
nHierFunc       = If( vDim @<> sHier, 1, 0 );
nSubsetExists   = If( nHierFunc = 1, HierarchySubsetExists( vDim, sHier, sValue ), SubsetExists( vDim, sValue ) );

nGenSec         = 86400 * CellGetN( cCubTgt, vDim, vSubIdx,  'ConstructTimeN' );
If( nGenSec > nMaxMDXSec & pForce @<> '1' );
  # don't regenerate subset
Else;

  nStart = Now();
  If( nConvertStatic = 0 & cTM1Version @>= cVer1022 & nSubsetExists = 1 ); 
    # In order to manage the MDX potentially associated to a view we need to use the function SubsetMDXSet (10.2.2 and Higher)
    # If the subset should be kept dynamic and the subset already exist.
    If( nHierFunc = 1 );
        HierarchySubsetMDXSet( vDim, sHier, sValue, sMDX );
    Else;
        SubsetMDXSet( vDim, sValue, sMDX );
    EndIf;
  Else;
    sProc = '}bedrock.hier.sub.create.bymdx';
    nRet = ExecuteProcess( sProc,
    	'pDim', vDim,
    	'pHier', sHier,
    	'pSub',sValue,
    	'pMDXExpr', sMDX,
    	'pConvertToStatic', nConvertStatic,
    	'pTemp', 0
    );
    nElapsed = Now() - nStart;
  EndIF;

  IF( nRet = ProcessExitNormal );
    CellPutN( nStart, cCubTgt, vDim, vSubIdx, 'LastConstructN' );
    CellPutN( nElapsed, cCubTgt, vDim, vSubIdx, 'ConstructTimeN' );
    CellPutS( '', cCubTgt, vDim, vSubIdx,  'HasError' );
  Else;
    CellPutS( 'TRUE', cCubTgt, vDim, vSubIdx, 'HasError' );
  EndIF;

EndIf;

######################
### END Metadata
574,126
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

IF( DimensionExists( vDim )  = 0 );
  ItemSkip;
EndIF;

IF( vSubMeasure @<> cMeas );
  ItemSkip;
EndIF;

sHier = CellGetS( cCubTgt, vDim, vSubIdx, 'HierarchyUsed' );
nHierFunc = If( vDim @<> sHier, 1, 0 );

IF( nHierFunc = 0 );
    IF( SubsetExists( vDim, sValue )  = 0 );
      CellPutS( 'TRUE', cCubTgt, vDim, vSubIdx, 'HasError' );
      ItemSkip;
    EndIF;
Else;
    IF( SubsetExists( vDim|':'|sHier, sValue )  = 0 );
      ItemSkip;
    EndIF;
EndIF;

sFreq = CellGetS( cCubTgt, vDim, vSubIdx, 'Regeneration Frequency' );
sDay = UPPER( SubSt( CellGetS( cCubTgt, vDim, vSubIdx, 'Regeneration Day' ), 1, 3 ) );
sDayNow = UPPER( SubSt( AttrS( '}APQ Time Date Lookup', Today( 1 ), 'WeekDay Name' ), 1, 3) );
IF( DimIx( '}Clients', TM1User() ) = 0 );
  IF( sFreq @= 'Manual' );
    # exit as only run if executed by USER and not by CHORE
    ItemSkip;
  ElseIF( sFreq @= 'Weekly' & sDay @<> sDayNow );
    ItemSkip;
  EndIF;
EndIF;

sRegen = SubSt( CellGetS( cCubTgt, vDim, vSubIdx, 'LastConstruct' ), 1, 10 );
If( Today(1) @= sRegen );
  If( nHierFunc = 0 );
      nSubSiz = SubsetGetSize( vDim, sValue );
  Else;
      nSubSiz = HierarchySubsetGetSize( vDim, sHier, sValue );
  EndIf;
  CellPutN( nSubSiz, cCubTgt, vDim, vSubIdx, 'NumberOfElements' );
  If( nSubSiz = 0 );
    CellPutS( 'TRUE', cCubTgt, vDim, vSubIdx, 'HasError' );
  EndIf;
EndIf;

sAlias = CellGetS( cCubTgt, vDim, vSubIdx, 'AliasToSet' );
If( sAlias @= '' );
  # nothing
ElseIf( DimIx ( '}ElementAttributes_' | vDim, sAlias ) = 0 );
  # nothing
Else;
    If( nHierFunc = 0 );
        SubsetAliasSet( vDim, sValue, sAlias );
    Else;
        HierarchySubsetAliasSet( vDim, sHier, sValue, sAlias );
    EndIf;
EndIf;

# MDX expression
sMDX = CellGetS( cCubTgt, vDim, vSubIdx, 'SubsetExpression' );

### Add subset to framework if not already existing
If( DimIx( cDimSub1, vDim |':'| sHier |':'| sValue ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %vDim%:%sHier%:%sValue%') );
    If( DimIx( cDimSub1, vDim ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', vDim, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', vDim, 1 ); 
        DimensionElementInsertDirect( cDimSub1, '', vDim |':'| sHier, 'C' );
        DimensionElementComponentAddDirect( cDimSub1, vDim, vDim |':'| sHier, 1 );
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', vDim |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', vDim |':'| sHier |':'| sValue, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, vDim |':'| sHier, vDim |':'| sHier |':'| sValue, 1 );
    If( SubsetExists( cDimSub1, vDim ) = 0 ); 
        SubsetCreate( cDimSub1, vDim ); 
    EndIf;
    SubsetElementInsert( cDimSub1, vDim, vDim |':'| sHier |':'| sValue, 0 );
    If( DimIx( cDimSub2, sValue ) = 0 ); 
        DimensionElementInsertDirect( cDimSub2, '', sValue, 'N' ); 
    EndIf;
    If( SubsetExists( cDimSub2, vDim ) = 0 ); 
        SubsetCreate( cDimSub2, vDim ); 
    EndIf;
    SubsetElementInsert( cDimSub2, vDim, sValue, 0 );
    CellPutN( nSubSiz, cDimSub1, vDim |':'| sHier |':'| sValue, 'ElementCount' );
    CellPutS( vDim, cDimSub1, vDim |':'| sHier |':'| sValue, 'DimensionName' );
    CellPutS( sHier, cDimSub1, vDim |':'| sHier |':'| sValue, 'Hierarchy' );
    CellPutS( sValue, cDimSub1, vDim |':'| sHier |':'| sValue, 'SubsetName' );
    CellPutS( sMDX, cDimSub1, vDim |':'| sHier |':'| sValue, 'MDXExpression' );
    AttrPutS( sValue, cDimSub1, vDim |':'| sHier |':'| sValue, 'Caption' );
    AttrPutS( sHier, cDimSub1, vDim |':'| sHier, 'Caption' );
    CellPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sValue, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sValue, 'Source' );
Else;
    CellPutS( sMDX, cDimSub1, vDim |':'| sHier |':'| sValue, 'MDXExpression' );
    CellPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sValue, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, vDim |':'| sHier |':'| sValue, 'Source' );
EndIf;

######################
### END Data
575,35
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
