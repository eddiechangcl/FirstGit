601,100
602,"Sys.Workbench.Copy"
562,"VIEW"
586,"Sys Workbench"
585,"Sys Workbench"
564,
565,"mPo8dCczDZ@M>zV7@g9w;z7]>Aj82=zI1Rbb@WErM`HuRX7:@i<eOlbtPZWiALDRFfu@l?kT^ss:ZJEIRH@9?<YPBbtfj>FB3]oX`tpQUTa0mj';ME2fB:jvc:XGrrr^uV@Z>5UwOAIQ;UEy?MXGcuHZrfJUi6v`B=2BRbZ;v8ta\cZiR\]xe3daByPQa[Y1zGCy>[4mPo8dCczDZ@M>tV7@g9w;z7]>Aj82=zy5Rbb@WErM`HuRh<:@i<eOlbtPzQmALTTFfu`g?kT^sc:ZjOIRH@9?<YPBbtaj>FB3]ohgtpQUTa0mjON<ME2fB:jvc:Xw0sr^uY`S>5UwOA9R;UUx?MxDcuHZrfJUi6v`B]3BR2];v8tqXcZiR\]x59daByPQaS92zGCy>[4"
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
560,8
pDoProcessLogging
pDebug
pSourceScenario
pSourceYear
pSourceGroup
pTargetScenario
pTargetYear
pTargetGroup
561,8
2
2
2
2
2
2
2
2
590,8
pDoProcessLogging,"1"
pDebug,"0"
pSourceScenario,"ACT"
pSourceYear,"2017"
pSourceGroup,"GRC Admin"
pTargetScenario,""
pTargetYear,""
pTargetGroup,"GRC Admin"
637,8
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pSourceScenario,"Input Source Scenario:"
pSourceYear,"Input Source Year:"
pSourceGroup,"Input Source Group:"
pTargetScenario,"Input Target Scenario:"
pTargetYear,"Input Target Year:"
pTargetGroup,"Input Target Group:"
577,7
vScenario
vYear
vGroup
vPriority
vStep
vMeasure
vValue
578,7
2
2
2
2
2
2
1
579,7
1
2
3
4
5
6
7
580,7
0
0
0
0
0
0
0
581,7
0
0
0
0
0
0
0
582,7
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
603,0
572,297
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
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
#   2020-03-12  Lingo Wang          Refresh with APQ 3.3 + Bedrock 4
#
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	-----------------  START (CUBEWISE APLIQODE FRAMEWORK)
sThisProcName = GetProcessName();
sProcLogParams = '';
### Params
# If you want to explicitly choose yourself which parameters will be logged then set the sProcLogParams variable like in the example below
# sProcLogParams = Expand('pParam1:%pParam1% & pParam2:%pParam2% & pParam3:%pParam3% & pParamN:%pParamN%');
# If you leave the variable blank per the default value then all parameters will be automatically gathered from the system cube and inserted in the log
### Params
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQProcesses',sThisProcName)=0);ExecuteProcess('}APQ.Dim.ControlDimensionCopies.Update','pDoProcessLogging',pDoProcessLogging,'pClear','0');EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
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
sDebugFile = cDebugFile | '_Prolog.log';

cBedrockTmp     = 1;

nErr = 0;
sErr = '';

##############################################################################################################
### Prolog script commences

NumericGlobalVariable('PrologMinorErrorCount');

nError = 0;
sErrorString = '';

######################
#### Constant 

cCubeSource = 'Sys Workbench' ;
cCubeTarget = 'Sys Workbench' ;

cDimScenario = 'Scenario' ;
cDimYear = 'Year' ;
cDimGroup = 'Sys Workbench Group' ;
cDimPriority = 'Sys Workbench Priority' ;
cDimStep = 'Sys Workbench Step' ;
cDimMeasure = 'M Sys Workbench' ;

cElemSourceScenario = pSourceScenario ;
cElemSourceYear = pSourceYear ;
cElemSourceGroup = pSourceGroup ;


cElemTargetScenario = pTargetScenario ;
cElemTargetYear = pTargetYear ;
cElemTargetGroup = pTargetGroup ;

cElemMeasure = 'Effective Task Flag' ;

cStepTotal = 'All Sys Workbench Steps';

cMTaskName = 'Task Name' ;
cMTaskDesc = 'Task Description' ;
cMPageJumpType = 'Page Jump Type' ;
cMHyperlink = 'Hyperlink' ;
cMApplication = 'Applications' ;
cMApplicationParam = 'Parameters for WEB URL' ;
cMEmailReceivers = 'Email Receivers' ;

cDimensionDelim = CellGetS(cCubParam,'pDimDelim','String');
cElementStartDelim = CellGetS(cCubParam,'pEleStartDelim','String');
cElementDelim = CellGetS(cCubParam,'pEleDelim','String');

#######################################################################################
#
# VALIDATION
#
#######################################################################################

#Validate both Empty and Invalid
sValidation001 = cElemSourceScenario; sDimValidation001 = cDimScenario; sEmptyError001 = 'Source Scenario cannot be empty.'; sInvalidError001 = 'Invalid Source Scenario: ' | cElemSourceScenario;
sValidation002 = cElemTargetScenario; sDimValidation002 = cDimScenario; sEmptyError002 = 'Target Scenario cannot be empty.'; sInvalidError002 = 'Invalid Target Scenario: ' | cElemTargetScenario;
sValidation003 = cElemSourceYear; sDimValidation003 = cDimYear; sEmptyError003 = 'Source Year cannot be empty.'; sInvalidError003 = 'Invalid Source Year: ' | cElemSourceYear;
sValidation004 = cElemTargetYear; sDimValidation004 = cDimYear; sEmptyError004 = 'Target Year cannot be empty.'; sInvalidError004 = 'Invalid Target Year: ' | cElemTargetYear;
sValidation005 = cElemSourceGroup; sDimValidation005 = cDimGroup; sEmptyError005 = 'Source Group cannot be empty.'; sInvalidError005 = 'Invalid Source Group: ' | cElemSourceGroup;
sValidation006 = cElemTargetGroup; sDimValidation006 = cDimGroup; sEmptyError006 = 'Target Group cannot be empty.'; sInvalidError006 = 'Invalid Target Group: ' | cElemTargetGroup;
nValidations = 6;

