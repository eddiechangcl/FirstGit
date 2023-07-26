601,100
602,"}APQ.Dim.Sub.StandardSubsets.Update"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"zTg;dhb4h0GM0IWFVIJApXKzRuzgbls<tMpfA8_xPU^Ai8q04A\V_1Lm8u""Fve8:wh:o<l]\[O3<1CUBS1FT?\Jl:TCS<Y]zwZ2howhk>L4sR>#hlgh@9\tK<_WzoAG/l0hIoGptBM0A@`]Zr3:6rNNex^PZ@Ky54hbO:[5MDEMQA:vZZiDI9<8MiC5y^ecl[_k[zTg;dhb4h0GM0IWFVIJApXKzRuwgbls\zMpfA8_xPU^Ai8t04A\V_1Lm8?Mve82wh:_;l]\[O371AUBS1FT?\Jl:DAS<Y]zwZrhowhk>L4sR>?flgh@9\tK<_W:{nAG?h@oIoGptB8A@0_ZrC36rNNex^PZ@Ky54fbO:\5MDEMQA:vZZiD9<<8MiC57w=Wecl[_k["
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
570,
571,All
569,0
592,0
599,1000
560,6
pDoProcessLogging
pDebug
pDim
pSkipControlObj
pForceLargeDimRefresh
pSortOrder
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
pDim,""
pSkipControlObj,"1"
pForceLargeDimRefresh,"0"
pSortOrder,"0"
637,6
pDoProcessLogging,"Log to process logging cube"
pDebug,"Write debug log file?"
pDim,"Specific dimension for subset refresh: Blank=ALL"
pSkipControlObj,"Skip control objects"
pForceLargeDimRefresh,"Force refresh for dimensions over the size threshold"
pSortOrder,"Default subset sort order (0 or omitted=index asc, 1=alpha asc)"
577,1
vDim
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
572,122
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
### This process creates standard subsets for all dimensions in the model
### Subsets maintained: All Elements, All N Elements, Default Member, Top Elements
### This should be run as part of a daily setup chore
######################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
IF( pDim @<> '' ); pSkipControlObj = '0'; pForceLargeDimRefresh = '1'; EndIF;
sProcLogParams = Expand( 'pDim: %pDim% & pSkipControlObj: %pSkipControlObj% & pForceLargeDimRefresh: %pForceLargeDimRefresh% & pSortOrder: %pSortOrder% & pDebug: %pDebug%' );
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

######################
### Inits - declare constants

# 		Standard naming convention for source and target cubes/dimensions
cCubDimDefault  = '}APQ Dimension Defaults';
cCubDimInfo     = '}DimensionProperties';
cCubHierInfo    = '}HierarchyProperties';
cCubSysInfo     = '}APQ Settings';
cDimSrc         = '}Dimensions';
cDimTgt         = '}APQ Dimension Hierarchies';
cDimTime        = '}APQ Time Dimensions';
cDimSub1        = '}APQ Dimension Subsets';
cDimSub2        = '}APQ Subsets';
cEleTop         = CellGetS( cCubSysInfo, 'Std Top Node Name', 'String' );
cSubSrc         = 'ALL';
cAPQSubSrc      = 'Standard Sub';

sDelim          = CellGetS( cCubSysInfo, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubSysInfo, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubSysInfo, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubSysInfo, 'pEleDelim', 'String' );
cSubAllNcode    = CellGetS( cCubSysInfo, 'Std All N Elements Principal', 'String' );
cSubAllN        = CellGetS( cCubSysInfo, 'Std All N Elements', 'String' );
cSubAllC        = CellGetS( cCubSysInfo, 'Std All C Elements', 'String' );
cSubTop         = CellGetS( cCubSysInfo, 'Std Top Elements', 'String' );
cSubAll         = CellGetS( cCubSysInfo, 'Std All Elements', 'String' );
cSubDefaultMem  = CellGetS( cCubSysInfo, 'Std Default Member Subset', 'String' );

cMaxDimSiz      = CellGetN( cCubSysInfo, 'Max dimension size for std subset refresh', 'Numeric' );
bAltHiers       = CellGetN( cCubSysInfo, 'Create Std Subsets in Alternate Hierarchies', 'Numeric' );
bSubAllNcode    = CellGetN( cCubSysInfo, 'Std All N Elements Principal', 'Numeric' );
bSubAllN        = CellGetN( cCubSysInfo, 'Std All N Elements', 'Numeric' );
bSubAllC        = CellGetN( cCubSysInfo, 'Std All C Elements', 'Numeric' );
bSubTop         = CellGetN( cCubSysInfo, 'Std Top Elements', 'Numeric' );
bSubAll         = CellGetN( cCubSysInfo, 'Std All Elements', 'Numeric' );
bSubDefaultMem  = CellGetN( cCubSysInfo, 'Std Default Member Subset', 'Numeric' );
cAlias          = IF( CellGetN( cCubSysInfo, 'Std Alias 1', 'Numeric' ) = 1, CellGetS( cCubSysInfo, 'Std Alias 1', 'String' ), '' );
cAlias2         = IF( CellGetN( cCubSysInfo, 'Std Alias 2', 'Numeric' ) = 1, CellGetS( cCubSysInfo, 'Std Alias 2', 'String' ), '' );
cAlias3         = '}TM1_DefaultDisplayValue';
bUpdateDirect   = 0;
cDebugLoc       = CellGetS( cCubSysInfo, 'Location: Debugging', 'String' );
cDebugFile      = cDebugLoc | If( SubSt( cDebugLoc, Long(cDebugLoc), 1 ) @= '\', '', '\' ) | 'DebugLog_' | GetProcessName;

# Fix missing parameters for the process }bedrock.hier.sub.delete
cMode           = 0;
cDelim          = sDelim;
nErr            = 0;
sErr            = '';
nDebug          = StringToNumber(pDebug);

# Validate Framework
cTestVal1       = CellGetS( cCubSysInfo, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cCubSysInfo, 'Customer Name', 'String' );
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;

######################
### Test params

IF( pDim @<> '' );
   IF( DimIx( cDimSrc, pDim ) = 0 );
      nErr = 1;
      sErr = Expand( 'Invalid dimension: %pDim%.' );
   EndIF;
EndIF;

IF( nErr > 0 );
   DatasourceType = 'NULL';
   ItemReject( sErr );
EndIF;

######################
### Assign data source

DataSourceType              = 'SUBSET';
DataSourceNameForServer     = cDimSrc;
DatasourceDimensionSubset   = cSubSrc;

######################
### END Prolog
573,439
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

sDebugFile = cDebugFile | '_Metadata.log';
IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, vDim );
EndIF;

