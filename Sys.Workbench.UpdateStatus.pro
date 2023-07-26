601,100
602,"Sys.Workbench.UpdateStatus"
562,"VIEW"
586,"Sys Workbench"
585,"Sys Workbench"
564,
565,"gR_^wtDz<9f5Dif[wE2Vtx[t]DEZTi=|P\@5WX2]\dKV=K>QKo:mhxldPtbW22VBNzIHv;nqq;t:gB[H_hwEPk31S4m{G>_dV;1ZYTvtyVP<8IDGnfT1sqcu6BjFivQC\AN;3992dh6:Xrc=s]m00yX60\012v]r\6B<QOX8uN]K6aMHAtxqUC9@w:;p0nXN?@`R[BNdgR_^wtDz<9f5Dif[wE2Vtx[t]DEZTi=LR\@5WX2]\dKV=K3QKo:mhxldPtIV22fJNzI8x;nqq;d5grVH_hwEPk31S4}qG>_dV;1j_TvtyVP<8IdqhfT1sqcu6BjFIZWC\AJK8992dh6:SrcM|]m`3yX60\012v]r\621QOX3uN]K&oMHAtxqUS2@w:;p0^Rn1@`R[BNdgR_^wtDo<9f5Dif[wE2Vtx[t]DEZTi=<_\@5WX2]\dKV=K=QKo:mhxldPdHP22vENzI8s;nqq;T:gb[H_hwEPk31S4]xG>_dV;1jXTvtyVP<8ItSafT1sqcu6BjFI2]C\qF;8992dh6ZYrcmq]mp?yX60\012v]r\6R1QOx1uN]KVdMHAtxqU32@w:;p0>Rn<@`R[BNd"
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
560,9
pDoProcessLogging
pDebug
pScenario
pYear
pGroup
pPriority
pStep
pUpdateStatus
pEmailContent
561,9
2
2
2
2
2
2
2
2
2
590,9
pDoProcessLogging,"1"
pDebug,"0"
pScenario,"EA1"
pYear,"2017"
pGroup,"GRC Admin"
pPriority,""
pStep,""
pUpdateStatus,""
pEmailContent,""
637,9
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pScenario,"Input Scenario:"
pYear,"Input Year:"
pGroup,"Input Group:"
pPriority,"(Option)Input Priority:"
pStep,"(Option)Input Step:"
pUpdateStatus,"(Option)Input Update Status: BLANK, ""Completed"", ""Un-Completed"""
pEmailContent,""
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
2
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
VarType=32ColType=827
603,0
572,347
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


######################
### Source File
cDate = TimSt(Now(), '\Y\m\d' );
cDate1 = TimSt(Now(), '\Y\m\d' );

NumericGlobalVariable('PrologMinorErrorCount');

######################
#### Constant 

cCubeSource = 'Sys Workbench' ;
cCubeTarget = 'Sys Workbench' ;

cDimScenario = 'Scenario' ;
cDimYear = 'Year' ;
cDimGroup = 'Sys Workbench Group' ;
cDimPriority = 'Sys Workbench Priority' ;
cDimStep = 'Sys Workbench Step' ;
cDimLineItem = 'Line Item' ;
cDimMeasure = 'M Sys Workbench' ;
cDimRefMeasure = 'M Sys Workbench Task Dependency' ;

cElemScenario = pScenario ;
cElemYear = pYear ;
cElemGroup = pGroup ;
cElemPriority = pPriority ;
cElemStep = pStep ;
cUpdateStatus = pUpdateStatus ;

cEmailContent = pEmailContent ;

cElemMeasure = 'Effective Task Flag' ;

cRefCube = 'Sys Workbench Task Dependency' ;

cCOMPLETESTATUS = 'Completed' ;
cUNCOMPLETESTATUS = 'Un-Completed' ;

sTempMSELECTIONFLAG = 'TASK COMPLETE SELECTION' ;
sTempMUPDATEDSTATUS = 'TASK LATEST UPDATED STATUS' ;
sTempMUPDATEDBY = 'TASK LATEST UPDATED BY' ;
sTempMUPDATEDTIME = 'TASK LATEST UPDATED TIME' ;

