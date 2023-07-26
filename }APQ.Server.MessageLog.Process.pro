601,100
602,"}APQ.Server.MessageLog.Process"
562,"CHARACTERDELIMITED"
586,"..\Logs\tm1server.log"
585,"..\Logs\tm1server.log"
564,
565,"b9a9utuhYB\YX42jWI??jDntNBSsZ5JvHKDWX2<xgZQ]W2mPkuWC[3L0BcDsgY;ED<:BC_tfSYRd81vctCwv`tLVk\c\JaFBP@uKU8lmY6yULoauDpIAQpp@1VJvSbbNHih0l\KPRtxL5>1EHr2ZY5?Rf1XRWF\?O6;AKBnWELfYVoUmphoUH`c6qU?;o9mUNSKuoLeh"
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
567,"%"
588,"."
589,","
568,""
570,
571,
569,0
592,0
599,1000
560,6
pDoProcessLogging
pProcessFullLog
pSourceFile
pFileOut
pFileOutDep
pLoadToTM1
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1.000000"
pProcessFullLog,"0.000000"
pSourceFile,"tm1server.log"
pFileOut,"tm1server-log-analysis.csv"
pFileOutDep,"cube-dependency.csv"
pLoadToTM1,"0.000000"
637,6
pDoProcessLogging,"Record in process log"
pProcessFullLog,"Process full log or today only ( 1 / 0 )"
pSourceFile,"Logfile to process"
pFileOut,"Output file of the analysis in the Export directory"
pFileOutDep,"Output file of the cube dependicies in the Export directory"
pLoadToTM1,"Load straight to TM1 ( 1 / 0 )"
577,1
vLogLine
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
572,91
##############################################################################################################################
#Region Header
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
#Region @DOC
# Description:
# Process which reads _tm1server.log_ file and create a csv file log analysis. This process launches the processes
# **}APQ.Cub.ServerMessageLogInfo.Update** and **}APQ.Cub.CubeDependencyMap.Update** which used the csv file.
#
# Data Source:
# File: tm1server.log
#
# Use Case:
# Read the server message log file, clean the text and get useful information and export to the target csv file
#EndRegion @DOC
##############################################################################################################

##############################################################################################################################
#Region Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pProcessFullLog:' | pProcessFullLog |' & '| 'pSourceFile:' | pSourceFile |' & '| 'pFileOut:' | pFileOut |' & '| 'pFileOutDep:' | pFileOutDep;
sProcLogParams = sProcLogParams |' & '| 'pLoadToTM1:' | pLoadToTM1;
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
#EndRegion Logging
##############################################################################################################################
#EndRegion Header
##############################################################################################################################

### Inits - declare constants

cCubParam       = '}APQ Settings';
pExportDir      = CellGetS( cCubParam, 'Location: Export', 'String' );
pExportDir      = pExportDir | IF( SubSt( pExportDir, Long( pExportDir ), 1 ) @<> '\', '\', '' );
pSourceDir      = GetProcessErrorFileDirectory;
pSourceFile     = IF( pSourceFile @= '', 'tm1server.log', pSourceFile );
sSourceFile     = pSourceDir | pSourceFile;
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
pDatasourceASCIIDelimiter           = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
pDatasourceASCIIDecimalSeparator    = CellGetS( cCubParam, 'DatasourceASCIIDecimalSeparator', 'String' );
pDatasourceASCIIQuoteCharacter      = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );

IF( FileExists( sSourceFile) = 0 );
  ProcessError();
EndIF;

sFileOut    = pExportDir | pFileOut;
sFileOutDep = pExportDir | pFileOutDep;

nLOGline    = 0;
nDataCounter= 0;

### Assign Datasource

pTitleRows  = 1;
pDelimiter  = '%';
pQuote      = '';

DataSourceType                  = 'CHARACTERDELIMITED';
DatasourceNameForServer         = sSourceFile;
DatasourceASCIIHeaderRecords    = pTitleRows;
DatasourceASCIIDelimiter        = pDelimiter;
DatasourceASCIIQuoteCharacter   = pQuote;


### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,368
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

### Process Log lines
### Output is one line per type of information

