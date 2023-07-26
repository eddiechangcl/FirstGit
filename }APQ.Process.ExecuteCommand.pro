601,100
602,"}APQ.Process.ExecuteCommand"
562,"NULL"
586,
585,
564,
565,"l?;oy?>d\8mnaf0MjQhI5yxv9ClfvEUDZkgMBXosp@xYI@LcBgo1lhLFk9?LmE]2Q?RYJLK2e3O_XMcxD4PyGEcjiK^q0QCv?ArYLWI\KtSN8\7V1>vl^e\p9=IMB0wY9g>7gH^NaixE8htfrO0Xhp`eOWTfGmzk5Dse=y6QuehYvHAZ8k?^=:Idp8yN>anXKMJRgzT8"
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
From 	[].[];
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
pCommand
pWait
pDebug
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pCommand,""
pWait,"0"
pDebug,"0"
637,4
pDoProcessLogging,"Log the process to the logging cube"
pCommand,"The full command line string to execute"
pWait,"Wait for command to finish 0=false 1=true"
pDebug,"Debug 0=false 1=true"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,113
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
### To execute a given command line instruction
### pCommand could be either the path to a batch file or the command strig to pass to the command prompt
### 

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pCommand:' | pCommand |' & '| 'pWait:' |  pWait |' & '| 'pDebug:' |  pDebug;
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

### Inits - declare constants
cCubInfo    = '}APQ Settings';
cDebugDir   = CellGetS( cCubInfo, 'Location: Debugging', 'String' );
cDebugDir   = cDebugDir | IF( SubSt( cDebugDir, Long( cDebugDir ) , 1 ) @= '\', '', '\' );
cTimeStamp  = TimSt( Now, '\Y\m\d\h\i\s' );
cDimTest    = '}APQ Escape Characters';
cTestVal1   = CellGetS( cCubInfo, 'Customer Key', 'String' );
cTestVal2   = DimNm( cDimTest, 1 );
cTestVal3   = CellGetS( cCubInfo, 'Customer Name', 'String' );
cDebugFile  = cDebugDir | GetProcessName() | '.' | cTimeStamp | '.Debug';
cBatchPath  = CellGetS( cCubInfo, 'Location: Scripts', 'String' );
cBatchPath  = cBatchPath | IF( SubSt( cBatchPath, Long( cBatchPath ) , 1 ) @= '\', '', '\' );
cBatchFile  = cBatchPath | sThisProcName |'_'| cTimeStamp | '.bat';

nRet        = 0;
nErr        = 0;
sErr        = '';

DatasourceASCIIQuoteCharacter = '';

### Initialise Debug ###

If( pDebug @>= '1' );

  # Set debug file name
  sDebugFile = cDebugFile | '.Prolog.txt';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: ' );
  AsciiOutput( sDebugFile, 'pCommand: ' | pCommand );
  AsciiOutput( sDebugFile, 'pWait: ' | pWait );
  AsciiOutput( sDebugFile, '' );

EndIf;

### Test parameters
nErr = IF( CellGetN( cCubInfo, 'Customer Name', 'Numeric' ) + CellGetN( cCubInfo, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( pCommand @= '' );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Command line is empty!';
EndIF;

IF( pWait @< '0' & pWait @> '1' );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Wait can only be 0 or 1!';
Else;
  pWait = NumberToString(Round( StringToNumber (pWait) ));
EndIF;

IF( nErr > 0 );
  If( pDebug @>= '1' );
    AsciiOutput( sDebugFile, '' );
    AsciiOutput( sDebugFile, sErr );
  EndIf;
  ItemReject( sErr );
EndIF;

### Generate the command

If( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Paramater validations passed.' );
  AsciiOutput( sDebugFile, '' );
  AsciiOutput( sDebugFile, 'Generating command line. . .' );
  AsciiOutput( sDebugFile, pCommand );
  AsciiOutput( sDebugFile, cBatchFile );
EndIf;

AsciiOutput( cBatchFile, pCommand );

### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,70
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
  sDebugFile = cDebugFile | '.Epilog.txt';
ENDIF;

### Check that batch file exists
If( FileExists( cBatchFile ) = 0 );
  nErr = 1;
  sErr = 'Batch file not found: ' | cBatchFile;
  If( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIf;
EndIf;

### Execute Batch File ###
If( pDebug @<= '1' & nErr = 0 );
  If( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'Executing command line. . .' );
  EndIf;
  ExecuteCommand( cBatchFile, StringToNumber(pWait) );
EndIf;

### Delete temporary batch file
If( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Delete: ' | cBatchFile );
EndIf;
ASCIIDelete( cBatchFile );

### Finalize Debug ###
If( pDebug @>= '1' );

  # Log errors
  If( nErr <> 0 );
    AsciiOutput( sDebugFile, 'Errors Occurred' );
  EndIf;

  # Log finish time
  AsciiOutput( sDebugFile, 'Process Finished: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

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