cMPostorderScenario = 'Postorder - Scenario' ;
cMPostorderYear = 'Postorder - Year' ;
cMPostorderGroup = 'Postorder - Group' ;
cMPostorderPriority = 'Postorder - Priority' ;
cMPostorderStep = 'Postorder - Step' ;
cMEmailReceivers = 'Email Receivers' ;

cMTaskName = 'Task Name' ;
cMTaskDescription = 'Task Description' ;

cStepTotal = 'All Sys Workbench Steps';
cLineItemTotal = 'All Line Items';

sParam1='pDoProcessLogging';sParamValue1=1;
sParam2='pScenario';sParamValue2='';
sParam3='pYear';sParamValue3='';
sParam4='pGroup';sParamValue4='';
sParam5='pPriority';sParamValue5='';
sParam6='pStep';sParamValue6='';
sParam7='pUpdateStatus';sParamValue7='';
sParam8='pEmailContent' ;sParamValue8='' ;

#######################################################################################
#
# VALIDATION
#
#######################################################################################

#Validate both Empty and Invalid
sValidation001 = cElemScenario; sDimValidation001 = cDimScenario; sEmptyError001 = 'Scenario cannot be empty.'; sInvalidError001 = 'Invalid Scenario: ' | cElemScenario;
sValidation002 = cElemYear; sDimValidation002 = cDimYear; sEmptyError002 = 'Year cannot be empty.'; sInvalidError002 = 'Invalid Year: ' | cElemYear;
sValidation003 = cElemGroup; sDimValidation003 = cDimGroup; sEmptyError003 = 'Sys Workbench Group cannot be empty.'; sInvalidError003 = 'Invalid Sys Workbench Group: ' | cElemGroup;
sValidation004 = cElemPriority; sDimValidation004 = cDimPriority; sEmptyError004 = 'Sys Workbench Priority cannot be empty.'; sInvalidError004 = 'Invalid Sys Workbench Priority: ' | cElemPriority;
sValidation005 = cElemStep; sDimValidation005 = cDimStep; sEmptyError005 = 'Sys Workbench Step cannot be empty.'; sInvalidError005 = 'Invalid Sys Workbench Step: ' | cElemStep;
nValidations = 3;

nCountValidation = 1;
While (nCountValidation <= nValidations);
     sValidation = Expand('%sValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sDimValidation = Expand('%sDimValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sEmptyError = Expand('%sEmptyError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sInvalidError = Expand('%sInvalidError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');

    If (sValidation @= '');
        sError = sEmptyError;
        AsciiOutput(sDebugFile, sError);
        If (sErr @<> '');
            sErr = sErr | Char(10) | Char(13);
        Endif;
        sErr = sErr | sError;
        nError = 1;
    Else;
        If (DimIx(sDimValidation, sValidation) = 0);
             sError = sInvalidError;
            AsciiOutput(sDebugFile, sError);
            If (sErr @<> '');
                sErr = sErr | Char(10) | Char(13);
            Endif;
            sErr = sErr | sError;
            nError = 1;
        Endif;
    Endif;

     nCountValidation = nCountValidation + 1;
End;


##Workbench Priority and Step Validation can be empty
sValidation001 = cElemPriority; sDimValidation001 = cDimPriority;sInvalidError001 = 'Invalid Sys Workbench Priority: ' | cElemPriority;
sValidation002 = cElemStep; sDimValidation002 = cDimStep; sInvalidError002 = 'Invalid Sys Workbench Step: ' | cElemStep;
nValidations = 2;

nCountValidation = 1;
While (nCountValidation <= nValidations);
     sValidation = Expand('%sValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sDimValidation = Expand('%sDimValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sInvalidError = Expand('%sInvalidError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');

    If (sValidation @<> '');
        If (DimIx(sDimValidation, sValidation) = 0);
             sError = sInvalidError;
            AsciiOutput(sDebugFile, sError);
            If (sErr @<> '');
                sErr = sErr | Char(10) | Char(13);
            Endif;
            sErr = sErr | sError;
            nError = 1;
        Endif;
    Endif;

     nCountValidation = nCountValidation + 1;
End;


#Update Status
IF( cUpdateStatus @<> '' & cUpdateStatus @<> cCOMPLETESTATUS & cUpdateStatus @<> cUNCOMPLETESTATUS );
    sError = 'Invalid Update Status:' | cUpdateStatus ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
ENDIF ;

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
cSubTemp = cTempName | '_Temp';

If (ViewExists(cCubeSource, cViewSource) = 0);
    ViewCreate(cCubeSource, cViewSource);
Endif;

#Subsets

#Scenario
sDim = cDimScenario; sElement = cElemScenario;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Year
sDim = cDimYear; sElement = cElemYear;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Sys Workbench Group
sDim = cDimGroup; sElement = cElemGroup;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Sys Workbench Priority
sDim = cDimPriority;
sMDX = '{TM1FilterByLevel({TM1SubsetAll([' | sDim | '])},0)}';
IF( cElemPriority @<> '' );
    sMDX = '{ [' | sDim | '].[' | cElemPriority | '] }' ;
ENDIF;
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
sMDX = '{ {TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | sDim | '] )}, 0)}, {[' | sDim | '].[' | cStepTotal | ']} }' ;
IF( cElemStep @<> '' );
    sMDX = '{ [' | sDim | '].[' | cElemStep | '] }' ;
