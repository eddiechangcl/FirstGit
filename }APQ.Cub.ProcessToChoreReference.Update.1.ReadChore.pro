601,100
602,"}APQ.Cub.ProcessToChoreReference.Update.1.ReadChore"
562,"CHARACTERDELIMITED"
586,".\_New_Process_Template.pro"
585,".\_New_Process_Template.pro"
564,
565,"sMg<<^aZi_Q?>^9?=pmajYoT:S:64NuVp<yt]xdfCCl]Jzo8gRU=7x25u6zox3@ReO>2<VD`F2=ZX_coGfLlS6]:128\AGcY`su0ub02OqUxnQcNk9ZbJ\O5vJTEgtJ2la=B4[=x6QLr;5a58F]KG6IH4;gX3Y_RozW4><ykzLWN]URMz;LHtN`hE<XwEG:NeRGAqc@["
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
568,""
570,
571,
569,0
592,0
599,1000
560,3
pDoProcessLogging
pPath
pChore
561,3
2
2
2
590,3
pDoProcessLogging,"0.000000"
pPath,""
pChore,""
637,3
pDoProcessLogging,"Log to process logging cube"
pPath,"Full path of data directory"
pChore,"Chore name"
577,2
vID
vValue
578,2
2
2
579,2
1
2
580,2
0
0
581,2
0
0
582,2
VarType=32ColType=827
VarType=32ColType=827
603,0
572,84
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

### Purpose:  A process which reads the text of a .cho file and updates the }APQ Chore Info cube for the individual chore

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pPath:' | pPath |' & '|  'pChore:' | pChore;
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cCubTgt     = '}APQ Process to Object Reference';
cCubTgt2    = '}APQ Chore Info';
cDimTgt     = '}APQ Chores';
cDimPro     = '}APQ Processes';
cDimP       = '}APQ Chore Info Parameter';
cDimM       = '}APQ Chore Info Measure';

nCountProc  = 0;
sLastID     = '';
nCountParam = 0;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Param Validation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
IF( FileExists( pPath ) = 0 );
  DataSourceType = 'NULL';
  ItemReject( 'File does not exist: ' | pPath );
EndIF;

sChorePath = pPath |'\'| pChore | '.cho';
IF( FileExists( sChorePath ) = 0 );
  DataSourceType = 'NULL';
  ItemReject( 'File does not exist: ' | sChorePath );
EndIF;

IF( DimIx( cDimTgt, pChore ) = 0 );
  DataSourceType = 'NULL';
  ItemReject( 'Process does not exist in }APQ dim: ' | pChore );
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Zero Out
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Done in calling process

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Setup Source
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DataSourceType              = 'CHARACTERDELIMITED';
DatasourceNameForServer     = sChorePath;
DatasourceASCIIQuoteCharacter = '';
DatasourceASCIIDelimiter    = ',';

######################
### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,83
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

################################
##~~    Strip out quotes

# ( need to set no quote char in data source as otherwise TI will skip over empty rows. This would cause parameters to be out of alignment with values if an earlier param is blank )
IF( SubSt( vID, 1, 1 ) @= '"' & SubSt( vID, Long( vID ), 1 ) @= '"' );
   vID = SubSt( vID, 2, Long( vID ) - 2 );
EndIF;
IF( SubSt( vValue, 1, 1 ) @= '"' & SubSt( vValue, Long( vValue ), 1 ) @= '"' );
   vValue = SubSt( vValue, 2, Long( vValue ) - 2 );
EndIF;

################################
##~~    Chore Properties

IF( DIMIX( cDimP, vID ) > 0 & vID @<> '6' );
  IF( vValue @= '0' );
    sValue = 'No';
  ElseIF( vValue @= '1' & vID @<> '532' );
    sValue = 'Yes';
  Else;
    sValue = vValue;
  EndIF;
  CellPutS( sValue, cCubTgt2, pChore, vID, 'Param Value' );
  IF( vID @= '532' );
    AttrPutN( StringToNumber(sValue), cDimTgt, pChore, DimensionElementPrincipalName( cDimP, vID ) );
  Else;
    AttrPutS( sValue, cDimTgt, pChore, DimensionElementPrincipalName( cDimP, vID ) );
  EndIF;
  sLastID = vID;
EndIF;

################################
##~~    Process Names

If( vID @= '6' & vValue @<> '' );
    nCountProc = nCountProc + 1;
    If( DimIx( cDimPro, vValue ) > 0 );
        CellPutN( 1, cCubTgt, 'chore', pChore, vValue, 'IsUsed' );
        CellPutN( nCountProc, cCubTgt, 'chore', pChore, vValue, 'Position' );
        If( DIMIX( cDimP, 'Pro ' | NumberToString(nCountProc) ) > 0 );
            CellPutS( vValue, cCubTgt2, pChore, 'Pro ' | NumberToString(nCountProc), 'Param Value' );
        EndIf;
    EndIf;
    sLastID = vID;
EndIf;

################################
##~~    Process Parameter Values

If( vID @= '560' );
    nCountParam = 0;
EndIf;
If( sLastID @= '6' & vValue @= '' );
    nCountParam = nCountParam + 1;
    If( DIMIX( cDimP, 'Pro ' | NumberToString(nCountProc) ) > 0 & DIMIX( cDimM, 'P ' | NumberToString(nCountParam) | ' Value' ) > 0 );
        CellPutS( vID, cCubTgt2, pChore, 'Pro ' | NumberToString(nCountProc), 'P ' | NumberToString(nCountParam) | ' Value' );
    EndIf;
EndIf;

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
