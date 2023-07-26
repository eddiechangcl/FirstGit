601,100
602,"}APQ.Cub.TM1TransactionLogAnalysis.Update"
562,"CHARACTERDELIMITED"
586,"..\LOGS\tm1-template.log"
585,"..\LOGS\tm1-template.log"
564,
565,"v2o?T^E5q1JufC8_i>AR]AaVZ^^wG79Vk0lt`?ac>aqMFgtqFDxY>SjQC5dUrdUokpq\nuGDNQk;?bEfP[VtZS>675y_^U3o7B\]Wj^usD6=Qw1bMn_hNI:2b=a8@aYRGUhm9[XbMgqYh@[UC;<lK<QXXqQT2RWn;Buw2X`[Z[H`R]Sthwtj`3XkE9FLLBz]`tKZCzlR"
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
569,2
592,0
599,1000
560,2
pSourceFile
pDoProcessLogging
561,2
2
2
590,2
pSourceFile,""
pDoProcessLogging,"1"
637,2
pSourceFile,"tm1s.log file"
pDoProcessLogging,"enter in process log"
577,15
V1
vTimeStamp
V3
vChangedBy
vCellType
vOldVal
vNewVal
vCube
vDim1
vDim2
vDim3
vDim4
vDim5
vDim6
vDim7
578,15
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
579,15
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
580,15
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
581,15
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
582,15
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
572,107
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

# This process processes a specific tm1sYYYYMMDDHHMMSS.log file in the server logging directory and loads the date stamp

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pSourceFile:' | pSourceFile;
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

cProcess        = GetProcessName();
cCubTgt         = '}APQ TM1 Transaction Log Analysis';
cDimTgt         = '}APQ TM1 Transaction Logs';
cDimCubes       = '}APQ Cubes';
cDimUsr         = '}APQ Clients';
cCubParam       = '}APQ Settings';
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cStart          = 'First Transaction';
cEnd            = 'Last Transaction';
cUser           = 'Users';
cTot            = 'Total Cell Transactions';
cNChng          = 'N change';
cNClr           = 'N clear';
cSChng          = 'S change';
cSClr           = 'S clear';

### Initialise variables ###

sStart          = '';
sEnd            = '';
sUser           = '';

### Validate Parameters ###

nErrors         = 0;

# If no cube name specified then abort
IF( FileExists( GetProcessErrorFileDirectory | pSourceFile ) = 0 );
  nErrors = nErrors + 1;
  sMessage = 'Transaction log not found: ' | pSourceFile;
  DatasourceType = 'NULL';
  ItemReject( sMessage );
EndIF;

### Set Data Source ###

DatasourceType                  = 'CHARACTERDELIMITED';
DatasourceNameForServer         = GetProcessErrorFileDirectory | pSourceFile;
DatasourceASCIIDelimiter        = ',';
DatasourceASCIIQuoteCharacter   = '"';

### Turn Off Logging (this whole process is designed to capture issues with logging we don't want to contribute to more log clutter!) ###

CubeSetLogChanges( cCubTgt, 0 );

### Check Master Data ###

# If the log file hasn't been loaded then create the element
# If the log ID already exists then zero out before reloading

IF( DimIx( cDimTgt, pSourceFile ) = 0 );
  sElBefore = DimNm( cDimTgt, 2 );
  DimensionElementInsertDirect( cDimTgt, sElBefore, pSourceFile, 'N' );
  DimensionElementComponentAddDirect( cDimTgt, 'Total tm1s Logs', pSourceFile, 1 );
Else;
  # The log has been processed previously. Do a zero out just in case
  sProc = '}bedrock.cube.data.clear';
  ExecuteProcess( sProc, 'pLogOutput', 0,
    'pCube', cCubTgt, 'pView', '', 'pFilter', cDimTgt | sDelimEleStart | pSourceFile,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1, 'pCubeLogging', 0
  );
EndIF;

######################
### End Prolog ###

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,75
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

# Skip all records in transaction log which don't have a cube
IF( Dimix( cDimCubes, vCube ) = 0 );
  ItemSkip;
EndIF;

# Format the YYYYMMDDHHMMSS string to DD.MM.YYYY HH:MM
sTimeStamp = SubSt(vTimeStamp, 7, 2) |'.'| SubSt(vTimeStamp, 5, 2) |'.'| SubSt(vTimeStamp, 1, 4) |' '| SubSt(vTimeStamp, 9, 2) |':'| 
  SubSt(vTimeStamp, 11, 2);

# Check if the user exists (otherwise it's a chore)
IF( DimIx( cDimUsr, vChangedBy ) = 0 );
  sChangedBy = vChangedBy;
Else;
   sChangedBy = IF( AttrS( cDimUsr, vChangedBy, '}TM1_DefaultDisplayValue' ) @<> '', AttrS( cDimUsr, vChangedBy, '}TM1_DefaultDisplayValue' ), vChangedBy );
EndIF;
IF( sChangedBy @= '*' ); sChangedBy = 'SYSTEM'; EndIF;

# Check if a first transaction time already exists
sStart = CellGetS( cCubTgt, pSourceFile, vCube, cStart );
IF( sStart @= '' );
  CellPutS( sTimeStamp, cCubTgt, pSourceFile, vCube, cStart );
EndIF;

# Always update end transaction time
CellPutS( sTimeStamp, cCubTgt, pSourceFile, vCube, cEnd );

# Update the user
sUser = CellGetS( cCubTgt, pSourceFile, vCube, cUser );
IF( sUser @= '' );
  CellPutS( sChangedBy, cCubTgt, pSourceFile, vCube, cUser );
ElseIF( sUser @= sChangedBy % Scan( sChangedBy | ';', sUser ) > 0 % Scan( '; ' | sChangedBy, sUser ) > 0 );
  # User name already in the list, no action
Else;
  # Add user to end of list
  CellPutS( sUser |'; '| sChangedBy, cCubTgt, pSourceFile, vCube, cUser );
EndIF;

# Update the transaction counters
IF( vCellType @= 'N' );
  IF( vNewVal @<> '0' );
    CellIncrementN( 1, cCubTgt, pSourceFile, vCube, cNChng );
  Else;
    CellIncrementN( 1, cCubTgt, pSourceFile, vCube, cNClr );
  EndIF;
ElseIF( vCellType @= 'S' );
  IF( vNewVal @<> '' );
    CellIncrementN( 1, cCubTgt, pSourceFile, vCube, cSChng );
  Else;
    CellIncrementN( 1, cCubTgt, pSourceFile, vCube, cSClr );
  EndIF;
EndIF;

### End Data ###
575,30
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

### Turn On Logging ###
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
