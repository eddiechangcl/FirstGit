601,100
602,"}APQ.Cub.ProcessParametersInfo.Update.2.ReadProcess"
562,"CHARACTERDELIMITED"
586,".\_New_Process_Template.pro"
585,".\_New_Process_Template.pro"
564,
565,"o5ztirK9ns2ZF2Fa>PQSw2xpyuLN7JAeo]O2e=:RYMoV3t;6TmQvgC@Nts>jfYNnViEiexXV2JA8Eb?g;KLyNnV`Ot9^ah]P2\>gXe>^ecNzEMr0e?T<xoLq^F^AgIKtDyaeAWhN2zfp?vt16\2bLlv>7tRDW=4^=AB9eJdJMY9UdA\tv2Z?a8gzFFAsP\Fk6YRxMu]P"
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
569,0
592,0
599,1000
560,3
pDoProcessLogging
pProcessPath
pProcess
561,3
2
2
2
590,3
pDoProcessLogging,"0.000000"
pProcessPath,""
pProcess,""
637,3
pDoProcessLogging,"Log to process logging cube"
pProcessPath,"Full path of .pro file (data directory)"
pProcess,"Process name"
577,3
vLine
vInfo
V3
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,76
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

### Purpose:	A process which reads the text of a .pro file and updates the }APQ Process Parameters Info cube for the individual process

##############################################################################################################
### Logging - common script
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pProcessPath:' | pProcessPath |' & '|  'pProcess:' | pProcess;
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
### Prolog Start


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cCubTgt         = '}APQ Process Parameters Info';
cCubTgt2        = '}APQ Process Parameter Matrix';
cDim            = '}APQ Processes';
cDimTgt         = '}APQ Process Parameter Name';

nCountParameters= 99999;
nCountTypes     = 99999;
nCountPrompts   = 99999;
nTotalLines     = 0;
nLineCount      = 0;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Param Validation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
IF( FileExists( pProcessPath ) = 0 );
    DataSourceType = 'NULL';
    ItemReject( 'File does not exist: ' | pProcessPath );
EndIF;

IF( DimIx( cDim, pProcess ) = 0 );
    DataSourceType = 'NULL';
    ItemReject( 'Process does not exist in }APQ dim: ' | pProcess );
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Setup Source
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DataSourceType              = 'CHARACTERDELIMITED';
DatasourceNameForServer     = pProcessPath;
DatasourceASCIIQuoteCharacter = '"';
DatasourceASCIIDelimiter    = ',';


######################
### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,86
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
### Data Start

nLineCount = nLineCount + 1;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Populate Type
#~~~~~~~~~~~~~~~~~~~~~~~~
IF( nCountTypes <= nTotalLines );
   IF( vLine @= '1' );
      sType = 'N';
   ELSE;
      sType = 'S';
   ENDIF;
   CellPutS( sType, cCubTgt, pProcess, 'P' | TRIM( STR( nCountTypes, 100, 0 ) ), 'Type' );
   nCountTypes = nCountTypes + 1;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Populate Prompts
#~~~~~~~~~~~~~~~~~~~~~~~~
IF( nCountPrompts <= nTotalLines );
   CellPutS( vInfo, cCubTgt, pProcess, 'P' | TRIM( STR( nCountPrompts, 100, 0 ) ), 'Prompt' );
   nCountPrompts = nCountPrompts + 1;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Populate Variables
#~~~~~~~~~~~~~~~~~~~~~~~~
IF( nCountParameters <= nTotalLines );
  sParam = 'P' | TRIM( STR( nCountParameters,100,0 ) );
  CellPutS( vLine, cCubTgt, pProcess, sParam, 'Parameter' );
  CellPutS( vInfo, cCubTgt, pProcess, sParam, 'sDefaultValue' );
  IF( CellGetS(  cCubTgt, pProcess, sParam, 'Type' ) @= 'N' );
    CellPutN( StringToNumber( vInfo ), cCubTgt, pProcess, sParam, 'nDefaultValue' );
  EndIF;
  If( DimIx( cDimTgt, vLine ) = 0 );
    DimensionElementInsertDirect( cDimTgt, '', vLine, 'N' );
  EndIf;
  CellPutN( nCountParameters, cCubTgt2, pProcess, vLine, 'ParameterIndex' );
  nCountParameters = nCountParameters + 1;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Determine when Variables Start
#~~~~~~~~~~~~~~~~~~~~~~~~
IF( SUBST( vLine,1,3 ) @= '590' );
   nTotalLines = NUMBR( vInfo );
   nCountParameters = 1;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Determine when Types Start
#~~~~~~~~~~~~~~~~~~~~~~~~
ELSEIF( SUBST( vLine, 1, 3 ) @= '561' );
   nTotalLines = NUMBR( vInfo );
   nCountTypes = 1;

#~~~~~~~~~~~~~~~~~~~~~~~~
# Determine when Prompts Start
#~~~~~~~~~~~~~~~~~~~~~~~~
ELSEIF( SUBST( vLine, 1, 3 ) @= '637' );
   nTotalLines = NUMBR( vInfo );
   nCountPrompts = 1;
ENDIF;

######################
### Data End
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
