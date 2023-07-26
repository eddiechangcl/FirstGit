601,100
602,"Sys.Workbench.Task Dependency.Update"
562,"VIEW"
586,"Sys Workbench Task Dependency"
585,"Sys Workbench Task Dependency"
564,
565,"yU4EAWaMoLIqMDU9G?5>Qq6iazG[R`P|0lOWkp=Y;f?pZFNmBVcyFF0Y^vbWxnYrCnbM6wCVz>{ZfMK0RPLLMeBDZBl{x7<`Q7>W9eXV4[XhP1MG>v5^nEFu`c>c`vaFAG~2Sa;Wa=Q0Ho:9CP7:Ph8MCh5zce7s:lE\L:UHk<eh<1;@b;wk?BYphcr5NgHD?0l:?1ADyU4EAWaMoLIqMDU9G?5>Qq6iazG[R`PL2lOWkp=Y;f?pZFCmBVcyFF0Y^vIVxnizCnb=8wCVz>kUf}F0RPLLMeBDZB|qx7<`Q7>g?eXV4[XhP1mq8v5^nEFu`c>c@ZgFAGzBXa;Wa=Q0Co:ILP7jSh8MCh5zce7s:l5QL:UCk<eh,?;@b;wk?RRphcr5NWBd10l:?1ADyU4EAWaMoLIqMDU9G?5>Qq6iaoG[R`P<:lOWkp=Y;f?pZFMmBVcyFF0Y^fxZxnyuCnb=3wCVz>[Zf=H0RPLLMeBDZB\xx7<`Q7>W>eXV4[XhP1}S1v5^nEFu`c>c@1fFAGx2Xa;Wa=QpDo:YJP7JSh8MCh5zce7s:lUQL:EOk<eh\4;@b;wk?2Rphcr5N7Bd<0l:?1AD"
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
570,zTemp
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDebug
561,2
2
2
590,2
pDoProcessLogging,"1"
pDebug,"0"
637,2
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
577,8
vScenario
vYear
vGroup
vPriority
vStep
vLineItem
vMeasure
vValue
578,8
2
2
2
2
2
2
2
2
579,8
1
2
3
4
5
6
7
8
580,8
0
0
0
0
0
0
0
0
581,8
0
0
0
0
0
0
0
0
582,8
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,274
##############################################################################################################
### CWA Std. Model  version 2.00
### Copyright © 2018, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to 
# 
# DATA SOURCE:
#    none
#
# REMARK:
#    none
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2016-12-09  Tat Seng Wong       Create
#   2018-02-19  Lingo Wang          Apply }APQ Logging
#   2019-08-07  Tat Seng Wong       Upgrade to }Bedrock 4
#
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	-----------------  START (CUBEWISE APLIQODE FRAMEWORK)
sThisProcName = GetProcessName();
### Params
sProcLogParams = '';
# E.g.1 sProcLogParams = Expand( 'pParam1:%pParam1% & pParam2:%pParam2% & pParam3:%pParam3% & pParamN:%pParamN%' );
# E.g.2 sProcLogParams = 'pParam1:' | pParam1 |' & '| 'pParam2:' | pParam2 |' & '| 'pParam3:' | pParam3 |' & '| 'pParamN:' | pParamN;
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

### Debug
sTimeStamp = 	TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = 	NumberToString( INT( RAND( ) * 1000 ));

cProcessName = sThisProcName;
cTimeStamp = sTimeStamp;

cCubParam = '}APQ Settings';
cDebugLoc = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile = cDebugLoc | sThisProcName |'_'| sTimeStamp | '_' | sRandomInt;
sDebugFile = cDebugFile | '_Prolog.debug';

