601,100
602,"}Drill_Drill to Descendant Comments (6)"
562,"VIEW"
586,"}CellComments_APQ.Demo Sales Cube"
585,"}CellComments_APQ.Demo Sales Cube"
564,
565,"b2yUx8Bl3?m<8PN;=Bcev9baxJq13CKC<RlaGMJNinF[r>vEm>Gcx2_>[JlWo@\q`s0cC\orQJ{hOWWPJ2uzZjC8lOx0a>6\_QC9}hvycbT9w]`o}TAS]wySi\gIyG2uaR2ElX=9Vi\`bhhH4Uj6}p^6sgB02oPSx=ak^x)kLOZ;1G[5_t>2hJAi<Uty7h9`wu]XI1kA"
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
570,zDrill to Cell Comments
571,
569,0
592,0
599,1000
560,7
CubeName
pDim1
pDim2
pDim3
pDim4
pDim5
pDim6
561,7
2
2
2
2
2
2
2
590,7
CubeName,"Sales Cube"
pDim1,"ACT"
pDim2,"All Years"
pDim3,"Month Rollups"
pDim4,"Customer Rollups"
pDim5,"Product Rollups"
pDim6,"BASE"
637,7
CubeName,""
pDim1,""
pDim2,""
pDim3,""
pDim4,""
pDim5,""
pDim6,""
577,0
578,0
579,0
580,0
581,0
582,10
IgnoredInputVarName=V1VarType=32ColType=1165
IgnoredInputVarName=V2VarType=32ColType=1165
IgnoredInputVarName=V3VarType=32ColType=1165
IgnoredInputVarName=V4VarType=32ColType=1165
IgnoredInputVarName=V5VarType=32ColType=1165
IgnoredInputVarName=V6VarType=32ColType=1165
IgnoredInputVarName=V7VarType=32ColType=1165
IgnoredInputVarName=V8VarType=32ColType=1165
IgnoredInputVarName=V9VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=32ColType=1165
603,0
572,128
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
### For any cube ( with 8 dimensions ). Drill through to the cell commentary

######################
### Logging - common script

sThisProcName = GetProcessName();
### Params
pDoProcessLogging = 1;
sProcLogParams = 'CubeName:' | CubeName |' & '| 'pDim1:' | pDim1 |' & '| 'pDim2:' | pDim2 |' & '| 'pDim3:' | pDim3 |' & '| 'pDim4:' | pDim4 |' & '| 'pDim5:' | pDim5 |' & '| 'pDim6:' | pDim6;
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
cViewTgt = 'zDrill to Descendant Comments';

nErr = 0;

IF( CubeExists( cCubSrc ) = 0 );
  nErr = 1;
  ItemReject( 'There are no cell comments for cube ' | CubeName );
EndIF;

# Build View
If( ViewExists( cCubTgt, cViewTgt ) = 0 );
    ViewCreate( cCubTgt, cViewTgt );
EndIf;
ViewColumnDimensionSet( cCubTgt, cViewTgt, '}APQ Cell Comment Measure', 1 );
ViewRowDimensionSet( cCubTgt, cViewTgt, '}APQ Cell Comment Index', 1 );
ViewRowDimensionSet( cCubTgt, cViewTgt, '}Annotation_ApplicationID', 1 );
iDim = CubeDimensionCountGet(CubeName);
While( iDim >= 1 );
    sDim = TabDim( CubeName, iDim );
    sEle = Expand( '%pDim' | NumberToString(iDim) | '%' );
    If( DType( sDim, sEle ) @<> 'C' );
        ViewTitleDimensionSet( cCubTgt, cViewTgt, sDim );
    Else;
        ViewRowDimensionSet( cCubTgt, cViewTgt, sDim, 1 );
        sMDX = Expand('{TM1DRILLDOWNMEMBER( {[%sDim%].[%sEle%]}, ALL, RECURSIVE )}');
        If( SubsetExists( sDim, cViewTgt ) = 0 );
            SubsetCreatebyMDX( cViewTgt, sMDX, sDim, 0 );
        Else;
            SubsetMDXSet( sDim, cViewTgt, sMDX );
        EndIf;
        ViewSubsetAssign( cCubTgt, cViewTgt, sDim, cViewTgt );
    EndIf;
    iDim = iDim - 1;
End;
ViewSuppressZeroesSet( cCubTgt, cViewTgt, 1 );

# Update comments cube
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
575,70
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
RETURNVIEWHANDLE('}CellComments_APQ.Demo Sales Cube','zDrill to Descendant Comments');
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
1217,1
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
