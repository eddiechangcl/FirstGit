601,100
602,"}APQ.CubAndDim.ViewsAndSubset.CopyGroup"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,
565,"jDp:YyiSPKaLXfYsGrZarnH[FJHYrlV]gTkSei:4994QZ8fOT`=G@xFdT5MUI\:O]FzhAR_QzmYza[7r^gh:xWuka=XMc3r2XE0Ir<[0qOMAH7KB6mdz=57z[?H5z9<5x\0kJ=eB?jO`oL>w5qUu>4FD[[n::afJOxQ@TY_g6WSTD<7jUsq:Z9fr\qygWc4OQv\UvH`m"
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
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,6
pDoProcessLogging
pType
pUserSrc
pGroupTgt
pNameObject
pNameElem
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1"
pType,""
pUserSrc,""
pGroupTgt,""
pNameObject,""
pNameElem,""
637,6
pDoProcessLogging,"Record in process log"
pType,""
pUserSrc,""
pGroupTgt,""
pNameObject,""
pNameElem,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,181
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
### Copy a private subset or private view from a user to all members of the target group
### 

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pType:' | pType |' & '| 'pUserSrc:' | pUserSrc |' & '| 'pGroupTgt:' | pGroupTgt |' & '| 'pNameObject:' | pNameObject |' & '| 'pNameElem:' | pNameElem;
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
cSubProc    = '}APQ.CubAndDim.ViewsAndSubset.CopyUser';
cDimClient  = '}Clients';
cDimGroup   = '}Groups';
cCubInfo    = '}APQ Settings';
cDataDir    = CellGetS( cCubInfo, 'Location: Data Dir', 'String' );
cDataDir    = IF( SubSt( cDataDir, Long(cDataDir), 1 ) @<> '\', cDataDir, SubSt( cDataDir, 1, Long(cDataDir)-1 ) );
cBatchDir   = CellGetS( cCubInfo, 'Location: Scripts', 'String' );
cBatchDir   = IF( SubSt( cBatchDir, Long(cBatchDir), 1 ) @<> '\', cBatchDir, SubSt( cBatchDir, 1, Long(cBatchDir)-1 ) );
nErr        = 0;
sErr        = '';

cDimCAMIDCaption    = '}APQ CAM NamespaceID';
cAttrCAMIDCaption   = 'NamespaceName';

### Test parameters

IF(pType @<>'View' & pType @<>'Subset' );
   nErr = nErr + 1;
  sErr = 'Invalid Element type.';
ENDIF;

IF(pUserSrc @='' % pGroupTgt @='');
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'User source or target cannot be blank.';
ELSEIF(DIMIX( cDimClient, pUserSrc)=0 % DIMIX( cDimGroup, pGroupTgt)=0);
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'User source or target need to exist in the application.';
ELSE;
  sUserSrc = DimensionElementPrincipalName( cDimClient, pUserSrc );
  sGroupTgt = DimensionElementPrincipalName( cDimGroup, pGroupTgt );
ENDIF;

IF(pNameObject @='' % pNameElem @='');
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Object and element cannot be blank.';
ENDIF;

IF(pType @='View');

  sCube = pNameObject;
  sView = Trim( pNameElem);
  IF(CubeExists(sCube)=0);
    nErr = nErr + 1;
    IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
   sErr = sErr | 'Cube does not exist.';
  ELSE;
  ENDIF;

ELSEIF(pType @='Subset');

  sDim = pNameObject;
  sSubset = Trim( pNameElem);
  IF(DimensionExists(sDim)=0);
    nErr = nErr + 1;
    IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
   sErr = sErr | 'Dimension does not exist.';
  ELSE;
  ENDIF;

ENDIF;

sFile = cBatchDir | '\' | cBatCmd;
IF(FileExists(sFile) = 0);
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Batch does not exit.';
ENDIF;

sCAMIDSrc='';
sCAMIDTgt='';
nSizeCAMIDSrc = 0;
nSizeCAMIDTgt = 0;

IF(SUBST(sUserSrc,1,6) @='CAMID(');
   nFindCAMIDSrc = SCAN(':', sUserSrc);
  sCAMIDSrc= SUBST(sUserSrc,8, nFindCAMIDSrc - 8 );
  # Check if the CAMID prefix has a caption
  IF( DIMIX( cDimCAMIDCaption, sCAMIDSrc ) <> 0 );
     sAliasCAMIDSrc = ATTRS ( cDimCAMIDCaption, sCAMIDSrc, cAttrCAMIDCaption );
    IF ( sAliasCAMIDSrc @<> '' );
        sCAMIDSrc = sAliasCAMIDSrc;
    ENDIF; 
  ENDIF;
  nSizeCAMIDSrc = LONG( sCAMIDSrc );
ENDIF;

sUserSrcAlias = ATTRS(cDimClient, sUserSrc,'}TM1_DefaultDisplayValue');

IF( sUserSrcAlias @= '' );
   sUserSrcAlias = sUserSrc;
ELSEIF( nSizeCAMIDSrc <> 0 & SUBST( sUserSrcAlias, 1, nSizeCAMIDSrc ) @= sCAMIDSrc );
   sUserSrcAlias = SUBST( sUserSrcAlias, nSizeCAMIDSrc + 2, LONG ( sUserSrcAlias ) -  nSizeCAMIDSrc - 1 );
ENDIF;

IF(pType @='View');
  IF(sCAMIDSrc@='');
    sSourceFile = cDataDir | '\' | sUserSrcAlias | '\' | sCube | '}vues\' | sView | '.vue';
  ELSE;
    sSourceFile = cDataDir | '\' | sCAMIDSrc | '\' | sUserSrcAlias | '\' | sCube | '}vues\' | sView | '.vue';
  ENDIF;
ELSE;
  IF(sCAMIDSrc@='');
    sSourceFile = cDataDir | '\' | sUserSrcAlias | '\' | sDim | '}subs\' | sSubset | '.sub';
  ELSE;
    sSourceFile = cDataDir | '\' | sCAMIDSrc | '\' | sUserSrcAlias | '\' | sDim | '}subs\' | sSubset | '.sub';
  ENDIF;
ENDIF;

IF(FileExists(sSourceFile) = 0);
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'File does not exit: ' | sSourceFile;
ENDIF;

### Quit if errors

IF( nErr <> 0 );
  ItemReject( sErr );
  ProcessQuit;
EndIF;

### Loop through clients to find members of group

iUsr = 1;
iMax = DimSiz( cDimClient );
While( iUsr <= iMax );
  sUsr = DimNm( cDimClient, iUsr );
  sGrp = CellGetS( '}ClientGroups', sUsr, sGroupTgt );
  IF( sGrp @= sGroupTgt & sUsr @<> sUserSrc );
    ExecuteProcess( cSubProc, 'pDoProcessLogging', pDoProcessLogging, 'pType', pType, 'pUserSrc', pUserSrc, 'pUserTgt', sUsr, 'pNameObject', pNameObject, 'pNameElem', pNameElem );
  EndIF;
  iUsr = iUsr + 1;
End;

#####################
### END Prolog

573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,8
######################
#**** COPYRIGHT CUBEWISE SERVICES AG
######################

#****Begin: Generated Statements***
#****End: Generated Statements****


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
