601,100
602,"}APQ.Cub.Vue.DefaultViews.Copy"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"xT9Y`1j<EMd=mfU_Pko0dtNgaFwjUOIQzJYBqEE4ybWx67:b?Ca^r;y4FSA03kaA0;O53lUuWr4c?[8WG2A^^3QtQ0cHH1\CrpyRFTdmrps^S5W:OWgS[JWVe_qfiSRjlCX6p@;V3S6xc;c>3]7m4w`tOntn3C=RvnOeN;@gsdx;uVwG?\1Xg@Oy0ck;:u0m`ik4vflw"
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
From 	[];
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,4
pDoProcessLogging
pVueSrc
pVueTgt
pCube
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pVueSrc,"Default"
pVueTgt,""
pCube,""
637,4
pDoProcessLogging,"Record in process log"
pVueSrc,"Copy from View"
pVueTgt,"Copy to View"
pCube,"Target cube (blank=ALL)"
577,1
vCub
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
572,103
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
### Update default views in all CUBES from "master language" to other supported languages
### NOTE!! As view replication is achieved by file system copy a server restart is required to register new views

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pVueSrc:' | pVueSrc |' & '| 'pVueTgt:' | pVueTgt |' & '| 'pCube:' | pCube;
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

cBatCmd     = 'Bedrock.Copy.bat';
cBatStr     = 'COPY %1 %2 ';
cDimSrc     = '}Cubes';
cCubInfo    = '}APQ Settings';
cDataDir    = CellGetS( cCubInfo, 'Location: Data Dir', 'String' );
cBatDir     = CellGetS( cCubInfo, 'Location: Scripts', 'String' );
nErr        = 0;
sErr        = '';

cDataDir    = IF( SubSt( cDataDir, Long(cDataDir), 1 ) @<> '\', cDataDir, SubSt( cDataDir, 1, Long(cDataDir)-1 ) );
cBatDir     = IF( SubSt( cBatDir, Long(cBatDir), 1 ) @<> '\', cBatDir, SubSt( cBatDir, 1, Long(cBatDir)-1 ) );

### Test script

IF( FileExists( cBatDir ) = 0 );
    cBatDir = cDataDir;
EndIF;
cBatFile = cBatDir |'\'| cBatCmd;
IF( FileExists( cBatFile ) = 0 );
    DatasourceASCIIQuoteCharacter = '';
    DatasourceASCIIDelimiter = '';
    LogOutput( 'INFO', Expand('%sThisProcName%: creating script %cBatFile%') );
    ASCIIOutput( cBatFile, cBatStr );
EndIF;

### Test parameters

IF( pCube @= '' % pCube @= 'ALL' );
  pCube = 'ALL';
ElseIF( CubeExists( pCube ) = 0 );
  nErr = nErr + 1;
  sErr = 'Invalid target cube.';
EndIF;

IF( pVueSrc @= '' );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Source view name cannot be blank.';
ElseIF( pVueSrc @= pVueTgt );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Source & target names cannot be the same.';
EndIF;

pVueSrc = Trim( pVueSrc );
pVueTgt = Trim( pVueTgt );

### Assign data source

IF( nErr = 0 & pVueTgt @= '' );
  #silent skip as no target defined
  DataSourceType = 'NULL';
ElseIF( nErr = 0 );
  DataSourceType = 'SUBSET';
  DataSourceNameForServer = cDimSrc;
  DatasourceDimensionSubset = 'ALL';
Else;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;


### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,49
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

# Skip if cube not loaded

IF( CubeExists( vCub ) = 0 );
  ItemSkip;
EndIF;

IF( pCube @<> 'ALL' );
  IF( vCub @<> pCube );
    ItemSkip;
  EndIF;
EndIF;

# Determine if default view exists

IF( ViewExists( vCub, pVueSrc ) = 0 );
  ItemSkip;
Else;
  sSourceFile = cDataDir | '\' | vCub | '}vues\' | pVueSrc | '.vue';
EndIF;

# Use batch file to copy the .vue file
sTargetFile = cDataDir | '\' | vCub | '}vues\' | pVueTgt | '.vue';
sCmdString = '"' | cBatFile | '" "' | sSourceFile | '" "' | sTargetFile | '"';
ExecuteCommand( sCmdString, 1 );

######################
### END Metadata
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
