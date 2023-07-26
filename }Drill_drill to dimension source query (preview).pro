601,100
602,"}Drill_drill to dimension source query (preview)"
562,"ODBC"
586,"apliqoC3_READ"
585,"apliqoC3_READ"
564,"apliqo_reader"
565,"roux`85>llfTtm\MZxnKM0w81CnML:o1Gm9kXv1^BJAS4x@^j:RcRSo]nK1Uz3HSYp?a\Gqon5KD4=xrRj=OWZtY[c>CUARXmdiDTWN4i:=bcNkIU[^>yTfP^W>XL<y>b_7RoC]7MS]r;bR8xNhCRjNN6wIXRLvJJu^RM?p405OE`?M>ez>OjW4U_xx0JxQlaaAOE_`D"
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
566,1
Select * From apliqoC3.dbo.Dimension_Source
567,","
588,"."
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,5
CubeName
pDimension
pItem
pParam
pMeasure
561,5
2
2
2
2
2
590,5
CubeName,"}APQ Dimension Definition"
pDimension,"Total APQ Dimensions"
pItem,"Total Items"
pParam,"All Dimension Build Parameters"
pMeasure,"String"
637,5
CubeName,""
pDimension,""
pItem,""
pParam,""
pMeasure,""
577,0
578,0
579,0
580,0
581,0
582,52
IgnoredInputVarName=vElementVarType=32ColType=1165
IgnoredInputVarName=vParent1VarType=32ColType=1165
IgnoredInputVarName=vParent2VarType=32ColType=1165
IgnoredInputVarName=vParent3VarType=32ColType=1165
IgnoredInputVarName=vParent4VarType=32ColType=1165
IgnoredInputVarName=vParent5VarType=32ColType=1165
IgnoredInputVarName=vParent6VarType=32ColType=1165
IgnoredInputVarName=vParent7VarType=32ColType=1165
IgnoredInputVarName=vParent8VarType=32ColType=1165
IgnoredInputVarName=vCommentVarType=32ColType=1165
IgnoredInputVarName=vWeightVarType=33ColType=1165
IgnoredInputVarName=vTypeVarType=32ColType=1165
IgnoredInputVarName=vAttribute1VarType=32ColType=1165
IgnoredInputVarName=vAttribute2VarType=32ColType=1165
IgnoredInputVarName=vAttribute3VarType=32ColType=1165
IgnoredInputVarName=vAttribute4VarType=32ColType=1165
IgnoredInputVarName=vAttribute5VarType=32ColType=1165
IgnoredInputVarName=vAttribute6VarType=32ColType=1165
IgnoredInputVarName=vAttribute7VarType=32ColType=1165
IgnoredInputVarName=vAttribute8VarType=32ColType=1165
IgnoredInputVarName=vAttribute9VarType=32ColType=1165
IgnoredInputVarName=vAttribute10VarType=32ColType=1165
IgnoredInputVarName=vAttribute11VarType=32ColType=1165
IgnoredInputVarName=vAttribute12VarType=32ColType=1165
IgnoredInputVarName=vAttribute13VarType=32ColType=1165
IgnoredInputVarName=vAttribute14VarType=32ColType=1165
IgnoredInputVarName=vAttribute15VarType=32ColType=1165
IgnoredInputVarName=vAttribute16VarType=32ColType=1165
IgnoredInputVarName=vAttribute17VarType=32ColType=1165
IgnoredInputVarName=vAttribute18VarType=32ColType=1165
IgnoredInputVarName=vAttribute19VarType=32ColType=1165
IgnoredInputVarName=vAttribute20VarType=32ColType=1165
IgnoredInputVarName=vAttribute21VarType=32ColType=1165
IgnoredInputVarName=vAttribute22VarType=32ColType=1165
IgnoredInputVarName=vAttribute23VarType=32ColType=1165
IgnoredInputVarName=vAttribute24VarType=32ColType=1165
IgnoredInputVarName=vAttribute25VarType=32ColType=1165
IgnoredInputVarName=vAttribute26VarType=32ColType=1165
IgnoredInputVarName=vAttribute27VarType=32ColType=1165
IgnoredInputVarName=vAttribute28VarType=32ColType=1165
IgnoredInputVarName=vAttribute29VarType=32ColType=1165
IgnoredInputVarName=vAttribute30VarType=32ColType=1165
IgnoredInputVarName=vAttribute31VarType=32ColType=1165
IgnoredInputVarName=vAttribute32VarType=32ColType=1165
IgnoredInputVarName=vAttribute33VarType=32ColType=1165
IgnoredInputVarName=vAttribute34VarType=32ColType=1165
IgnoredInputVarName=vAttribute35VarType=32ColType=1165
IgnoredInputVarName=vAttribute36VarType=32ColType=1165
IgnoredInputVarName=vAttribute37VarType=32ColType=1165
IgnoredInputVarName=vAttribute38VarType=32ColType=1165
IgnoredInputVarName=vAttribute39VarType=32ColType=1165
IgnoredInputVarName=vAttribute40VarType=32ColType=1165
603,0
572,94
##############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDimension:%pDimension% & pItem:%pItem% & pParam:%pParam%' );
pDoProcessLogging = '1';
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
### Prolog script commences

######################
### Inits - declare constants

# 		Standard naming convention for source and target cubes/dimensions
cCubSrc = CubeName;
cCubParam = '}APQ Settings';
cDimTest = '}APQ Escape Characters';
sTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = NumberToString( INT( RAND( ) * 1000 ));
cTestVal1 = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2 = DimNm( cDimTest, 1 );
cTestVal3 = CellGetS( cCubParam, 'Customer Name', 'String' );
cODBCSrc = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ), 'String' );
cODBCUsr = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ) | 'User', 'String' );
cODBCPwd = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ) | ' Pwd', 'String' );
cODBCQry = CellGetS( cCubSrc, pDimension, pItem, pParam, 'String' );
nErr = 0;
sErr = '';

######################
### Test parameters

IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
   nErr = 1;
   sErr = 'Apliqode customer key missing.';
EndIF;

# Check that the ODBC source is not blank
IF( cODBCSrc @= '' );
   nErr = 1;
   sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'No ODBC data source.';
EndIF;

# Check the ODBC query is not blank
IF( Scan( 'SELECT', Upper( cODBCQry ) ) <> 1 );
   nErr = 1;
   sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'No Select found at head of query.';
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Update the Query

cODBCQry = 'SELECT TOP 50' | SubSt( cODBCQry, 7, Long( cODBCQry ) - 6 );

DatasourceType = 'ODBC';
DatasourceNameForServer = cODBCSrc;
DatasourceQuery = cODBCQry;

######################
### End Prolog
######################
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,34
###############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
### Logging - common script 	-----------------  END

IF( nErr > 0 );
   ProcessError;
EndIF;

#****Begin: Generated Statements***
RETURNSQLTABLEHANDLE;
#****End: Generated Statements****

######################
### End Epilog
######################
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
