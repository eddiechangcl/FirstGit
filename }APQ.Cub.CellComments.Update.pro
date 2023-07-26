601,100
602,"}APQ.Cub.CellComments.Update"
562,"VIEW"
586,"}APQ 50 Dim Cube"
585,"}APQ 50 Dim Cube"
564,
565,"l\30^BJw=9l4p\d[4^4p@F87kdg]cN4;iID`oxE8>DX1O?A1]tJvgOT^s?ucnCNOWUagiy0Vn2?iT6@QsTHW=QvY5z?oqbK9aQ5Hksc0?xM<C`B?V3QgLPHp]=gKfq=Qp?q?aIoMi38}G_j_E?J>`f0xrNNy5A]pUW?x8x7\?46W2sZOjQ:7F?@BHR:eB?;HWvxg12`G"
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
pCube
pDebug
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pCube,""
pDebug,"0"
637,3
pDoProcessLogging,"Log to process logging cube"
pCube,"Cube"
pDebug,"Debug?"
577,51
V1
V2
V3
V4
V5
V6
V7
V8
V9
V10
V11
V12
V13
V14
V15
V16
V17
V18
V19
V20
V21
V22
V23
V24
V25
V26
V27
V28
V29
V30
V31
V32
V33
V34
V35
V36
V37
V38
V39
V40
V41
V42
V43
V44
V45
V46
V47
V48
V49
V50
Value
578,51
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
1
579,51
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
580,51
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
581,51
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
582,51
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
603,0
572,209
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
### Create }CellComments_<cubename>_}APQ cube if it doesn't exist
### Read in the comments from the }CellAnnotations_<cubename> cube 

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pCube:' | pCube |' & '| 'pDebug:' | pDebug;
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

cCubSrc         = '}CellAnnotations_' | pCube;
cDimAnnotation  = '}Annotation_ApplicationID';
cDimAnnotationM = '}AnnotationMeasures';
cDimIdx         = '}APQ Cell Comment Index';
cDimMeas        = '}APQ Cell Comment Measure';
cAnnotationM    = 'Annotations';

cCubParam       = '}APQ Settings';
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName;
cSubSrc         = cViewSrc;

cCubTgt         = CellGetS( cCubParam, 'Std Comment Cube Name', 'String' );
IF( Scan( '<cube>', cCubTgt ) = 1 );
  cCubTgt       = pCube | SubSt( cCubTgt, 7, Long( cCubTgt ) - 6 );
Else;
  cCubTgt       = SubSt( cCubTgt, 1, Scan( '<cube>', cCubTgt ) - 1 ) | pCube | SubSt( cCubTgt, Scan( '<cube>', cCubTgt ) + 6, Long( cCubTgt ) - Scan( '<cube>', cCubTgt ) + 5 );
