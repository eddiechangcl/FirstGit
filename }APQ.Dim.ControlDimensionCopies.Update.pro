601,100
602,"}APQ.Dim.ControlDimensionCopies.Update"
562,"NULL"
586,
585,
564,
565,"bmy0h\ZFCzV=l^bk]w>Tq^8;f>qLO9dQSazC@Sfo96g7hiZz?J1ji3v\</[AuE?PzL7@zP3cBQ#[6?5Jxeh\l?vXb4B{nU[OMG]7=Oe79Mn_F@[CBSO7YjK1WYebjJMMaD=O:iVbQBRKX\eO2lz3mmQzNunFDUhtn1KroDjiElmv}at[JDqPZOUVJBIV3iO]AY`;tIIL"
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
560,3
pDoProcessLogging
pClear
pViewSub
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pClear,"0"
pViewSub,"0"
637,3
pDoProcessLogging,"Record in process log"
pClear,"Clear control dim replicas"
pViewSub,"Also update APQ View & Subset cubes & DimAttr cubes"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,978
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
### Creates and populates replicas of control object dimensions
### v3.0 updated to include Dimension Subsets & Cube Views directly from control objects available in PA (TM1 v11)

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pClear:%pClear% & pViewSub:%pViewSub%');
### Params
# Special condition for THIS PROCESS ONLY to prevent recursive loop if }APQ Processes dimension is empty. 
If( DimIx( '}APQ Processes', sThisProcName ) = 0 ); pDoProcessLogging = '0'; pClear = '0'; EndIf;
# Below logging SNIPPET is different from standard as doesen't contain }APQ Processes DIMIX check
If( pDoProcessLogging @= '1' ); If( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIf;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); If( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = If( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIf;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); 
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total Years', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIf; 
### Logging - common script 	-----------------  END
##############################################################################################################
### Prolog script commences

### Inits - declare constants

cDimObjs        = '}APQ TM1 Objects';
cDimCubes       = '}APQ Cubes';
cDimCubes2      = '}APQ Cubes Dependent';
cDimDims        = '}APQ Dimensions';
cDimAttrs       = '}APQ Dimension Attributes';
cDimHier        = '}APQ Dimension Hierarchies';
cDimEles        = '}APQ Dimension Elements';
cDimChores      = '}APQ Chores';
cDimProcs       = '}APQ Processes';
cDimGroups      = '}APQ Groups';
cDimClients     = '}APQ Clients';
cDimClients2    = '}APQ Clients Consol';
cDimApps        = '}APQ Applications';
cDimTest        = '}APQ Escape Characters';
cCubVue         = '}APQ Cube Views';
cDimVues        = cCubVue;
cDimVues2       = '}APQ Views';
cCubSub         = '}APQ Dimension Subsets';
cDimSubs        = cCubSub;
cDimSubs2       = '}APQ Subsets';
cCubDimUse      = '}APQ Dimension Use';

cNDimObjs       = 'APQ TM1 Objects';
cNDimCubes      = 'APQ Cubes';
cNDimCubes2     = 'APQ Cubes Dependent';
cNDimVues       = 'APQ Views';
cNDimDims       = 'APQ Dimensions';
cNDimAttrs      = 'APQ Dimension Attributes';
cNDimSubs       = 'APQ Subsets';
cNDimChores     = 'APQ Chores';
cNDimProcs      = 'APQ Processes';
cNDimGroups     = 'APQ Groups';
cNDimClients    = 'APQ Clients';
cNDimApps       = 'APQ Applications';
cNRux           = 'APQ Rules';
cNCubVue        = 'APQ Cube Views';
cNCubSub        = 'APQ Dimension Subsets';

cCubSys         = '}APQ Settings';
cTestVal1       = CellGetS( cCubSys, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubSys, 'Customer Name', 'String' );
cDataFolder     = CellGetS( cCubSys, 'Location: Data Dir', 'String' );
cDataFolder     = cDataFolder | If( SubSt( cDataFolder, Long( cDataFolder ), 1) @<> '\', '\', '' );
cAPQFolder      = CellGetS( cCubSys, 'Location: Framework', 'String' );
cAPQFolder      = If( cAPQFolder @= '', cDataFolder, cAPQFolder );
cAPQFolder      = cAPQFolder | If(SubSt(cAPQFolder, Long(cAPQFolder), 1) @<> '\', '\', '');
bPreserveUsers  = CellGetN( cCubSys, 'Preserve Deleted Users', 'Numeric' );
sDelimList      = CellGetS( cCubSys, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubSys, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubSys, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubSys, 'pEleDelim', 'String' );
sDTFormat       = CellGetS( cCubSys, 'Date Time format', 'String' );
sDFormat        = CellGetS( cCubSys, 'Date format', 'String' );
sTFormat        = CellGetS( cCubSys, 'Time format', 'String' );
cViewSrcPrefix  = CellGetS( cCubSys, 'Std Datasource View Prefix', 'String' );
cViewClrPrefix  = CellGetS( cCubSys, 'Std ZeroOut View Prefix', 'String' );
cAPQSubSrc      = 'APQ Internal - ControlDimensionCopies';
cTM1MinVer      = 11.3;
cAPQVer         = 3.05;
nTM1Version     = CellGetN( cCubSys, 'TM1 Version', 'Numeric' );
cGrpAPQUsr      = 'APQ User';
cGrpAPQPwr      = 'APQ PUser';
cGrpAPQAdm      = 'APQ Admin';
sGrpAPQUsr      = CellGetS( cCubSys, 'Security Group: End User', 'String' );
sGrpAPQPwr      = CellGetS( cCubSys, 'Security Group: Power User', 'String' );
sGrpAPQAdm      = CellGetS( cCubSys, 'Security Group: Admin User', 'String' );

### Check Framework Version
sMyVersion      = NumberToString(cAPQVer);
If( DimIx( '}APQ Version', sMyVersion ) = 0 );
    DimensionElementDelete( '}APQ Version', DimNm( '}APQ Version', 1 ) );
    DimensionElementInsert( '}APQ Version', '', sMyVersion, 'N' );
EndIf;

### Check if cube & dimension attributes exist
If( CubeExists( '}CubeAttributes' ) = 0 );
   CubeAttrInsert( '', 'Caption', 'S' );
ElseIf( DimIx( '}CubeAttributes', 'Caption' ) = 0 );
   CubeAttrInsert( '', 'Caption', 'S' );
EndIf;
If( CubeExists( '}DimensionAttributes' ) = 0 );
   DimensionAttrInsert( '', 'Caption', 'S' );
ElseIf( DimIx( '}DimensionAttributes', 'Caption' ) = 0 );
   DimensionAttrInsert( '', 'Caption', 'S' );
EndIf;
If( CubeExists( '}ElementAttributes_}Clients' ) = 0 );
   AttrInsert( '}Clients', '', '}TM1_DefaultDisplayValue', 'A' );
EndIf;
If( CubeExists( '}ElementAttributes_}Groups' ) = 0 );
   AttrInsert( '}Groups', '', '}TM1_DefaultDisplayValue', 'A' );
EndIf;

### Check bedrock delimiters
If( sDelimList @= '' );
    sDelimList = '&';
    CellPutS( sDelimList, cCubSys, 'pDelim', 'String' );
EndIf;
If( sDelimDim @= '' );
    sDelimDim = '&';
    CellPutS( sDelimDim, cCubSys, 'pDimDelim', 'String' );
EndIf;
If( sDelimEleStart @= '' );
    sDelimEleStart = '?';
    CellPutS( sDelimEleStart, cCubSys, 'pEleStartDelim', 'String' );
EndIf;
If( sDelimEle @= '' );
    sDelimEle = '+';
    CellPutS( sDelimEle, cCubSys, 'pEleDelim', 'String' );
EndIf;
### Check datetime formats
If( sDTFormat @= '' );
    sDTFormat = '\Y-\m-\d \h:\i:\s';
    CellPutS( sDTFormat, cCubSys, 'Date Time format', 'String' );
EndIf;
If( sDFormat @= '' );
    sDFormat = '\Y-\m-\d';
    CellPutS( sDFormat, cCubSys, 'Date format', 'String' );
EndIf;
If( sTFormat @= '' );
    sTFormat = '\h:\i:\s';
    CellPutS( sTFormat, cCubSys, 'Time format', 'String' );
EndIf;

### Check APQ security groups
If( sGrpAPQUsr @= '' );
    sGrpAPQUsr = cGrpAPQUsr;
    CellPutS( sGrpAPQUsr, cCubSys, 'Security Group: End User', 'String' );
EndIf;
If( sGrpAPQPwr @= '' );
    sGrpAPQPwr = cGrpAPQPwr;
    CellPutS( sGrpAPQPwr, cCubSys, 'Security Group: Power User', 'String' );
EndIf;
If( sGrpAPQAdm @= '' );
    sGrpAPQAdm = cGrpAPQAdm;
    CellPutS( sGrpAPQAdm, cCubSys, 'Security Group: Admin User', 'String' );
EndIf;

### setup dimensions

# APQ TM1 Objects
If( DimensionExists( cDimObjs ) = 0 );
  DimensionCreate( cDimObjs );
  AttrInsert( cDimObjs, '', 'Caption', 'S' );
EndIf;
sDim = cDimObjs;
sAttrString = 'Caption&IsDimension&IsProcess&IsChore&IsApp&IsRule&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# APQ Cubes & Cube Views
If( DimensionExists( cDimCubes ) = 0 );
  DimensionCreate( cDimCubes );
  AttrInsert( cDimCubes, '', 'Caption', 'S' );
EndIf;
sDim = cDimCubes;
sAttrString = 'Caption&CELL_SECURITY&HASRULES&HASDEFAULTVIEW&HASUSERINPUT&HASPUBLICVIEWS&SKIPMAP&SkipElementDataCheck&APQ User&APQ PUser&APQ Admin&UIWriteProtected&CubeSaveData&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
If( DimensionExists( cDimCubes2 ) = 0 );
  DimensionCreate( cDimCubes2 );
EndIf;
If( DimensionExists( cCubVue ) = 0 );
  DimensionCreate( cCubVue );
  sAttr = 'Caption_Default';
  AttrInsert( sDim, '', sAttr, 'A' );
EndIf;
sDim = cCubVue;
sAttrString = 'Caption&Entry Reference&Cube Name&View Name&TM1Web URL&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sAttr = 'Caption_Default';
If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, 'A' );
EndIf;

# APQ Dimensions
If( DimensionExists( cDimDims ) = 0 );
  DimensionCreate( cDimDims );
  AttrInsert( cDimDims, '', 'Caption', 'S' );
EndIf;
sDim = cDimDims;
sAttrString = 'Caption&ELEMENT_SECURITY&ELEMENT_FRAMEWORK&ATTR_FRAMEWORK&HASATTRIBUTES&HASDEFAULTSUBSET&HASHIERARCHIES&SKIPMAP&APQ User&APQ PUser&APQ Admin&UIWriteProtected&TimeRelative&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# APQ Dimension Hierarchies
If( DimensionExists( cDimHier ) = 0 );
  DimensionCreate( cDimHier );
  sAttr = 'Hierarchy';
  AttrInsert( sDim, '', sAttr, 'S' );
EndIf;
sDim = cDimHier;
sAttrString = 'Caption&Dimension&Hierarchy&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# APQ Dimension Attributes
If( DimensionExists( cDimAttrs ) = 0 );
  DimensionCreate( cDimAttrs );
EndIf;

# APQ Dimension Subsets
If( DimensionExists( cDimSubs ) = 0 );
  DimensionCreate( cDimSubs );
  sAttr = 'Caption_Default';
  AttrInsert( sDim, '', sAttr, 'A' );
EndIf;
sDim = cDimSubs;
sAttrString = 'Dimension&Hierarchy&Subset&Caption&Source&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sAttr = 'Caption_Default';
If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, 'A' );
EndIf;
sAttr = 'showPopUp';
If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, 'N' );
EndIf;