nDebug = StringToNumber( pDebug );
IF( pDebug @= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

nError = 0;
sErrorString = '';

##############################################################################################################
### Prolog script commences

NumericGlobalVariable('PrologMinorErrorCount');

######################
#### Constant 

cCubeSource = 'Sys Workbench Task Dependency' ;
cCubeTarget = 'Sys Workbench Task Dependency' ;

cDimScenario = 'Scenario' ;
cDimYear = 'Year' ;
cDimGroup = 'Sys Workbench Group' ;
cDimPriority = 'Sys Workbench Priority' ;
cDimStep = 'Sys Workbench Step' ;
cDimLineItem = 'Line Item' ;
cDimMeasure = 'M Sys Workbench Task Dependency' ;

cElemMeasure = 'Preorder Task Name' ;

cRefCube = 'Sys Workbench' ;

cMPreorderScenario = 'Preorder - Scenario' ;
cMPreorderYear = 'Preorder - Year' ;
cMPreorderGroup = 'Preorder - Group';
cMPreorderPriority = 'Preorder - Priority' ;
cMPreorderStep= 'Preorder - Step' ;

cMPostorderScenario = 'Postorder - Scenario' ;
cMPostorderYear = 'Postorder - Year' ;
cMPostorderGroup = 'Postorder - Group' ;
cMPostorderPriority = 'Postorder - Priority' ;
cMPostorderStep = 'Postorder - Step' ;

cStepTotal = 'All Sys Workbench Steps';
cLineItemTotal = 'All Line Items';

cDimensionDelim = CellGetS(cCubParam,'pDimDelim','String');
cElementStartDelim = CellGetS(cCubParam,'pEleStartDelim','String');
cElementDelim = CellGetS(cCubParam,'pEleDelim','String');

#######################################################################################
#
# CREATE DATA SOURCE
#
#######################################################################################

#Define Temporary Object Name, and Check if the view already exists
cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
While (ViewExists(cCubeSource, cTempName | '_Source') <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;
cViewSource = cTempName | '_Source';
cViewTarget = cTempName | '_Target';
cSub = cTempName | '_Source';
cSubTemp = cTempName | '_Temp';

If (ViewExists(cCubeSource, cViewSource) = 0);
    ViewCreate(cCubeSource, cViewSource);
Endif;

#Scenario
sDim = cDimScenario;
sMDX = '{TM1FilterByLevel({TM1SubsetAll([' | sDim | '])},0)}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Year
sDim = cDimYear;
sMDX = '{TM1FilterByLevel({TM1SubsetAll([' | sDim | '])},0)}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Group
sDim = cDimGroup;
sMDX = '{TM1FilterByLevel({TM1SubsetAll([' | sDim | '])},0)}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Priority
sDim = cDimPriority;
sMDX = '{TM1FilterByLevel({TM1SubsetAll([' | sDim | '])},0)}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Step
sDim = cDimStep; sElementConsolidated = cStepTotal;
sMDX = '{Descendants({[' | sDim | '].[' | sElementConsolidated | ']})}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Line Item
sDim = cDimLineItem; sElementConsolidated = cLineItemTotal;
sMDX = '{Descendants({[' | sDim | '].[' | sElementConsolidated | ']})}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#M Sys Workbench
sDim = cDimMeasure; sElement = cElemMeasure;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#######################################################################################
#
# CLEAR DATA
#
#######################################################################################

sFilter =  cDimMeasure  | cElementStartDelim  ;
sFilter = sFilter | 'Postorder - Scenario' ;
sFilter = sFilter | cElementDelim | 'Postorder - Year' ;
sFilter = sFilter | cElementDelim | 'Postorder - Group' ;
sFilter = sFilter | cElementDelim | 'Postorder - Priority' ;
sFilter = sFilter | cElementDelim | 'Postorder - Step' ;
ExecuteProcess ( '}bedrock.cube.data.clear',
                             'pLogOutput', 0,
                             'pCube', cCubeTarget,
                             'pView', cViewTarget,
                             'pFilter', sFilter,
                             'pFilterParallel', '',
                             'pParallelThreads', 0,
                             'pDimDelim',cDimensionDelim,
                             'pEleStartDelim',cElementStartDelim,
                             'pEleDelim',cElementDelim,
                             'pCubeLogging',0,
                             'pTemp',1
                            );


#######################################################################################
#
# ASSIGN DATA SOURCE
#
#######################################################################################

#nDim = CubeDimensionCountGet(cCubeSource);
nDim = 7 ;
nCount = 1;
While (nCount <= nDim);
    sDim = TabDim (cCubeSource, nCount);
    ViewRowDimensionSet(cCubeSource, cViewSource, sDim, nCount);
    nCount = nCount + 1;
End;

ViewExtractSkipCalcsSet(cCubeSource, cViewSource, 0);
ViewExtractSkipRuleValuesSet(cCubeSource, cViewSource, 0);
ViewExtractSkipZeroesSet(cCubeSource, cViewSource, 1);

DataSourceType = 'VIEW';
DatasourceNameForServer = cCubeSource;
DatasourceNameForClient = cCubeSource;
DatasourceCubeView = cViewSource;


### End Prolog ###
573,26
##############################################################################################################
### CWA Std. Model  version 2.00
### Copyright © 2018, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
#IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1;EndIF;
### Logging - common script 	-----------------  END

### Debug
#sDebugFile = cDebugFile | '_Metadata.debug';

##############################################################################################################
### Metadata script





############################################
### END Metadata


574,76
##############################################################################################################
### CWA Std. Model  version 2.00
### Copyright © 2018, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' ); nDataRecordCount = nDataRecordCount + 1;EndIF;
### Logging - common script 	-----------------  END

### Debug
sDebugFile = cDebugFile | '_Data.log';

##############################################################################################################
### Data script



sTempPreorderScenario = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, vLineItem, cMPreorderScenario ) ;
sTempPreorderYear = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, vLineItem, cMPreorderYear ) ;
sTempPreorderGroup = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, vLineItem, cMPreorderGroup ) ;
sTempPreorderPriority = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, vLineItem, cMPreorderPriority ) ;
sTempPreorderStep = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, vLineItem, cMPreorderStep ) ;