## TODO / NOTES
# * Process should have parameter for interval to be processed
#   as e.g. Last n minutes to process
#   if set to zero the full logfile is parsed
# * Also parameter to be able to clear cube beforehand
# * cleanup quotes in object name
# * Process Information cube should be based on Processes dimension
#   this dimensions should have hierarchies based on the '.' in the name
# * Log File locking should be tested, i.e. can TM1 write to log file 
#   while it is being read
# * In the Process Information cube we can have a moving average 
#   value for the runtime = average( current value + new value )

# vLogLine is a line in the tm1server log file
nLogLine = nLogLine + 1;
nDataCounter = nDataCounter + 1;
# for testing purposes limit number of processed lines
# IF( nLogLine > 10000 ); ProcessBreak; EndIf;
vDelimiter = '   ';
# delimiter in logfile is 3 consecutive spaces

# if this is the first processed line output header
IF( nDataCounter = 1 ); 
   # set ouput delimiter
   DatasourceASCIIDelimiter = pDatasourceASCIIDelimiter;
   DatasourceASCIIQuoteCharacter = pDatasourceASCIIQuoteCharacter;
   ASCIIOUTPUT( sFileOut, 'LogFileLine', 'LogType', 'DateTime', 'LogObject', 'LogInfoType', 'LogInfoValue' );
EndIF;

## Process line and build variables

# Variables
nProcTxt = LONG('Process ');
nChoreTxt = LONG('Chore ');
nNextCol = 1;
vBlock = vLogLine;
vCol = '';
vCol1 = '';
vCol2 = '';
vCol3 = '';
vCol4 = '';
vCol5 = '';
vCol6 = '';

# fields
vThread = '';
vMisc = '';
vLogLevel = '';
vDateTime = '';
vLogger = '';
vMsg = '';

# logging variables

vLogObject = '';
vLogUser = '';
vLogTime = '';
vRunFrom = '';
vError = NumberToString(0);
vErrorFile = '';
vNote = '';

# Loop through columns 
While( nNextCol <> 0 );

  # check where next block begins
  nNextCol = SCAN(vDelimiter, vBlock );
  IF( nNextCol <> 0 );
    vCol = TRIM(SUBST( vBlock,1, nNextCol ));
    vBlock = DELET( vBlock, 1, nNextCol );
  Else;
    vCol = vBlock;
  EndIF;

  IF( vCol1 @= '');
    vCol1 = vCol; 
  ElseIF( vCol2 @= '');
    vCol2 = vCol;
  ElseIF( vCol3 @= ''); 
    vCol3 = vCol;
  ElseIF( vCol4 @= ''); 
    vCol4 = vCol;
  ElseIF( vCol5 @= ''); 
    vCol5 = vCol;
  ElseIF( vCol6 @= ''); 
    vCol6 = vCol;
  Else;
  EndIF;
	
  #ASCIIOUTPUT( sFile, NumberToString( nLogLine),  vBlock, NumberToString( nNextCol ), vCol );
	
End;

#ASCIIOUTPUT( sFile, NumberToString( nLogLine), vCol1, vCol2, vCol3, vCol4, vCol5, vCol6, vLogLine );

# set values for fields

IF( vCol1 @<> ''); vThread = TRIM(vCol1); EndIf;
IF( vCol3 @<> ''); vLogLevel = TRIM(vCol3); EndIf;
IF( vCol4 @<> ''); vDateTime = TRIM(vCol4); EndIf;
IF( vCol5 @<> ''); vLogger = TRIM(vCol5); EndIf;
IF( vCol6 @<> ''); vMsg = TRIM(vCol6); EndIf;

#ASCIIOUTPUT( sFile, NumberToString( nLogLine), vThread, vLogLevel, vDateTime, vLogger, vMsg );

## Check if this line is relevant for processing - skip otherwise
# if pProcessFullLog parameter is 0 only today's logs are processed
vLineDate = SUBST( vDateTime, 1, 10 );
IF( pProcessFullLog @= '0' );
   IF( vLineDate @<> TODAY(1) );
      ItemSkip;
   EndIf;
EndIf;


## Check Logger Type

IF( vLogger @= '' );
   # If Logger type is not filled in this is an irrelevant multi-line message