ENDIF;
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


################################


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


574,328
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


sTempCompleteSelection = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, sTempMSELECTIONFLAG );
sTempLatestStatus = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDSTATUS );

sTempTaskFullName =  CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, cMTaskName ) |  CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, cMTaskDescription ) ;

sTempTargetStatus = '' ;

nTempSendEmail = 0 ;
sTempEmailContent = '';

######################################
#Determine Target Status to update

IF( cUpdateStatus @= '' );
        #Completed
        IF( sTempCompleteSelection @<> '' );
            IF( sTempLatestStatus @<> cCOMPLETESTATUS );
                sTempTargetStatus = cCOMPLETESTATUS ;
            ENDIF;
        ELSE ;
        #Un-Completed
            IF( sTempLatestStatus @<> cUNCOMPLETESTATUS );
                sTempTargetStatus = cUNCOMPLETESTATUS ;
            ENDIF;            
        ENDIF ;    
ELSEIF( cUpdateStatus @= cCOMPLETESTATUS );
    #NO CODES
        #sTempTargetStatus = cCOMPLETESTATUS ;
ELSEIF( cUpdateStatus @= cUNCOMPLETESTATUS );
      IF( sTempLatestStatus @<> cUNCOMPLETESTATUS );
          sTempTargetStatus = cUNCOMPLETESTATUS ;
      ENDIF;
ENDIF;

IF( sTempTargetStatus @<> '' );
    sTempEmailContent = sTempTaskFullName | ' ( ' | vScenario | ',' | vYear | ',' | vGroup | ',' | vPriority | ',' | vStep | ' ): ' | sTempTargetStatus | '.' ;
    IF( cEmailContent @<> '' );
        sTempEmailContent = cEmailContent ;
    ENDIF;
    nTempSendEmail = 1 ;
ENDIF;


########################################
##########
#Update Direct Postorder Tasks - ONLY UPDATE UNCOMPLETED STATUS


IF( sTempTargetStatus @= cUNCOMPLETESTATUS );

####################################
IF( vStep @<> cStepTotal );

    sTempAllStepsLatestUpdateStatus = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, cStepTotal, sTempMUPDATEDSTATUS );

    IF( sTempAllStepsLatestUpdateStatus @<> sTempTargetStatus );
        sParamValue2 = vScenario ;
        sParamValue3 = vYear ;
        sParamValue4 = vGroup ;
        sParamValue5 = vPriority ;
        sParamValue6 = 'All Sys Workbench Steps' ;
        sParamValue7 = sTempTargetStatus ;
        sParamValue8 = '' ;

        ExecuteProcess( cProcessName,
                sParam1, sParamValue1, 
                sParam2, sParamValue2, 
                sParam3, sParamValue3, 
                sParam4, sParamValue4, 
                sParam5, sParamValue5, 
                sParam6, sParamValue6, 
                sParam7, sParamValue7,
                sParam8, sParamValue8
        );
    ENDIF;