EndIF;
cViewTgt        = CellGetS( cCubParam, 'Std Localized Default', 'String' );
cSubTgt         = CellGetS( cCubParam, 'Std All Elements', 'String' );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cPathDebugging  = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugFile      = cPathDebugging | IF( SubSt( cPathDebugging, Long( cPathDebugging ), 1 ) @= '\', '', '\' ) | sThisProcName |'_Debug_'| TimSt( Now,  '\Y\m\d\h\i\s' );
sNumFormat      = '#,##0.00';
sDecSep         = '.';
sThouSep        = ',';
nDebug          = StringToNumber( pDebug );

cDimUser        = '}APQ Clients';
cDimCubes       = '}APQ Cubes';
cDimObjs        = '}APQ TM1 Objects';
cTotCubes       = 'Total APQ Cubes';

cMaxDims        = 40;
nRet            = 0;
nErr            = 0;
sErr            = '';

### Initialise Debug ###

If( pDebug @>= '1' );

  # Set debug file name
  sDebugFile = cDebugFile | '_Prolog.txt';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: pCube: ' | pCube );

EndIf;

### If no cubes in the model have annotations added then we can at least create them

IF( DimensionExists( cDimAnnotation ) = 0 );
  DimensionCreate( cDimAnnotation );
  DimensionElementInsert( cDimAnnotation, '', '}*', 'S' );
EndIF;

IF( DimensionExists( cDimAnnotationM ) = 0 );
  DimensionCreate( cDimAnnotationM );
  DimensionElementInsert( cDimAnnotationM, '', cAnnotationM, 'S' );
EndIF;

### Check that a cell annotation cube actually exists, if not then exit

IF( CubeExists( pCube ) = 0 );
  nErr      = nErr + 1;
  sErr      = sErr | If( sErr @= '', '', ' & ' ) | 'The cube does not exist: ' | pCube;
Else;
  IF( CubeExists( cCubSrc ) = 0 );
    nErr    = nErr + 1;
    sErr    = sErr | If( sErr @= '', '', ' & ' ) | 'Cube ' | pCube | ' has no cell annotations.';
  EndIF;
EndIF;

IF( nErr > 0 );
  DatasourceType = 'NULL';
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

### Create the target cube if it doesn't exist

IF( CubeExists( cCubTgt ) = 0 );
  nDim = 1;
  sCubDims = '';
  While( TabDim( pCube, nDim ) @<> '' );
    sDim = TabDim( pCube, nDim );
    sCubDims = sCubDims | sDim | sDelimDim;
    nDim = nDim + 1;
  End;
  nDim = nDim - 1;
  IF( nDim > cMaxDims );
    nErr = nErr + 1;
    sErr = sErr | If( sErr @= '', '', ' & ' ) | 'Cube ' | pCube | ' has more then the allowed maximum number of dimensions of ' | NumberToString( cMaxDims );
  Else;
    # add the additional dims: }Annotation_ApplicationID at start as per }CellAnnotations but replace }AnnotationMeasures at end with Comment Index and Comment Measure
    sCubDims = cDimAnnotation | sDelimDim | sCubDims | cDimIdx | sDelimDim | cDimMeas;
    sProc = '}bedrock.cube.create';
    nRet = ExecuteProcess( sProc, 
      'pCube', cCubTgt,
      'pDims', sCubDims, 
      'pRecreate', 0, 
      'pDelim', sDelimDim, 
      'pLogOutput', 0
    );
    IF( nRet > ProcessExitNormal );
      nErr = nErr + 1;
      sErr = sErr | If( sErr @= '', '', ' & ' ) | 'Could not create cube ' | cCubTgt;
    Else;
      DimensionElementInsert( cDimCubes, '', cCubTgt, 'N' );
      DimensionElementComponentAdd( cDimCubes, cTotCubes, cCubTgt, 1 );
      DimensionElementInsert( cDimObjs, '', cCubTgt, 'N' );
      DimensionElementComponentAdd( cDimObjs, cTotCubes, cCubTgt, 1 );
      IF( pDebug @>= '1' );
        ASCIIOutput( sDebugFile, 'New cube created: ' | cCubTgt );
      EndIF;
    EndIF;
  EndIF;
EndIF;

IF( nErr > 0 );
  DatasourceType = 'NULL';
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

### Determine the number of dimensions if target cube wasn't already created. Reject if more than allowed for in the Data tab

nDim    = 1;
While( TabDim( pCube, nDim ) @<> '' );
  nDim  = nDim + 1;
End;
nDim    = nDim - 1;

IF( nDim > cMaxDims );
  nErr = nErr + 1;
  sErr = sErr | If( sErr @= '', '', ' & ' ) | 'Cube ' | pCube | ' has more then the allowed maximum number of dimensions of ' | NumberToString( cMaxDims );
  DatasourceType = 'NULL';
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

### Define View
sProc = '}bedrock.cube.view.create';
ExecuteProcess( sProc, 'pLogOutput', 0,
  'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', '', 
  'pSuppressZero', 1, 'pSuppressConsol', 1, 'pSuppressRules', 1, 
  'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
  'pTemp', 1
);

DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

######################
### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,512
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
  sDebugFile = cDebugFile | '_Data.txt';

EndIf;

######################
### Data script

# If the measure from the annotations cube is anything other than "Annotations" then we have hit something unexpected
# (since the }CellAnnotations cube has 2 additional dimensions from the base cube add 2 to the max dim index to get the measure dimension)
sAnnotationM = Expand( '%V' | NumberToString( nDim + 2 ) | '%' );
IF(  sAnnotationM @<> cAnnotationM );
  sErr = 'Unknown annotation format! ' | sAnnotationM;
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, sErr );
  EndIF;
  ItemReject( sErr );
EndIF;

nBreak = Now + ( 1 / 86400 );

# Need to read from format of the Annotations measure [{ caption, creator, id, properties { commentLocation, commentType, commentValue, objectName}, timeCreated },{...}]
# We can ignore commentLocation & objectName since these are redundant as they are encoded already in the cube address of the data
# Simply chop up the Annotation string by searching for the distinct components. Simple algorithm, first locate the measure then obtain the value by searching for the start and end quotes
# The algorithm relies on the order of the annotation string array always being consistent. No reason to think it would not be
# In the instance that a comment contains a quote this will be escaped with a backslash and apear as \" - this is not handled