# APQ Subsets
If( DimensionExists( cDimSubs2 ) = 0 );
  DimensionCreate( cDimSubs2 );
EndIf;

# APQ Dimension Elements
If( DimensionExists( cDimEles ) = 0 );
  DimensionCreate( cDimEles );
  AttrInsert( cDimEles, '', 'Caption', 'S' );
EndIf;

# APQ Chores
If( DimensionExists( cDimChores ) = 0 );
  DimensionCreate( cDimChores );
  AttrInsert( cDimChores, '', 'Active', 'S' );
EndIf;
sDim = cDimChores;
sAttrString = 'Caption&Active&MultiCommitMode&StartTimestamp&ScheduleFrequency&APQ User&APQ PUser&APQ Admin&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sAttrString = 'NumberOfProcesses&';
sAttrTyp = 'N';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# APQ Processes
If( DimensionExists( cDimProcs ) = 0 );
  DimensionCreate( cDimProcs );
  AttrInsert( cDimProcs, '', 'SKIPMAP', 'S' );
EndIf;
sDim = cDimProcs;
sAttrString = 'Caption&SKIPMAP&APQ User&APQ PUser&APQ Admin&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# APQ Clients & Groups
If( DimensionExists( cDimGroups ) = 0 );
  DimensionCreate( cDimGroups );
  AttrInsert( cDimGroups, '', '}TM1_DefaultDisplayValue', 'A' );
EndIf;
If( DimensionExists( cDimClients ) = 0 );
  DimensionCreate( cDimClients );
  AttrInsert( cDimClients, '', '}TM1_DefaultDisplayValue', 'A' );
EndIf;
If( DimensionExists( cDimClients2 ) = 0 );
  DimensionCreate( cDimClients2 );
  AttrInsert( cDimClients2, '', '}TM1_DefaultDisplayValue', 'A' );
EndIf;
sDim = cDimGroups;
sAttrString = '}TM1_DefaultDisplayValue&Caption_Default&Caption&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sAttrString = 'ELEMENT_SECURITY&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sDim = cDimClients;
sAttrString = 'LAST_ACTIVE&Email&Menu Profile&DeletedDate&UserID&UniqueID&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sDim = cDimClients;
sAttrString = 'Admin User&IsDeleted&';
sAttrTyp = 'N';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sDim = cDimClients;
sAttrString = '}TM1_DefaultDisplayValue&Caption_Default&Caption&';
sAttrTyp = 'A';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sDim = cDimClients2;
sAttrString = '}TM1_DefaultDisplayValue&Caption_Default&Caption&';
sAttrTyp = 'A';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sDim = cDimClients2;
sAttrString = 'Menu Profile&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# APQ Applications
If( DimensionExists( cDimApps ) = 0 );
  DimensionCreate( cDimApps );
  AttrInsert( cDimApps, '', 'Type', 'S' );
EndIf;
sDim = cDimApps;
sAttrString = 'Type&Entry File Location&Entry URL&Web API URL&Cube&View&Entry Name&Entry Display Name&APQ User&APQ PUser&APQ Admin&';
sAttrTyp = 'S';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;
sAttrString = 'Caption_Default&Menu ID&';
sAttrTyp = 'A';
While( Scan( '&', sAttrString ) > 0 );
  sAttr = SubSt( sAttrString, 1, Scan( '&', sAttrString ) - 1 );
  sAttrString = SubSt( sAttrString, Scan( '&', sAttrString ) + 1, Long( sAttrString ) );
  If( DimIx( '}ElementAttributes_' | sDim, sAttr ) = 0 );
    AttrInsert( sDim, '', sAttr, sAttrTyp );
  EndIf;
End;

# Special properties for standard control objects
If( DimIx( '}ElementAttributes_}Clients', ' }TM1_DefaultDisplayValue' ) = 0 );
  AttrInsert( '}Clients', '', ' }TM1_DefaultDisplayValue', 'A' );
EndIf;
If( DimIx( '}ElementAttributes_}Clients', 'Caption_Default' ) = 0 );
  AttrInsert( '}Clients', '', 'Caption_Default', 'A' );
EndIf;
If( DimIx( '}ElementAttributes_' | cDimGroups, ' }TM1_DefaultDisplayValue' ) = 0 );
  AttrInsert( cDimGroups, '', ' }TM1_DefaultDisplayValue', 'A' );
  AttrInsert( cDimGroups, '', 'Caption_Default', 'A' );
EndIf;
If( DimIx( '}ElementAttributes_}Groups', ' }TM1_DefaultDisplayValue' ) = 0 );
  AttrInsert( '}Groups', '', ' }TM1_DefaultDisplayValue', 'A' );
EndIf;
If( DimIx( '}ElementAttributes_}Groups', 'Caption_Default' ) = 0 );
  AttrInsert( '}Groups', '', 'Caption_Default', 'A' );
EndIf;
If( DimIx( '}CubeProperties', 'CELL_SECURITY' ) = 0 );
  DimensionElementInsert( '}CubeProperties', '', 'CELL_SECURITY', 'S' );
EndIf;
If( DimIx( '}CubeProperties', 'HASDEFAULTVIEW' ) = 0 );
  DimensionElementInsert( '}CubeProperties', '', 'HASDEFAULTVIEW', 'S' );
EndIf;
If( DimIx( '}DimensionProperties', 'ELEMENT_SECURITY' ) = 0 );
  DimensionElementInsert( '}DimensionProperties', '', 'ELEMENT_SECURITY', 'S' );
EndIf;
If( DimIx( '}DimensionProperties', 'HASDEFAULTSUBSET' ) = 0 );
  DimensionElementInsert( '}DimensionProperties', '', 'HASDEFAULTSUBSET', 'S' );
EndIf;
If( DimIx( '}DimensionProperties', 'HASHIERARCHIES' ) = 0 );
  DimensionElementInsert( '}DimensionProperties', '', 'HASHIERARCHIES', 'S' );
EndIf;
If( DimIx( '}DimensionProperties', 'DEFAULT_MEMBER' ) = 0 );
  DimensionElementInsert( '}DimensionProperties', '', 'DEFAULT_MEMBER', 'S' );
EndIf;

If( pClear @= '1' );
  DimensionDeleteAllElements( cDimObjs );
  DimensionDeleteAllElements( cDimCubes );
  DimensionDeleteAllElements( cDimCubes2 );
  DimensionDeleteAllElements( cDimVues );
  DimensionDeleteAllElements( cDimVues2 );
  DimensionDeleteAllElements( cDimDims );
  DimensionDeleteAllElements( cDimHier );
  DimensionDeleteAllElements( cDimSubs );
  DimensionDeleteAllElements( cDimSubs2 );
  DimensionDeleteAllElements( cDimAttrs );
  DimensionDeleteAllElements( cDimChores );
  DimensionDeleteAllElements( cDimProcs );
  DimensionDeleteAllElements( cDimGroups );
  DimensionDeleteAllElements( cDimClients2 );
  DimensionDeleteAllElements( cDimApps );
  If( bPreserveUsers <> 1 );
    DimensionDeleteAllElements( cDimClients );
  Else;
    ExecuteProcess( '}bedrock.hier.unwind', 'pLogOutput', 0, 'pDim', cDimClients, 'pHier', '', 'pConsol', '*', 'pRecursive', 1 );
  EndIf;
EndIf;