# Skip new PA dimensions
If( SubSt( vDim, 1, 9 ) @= '}Subsets_' % SubSt( vDim, 1, 13 ) @= '}Hierarchies_' % SubSt( vDim, 1, 7 ) @= '}Views_' );
    ItemSkip;
EndIf;

# Skip if alternate hierarchy and setting for alternate hierarchies is OFF
IF( Scan( ':', vDim ) > 0 & bAltHiers = 0 );
    ItemSkip;
EndIF;

# Skip if dimension doesn't exist in }APQ Dimensions & }APQ Dimension Hierarchies (would cause error on CellGet)
IF( DimIx( cDimTgt, vDim ) = 0 );
    ItemSkip;
EndIF;

# If pDim parameter is used then skip if dimension doesn't match. If dimension given then include alt hierarchies
IF( pDim @<> '' );
    IF( ( Scan( ':', vDim ) = 0 & Scan( ':', pDim ) = 0 ) % ( Scan( ':', vDim ) > 0 & Scan( ':', pDim ) > 0 ) );
        IF( pDim @<> vDim );
            ItemSkip;
        EndIF;
    Else;
        IF( pDim @<> SubSt( vDim, 1, Scan( ':', vDim ) - 1 ) );
            ItemSkip;
        EndIF;
    EndIF;
EndIF;

# Check for default hierarchy (already handled at dimension level) unless default hierarchy explicitly given as pDim to avoid double-processing
If( pDim @<> vDim & vDim @= ElPar( cDimTgt, vDim, 1 ) |':'| ElPar( cDimTgt, vDim, 1 ) );
    ItemSkip;
EndIf;

# Check for control objects
vFirstLetter = SubSt( vDim, 1, 1 );
If( vFirstLetter @= '}'  & SubSt( vDim, 1, 4 ) @<> '}APQ' );
    If( pSkipControlObj @= '1' );
        ItemSkip;
    EndIf;
EndIf;

# Check dimension not empty
If( DimSiz( vDim ) = 0 );
    ItemSkip;
EndIf;

# Check dimension size (subset generation can be long for very large dimensions). Unless matching pDim
IF( pForceLargeDimRefresh @<> '1' );
    IF( pDim @= '' & DimSiz( vDim ) > cMaxDimSiz );
        ItemSkip;
    Else;
        IF( ( Scan( ':', vDim ) = 0 & Scan( ':', pDim ) = 0 ) % ( Scan( ':', vDim ) > 0 & Scan( ':', pDim ) > 0 ) );
            IF( pDim @<> vDim & DimSiz( vDim ) > cMaxDimSiz );
                ItemSkip;
            EndIF;
        Else;
            IF( pDim @<> SubSt( vDim, 1, Scan( ':', vDim ) - 1 ) & DimSiz( vDim ) > cMaxDimSiz );
                ItemSkip;
            EndIF;
        EndIF;
    EndIF;
EndIF;

# Determine primary dimension name
IF( Scan( ':', vDim ) > 0 );
    sDimMain = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
Else;
    sDimMain = vDim;
EndIF;

# Get "override" whether for individual dimension to switch off standard subset although globally switched on
nSubAllNcode    = CellGetN( cCubDimDefault, vDim, 'Std All N Elements Principal',   'Numeric' );
nSubAllN        = CellGetN( cCubDimDefault, vDim, 'Std All N Elements',             'Numeric' );
nSubAllC        = CellGetN( cCubDimDefault, vDim, 'Std All C Elements',             'Numeric' );
nSubTop         = CellGetN( cCubDimDefault, vDim, 'Std Top Elements',               'Numeric' );
nSubAll         = CellGetN( cCubDimDefault, vDim, 'Std All Elements',               'Numeric' );
nSubDefaultMem  = CellGetN( cCubDimDefault, vDim, 'Std Default Member Subset',      'Numeric' );

### All Elements

# For name conversion use primary dimension name only not dim:hier ! (Else subset creation will fail due to illegal FSO character ":")
# Determine if subset names need to be converted if dimension name included
IF( Scan( '<dimension>', cSubAll ) = 0 );
    sSubAll = cSubAll;
