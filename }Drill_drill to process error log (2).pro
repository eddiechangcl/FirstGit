601,100
602,"}Drill_drill to process error log (2)"
562,"ODBC"
586,"APQLogDrill"
585,"APQLogDrill"
564,
565,"r91hnV[60BxzPI@Qsga5F=67d^p`gCeBEgs0lwZrHH:]@b@e\:7K?SSKw@tx7YxRNJX9JyfH?juQSrru_>MUAJ6dUdfFUr=@\5dn3NF6z4I96;HnYG^2`RP4XDPfO[gvMm2Oyn05`erv6gQ_65?`\30q]J6L^3qB`e>I>uMHfk[cVI>3h1i]:CYaaK3Er6syzTBsMFsB"
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
566,1
Select * From "TM1ProcessError_20170315222933_603.txt"
567,","
588,"."
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,3
CubeName
pProcessRunID
pMeasure
561,3
2
2
2
590,3
CubeName,"}APQ Process Execution Tree"
pProcessRunID,"Process Rollups"
pMeasure,"nProcessExecutionIndex"
637,3
CubeName,""
pProcessRunID,""
pMeasure,""
577,0
578,0
579,0
580,0
581,0
582,1
IgnoredInputVarName=TM1ProcessError_MessageVarType=32ColType=1165
603,0
572,127
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
sErrorLog = CellGetS( CubeName, pProcessRunID, pMeasure );
sProcLogParams = Expand( 'error log file being drilled: %sErrorLog%' );
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
cPathSrc = GetProcessErrorFileDirectory;
cSourceFile = cPathSrc | sErrorLog;
cPathTgt = cPathSrc | 'APQLogDrill';
cSchemaFile = cPathTgt | '\schema.ini';
cODBCSrc = CellGetS( cCubParam, 'Log Drill', 'String' );
nErr = 0;
sErr = '';

######################
### Test parameters

IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
   nErr = 1;
   sErr = 'Apliqode customer key missing';
EndIF;

# Check that the folder for the drill exists
IF( FileExists( cPathTgt ) = 0 );
   # make the directory. if the dir doesn't exist then most likelly the ODBC connection also hasn't been set up, but 1st things 1st
   sCmd = Expand( 'cmd /c md "%cPathTgt%"' );
   ExecuteCommand( sCmd, 0 );
   Sleep( 100 );
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Keep the drill dir clean

sCmd = Expand( 'cmd /c del "%cPathTgt%\TM1ProcessError*.txt"' );
ExecuteCommand( sCmd, 1 );

######################
### Determine the target file name and copy from the source

DatasourceAsciiQuoteCharacter = '';
sTgtFileName = SubSt( sErrorLog, 1, 31 ) | sRandomInt | '.txt';
sTgtFile = cPathTgt | '\' | sTgtFileName;

IF( FileExists( cSourceFile ) = 0 );
   AsciiOutput( sTgtFile, 'Unable to drill to the selected error log. The file has been moved or deleted.' );
Else;
   sCmd = Expand( 'cmd /c copy /y "%cSourceFile%" "%sTgtFile%"' );
   ExecuteCommand( sCmd, 0 );
   Sleep( 100 );
   IF( FileExists( sTgtFile ) = 0 );
      AsciiOutput( sTgtFile, 'Unable to copy the process error log to drill directory.' );
      AsciiOutput( sTgtFile, sCmd );
   EndIF;
EndIF;

######################
### Update the schema.ini file for the Text ODBC source

AsciiOutput( cSchemaFile, Expand( '[%sTgtFileName%]' ) );
AsciiOutput( cSchemaFile, 'ColNameHeader=False' );
AsciiOutput( cSchemaFile, 'Format=TabDelimited' );
AsciiOutput( cSchemaFile, 'CharacterSet=ANSI' );
AsciiOutput( cSchemaFile, 'MaxScanRows=10' );
AsciiOutput( cSchemaFile, 'TextDelimiter=^' );
AsciiOutput( cSchemaFile, 'Col1=TM1ProcessError_Message Text Width 250' );

######################
### Update the Query

DatasourceType = 'ODBC';
DatasourceNameForServer = cODBCSrc;
DatasourceQuery = Expand( 'Select * From "%sTgtFileName%"' );

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
