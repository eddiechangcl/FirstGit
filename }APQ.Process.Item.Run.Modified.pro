601,100
602,"}APQ.Process.Item.Run.Modified"
562,"VIEW"
586,"}APQ Process Execution Item"
585,"}APQ Process Execution Item"
564,
565,"h0nWv<oVaDB>W?YG6ck7ukMr:k>[:mQ8?R^dn:yA7BHrR3<U]\iNvdTHBsAdqR97gZ@3[c0oM>9GN34zPM^Pymfc[>=Eg6Vu_m3Rof4jbtzM[^:Byf_J6f__]n`0p0O\t1;9dBllwMDZrowxm>>Q48=`3GMlA[8Kes>dYE?OlXO2Pu`:mrO3f[797Y<pmeu@5ubanbr2"
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
570,Default
571,
569,0
592,0
599,1000
560,1
pListItem
561,1
2
590,1
pListItem,""
637,1
pListItem,"List Item : (01,02...)"
577,5
vListItem
vItem
vParameter
vMeasure
Value
578,5
2
2
2
2
2
579,5
1
2
3
4
5
580,5
0
0
0
0
0
581,5
0
0
0
0
0
582,5
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,188
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.03
# Copyright 2016-2020, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

#Region - Initialize Logging
##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pListItem:' | pListItem;
### Params
pDoProcessLogging = '1';
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total Years', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; 
### Logging - common script 	-----------------  END
##############################################################################################################
#EndRegion

#-------------------------------------------------------------------------------
#                            Check for errors
#-------------------------------------------------------------------------------

If ( DimIx ( '}APQ Execution Item' , pListItem ) = 0 );
	DATASOURCETYPE = 'NULL';
	ItemReject( 'List Item name [' | pListItem | '] does not exist' );
	ProcessQuit ;
EndIf ; 

cTopParameters = 'Total APQ Process Parameters' ;

#-------------------------------------------------------------------------------
#                            Start Logging
#-------------------------------------------------------------------------------

sProcessName = GetProcessName();

#------------------------------- LOG PART
#Define TM1 Object Variables

cHustleItem = pListItem;
cItem       = 'Total Items';

#Define  Variables
cLogCube    = '}APQ Process Execution Item';
cCAMUser    = TM1User();
IF( SUBST( cCAMUser , 1 , 5 ) @= 'CAMID' );
	sUser   = ATTRS('}Clients',cCAMUser,'}TM1_DefaultDisplayValue');
ELSE;
	sUser   = cCAMUser ;
ENDIF;
sStringUser = SUBST(sUser,SCAN('/',sUser)+1,Long(sUser));

#---------------------------
# Logging in }APQ Process Execution Item

timeStart   = NOW;
dateStart   = TIMST( timeStart, '\Y \m \d - \h:\i:\s' );

CellPutS( dateStart, cLogCube, cHustleItem,cItem,cTopParameters, 'StartTime' );
CellPutS( '', cLogCube, cHustleItem, cItem, cTopParameters, 'FinishTime' );
CellPutS( '', cLogCube, cHustleItem, cItem, cTopParameters, 'Elapsed Time' );
CellPutS( NumberToStringEx( timeStart, '#####.#########', '.', '' ), cLogCube, cHustleItem, cItem, cTopParameters, 'nStartTime' );
CellPutS( '', cLogCube, cHustleItem, cItem, cTopParameters, 'nFinishTime' );


#-------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#                                                                 Variables
#
#--------------------------------------------------------------------------------------------------------------------------------------------------------#.