ElseIF( Scan( '<dimension>', cSubAll ) = 1 );
    sSubAll = sDimMain | SubSt( cSubAll, 12, Long( cSubAll ) - 11 );
Else;
    sSubAll = SubSt( cSubAll, 1, Scan( '<dimension>', cSubAll ) - 1 ) | sDimMain | SubSt( cSubAll, Scan( '<dimension>', cSubAll ) + 11, Long( cSubAll ) - Scan( '<dimension>', cSubAll ) + 10 );
EndIF;

sSubName = sSubAll;
IF( bSubAll > 0 & nSubAll = 0 ); 

    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Creating subset: ' | sSubName );
    EndIF;
    
    IF( SubsetExists( vDim, sSubName ) = 0 );
        SubsetCreate( vDim, sSubName ); 
    EndIF;
    IF( SubsetGetSize( vDim, sSubName ) = DimSiz( vDim ) );
        # Do Nothing
    Else;
        SubsetIsAllSet( vDim, sSubName, 1 );
    EndIF;
    
    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Subset created with ' | NumberToString( SubsetGetSize( vDim, sSubName ) ) | ' members.'  );
    EndIF;

Else;
    IF( SubsetExists( vDim, sSubName ) = 1 );
        ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
    EndIF;
  
EndIF;

### All N Elements

# Determine if subset names need to be converted if dimension name included
IF( Scan( '<dimension>', cSubAllN ) = 0 );
    sSubAllN = cSubAllN;
ElseIF( Scan( '<dimension>', cSubAllN ) = 1 );
    sSubAllN = sDimMain | SubSt( cSubAllN, 12, Long( cSubAllN ) - 11 );
Else;
    sSubAllN = SubSt( cSubAllN, 1, Scan( '<dimension>', cSubAllN ) - 1 ) | sDimMain | SubSt( cSubAllN, Scan( '<dimension>', cSubAllN ) + 11, Long( cSubAllN ) - Scan( '<dimension>', cSubAllN ) + 10 );
EndIF;

sSubName = sSubAllN;
IF( bSubAllN > 0 & nSubAllN = 0 ); 

    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Creating subset: ' | sSubName );
    EndIF;

    sMDX = Expand('{TM1FILTERBYLEVEL( TM1SUBSETALL( [%vDim%] ), 0)}');
    IF( pSortOrder @< '1' % DimIx( cDimTime, vDim ) > 0 );
        # Time dimension or index sort
        sMDX = Expand('{TM1SORTBYINDEX( %sMDX%, ASC)}');
    Else;
        # Alpha sort (on principal name)
        sMDX = Expand('{TM1SORT( %sMDX%, ASC)}');
    EndIF;
    
    If( SubsetExists( vDim, sSubName ) = 1 );
        SubsetMDXSet( vDim, sSubName, sMDX );
    Else;
        SubsetCreatebyMDX( sSubName, sMDX, vDim, 0 );
    EndIf;
    SubsetElementInsert( vDim, sSubName, DimNm( vDim, 1 ),  1 );
    SubsetElementDelete( vDim, sSubName, 1 );
    IF( SubsetGetSize( vDim, sSubName ) = 0 );
        # If subset has no elements then destroy it
        nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
        If( nRet <> ProcessExitNormal() );
             LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
        EndIf;
    Else;
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Subset created with ' | NumberToString( SubsetGetSize( vDim, sSubName ) ) | ' members.'  );
        EndIF;
    EndIF;

Else;

    IF( SubsetExists( vDim, sSubName ) = 1 );
        nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
        If( nRet <> ProcessExitNormal() );
        LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
        EndIf;
    EndIF;
  
EndIF;

### All N Elements Code (PrincipalName)

# Determine if subset names need to be converted if dimension name included
IF( Scan( '<dimension>', cSubAllNCode ) = 0 );
    sSubAllNCode = cSubAllNCode;
ElseIF( Scan( '<dimension>', cSubAllNCode ) = 1 );
    sSubAllNCode = sDimMain | SubSt( cSubAllNCode, 12, Long( cSubAllNCode ) - 11 );
Else;
    sSubAllNCode = SubSt( cSubAllNCode, 1, Scan( '<dimension>', cSubAllNCode ) - 1 ) | sDimMain | SubSt( cSubAllNCode, Scan( '<dimension>', cSubAllNCode ) + 11, Long( cSubAllNCode ) - Scan( '<dimension>', cSubAllNCode ) + 10 );
EndIF;

sSubName = sSubAllNCode;
IF( bSubAllNCode > 0 & nSubAllNCode = 0 ); 

    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Creating subset: ' | sSubName );
    EndIF;

    sMDX = Expand('{TM1FILTERBYLEVEL( TM1SUBSETALL( [%vDim%] ), 0)}');
    IF( pSortOrder @< '1' % DimIx( cDimTime, vDim ) > 0 );
        # Time dimension or index sort
        sMDX = Expand('{TM1SORTBYINDEX( %sMDX%, ASC)}');
    Else;
        # Alpha sort (on principal name)
        sMDX = Expand('{TM1SORT( %sMDX%, ASC)}');
    EndIF;
    
    If( SubsetExists( vDim, sSubName ) = 1 );
        SubsetMDXSet( vDim, sSubName, sMDX );
    Else;
        SubsetCreatebyMDX( sSubName, sMDX, vDim, 0 );
    EndIf;
    SubsetElementInsert( vDim, sSubName, DimNm( vDim, 1 ),  1 );
    SubsetElementDelete( vDim, sSubName, 1 );
    IF( SubsetGetSize( vDim, sSubName ) = 0 );
        # If subset has no elements then destroy it
        nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
        If( nRet <> ProcessExitNormal() );
            LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
        EndIf;
    Else;
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Subset created with ' | NumberToString( SubsetGetSize( vDim, sSubName ) ) | ' members.'  );
        EndIF;
    EndIF;