ElseIf( vLogger @= 'TM1.Chore' );
   # this is a chore

   # Log user who ran the chore
   # This always preceeds runtime message
   
   # example: Chore cleanup executed by user Ambrus
   # example: Chore "Chore.Marketing Reporting.Reload" executed by scheduler
   sStr = ' executed by ';
   nStr = LONG ( sStr );
	If( SCAN( sStr, vMsg )<> 0 );

      vLogObject = TRIM( SUBST( vMsg, nChoreTxt, SCAN( sStr, vMsg )-nChoreTxt ) );
      # remove quote character if present
      IF( SUBST(vLogObject,1,1) @= '"' );  vLogObject = SUBST( vLogObject, 2, LONG(vLogObject)-2 ); EndIf;
		vLogUser = TRIM( SUBST( vMsg, SCAN( sStr, vMsg )+nStr, LONG(vMsg) - SCAN( sStr, vMsg )-nStr+1 )  );
		vLogTime = 'N/A';
      vRunFrom = 'chore';
      
      #ASCIIOUTPUT( sFile, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, vLogUser, vLogTime );
      
      # Output to Chore Information cube
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'User', vLogUser );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Time', vLogTime );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'RunFrom', vRunFrom );
      
	EndIf;

   # Log runtime
   
   # example: Chore "Chore.Market PL.Reload" time = 314.39 seconds
   sStr = ' time = ';
   nStr = LONG ( sStr );
	If( SCAN( sStr, vMsg )<> 0 );

      vLogObject = TRIM( SUBST( vMsg, nChoreTxt, SCAN( sStr, vMsg )-nChoreTxt ) );
      # remove quote character if present
      IF( SUBST(vLogObject,1,1) @= '"' );  vLogObject = SUBST( vLogObject, 2, LONG(vLogObject)-2 ); EndIf;      
		# vLogUser should already have been logged previously - do not overwrite
		vLogTime = TRIM( SUBST( vMsg, SCAN( sStr, vMsg )+nStr, LONG(vMsg) - SCAN( sStr, vMsg )-nStr+1 )  );
      
      #ASCIIOUTPUT( sFile, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, vLogUser, vLogTime );
      
      # Output to Chore Information cube
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Time', vLogTime );
      
	EndIf;

   # there is no error on ther Chore level, even if there are errors in the processes run
   # thus no error flag logging for chores
   