nCountValidation = 1;
While (nCountValidation <= nValidations);
     sValidation = Expand('%sValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sDimValidation = Expand('%sDimValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sEmptyError = Expand('%sEmptyError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sInvalidError = Expand('%sInvalidError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');

    If (sValidation @= '');
        sError = sEmptyError;
        AsciiOutput(sDebugFile, sError);
        If (sErrorString @<> '');
            sErrorString = sErrorString | Char(10) | Char(13);
        Endif;
        sErrorString = sErrorString | sError;
        nError = 1;
    Else;
        If (DimIx(sDimValidation, sValidation) = 0);
             sError = sInvalidError;
            AsciiOutput(sDebugFile, sError);
            If (sErrorString @<> '');
                sErrorString = sErrorString | Char(10) | Char(13);
            Endif;
            sErrorString = sErrorString | sError;
            nError = 1;
        Endif;
    Endif;

     nCountValidation = nCountValidation + 1;
End;

If (nError <> 0);
    ProcessBreak();
Endif;

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

If (ViewExists(cCubeSource, cViewSource) = 0);
    ViewCreate(cCubeSource, cViewSource);
Endif;

#Scenario
sDim = cDimScenario; sElement = cElemSourceScenario;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Year
sDim = cDimYear; sElement = cElemSourceYear;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Sys Workbench Group
sDim = cDimGroup; sElement = cElemSourceGroup;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Sys Workbench Priority
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

#Sys Workbench Step
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

sFilter = cDimScenario | cElementStartDelim | cElemTargetScenario;
sFilter = sFilter | cDimensionDelim | cDimYear | cElementStartDelim | cElemTargetYear;
sFilter = sFilter | cDimensionDelim | cDimGroup | cElementStartDelim | cElemTargetGroup;
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
nDim = 6 ;
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
573,22
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
#IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
#sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script




############################################
### END Metadata


574,48
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' ); nDataRecordCount = nDataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_Data.log';

##############################################################################################################
### Data script

sMeasure01 = cMTaskName;
sMeasure02 = cMTaskDesc;
sMeasure03 = cMPageJumpType;
sMeasure04 = cMHyperlink;
sMeasure05 = cMApplication;
sMeasure06 = cMApplicationParam;
sMeasure07 = cMEmailReceivers;
nMeasures = 7;

nCountMeasure = 1;
While (nCountMeasure <= nMeasures);
    sMeasure = Expand('%sMeasure' | NumberToStringEx(nCountMeasure, '00', '', '') | '%');
    sCurrentValue = ''; nCurrentValue = 0;
    If (DType (cDimMeasure, sMeasure) @= 'S');
        sCurrentValue = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, sMeasure ) ;
    Else;
        nCurrentValue = CellGetN( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, sMeasure ) ;
    Endif;
    If ( CellIsUpdateable ( cCubeTarget, cElemTargetScenario, cElemTargetYear, cElemTargetGroup, vPriority, vStep, sMeasure ) = 1 );
         If (DType (cDimMeasure, sMeasure) @= 'S');
             CellPutS(sCurrentValue, cCubeTarget, cElemTargetScenario, cElemTargetYear, cElemTargetGroup, vPriority, vStep, sMeasure);
         Else;
             CellPutN(nCurrentValue, cCubeTarget, cElemTargetScenario, cElemTargetYear, cElemTargetGroup, vPriority, vStep, sMeasure);
         Endif;
    Endif;
    nCountMeasure = nCountMeasure + 1;
End;




############################################
### END Data
575,56
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Debug
sDebugFile = cDebugFile | '_Epilog.log';


###############################################################################################################
### Epilog script



######################
#Copy Task Dependency

ExecuteProcess( 'Sys.Workbench.Task Dependency.Copy',
    'pDoProcessLogging', pDoProcessLogging,
    'pSourceScenario', pSourceScenario,
    'pSourceYear', pSourceYear,
    'pSourceGroup', pSourceGroup,
    'pTargetScenario', pTargetScenario,
    'pTargetYear', pTargetYear,
    'pTargetGroup', pTargetGroup
 );



##############################################################################################################
### END Epilog Script

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
### ( Place as last code block on epilog )
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime=Now();sProcessErrorLogFile=GetProcessErrorFileName;sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessFinishTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessFinishTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessCompletedFlag');
  CellPutN(nMetaDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataRecordCount');CellPutN(nDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataRecordCount');
  CellPutN(PrologMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nPrologMinorErrorCount');CellPutN(MetadataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataMinorErrorCount');
  CellPutN(DataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataMinorErrorCount');CellPutN(ProcessReturnCode,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessReturnCode');
  CellPutS(sProcessErrorLogFile,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sProcessErrorLogFile');nCountTime=nCountTime+1;End;
  If(nDataRecordCount>0);If(cCubTgt@<>'');CellPutN(nProcessFinishTime,sCubLogCube,cCubTgt,'nLastTimeUpdate');CellPutS(sThisProcName,sCubLogCube,cCubTgt,'sProcess');CellPutS(sProcessRunBy,sCubLogCube,cCubTgt,'sProcessRunBy');EndIf;EndIf;
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