Else;

    IF( SubsetExists( vDim, sSubName ) = 1 );
        nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
        If( nRet <> ProcessExitNormal() );
        LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
        EndIf;
    EndIF;
  
EndIF;

### All C Elements

# Determine if subset names need to be converted if dimension name included
IF( Scan( '<dimension>', cSubAllC ) = 0 );
    sSubAllC = cSubAllC;
ElseIF( Scan( '<dimension>', cSubAllC ) = 1 );
    sSubAllC = sDimMain | SubSt( cSubAllC, 12, Long( cSubAllC ) - 11 );
Else;
    sSubAllC = SubSt( cSubAllC, 1, Scan( '<dimension>', cSubAllC ) - 1 ) | sDimMain | SubSt( cSubAllC, Scan( '<dimension>', cSubAllC ) + 11, Long( cSubAllC ) - Scan( '<dimension>', cSubAllC ) + 10 );
EndIF;

sSubName = sSubAllC;
IF( bSubAllC > 0 & nSubAllC = 0 ); 

    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Creating subset: ' | sSubName );
    EndIF;
    
    IF( DnLev( vDim ) >= 2 );
    
        sMDX = '{HIERARCHIZE( {EXCEPT( {TM1SubsetAll([' | vDim | '] )}, {TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | vDim | '] )}, 0)} )} )}';
        If( SubsetExists( vDim, sSubName ) = 1 );
            SubsetMDXSet( vDim, sSubName, sMDX );
        Else;
            SubsetCreatebyMDX( sSubName, sMDX, vDim, 0 );
        EndIf;
        SubsetElementInsert( vDim, sSubName, DimNm( vDim, 1 ),  1 );
        SubsetElementDelete( vDim, sSubName, 1 );
        IF( SubsetGetSize( vDim, sSubName ) = 0 );
            # If subset has no elements then destroy it
            nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
            If( nRet <> ProcessExitNormal() );
                LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
            EndIf;
        Else;
            IF( pDebug @>= '1' );
                AsciiOutput( sDebugFile, 'Subset created with ' | NumberToString( SubsetGetSize( vDim, sSubName ) ) | ' members.'  );
            EndIF;
        EndIF;

    Else;

        IF( SubsetExists( vDim, sSubName ) = 1 );
            nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
            If( nRet <> ProcessExitNormal() );
                LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
            EndIf;
        EndIF;
        
    EndIf;
EndIF;

### Default Element

# Update }DimensionProperties and }HierarchyProperties from }APQ Dimension Defaults
sDefMbr = '';
sDefMbr = CellGetS( cCubDimDefault, vDim, 'Default_Member', 'String' );
If( DimIx( vDim, sDefMbr ) > 0 );
    CellPutS( sDefMbr, cCubDimInfo, vDim, 'Default_Member' );
    CellPutS( sDefMbr, cCubHierInfo, vDim, 'hierarchy0', 'defaultMember' );
EndIf;

# Determine if subset names need to be converted if dimension name included
IF( Scan( '<dimension>', cSubDefaultMem ) = 0 );
   sSubDefaultMem = cSubDefaultMem;
ElseIF( Scan( '<dimension>', cSubDefaultMem ) = 1 );
  sSubDefaultMem = sDimMain | SubSt( cSubDefaultMem, 12, Long( cSubDefaultMem ) - 11 );
Else;
  sSubDefaultMem = SubSt( cSubDefaultMem, 1, Scan( '<dimension>', cSubDefaultMem ) - 1 ) | sDimMain | SubSt( cSubDefaultMem, Scan( '<dimension>', cSubDefaultMem ) + 11, Long( cSubDefaultMem ) - Scan( '<dimension>', cSubDefaultMem ) + 10 );
EndIF;

sSubName = sSubDefaultMem;
IF( bSubDefaultMem > 0 & nSubDefaultMem = 0 );
    
    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Creating subset: ' | sSubName );
    EndIF;
    
    If( SubsetExists( vDim, sSubName ) = 1);
        SubsetDeleteAllElements( vDim, sSubName );
        If( DimIx( vDim, sDefMbr ) > 0 );
            SubsetElementInsert( vDim, sSubName, sDefMbr, 1 );
        EndIf;
    ElseIf( DimIx( vDim, sDefMbr ) > 0 );
        SubsetCreate( vDim, sSubName );
        SubsetElementInsert( vDim, sSubName, sDefMbr, 1 );
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Subset created with ' | NumberToString( SubsetGetSize( vDim, sSubName ) ) | ' members.'  );
        EndIF;
    Else;
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Default member not found for dimension ' | vDim );
        EndIF;
    EndIf;

Else;

  IF( SubsetExists( vDim, sSubName ) = 1 );
    nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
    If( nRet <> ProcessExitNormal() );
      LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
    EndIf;
  EndIF;
  
EndIF;

### Top Element

# Determine if subset names need to be converted if dimension name included
IF( Scan( '<dimension>', cSubTop ) = 0 );
    sSubTop = cSubTop;
ElseIF( Scan( '<dimension>', cSubTop ) = 1 );
    sSubTop = sDimMain | SubSt( cSubTop, 12, Long( cSubTop ) - 11 );
