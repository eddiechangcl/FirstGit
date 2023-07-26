601,100
602,"}APQ.Cub.DimensionSubsetUse.Update.1.GenerateCmd"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,"apliqo_reader"
565,"fsOS\1nD6;QquMHIlw@NOEBCd2Wv>@dB_XbTszTdh0uK6v`5;<NUfWWoiJQk=7ECHzLh<7jWPkGDJ\DptCLs]0S@c@1CnsoLGgN3>yO\zxsV@ijI5VWf4lV?q>qDxIqD\RgQ_^6B^BEPNzHh:5DwEcugFowS2V]>2]_Rmgu\lCgTcol6H2Rzcj<;P:6=>vQa1;bC5P2e"
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
570,
571,All
569,0
592,0
599,1000
560,4
pDoProcessLogging
pDim
pSub
pDebug
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pDim,""
pSub,""
pDebug,"0"
637,4
pDoProcessLogging,"Optional: Record in process log"
pDim,"Required: Dimension name"
pSub,"Required: Subset name"
pDebug,"Optional: Write debug log file?"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,177
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
### 	This process generates and executes a batch
### DATA SOURCE:
### 	None.
### INTENDED USAGE:
### 	To assist in development and troubleshoting to determine in which views a subset is used. Partucularly for the use case where 
### 	a subset cannot be deleted due to being used in a view.
### NOTE:
###     Only catalogs subsets from same named hierarchy used in "traditional" views (*.vue files). Subset dependencies for subsets used in MDX views and Workspace views are not considdered.
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDim:%pDim% & pSub:%pSub% & pDebug:%pDebug%' );
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

cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDataLoc        = CellGetS( cCubParam, 'Location: DataDir', 'String' );
cDataLoc        = IF( SubSt( cDataLoc, Long( cDataLoc ), 1 ) @<> '\', cDataLoc, SubSt( cDataLoc, 1, Long( cDataLoc ) - 1 ) );
cDataDrive      = SubSt( cDataLoc, 1, 2 );
cScriptLoc      = CellGetS( cCubParam, 'Location: Scripts', 'String' );
cScriptLoc      = cScriptLoc | IF( SubSt( cScriptLoc, Long( cScriptLoc ), 1 ) @<> '\', '\', '' );
cExportLoc      = CellGetS( cCubParam, 'Location: Export', 'String' );
cExportLoc      = cExportLoc | IF( SubSt( cExportLoc, Long( cExportLoc ), 1 ) @<> '\', '\', '' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';

cMaxWaitCycles  = 5;
cScriptFile     = 'FindSubsetInViews.bat';
cSourceFile     = 'FindSubsetInViews.txt';
sScriptFile     = cScriptLoc | cScriptFile;
sSourceFile     = cExportLoc | cSourceFile;

# Set quote character to blank. Important for generating the batch file.
DatasourceAsciiQuoteCharacter = '';

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( DimensionExists( pDim ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDim; 
EndIF;

IF( pSub @<> '' & DimensionExists( pDim ) = 1 );
   IF( SubsetExists( pDim, pSub ) = 0 );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid subset:' | pDim |'\'| pSub;
   EndIF;
EndIF;

IF( pSub @<> '' & pDim @= '' );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Cannot define subset without context of dimension!';
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
### Clear any existing script & output files

sCmd = Expand( 'cmd /c del "%sScriptFile%"' );
ExecuteCommand( sCmd, 0 );
sCmd = Expand( 'cmd /c del "%sSourceFile%"' );
ExecuteCommand( sCmd, 0 );
Sleep( 250 );

######################
### Generate batch script

# when writing output file TI releases lock at the end of each tab. Therefore generate batch file here and execute it on the Epilog

sCmdLine = '@echo off';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = 'setlocal enableDelayedExpansion';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = ':: Define LF to contain a lineFeed';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = 'set ^"LF=^';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '^" The empty line above is critical - DO NOT REMOVE';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '::Define CR variable containing a carriage return (0x0D)';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = 'for /f %%a in (''copy /Z "%~dpf0" nul'') do set "CR=%%a"';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = cDataDrive;
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = Expand( 'cd "%cDataLoc%"' );
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = '::regex "!CR!*!LF!" will match both Unix and Windows style End-Of-Line';
AsciiOutput( sScriptFile, sCmdLine );
sCmdLine = Expand( 'findstr /n /r /s /i /m /c:"7,%pDim%!CR!*!LF!6,%pSub%!CR!*!LF!" *.vue > "%sSourceFile%"' );
AsciiOutput( sScriptFile, sCmdLine );

######################
### Assign data source

DatasourceType = 'NULL';

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,56
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
### Execute batch script

# Can't wait for batch file to finish executing as sometimes FINDSTR can hang indefinately. Therefore need to put in sleep to allow for output file generation.
# As file generation can sometimes take a while more efficient to wait although this has risks. If process hangs then can switch to wait for file method !

iSleepCycleCount = 0;

# If switching to wait method then set wait argument to false
ExecuteCommand( sScriptFile, 1 );

# If switching to wait method then remove or comment out the non-executing IF
IF( 1 = 0 );
While( FileExists( sSourceFile ) = 0 );
   iSleepCycleCount = iSleepCycleCount  + 1;
   # from trial and error sometimes 2 sec not enough but also could sometimes need more than 3!!
   Sleep( 3000 );
   IF( iSleepCycleCount > cMaxWaitCycles );
      Break;
   EndIF;
End;
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