DimensionSortOrder( cDimObjs,       'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimCubes,      'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimCubes2,     'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimVues,       'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimVues2,      'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimDims,       'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimHier,       'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimSubs,       'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimSubs2,      'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimAttrs,      'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimChores,     'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimProcs,      'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimGroups,     'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimClients,    'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimClients2,   'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );
DimensionSortOrder( cDimApps,       'ByName', 'Ascending', 'ByHierarchy', 'Ascending' );

DimensionElementInsert( cDimObjs, '', 'Total ' | cNDimObjs, 'C' );
DimensionElementInsert( cDimObjs, '', 'Total ' | cNDimCubes, 'C' );
DimensionElementInsert( cDimObjs, '', 'Total ' | cNDimDims, 'C' );
DimensionElementInsert( cDimObjs, '', 'Total ' | cNDimProcs, 'C' );
DimensionElementInsert( cDimObjs, '', 'Total ' | cNDimChores, 'C' );
DimensionElementInsert( cDimObjs, '', 'Total ' | cNDimApps, 'C' );
DimensionElementInsert( cDimObjs, '', 'Total ' | cNRux, 'C' );
DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimObjs, 'Total ' | cNDimCubes, 1 );
DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimObjs, 'Total ' | cNDimDims, 1 );
DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimObjs, 'Total ' | cNDimProcs, 1 );
DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimObjs, 'Total ' | cNDimChores, 1 );
DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimObjs, 'Total ' | cNDimApps, 1 );
DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimObjs, 'Total ' | cNRux, 1 );
DimensionElementInsert( cDimCubes, '', 'Total ' | cNDimCubes, 'C' );
DimensionElementInsert( cDimCubes, '', 'Total User ' | cNDimCubes, 'C' );
DimensionElementInsert( cDimCubes, '', 'Total Control ' | cNDimCubes, 'C' );
DimensionElementInsert( cDimCubes2, '', 'Total ' | cNDimCubes2, 'C' );
DimensionElementInsert( cDimVues, '', 'Total ' | cNDimCubes, 'C' );
DimensionElementInsert( cDimVues2, '', 'Total ' | cNDimVues, 'C' );
DimensionElementInsert( cDimDims, '', 'Total ' | cNDimDims, 'C' );
DimensionElementInsert( cDimDims, '', 'Total User ' | cNDimDims, 'C' );
DimensionElementInsert( cDimDims, '', 'Total Control ' | cNDimDims, 'C' );
DimensionElementInsert( cDimHier, '', 'Total ' | cNDimDims, 'C' );
DimensionElementInsert( cDimSubs, '', 'Total ' | cNDimDims, 'C' );
DimensionElementInsert( cDimSubs2, '', 'Total ' | cNDimSubs, 'C' );
DimensionElementInsert( cDimAttrs, '', 'Total ' | cNDimAttrs, 'C' );
DimensionElementInsert( cDimEles, '', 'TOTAL DIMENSION ELEMENTS', 'N' );
DimensionElementInsert( cDimChores, '', 'Total ' | cNDimChores, 'C' );
DimensionElementInsert( cDimProcs, '', 'Total ' | cNDimProcs, 'C' );
DimensionElementInsert( cDimProcs, '', 'Total User ' | cNDimProcs, 'C' );
DimensionElementInsert( cDimProcs, '', 'Total Control ' | cNDimProcs, 'C' );
DimensionElementInsert( cDimGroups, '', 'Total ' | cNDimGroups, 'C' );
DimensionElementInsert( cDimGroups, '', 'Total APQ Element Security Groups', 'C' );
DimensionElementInsert( cDimClients, '', 'Total ' | cNDimClients, 'C' );
DimensionElementInsert( cDimClients, '', 'Admin Users', 'C' );
DimensionElementInsert( cDimClients, '', 'End Users', 'C' );
DimensionElementComponentAdd( cDimClients, 'Total ' | cNDimClients, 'Admin Users', 1 );
DimensionElementComponentAdd( cDimClients, 'Total ' | cNDimClients, 'End Users', 1 );
DimensionElementInsert( cDimClients2, '', 'Total ' | cNDimClients, 'C' );
DimensionElementInsert( cDimClients2, '', 'Admin Users', 'C' );
DimensionElementInsert( cDimClients2, '', 'End Users', 'C' );
DimensionElementComponentAdd( cDimClients2, 'Total ' | cNDimClients, 'Admin Users', 1 );
DimensionElementComponentAdd( cDimClients2, 'Total ' | cNDimClients, 'End Users', 1 );

# Temp views & subsets
DimensionElementInsert( cDimVues, '', 'Total views to investigate', 'C' );
DimensionElementInsert( cDimVues, '', 'Bedrock views', 'C' );
DimensionElementInsert( cDimVues, '', 'Temp views', 'C' );
DimensionElementInsert( cDimVues, '', 'DataSource views', 'C' );
DimensionElementInsert( cDimVues, '', 'ZeroOut views', 'C' );
DimensionElementInsert( cDimVues, '', 'z views', 'C' );
DimensionElementComponentAdd( cDimVues, 'Total views to investigate', 'Bedrock views', 1 );
DimensionElementComponentAdd( cDimVues, 'Total views to investigate', 'Temp views', 1 );
DimensionElementComponentAdd( cDimVues, 'Total views to investigate', 'DataSource views', 1 );
DimensionElementComponentAdd( cDimVues, 'Total views to investigate', 'ZeroOut views', 1 );
DimensionElementComponentAdd( cDimVues, 'Total views to investigate', 'z views', 1 );
DimensionElementInsert( cDimVues2, '', 'Total views to investigate', 'C' );
DimensionElementInsert( cDimVues2, '', 'Bedrock views', 'C' );
DimensionElementInsert( cDimVues2, '', 'Temp views', 'C' );
DimensionElementInsert( cDimVues2, '', 'DataSource views', 'C' );
DimensionElementInsert( cDimVues2, '', 'ZeroOut views', 'C' );
DimensionElementInsert( cDimVues2, '', 'z views', 'C' );
DimensionElementComponentAdd( cDimVues2, 'Total views to investigate', 'Bedrock views', 1 );
DimensionElementComponentAdd( cDimVues2, 'Total views to investigate', 'Temp views', 1 );
DimensionElementComponentAdd( cDimVues2, 'Total views to investigate', 'DataSource views', 1 );
DimensionElementComponentAdd( cDimVues2, 'Total views to investigate', 'ZeroOut views', 1 );
DimensionElementComponentAdd( cDimVues2, 'Total views to investigate', 'z views', 1 );
DimensionElementInsert( cDimSubs, '', 'Total subsets to investigate', 'C' );
DimensionElementInsert( cDimSubs, '', 'Bedrock subsets', 'C' );
DimensionElementInsert( cDimSubs, '', 'Temp subsets', 'C' );
DimensionElementInsert( cDimSubs, '', 'DataSource subsets', 'C' );
DimensionElementInsert( cDimSubs, '', 'ZeroOut subsets', 'C' );
DimensionElementInsert( cDimSubs, '', 'z subsets', 'C' );
DimensionElementComponentAdd( cDimSubs, 'Total subsets to investigate', 'Bedrock subsets', 1 );
DimensionElementComponentAdd( cDimSubs, 'Total subsets to investigate', 'Temp subsets', 1 );
DimensionElementComponentAdd( cDimSubs, 'Total subsets to investigate', 'DataSource subsets', 1 );
DimensionElementComponentAdd( cDimSubs, 'Total subsets to investigate', 'ZeroOut subsets', 1 );
DimensionElementComponentAdd( cDimSubs, 'Total subsets to investigate', 'z subsets', 1 );
DimensionElementInsert( cDimSubs2, '', 'Total subsets to investigate', 'C' );
DimensionElementInsert( cDimSubs2, '', 'Bedrock subsets', 'C' );
DimensionElementInsert( cDimSubs2, '', 'Temp subsets', 'C' );
DimensionElementInsert( cDimSubs2, '', 'DataSource subsets', 'C' );
DimensionElementInsert( cDimSubs2, '', 'ZeroOut subsets', 'C' );
DimensionElementInsert( cDimSubs2, '', 'z subsets', 'C' );
DimensionElementComponentAdd( cDimSubs2, 'Total subsets to investigate', 'Bedrock subsets', 1 );
DimensionElementComponentAdd( cDimSubs2, 'Total subsets to investigate', 'Temp subsets', 1 );
DimensionElementComponentAdd( cDimSubs2, 'Total subsets to investigate', 'DataSource subsets', 1 );
DimensionElementComponentAdd( cDimSubs2, 'Total subsets to investigate', 'ZeroOut subsets', 1 );
DimensionElementComponentAdd( cDimSubs2, 'Total subsets to investigate', 'z subsets', 1 );

### populate dimensions

####################
# Cubes
nCubes = DimSiz('}Cubes');
nCount = 1;
While( nCount <= nCubes );
  vCube = DimNm( '}Cubes', nCount );
  If( CubeExists( vCube ) = 1 ); 
    DimensionElementInsert( cDimCubes, '', vCube, 'N' );
    DimensionElementInsert( cDimCubes2, '', vCube, 'N' );
    DimensionElementInsert( cDimObjs, '', vCube, 'N' );
    DimensionElementComponentAdd( cDimCubes, 'Total ' | cNDimCubes, vCube, 1 );
    If( SubSt( vCube, 1, 1 ) @= '}' );
      DimensionElementComponentAdd( cDimCubes, 'Total Control ' | cNDimCubes, vCube, 1 );
    Else;
      DimensionElementComponentAdd( cDimCubes, 'Total User ' | cNDimCubes, vCube, 1 );
    EndIf;
    DimensionElementComponentAdd( cDimCubes2, 'Total ' | cNDimCubes2, vCube, 1 );
    DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimCubes, vCube, 1 );
    sRule = cDataFolder | vCube | '.rux';
    If( FileExists( sRule ) = 1 );
      DimensionElementComponentAdd( cDimObjs, 'Total ' | cNRux, vCube, 1 );
    EndIf;
    # Views
    sVueCub = '}Views_' | vCube;
    If( DimensionExists( sVueCub ) = 1 ); If( DimSiz( sVueCub ) >= 1 );
      DimensionElementInsert( cDimVues, '', vCube, 'C' );
      DimensionElementComponentAdd( cDimVues, 'Total ' | cNDimCubes, vCube, 1 );
      DimensionElementInsert( cDimVues2, '', 'Cube:' | vCube, 'C' );
      DimensionElementComponentAdd( cDimVues2, 'Total ' | cNDimVues, 'Cube:' | vCube, 1 );
      nVues = DimSiz( sVueCub );
      nCountVue = 1;
      While( nCountVue <= nVues );
        sVue = DimNm( sVueCub, nCountVue );
        sCubVue = vCube |'\'| sVue;
        DimensionElementInsert( cDimVues, '', sCubVue, 'N' );
        DimensionElementComponentAdd( cDimVues, vCube, sCubVue, 1 );
        DimensionElementInsert( cDimVues2, '', sVue, 'N' );
        DimensionElementComponentAdd( cDimVues2, 'Cube:' | vCube, sVue, 1 );
        # possible not cleaned up temp items to investigate 
        If( Scan( cViewSrcPrefix, sVue ) = 1 ); 
            DimensionElementComponentAdd( cDimVues, 'DataSource Views', sCubVue, 1 );
            DimensionElementComponentAdd( cDimVues2, 'DataSource Views', sVue, 1 );
        ElseIf( Scan( cViewClrPrefix, sVue ) = 1 % Scan( 'zeroout', Lower(sVue) ) > 0 ); 
            DimensionElementComponentAdd( cDimVues, 'ZeroOut Views', sCubVue, 1 );
            DimensionElementComponentAdd( cDimVues2, 'ZeroOut Views', sVue, 1 );
        ElseIf( Scan( '}bedrock', Lower(sVue) ) = 1 );
            DimensionElementComponentAdd( cDimVues, 'Bedrock Views', sCubVue, 1 );
            DimensionElementComponentAdd( cDimVues2, 'Bedrock Views', sVue, 1 );
        ElseIf( Scan( 'temp', Lower(sVue) ) > 0 % Scan( 'tmp', Lower(sVue) ) > 0 ); 
            DimensionElementComponentAdd( cDimVues, 'Temp Views', sCubVue, 1 );
            DimensionElementComponentAdd( cDimVues2, 'Temp Views', sVue, 1 );
        ElseIf( SubSt( sVue, 1, 1 ) @= 'z' & SubSt( sVue, 1, 6 ) @<> 'zDrill' ); 
            DimensionElementComponentAdd( cDimVues, 'z Views', sCubVue, 1 );
            DimensionElementComponentAdd( cDimVues2, 'z Views', sVue, 1 );
        EndIf;
        nCountVue = nCountVue + 1;
      End;
    EndIf; EndIf;
  EndIf;
  nCount = nCount + 1;
