601,100
602,"}APQ.Cub.DimensionDefinitionSource.Load.Preview"
562,"ODBC"
586,"apliqoC3_READ"
585,"apliqoC3_READ"
564,"apliqo_reader"
565,"fT@:tznDz1gG20G9SCktJa3k@dcgt0kRa\Y`hWjfiT<@RtPwo1]Spw>njJ16m?LcGRxi\Aqh9J@D9GmlFBs8Hc=DTU=stnv:SAcpuUqAUYM@5KeIe[WUWbLbVk`eu9??7bt]?KM0el3z9y@<HPDXNbAn4Wts>G0GxsPr[8IUWrdOgO[7rJ2kh\>VhfkT_wAaQpJh@zyb"
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
566,1
Select * From apliqoC3.dbo.Dimension_Source
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,2
pDimension
pItem
561,2
2
2
590,2
pDimension,""
pItem,"1"
637,2
pDimension,"Dimension hierarchy to preview (to specify an alternate hierarchy use dim:hier)"
pItem,"The item to define the data source"
577,52
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
V51
V52
578,52
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
2
2
579,52
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
52
580,52
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
0
581,52
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
0
582,52
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
VarType=32ColType=827
VarType=32ColType=827
603,0
572,248
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
### Logging - common script 	-----------------  START
pDoProcessLogging = '1';
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDimension:%pDimension% & pItem:%pItem%' );
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

cCubSrc         = '}APQ Dimension Definition';
cCubTgt         = '}APQ Dimension Definition Source';
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = '|';
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );

nPreviewRows    = 50;
nErr            = 0;
sErr            = '';

######################
### Declare measure names to load within Expand loop

nVariables  = 52;
sMeas1      = 'vElement';
sMeas2      = 'vParent1';
sMeas3      = 'vParent2';
sMeas4      = 'vParent3';
sMeas5      = 'vParent4';
sMeas6      = 'vParent5';
sMeas7      = 'vParent6';
sMeas8      = 'vParent7';
sMeas9      = 'vParent8';
sMeas10     = 'vComment';
sMeas11     = 'vWeight';
sMeas12     = 'vType';
sMeas13     = 'vAttribute1';
sMeas14     = 'vAttribute2';
sMeas15     = 'vAttribute3';
sMeas16     = 'vAttribute4';
sMeas17     = 'vAttribute5';
sMeas18     = 'vAttribute6';
sMeas19     = 'vAttribute7';
sMeas20     = 'vAttribute8';
sMeas21     = 'vAttribute9';
sMeas22     = 'vAttribute10';
sMeas23     = 'vAttribute11';
sMeas24     = 'vAttribute12';
sMeas25     = 'vAttribute13';
sMeas26     = 'vAttribute14';
sMeas27     = 'vAttribute15';
sMeas28     = 'vAttribute16';
sMeas29     = 'vAttribute17';
sMeas30     = 'vAttribute18';
sMeas31     = 'vAttribute19';
sMeas32     = 'vAttribute20';
sMeas33     = 'vAttribute21';
sMeas34     = 'vAttribute22';
sMeas35     = 'vAttribute23';
sMeas36     = 'vAttribute24';
sMeas37     = 'vAttribute25';
sMeas38     = 'vAttribute26';
sMeas39     = 'vAttribute27';
sMeas40     = 'vAttribute28';
sMeas41     = 'vAttribute29';
sMeas42     = 'vAttribute30';
sMeas43     = 'vAttribute31';
sMeas44     = 'vAttribute32';
sMeas45     = 'vAttribute33';
sMeas46     = 'vAttribute34';
sMeas47     = 'vAttribute35';
sMeas48     = 'vAttribute36';
sMeas49     = 'vAttribute37';
sMeas50     = 'vAttribute38';
sMeas51     = 'vAttribute39';
sMeas52     = 'vAttribute40';

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
   nErr = 1;
   sErr = 'Apliqode customer key missing.';
EndIF;

# Check the dimension
IF( DimensionExists( pDimension ) = 0 % DIMIX( '}APQ Dimension Hierarchies', pDimension ) = 0 );
   nErr = 1;
   sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid dimension ' | pDimension;