ENDIF;
####################################

    sDim = cDimLineItem;
    sMDX = '{ FILTER( {TM1FILTERBYLEVEL( {TM1DRILLDOWNMEMBER( {[' | sDim | '].[' | cLineItemTotal | ']}, ALL, RECURSIVE )}, 0)}, [' | cRefCube | '].( [' | 
                                                       cDimScenario | '].[' | vScenario | '], [' | 
                                                               cDimYear | '].[' | vYear | '], [' | 
                                                            cDimGroup | '].[' | vGroup | '], [' | 
                                                           cDimPriority | '].[' | vPriority | '], [' | 
                                                               cDimStep | '].[' | vStep | '], [' | 
                                                       cDimRefMeasure | '].[Postorder Task Name]  ) @<> "" ) }' ;

    If (SubsetExists(sDim, cSubTemp) <> 0);
        SubsetDestroy(sDim, cSubTemp);
    Endif;
    SubsetCreatebyMDX(cSubTemp, sMDX, sDim);
    nItemElements = SubsetGetSize(sDim, cSubTemp);
    If (nItemElements > 0);
        sLastElement = SubsetGetElementName(sDim, cSubTemp, nItemElements);
        SubsetElementDelete(sDim, cSubTemp, nItemElements); 
        SubsetElementInsert(sDim, cSubTemp, sLastElement, nItemElements);
    Endif;

    nTempIndex = 1 ;
    WHILE( nTempIndex <= nItemElements );
        sTempLine = SubsetGetElementName( cDimLineItem, cSubTemp, nTempIndex );
        sTemp_PostorderScenario = CellGetS( cRefCube, vScenario, vYear, vGroup, vPriority, vStep, sTempLine, cMPostorderScenario );
        sTemp_PostorderYear = CellGetS( cRefCube, vScenario, vYear, vGroup, vPriority, vStep, sTempLine, cMPostorderYear );
        sTemp_PostorderGroup = CellGetS( cRefCube, vScenario, vYear, vGroup, vPriority, vStep, sTempLine, cMPostorderGroup );
        sTemp_PostorderPriority = CellGetS( cRefCube, vScenario, vYear, vGroup, vPriority, vStep, sTempLine, cMPostorderPriority );
        sTemp_PostorderStep = CellGetS( cRefCube, vScenario, vYear, vGroup, vPriority, vStep, sTempLine, cMPostorderStep );

        IF( sTemp_PostorderStep @= cStepTotal );
           
            sDim = cDimStep;
            sMDX = '{ FILTER( {TM1FILTERBYLEVEL( {TM1DRILLDOWNMEMBER( {[' | sDim | '].[' | cStepTotal | ']}, ALL, RECURSIVE )}, 0)}, [' | cCubeSource | '].( [' | 
                                                    cDimScenario | '].[' | sTemp_PostorderScenario | '], [' | 
                                                            cDimYear | '].[' | sTemp_PostorderYear | '], [' | 
                                                         cDimGroup | '].[' | sTemp_PostorderGroup | '], [' | 
                                                        cDimPriority | '].[' | sTemp_PostorderPriority | '], [' | 
                                                    cDimMeasure | '].[Effective Task Flag]  ) > 0 ) }' ;
            
            If( SubsetExists( cDimStep, cSubTemp ) = 1 );
                SubsetDestroy( cDimStep, cSubTemp );
            Endif;
            SubsetCreateByMDX( cSubTemp, sMDX, sDim );
            nStepElements = SubsetGetSize(sDim, cSubTemp);
            If (nStepElements > 0);
                sLastElement = SubsetGetElementName(sDim, cSubTemp, nStepElements);
                SubsetElementDelete(sDim, cSubTemp, nStepElements); 
                SubsetElementInsert(sDim, cSubTemp, sLastElement, nStepElements);
            Endif;
           
            nTempStepIndex = 1;
            WHILE( nTempStepIndex <= nStepElements );
                sTempStep = SubsetGetElementName( cDimStep, cSubTemp, nTempStepIndex );

                sTEMPSTEPLASTUPDATEDSTATUS = CellGetS( cCubeSource, sTemp_PostorderScenario, sTemp_PostorderYear, sTemp_PostorderGroup, sTemp_PostorderPriority, sTempStep, sTempMUPDATEDSTATUS );

                sParamValue2 = sTemp_PostorderScenario ;
                sParamValue3 = sTemp_PostorderYear ;
                sParamValue4 = sTemp_PostorderGroup ;
                sParamValue5 = sTemp_PostorderPriority ;
                sParamValue6 = sTempStep ;
                sParamValue7 = sTempTargetStatus ;
                sParamValue8 = CellGetS( cCubeSource, sTemp_PostorderScenario, sTemp_PostorderYear, sTemp_PostorderGroup, sTemp_PostorderPriority, sTempStep, cMTaskName ) |  
                                           CellGetS( cCubeSource, sTemp_PostorderScenario, sTemp_PostorderYear, sTemp_PostorderGroup, sTemp_PostorderPriority, sTempStep, cMTaskDescription ) | 
                                           ' ( ' | sTemp_PostorderScenario | ',' | sTemp_PostorderYear | ',' | sTemp_PostorderGroup | ',' | sTemp_PostorderPriority | ',' | sTempStep | ' )  un-completed by preorder task: ' |  Char(10) | sTempTaskFullName | ' ( ' | vScenario | ',' | vYear | ',' | vGroup | ',' | vPriority | ',' | vStep | ' )' ;

                IF( sTempTargetStatus @<> sTEMPSTEPLASTUPDATEDSTATUS ) ;
                    ExecuteProcess( cProcessName,
                            sParam1, sParamValue1, 
                            sParam2, sParamValue2, 
                            sParam3, sParamValue3, 
                            sParam4, sParamValue4, 
                            sParam5, sParamValue5, 
                            sParam6, sParamValue6, 
                            sParam7, sParamValue7,
                            sParam8, sParamValue8
                    );
                ENDIF;

                nTempStepIndex = nTempStepIndex + 1 ;
            END;

        ENDIF;

        sParamValue2 = sTemp_PostorderScenario ;
        sParamValue3 = sTemp_PostorderYear ;
        sParamValue4 = sTemp_PostorderGroup ;
        sParamValue5 = sTemp_PostorderPriority ;
        sParamValue6 = sTemp_PostorderStep ;
        sParamValue7 = sTempTargetStatus ;
        sParamValue8 = CellGetS( cCubeSource, sTemp_PostorderScenario, sTemp_PostorderYear, sTemp_PostorderGroup, sTemp_PostorderPriority, sTemp_PostorderStep, cMTaskName ) |  
                                   CellGetS( cCubeSource, sTemp_PostorderScenario, sTemp_PostorderYear, sTemp_PostorderGroup, sTemp_PostorderPriority, sTemp_PostorderStep, cMTaskDescription ) | 
                                           ' ( ' | sTemp_PostorderScenario | ',' | sTemp_PostorderYear | ',' | sTemp_PostorderGroup | ',' | sTemp_PostorderPriority | ',' | sTemp_PostorderStep | ' )  un-completed by preorder task: ' |  Char(10) |  sTempTaskFullName | ' ( ' | vScenario | ',' | vYear | ',' | vGroup | ',' | vPriority | ',' | vStep | ' )' ;

         sTEMPSTEPLASTUPDATEDSTATUS = CellGetS( cCubeSource, sTemp_PostorderScenario, sTemp_PostorderYear, sTemp_PostorderGroup, sTemp_PostorderPriority, sTemp_PostorderStep, sTempMUPDATEDSTATUS );

         IF( sTempTargetStatus @<> sTEMPSTEPLASTUPDATEDSTATUS ) ;
            ExecuteProcess( cProcessName,
                sParam1, sParamValue1, 
                sParam2, sParamValue2, 
                sParam3, sParamValue3, 
                sParam4, sParamValue4, 
                sParam5, sParamValue5, 
                sParam6, sParamValue6, 
                sParam7, sParamValue7,
                sParam8, sParamValue8
            );
        ENDIF;
        
        nTempIndex = nTempIndex + 1 ;
    END;

