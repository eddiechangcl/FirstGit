601,100
602,"}APQ.Dim.Attr.Create"
562,"VIEW"
586,"}APQ Dimension Attributes"
585,"}APQ Dimension Attributes"
564,"apliqo_reader"
565,"gxkaCBDnh0@]uI@1;4CBMxbR=Df:6Yo348K@L\uM^[QYwxpbZ\ugk:Zi`@AoZnNC\ValL;6gZp@43[`\WHevnZtNfR93O\\WBJSSj^l2Q<t`>q`IeuXq0<QMA:2kiDmT=:Q]OmXUrkDb=dpcuQaMlM8KkMJya7V_W\R4Fqk4?FKiOj3YDOpx]v6Q:e8>zQlQF^11pqs"
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
From 	[apliqoC3].[salesforce].[T_CRM_D_Account];
567,","
588,"."
589,
568,""""
570,}TI_Dummy_View
571,All
569,0
592,0
599,1000
560,3
pDoProcessLogging
pDebug
pDim
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pDebug,"0"
pDim,""
637,3
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pDim,"The dimension to create attributes (Blank=ALL)"
577,4
vDim
vItem
vMeasure
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
572,137
##############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### PURPOSE:
### 	This process uses the cube }APQ Dimension Attributes as a data source to CREATE attributes. Existing attributes are not destroyed.
### 	This is intended to make creating multiple attributes at a time easier during development
### DATA SOURCE:
### 	Cube: }APQ Dimension Attributes
### INTENDED USAGE:
### 	Create attributes from text input
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2016-12-16 		Scott Wiltshire	Creation of Process
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDim:%pDim% & pDebug:%pDebug%' );
### Params
IF( pDoProcessLogging @= '1' );
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

cCubSrc         = '}APQ Dimension Attributes';
cCubTgt         = '}APQ Dimension Attribute Matrix';
cDimTgt         = '}ElementAttributes_' | pDim;
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

cDimDims        = '}APQ Dimensions';
cDimM           = cCubSrc | ' Measure';
sMeas           = 'ATTRIBUTE NAME';
sUpdate         = '';
sUpdateDims     = '';

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

If( pDim @<> '' );
  If( DimensionExists( pDim ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDim;
  Else;
    sUpdateDims = pDim | '+';
  EndIf;
EndIf;
nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Create the view to assign as data source for the process

sProc = '}bedrock.cube.view.create';
sFilter = Expand( '%cDimM%%sDelimEleStart%%sMeas%' ) | IF( pDim @= '', '', Expand( '%sDelimDim%%cDimDims%%sDelimEleStart%%pDim%' ) );
bSuppressNull = 1; bSuppressC = 1; bSuppressRule = 1;
ExecuteProcess( sProc, 'pLogOutput', nDebug, 
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1 
);

######################
### Assign data source

DataSourceType          = 'VIEW';
DataSourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

######################
### END Prolog
573,54
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
    nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Metadata.log';

######################
### Metadata script

If( DimensionExists( vDim ) = 0 );
    ItemSkip;
EndIf;

sDimAttr = '}ElementAttributes_' | vDim;
IF( DimensionExists( sDimAttr ) = 0 % DimIx( sDimAttr, sValue ) = 0 );
    sTyp = CellGetS( cCubSrc, vDim, vItem, 'TYPE' );
    If( sTyp @= '' );
        sTyp = 'S';
    Else;
        sTyp = Upper( sTyp );
    EndIf;
    If( Scan( sTyp, 'ANS' ) = 0 & Long( sTyp ) <> 1 );
        ItemSkip;
    EndIf;
    AttrInsert( vDim, '', sValue, sTyp );
    DimensionElementInsert( cCubSrc, '', sValue, 'N' );
    DimensionElementComponentAdd( cCubSrc, 'Total APQ Dimension Attributes', sValue, 1 );
    sUpdate = sUpdate | If( sUpdate @= '', '', '+' ) | vDim |':'| sValue |':'| sTyp;
    sUpdateDims = sUpdateDims | If( Scan( vDim, sUpdateDims ) = 0, vDim | '+', '' );
    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, Expand( '%sValue%[%sTyp%] created in %vDim%' ) );
        AsciiOutput( sDebugFile, 'Updated dims list = ' | sUpdateDims );
        AsciiOutput( sDebugFile, 'Update dim:attr list = ' | sUpdate );
    EndIF;
EndIF;

######################
### END Metadata

574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,84
###############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

######################
### Parse the update string to update the framework subsets

IF( Long( sUpdate ) > 0 );
   sUpdate = sUpdate | '+'; sDim = ''; sAttr = ''; sTyp = '';
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile,  'Update list = ' | sUpdate );
   EndIF;
   While( Scan( '+', sUpdate ) > 0 );
      sDim = SubSt( sUpdate, 1, Scan( ':', sUpdate ) - 1 ); sUpdate = SubSt( sUpdate, Long( sDim ) + 2, Long( sUpdate ) );
      sAttr = SubSt( sUpdate, 1, Scan( ':', sUpdate ) - 1 ); sUpdate = SubSt( sUpdate, Long( sAttr ) + 2, Long( sUpdate ) );
      sTyp = SubSt( sUpdate, 1, 1 ); sUpdate = SubSt( sUpdate, 3, Long( sUpdate ) );
      IF( pDebug @>= '1' );
         AsciiOutput( sDebugFile, 'Dim:' | sDim ); AsciiOutput( sDebugFile, 'Attr:' | sAttr ); AsciiOutput( sDebugFile, 'Type:' | sTyp );
         AsciiOutput( sDebugFile,  'Remaining  list = ' | sUpdate );
      EndIF;
      # update dimension attribute matrix cube
      CellPutN( 1, cCubTgt, sDim, sAttr, 'IsUsed' ); CellPutS( sTyp, cCubTgt, sDim, sAttr, 'Type' );
      # update dimension subset in dimension attribute dimension
      IF( SubsetExists( cCubSrc, sDim ) = 0 ); SubsetCreate( cCubSrc, sDim ); EndIF;
      SubsetElementInsert( cCubSrc, sDim, sAttr, 1 );
      # update attribute type subsets in attribute dimension
      IF( sTyp @= 'A' ); sSub = 'Alias '; ElseIF( sTyp @= 'S' ); sSub = 'String '; Else; sSub = 'Numeric '; EndIF; sSub = sSub | 'Attributes';
      sDimAttr = '}ElementAttributes_' | sDim;
      IF( SubsetExists( sDimAttr, sSub ) = 0 ); SubsetCreate( sDimAttr, sSub ); EndIF;
      SubsetElementInsert( sDimAttr, sSub, sAttr, 1 );
      IF( sTyp @= 'A' % sTyp @= 'S' ); sSub = 'String & Alias Attributes'; EndIF;
      IF( SubsetExists( sDimAttr, sSub ) = 0 ); SubsetCreate( sDimAttr, sSub ); EndIF;
      SubsetElementInsert( sDimAttr, sSub, sAttr, 1 );
   End;
   # force a change in input cube so rule calculated N measures will recalculate
   CellPutS( sRandomInt, cCubSrc, 'Total APQ Dimensions', 'Total Items', sMeas );
EndIF;

# Just in case user has overwritten existing attribute value in }APQ Dimension Attributes cube rather than adding new lines then re-fill cube for changed dimensions
While( Scan( '+', sUpdateDims ) > 0 );
    sDim = SubSt( sUpdateDims, 1, Scan( '+', sUpdateDims ) - 1 ); sUpdateDims = SubSt( sUpdateDims, Scan( '+', sUpdateDims ) + 1, Long( sUpdateDims ) );
    If( pDebug @>= '1' );
         AsciiOutput( sDebugFile, 'Updating Dimension Attributes cube for dim ' | sDim );
         AsciiOutput( sDebugFile,  'Remaining dim list = ' | sUpdateDims );
    EndIf;
    iAttr = 1;
    While( iAttr <= DimSiz( '}ElementAttributes_' | sDim ) );
        sAttr = DimNm( '}ElementAttributes_' | sDim, iAttr );
        sTyp = SubSt( DType( '}ElementAttributes_' | sDim, sAttr ), 2, 1 );
        CellPutS( sAttr, cCubSrc, sDim, NumberToString( iAttr ), 'ATTRIBUTE NAME' );
        CellPutS( sTyp, cCubSrc, sDim, NumberToString( iAttr ), 'TYPE' );
        iAttr = iAttr + 1;
    End;
End;

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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
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