Else;
    # Can set remaining constants which rely on valid pDimension param
    cSourceType     = CellGetS( cCubSrc, pDimension, pItem, 'Source Type', 'String' );
    cSourcePath     = CellGetS( cCubSrc, pDimension, pItem, 'CSV File Folder', 'String' );
    cSourceFile     = CellGetS( cCubSrc, pDimension, pItem, 'CSV File Name', 'String' );
    cCSVSrc         = cSourcePath |'\'| cSourceFile;
    IF( cSourceType @= 'ODBC' );
       cODBCSrc     = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ), 'String' );
       cODBCUsr     = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ) | 'User', 'String' );
       cODBCPwd     = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ) | ' Pwd', 'String' );
       cODBCQry     = CellGetS( cCubSrc, pDimension, pItem, 'SQL Query', 'String' );
    EndIF;
EndIF;

# Check the source type
IF( cSourceType @= 'CUBE' );
   # if the source type is cube then we can preview directly. No need to copy into the cube.
   ProcessBreak;
EndIF;

IF( cSourceType @<> 'ODBC' & cSourceType @<> 'CSV' );
   nErr = 1;
   sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid source type ' | cSourceType;
EndIF;

IF( cSourceType @= 'ODBC' );
   # Check that the ODBC source is not blank
   IF( cODBCSrc @= '' );
      nErr = 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'No ODBC data source.';
   EndIF;

   # Check the ODBC query is not blank
   IF( Scan( 'SELECT', Upper( cODBCQry ) ) <> 1 );
      nErr = 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Select not found at head of query.';
   Else;
      cODBCQry = 'SELECT TOP 50' | SubSt( cODBCQry, 7, Long( cODBCQry ) - 6 );
   EndIF;

EndIF;

IF( cSourceType @= 'CSV' );

   # Check the file exists
   IF( FileExists ( cCSVSrc ) = 0 );
      nErr = 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'File not found: ' | cCSVSrc;
   EndIF;

EndIF;

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
### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

CubeSetLogChanges( cCubTgt, 0 );

######################
### If required perform zero out on the target cube using Bedrock process
### As dimension could be a alternate hierarchy can't use : as bedrock delimiter which is the standard for eleStart. Therefore hard code to pipe (|)

sProc   = '}bedrock.cube.data.clear';
sFilter = Expand( '}APQ Dimension Hierarchies%sDelimEleStart%%pDimension%' );
ExecuteProcess( sProc,
    'pLogOutput', nDebug,
    'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', sFilter,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1,
    'pCubeLogging', 0
);

######################
### Assign data source

IF( cSourceType @= 'CSV' );
   DataSourceType                   = 'CHARACTERDELIMITED';
   DataSourceNameForServer          = cCSVSrc;
   DatasourceASCIIDelimiter         = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
   DatasourceASCIIDecimalSeparator  = CellGetS( cCubParam, 'DatasourceASCIIDecimalSeparator', 'String' );
   DatasourceASCIIQuoteCharacter    = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );
   DatasourceASCIIHeaderRecords     = 1;
ElseIF( cSourceType @= 'ODBC' );
   DatasourceType                   = 'ODBC';
   DatasourceNameForServer          = cODBCSrc;
   DatasourceQuery                  = cODBCQry;
Else;
   ProcessError;
EndIF;

######################
### END Prolog
573,12
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

574,43
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
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

IF( nDataRecordCount > nPreviewRows );
  ProcessBreak;
EndIF;

sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

iVar = 1;
sVar = '';
sMeas = '';
While( iVar <= nVariables );
   sVar = 'V' | NumberToString( iVar );
   sVar = Expand( '%' | Expand( '%sVar%' ) | '%' );
   sMeas = 'sMeas' | NumberToString( iVar );
   sMeas = Expand( '%' | Expand( '%sMeas%' ) | '%' );
   CellPutS( sVar, cCubTgt, pDimension, NumberToString( nDataRecordCount ), sMeas );
   iVar = iVar + 1;
End;


######################
### END Data
575,38
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
### Reenable data transaction logging to the target cube

CubeSetLogChanges( cCubTgt, 1 );

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