ElseIf( vLogger @= 'TM1.Process' );
   # This is a process, relevant information could be on various lines
   
   # handle case of run by chore
   # example: Process Sys.Server.RotateServerLog executed by chore Sys.Server.RotateServerLog
   sStr = ' executed by chore ';
   nStr = LONG ( sStr );
   IF( SCAN( sStr, vMsg ) <> 0 );
      
      vLogObject = TRIM( SUBST( vMsg, nProcTxt, SCAN( sStr, vMsg )-nProcTxt ) );
      # remove quote character if present
      IF( SUBST(vLogObject,1,1) @= '"' );  vLogObject = SUBST( vLogObject, 2, LONG(vLogObject)-2 ); EndIf;      
      vLogUser = 'chore';
      vRunFrom = TRIM( SUBST( vMsg, SCAN( sStr, vMsg )+nStr, LONG(vMsg) - SCAN( sStr, vMsg )-nStr+1 )  );      
      vLogTime = 'N/A';
      #ASCIIOUTPUT( sFile, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, vLogUser );

      # Output to Process Information cube
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'User', vLogUser );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'RunFrom', vRunFrom );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Time', vLogTime );
      
   EndIf;

   # handle case of run by user
   # example: Process "Cube.Market PL.LoadVolume" run from process "Chore.Market PL.Reload" by user "R*Chore.Market PL.Reload"
   # example: Process "Sys.Server.AdhocBackup" executed by user "Ambrus"
   sStr = ' by user ';
   nStr = LONG ( sStr );
   IF( SCAN( sStr, vMsg ) <> 0 );
      
      # to determine object the two subcases have to be handled
      sSubStr = ' run from process ';
      nSubStr = LONG ( sSubStr );
      IF( SCAN( sSubStr, vMsg ) <> 0 );
         vLogObject = TRIM( SUBST( vMsg, nProcTxt, SCAN( sSubStr, vMsg )-nProcTxt ) );
         vRunFrom = TRIM( DELET( vMsg, 1, SCAN( sSubStr, vMsg )+nSubStr ) );
         vRunFrom = TRIM( SUBST( vRunFrom, 1, SCAN( sStr, vRunFrom )) );
         # remove quote character if present
         IF( SUBST(vRunFrom,1,1) @= '"' );  vRunFrom = SUBST( vRunFrom, 2, LONG(vRunFrom)-2 ); EndIf;      
      EndIf;
      sSubStr = ' executed by user ';
      nSubStr = LONG ( sSubStr );
      IF( SCAN( sSubStr, vMsg ) <> 0 );
         vLogObject = TRIM( SUBST( vMsg, nProcTxt, SCAN( sSubStr, vMsg )-nProcTxt ) );
         vRunFrom = '(standalone)';
      EndIf;
      sSubStr = ' debugging by user ';
      nSubStr = LONG ( sSubStr );
      IF( SCAN( sSubStr, vMsg ) <> 0 );
         vLogObject = TRIM( SUBST( vMsg, nProcTxt, SCAN( sSubStr, vMsg )-nProcTxt ) );
         vRunFrom = '(debug mode)';
      EndIf;      
      # error check - unhandled case
      IF( vLogObject @= '' ); ItemReject('Unhandled Process run case'); EndIf;
      
      # remove quote character if present
      IF( SUBST(vLogObject,1,1) @= '"' );  vLogObject = SUBST( vLogObject, 2, LONG(vLogObject)-2 ); EndIf;      

      vLogUser = TRIM( SUBST( vMsg, SCAN( sStr, vMsg )+nStr, LONG(vMsg) - SCAN( sStr, vMsg )-nStr+1 )  );
      # remove quote character if present
      IF( SUBST(vLogUser,1,1) @= '"' );  vLogUser = SUBST( vLogUser, 2, LONG(vLogUser)-2 ); EndIf;      

      vLogTime = 'N/A';

      # Output to Process Information cube
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'User', vLogUser );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'RunFrom', vRunFrom );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Time', vLogTime );      
      
   EndIf;

   # handle errors - there will be no time in such cases
   # example: Process "Cube.Marketing Actuals.LoadActualsFromReview": : 
   #          Execution was aborted. Error file: 
   #          <TM1ProcessError_20121022080917_Cube.Marketing Actuals.LoadActualsFromReview.log>
   # example: Process "Chore.IPA.Reload":  finished executing with errors. 
   #          Error file: <TM1ProcessError_20121021213235_Chore.IPA.Reload.log>
   # example: Process "Cube.COGS_Summary.LoadAndSpreadPlan": Invalid parameter array size.: 
   #          Could not initialize process
   # example: Process "Sheet.IPA Planning.Volume Split.SpreadVolume": : 
   #          Execution was aborted by ProcessQuit Function.
   
   IF( vLogLevel @= 'ERROR' ); 
   
      vError = '1';
      sStr = ':';
      nStr = LONG ( sStr );

      vLogObject = TRIM( SUBST( vMsg, nProcTxt, SCAN( sStr, vMsg )-nProcTxt ) );
      # remove quote character if present
      IF( SUBST(vLogObject,1,1) @= '"' );  vLogObject = SUBST( vLogObject, 2, LONG(vLogObject)-2 ); EndIf;            
      
      # handle subcases of error log file present or not
      sSubStr = ' Error file: ';
      nSubStr = LONG ( sSubStr );
      IF( SCAN( sSubStr, vMsg ) <> 0 );
         vErrorFile = TRIM( SUBST( vMsg, SCAN( sSubStr, vMsg )+nSubStr, LONG(vMsg) - SCAN( sSubStr, vMsg )-nSubStr+1 )  );
         # remove <> characters if present
         IF( SUBST(vErrorFile,1,1) @= '<' );  vErrorFile = SUBST( vErrorFile, 2, LONG(vErrorFile)-2 ); EndIf;
         vNote = DELET( vMsg, 1, SCAN( sStr, vMsg ) );
         vNote = TRIM( SUBST( vNote, 1, SCAN( sSubStr, vNote ) )  );
      Else;
         vNote = TRIM( SUBST( vMsg, SCAN( sStr, vMsg )+nStr, LONG(vMsg) - SCAN( sStr, vMsg )-nStr+1 )  );
      EndIf;
      
      # Output to Process Information cube
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Error', vError );
      IF( vErrorFile @<> ''); 
         ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'ErrorFile', vErrorFile );
      EndIf;
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Note', vNote );
      
   EndIf;
   
   # handle case of run-time
   # time will come on a separate line - same as finish
   # if there is an error there will be no time - it remains N/A per previous logs
   # example: Process "Cube.Market PL.LoadVolume":  finished executing normally, elapsed time 1.30 seconds
   sStr = ':  finished executing normally, elapsed time ';
   nStr = LONG ( sStr );
   IF( SCAN( sStr, vMsg ) <> 0 );

      vLogObject = TRIM( SUBST( vMsg, nProcTxt, SCAN( sStr, vMsg )-nProcTxt ) );
      # remove quote character if present
      IF( SUBST(vLogObject,1,1) @= '"' );  vLogObject = SUBST( vLogObject, 2, LONG(vLogObject)-2 ); EndIf;            

      vLogTime = TRIM( SUBST( vMsg, SCAN( sStr, vMsg )+nStr, LONG(vMsg) - SCAN( sStr, vMsg )-nStr+1 )  );

      # if finished executing normally, erease errors / notes
      vError = '0';
      vErrorFile = '';
      vNote = '';
      
      # Output to Process Information cube
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Time', vLogTime );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Note', vNote );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'Error', vError );
      ASCIIOUTPUT( sFileOut, NumberToString( nLogLine), vLogger, vDateTime, vLogObject, 'ErrorFile', vErrorFile );
      
   EndIf;

