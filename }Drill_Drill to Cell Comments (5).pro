601,100
602,"}Drill_Drill to Cell Comments (5)"
562,"VIEW"
586,"}CellComments_APQ.Demo Sales Cube"
585,"}CellComments_APQ.Demo Sales Cube"
564,
565,"d=WHaqL1r?80^Mhy48xy9fQl373Yt\Rh6=DkST]0GWKMBWRc[mOKD9YYtJOIeesQV:5Xn`n8u:[u49T1[IJfcZgjeouvS^Jo4YcLKKfckTV5oXdC:_;Co\V5=^bbx2:0zJ_6MbY=QejYKfe4hwE8wk4^1GGh]1heNd0u\C3?>i@X4ZdMLR2roTU9sGL[JBpf1YuImJ<b"
559,1
928,1
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
589,
568,""""
570,zDrill to Cell Comments
571,
569,0
592,0
599,1000
560,6
CubeName
pDim1
pDim2
pDim3
pDim4
pDim5
561,6
2
2
2
2
2
2
590,6
CubeName,"APQ.Demo Sales Reconciliation Check Extended"
pDim1,"ACT"
pDim2,"Year Rollups"
pDim3,"Customer Rollups"
pDim4,"Comparisons"
pDim5,"Value"
637,6
CubeName,""
pDim1,""
pDim2,""
pDim3,""
pDim4,""
pDim5,""
577,3
NVALUE
SVALUE
VALUE_IS_STRING
578,3
1
2
1
579,3
0
0
0
580,3
0
0
0
581,3
0
0
0
582,12
IgnoredInputVarName=V1VarType=32ColType=1165
IgnoredInputVarName=V2VarType=32ColType=1165
IgnoredInputVarName=V3VarType=32ColType=1165
IgnoredInputVarName=V4VarType=32ColType=1165
IgnoredInputVarName=V5VarType=32ColType=1165
IgnoredInputVarName=V6VarType=32ColType=1165
IgnoredInputVarName=ScaleVarType=32ColType=1165
IgnoredInputVarName=V8VarType=32ColType=1165
IgnoredInputVarName=V9VarType=32ColType=1165
IgnoredInputVarName=V10VarType=32ColType=1165
IgnoredInputVarName=V11VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=32ColType=1165
603,0
572,100
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
### For any cube ( with 5 dimensions ). Drill through to the cell commentary

######################
### Logging - common script

sThisProcName = GetProcessName();
### Params
pDoProcessLogging = 1;
sProcLogParams = 'CubeName:' | CubeName |' & '| 'pDim1:' | pDim1 |' & '| 'pDim2:' | pDim2 |' & '| 'pDim3:' | pDim3 |' & '| 'pDim4:' | pDim4 |' & '| 'pDim5:' | pDim5;
### Params
IF( pDoProcessLogging = 1 );
  cCubTgt = '';
  sProcLogCube = '}APQ Process Execution Log';
  sCubLogCube = '}APQ Cube Last Updated by Process';
  nProcessStartTime = Now();
  nProcessFinishTime = 0;
  nMetaDataRecordCount = 0;
  nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0;
  NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0;
  NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0;
  NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = '';
  sProcessRunBy = TM1User();
  IF( DimIx( '}Clients', sProcessRunBy ) > 0 );
    sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) );
  EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' );
  sLogDay = TimSt( nProcessStartTime, '\m-\d' );
  sLogMinute = TimSt( nProcessStartTime, '\h:\i' );
  sLogSecond = TimSt( nProcessStartTime, '\s' );

  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;

  nTotalLogTime = 2;
  sYear01 = sLogYear; sYear02 = sLogYear;
  sDay01 = sLogDay; sDay02 = 'D000';
  sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry';
  sSecond01 = sLogSecond; sSecond02= 'Last Entry';
  
  nCountTime = 1;
  While ( nCountTime <= nTotalLogTime );
     sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
     sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
     sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
     sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );

     CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' );
     CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
     CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' );
     CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
     CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' );
     CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' );
     nCountTime = nCountTime + 1;
  End;

EndIF;

######################
### Prolog script commences

cCubSrc = '}CellAnnotations_' | CubeName;
cCubParam = '}APQ Settings';
cCubTgt = CellGetS( cCubParam, 'Std Comment Cube Name', 'String' );
IF( Scan( '<cube>', cCubTgt ) = 1 );
  cCubTgt = CubeName | SubSt( cCubTgt, 7, Long( cCubTgt ) - 6 );
Else;
  cCubTgt = SubSt( cCubTgt, 1, Scan( '<cube>', cCubTgt ) - 1 ) | CubeName | SubSt( cCubTgt, Scan( '<cube>', cCubTgt ) + 6, Long( cCubTgt ) - Scan( '<cube>', cCubTgt ) + 5 );
EndIF;
cViewTgt = 'zDrill to Cell Comments';

nErr = 0;

IF( CubeExists( cCubSrc ) = 0 );
  nErr = 1;
  ItemReject( 'There are no cell comments for cube ' | CubeName );
EndIF;

sProc = '}APQ.Cub.CellComments.Update';
nErr = ExecuteProcess( sProc,
  'pDoProcessLogging', '1', 
  'pCube', CubeName 
);

### END Prolog script
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,71
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
############################################################################################################################## 

### Logging - common script

IF( pDoProcessLogging = 1 );
  nProcessFinishTime = Now();
  sProcessErrorLogFile = GetProcessErrorFileName;

  nTotalLogTime = 2;
  sYear01 = sLogYear; sYear02 = sLogYear;
  sDay01 = sLogDay; sDay02 = 'D000';
  sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry';
  sSecond01 = sLogSecond; sSecond02= 'Last Entry';

  nCountTime = 1;
  While( nCountTime <= nTotalLogTime );
      sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
      sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
      sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
      sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );

      CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' );
      CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
      CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' );
      CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
      CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' );
      CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
      CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' );
      CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
      CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );
      nCountTime = nCountTime + 1;
  End;

  IF( nDataRecordCount > 0 );
       IF( cCubTgt @<> '' );
            CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' );
            CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' );
            CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' );
       ENDIF;
  ENDIF;
EndIF;

######################
### END Loging

IF( 1 = 0 );

#****Begin: Generated Statements***
RETURNVIEWHANDLE('}CellComments_APQ.Demo Sales Cube','zDrill to Cell Comments');
#****End: Generated Statements****

EndIF;

### Check all OK

IF( nErr > 0 );
  ProcessQuit;
EndIF;

### Get the view handle for the drill

ReturnViewHandle( cCubTgt, cViewTgt );

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
