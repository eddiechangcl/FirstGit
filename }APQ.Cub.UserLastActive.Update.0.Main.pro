601,100
602,"}APQ.Cub.UserLastActive.Update.0.Main"
562,"NULL"
586,"d:\tm1data\finance_test_v951\tm1s20110128184937.log"
585,"\\Phchbs-s3815\share\tm1s20110128184937.log"
564,
565,"bgaEPkANeK;T8Lxzutu];5ztD?FhU1>uGpB4T00G>uumtcr0=ZfqaupKQ4\Hol^\M5QcNRfp`Eyeh`Nah2>PbX?;?84xKz2qD:kQe[9f_nypLwV:Z46EzTYv>TDD?]6S?m7fLs4E]0]u7b]t7By<Tz`rAy:lW8:txO9?DF730@e>OQOWhuzi1sFlGlpSQvESt;KUWG9c"
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
589,"'"
568,""""
570,
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDebug
561,2
2
2
590,2
pDoProcessLogging,"1"
pDebug,"0"
637,2
pDoProcessLogging,"Record in log cube"
pDebug,"Debug mode (default = false no debug output)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,205
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

# This process processes tm1sYYYYMMDDHHMMSS.log transaction files in the server logging directory and loads the date stamp
# of changes to the ACTIVE field of the ClientProperties cube to a tracking cube.
# All tm1s.log files from a given start date are processed.  The active tm1s.log file is not processed. To ensure all logs are processed
# perform a SaveData prior to running.

# NOTE: requires the ClientPropertiesSyncInterval tm1s.cfg parameter AND logging switched on in the ClientProperties cu be in order to function

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDebug:' | pDebug;
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

### Constants ###

cProcess =      GetProcessName();
cTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
cLogDir         = GetProcessErrorFileDirectory();
sDebugFile      = cLogDir | cProcess | '.Debug.' | cTimeStamp | '.log';
cSubProcess     = '}APQ.Cub.UserLastActive.Update.1.ReadUsrConLog';
pCube           = '}APQ User Last Active';
pClientDim      = '}APQ Clients';
pDim            = '}APQ User Last Active Measure';

cMeasure        = 'Last Login';
cMeasure2       = cMeasure | ' Ordinal';
cCubTgt         = pCube;

nErrors         = 0;
nMetaDataCheck  = 0;

### Initialise Debug ###

IF( pDebug @>= '1' );

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, '            pDebug: ' | pDebug );

EndIF;

### Validate Parameters ###

# If invalid client dimension specified then abort
IF( DimensionExists(pClientDim) = 0 );
  nErrors = nErrors + 1;
  sMessage = 'invalid client dim!';
  IF( pDebug @>= '1' );
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  ItemReject( sMessage );
EndIF;

### Test for cube and dimension, create if necessary ###

IF( DimensionExists(pDim) = 0 );
  nMetaDataCheck = nMetaDataCheck + 1;
  IF( pDebug @>= '1' );
    sMessage = 'Creating dimension: ' | pDim;
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  DimensionCreate(pDim);
EndIF;

IF( DimIx(pDim, cMeasure) = 0 );
  nMetaDataCheck = nMetaDataCheck + 1;
  IF( pDebug @>= '1' );
    sMessage = 'Creating measure: ' | cMeasure;
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  DimensionElementInsert(pDim, '', cMeasure, 'S');
EndIF;

IF( DimIx(pDim, cMeasure2) = 0 );
  nMetaDataCheck = nMetaDataCheck + 1;
  IF( pDebug @>= '1' );
    sMessage = 'Creating measure: ' | cMeasure;
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  DimensionElementInsert(pDim, '', cMeasure2, 'S');
EndIF;

IF( CubeExists(pCube) = 0 );
  nMetaDataCheck = nMetaDataCheck + 1;
  IF( pDebug @>= '1' );
    sMessage = 'Creating cube: ' | pCube;
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  CubeCreate(pCube, pClientDim, pDim);
EndIF;

### Test for meta data editions and exit if required (need to close prolog for new meta data to take effect) ###

IF( nMetaDataCheck <> 0 );
   sMessage = 'New meta data created. Exiting prior to data processing as meta data must be saved before continuing.';
  IF( pDebug @>= '1' );
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  ProcessBreak;
EndIF;

### Test for validation errors and exit if required ###

IF( nErrors <> 0 );
   sMessage = 'Validation errors encountered. Exiting prior to data processing.';
  IF( pDebug @>= '1' );
    AsciiOutput(sDebugFile, sMessage);
  EndIF;
  ProcessError;
EndIF;

### Turn on logging ###

CubeSetLogChanges( pCube, 1 );

### Use WildcardFileSearch to lop through usrcon.log files in logging directory ###

sFilter = cLogDir | 'usrcon.log*';
sPrevFile = '';

IF( pDebug @>= '1' );
  sMessage = 'Commencing WildcardFileSearch with filter: ' | sFilter;
  AsciiOutput(sDebugFile, sMessage);
EndIF;

bContinue = 1;

While( bContinue = 1 );
   sFile = WildcardFileSearch(sFilter, sPrevFile);
   IF( sFile @<> '' );

      IF( pDebug @>= '1' );
         sMessage = 'Start processing file ' | sFile | ' at ' | TimSt( Now, CellGetS('}APQ Settings', 'Time format','String') );
         AsciiOutput(sDebugFile, sMessage);
      EndIF;

      # Call the sub process to process each log file
      nProcessReturnCode = ExecuteProcess(cSubProcess, 
         'pSourceFile', cLogDir | sFile, 
         'pDoProcessLogging', pDoProcessLogging 
      );
      IF( pDoProcessLogging @= '1' );
         CellPutN( nProcessReturnCode, sProcLogCube, sLogYear, sLogDay, sLogMinute, sLogSecond, cSubProcess, 'nProcessReturnCode' );
      EndIF;

      IF( pDebug @>= '1' );
         sMessage = 'Finished processing file ' | sFile | ' at ' | TimSt( Now, CellGetS('}APQ Settings', 'Time format','String') );
         AsciiOutput(sDebugFile, sMessage);
      EndIF;

    # look for next process error log after this one
    sPrevFile = sFile;

   Else;

      # no more tm1s.log files from the filter date
      IF( pDebug @>= '1' );
         sMessage = 'No more files found. Last file: ' | sPrevFile;
         AsciiOutput(sDebugFile, sMessage);
      EndIF;

      bContinue = 0;

   EndIF;
End;

### Finalise Debug ###

IF( pDebug @>= '1' );

  # Log end time
  AsciiOutput( sDebugFile, 'Process Finished: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

EndIF;

### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,27
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