ElseIf( vLogger @= 'TM1.Cube.Dependency' );

   # cube dependency being established
   # special handling: dump into a csv file for later processing

   # example: Adding cube dependency: cube "IPA Summary" depends on cube "Invoice Price & Discount Planning"
   
   sStr1 = 'Adding cube dependency: Cube';
   sStr2 = 'depends on cube';
   IF( SCAN( sStr1, vMsg) <> 0 & SCAN( sStr2, vMsg) <> 0 );
      vSourceCube = TRIM( SUBST( vMsg, LONG( sStr1 )+1, SCAN( sStr2, vMsg) - LONG( sStr1 ) -1 ) ); 
      vTargetCube = TRIM( SUBST( vMsg, SCAN( sStr2, vMsg) + LONG( sStr2), LONG( vMsg) - SCAN( sStr2, vMsg) - LONG( sStr2) ) );

      # remove quote character if present
      IF( SUBST(vSourceCube,1,1) @= '"' % SUBST(vSourceCube,1,1) @= ''''  );  
         vSourceCube = SUBST( vSourceCube, 2, LONG(vSourceCube)-2 ); 
      EndIf;            

      # remove quote character if present
      IF( SUBST(vTargetCube,1,1) @= '"' % SUBST(vTargetCube,1,1) @= ''''  );  
         vTargetCube = SUBST( vTargetCube, 2, LONG(vTargetCube)-2 ); 
      EndIf;            
      
      ASCIIOUTPUT( sFileOutDep, 'Dependency', vSourceCube, vTargetCube );
   EndIf;
  
EndIf;

######################
### END Data
575,41
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

nMyDataCount = nDataRecordCount;

IF( pLoadToTM1 @= '1' );
  ExecuteProcess( '}APQ.Cub.CubeDependencyMap.Update', 
    'pDoProcessLogging', pDoProcessLogging,
    'pSourceFile', pFileOutDep
  );
  ExecuteProcess( '}APQ.Cub.ServerMessageLogInfo.Update', 
    'pDoProcessLogging', pDoProcessLogging,
    'pSourceFile', pFileOut,
    'pClearCube', '0'
  );
EndIF;

##############################################################################################################
#Region Logging
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
#EndRegion Logging
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
