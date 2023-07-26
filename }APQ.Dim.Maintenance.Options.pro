601,100
602,"}APQ.Dim.Maintenance.Options"
562,"SUBSET"
586,"}APQ Item Index"
585,"}APQ Item Index"
564,
565,"sd=yIi`xJwdNO6LXGf7y<=D\mrP23pW:t14t2zJpvdu21dHzH<F9lgy2qThGs?1DCAAd5hN1:T:u<bWzpW=ifN87ukYRt8wBmrx4]yJrPW_C4vqV8ciIoW;@p<Nq^syym30=x_n=RJxKYUS:pz_8]y4qj1\6L@GN\YdK5v64LWe3JZVNzb7G3gQ46v_MQNle2:mFJfrm"
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
571,All
569,0
592,0
599,1000
560,8
pDoProcessLogging
pDimSource
pDimTarget
pMode
pHierOrSub
pToLevel
pAttr
pDebug
561,8
2
2
2
2
2
2
2
2
590,8
pDoProcessLogging,"1"
pDimSource,""
pDimTarget,""
pMode,""
pHierOrSub,""
pToLevel,"0"
pAttr,"1"
pDebug,"0"
637,8
pDoProcessLogging,"Optional: Log to process logging cube"
pDimSource,"Mandatory: Source Dimension (or hierarchy if specified with dim:hier)"
pDimTarget,"Target Dimension (Blank = use default name from }APQ Settings). For pMode=5 leave blank"
pMode,"Mandatory: 1=Copy 2=Copy as Flat 3=Copy Subset as dimension 4=Copy Hier as dimension 5=Insert Dummy Ns 6=Delete orphan Cs 7=Allocate orphan Ns 8=Top rollup node 9=Insert NA Ele"
pHierOrSub,"Only if pMode=3 the subset to copy OR pMode=4 the top node of the hierarchy to copy to dimension"
pToLevel,"Optional: Only used if pMode=4 to optionally truncate the hierarchy to not finish at the leaf of the source or pMode=5 to limit Dummy N insertion to particular level"
pAttr,"Optional: Include attributes if doing dimension copy?"
pDebug,"Optional: Debugging 0=false 1=true"
577,1
vEle
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
572,374
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
### Perform a standard set of extended dimension maintenance activities on any dimension hierarchy
### Mode 1/ Copy dimension using Bedrock.Dim.Clone
### Mode 2/ Copy dimension to a Flat using Bedrock.Dim.CloneFromSubset.Flat
### Mode 3/ Copy subset to a dimension using Bedrock.Dim.CloneFromSubset
### Mode 4/ Copy rollup to a dimension with optional pLevelTo parameter to truncate the rollup so theat the selected C level is leaf in the target dimension
### Mode 5/ Insert "Dummy N" element and add to each consolidation node in the target dimension with optional pLevelTo parameter to limit Dummy N insertion to particular level of the hierarchy
### Mode 6/ Delete orphan consolidations by calling Bedrock.Dim.EmptyConsols.Delete
### Mode 7/ Find and group orphan N elements to placeholder node as defined in }APQ Settings
### Mode 8/ Find and group all C elements without an ultimate parent under the "rollups" top node defined in }APQ Settings
### Mode 9/ Insert standard NA element into the dimension and add to the standard total element (if found) & add to each element of "top nodes" subset (if found).

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pDimSource:%pDimSource% & pDimTarget:%pDimTarget% & pMode:%pMode% & pHierOrSub:%pHierOrSub% & pToLevel:%pToLevel% & pAttr:%pAttr%');
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

cCubSettings    = '}APQ Settings';
cDimCopy        = CellGetS( cCubSettings, 'Std Copy of Dimension', 'String' );
cDimFlat        = CellGetS( cCubSettings, 'Std Flat Dimension', 'String' );
cNAELe          = CellGetS( cCubSettings, 'Std NA Element', 'String' );
cDummyN         = CellGetS( cCubSettings, 'Std Dummy N Element', 'String' );
cUnalloc        = CellGetS( cCubSettings, 'Std Unallocated Node', 'String' );
cTopNode        = CellGetS( cCubSettings, 'Std Top Node Name', 'String' );
cTopNodeSub     = CellGetS( cCubSettings, 'Std Top Elements', 'String' );
cStdTotal       = CellGetS( cCubSettings, 'Std Default Hierarchy', 'String' );
cUDCRollup      = CellGetS( cCubSettings, 'Std UDC Parent Node Name', 'String' );
cUnallocNode    = CellGetS( cCubSettings, 'Std Unallocated Node', 'String' );

