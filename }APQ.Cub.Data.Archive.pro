601,100
602,"}APQ.Cub.Data.Archive"
562,"VIEW"
586,"}APQ Cube Data Archive"
585,"}APQ Cube Data Archive"
564,"apliqo_reader"
565,"jhrez0DnTOnPgx2RQb8_pSZOkRY6d5Eq6`CuhM8hM3fk5q0=kUGW^duDkAaZ_]DS`AVlLXH7:oHTm1ZvjOgAq`q=Zu=3gKsRNBu[v>X8hh\1wtfI5AifIFD_H@Z7<::rvNiXSuqgHW4uDv@;=>1QOf0rIjFe6NtW`XRT1u=8_1Bi?]CrmSAgQ>hHzuJz}1o1km_QQ=G"
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
589,","
568,""""
570,}TI_Dummy_View
571,All
569,0
592,0
599,1000
560,5
pDoProcessLogging
pDebug
pCube
pRuleValues
pClear
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pDebug,"0"
pCube,""
pRuleValues,"0"
pClear,"1"
637,5
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file? (Bedrock convention 0,1,2)"
pCube,"Cube: Blank=ALL"
pRuleValues,"Include rule calculated values? (default=false)"
pClear,"Clear archived data after export? (default=true)"
577,4
vCube
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
572,154
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

########################################################################################
### PURPOSE:
### This process utilizes }bedrock.cube.view.create, }bedrock.cube.data.export, }bedrock.cube.data.clear to create a wrapper to easily manage
### the task of archiving cube data.  Following export of data to text file the targeted cube area is cleared.
### 
### DATA SOURCE:
### }APQ Cube Data Archive to define the cube areas to archive. Then bedrock cube view filter to define each cube area to archive
###
### INTENDED USAGE:
### archiving cube data
### 
########################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDebug:' | pDebug |' & '| 'pCube:' | pCube |' & '| 'pRuleValues:' | pRuleValues |' & '| 'pClear:' | pClear;
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

######################
### Inits - declare constants

cCubSrc         = '}APQ Cube Data Archive';
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
cExportLoc      = CellGetS( cCubParam, 'Location: Export', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nRuleValues     = StringToNumber( pRuleValues );
nClear          = StringToNumber( pClear );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

DatasourceASCIIDelimiter        = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
DatasourceASCIIDecimalSeparator = CellGetS( cCubParam, 'DatasourceASCIIDecimalSeparator', 'String' );
DatasourceASCIIQuoteCharacter   = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );

######################
### Initialise Debug 

IF( pDebug @>= '1' );

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters:' );
  AsciiOutput( sDebugFile, 'pDoProcessLogging', pDoProcessLogging );
  AsciiOutput( sDebugFile, 'pCube', pCube );
  AsciiOutput( sDebugFile, 'pRuleValues', pRuleValues );
  AsciiOutput( sDebugFile, 'pClear', pClear );

EndIF;

######################
### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );
IF( pCube @<> '' );
  IF( CubeExists( pCube ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid cube:' | pCube; 
  EndIF;
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, '' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Create the view to assign as data source for the process

sFilter = IF( pCube @<> '', '}APQ Cubes' | sDelimEleStart | pCube, '' );
sFilter = sFilter | IF( pCube @<> '', sDelimDim, '' ) | '}APQ Cube Data Archive Measure'| sDelimEleStart |'Filter';

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, '' );
  AsciiOutput( sDebugFile, 'Creating source view with filter: ', sFilter );
EndIF;

IF( pDebug @<= '1' );
  sProc         = '}bedrock.cube.view.create';
  bSuppressNull = 1;
  bSuppressC    = 1;
  bSuppressRule = nRuleValues;
  ExecuteProcess( sProc,
      'pLogOutput', nDebug,
      'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
      'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
      'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle, 
      'pTemp', 1
  );
EndIF;

######################
### Assign data source

DataSourceType          = 'VIEW';
DataSourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

######################
### END Prolog

573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,177
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

sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

######################
### Disable data transaction logging to the target cube

CubeSetLogChanges( vCube, 0 );

######################
### Check for Reload mode

sReload = CellGetS( cCubSrc, vCube, vItem, 'Reload' );

######################
### Initialize archive variables

sFilter = sValue;
sFileName = CellGetS( cCubSrc, vCube, vItem, 'FileName' );
sFullFileName = CellGetS( cCubSrc, vCube, vItem, 'ExportFile' );
nTimeStamp = CellGetN( cCubSrc, vCube, vItem, 'nTimeStamp' );

### Debug
IF( pDebug @>= '1' & sReload @<> 'YES' );
  AsciiOutput( sDebugFile, 'Archiving:', vCube, sFilter );
  AsciiOutput( sDebugFile, 'To directory:', cExportLoc );
  AsciiOutput( sDebugFile, 'File:', sFileName );
  AsciiOutput( sDebugFile, 'Commencing export:', TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );
EndIF;

######################
### Validations

### Check if export has already been performed
IF( nTimeStamp > 0 & sReload @<> 'YES' );
  IF( pDebug @>= '1' );
    sMsg = 'Archive already exported on: ' | TimSt( nTimeStamp, CellGetS('}APQ Settings', 'Date Time format','String') );
    AsciiOutput( sDebugFile, sMsg );
    AsciiOutput( sDebugFile, 'Skipping export & clear.' );
  EndIF;
  IF( pDebug @<= '1' );
    ItemReject( sMsg );
  EndIF;
EndIF;

### check that file name is set
IF( sFileName @= '' );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'No file name for archive set!' );
    AsciiOutput( sDebugFile, 'Skipping export & clear.' );
  EndIF;
  IF( pDebug @<= '1' );
    ItemReject( sMsg );
  EndIF;
EndIF;

### check that archive of same name does not already exist
IF( FileExists( sFullFileName ) = 1 & sReload @<> 'YES' );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Archive file already exists:', sFullFileName );
    AsciiOutput( sDebugFile, 'Skipping export & clear.' );
  EndIF;
  IF( pDebug @<= '1' );
    ItemReject( sMsg | sFullFileName );
  EndIF;
EndIF;

######################
### Export data

IF( pDebug @<= '1' & sReload @<> 'YES' );
  sProc = '}bedrock.cube.data.export';
  ExecuteProcess( sProc, 'pLogoutput', nDebug,
      'pCube', vCube, 'pView', cViewSrc, 'pFilter', sFilter,
      'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
      'pSuppressZero', 1, 'pSuppressConsol', 1, 'pSuppressRules', nRuleValues,
      'pZeroSource', 0, 'pCubeLogging', 0, 'pTemp', 1,
      'pFilePath', cExportLoc, 'pFileName', sFileName,
      'pDelim', DatasourceASCIIDelimiter, 'pQuote', DatasourceASCIIQuoteCharacter, 'pTitleRecord', 1
  );
EndIF;

### Debug
IF( pDebug @>= '1' & sReload @<> 'YES' );
  AsciiOutput( sDebugFile, 'Cube data export finished:', TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );
  AsciiOutput( sDebugFile, 'Commencing data clear.' );
EndIF;

######################
### Write to timestamp

IF( sReload @<> 'YES' );
   CellPutN( Now, cCubSrc, vCube, vItem, 'nTimeStamp' );
EndIF;

######################
### Clear data after export

IF( pDebug @<= '1' & nClear = 1 & sReload @<> 'YES' );
  sProc = '}bedrock.cube.data.clear';
  ExecuteProcess( sProc, 'pLogOutput', nDebug,
      'pCube', vCube, 'pView', cViewSrc, 'pFilter', sFilter,
      'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
      'pTemp', 1, 'pCubeLogging', 0
  );
EndIF;

### Debug
IF( pDebug @>= '1' & sReload @<> 'YES' );
  AsciiOutput( sDebugFile, 'Cube data clear finished:', TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );
  AsciiOutput( sDebugFile, '' );
EndIF;

######################
### Reload Mode

IF( sReload @= 'YES' );

   IF( FileExists( sFullFileName ) = 0 );
      IF( pDebug @>= '1' );
         sMsg = 'Archive file not found cannot reload:' | sFullFileName;
         AsciiOutput( sDebugFile, sMsg );
      EndIF;
      IF( pDebug @<= '1' );
         ItemReject( sMsg );
      EndIF;
   EndIF;

   nChar = Scan( sFileName, sFullFileName ) - 2;
   sPath = SubSt( sFullFileName, 1, nChar );

   IF( pDebug @<= '1' );
      sProc = '}bedrock.cube.data.import';
      ExecuteProcess( sProc, 'pLogOutput', nDebug,
          'pSrcDir', sPath, 'pSrcFile', sFileName,
          'pCube', vCube, 'pDim', '', 'pSrcEle', '', 'pTgtEle', '',
          'pTitleRows', 1, 'pDelim', DatasourceASCIIDelimiter, 'pQuote', DatasourceASCIIQuoteCharacter,
          'pCumulate', 0, 'pCubeLogging', 0
      );
   EndIF;

   CellPutN( 0, cCubSrc, vCube, vItem, 'nTimeStamp' );

   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, 'Cube data reloaded from file: ' | sFullFileName, TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );
   EndIF;

EndIF;

######################
### Reenable data transaction logging to the target cube

CubeSetLogChanges( vCube, 1 );

######################
### END Data

575,33
###################################################################################################################
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
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

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