nCommentIndex = 0;
sAnnotation = sValue;

IF( pDebug @>= '1' );
  ASCIIOutput( sDebugFile, '' );
  ASCIIOutput( sDebugFile, 'Full cell annotation.' );
  ASCIIOutput( sDebugFile, sAnnotation );
EndIF;

While( Scan( '{"caption":', sAnnotation ) > 0 );
  nCommentIndex = nCommentIndex + 1;
  sCommentIndex = NumberToString( nCommentIndex );
  nStart = Scan( '{"caption":', sAnnotation ) + 12;
  nEnd = Scan( '","creator":', sAnnotation );
  sCaption = SubSt( sAnnotation, nStart, nEnd - nStart );
  nStart = nEnd + 13;
  nEnd = Scan( '","id":', sAnnotation );
  sUser = SubSt( sAnnotation, nStart, nEnd - nStart );
  # in case using CAM make sure we have the display name
  IF( DimIx( '}Clients', sUser ) > 0 & DimIx( '}ElementAttributes_}Clients', '}TM1_DefaultDisplayValue' ) > 0 );
    sUser = IF( AttrS( '}Clients', sUser, '}TM1_DefaultDisplayValue' ) @= '', sUser, AttrS( '}Clients', sUser, '}TM1_DefaultDisplayValue' ) );
  EndIF;
  nStart = nEnd + 8;
  nEnd = Scan( '","properties":', sAnnotation );
  sID = SubSt( sAnnotation, nStart, nEnd - nStart );
  # cell value property only present if annotation made with Workspace or UX. If from Perspectives or TM1Web this is not present
  nStart = Scan( '"cellValue":', sAnnotation ) + 13;
  nEnd = Scan( '","commentLocation":', sAnnotation );
  If( nStart > 0 );
    sValueOrig = SubSt( sAnnotation, nStart, nEnd - nStart );
  Else;
    sValueOrig = '';
  EndIf;
  nStart = Scan( '"commentType":', sAnnotation ) + 15;
  nEnd = Scan( '","commentValue":', sAnnotation );
  sType = SubSt( sAnnotation, nStart, nEnd - nStart );
  nStart = nEnd + 18;
  nEnd = Scan( '","objectName":', sAnnotation );
  sComment = SubSt( sAnnotation, nStart, nEnd - nStart );
  nStart = Scan( '"},"timeCreated":', sAnnotation ) + 18;
  nEnd = nStart + 14;
  sTimestamp = SubSt( sAnnotation, nStart, nEnd - nStart );
  # format the timestamp to YYYY-MM-DD HH:mm:ss
  sTimeStamp = SubSt( sTimeStamp, 1, 4 ) |'-'| SubSt( sTimeStamp, 5, 2 ) |'-'| SubSt( sTimeStamp, 7, 2 ) |' '| SubSt( sTimeStamp, 9, 2 ) |':'| SubSt( sTimeStamp, 11, 2 ) |':'| SubSt( sTimeStamp, 13, 2 );

  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, 'Caption', sCaption ); ASCIIOutput( sDebugFile, 'User', sUser ); ASCIIOutput( sDebugFile, 'ID', sID ); ASCIIOutput( sDebugFile, 'Type', sType ); 
    ASCIIOutput( sDebugFile, 'Comment', sComment ); ASCIIOutput( sDebugFile, 'Timestamp', sTimestamp );
  EndIF;

  # Chop off the annotation after timeCreated. If multiple comments are entered inthe cell then the loop will continue otherwise will exit
  sAnnotation = SubSt( sAnnotation, nEnd, Long( sAnnotation ) - nEnd );

  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, '' ); ASCIIOutput( sDebugFile, 'Remaining cell annotation.' ); ASCIIOutput( sDebugFile, sAnnotation );
  EndIF;

  # send the measures into the }APQ cell comment cube 
  IF( nDim = 2 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3, sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx( CellGetN( pCube, V2, V3 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 3 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 4 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 5 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 6 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 7 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 8 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 9 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 10 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 11 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 12 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 13 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 14 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 15 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 16 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 17 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 18 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 19 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 20 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 21 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 22 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 23 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 24 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 25 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 26 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 27 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 28 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 29 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 30 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 31 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 32 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 33 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 34 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 35 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 36 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 37 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 38 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 39 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, sCommentIndex, 'CellValue' );
  ElseIF( nDim = 40 );
    CellPutS( sCaption, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'Caption' );
    CellPutS( sUser, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'User' );
    CellPutS( sID, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'ID' );
    CellPutS( sType, cCubTgt, V1, V2, V3,V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41,  sCommentIndex, 'Type' );
    CellPutS( sComment, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'Comment' );
    CellPutS( sTimestamp, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'Timestamp' );
    sCellValue = NumberToStringEx(CellGetN( pCube, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41 ), sNumFormat, sDecSep, sThouSep );
    CellPutS( sCellValue, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'CurrentCellValue' );
    CellPutS( sValueOrig, cCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V36, V37, V38, V39, V40, V41, sCommentIndex, 'CellValue' );
  EndIF;

  IF( Now > nBreak );
    sAnnotation = '';
    IF( pDebug @>= '1' );
      ASCIIOutput( sDebugFile, 'ERROR! Forced to break while loop parsing cell annotation due to time exceeded.' );
    EndIF;
    Break;
  EndIF;

End; 

######################
### END Data
575,97
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

### Initialise Debug ###

If( pDebug @>= '1' );

  # Set debug file name
  sDebugFile = cDebugFile | '_Epilog.txt';

EndIf;

### Set security for the comment cube

IF( CubeExists( cCubTgt ) = 1 );
  IF( DimIx( '}Groups', 'APQ' ) > 0 );
    CellPutS( 'READ', '}CubeSecurity', cCubTgt, 'APQ' );
  EndIF;
EndIF;

### For target cube create a default view showing all comments from the source cube

IF( CubeExists( cCubTgt ) = 1 & CubeExists( pCube ) = 1 );
  IF( ViewExists( cCubTgt, cViewTgt ) = 0 );
    ViewCreate( cCubTgt, cViewTgt );
    ViewSuppressZeroesSet( cCubTgt, cViewTgt, 1 );
    nDim = 1;
    While( TabDim( pCube, nDim ) @<> '' );
      sDim = TabDim( pCube, nDim );
      ViewRowDimensionSet( cCubTgt, cViewTgt, sDim, nDim );
      IF( SubsetExists( sDim, cSubTgt ) = 1 );
        ViewSubsetAssign( cCubTgt, cViewTgt, sDim, cSubTgt );
      EndIF;
      nDim = nDim + 1;
    End;
    ViewRowDimensionSet( cCubTgt, cViewTgt, cDimAnnotation, nDim );
    ViewRowDimensionSet( cCubTgt, cViewTgt, cDimIdx, nDim + 1 );
    IF( SubsetExists( cDimIdx, cSubTgt ) = 1 );
      ViewSubsetAssign( cCubTgt, cViewTgt, cDimIdx, cSubTgt );
    EndIF;   
    ViewColumnDimensionSet( cCubTgt, cViewTgt, cDimMeas, 1);
    IF( SubsetExists( cDimMeas, cSubTgt ) = 1 );
      ViewSubsetAssign( cCubTgt, cViewTgt, cDimMeas, cSubTgt );
    EndIF;   
  EndIF;
  sView = 'zDrill to Cell Comments';
  IF( ViewExists( cCubTgt, sView ) = 0 );
    ViewCreate( cCubTgt, sView );
    ViewSuppressZeroesSet( cCubTgt, sView, 1 );
    nDim = 1;
    While( TabDim( pCube, nDim ) @<> '' );
      sDim = TabDim( pCube, nDim );
      ViewTitleDimensionSet( cCubTgt, sView, sDim );
      nDim = nDim + 1;
    End;
    ViewRowDimensionSet( cCubTgt, sView, cDimAnnotation, 1 );
    ViewRowDimensionSet( cCubTgt, sView, cDimIdx, 2 );
    IF( SubsetExists( cDimIdx, cSubTgt ) = 1 );
      ViewSubsetAssign( cCubTgt, sView, cDimIdx, cSubTgt );
    EndIF;   
    ViewColumnDimensionSet( cCubTgt, sView, cDimMeas, 1);
    IF( SubsetExists( cDimMeas, cSubTgt ) = 1 );
      ViewSubsetAssign( cCubTgt, sView, cDimMeas, cSubTgt );
    EndIF;   
  EndIF;
EndIF;

IF( pDebug @>= '1' );
  ASCIIOutput( sDebugFile, 'Default view and drill to view created in Comment cube.' );
  # Log finish time
  AsciiOutput( sDebugFile, 'Process Finished: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );
EndIF;

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