ENDIF;


######################################


######################################
#Update Current Task 

sTempCompleteSelection = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, sTempMSELECTIONFLAG );

IF( cUpdateStatus @= '' );
        #Completed
        IF( sTempCompleteSelection @<> '' );
            IF( sTempLatestStatus @<> cCOMPLETESTATUS );
                IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDSTATUS  ) = 1 );
                    CellPutS( cCOMPLETESTATUS,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDSTATUS );
                ENDIF;
                IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDBY  ) = 1 );
                    CellPutS( sProcessRunBy,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDBY );
                ENDIF;
                IF( CellIsUpdateable(  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDTIME  ) = 1 );
                    CellPutS( cDate1,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDTIME );
                ENDIF;
            ENDIF;
        ELSE ;
        #Un-Completed
            IF( sTempLatestStatus @<> cUNCOMPLETESTATUS );
                IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDSTATUS  ) = 1 );
                    CellPutS( cUNCOMPLETESTATUS,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDSTATUS );
                ENDIF;
                IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDBY  ) = 1 );
                    CellPutS( sProcessRunBy, cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDBY );
                ENDIF;
                IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDTIME  ) = 1 );
                    CellPutS( cDate1,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDTIME );
                ENDIF;
            ENDIF;            
        ENDIF ;    
ELSEIF( cUpdateStatus @= cCOMPLETESTATUS );
    #NO CODES