cDebugDir       = CellGetS( cCubSettings, 'Location: Debugging', 'String' );
cDebugDir       = cDebugDir | IF( SubSt( cDebugDir, Long( cDebugDir ) , 1 ) @= '\', '', '\' );
cTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugFile      = cDebugDir | GetProcessName() | '.' | cTimeStamp | '.Debug';

nToLevel        = StringToNumber( pToLevel );
nDebug          = StringToNumber( pDebug );
nAttr           = StringToNumber( pAttr );

nErr            = 0;
sErr            = '';

### set pDimTarget if blank

pDimTarget      = If( pMode @>= '5', pDimSource, pDimTarget );
    
### Initialise Debug ###

If( pDebug @>= '1' );
  DatasourceASCIIQuoteCharacter = '';

  # Set debug file name
  sDebugFile = cDebugFile | '.Prolog.txt';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: ' );
  AsciiOutput( sDebugFile, 'pDimSource: ' | pDimSource );
  AsciiOutput( sDebugFile, 'pDimTarget: ' | pDimTarget );
  AsciiOutput( sDebugFile, 'pMode: ' | pMode );
  AsciiOutput( sDebugFile, 'pHierOrSub: ' | pHierOrSub );
  AsciiOutput( sDebugFile, 'pToLevel: ' | pToLevel );
  AsciiOutput( sDebugFile, 'pAttr: ' | pAttr );
  AsciiOutput( sDebugFile, '' );

EndIf;

### In case source dimenson is an alternate hierarchy then we need to handle the colon in the object name

IF( Scan( ':', pDimSource ) = 0 );
    sDimSourceNm = pDimSource;
Else;
    sDimSourceNm = SubSt( pDimSource, 1, Scan( ':', pDimSource ) - 1 ) |'_'| SubSt( pDimSource, Scan( ':', pDimSource ) + 1, Scan( ':', pDimSource ) - 1 );
EndIF;

IF( Scan( ':', pDimTarget ) = 0 );
    sDimTargetNm = pDimTarget;
    sHierTargetNm = pDimTarget;
Else;
    sHierTargetNm = SubSt( pDimTarget, 1, Scan( ':', pDimTarget ) - 1 ) |'_'| SubSt( pDimTarget, Scan( ':', pDimTarget ) + 1, Scan( ':', pDimTarget ) - 1 );
    sDimTargetNm = SubSt( pDimTarget, 1, Scan( ':', pDimTarget ) - 1 );
EndIF;

### Convert naming convention into names

IF( Scan( '<dimension>', cDimCopy ) = 0 );
  sDimCopy = sDimSourceNm | ' copy';
ElseIF( Scan( '<dimension>', cDimCopy ) = 1 );
  sDimCopy = sDimSourceNm | SubSt( cDimCopy, 12, Long( cDimCopy ) - 11 );
Else;
  sDimCopy = SubSt( cDimCopy, 1, Scan( '<dimension>', cDimCopy ) - 1 ) | sDimSourceNm | SubSt( cDimCopy, Scan( '<dimension>', cDimCopy ) + 11, Long( cDimCopy ) - Scan( '<dimension>', cDimCopy ) + 10 );
EndIF;
IF( Scan( '<dimension>', cDimFlat ) = 0 );
  sDimFlat = sDimSourceNm | ' flat copy';
ElseIF( Scan( '<dimension>', cDimFlat ) = 1 );
  sDimFlat = sDimSourceNm | SubSt( cDimFlat, 12, Long( cDimFlat ) - 11 );
Else;
  sDimFlat = SubSt( cDimFlat, 1, Scan( '<dimension>', cDimFlat ) - 1 ) | sDimSourceNm | SubSt( cDimFlat, Scan( '<dimension>', cDimFlat ) + 11, Long( cDimFlat ) - Scan( '<dimension>', cDimFlat ) + 10 );
EndIF;
IF( Scan( '<dimension>', cUnalloc ) = 0 );
  cUnalloc = cUnalloc;
ElseIF( Scan( '<dimension>', cUnalloc ) = 1 );
  cUnalloc = sHierTargetNm | SubSt( cUnalloc, 12, Long( cUnalloc ) - 11 );
Else;
  cUnalloc = SubSt( cUnalloc, 1, Scan( '<dimension>', cUnalloc ) - 1 ) | sHierTargetNm | SubSt( cUnalloc, Scan( '<dimension>', cUnalloc ) + 11, Long( cUnalloc ) - Scan( '<dimension>', cUnalloc ) + 10 );
EndIF;
IF( Scan( '<dimension>', cTopNode ) = 0 );
  cTopNode = cTopNode;
ElseIF( Scan( '<dimension>', cTopNode ) = 1 );
  cTopNode = sHierTargetNm | SubSt( cTopNode, 12, Long( cTopNode ) - 11 );
Else;
  cTopNode = SubSt( cTopNode, 1, Scan( '<dimension>', cTopNode ) - 1 ) | sHierTargetNm | SubSt( cTopNode, Scan( '<dimension>', cTopNode ) + 11, Long( cTopNode ) - Scan( '<dimension>', cTopNode ) + 10 );
EndIF;
IF( Scan( '<dimension>', cTopNodeSub ) = 0 );
  cTopNodeSub = cTopNodeSub;
ElseIF( Scan( '<dimension>', cTopNodeSub ) = 1 );
  cTopNodeSub = sHierTargetNm | SubSt( cTopNodeSub, 12, Long( cTopNodeSub ) - 11 );
Else;
  cTopNodeSub = SubSt( cTopNodeSub, 1, Scan( '<dimension>', cTopNodeSub ) - 1 ) | sHierTargetNm | SubSt( cTopNodeSub, Scan( '<dimension>', cTopNodeSub ) + 11, Long( cTopNodeSub ) - Scan( '<dimension>', cTopNodeSub ) + 10 );
EndIF;
IF( Scan( '<dimension>', cNAEle ) = 0 );
  cNAEle = cNAEle;
ElseIF( Scan( '<dimension>', cNAEle ) = 1 );
  cNAEle = sDimTargetNm | SubSt( cNAEle, 12, Long( cNAEle ) - 11 );
Else;
  cNAEle = SubSt( cNAEle, 1, Scan( '<dimension>', cNAEle ) - 1 ) | sDimTargetNm | SubSt( cNAEle, Scan( '<dimension>', cNAEle ) + 11, Long( cNAEle ) - Scan( '<dimension>', cNAEle ) + 10 );
EndIF;
IF( Scan( '<dimension>', cStdTotal ) = 0 );
  cStdTotal = cStdTotal;
ElseIF( Scan( '<dimension>', cStdTotal ) = 1 );
  cStdTotal = sDimTargetNm | SubSt( cStdTotal, 12, Long( cStdTotal ) - 11 );
Else;
  cStdTotal = SubSt( cStdTotal, 1, Scan( '<dimension>', cStdTotal ) - 1 ) | sDimTargetNm | SubSt( cStdTotal, Scan( '<dimension>', cStdTotal ) + 11, Long( cStdTotal ) - Scan( '<dimension>', cStdTotal ) + 10 );
EndIF;
IF( Scan( '<dimension>', cUDCRollup ) = 0 );
  cUDCRollup = cUDCRollup;
ElseIF( Scan( '<dimension>', cUDCRollup ) = 1 );
  cUDCRollup = sHierTargetNm | SubSt( cUDCRollup, 12, Long( cUDCRollup ) - 11 );
Else;
  cUDCRollup = SubSt( cUDCRollup, 1, Scan( '<dimension>', cUDCRollup ) - 1 ) | sHierTargetNm | SubSt( cUDCRollup, Scan( '<dimension>', cUDCRollup ) + 11, Long( cUDCRollup ) - Scan( '<dimension>', cUDCRollup ) + 10 );
EndIF;
IF( Scan( '<dimension>', cUnallocNode ) = 0 );
  cUnallocNode = cUnallocNode;
ElseIF( Scan( '<dimension>', cUnallocNode ) = 1 );
  cUnallocNode = sHierTargetNm | SubSt( cUnallocNode, 12, Long( cUnallocNode ) - 11 );
Else;
  cUnallocNode = SubSt( cUnallocNode, 1, Scan( '<dimension>', cUnallocNode ) - 1 ) | sHierTargetNm | SubSt( cUnallocNode, Scan( '<dimension>', cUnallocNode ) + 11, Long( cUnallocNode ) - Scan( '<dimension>', cUnallocNode ) + 10 );
EndIF;

### Determine Target Dimension name

IF( pDimTarget @= '' );
  IF( pMode @= '1' );
    pDimTarget = sDimCopy;
  ElseIF( pMode @= '2' );
    pDimTarget = sDimFlat;
  ElseIF( pMode @= '3' );
    pDimTarget = sDimSourceNm |' - '| pHierOrSub;
  ElseIF( pMode @= '4' );
    pDimTarget = sDimSourceNm |' - '| pHierOrSub;
  ElseIF( pMode @>= '5' );
    pDimTarget = pDimSource;
  EndIF;
EndIF;

### Validate Parameters
nErr = IF( CellGetN( cCubSettings, 'Customer Name', 'Numeric' ) + CellGetN( cCubSettings, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( DimensionExists( pDimSource ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid source dimension: ' | pDimSource;
EndIF;

IF( pMode @< '1' % pMode @> '9' );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Mode not recognized. Must be an integer between 1 & 9: ' | pMode;
EndIF;

IF( pDimTarget @= '' ); pDimTarget  = pDimSource; EndIF;
IF( pDimSource @= pDimTarget & pMode @< '5' );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Source & Target dimensions can only be the same if pMode >= 5.';
EndIF;

IF( pMode @= '3' );
  IF( SubsetExists( pDimSource, pHierOrSub ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Subset does not exist in source dimension. ' | pDimSource |':'| pHierOrSub;
  EndIF;
EndIF;

IF( pMode @= '4' );
  IF( DimIx( pDimSource, pHierOrSub ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Rollup does not exist in source dimension. ' | pDimSource |':'| pHierOrSub;
  ElseIF( ElLev( pDimSource, pHierOrSub ) <= nToLevel );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Level to copy rollup to must be less than starting level of rollup.';
  EndIF;
EndIF;

IF( pMode @= '5' );
  pDimTarget = pDimSource;
  IF( DimensionExists( pDimTarget ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid target dimension: ' | pDimTarget;
  ElseIF( DnLev( pDimTarget ) - 1 < nToLevel );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Element level for Dummy N insertion must be <= levels in target dimension.';
  EndIF;
EndIF;

IF( pMode @= '6' % pMode @= '7' % pMode @= '8' % pMode @= '9' );
  pDimTarget = pDimSource;
  IF( DimensionExists( pDimTarget ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid target dimension: ' | pDimTarget;
  EndIF;
EndIF;

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, '' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

### Determine if the dim will be used as datasource
IF( pMode @<= '3' % pMode @= '9' );
  DatasourceType = 'NULL';
Else;
  DatasourceType = 'SUBSET';
  DatasourceNameForServer = pDimSource;
  DatasourceDimensionSubset = 'ALL';
EndIF;

### Run the maintenance process
IF( pMode @= '1' );
  sProc = '}bedrock.dim.clone';
  ExecuteProcess( sProc, 
    'pLogOutput', nDebug,
    'pSrcDim', pDimSource, 
    'pTgtDim', pDimTarget,
    'pAttr', nAttr, 
    'pUnwind', 0 
  );

ElseIF( pMode @= '2' );
  sProc = '}bedrock.hier.create.fromsubset';
  ExecuteProcess( sProc, 
    'pLogOutput', nDebug,
    'pSrcDim', pDimSource, 
    'pSubset', '',
    'pTgtDim', pDimTarget,
    'pAttr', nAttr, 
    'pFlat', 1,
    'pUnwind', 0
  );

ElseIF( pMode @= '3' );
  sProc = '}bedrock.hier.create.fromsubset';
  ExecuteProcess( sProc, 
    'pLogOutput', nDebug, 
    'pSrcDim', pDimSource, 
    'pSubset', pHierOrSub,
    'pTgtDim', pDimTarget,
    'pAttr', nAttr, 
    'pFlat', 0,
    'pUnwind', 0
  );

ElseIF( pMode @= '4' );
  pHierOrSub = DimensionElementPrincipalName( pDimSource, pHierOrSub );
  IF( DimensionExists( pDimTarget ) = 0 );
    IF( Scan( ':', pDimTarget ) = 0 );
      DimensionCreate( pDimTarget );
    Else;
      sDim = SubSt( pDimTarget, 1, Scan( ':', pDimTarget ) - 1 );
      sHier = SubSt( pDimTarget, Scan( ':', pDimTarget ) + 1, Scan( ':', pDimTarget ) - 1 ); 
      HierarchyCreate( sDim, sHier );
    EndIf;
  EndIF;
  DimensionElementInsert( pDimTarget, '', pHierOrSub, 'C' );
  DimensionSortOrder( pDimTarget, 'ByName', 'Ascending', 'ByHierarchy', '' );
  ### Replicate Attributes ###
  # Note: DType on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"
  sAttrDim = '}ElementAttributes_' | pDimSource;
  sLastAttr = '';
  If( pAttr @= '1' & DimensionExists( sAttrDim ) = 1 );
    nNumAttrs = DimSiz( sAttrDim );
    nCount = 1;
    While( nCount <= nNumAttrs );
      sAttrName = DimNm( sAttrDim, nCount );
      sAttrType = SubSt(DType( sAttrDim, sAttrName ), 2, 1 );
      AttrInsert( pDimTarget, sLastAttr, sAttrName, sAttrType );
      sLastAttr = sAttrName;
      nCount = nCount + 1;
    End;
  EndIf;

ElseIF( pMode @= '5' );
  # No action (handle on metadata)

ElseIF( pMode @= '6' );
  sProc = '}bedrock.hier.emptyconsols.delete';
  ExecuteProcess( sProc, 
    'pLogOutput', nDebug, 
    'pDim', pDimTarget
  );

ElseIF( pMode @= '7' );
  # No action (handle on metadata)

ElseIF( pMode @= '8' );
  # No action (handle on metadata)

ElseIF( pMode @= '9' );
  # Create NA element and add to standard total rollup and all other top nodes (if found)
  DimensionElementInsert( pDimTarget, '', cNAEle, 'N' );
  If( DimIx( pDimTarget, cStdTotal ) > 0 );
    If( DType( pDimTarget, cStdTotal ) @= 'C' & ElIsAnc( pDimTarget, cStdTotal, cNAEle ) = 0 );
      DimensionElementComponentAdd( pDimTarget, cStdTotal, cNAEle, 1 );
    EndIf;
  EndIf;
  sSub = cTopNodeSub;
  If( SubsetExists( pDimTarget, sSub ) = 1 );
    nMax = SubsetGetSize( pDimTarget, sSub );
    nCtr = 1;
    While( nCtr <= nMax );
        sEle = SubsetGetElementName( pDimTarget, sSub, nCtr );
        If( sEle @<> cUnallocNode & sEle @<> cUDCRollup & DType( pDimTarget, sEle ) @= 'C' & ElIsAnc( pDimTarget, sEle, cNAEle ) = 0 );
          DimensionElementComponentAdd( pDimTarget, sEle, cNAEle, 1 );
        EndIf;
        nCtr = nCtr + 1;
    End;
  EndIf;

EndIF;

### END Prolog
573,105
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

### Initialise Debug ###
If( pDebug @>= '1' );
  # Set debug file name
  sDebugFile = cDebugFile | '.Metadata.txt';
EndIF;

######################
### Metadata script

### Skips

IF( pMode @< '4' );
  ItemSkip;
EndIF;

### Mode 4 Copy rollup from source hier to target hier

IF( pMode @= '4' );
  IF( ElIsAnc( pDimSource, pHierOrSub, vEle ) = 1 );
    IF( ElLev( pDimSource, vEle ) >= nToLevel );
      IF( ElLev( pDimSource, vEle ) = nToLevel );
        DimensionElementInsert( pDimTarget, '', vEle, 'N' );
      Else;
        DimensionElementInsert( pDimTarget, '', vEle, 'C' );
      EndIF;
      # Loop all parents of element
      iPar = 1;
      nPars = ElParN( pDimSource, vEle );
      While( iPar <= nPars );
        sPar = ElPar( pDimSource, vEle, iPar );
        # If parent is also in the same hierarchy then add to dimension
        IF( sPar @= pHierOrSub % ElIsAnc( pDimSource, pHierOrSub, sPar ) = 1 );
          DimensionElementInsert( pDimTarget, '', sPar, 'C' );
          nWht = ElWeight( pDimSource, sPar, vEle );
          DimensionElementComponentAdd( pDimTarget, sPar, vEle, nWht );
        EndIF;
        iPar = iPar + 1;
      End;
    EndIF;
  EndIF;
EndIF;

### Mode 5 Insert Dummy N elements to consolidations

IF( pMode @= '5' );
  IF( nToLevel = 0 % ElLev( pDimTarget, vEle ) = nToLevel );
    IF( DType( pDimTarget, vEle ) @= 'C' );
      IF( Scan( '<consolidation>', cDummyN ) = 0 );
        sDummyN = vEle | '_N';
      ElseIF( Scan( '<consolidation>', cDummyN ) = 1 );
        sDummyN = vEle | SubSt( cDummyN, 16, Long( cDummyN ) - 15 );
      Else;
        sDummyN = SubSt( cDummyN, 1, Scan( '<consolidation>', cDummyN ) - 1 ) | vEle | SubSt( cDummyN, Scan( '<consolidation>', cDummyN ) + 15, Long( cDummyN ) - Scan( '<consolidation>', cDummyN ) + 14 );
      EndIF;
      DimensionElementInsert( pDimTarget, '', sDummyN, 'N' );
      DimensionElementComponentAdd( pDimTarget, vEle, sDummyN, 1 );
    EndIF;
  EndIF;
EndIF;

### Mode 7 find N elements without a parent and insert them into the placeholder node for unallocated elements

IF( pMode @= '7' );
  IF( DType( pDimTarget, vEle ) @= 'N' & ElPar( pDimTarget, vEle, 1 ) @= '' );
    DimensionElementInsert( pDimTarget, '', cUnalloc, 'C' );
    DimensionElementComponentAdd( pDimTarget, cUnalloc, vEle, 1 );
    IF( DimIx( pDimTarget, cTopNode ) > 0 );
      DimensionElementComponentAdd( pDimTarget, cTopNode, cUnalloc, 0 );
    EndIF;
  EndIF;
EndIF;

### Mode 8 find C elements without a parent and insert them into the top node (weight 0 as pure organizational purpose)

IF( pMode @= '8' );
   IF( DType( pDimTarget, vEle ) @= 'C' & ElPar( pDimTarget, vEle, 1 ) @= '' & vEle @<> cTopNode );
      IF( DimIx( pDimTarget, cTopNode ) = 0 );
         DimensionElementInsert( pDimTarget, '', cTopNode, 'C' );
      EndIF;
      DimensionElementComponentAdd( pDimTarget, cTopNode, vEle, 0 );
   EndIF;
EndIF;

######################
### END Metadata

574,71
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

### Initialise Debug ###
If( pDebug @>= '1' );
  # Set debug file name
  sDebugFile = cDebugFile | '.Data.txt';
EndIF;

######################
### Data script

### Skips

IF( pMode @<> '4' );
  ItemSkip;
EndIF;

IF( DimIx( pDimTarget, vEle ) = 0 );
  ItemSkip;
EndIF;

### Replicate Attributes ###

# Note: DTYPE on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"

If( pAttr @= '1' );

  nCount = 1;
  While( nCount <= nNumAttrs );
    sAttrName = DimNm( sAttrDim, nCount );
    sAttrType = SubSt( DTYPE( sAttrDim, sAttrName ), 2, 1 );
    If( sAttrType @= 'S' % sAttrType @= 'A' );
      sAttrVal = AttrS( pDimSource, vEle, sAttrName );
      If( sAttrVal @<> '' );
        If( sAttrType @= 'A' );
          AttrPutS( sAttrVal, pDimTarget, vEle, sAttrName, 1 );
        Else;
          AttrPutS( sAttrVal, pDimTarget, vEle, sAttrName );
        EndIf;
      EndIf;
    Else;
      nAttrVal = AttrN( pDimSource, vEle, sAttrName );
      If( nAttrVal <> 0 );
        AttrPutN( nAttrVal, pDimTarget, vEle, sAttrName );
      EndIf;
    EndIf;
    nCount = nCount + 1;
  End;

EndIf;

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