Else;
    sSubTop = SubSt( cSubTop, 1, Scan( '<dimension>', cSubTop ) - 1 ) | sDimMain | SubSt( cSubTop, Scan( '<dimension>', cSubTop ) + 11, Long( cSubTop ) - Scan( '<dimension>', cSubTop ) + 10 );
EndIF;

sSubName = sSubTop;
IF( bSubTop > 0 & nSubTop = 0 );

    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, 'Creating subset: ' | sSubName );
    EndIF;

    IF( SubsetExists( vDim, sSubName ) = 1);
        SubsetDeleteAllElements( vDim, sSubName );
    EndIF;

    IF( DnLev( vDim ) >= 2 );
        sEleTop = cEleTop;
        IF(  Scan( '<dimension>', cEleTop ) > 0 );
            IF( Scan( '<dimension>', cEleTop ) = 1 );
                sEleTop = vDim | SubSt( cEleTop, 12, Long( cEleTop ) - 11 );
            Else;
                sEleTop = SubSt( cEleTop, 1, Scan( '<dimension>', cEleTop ) - 1 ) | vDim | SubSt( cEleTop, Scan( '<dimension>', cEleTop ) + 11, Long( cEleTop ) - Scan( '<dimension>', cEleTop ) + 10 );
            EndIF;
        EndIF;
        IF( DimIx( vDim, sEleTop ) > 0 );
            sMDX = '{[' | vDim | '].[' | sEleTop | '].Children}';
        Else;
            sMDX = '{EXCEPT( {FILTER( {TM1SubsetAll([' | vDim | '] )}, [' | vDim | '].CurrentMember.Parent.Name = "" )}, {TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | vDim | '] )}, 0)} )}';
        EndIF;
        
        If( SubsetExists( vDim, sSubName ) = 1 );
            SubsetMDXSet( vDim, sSubName, sMDX );
        Else;
            SubsetCreatebyMDX( sSubName, sMDX, vDim, 0 );
        EndIf;
        SubsetElementInsert( vDim, sSubName, DimNm( vDim, 1 ),  1 );
        SubsetElementDelete( vDim, sSubName, 1 );
        IF( SubsetGetSize( vDim, sSubName ) = 0 );
            # If subset has no elements then destroy it
            nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
            If( nRet <> ProcessExitNormal() );
                LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
            EndIf;
        Else;
            IF( pDebug @>= '1' );
                AsciiOutput( sDebugFile, 'Subset created with ' | NumberToString( SubsetGetSize( vDim, sSubName ) ) | ' members.'  );
            EndIF;
        EndIF;

    Else;
    
        IF( SubsetExists( vDim, sSubName ) = 1 );
            nRet = ExecuteProcess( '}bedrock.hier.sub.delete', 'pLogOutput', nDebug, 'pDim', vDim, 'pHier', '', 'pSub', sSubName, 'pDelim', sDelim, 'pMode', cMode );
            If( nRet <> ProcessExitNormal() );
                LogOutput( 'ERROR', Expand('Unable to delete subset %sSubName% from dimension %vDim%.') );
            EndIf;
        EndIF;
  
    EndIf;  
EndIF;

IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, '#---------------------------------------------------------------------------------#' );
EndIF;

######################
### END Metadata

574,398
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

sDebugFile = cDebugFile | '_Data.log';
IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, vDim );
EndIF;

# Skip new PA dimensions
If( SubSt( vDim, 1, 9 ) @= '}Subsets_' % SubSt( vDim, 1, 13 ) @= '}Hierarchies_' % SubSt( vDim, 1, 7 ) @= '}Views_' );
    ItemSkip;
EndIf;

IF( DimIx( cDimTgt, vDim ) = 0 );
    ItemSkip;
EndIF;

# If pDim parameter is used then skip if dimension doesn't match. If dimension given then include alt hierarchies
IF( pDim @<> '' );
    IF( ( Scan( ':', vDim ) = 0 & Scan( ':', pDim ) = 0 ) % ( Scan( ':', vDim ) > 0 & Scan( ':', pDim ) > 0 ) );
        IF( pDim @<> vDim );
            ItemSkip;
        EndIF;
    Else;
        IF( pDim @<> SubSt( vDim, 1, Scan( ':', vDim ) - 1 ) );
            ItemSkip;
        EndIF;
    EndIF;
EndIF;

# Check for default hierarchy (already handled at dimension level) unless default hierarchy explicitly given as pDim to avoid double-processing
If( pDim @<> vDim & vDim @= ElPar( cDimTgt, vDim, 1 ) |':'| ElPar( cDimTgt, vDim, 1 ) );
    ItemSkip;
EndIf;

# Check dimension not empty
If( DimSiz( vDim ) = 0 );
    ItemSkip;
EndIf;

# If run with pDim parameter non-blank then even if the dimension is above the cutoff then we will proceed 
IF( pForceLargeDimRefresh @<> '1' );
    IF( pDim @= '' & DimSiz( vDim ) > cMaxDimSiz );
        ItemSkip;
    Else;
        IF( ( Scan( ':', vDim ) = 0 & Scan( ':', pDim ) = 0 ) % ( Scan( ':', vDim ) > 0 & Scan( ':', pDim ) > 0 ) );
            IF( pDim @<> vDim & DimSiz( vDim ) > cMaxDimSiz );
                ItemSkip;
            EndIF;
        Else;
            IF( pDim @<> SubSt( vDim, 1, Scan( ':', vDim ) - 1 ) & DimSiz( vDim ) > cMaxDimSiz );
                ItemSkip;
            EndIF;
        EndIF;
    EndIF;