ELSEIF( cUpdateStatus @= cUNCOMPLETESTATUS );
    IF(  sTempLatestStatus @<> cUNCOMPLETESTATUS );
        IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMSELECTIONFLAG  ) = 1 );
            CellPutS( '',  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMSELECTIONFLAG );
        ENDIF;
        IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDSTATUS  ) = 1 );
            CellPutS( cUNCOMPLETESTATUS,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDSTATUS );
        ENDIF;
        IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDBY  ) = 1 );
            CellPutS( sProcessRunBy, cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDBY );
        ENDIF;
        IF( CellIsUpdateable( cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep, sTempMUPDATEDTIME  ) = 1 );
            CellPutS( cDate1,  cCubeTarget, vScenario, vYear, vGroup, vPriority, vStep,  sTempMUPDATEDTIME );
        ENDIF;
    ENDIF;
ENDIF;


####################################################################
#Send Email

IF( nTempSendEmail > 0 & sTempEmailContent @<> '' );
    sTempEmailReceivers = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, vStep, cMEmailReceivers );
    IF( sTempEmailReceivers @<> '' );
               sSubject = sTempTaskFullName | ' Status Change'  ;
               sMessage = sTempEmailContent ;

               ExecuteProcess('Sys.E-mail.Send'
                                          , 'pRecipients' , sTempEmailReceivers
                                          , 'pSubject' , sSubject
                                          , 'pBody' , sMessage
                                          );
    ENDIF;
ENDIF;
###################################################################


######################################################################
#Update All Steps 
IF( vStep @<> cStepTotal );

       sTempAllStepsSelection = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, cStepTotal, sTempMSELECTIONFLAG );
       sTempAllStepsLatestUpdateStatus = CellGetS( cCubeSource, vScenario, vYear, vGroup, vPriority, cStepTotal, sTempMUPDATEDSTATUS );
       IF( sTempAllStepsSelection @<> '' );
         IF( sTempAllStepsLatestUpdateStatus @= cCOMPLETESTATUS );
             ITEMSKIP ;
         ENDIF;
       ELSE;
         IF( sTempAllStepsLatestUpdateStatus @= cUNCOMPLETESTATUS  );
             ITEMSKIP;
         ENDIF;
       ENDIF;

        sParamValue2 = vScenario ;
        sParamValue3 = vYear ;
        sParamValue4 = vGroup ;
        sParamValue5 = vPriority ;
        sParamValue6 = cStepTotal ;
        sParamValue7 = '' ;
        sParamValue8 = '' ;

        ExecuteProcess( cProcessName,
                sParam1, sParamValue1, 
                sParam2, sParamValue2, 
                sParam3, sParamValue3, 
                sParam4, sParamValue4, 
                sParam5, sParamValue5, 
                sParam6, sParamValue6, 
                sParam7, sParamValue7,
                sParam8, sParamValue8
        );

ENDIF;



############################################
### END Data


575,38
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