cCubParam       = '}APQ Settings';
cCube           = '}APQ Process Execution Item'; cCubSrc = cCube;
cProcEx         = 'APQ.Process.Execute';
cHustleEXE      = CellGetS(cCubParam, 'Location: Hustle' ,'String');
cTM1RunTIutility= CellGetS(cCubParam,'Location: TM1RunTI','String');
cTM1RunTIConfig = CellGetS(cCubParam,'Location: TM1RunTI Config','String')  ;
cScriptFolder   = CellGetS(cCubParam, 'Location: Scripts' ,'String');
cScriptFolder   = cScriptFolder | If( SubSt( cScriptFolder, Long( cScriptFolder ), 1) @<> '\', '\', '' );
cScriptFileName = GetProcessName |'_'| pListItem | '.txt';
sMainRunTI      = '"' | cTM1RunTIutility | '"' | ' -i ' | '"' | cTM1RunTIConfig | '"';
sNbThread       = CellGetS( cCubParam, 'Max CPUs' , 'String');
sDisabled       = CellGetS( cCube , pListItem , cItem, cTopParameters, 'IsDisabled' );
sRunSerial      = CellGetS( cCube , pListItem , cItem, cTopParameters, 'RunSerial' );
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
nRet            = 0;
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;

#--------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#                                                                 Test if disabled
#
#--------------------------------------------------------------------------------------------------------------------------------------------------------#.

IF( sDisabled @= 'YES' );
	DATASOURCETYPE = 'NULL';
	sMsg = 'List Item name [' | pListItem | '] has been disabled, no processes will run.';
	LogOutput( 'ERROR', sMsg );
	ProcessQuit ;
ENDIF;

nMaxCPUs  = CellGetN('}APQ Settings', 'Max CPUs', 'Numeric');
nMaxProcesses = CellGetN('}APQ Process Execution Item', pListItem, 'Total Items', 'Total APQ Process Parameters', 'ProcessExecutionFlag');

#--------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#                                                                 Create Source View
#
#--------------------------------------------------------------------------------------------------------------------------------------------------------#
 
sProc   = '}bedrock.cube.view.create';
sFilter = Expand('}APQ Execution Item%sDelimEleStart%%pListItem%%sDelimDim%}APQ Execution Item Measure%sDelimEleStart%ProcessName%sDelimDim%}APQ Item Index%sDelimEleStart%Total Items');
nRet    = ExecuteProcess( sProc, 'pLogOutput', 0,
    'pCube', cCube, 'pView', cViewSrc, 'pFilter', sFilter,
    'pSuppressZero', 1, 'pSuppressConsol', 1, 'pSuppressRules', 1,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1
);
nTM1Version = CellGetN('}APQ Settings', 'TM1 Version', 'Numeric');

# Now set SkipCalcs=False and add "Total APQ Process Parameters" to view
ViewExtractSkipCalcsSet( cCube, cViewSrc, 0 );
sDim    = '}APQ Process Parameters';
sEl     = cTopParameters;
If( SubsetExists( sDim, cSubSrc ) = 1 );
    SubsetDeleteAllElements( sDim, cSubSrc );
Else;
    SubsetCreate( sDim, cSubSrc, 1 );
EndIf;
SubsetElementInsert( sDim, cSubSrc, sEl, 1 );
ViewSubsetAssign( cCube, cViewSrc, sDim, cSubSrc );

#--------------------------------------------------------------------------------------------------------------------------------------------------------#
#
#                                                                 Define Source View
#
#--------------------------------------------------------------------------------------------------------------------------------------------------------#

IF( nRet = ProcessExitNormal );
    DatasourceNameForServer         = cCube;
    DatasourceType                  = 'VIEW';
    DatasourceCubeView              = cViewSrc;
    DatasourceASCIIQuoteCharacter   = '';
Else;
    sMsg = Expand('%sThisProcName%: error creating source view. Exit with no work done.');
    LogOutput( 'WARN', sMsg );
    DatasourceType                  = 'NULL';
EndIF;
    
#-------------------------------------------------------------------------------------------------------
#
#     RUN HUSTLE in EPILOGUE
#
#-------------------------------------------------------------------------------------------------------
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,102
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.03
# Copyright 2016-2020, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################


#****Begin: Generated Statements***
#****End: Generated Statements****

vDim1       = vListItem;
vDim2       = vItem;

#--------------------------------------
sProcess    = CellGetS( cCube, vDim1, vDim2, cTopParameters, 'ProcessName' );
sDisabled   = CellGetS( cCube, vDim1, vDim2, cTopParameters, 'IsDisabled' );
sExitOnError= CellGetS( cCube, vDim1, vDim2, cTopParameters, 'ExitOnError' );

IF( DimIx( '}Processes', sProcess ) = 0 );
   ItemSkip;
EndIF;

IF( sDisabled @= 'YES' );
   sMsg     = Expand('List Item name [%vDim1%-%vDim2%] has been disabled.');
   sMsg     = Expand( '%sProcessName%, %vListItem%, %vItem%: %sProcess%, %sMsg%' );
   LogOutput( 'WARN', sMsg );
   ItemSkip;
ENDIF;

#--------------------------------------
sParameters = CellGetS( cCube, vDim1, vDim2, cTopParameters, 'ProcessParameters' );

IF( sRunSerial @= 'NO' % sRunSerial @= '' );

  IF( nMaxProcesses <= nMaxCPUs & nTM1Version >= 11.4);
    
    # substitute "=" for ASCII control character "SUB" for use as pParamDelim (so as to avoid any conflict with any string delimiter that might be used)  
    While( Scan( '=', sParameters ) > 0 );
      sParameters = SubSt( sParameters, 1, Scan( '=', sParameters ) - 1 ) | Char(26) | SubSt( sParameters, Scan( '=', sParameters ) + 1, Long( sParameters ) );
    End;
    # substitute '" ' (double-quote space for ASCII control character "DLE" for use as pParamValueStartDelim (so as to aviod any conflict with any string delimiter that might be used)  
    While( Scan( '" ', sParameters ) > 0 );
      sParameters = SubSt( sParameters, 1, Scan( '" ', sParameters ) - 1 ) | Char(16) | SubSt( sParameters, Scan( '" ', sParameters ) + 2, Long( sParameters ) );
    End;
    While( Scan( '"', sParameters ) > 0 );
      sParameters = SubSt( sParameters, 1, Scan( '"', sParameters ) - 1 ) | SubSt( sParameters, Scan( '"', sParameters ) + 1, Long( sParameters ) );
    End;

    RunProcess( 'APQ.Process.Execute' 
      , 'pProcess', sProcess
      , 'pParamArray', sParameters 
      , 'pParamDelim', Char(16)
      , 'pParamValueStartDelim', Char(26)
      , 'pUseRunTI', '0'
    );
  ELSE;
    sRunTI = sMainRunTI | ' -process "' | sProcess | '" '| sParameters;
    AsciiOutput( cScriptFolder | cScriptFileName, sRunTI );
  ENDIF;

ELSEIF( sRunSerial @= 'YES' );

   # substitute "=" for ASCII control character "SUB" for use as pParamDelim (so as to avoid any conflict with any string delimiter that might be used)  
   While( Scan( '=', sParameters ) > 0 );
      sParameters = SubSt( sParameters, 1, Scan( '=', sParameters ) - 1 ) | Char(26) | SubSt( sParameters, Scan( '=', sParameters ) + 1, Long( sParameters ) );
   End;
   # substitute '" ' (double-quote space for ASCII control character "DLE" for use as pParamValueStartDelim (so as to aviod any conflict with any string delimiter that might be used)  
   While( Scan( '" ', sParameters ) > 0 );
      sParameters = SubSt( sParameters, 1, Scan( '" ', sParameters ) - 1 ) | Char(16) | SubSt( sParameters, Scan( '" ', sParameters ) + 2, Long( sParameters ) );
   End;
   While( Scan( '"', sParameters ) > 0 );
      sParameters = SubSt( sParameters, 1, Scan( '"', sParameters ) - 1 ) | SubSt( sParameters, Scan( '"', sParameters ) + 1, Long( sParameters ) );
   End;

   # Check if previous process in chain has error status (5=ProcessExitWithMessage, 6=ProcessExitMinorError, 7=ProcessExitByBreak, 8=ProcessExitByQuit, 10=ProcessExitSeriousError)
   If( sExitOnError @= 'YES' & nRet > 5 );
       # Don't run, just output message
       LogOutput( 'INFO', Expand('%sThisProcName%: execution of %sProcess% skipped due to error in prior process.') );
   Else;
       # In APQ.Process.Execute pass in paramArray with the special delimiters
       nRet = ExecuteProcess( cProcEx 
          , 'pProcess', sProcess
          , 'pParamArray', sParameters 
          , 'pParamDelim', Char(16)
          , 'pParamValueStartDelim', Char(26)
          , 'pUseRunTI', '0'
       );
   EndIf;

ELSE;
    
    sMsg = Expand('Process execution item %vListItem% unknown execution mode. RunSerial must be either "YES" or "NO".');
    LogOutput( 'WARN', sMsg );
   
ENDIF;




575,56
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.03
# Copyright 2016-2020, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################


#****Begin: Generated Statements***
#****End: Generated Statements****

#-------------------------------------------------------------------------------------------------------
#
#     RUN HUSTLE
#
#-------------------------------------------------------------------------------------------------------

IF( sRunSerial @= 'NO' );

   sCmd = '"' | cHustleEXE | '" "'| cScriptFolder | cScriptFileName | '" ' | sNbThread;
   ExecuteCommand( sCmd ,1 );

ENDIF;

#-------------------------------------------------------------------------------
#                            End Logging
#-------------------------------------------------------------------------------

timeStart   = StringToNumber( CellGetS( cLogCube,  cHustleItem,cItem, cTopParameters, 'nStartTime' ) );
timeFinish  = NOW;
elapsedTime = TIMST( timeFinish - timeStart, '\h:\i:\s' );
dateFinish  = TIMST( timeFinish, '\Y \m \d - \h:\i:\s' );

CellPutS( dateFinish, cLogCube, cHustleItem,cItem, cTopParameters, 'FinishTime' );
CellPutS( elapsedTime, cLogCube, cHustleItem, cItem, cTopParameters, 'Elapsed Time' );
CellPutS( NumberToStringEx( timeFinish, '#####.#########', '.', '' ), cLogCube, cHustleItem, cItem, cTopParameters, 'nFinishTime' );

#Region - Finalize Logging
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
#EndRegion
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
