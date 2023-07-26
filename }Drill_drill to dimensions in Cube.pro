601,100
602,"}Drill_drill to dimensions in Cube"
562,"VIEW"
586,"}APQ Dimension Use"
585,"}APQ Dimension Use"
564,
565,"yMT=jzA:5Zy_c:mQ_0u[XJI;Ban[^=xsJQErM;nx5k4:]9tA^C0vcRdfWAml5koBsE0O47y4bYs0Fx[_GhUjJ67YD2d;8pMyGX56_Z::i3<e^R>EdDi@WCM4Q6nyGpvVtZ92qGM3EKOLfGpN2WFb=J@iQ;lRIlZ[rUhv4BhkmTqoa]0DxEiv>\?GrkqrqSl0z;?1hQDD"
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
570,List dimensions in cube
571,
569,0
592,0
599,1000
560,4
CubeName
pType
pObject
pMeasure
561,4
2
2
2
2
590,4
CubeName,"}APQ Glossary"
pType,"Cube"
pObject,"}APQ Glossary"
pMeasure,"APQ Object"
637,4
CubeName,""
pType,""
pObject,""
pMeasure,""
577,0
578,0
579,0
580,0
581,0
582,4
IgnoredInputVarName=V1VarType=32ColType=1165
IgnoredInputVarName=V2VarType=32ColType=1165
IgnoredInputVarName=V3VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=32ColType=1165
603,0
572,114
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
### Drill through to more detailed }APQ information from }APQ Glossary

######################
### Logging - common script

sThisProcName = GetProcessName();
### Params
pDoProcessLogging = 1;
sProcLogParams = 'CubeName:' | CubeName |' & '| 'pType:' | pType |' & '| 'pObject:' | pObject |' & '| 'pMeasure:' | pMeasure;
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

cCubTgt         = '}APQ Dimension Use';
cViewTgt        = 'List dimensions in cube';
cDimTgt         = '}APQ Cubes';
cCubParam       = '}APQ Settings';
cSubAll         = CellGetS( cCubParam, 'Std All Elements', 'String' );
cSubAllN        = CellGetS( cCubParam, 'Std All N Elements', 'String' );
cSubTitle       = 'zDrill to cube';

If( pType @<> 'Cube' );
  ProcessQuit;
EndIf;

sCub = pObject;
iCub = DimIx( cDimTgt, sCub );
IF( ViewExists( cCubTgt, cViewTgt ) = 0 );
  ViewCreate( cCubTgt, cViewTgt );
  ViewTitleDimensionSet( cCubTgt, cViewTgt, cDimTgt );
  ViewSubsetAssign( cCubTgt, cViewTgt, cViewTgt, cSubAllN );
  ViewRowDimensionSet( cCubTgt, cViewTgt, '}APQ Dimensions', 1 );
  ViewSubsetAssign( cCubTgt, cViewTgt, '}APQ Dimensions', cSubAllN );
  ViewColumnDimensionSet( cCubTgt, cViewTgt, '}APQ Dimension Use Measure', 1 );
  ViewSubsetAssign( cCubTgt, cViewTgt, '}APQ Dimension Use Measur', cSubAll );
  ViewRowSuppressZeroesSet( cCubTgt, cViewTgt, 1 );
EndIF;
IF( iCub * ViewExists( cCubTgt, cViewTgt ) > 0 );
  ViewTitleDimensionSet( cCubTgt, cViewTgt, cDimTgt );
  ViewTitleElementSet( cCubTgt, cViewTgt, cDimTgt, iCub );
  If( SubsetExists( cDimTgt, cSubTitle ) = 0 );
    SubsetCreate( cDimTgt, cSubTitle );
  Else;
    SubsetDeleteAllElements( cDimTgt, cSubTitle );
  EndIf;
  SubsetElementInsert( cDimTgt, cSubTitle, sCub, 1 );
  ViewSubsetAssign( cCubTgt, cViewTgt, cDimTgt, cSubTitle );
EndIF;

######################
### END Prolog script
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,63
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

######################
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
RETURNVIEWHANDLE('}APQ Dimension Use','List Dimensions in Cube');
#****End: Generated Statements****

EndIF;

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