EndIF;

# Determine primary dimension name
IF( Scan( ':', vDim ) > 0 );
    sDimMain = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
    sHier = SubSt( vDim, Scan( ':', vDim ) + 1, Long(vDim) );
Else;
      sDimMain = vDim;
      sHier = vDim;
EndIF;

# For name conversion use primary dimension name only not dim:hier ! (Else subset creation will fail due to illegal FSO character ":")
# Determine if subset names need to be converted if dimension name included

# All Elements
IF( Scan( '<dimension>', cSubAll ) = 0 );
    sSubAll = cSubAll;
ElseIF( Scan( '<dimension>', cSubAll ) = 1 );
    sSubAll = sDimMain | SubSt( cSubAll, 12, Long( cSubAll ) - 11 );
Else;
    sSubAll = SubSt( cSubAll, 1, Scan( '<dimension>', cSubAll ) - 1 ) | sDimMain | SubSt( cSubAll, Scan( '<dimension>', cSubAll ) + 11, Long( cSubAll ) - Scan( '<dimension>', cSubAll ) + 10 );
EndIF;

# All N elements
IF( Scan( '<dimension>', cSubAllN ) = 0 );
    sSubAllN = cSubAllN;
ElseIF( Scan( '<dimension>', cSubAllN ) = 1 );
    sSubAllN = sDimMain | SubSt( cSubAllN, 12, Long( cSubAllN ) - 11 );
Else;
    sSubAllN = SubSt( cSubAllN, 1, Scan( '<dimension>', cSubAllN ) - 1 ) | sDimMain | SubSt( cSubAllN, Scan( '<dimension>', cSubAllN ) + 11, Long( cSubAllN ) - Scan( '<dimension>', cSubAllN ) + 10 );
EndIF;

# All N elements code
IF( Scan( '<dimension>', cSubAllNCode ) = 0 );
    sSubAllNCode = cSubAllNCode;
ElseIF( Scan( '<dimension>', cSubAllNCode ) = 1 );
    sSubAllNCode = sDimMain | SubSt( cSubAllNCode, 12, Long( cSubAllNCode ) - 11 );
Else;
    sSubAllNCode = SubSt( cSubAllNCode, 1, Scan( '<dimension>', cSubAllNCode ) - 1 ) | sDimMain | SubSt( cSubAllNCode, Scan( '<dimension>', cSubAllNCode ) + 11, Long( cSubAllNCode ) - Scan( '<dimension>', cSubAllNCode ) + 10 );
EndIF;

# All C elements
IF( Scan( '<dimension>', cSubAllC ) = 0 );
    sSubAllC = cSubAllC;
ElseIF( Scan( '<dimension>', cSubAllC ) = 1 );
    sSubAllC = sDimMain | SubSt( cSubAllC, 12, Long( cSubAllC ) - 11 );
Else;
    sSubAllC = SubSt( cSubAllC, 1, Scan( '<dimension>', cSubAllC ) - 1 ) | sDimMain | SubSt( cSubAllC, Scan( '<dimension>', cSubAllC ) + 11, Long( cSubAllC ) - Scan( '<dimension>', cSubAllC ) + 10 );
EndIF;

# Default Member
IF( Scan( '<dimension>', cSubDefaultMem ) = 0 );
    sSubDefaultMem = cSubDefaultMem;
ElseIF( Scan( '<dimension>', cSubDefaultMem ) = 1 );
    sSubDefaultMem = sDimMain | SubSt( cSubDefaultMem, 12, Long( cSubDefaultMem ) - 11 );
Else;
    sSubDefaultMem = SubSt( cSubDefaultMem, 1, Scan( '<dimension>', cSubDefaultMem ) - 1 ) | sDimMain | SubSt( cSubDefaultMem, Scan( '<dimension>', cSubDefaultMem ) + 11, Long( cSubDefaultMem ) - Scan( '<dimension>', cSubDefaultMem ) + 10 );
EndIF;

# Top elements
IF( Scan( '<dimension>', cSubTop ) = 0 );
    sSubTop = cSubTop;
ElseIF( Scan( '<dimension>', cSubTop ) = 1 );
    sSubTop = sDimMain | SubSt( cSubTop, 12, Long( cSubTop ) - 11 );
Else;
    sSubTop = SubSt( cSubTop, 1, Scan( '<dimension>', cSubTop ) - 1 ) | sDimMain | SubSt( cSubTop, Scan( '<dimension>', cSubTop ) + 11, Long( cSubTop ) - Scan( '<dimension>', cSubTop ) + 10 );
EndIF;