End;

####################
# Dims
nDims = DimSiz('}Dimensions');
nCount = 1;
While( nCount <= nDims );
  vDim = DimNm( '}Dimensions', nCount );
  # Dims & TM1 Objs
  If( DimensionExists( vDim ) = 1 & Scan( ':', vDim ) = 0 );
    If( SubSt( vDim, 1, 9 ) @<> '}Subsets_' & SubSt( vDim, 1, 13 ) @<> '}Hierarchies_' & SubSt( vDim, 1, 7 ) @<> '}Views_' );
      DimensionElementInsert( cDimDims, '', vDim, 'N' );
      DimensionElementInsert( cDimObjs, '', vDim, 'N' );
      If( SubSt( vDim, 1, 1 ) @= '}' );
        DimensionElementComponentAdd( cDimDims, 'Total Control ' | cNDimDims, vDim, 1 );
      Else;
        DimensionElementComponentAdd( cDimDims, 'Total User ' | cNDimDims, vDim, 1 );
      EndIf;
      DimensionElementComponentAdd( cDimDims, 'Total ' | cNDimDims, vDim, 1 );
      DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimDims, vDim, 1 );
      # Attrs
      sDimAttr = '}ElementAttributes_' | vDim;
      If( DimensionExists( sDimAttr ) = 1 );
        nAttrs = DimSiz( sDimAttr );
        nCountAttr = 1;
        While( nCountAttr <= nAttrs );
          sAttr = DimNm( sDimAttr, nCountAttr );
          DimensionElementInsert( cDimAttrs, '', sAttr, 'N' );
          DimensionElementComponentAdd( cDimAttrs, 'Total ' | cNDimAttrs, sAttr, 1 );
          nCountAttr = nCountAttr + 1;
        End;
      EndIf;
    EndIf;
    # Hiers
    If( SubSt( vDim, 1, 9 ) @<> '}Subsets_' & SubSt( vDim, 1, 13 ) @<> '}Hierarchies_' & SubSt( vDim, 1, 7 ) @<> '}Views_' );
        DimensionElementInsert( cDimHier, '', vDim, 'C' );
        DimensionElementInsert( cDimHier, '', vDim |':'| vDim, 'N' );
        DimensionElementComponentAdd( cDimHier, 'Total ' | cNDimDims, vDim, 1 );
        DimensionElementComponentAdd( cDimHier, vDim, vDim |':'| vDim, 1 );
    EndIf;
    sDimHier = '}Hierarchies_' | vDim;
    If( DimensionExists( sDimHier ) = 1 );
      DimensionElementInsert( cDimHier, '', vDim, 'C' );
      DimensionElementComponentAdd( cDimHier, 'Total ' | cNDimDims, vDim, 1 );
      nHiers = DimSiz( sDimHier );
      nCountHier = 1;
      While( nCountHier <= nHiers );
        sHier = DimNm( sDimHier, nCountHier );
        sHier = If( sHier @= vDim, vDim |':', '' ) | sHier;
        DimensionElementInsert( cDimHier, '', sHier, 'N' );
        DimensionElementComponentAdd( cDimHier, vDim, sHier, 1 );
        nCountHier = nCountHier + 1;
      End;
    EndIf;
    # Subs
    sSubDim = '}Subsets_' | vDim;
    If( SubSt( vDim, 1, 9 ) @<> '}Subsets_' & SubSt( vDim, 1, 13 ) @<> '}Hierarchies_' & SubSt( vDim, 1, 7 ) @<> '}Views_' );
    If( DimensionExists( sSubDim ) = 1 ); If( DimSiz( sSubDim ) >= 1 );
      DimensionElementInsert( cDimSubs, '', vDim, 'C' );
      DimensionElementComponentAdd( cDimSubs, 'Total ' | cNDimDims, vDim, 1 );
      DimensionElementInsert( cDimSubs2, '', 'Dim:' | vDim, 'C' );
      DimensionElementComponentAdd( cDimSubs2, 'Total ' | cNDimSubs, 'Dim:' | vDim, 1 );
      nSubs = DimSiz( sSubDim );
      nCountSub = 1;
      # SW 20181218 in 11.4 format of elements in }Subsets dims changed from subsetName to hierarchyName:subsetName 
      While( nCountSub <= nSubs );
        sSub = DimNm( sSubDim, nCountSub );
        If( Scan( ':', sSub ) > 0 );
            sHierSub = sSub;
            sHier    = SubSt( sHierSub, 1, Scan( ':', sHierSub ) - 1 );
            sSub     = SubSt( sHierSub, Scan( ':', sHierSub ) + 1, Long(sHierSub) );
        Else;
            sHier    = vDim;
            sHierSub = vDim |':'| sSub;
        EndIf;
        sDimHier= vDim |':'| sHier;
        sDimSub = vDim |':'| sHierSub;
        DimensionElementInsert( cDimSubs, '', sDimHier, 'C' );
        DimensionElementComponentAdd( cDimSubs, vDim, sDimHier, 1 );
        DimensionElementInsert( cDimSubs, '', sDimSub, 'N' );
        DimensionElementComponentAdd( cDimSubs, sDimHier, sDimSub, 1 );
        DimensionElementInsert( cDimSubs2, '', sSub, 'N' );
        DimensionElementComponentAdd( cDimSubs2, 'Dim:' | vDim, sSub, 1 );
        # possible not cleaned up temp items to investigate 
        If( Scan( cViewSrcPrefix, sSub ) = 1 ); 
            DimensionElementComponentAdd( cDimSubs, 'DataSource Subsets', sDimSub, 1 );
            DimensionElementComponentAdd( cDimSubs2, 'DataSource Subsets', sSub, 1 );
        ElseIf( Scan( cViewClrPrefix, sSub ) = 1 % Scan( 'zeroout', Lower(sSub) ) > 0 ); 
            DimensionElementComponentAdd( cDimSubs, 'ZeroOut Subsets', sDimSub, 1 );
            DimensionElementComponentAdd( cDimSubs2, 'ZeroOut Subsets', sSub, 1 );
        ElseIf( Scan( '}bedrock', Lower(sSub) ) = 1 );
            DimensionElementComponentAdd( cDimSubs, 'Bedrock Subsets', sDimSub, 1 );
            DimensionElementComponentAdd( cDimSubs2, 'Bedrock Subsets', sSub, 1 );
        ElseIf( Scan( 'temp', Lower(sSub) ) > 0 % Scan( 'tmp', Lower(sSub) ) > 0 ); 
            DimensionElementComponentAdd( cDimSubs, 'Temp Subsets', sDimSub, 1 );
            DimensionElementComponentAdd( cDimSubs2, 'Temp Subsets', sSub, 1 );
        ElseIf( SubSt( sSub, 1, 1 ) @= 'z' & SubSt( sSub, 1, 6 ) @<> 'zDrill' ); 
            DimensionElementComponentAdd( cDimSubs, 'z Subsets', sDimSub, 1 );
            DimensionElementComponentAdd( cDimSubs2, 'z Subsets', sSub, 1 );
        EndIf;
        nCountSub = nCountSub + 1;
      End;
    EndIf; EndIf; EndIf;
  EndIf;
  # For control dimensions, even if alternate hierarchies exist no }Hierarchies_ dimension is created (e.g. }APQ Time dimensions)
  If( SubSt( vDim, 1, 1 ) @= '}' & Scan( ':', vDim ) > 0 );
    sDimMain = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
    sHier = vDim;
    DimensionElementInsert( cDimHier, '', sHier, 'N' );
    DimensionElementComponentAdd( cDimHier, sDimMain, sHier, 1 );
  EndIf;
  nCount = nCount + 1;
End;

####################
# Chores
nChores = DimSiz('}Chores');
nCount = 1;
While( nCount <= nChores );
  vCho = DimNm( '}Chores', nCount );
  If( DimIx( '}Chores', vCho ) >= 1 ); 
    DimensionElementInsert( cDimChores, '', vCho, 'N' );
    DimensionElementInsert( cDimObjs, '', vCho, 'N' );
  EndIf;
  DimensionElementComponentAdd( cDimChores, 'Total ' | cNDimChores, vCho, 1 );
  DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimChores, vCho, 1 );
  nCount = nCount + 1;
End;

####################
# Processes
nProcs = DimSiz('}Processes');
nCount = 1;
While( nCount <= nProcs );
  vProc = DimNm( '}Processes', nCount );
  If( DimIx( '}Processes', vProc ) >= 1 ); 
    DimensionElementInsert( cDimProcs, '', vProc, 'N' );
    If( SubSt( vProc, 1, 1 ) @= '}' );
      DimensionElementComponentAdd( cDimProcs, 'Total Control ' | cNDimProcs, vProc, 1 );
    Else;
      DimensionElementComponentAdd( cDimProcs, 'Total User ' | cNDimProcs, vProc, 1 );
    EndIf;
    DimensionElementInsert( cDimObjs, '', vProc, 'N' );
  EndIf;
  DimensionElementComponentAdd( cDimProcs, 'Total ' | cNDimProcs, vProc, 1 );
  DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimProcs, vProc, 1 );
  nCount = nCount + 1;
