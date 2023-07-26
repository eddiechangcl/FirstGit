601,100
602,"}Drill_drill to dimension preview in staging cube"
562,"VIEW"
586,"}APQ Dimension Definition Source"
585,"}APQ Dimension Definition Source"
564,
565,"u<o0hCZqoI=rN<Cf@37C3zL7dho?0niuVoF5\N]kjSzRP8q@KvhG<VX=jgn__46YpHHo9Kt32sEc3Y8gP2Vn80g:l;A[6]OX09JtGVkH1E[DEe|Gxszb0L?H[n71`6GjD5wniDi_<1GQ2Xypf`mf>?RuDUfTDGveBlhtXi^vm@QOUgT;c@C2tY:yEGs4d]7@v1:hu2Jiu<o0hCZqoI=rN<Cf@37C3tL7dho?0nieRoF5\N]kjSzRPH}@KvhG<VX=jgGU_4FTpHH6Kt32sef3Y5gP2Vn80g:l;![6]OX09JtOVkH1E[DEelayszb0L?H[n71P0@jD5yNjDi_<1Ga2Xy0g`mV8?RuDUfTDGveBlhqXi>}m@QOugT;c@C2t98yEGs4d}6@{1:hu2Ji"
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
589,
568,""""
570,Default
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
582,4
IgnoredInputVarName=V1VarType=32ColType=1165
IgnoredInputVarName=V2VarType=32ColType=1165
IgnoredInputVarName=V3VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=33ColType=1165
603,0
572,156
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
cCubTgt = '}APQ Dimension Definition Source';
cViewTgt = '}Preview_DimensionSource';
cCubParam = '}APQ Settings';
cDimTest = '}APQ Escape Characters';
sTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = NumberToString( INT( RAND( ) * 1000 ));
cTestVal1 = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2 = DimNm( cDimTest, 1 );
cTestVal3 = CellGetS( cCubParam, 'Customer Name', 'String' );
cSourceType = CellGetS( cCubSrc, pDimension, pItem, 'Source Type', 'String' );
cSourcePath = CellGetS( cCubSrc, pDimension, pItem, 'CSV File Folder', 'String' );
cSourceFile = CellGetS( cCubSrc, pDimension, pItem, 'CSV File Name', 'String' );
cCSVSrc = cSourcePath |'\'| cSourceFile;
IF( cSourceType @= 'ODBC' );
   cODBCSrc = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ), 'String' );
   cODBCUsr = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ) | 'User', 'String' );
   cODBCPwd = CellGetS( cCubParam, CellGetS( cCubSrc, pDimension, pItem, 'ODBC Source', 'String' ) | ' Pwd', 'String' );
   cODBCQry = CellGetS( cCubSrc, pDimension, pItem, pParam, 'String' );
EndIF;
nErr = 0;
sErr = '';

######################
### Test parameters

IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
   nErr = 1;
   sErr = 'Apliqode customer key missing.';
EndIF;

# Check the source type
IF( cSourceType @<> 'ODBC' & cSourceType @<> 'CSV' & cSourceType @<> 'CUBE' );
   nErr = 1;
   sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid source type ' | cSourceType;
EndIF;

IF( cSourceType @= 'ODBC' );
   # Check that the ODBC source is not blank
   IF( cODBCSrc @= '' );
      nErr = 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'No ODBC data source.';
   EndIF;

   # Check the ODBC query is not blank
   IF( Scan( 'SELECT', Upper( cODBCQry ) ) = 0 );
      nErr = 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'No Select found in query.';
   EndIF;

EndIF;

IF( cSourceType @= 'CSV' );

   # Check the file exists
   IF( FileExists ( cCSVSrc ) = 0 );
      nErr = 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'File not found: ' | cCSVSrc;
   EndIF;

EndIF;

######################
### Create the target view

IF( ViewExists( cCubTgt, cViewTgt ) = 0 );
   ViewCreate( cCubTgt, cViewTgt );
EndIF;

ViewTitleDimensionSet( cCubTgt, cViewTgt , '}APQ Dimensions' );
ViewRowDimensionSet( cCubTgt, cViewTgt , '}APQ Data Source Row', 1 );
ViewColumnDimensionSet( cCubTgt, cViewTgt , cCubTgt | ' Measure', 1 );

nDim = DimIx( '}APQ Dimensions', pDimension );
ViewTitleElementSet( cCubTgt, cViewTgt , '}APQ Dimensions', nDim );
ViewSubsetAssign( cCubTgt, cViewTgt, '}APQ Data Source Row', 'Preview' );
ViewSubsetAssign( cCubTgt, cViewTgt, cCubTgt | ' Measure', 'Preview' );

ViewRowSuppressZeroesSet( cCubTgt, cViewTgt, 1 );
ViewColumnSuppressZeroesSet( cCubTgt, cViewTgt, 0 );

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Load the data source to staging

IF( cSourceType @= 'CSV' % cSourceType @= 'ODBC' );

   bCubeSrc = 0;
   nItem = 1; nMaxItems = 50;
   While( nItem <= nMaxItems );
      sItem = NumberToString( nItem ); 
      sSourceType = CellGetS( CubeName, pDimension, sItem, 'Source Type', 'String' );
      IF( sSourceType @= 'CUBE' );
         bCubeSrc = 1;
         nItem = nMaxItems;
      EndIF;
      nItem = nItem + 1;
   End;

   # If "cube" is used as the source for another step of the same dimension we don't want to overwrite the input!
   IF( bCubeSrc = 0 );
      sProc = '}APQ.Cub.DimensionDefinitionSource.Load.Preview';
      ExecuteProcess( sProc, 'pDimension', pDimension, 'pItem', pItem );
   EndIF;

EndIF;

######################
### End Prolog
######################
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,40
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

ReturnViewHandle( cCubTgt, cViewTgt );

IF( 1 = 0 );

#****Begin: Generated Statements***
RETURNVIEWHANDLE('}APQ Dimension Definition Source','Default');
#****End: Generated Statements****

EndIF;

######################
### End Epilog
######################
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