#Region - Maintain subset framework
### Add subset to framework if not already existing
### For }APQ Dimension Subsets use primary dimension name only not dim:hier
sSubName = sSubAll;
If( SubsetExists( vDim, sSubName ) = 1 & DimIx( cDimSub1, sDimMain |':'| sHier |':'| sSubName ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %sDimMain%:%sHier%:%sSubName%') );
    If( DimIx( cDimSub1, sDimMain ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', sDimMain, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', sDimMain, 1 ); 
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier |':'| sSubName, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain, sDimMain |':'| sHier, 1 );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain |':'| sHier, sDimMain |':'| sHier |':'| sSubName, 1 );
    If( SubsetExists( cDimSub1, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub1, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub1, sDimMain, sDimMain |':'| sHier |':'| sSubName, 0 );
    If( DimIx( cDimSub2, sSubName ) = 0 ); DimensionElementInsertDirect( cDimSub2, '', sSubName, 'N' ); EndIf;
    If( SubsetExists( cDimSub2, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub2, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub2, sDimMain, sSubName, 0 );
    nSubSiz = SubsetGetSize( vDim, sSubName );
    CellPutN( nSubSiz, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'ElementCount' );
    CellPutS( vDim, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'DimensionName' );
    CellPutS( sSubName, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'SubsetName' );
EndIf;

sSubName = sSubAllN;
If( SubsetExists( vDim, sSubName ) = 1 & DimIx( cDimSub1, sDimMain |':'| sHier |':'| sSubName ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %sDimMain%:%sHier%:%sSubName%') );
    If( DimIx( cDimSub1, sDimMain ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', sDimMain, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', sDimMain, 1 ); 
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier |':'| sSubName, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain, sDimMain |':'| sHier, 1 );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain |':'| sHier, sDimMain |':'| sHier |':'| sSubName, 1 );
    If( SubsetExists( cDimSub1, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub1, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub1, sDimMain, sDimMain |':'| sHier |':'| sSubName, 0 );
    If( DimIx( cDimSub2, sSubName ) = 0 ); DimensionElementInsertDirect( cDimSub2, '', sSubName, 'N' ); EndIf;
    If( SubsetExists( cDimSub2, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub2, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub2, sDimMain, sSubName, 0 );
    nSubSiz = SubsetGetSize( vDim, sSubName );
    CellPutN( nSubSiz, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'ElementCount' );
    CellPutS( vDim, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'DimensionName' );
    CellPutS( sSubName, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'SubsetName' );
EndIf;

sSubName = sSubAllNCode;
If( SubsetExists( vDim, sSubName ) = 1 & DimIx( cDimSub1, sDimMain |':'| sHier |':'| sSubName ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %sDimMain%:%sHier%:%sSubName%') );
    If( DimIx( cDimSub1, sDimMain ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', sDimMain, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', sDimMain, 1 ); 
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier |':'| sSubName, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain, sDimMain |':'| sHier, 1 );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain |':'| sHier, sDimMain |':'| sHier |':'| sSubName, 1 );
    If( SubsetExists( cDimSub1, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub1, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub1, sDimMain, sDimMain |':'| sHier |':'| sSubName, 0 );
    If( DimIx( cDimSub2, sSubName ) = 0 ); DimensionElementInsertDirect( cDimSub2, '', sSubName, 'N' ); EndIf;
    If( SubsetExists( cDimSub2, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub2, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub2, sDimMain, sSubName, 0 );
    nSubSiz = SubsetGetSize( vDim, sSubName );
    CellPutN( nSubSiz, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'ElementCount' );
    CellPutS( vDim, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'DimensionName' );
    CellPutS( sSubName, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'SubsetName' );
EndIf;

sSubName = sSubAllC;
If( SubsetExists( vDim, sSubName ) = 1 & DimIx( cDimSub1, sDimMain |':'| sHier |':'| sSubName ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %sDimMain%:%sHier%:%sSubName%') );
    If( DimIx( cDimSub1, sDimMain ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', sDimMain, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', sDimMain, 1 ); 
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier |':'| sSubName, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain, sDimMain |':'| sHier, 1 );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain |':'| sHier, sDimMain |':'| sHier |':'| sSubName, 1 );
    If( SubsetExists( cDimSub1, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub1, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub1, sDimMain, sDimMain |':'| sHier |':'| sSubName, 0 );
    If( DimIx( cDimSub2, sSubName ) = 0 ); DimensionElementInsertDirect( cDimSub2, '', sSubName, 'N' ); EndIf;
    If( SubsetExists( cDimSub2, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub2, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub2, sDimMain, sSubName, 0 );
    nSubSiz = SubsetGetSize( vDim, sSubName );
    CellPutN( nSubSiz, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'ElementCount' );
    CellPutS( vDim, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'DimensionName' );
    CellPutS( sSubName, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'SubsetName' );
EndIf;

sSubName = sSubDefaultMem;
If( SubsetExists( vDim, sSubName ) = 1 & DimIx( cDimSub1, sDimMain |':'| sHier |':'| sSubName ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %sDimMain%:%sHier%:%sSubName%') );
    If( DimIx( cDimSub1, sDimMain ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', sDimMain, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', sDimMain, 1 ); 
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier |':'| sSubName, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain, sDimMain |':'| sHier, 1 );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain |':'| sHier, sDimMain |':'| sHier |':'| sSubName, 1 );
    If( SubsetExists( cDimSub1, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub1, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub1, sDimMain, sDimMain |':'| sHier |':'| sSubName, 0 );
    If( DimIx( cDimSub2, sSubName ) = 0 ); DimensionElementInsertDirect( cDimSub2, '', sSubName, 'N' ); EndIf;
    If( SubsetExists( cDimSub2, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub2, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub2, sDimMain, sSubName, 0 );
    nSubSiz = SubsetGetSize( vDim, sSubName );
    CellPutN( nSubSiz, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'ElementCount' );
    CellPutS( vDim, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'DimensionName' );
    CellPutS( sSubName, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'SubsetName' );
EndIf;

sSubName = sSubTop;
If( SubsetExists( vDim, sSubName ) = 1 & DimIx( cDimSub1, sDimMain |':'| sHier |':'| sSubName ) = 0 );
    bUpdateDirect = 1;
    LogOutput( 'INFO', Expand('Adding subset to framework %sDimMain%:%sHier%:%sSubName%') );
    If( DimIx( cDimSub1, sDimMain ) = 0 ); 
        DimensionElementInsertDirect( cDimSub1, '', sDimMain, 'C' ); 
        DimensionElementComponentAddDirect( cDimSub1, 'Total APQ Dimensions', sDimMain, 1 ); 
    EndIf;
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier, 'C' );
    DimensionElementInsertDirect( cDimSub1, '', sDimMain |':'| sHier |':'| sSubName, 'N' );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain, sDimMain |':'| sHier, 1 );
    DimensionElementComponentAddDirect( cDimSub1, sDimMain |':'| sHier, sDimMain |':'| sHier |':'| sSubName, 1 );
    If( SubsetExists( cDimSub1, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub1, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub1, sDimMain, sDimMain |':'| sHier |':'| sSubName, 0 );
    If( DimIx( cDimSub2, sSubName ) = 0 ); DimensionElementInsertDirect( cDimSub2, '', sSubName, 'N' ); EndIf;
    If( SubsetExists( cDimSub2, sDimMain ) = 0 ); 
        SubsetCreate( cDimSub2, sDimMain ); 
    EndIf;
    SubsetElementInsert( cDimSub2, sDimMain, sSubName, 0 );
    nSubSiz = SubsetGetSize( vDim, sSubName );
    CellPutN( nSubSiz, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'ElementCount' );
    CellPutS( vDim, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'DimensionName' );
    CellPutS( sSubName, cDimSub1, sDimMain |':'| sHier |':'| sSubName, 'SubsetName' );
EndIf;
#endRegion

#Region Set subset source
sSubName = sDimMain |':'| sHier |':'| sSubAll;
If( DimIx( cDimSub1, sSubName ) > 0 );
    CellPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
EndIf;

sSubName = sDimMain |':'| sHier |':'| sSubAllN;
If( DimIx( cDimSub1, sSubName ) > 0 );
    CellPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
EndIf;

sSubName = sDimMain |':'| sHier |':'| sSubAllNCode;
If( DimIx( cDimSub1, sSubName ) > 0 );
    CellPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
EndIf;

sSubName = sDimMain |':'| sHier |':'| sSubAllC;
If( DimIx( cDimSub1, sSubName ) > 0 );
    CellPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
EndIf;

sSubName = sDimMain |':'| sHier |':'| sSubDefaultMem;
If( DimIx( cDimSub1, sSubName ) > 0 );
    CellPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
EndIf;

sSubName = sDimMain |':'| sHier |':'| sSubTop;
If( DimIx( cDimSub1, sSubName ) > 0 );
    CellPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
    AttrPutS( cAPQSubSrc, cDimSub1, sSubName, 'Source' );
EndIf;
#EndRegion

### Attach alias to subset (alias from primary dim)
sAlias = CellGetS( cCubDimDefault, vDim, 'Default_Alias', 'String' );
IF( sAlias @= '' );
    IF( pDebug @>= '1' & CellGetN( cCubSysInfo, 'Std Alias 1', 'Numeric' ) = 1 );
        AsciiOutput( sDebugFile, 'No default alias found for subset display. Alias will not be set for dimension ' | vDim | '.' );
    ElseIF( pDebug @>= '1' & CellGetN( cCubSysInfo, 'Std Alias 1', 'Numeric' ) = 0 );
        AsciiOutput( sDebugFile, 'Std Alias disabled in settings cube. Alias will not be set.' );
    EndIF;
    ItemSkip;
Else;
    IF( DimIx( '}ElementAttributes_' | sDimMain, sAlias ) > 0 );
        IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, sAlias | ' will be applied for display of standard subsets for dimension ' | vDim | '.' );
        EndIF;
    Else;
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, sAlias | ' does not exist in ' | vDim | '. Setting alias will be skipped.' );
        EndIF;
        ItemSkip;
    EndIF;
EndIF;

IF( SubsetExists( vDim, sSubAllN ) = 1 );
    SubsetAliasSet( vDim, sSubAllN, sAlias );
EndIF;

IF( SubsetExists( vDim, sSubAllC ) = 1 );
    SubsetAliasSet( vDim, sSubAllC, sAlias );
EndIF;

IF( SubsetExists( vDim, sSubAll ) = 1 );
    SubsetAliasSet( vDim, sSubAll, sAlias );
EndIF;

IF( SubsetExists( vDim, sSubTop ) = 1 );
    SubsetAliasSet( vDim, sSubTop, sAlias );
EndIF;

IF( SubsetExists( vDim, sSubDefaultMem ) = 1 );
    SubsetAliasSet( vDim, sSubDefaultMem, sAlias );
EndIF;

IF( pDebug @>= '1' & sAlias @<> '' );
    AsciiOutput( sDebugFile, sAlias | ' set as alias for standard subsets.' );
EndIF;

IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, '#---------------------------------------------------------------------------------#' );
EndIF;

######################
### END Data
575,36
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

# Check for direct dimension updates
If( bUpdateDirect > 0 );
    DimensionUpdateDirect( cDimSub1 );
    DimensionUpdateDirect( cDimSub2 );
EndIf;

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