End;

####################
# Groups
If( DimIx( '}Groups', sGrpAPQUsr ) = 0 );
    AddGroup( sGrpAPQUsr );
EndIf;
If( DimIx( '}Groups', sGrpAPQPwr ) = 0 );
    AddGroup( sGrpAPQPwr );
EndIf;
If( DimIx( '}Groups', sGrpAPQAdm ) = 0 );
    AddGroup( sGrpAPQAdm );
EndIf;
nGroups = DimSiz('}Groups');
nCount = 1;
While( nCount <= nGroups );
  vGroup = DimNm( '}Groups', nCount );
  If( DimIx( '}Groups', vGroup ) >= 1 ); 
    DimensionElementInsert( cDimGroups, '', vGroup, 'N' );
  EndIf;
  DimensionElementComponentAdd( cDimGroups, 'Total ' | cNDimGroups, vGroup, 1 );
  If( DimIx( cDimGroups, vGroup ) > 0 );
      If( AttrS( cDimGroups, vGroup, 'ELEMENT_SECURITY' ) @<> '' );
          DimensionElementComponentAdd( cDimGroups, 'Total APQ Element Security Groups', vGroup, 1 );
      EndIf;
  EndIf;
  sCAMAlias = AttrS( '}Groups', vGroup, '}TM1_DefaultDisplayValue' );
  If( Scan( '/', sCAMAlias ) > 0 );
    sGrpNameAlias = SubSt( sCAMAlias, Scan( '/', sCAMAlias ) + 1, Long( sCAMAlias ) - Scan( '/', sCAMAlias ) );
  ElseIf( Scan( '\', sCAMAlias ) > 0 );
    sGrpNameAlias = SubSt( sCAMAlias, Scan( '\', sCAMAlias ) + 1, Long( sCAMAlias ) - Scan( '\', sCAMAlias ) );
  Else;
    sGrpNameAlias = vGroup;
  EndIf;
  If( sGrpNameAlias @<> AttrS( '}Groups', vGroup, 'Caption_Default' ) );
    AttrPutS( sGrpNameAlias, '}Groups', vGroup, 'Caption_Default', 1 );
  EndIf;
  nCount = nCount + 1;
End;

####################
# Clients
sDefaultUsr = CellGetS( cCubSys, 'Default User', 'String' );
If( DimIx( cDimClients, sDefaultUsr ) = 0 ); 
  DimensionElementInsert( cDimClients, '', sDefaultUsr, 'N' );
EndIf;
If( DimIx( cDimClients2, sDefaultUsr ) = 0 ); 
  DimensionElementInsert( cDimClients2, '', sDefaultUsr, 'N' );
EndIf;
nClients = DimSiz('}Clients');
nCount = 1;
While( nCount <= nClients );
  vClient = DimNm( '}Clients', nCount );
  If( CellGetS( '}ClientGroups', vClient, sGrpAPQUsr ) @<> sGrpAPQUsr );
    AssignClientToGroup( vClient, sGrpAPQUsr );
  EndIf;
  If( DimIx( '}Clients', vClient ) >= 1 & vClient @<> sDefaultUsr ); 
    DimensionElementInsert( cDimClients, '', vClient, 'N' );
    DimensionElementInsert( cDimClients2, '', vClient, 'C' );
    DimensionElementComponentAdd( cDimClients2, vClient, sDefaultUsr, 1 );
  EndIf;
  If( CellGetS( '}ClientGroups', vClient, 'Admin') @= 'Admin' );
     DimensionElementComponentAdd( cDimClients, 'Admin Users', vClient, 1 );
     DimensionElementComponentAdd( cDimClients2, 'Admin Users', vClient, 1 );
  Else;
    DimensionElementComponentAdd( cDimClients, 'End Users', vClient, 1 );
    DimensionElementComponentAdd( cDimClients2, 'End Users', vClient, 1 );
  EndIf;
  sCAMAlias = AttrS( '}Clients', vClient, '}TM1_DefaultDisplayValue' );
  If( sCAMAlias @= '' );
    AttrPutS( vClient, '}Clients', vClient, '}TM1_DefaultDisplayValue', 1 );
  EndIf;
  If( Scan( '/', sCAMAlias ) > 0 );
    sUsrNameAlias = SubSt( sCAMAlias, Scan( '/', sCAMAlias ) + 1, Long( sCAMAlias ) - Scan( '/', sCAMAlias ) );
  ElseIf( Scan( '\', sCAMAlias ) > 0 );
    sUsrNameAlias = SubSt( sCAMAlias, Scan( '\', sCAMAlias ) + 1, Long( sCAMAlias ) - Scan( '\', sCAMAlias ) );
  Else;
    sUsrNameAlias = vClient;
  EndIf;
  If( sUsrNameAlias @<> AttrS( '}Clients', vClient, 'Caption_Default' ) & DIMIX( '}Clients' , sUsrNameAlias ) = 0 );
    AttrPutS( sUsrNameAlias, '}Clients', vClient, 'Caption_Default', 1 );
  EndIf;
  nCount = nCount + 1;
End;

####################
# APQ Clients
# If we are unwinding and not deleting all elements in }APQ Clients dimension then we need to check if any users have been deleted
If( bPreserveUsers = 1 );
  nClients = DimSiz( cDimClients );
  nCount = 1;
  While( nCount <= nClients );
    vClient = DimNm( cDimClients, nCount );
    If( DType( cDimClients, vClient ) @= 'N' & vClient @<> sDefaultUsr & DimIx( '}Clients', vClient ) = 0 ); 
      DimensionElementInsert( cDimClients, '', 'Deleted Users', 'C' );
      DimensionElementComponentAdd( cDimClients, 'Deleted Users', vClient, 1 );
      AttrPutN( 1, cDimClients, vClient, 'IsDeleted' );
      AttrPutS( TimSt( Now(), CellGetS('}APQ Settings', 'Date format','String') ), cDimClients, vClient, 'DeletedDate' );
      sCAMAlias = AttrS( cDimClients, vClient, '}TM1_DefaultDisplayValue' );
      sCAMAlias = If( sCAMAlias @= '', vClient, sCAMAlias );
      LogOutput( 'WARN', Expand( 'Deletion of user detected! %sCAMAlias% moved to Deleted Users node in %cDimClients%' ) );
    EndIf;
    nCount = nCount + 1;
  End;
EndIf;

####################
# Applications
# (incl. flat object list in TM1 Objects dim; flat list needed for calculations)
sDim = '}ApplicationEntries';
nCount = DIMSIZ( sDim );
WHILE( nCount > 0);
  sApp = DIMNM( sDim, nCount );
  sTyp = DTYPE( sDim, sApp );
  DimensionElementInsert( cDimApps, '', sApp, sTyp );
  DimensionElementInsert( cDimObjs, '', sApp, 'N' );
  DimensionElementComponentAdd( cDimObjs, 'Total ' | cNDimApps, sApp, 1 );
  sPar = ELPAR( sDim, sApp, 1 );
  If( sPar @<> '' );
    DimensionElementInsert( cDimApps, '', sPar, 'C' );
    DimensionElementComponentAdd( cDimApps, sPar, sApp, 1 );
  EndIf;
  nCount = nCount - 1;
END;

####################
# Checks

# Framework license key
cTestVal1 = CellGetS( cCubSys, 'Customer Key', 'String' );
cTestVal2 = DimNm( '}APQ Escape Characters', 1 );
cTestVal3 = CellGetS( cCubSys, 'Customer Name', 'String' );

# Check the TM1 version versus the minimum requirements
If( nTM1Version < cTM1MinVer );
    sTM1MinVer  = NumberToString( cTM1MinVer );
    sMsg        = Expand('TM1 server version does not meet minimum requirements for Framework of %sTM1MinVer%. Please check installed PAL version and TM1 Version entry in }APQ Settings cube.');
    LogOutput( 'WARN', sMsg );
    ItemReject( sMsg );
EndIf;

### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,560
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
### Iterate cubes and dimensions

# Cube-Dimension Relationships
CubeClearData( cCubDimUse );

sDim = '}Cubes';
nMax = DimSiz( sDim );
nCtr = 1;
sSub = 'All Cubes';
sMDX = Expand('{TM1SORT( {FILTER( {TM1SUBSETALL( [%cDimObjs%].[%cDimObjs%] )}, [%cDimObjs%].[%cDimObjs%].CurrentMember.Properties("IsCube") = "TRUE")}, ASC)}');
If( SubsetExists( cDimObjs, sSub ) = 1 );
    SubsetMDXSet( cDimObjs, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimObjs, 0);
EndIf;
If( DimIx( cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
EndIf;
sSub = 'CELL SECURITY';
sMDX = Expand('{FILTER( {TM1SUBSETALL( [%cDimCubes%].[%cDimCubes%] )}, [%cDimCubes%].[%cDimCubes%].CurrentMember.Properties("CELL_SECURITY") = "TRUE")}');
If( SubsetExists( cDimCubes, sSub ) = 1 );
    SubsetMDXSet( cDimCubes, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimCubes, 0);
EndIf;
If( DimIx( cDimSubs, cDimCubes|':'|cDimCubes|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimCubes|':'|cDimCubes|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimCubes|':'|cDimCubes|':'|sSub, 'Source' );
EndIf;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    sLoadOnDemand = CellGetS( '}CubeProperties', sEl, 'DEMANDLOAD' );
    If( CubeExists( sEl ) = 0 );
        LogOutput( 'WARN', Expand('%sEl% exists in }Cubes dimension but is not registered as a cube!') );
    ElseIf( DimIx( cDimCubes, sEl ) = 0 );
        LogOutput( 'WARN', Expand('%sEl% exists in }Cubes dimension but not in }APQ Cubes.') );
    Else;
        AttrPutS( 'TRUE', cDimObjs, sEl, 'IsCube' );
        If( CubeExists( '}CubeAttributes' ) = 1 );
            sCaption = If( CellGetS( '}CubeAttributes', sEl, 'Caption' ) @= '', sEl, CellGetS( '}CubeAttributes', sEl, 'Caption' ) );
        Else;
            sCaption = sEl;
        EndIf;
        AttrPutS( sCaption, cDimCubes, sEl, 'Caption' );
        AttrPutS( sCaption, cDimObjs, sEl, 'Caption' );
        If( DimIx( cDimVues, sEl ) > 0 );
            AttrPutS( sCaption, cDimVues, sEl, 'Caption' );
        EndIf;
        If( CubeExists( '}CellSecurity_' | sEl ) = 1 );
            AttrPutS( 'TRUE', cDimCubes, sEl, 'CELL_SECURITY' );
            CellPutS( 'Y', '}CubeProperties', sEl, 'CELL_SECURITY' );
        EndIf;
        If( DimIx( cCubVue, sEl ) = 0 );
        ElseIf( CellGetN( cCubVue, sEl, 'IsDefaultView' ) = 1 );
            AttrPutS( 'TRUE', cDimCubes, sEl, 'HASDEFAULTVIEW' );
            CellPutS( 'YES', '}CubeProperties', sEl, 'HASDEFAULTVIEW' );
        Else;
            AttrPutS( 'FALSE', cDimCubes, sEl, 'HASDEFAULTVIEW' );
            CellPutS( 'NO', '}CubeProperties', sEl, 'HASDEFAULTVIEW' );
        EndIf;
        If( SubSt( sEl, 1, 4 ) @= '}APQ' & SubSt( sEl, 1, 7 ) @<> '}APQ C3' );
            sRule = cAPQFolder | sEl | '.rux';
        ElseIf( ( SubSt( sEl, 1, 23 ) @= '}ElementAttributes_}APQ' & SubSt( sEl, 1, 26 ) @<> '}ElementAttributes_}APQ C3' ) );
            sRule = cAPQFolder | sEl | '.rux';
        Else;
            sRule = cDataFolder | sEl | '.rux';
        EndIf;
        If( FileExists( sRule ) = 1 );
            AttrPutS( 'TRUE', cDimObjs, sEl, 'IsRule' );
        EndIf;
        # for the }Cube_dimName subsets in the }APQ Dimensions dimension exclude control cubes but INCLUDE }APQ cubes
        If( SubSt( sEl, 1, 1 ) @<> '}' % SubSt( sEl, 1, 4 ) @= '}APQ' );
            If( sLoadOnDemand @<> 'YES' );
                iDim = 1;
                sSub = '}Cube_' | sEl;
                If( SubsetExists( cDimDims, sSub ) = 1 );
                    SubsetDeleteAllElements( cDimDims, sSub );
                Else;
                    SubsetCreate( cDimDims, sSub );
                EndIf;
                While( TabDim( sEl, iDim ) @<> '' );
                    sCubDim = TabDim( sEl, iDim );
                    SubsetElementInsert( cDimDims, sSub, sCubDim, 0 );
                    iDim = iDim + 1;
                End;
                If( DimIx( cDimSubs, cDimDims|':'|cDimDims|':'|sSub ) > 0 );
                    AttrPutS( cAPQSubSrc, cDimSubs, cDimDims|':'|cDimDims|':'|sSub, 'Source' );
                    CellPutS( cAPQSubSrc, cDimSubs, cDimDims|':'|cDimDims|':'|sSub, 'Source' );
                EndIf;
            EndIf;
        EndIf;
        # for the Cube-Dimension relationships. (Need to do separately not in the loop above since must be for ALL cubes and not skip control cubes) 
        If( sLoadOnDemand @= 'YES' );
            LogOutput( 'INFO', Expand('%sEl% is set to load on demand. Cataloging of cube dimensions will be skipped to avoid loading cube into memory.') );
        Else;
            iDim = 1;
            While( TabDim( sEl, iDim ) @<> '' );
                sCubDim = TabDim( sEl, iDim );
                If( DimIx( cDimDims, sCubDim ) > 0 );
                    CellPutN( iDim, cCubDimUse, sEl, sCubDim, 'Position' );
                EndIf;
                iDim = iDim + 1;
            End; 
            # Subset of views per cube in APQ Cube Views & APQ Views
            sVueCub = '}Views_' | sEl;
            If( DimensionExists( sVueCub ) = 1 ); If( DimSiz( sVueCub ) >= 1 );
                If( SubsetExists( cDimVues, sEl ) = 1 );
                    SubsetDeleteAllElements( cDimVues, sEl );
                Else;
                    SubsetCreate( cDimVues, sEl );
                EndIf;
                If( SubsetExists( cDimVues2, sEl ) = 1 );
                    SubsetDeleteAllElements( cDimVues2, sEl );
                Else;
                    SubsetCreate( cDimVues2, sEl );
                EndIf;
                nVues = DimSiz( sVueCub );
                nCountVue = 1;
                While( nCountVue <= nVues );
                    sVue = DimNm( sVueCub, nCountVue );
                    sCubVue = sEl |'\'| sVue;
                    If( DimIx( cDimVues, sCubVue ) = 0 ); DimensionElementInsertDirect( cDimVues, '', sCubVue, 'N' ); EndIf;
                    SubsetElementInsert( cDimVues, sEl, sCubVue, 0 );
                    If( DimIx( cDimVues2, sVue ) = 0 ); DimensionElementInsertDirect( cDimVues2, '', sVue, 'N' ); EndIf;
                    SubsetElementInsert( cDimVues2, sEl, sVue, 0 );
                    nCountVue = nCountVue + 1;
                End;
                If( DimIx( cDimSubs, cDimVues|':'|cDimVues|':'|sEl ) > 0 );
                    AttrPutS( cAPQSubSrc, cDimSubs, cDimVues|':'|cDimVues|':'|sEl, 'Source' );
                    CellPutS( cAPQSubSrc, cDimSubs, cDimVues|':'|cDimVues|':'|sEl, 'Source' );
                EndIf;
                If( DimIx( cDimSubs, cDimVues2|':'|cDimVues2|':'|sEl ) > 0 );
                    AttrPutS( cAPQSubSrc, cDimSubs, cDimVues2|':'|cDimVues2|':'|sEl, 'Source' );
                    CellPutS( cAPQSubSrc, cDimSubs, cDimVues2|':'|cDimVues2|':'|sEl, 'Source' );
                EndIf;
            EndIf; EndIf;
        EndIf;
    EndIf;
    # increment cube counter
    nCtr = nCtr + 1;
End;

sDim = '}Dimensions';
nMax = DimSiz( sDim );
nCtr = 1;
sSub = 'All Dimensions';
sMDX = Expand('{TM1SORT( {FILTER( {TM1SUBSETALL( [%cDimObjs%].[%cDimObjs%] )}, [%cDimObjs%].[%cDimObjs%].CurrentMember.Properties("IsDimension") = "TRUE")}, ASC)}');
If( SubsetExists( cDimObjs, sSub ) = 1 );
    SubsetMDXSet( cDimObjs, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimObjs, 0);
EndIf;
If( DimIx( cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
EndIf;
sSub = 'ELEMENT SECURITY';
sMDX = Expand('{FILTER( {TM1SUBSETALL( [%cDimDims%].[%cDimDims%] )}, [%cDimDims%].[%cDimDims%].CurrentMember.Properties("ELEMENT_SECURITY") = "TRUE")}');
If( SubsetExists( cDimDims, sSub ) = 1 );
    SubsetMDXSet( cDimDims, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimDims, 0);
EndIf;
If( DimIx( cDimSubs, cDimDims|':'|cDimDims|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimDims|':'|cDimDims|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimDims|':'|cDimDims|':'|sSub, 'Source' );
EndIf;
sSub = 'ALTERNATE HIERARCHIES';
If( SubsetExists( cDimDims, sSub ) = 1 );
    SubsetDeleteAllElements( cDimDims, sSub );
Else;
    SubsetCreate( cDimDims, sSub );
EndIf;
If( DimIx( cDimSubs, cDimDims|':'|cDimDims|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimDims|':'|cDimDims|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimDims|':'|cDimDims|':'|sSub, 'Source' );
EndIf;
sSub = 'ELEMENT SECURITY';
If( SubsetExists( cDimHier, sSub ) = 1 );
    SubsetDeleteAllElements( cDimHier, sSub );
Else;
    SubsetCreate( cDimHier, sSub );
EndIf;
If( DimIx( cDimSubs, cDimHier|':'|cDimHier|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimHier|':'|cDimHier|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimHier|':'|cDimHier|':'|sSub, 'Source' );
EndIf;
sSub = 'ALTERNATE HIERARCHIES';
If( SubsetExists( cDimHier, sSub ) = 1 );
    SubsetDeleteAllElements( cDimHier, sSub );
Else;
    SubsetCreate( cDimHier, sSub );
EndIf;
If( DimIx( cDimSubs, cDimHier|':'|cDimHier|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimHier|':'|cDimHier|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimHier|':'|cDimHier|':'|sSub, 'Source' );
EndIf;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    If( DimensionExists( sEl ) = 0 );
        LogOutput( 'WARN', Expand('%sEl% exists in }Dimensions dimension but is not registered as a dimension!') );
    ElseIf( DimIx( cDimDims, sEl ) = 0 & Scan( ':', sEl ) = 0 );
        If( SubSt( sEl, 1, 9 ) @= '}Subsets_' % SubSt( sEl, 1, 13 ) @= '}Hierarchies_' % SubSt( sEl, 1, 7 ) @= '}Views_' );
            # OK
        Else;
            LogOutput( 'WARN', Expand('%sEl% exists in }Dimensions dimension but not in }APQ Dimensions.') );
        EndIf;
    ElseIf( Scan( ':', sEl ) > 0 );
        # update dimenion & hierarchy attributes
        If( DimIx( cDimHier, sEl ) > 0 );
            sDimMain = SubSt( sEl, 1, Scan( ':', sEl ) - 1 );
            sHier = SubSt( sEl, Scan( ':', sEl ) + 1, Long( sEl ) - Long( sDimMain ) );
            AttrPutS( sDimMain, cDimHier, sDimMain|':'|sDimMain, 'Dimension' );
            AttrPutS( sDimMain, cDimHier, sEl, 'Dimension' );
            AttrPutS( sDimMain, cDimHier, sDimMain|':'|sDimMain, 'Hierarchy' );
            AttrPutS( sHier, cDimHier, sEl, 'Hierarchy' );
            If( CubeExists( '}DimensionAttributes' ) = 1 );
                sCaption = If( CellGetS( '}DimensionAttributes', sEl, 'Caption' ) @= '', sEl, CellGetS( '}DimensionAttributes', sEl, 'Caption' ) );
            Else;
                sCaption = sEl;
            EndIf;
            AttrPutS( sCaption, cDimHier, sEl, 'Caption' );
            If( DimIx( cDimSubs, sEl ) > 0 );
                AttrPutS( sCaption, cDimSubs, sEl, 'Caption' );
            EndIf;
        EndIf;
    ElseIf( Scan( ':', sEl ) = 0 & DimIx( cDimDims, sEl ) > 0 & SubSt( sEl, 1, 9 ) @<> '}Subsets_' & SubSt( sEl, 1, 13 ) @<> '}Hierarchies_' & SubSt( sEl, 1, 7 ) @<> '}Views_' );
        # }Subsets, }Views & }Hierarchies dims no longer added to }APQ Dimensions so 2nd half of above test redundant but on initial post-upgrade run elements might still exist
        AttrPutS( 'TRUE', cDimObjs, sEl, 'IsDimension' );
        AttrPutS( sEl, cDimHier, sEl, 'Dimension' );
        If( DimIx( cDimHier, sEl|':'|sEl ) > 0 );
            AttrPutS( sEl, cDimHier, sEl|':'|sEl, 'Dimension' );
            AttrPutS( sEl, cDimHier, sEl|':'|sEl, 'Hierarchy' );
        EndIf;
        If( CubeExists( '}DimensionAttributes' ) = 1 );
            sCaption = If( CellGetS( '}DimensionAttributes', sEl, 'Caption' ) @= '', sEl, CellGetS( '}DimensionAttributes', sEl, 'Caption' ) );
        Else;
            sCaption = sEl;
        EndIf;
        AttrPutS( sCaption, cDimDims, sEl, 'Caption' );
        AttrPutS( sCaption, cDimHier, sEl, 'Caption' );
        AttrPutS( sCaption |' (same named hierarchy)', cDimHier, sEl|':'|sEl, 'Caption' );
        AttrPutS( sCaption, cDimObjs, sEl, 'Caption' );
        If( CubeExists( '}ElementSecurity_' | sEl ) = 1 );
            AttrPutS( 'TRUE', cDimDims, sEl, 'ELEMENT_SECURITY' );
            CellPutS( 'Y', '}DimensionProperties', sEl, 'ELEMENT_SECURITY' );
            SubsetElementInsert( cDimHier, 'ELEMENT SECURITY', sEl, 0 );
        EndIf; 
        If( DimensionExists( '}Hierarchies_' | sEl ) = 1 ); If( DimSiz( '}Hierarchies_' | sEl ) >= 2 );
            AttrPutS( 'TRUE', cDimDims, sEl, 'HASHIERARCHIES' );
            CellPutS( 'Y', '}DimensionProperties', sEl, 'HASHIERARCHIES' );
            SubsetElementInsert( cDimDims, 'ALTERNATE HIERARCHIES', sEl, 0 );
            SubsetElementInsert( cDimHier, 'ALTERNATE HIERARCHIES', sEl, 0 );
            sMDX = Expand('{[%cDimHier%].[%sEl%].Children}');
            If( SubsetExists( cDimHier, '}Hierarchies_' | sEl ) = 1 );
                SubsetMDXSet( cDimHier, '}Hierarchies_' | sEl, sMDX );
            Else;
                SubsetCreatebyMDX( '}Hierarchies_' | sEl, sMDX, cDimHier );
            EndIf;
            If( DimIx( cDimSubs, cDimHier|':'|cDimHier|':'|'}Hierarchies_'|sEl ) > 0 );
                AttrPutS( cAPQSubSrc, cDimSubs, cDimHier|':'|cDimHier|':'|'}Hierarchies_'|sEl, 'Source' );
                CellPutS( cAPQSubSrc, cDimSubs, cDimHier|':'|cDimHier|':'|'}Hierarchies_'|sEl, 'Source' );
            EndIf;
        EndIf; EndIf;
        If( DimIx( cCubSub, sEl ) = 0 );
        ElseIf( CellGetN( cCubSub, sEl, 'IsDefaultSubset' ) = 1 );
            AttrPutS( 'TRUE', cDimDims, sEl, 'HASDEFAULTSUBSET' );
            CellPutS( 'YES', '}DimensionProperties', sEl, 'HASDEFAULTSUBSET' );
        Else;
            AttrPutS( 'FALSE', cDimDims, sEl, 'HASDEFAULTSUBSET' );
            CellPutS( 'NO', '}DimensionProperties', sEl, 'HASDEFAULTSUBSET' );
        EndIf;
        # Subset of attributes per dimension in APQ Dimension Attributes
        sDimAttr = '}ElementAttributes_' | sEl;
        If( DimensionExists( sDimAttr ) = 1 );
            AttrPutS( 'TRUE', cDimDims, sEl, 'HASATTRIBUTES' );
            If( SubsetExists( cDimAttrs, sEl ) = 1 );
                SubsetDeleteAllElements( cDimAttrs, sEl );
            Else;
                SubsetCreate( cDimAttrs, sEl );
                DimensionElementInsertDirect( cDimSubs, '', cDimAttrs |':'| cDimAttrs, 'C' );
                DimensionElementInsertDirect( cDimSubs, '', cDimAttrs |':'| cDimAttrs |':'| sEl, 'N' );
                DimensionElementComponentAddDirect( cDimSubs, cDimAttrs, cDimAttrs |':'| cDimAttrs, 1 );
                DimensionElementComponentAddDirect( cDimSubs, cDimAttrs |':'| cDimAttrs, cDimAttrs |':'| cDimAttrs |':'| sEl, 1 );
                DimensionElementInsertDirect( cDimSubs2, '', sEl, 'N' );
                DimensionElementComponentAddDirect( cDimSubs2, 'Dim:' | cDimAttrs, sEl, 1 );
            EndIf;
            nAttrs = DimSiz( sDimAttr );
            nCountAttr = 1;
            While( nCountAttr <= nAttrs );
                sAttr = DimNm( sDimAttr, nCountAttr );
                If( DimIx( cDimAttrs, sAttr ) = 0 ); DimensionElementInsertDirect( cDimAttrs, '', sAttr, 'N' ); EndIf;
                SubsetElementInsert( cDimAttrs, sEl, sAttr, 0 );
                nCountAttr = nCountAttr + 1;
            End;
            If( DimIx( cDimSubs, cDimAttrs|':'|cDimAttrs|':'|sEl ) > 0 );
                AttrPutS( cAPQSubSrc, cDimSubs, cDimAttrs|':'|cDimAttrs|':'|sEl, 'Source' );
                CellPutS( cAPQSubSrc, cDimSubs, cDimAttrs|':'|cDimAttrs|':'|sEl, 'Source' );
            EndIf;
        Else;
            AttrPutS( '', cDimDims, sEl, 'HASATTRIBUTES' );
        EndIf;
        # Subset of subsets per dimension in APQ Dimension Subsets & APQ Subsets
        sSubDim = '}Subsets_' | sEl;
        If( DimensionExists( sSubDim ) = 1 ); If( DimSiz( sSubDim ) >= 1 );
            If( SubsetExists( cDimSubs, sEl ) = 1 );
                SubsetDeleteAllElements( cDimSubs, sEl );
            Else;
                SubsetCreate( cDimSubs, sEl );
                DimensionElementInsertDirect( cDimSubs, '', cDimSubs |':'| cDimSubs, 'C' );
                DimensionElementInsertDirect( cDimSubs, '', cDimSubs |':'| cDimSubs |':'| sEl, 'N' );
                DimensionElementComponentAddDirect( cDimSubs, cDimSubs, cDimSubs |':'| cDimSubs, 1 );
                DimensionElementComponentAddDirect( cDimSubs, cDimSubs |':'| cDimSubs, cDimSubs |':'| sEl, 1 );
                DimensionElementInsertDirect( cDimSubs, '', cDimSubs2 |':'| cDimSubs2, 'C' );
                DimensionElementInsertDirect( cDimSubs, '', cDimSubs2 |':'| cDimSubs2 |':'| sEl, 'N' );
                DimensionElementComponentAddDirect( cDimSubs, cDimSubs2, cDimSubs2 |':'| cDimSubs2, 1 );
                DimensionElementComponentAddDirect( cDimSubs, cDimSubs2 |':'| cDimSubs2, cDimSubs2 |':'| cDimSubs2 |':'| sEl, 1 );
            EndIf;
            If( DimIx( cDimSubs, cDimSubs|':'|cDimSubs|':'|sEl ) > 0 );
                AttrPutS( cAPQSubSrc, cDimSubs, cDimSubs|':'|cDimSubs|':'|sEl, 'Source' );
                CellPutS( cAPQSubSrc, cDimSubs, cDimSubs|':'|cDimSubs|':'|sEl, 'Source' );
            EndIf;
            If( SubsetExists( cDimSubs2, sEl ) = 1 );
                SubsetDeleteAllElements( cDimSubs2, sEl );
            Else;
                SubsetCreate( cDimSubs2, sEl );
                DimensionElementInsertDirect( cDimSubs2, '', sEl, 'N' );
                DimensionElementComponentAddDirect( cDimSubs2, 'Dim:' | cDimSubs, sEl, 1 );
                DimensionElementComponentAddDirect( cDimSubs2, 'Dim:' | cDimSubs2, sEl, 1 );
            EndIf;
            If( DimIx( cDimSubs, cDimSubs2|':'|cDimSubs2|':'|sEl ) > 0 );
                AttrPutS( cAPQSubSrc, cDimSubs, cDimSubs2|':'|cDimSubs2|':'|sEl, 'Source' );
                CellPutS( cAPQSubSrc, cDimSubs, cDimSubs2|':'|cDimSubs2|':'|sEl, 'Source' );
            EndIf;
            # SW 20181218 in 11.4 format of elements in }Subsets dims changed from subsetName to hierarchyName:subsetName (for subsets in alternate hierarchies, element names for subsets of same named hierarchiy are unchanged)
            nSubs = DimSiz( sSubDim );
            nCountSub = 1;
            While( nCountSub <= nSubs );
                sSub = DimNm( sSubDim, nCountSub );
                If( Scan( ':', sSub ) > 0 );
                    sHierSub = sSub;
                    sHier    = SubSt( sHierSub, 1, Scan( ':', sHierSub ) - 1 );
                    sSub     = SubSt( sHierSub, Scan( ':', sHierSub ) + 1, Long(sHierSub) );
                Else;
                    sHier    = sEl;
                    sHierSub = sEl |':'| sSub;
                EndIf;
                sDimHier= sEl |':'| sHier;
                sDimSub = sEl |':'| sHierSub;
                If( DimIx( cDimSubs, sDimSub ) = 0 ); 
                    DimensionElementInsertDirect( cDimSubs, '', sDimHier, 'C' );
                    DimensionElementInsertDirect( cDimSubs, '', sDimSub, 'N' ); 
                EndIf;
                SubsetElementInsert( cDimSubs, sEl, sDimSub, 0 );
                If( DimIx( cDimSubs2, sSub ) = 0 ); 
                    DimensionElementInsertDirect( cDimSubs2, '', sSub, 'N' ); 
                EndIf;
                SubsetElementInsert( cDimSubs2, sEl, sSub, 0 );
                nCountSub = nCountSub + 1;
            End;
        EndIf; EndIf;
    EndIf;
    nCtr = nCtr + 1;
End;

# Dimension Attributes DETAIL
If( pViewSub @>= '1' );
    sProc = '}APQ.Cub.DimensionAttributes.Update';
    nRet = ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDimension', '', 'pClear', pClear );
EndIf;

# Dimension Subsets DETAIL
If( pViewSub @>= '1' );
    sProc = '}APQ.Cub.DimensionSubsets.Update';
    nRet = ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pForceLargeDimRefresh', '0', 'pDebug', '0' );
EndIf;

# Cube Views DETAIL
If( pViewSub @>= '1' );
    sProc = '}APQ.Cub.CubeViews.Update';
    nRet = ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging );
EndIf;

sDim = '}Processes';
nMax = DimSiz( sDim );
nCtr = 1;
sSub = 'All Processes';
sMDX = Expand('{TM1SORT( {FILTER( {TM1SUBSETALL( [%cDimObjs%].[%cDimObjs%] )}, [%cDimObjs%].[%cDimObjs%].CurrentMember.Properties("IsProcess") = "TRUE")}, ASC)}');
If( SubsetExists( cDimObjs, sSub ) = 1 );
    SubsetMDXSet( cDimObjs, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimObjs, 0);
EndIf;
If( DimIx( cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
EndIf;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    AttrPutS( 'TRUE', cDimObjs, sEl, 'IsProcess' );
    If( CubeExists( '}ProcessAttributes' ) = 1 );
        sCaption = If( CellGetS( '}ProcessAttributes', sEl, 'Caption' ) @= '', sEl, CellGetS( '}ProcessAttributes', sEl, 'Caption' ) );
    Else;
        sCaption = sEl;
    EndIf;
    AttrPutS( sCaption, cDimProcs, sEl, 'Caption' );
    AttrPutS( sCaption, cDimObjs, sEl, 'Caption' );
    nCtr = nCtr + 1;
End;

sDim = '}Chores';
nMax = DimSiz( sDim );
nCtr = 1;
sSub = 'All Chores';
sMDX = Expand('{TM1SORT( {FILTER( {TM1SUBSETALL( [%cDimObjs%].[%cDimObjs%] )}, [%cDimObjs%].[%cDimObjs%].CurrentMember.Properties("IsChore") = "TRUE")}, ASC)}');
If( SubsetExists( cDimObjs, sSub ) = 1 );
    SubsetMDXSet( cDimObjs, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimObjs, 0);
EndIf;
If( DimIx( cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
EndIf;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    AttrPutS( 'TRUE', cDimObjs, sEl, 'IsChore' );
    If( CubeExists( '}ChoreAttributes' ) = 1 );
        sCaption = If( CellGetS( '}ChoreAttributes', sEl, 'Caption' ) @= '', sEl, CellGetS( '}ChoreAttributes', sEl, 'Caption' ) );
    Else;
        sCaption = sEl;
    EndIf;
    AttrPutS( sCaption, cDimChores, sEl, 'Caption' );
    AttrPutS( sCaption, cDimObjs, sEl, 'Caption' );
    nCtr = nCtr + 1;
End;

sDim = '}ApplicationEntries';
nMax = DimSiz( sDim );
nCtr = 1;
sSub = 'All Applications';
sMDX = Expand('{TM1SORTBYINDEX( {FILTER( {TM1SUBSETALL( [%cDimObjs%].[%cDimObjs%] )}, [%cDimObjs%].[%cDimObjs%].CurrentMember.Properties("IsApp") = "TRUE")}, ASC)}');
If( SubsetExists( cDimObjs, sSub ) = 1 );
    SubsetMDXSet( cDimObjs, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimObjs, 0);
EndIf;
If( DimIx( cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimObjs|':'|cDimObjs|':'|sSub, 'Source' );
EndIf;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    AttrPutS( 'TRUE', cDimObjs, sEl, 'IsApp' );
    nCtr = nCtr + 1;
End;

sDim = '}Clients';
nMax = DimSiz( sDim );
nCtr = 1;
sSub = 'ADMINS';
sMDX = Expand('{TM1SORT( {FILTER( {TM1SUBSETALL( [%cDimClients%].[%cDimClients%] )}, [%cDimClients%].[%cDimClients%].[Admin User] = 1)}, ASC)}');
If( SubsetExists( cDimClients, sSub ) = 1 );
    SubsetMDXSet( cDimClients, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimClients, 0);
EndIf;
SubsetAliasSet( cDimClients, sSub, '}TM1_DefaultDisplayValue');
If( DimIx( cDimSubs, cDimClients|':'|cDimClients|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimClients|':'|cDimClients|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimClients|':'|cDimClients|':'|sSub, 'Source' );
EndIf;
sMDX = Expand('{TM1SORT( {FILTER( {TM1SUBSETALL( [%cDimClients2%].[%cDimClients2%] )}, [%cDimClients2%].[%cDimClients2%].[Admin User] = 1)}, ASC)}');
If( SubsetExists( cDimClients2, sSub ) = 1 );
    SubsetMDXSet( cDimClients2, sSub, sMDX );
Else;
    SubsetCreatebyMDX( sSub, sMDX, cDimClients2, 0);
EndIf;
SubsetAliasSet( cDimClients2, sSub, '}TM1_DefaultDisplayValue');
If( DimIx( cDimSubs, cDimClients2|':'|cDimClients2|':'|sSub ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, cDimClients2|':'|cDimClients2|':'|sSub, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, cDimClients2|':'|cDimClients2|':'|sSub, 'Source' );
EndIf;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    sAlias = AttrS( sDim, sEl, '}TM1_DefaultDisplayValue' );
    AttrPutS( sAlias, cDimClients, sEl, '}TM1_DefaultDisplayValue', 1 );
    AttrPutS( sAlias, cDimClients2, sEl, '}TM1_DefaultDisplayValue', 1 );
    AttrPutS( sAlias, cDimClients, sEl, 'Caption', 1 );
    sAlias = AttrS( sDim, sEl, 'Caption_Default' );
    AttrPutS( sAlias, cDimClients, sEl, 'Caption_Default', 1 );
    AttrPutS( sAlias, cDimClients2, sEl, 'Caption_Default', 1 );
    AttrPutS( sAlias, cDimClients, sEl, 'Caption', 1 );
    AttrPutS( sAlias, cDimClients2, sEl, 'Caption', 1 );
    If( CellGetS( '}ClientGroups', sEl, 'ADMIN' ) @= 'ADMIN' );
        AttrPutN( 1, cDimClients, sEl, 'AdminUser' );
        AttrPutN( 1, cDimClients2, sEl, 'AdminUser' );
    Else;
        AttrPutN( 0, cDimClients, sEl, 'AdminUser' );
        AttrPutN( 0, cDimClients2, sEl, 'AdminUser' );
    EndIf;
    sUniqID = CellGetS( '}ClientProperties', sEl, 'UniqueID' );
    AttrPutS( sUniqID, cDimClients, sEl, 'UniqueID' );
nCtr = nCtr + 1;
End;

sDim = '}Groups';
nMax = DimSiz( sDim );
nCtr = 1;
While( nCtr <= nMax );
    sEl = DimNm( sDim, nCtr );
    sAlias = AttrS( sDim, sEl, '}TM1_DefaultDisplayValue' );
    AttrPutS( sAlias, cDimGroups, sEl, '}TM1_DefaultDisplayValue', 1 );
    sAlias = AttrS( sDim, sEl, 'Caption_Default' );
    AttrPutS( sAlias, cDimGroups, sEl, 'Caption_Default', 1 );
    AttrPutS( sAlias, cDimGroups, sEl, 'Caption', 1 );
    nCtr = nCtr + 1;
End;

nClients = DimSiz( cDimClients );
nCount = 1;
While( nCount <= nClients );
  Client = DimNm( cDimClients, nCount );
  If( DType( cDimClients, vClient ) @= 'N' & DimIx( '}Clients', vClient ) > 0 ); 
    AttrPutN( 0, cDimClients, vClient, 'IsDeleted' );
    AttrPutS( '', cDimClients, vClient, 'DeletedDate' );
  EndIf;
  nCount = nCount + 1;
End;

##############################################################################################################
### Logging - common script 	----------------- START
If( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While( nCountTime <= nTotalLogTime );    sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
  CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' ); CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
  CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' ); CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
  CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' ); CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
  CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );  nCountTime = nCountTime + 1; End;
  If( nDataRecordCount > 0 ); If( cCubTgt @<> '' ); CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' ); EndIf; EndIf;
EndIf;
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;If(d@<>e);ProcessQuit;ENDIf;
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
