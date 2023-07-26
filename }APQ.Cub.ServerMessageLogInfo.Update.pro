601,100
602,"}APQ.Cub.ServerMessageLogInfo.Update"
562,"CHARACTERDELIMITED"
586,"..\LOGS\Export\tm1server_log-analysis.csv"
585,"..\LOGS\Export\tm1server_log-analysis.csv"
564,
565,"cYla:gQ[qhWDz2tzWs\Xw@0lk@4YfInY[zhyOr@fYoSDdY<P3S2@H@3etTwH3GoenbV;[@Yifxn\@SN;4yTN]_;1pxByDKJ8Z?`59QGEvC<KmE`3k4di\t_y0q`>ydbJsNIPpRrv<@Il]0p\;`1=Akel_lair:fbXvjU4Kl^mQSXr44xrsj[@Cj12e1gP?:<?icwfRR["
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
569,1
592,0
599,1000
560,3
pDoProcessLogging
pSourceFile
pClearCube
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pSourceFile,"tm1server-log-analysis.csv"
pClearCube,"1"
637,3
pDoProcessLogging,"Record in process log"
pSourceFile,"Source file"
pClearCube,"Clear Cube first ( 1 / 0)"
577,6
LogFileLine
LogType
DateTime
LogObject
LogInfoType
LogInfoValue
578,6
1
2
2
2
2
2
579,6
1
2
3
4
5
6
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,7
VarType=33ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
IgnoredInputVarName=V7VarType=32ColType=1165
603,0
572,120
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
### Loads the parsed log analysis files into information cubes

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pSourceFile:' | pSourceFile |' & '| 'pClearCube:' |  pClearCube;
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

### Inits - declare constants

cCubParam       = '}APQ Settings';
pSourceDir      = CellGetS( cCubParam, 'Location: Export', 'String' );
pSourceDir      = pSourceDir | IF( SubSt( pSourceDir, Long( pSourceDir ), 1 ) @<> '\', '\', '' );
sFile           = pSourceDir  | pSourceFile;
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
pDelimiter      = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
pDecimal        = CellGetS( cCubParam, 'DatasourceASCIIDecimalSeparator', 'String' );
pQuote          = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );


## Assign Datasource

IF( FileExists( sFile) = 0 );
   LogOutput( 'INFO', sThisProcName | ' file not found: ' | sFile );
   DataSourceType = 'NULL';
   ProcessBreak;
Else;
   pTitleRows               = 1;
   DataSourceType           = 'CHARACTERDELIMITED';
   DatasourceNameForServer  = sFile;
   DatasourceNameForClient  = sFile;
   DatasourceASCIIHeaderRecords     = pTitleRows;
   DatasourceASCIIDelimiter = pDelimiter;
   DatasourceASCIIQuoteCharacter    = pQuote;
EndIF;

## Setup target objects

# create Measure dimension if it does not exist
pMeasureDim = '}APQ Server Message Log Info Measure';
IF( DimensionExists( pMeasureDim ) = 0 );
   DimensionCreate( pMeasureDim );
   # basic columns
   DimensionElementInsert( pMeasureDim, '', 'User', 'S');
   DimensionElementInsert( pMeasureDim, '', 'DateTime', 'S');
   DimensionElementInsert( pMeasureDim, '', 'Time', 'S');
   DimensionElementInsert( pMeasureDim, '', 'Note', 'S');
   DimensionElementInsert( pMeasureDim, '', 'RunFrom', 'S');
   DimensionElementInsert( pMeasureDim, '', 'ErrorFile', 'S');
   DimensionElementInsert( pMeasureDim, '', 'Error', 'S');
   # derived columns
   DimensionElementInsert( pMeasureDim, '', 'Date', 'S');
   DimensionElementInsert( pMeasureDim, '', 'TimeOfDay', 'S');
   DimensionElementInsert( pMeasureDim, '', 'ErrorFilePath', 'S');
   DimensionElementInsert( pMeasureDim, '', 'TimeMovingAverage', 'S');
   DimensionElementInsert( pMeasureDim, '', 'TimeLongerThanAvg', 'N');
   DimensionElementInsert( pMeasureDim, '', 'LongRunningProcess', 'N');
   DimensionElementInsert( pMeasureDim, '', 'ErrorCount', 'N');
   DimensionElementInsert( pMeasureDim, '', 'LineCount', 'N');
EndIF;

# update Processes dimension - as necessary
cTypDim = '}APQ TM1 Object Type';
cObjDim = '}APQ TM1 Objects';
IF( DimensionExists( cObjDim ) = 0 );
  ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 
    'pDoProcessLogging', pDoProcessLogging
  );
EndIF;

# Create target cubes if they do not exist
 
cLogInfoCub = '}APQ Server Message Log Info';
IF( CubeExists( cLogInfoCub ) = 0 );
   CubeCreate( cLogInfoCub, cTypDim, cObjDim, pMeasureDim );
EndIf;

## Clear cube if requested

IF( pClearCube @= '1' );
   CubeClearData( cLogInfoCub );
EndIf;

## Cube update logging

cCubTgt = cLogInfoCub;

### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,57
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

# determine Target Cube

IF( LogType @= 'TM1.Process' );
  IF( DimIx( cObjDim, LogObject ) = 0 ); ItemSkip; EndIF;
    vObjTyp = 'Process';
ElseIf( LogType @= 'TM1.Chore' );
  IF( DimIx( cObjDim, LogObject ) = 0 ); ItemSkip; EndIF;
    vObjTyp = 'Chore';
Else;
   # unhandled, skip 
   ItemSkip;
EndIF;   
   
# write log info into cube
CellPutS( LogInfoValue, cCubTgt, vObjTyp, LogObject, LogInfoType );
CellPutS( DateTime, cCubTgt, vObjTyp, LogObject, 'DateTime' );

# write derived columns

# TimeMovingAverage
IF( LogInfoType @= 'Time' );
   exTime = CellGetS( cCubTgt, vObjTyp, LogObject, LogInfoType );
   If( exTime @<> 'N/A' & LogInfoValue @<> 'N/A');
   # calculate simple moving average
   nexTime = NUMBR( SUBST(exTime, 1, SCAN( ' seconds', exTime) ) );
   nTime = NUMBR( SUBST(LogInfoValue, 1, SCAN( ' seconds', LogInfoValue) ) );
   nMATime = ( nexTime + nTime ) \ 2;
   sMATime = NumberToString( nMATime ) | ' seconds';
   # save value
   CellPutS( sMATime, cCubTgt, vObjTyp, LogObject, 'TimeMovingAverage'   );
   EndIf;
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