If ( sTempPreorderStep @= '' );
    sTempPreorderStep = cStepTotal;
Endif;


#Find blank Line Item for preorder task
sDim = cDimLineItem;
sMDX = '{ FILTER( {TM1FILTERBYLEVEL( {Descendants( {[' | sDim | '].[' | cLineItemTotal | ']} )}, 0)}, [' | cCubeSource | '].( [' | 
                                                       cDimScenario | '].[' | sTempPreorderScenario | '], [' | 
                                                               cDimYear | '].[' | sTempPreorderYear | '], [' | 
                                                            cDimGroup | '].[' | sTempPreorderGroup | '], [' | 
                                                           cDimPriority | '].[' | sTempPreorderPriority | '], [' | 
                                                               cDimStep | '].[' | sTempPreorderStep | '], [' | 
                                                       cDimMeasure | '].[Postorder Task Name]  ) @= "" ) }' ;
If (SubsetExists(sDim, cSubTemp) <> 0);
    SubsetDestroy(sDim, cSubTemp);
Endif;
SubsetCreatebyMDX(cSubTemp, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSubTemp);

If ( nElements = 0 );
    ItemSkip;
Endif;

sTempLineItem = SubsetGetElementName( cDimLineItem, cSubTemp, 1 );

##################################################
#Update Postorder Tasks

sUpdate01 = vScenario; sMeasure01 = cMPostorderScenario;
sUpdate02 = vYear; sMeasure02 = cMPostorderYear;
sUpdate03 = vGroup; sMeasure03 = cMPostorderGroup;
sUpdate04 = vPriority; sMeasure04 = cMPostorderPriority;
sUpdate05 = vStep; sMeasure05 = cMPostorderStep;
nUpdates = 5;

nCountUpdate = 1;
While ( nCountUpdate <= nUpdates);
    sUpdate = Expand('%sUpdate' | NumberToStringEx(nCountUpdate, '00', '', '') | '%');
    sMeasure = Expand('%sMeasure' | NumberToStringEx(nCountUpdate, '00', '', '') | '%');
    If( CellIsUpdateable( cCubeTarget, sTempPreorderScenario, sTempPreorderYear, sTempPreorderGroup, sTempPreorderPriority, sTempPreorderStep, sTempLineItem, sMeasure ) = 1 );
        CellPutS( sUpdate,  cCubeTarget, sTempPreorderScenario, sTempPreorderYear, sTempPreorderGroup, sTempPreorderPriority, sTempPreorderStep, sTempLineItem, sMeasure );
    Endif;
    nCountUpdate = nCountUpdate + 1;
End;



############################################
### END Data
575,48
##############################################################################################################
### CWA Std. Model  version 2.00
### Copyright © 2018, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Debug
sDebugFile = cDebugFile | '_Epilog.debug';

If (nError <> 0);
    ProcessQuit();
Endif;


##############################################################################################################
### Epilog script




############################################
### END Epilog

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
### ( Place as last code block on epilog )
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
