601,100
602,"Sys.Workflow.WF_.Update Disable Cooling"
562,"SUBSET"
586,"MCC"
585,"MCC"
564,
565,"ogJy@=QV5]dW4Gya\vmTb8IB_BaM?=CGTA_iV[da@4AO?Cj5_K[rZq;SZ<W;aKwCXY6vDv_E5R1VjProM1zVRNpsPmQCrBp0OC]MpEemIR3tyT[CV\eJV?qB?06A31zpgospDb10ADvvzij5YMN\8QG1zgWyL<3xQ0?e2\UIa1e_M_V7EEqs_6N>gDjfg1vDh9M30wNf"
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
570,
571,All
569,0
592,0
599,1000
560,7
pDoProcessLogging
pDebug
pScenario
pYear
pWorkflow
pNode
pDisableCooling
561,7
2
2
2
2
2
2
2
590,7
pDoProcessLogging,"1"
pDebug,"0"
pScenario,"Q1M1"
pYear,"2016"
pWorkflow,""
pNode,""
pDisableCooling,""
637,7
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pScenario,"Scenario:"
pYear,"Year:"
pWorkflow,"Workflow:"
pNode,"Node: (Optional, blank = All Nodes)Disable Cooling: (Optional, but REQUIRED when Node is specified)"
pDisableCooling,"Disable Cooling: (Optional, but REQUIRED when Node is specified)"
577,1
vWFElement
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
603,0
572,254
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


cDimClient = '}Clients';
cDimScenario = 'Scenario';
cDimVersion = 'Version';
cDimYear = 'Year';
cDimWorkflow = 'Sys Workflow';
cDimLineItem = 'Line Item';
cDimMeasure = 'M Workflow';

cScenario = pScenario;
cYear = pYear;
cWorkflow = pWorkflow;
cNode = pNode;
cDisableCoolingUpdate = pDisableCooling;

cVersionWIP = 'WIP';
cLineItemInput = 'INPUT LINE';
cDisableCooling = 'Disable Cooling';
cDisableCoolingSaved = 'Saved Disable Cooling';
cLastDisableCoolingUpdated = 'Last Disable Cooling Updated';
cLastDisableCoolingUpdatedBy = 'Last Disable Cooling Updated By';

cCube = cWorkflow;

sNow = TimSt( Now, '\Y-\m-\d \h:\i:\s' );
sClient = TM1User();
If (DimIx(cDimClient, sClient) <> 0);
    sClientDescription = AttrS(cDimClient, sClient, '}TM1_DefaultDisplayValue');
    sClient = If (sClientDescription @<> '', sClientDescription, sClient);
Endif;

nLineItemMax = 500;
nMeasures = DimSiz(cDimMeasure);

nError = 0;
sErrorString = '';

#######################################################################################
#
# VALIDATION
#
#######################################################################################

#Validate both Empty and Invalid
sValidation001 = cScenario; sDimValidation001 = cDimScenario; sEmptyError001 = 'Scenario cannot be empty.'; sInvalidError001 = 'Invalid Scenario: ' | cScenario;
sValidation002 = cYear; sDimValidation002 = cDimYear; sEmptyError002 = 'Year cannot be empty.'; sInvalidError002 = 'Invalid Year: ' | cYear;
sValidation003 = cWorkflow; sDimValidation003 = '}Cubes'; sEmptyError003 = 'Workflow cannot be empty.'; sInvalidError003 = 'Invalid Workflow: ' | cWorkflow;
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

cDimPlanningUnit = AttrS(cDimWorkflow, cWorkflow, 'Planning Unit Dimension');
cDimSource = cDimPlanningUnit;


#Validate only if not empty
sValidation001 = cNode; sDimValidation001 = cDimPlanningUnit; sInvalidError001 = 'Invalid Workflow Node: ' | cNode;
nValidations = 1;

nCountValidation = 1;
While (nCountValidation <= nValidations);
     sValidation = Expand('%sValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sDimValidation = Expand('%sDimValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sInvalidError = Expand('%sInvalidError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');

    If (sValidation @<> '');
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
# PREPARE DATA SOURCE
#
#######################################################################################

#Define Temporary Object Name, and Check if the view already exists
cTempName = '}TI_' | cProcessName | '_' | cScenario | '_' | cYear | '_' | cNode | '_' |  NumberToString(Int(Rand() * 10000));
While (SubsetExists(cDimSource, cTempName) <> 0);
    cTempName = '}TI_' | cProcessName | '_' | cScenario | '_' | cYear | '_' | cNode | '_' | NumberToString(Int(Rand() * 10000));
End;
cSub = cTempName;

#Planning Unit
sDim = cDimPlanningUnit;
If (cNode @= '');
    sMDX = '{Order({Filter({TM1SubsetAll([' | sDim | '])}, 
                        [' | cCube | '].([' | cDimScenario | '].[' | cScenario | '], [' | cDimVersion | '].[' | cVersionWIP | '], [' | cDimYear | '].[' | cYear | '], [' | cDimLineItem | '].[' | cLineItemInput | '], [' | cDimMeasure | '].[' | cDisableCooling | ']) @<> 
                        [' | cCube | '].([' | cDimScenario | '].[' | cScenario | '], [' | cDimVersion | '].[' | cVersionWIP | '], [' | cDimYear | '].[' | cYear | '], [' | cDimLineItem | '].[' | cLineItemInput | '], [' | cDimMeasure | '].[' | cDisableCoolingSaved | ']))},
                        [' | sDim | '].CurrentMember.Level.Ordinal, BDESC)}';
Else;
    sMDX = '{[' | sDim | '].[' | cNode | ']}';
Endif;
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
If (nElements = 0);
    ProcessBreak();
Endif;
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);

#######################################################################################
#
# ASSIGN DATA SOURCE
#
#######################################################################################

DatasourceNameForServer = cDimSource;
DatasourceNameForClient = cDimSource;
DataSourceType = 'SUBSET';
DataSourceDimensionSubset = cSub;

#######################################################################################
#
# PREPARE SUBSETS TO BE USED IN DATA TAB
# 1. It needs to be in order based on the element level in ascending order
# 2. CurrentMember.Level.Order is reversed to TM1 element level, therefore BDESC
# 3. The subset element ordering will help us to mimic the "aggregation" of DisableCooling
#
#######################################################################################
sMDX = '{Order({TM1SubsetAll([' | cDimSource | '])}, [' | cDimSource | '].CurrentMember.Level.Ordinal, BDESC)}';
If (SubsetExists(sDim, cSub | '_FullList') <> 0);
    SubsetDestroy(sDim, cSub | '_FullList');
Endif;
SubsetCreatebyMDX(cSub | '_FullList', sMDX, sDim, 1);
nElements = SubsetGetSize(sDim, cSub | '_FullList');
sLastElement = SubsetGetElementName(sDim, cSub | '_FullList', nElements);
SubsetElementDelete(sDim, cSub | '_FullList', nElements);
SubsetElementInsert(sDim, cSub | '_FullList', sLastElement, nElements);
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


574,183
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

##############################################################################
#
# GET THE DISABLE COOLING TO BE UPDATE OR UPDATE THE DISABLE COOLING WHEN NODE IS PROVIDED
#
##############################################################################
sDisableCoolingUpdate = CellGetS(cCube, cScenario, cVersionWIP, cYear, vWFElement, cLineItemInput, cDisableCooling);
If (cNode @<> '');
    sDisableCoolingUpdate = cDisableCoolingUpdate;
    CellPutS(sDisableCoolingUpdate, cCube, cScenario, cVersionWIP, cYear, vWFElement, cLineItemInput, cDisableCooling);
Endif;

##############################################################################
#
# UPDATE SAVED DISABLE COOLING
#
##############################################################################
CellPutS(sDisableCoolingUpdate, cCube, cScenario, cVersionWIP, cYear, vWFElement, cLineItemInput, cDisableCoolingSaved);

CellPutS(sNow, cCube, cScenario, cVersionWIP, cYear, vWFElement, cLineItemInput, cLastDisableCoolingUpdated);
CellPutS(sClient, cCube, cScenario, cVersionWIP, cYear, vWFElement, cLineItemInput, cLastDisableCoolingUpdatedBy);

nLineItem = 1;
While (nLineItem <= nLineItemMax);
    sLineItem = NumberToStringEx(nLineItem, '0000', '', '');
    sLineDisableCooling = CellGetS(cCube, cScenario, cVersionWIP, cYear, vWFElement, sLineItem, cDisableCoolingSaved);
    If (sLineDisableCooling @= '');
        nCountMeasure = 1;
        While (nCountMeasure <= nMeasures);
            sMeasure = DimNM(cDimMeasure, nCountMeasure);
            sValue = CellGetS(cCube, cScenario, cVersionWIP, cYear, vWFElement, cLineItemInput, sMeasure);
            CellPutS(sValue, cCube, cScenario, cVersionWIP, cYear, vWFElement, sLineItem, sMeasure);
            nCountMeasure = nCountMeasure + 1;
        End;
        nLineItem = nLineItemMax;
    Endif;
    nLineItem = nLineItem + 1;
End;

##############################################################################
#
# UPDATE CHILDREN ELEMENTS WHEN THE ELEMENT TO UPDATE IS C LEVEL
#
##############################################################################
nLevelWFElement = ElLev(cDimSource, vWFElement);
If (nLevelWFElement <> 0);
    If (SubsetExists(cDimSource, cSub | '_02') = 0);
        SubsetCreate(cDimSource, cSub | '_02');
    Endif;
    sMDX = '{Descendants({[' | cDimSource | '].[' | vWFElement | ']})}';
    SubsetMDXSet( cDimSource, cSub | '_02', sMDX); 
    SubsetMDXSet( cDimSource, cSub | '_02', ''); 
    nChildrenElements = SubsetGetSize(cDimSource, cSub | '_02');
    nCountChild = 1;
    While (nCountChild <= nChildrenElements);
        sChildElement = SubsetGetElementName(cDimSource, cSub | '_02', nCountChild);
        CellPutS(sDisableCoolingUpdate, cCube, cScenario, cVersionWIP, cYear, sChildElement, cLineItemInput, cDisableCooling);
        CellPutS(sDisableCoolingUpdate, cCube, cScenario, cVersionWIP, cYear, sChildElement, cLineItemInput, cDisableCoolingSaved);

        CellPutS(sNow, cCube, cScenario, cVersionWIP, cYear, sChildElement, cLineItemInput, cLastDisableCoolingUpdated);
        CellPutS(sClient, cCube, cScenario, cVersionWIP, cYear, sChildElement, cLineItemInput, cLastDisableCoolingUpdatedBy);

        If (sChildElement @<> vWFElement);
            nLineItem = 1;
            While (nLineItem <= nLineItemMax);
                sLineItem = NumberToStringEx(nLineItem, '0000', '', '');
                sLineDisableCooling = CellGetS(cCube, cScenario, cVersionWIP, cYear, sChildElement, sLineItem, cDisableCoolingSaved);
                If (sLineDisableCooling @= '');
                    nCountMeasure = 1;
                    While (nCountMeasure <= nMeasures);
                        sMeasure = DimNM(cDimMeasure, nCountMeasure);
                        sValue = CellGetS(cCube, cScenario, cVersionWIP, cYear, sChildElement, cLineItemInput, sMeasure);
                        CellPutS(sValue, cCube, cScenario, cVersionWIP, cYear, sChildElement, sLineItem, sMeasure);
                        nCountMeasure = nCountMeasure + 1;
                    End;
                    nLineItem = nLineItemMax;
                Endif;
                nLineItem = nLineItem + 1;
            End;
        Endif;

        nCountChild = nCountChild + 1;
    End;
Endif;

##############################################################################
#
# UPDATE PARENT ELEMENTS WHEN ALL CHILDREN ELEMENTS POPULATED WITH SAME VALUE
# 1. For any incomplete C level element, will be OPEN
# 2. If rejected or blank on a N level element, then the parent level will be OPEN
# 3. If all children submitted, then C level will be SUBMITTED
#
##############################################################################
nCount = 1;
nElements = SubsetGetSize(cDimSource, cSub | '_FullList');
While (nCount <= nElements);
     sElement = SubsetGetElementName(cDimSource, cSub | '_FullList', nCount);
     If (ElisAnc(cDimSource, sElement, vWFElement) <> 0);

         sCurrentDisableCooling = CellGetS(cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cDisableCoolingSaved);
         bParentDisableCoolingUpdated = 0;

         If (sDisableCoolingUpdate @= '✓');
             sMDX = '{Descendants({[' | cDimSource | '].[' | sElement | ']})}';
             If (SubsetExists(sDim, cSub | '_CheckChildren') <> 0);
                 SubsetDestroy(sDim, cSub | '_CheckChildren');
             Endif;
             SubsetCreatebyMDX(cSub | '_CheckChildren', sMDX, sDim, 1);
             nChildrenElements = SubsetGetSize(sDim, cSub | '_CheckChildren');
             sLastElement = SubsetGetElementName(sDim, cSub | '_CheckChildren', nChildrenElements);
             SubsetElementDelete(sDim, cSub | '_CheckChildren', nChildrenElements);
             SubsetElementInsert(sDim, cSub | '_CheckChildren', sLastElement, nChildrenElements);

             sDisableCoolingToUpdate = sDisableCoolingUpdate;
             nChildCount = 1;
             While (nChildCount <= nChildrenElements);
                  sChildElement = SubsetGetElementName(cDimSource, cSub | '_CheckChildren', nChildCount);
                  sChildDisableCoolingSaved = CellGetS(cCube, cScenario, cVersionWIP, cYear, sChildElement, cLineItemInput, cDisableCoolingSaved);
                  If (sChildDisableCoolingSaved @<> sDisableCoolingUpdate & sChildElement @<> sElement);
                      #sDisableCoolingToUpdate = sDisableCoolingOPEN;
                      sDisableCoolingToUpdate = '';
                      nChildCount = nChildrenElements;
                  Endif;
                  nChildCount = nChildCount + 1;
             End;

             If (sDisableCoolingToUpdate @<> sCurrentDisableCooling);
                 CellPutS(sDisableCoolingToUpdate, cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cDisableCooling);
                 CellPutS(sDisableCoolingToUpdate, cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cDisableCoolingSaved);
                 CellPutS(sNow, cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cLastDisableCoolingUpdated);
                 CellPutS(sClient, cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cLastDisableCoolingUpdatedBy);
                 bParentDisableCoolingUpdated = 1;
             Endif;
         Else;
             CellPutS('', cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cDisableCooling);
             CellPutS('', cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cDisableCoolingSaved);
             CellPutS(sNow, cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cLastDisableCoolingUpdated);
             CellPutS(sClient, cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, cLastDisableCoolingUpdatedBy);
             bParentDisableCoolingUpdated = 1;
         Endif;

        If (bParentDisableCoolingUpdated = 1 & sElement @<> vWFElement);
            nLineItem = 1;
            While (nLineItem <= nLineItemMax);
                sLineItem = NumberToStringEx(nLineItem, '0000', '', '');
                sLineDisableCooling = CellGetS(cCube, cScenario, cVersionWIP, cYear, sElement, sLineItem, cDisableCoolingSaved);
                If (sLineDisableCooling @= '');
                    nCountMeasure = 1;
                    While (nCountMeasure <= nMeasures);
                        sMeasure = DimNM(cDimMeasure, nCountMeasure);
                        sValue = CellGetS(cCube, cScenario, cVersionWIP, cYear, sElement, cLineItemInput, sMeasure);
                        CellPutS(sValue, cCube, cScenario, cVersionWIP, cYear, sElement, sLineItem, sMeasure);
                        nCountMeasure = nCountMeasure + 1;
                    End;
                    nLineItem = nLineItemMax;
                Endif;
                nLineItem = nLineItem + 1;
            End;   
        Endif;

     Endif;
     nCount = nCount + 1;
End;



############################################
### END Data

575,63
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
### Clean Up

If (SubsetExists(cDimSource, cSub) <> 0);
    SubsetDestroy(cDimSource, cSub);
Endif;

If (SubsetExists(cDimSource, cSub | '_FullList') <> 0);
    SubsetDestroy(cDimSource, cSub | '_FullList');
Endif;

If (SubsetExists(cDimSource, cSub | '_CheckChildren') <> 0);
    SubsetDestroy(cDimSource, cSub | '_CheckChildren');
Endif;

If (SubsetExists(cDimSource, cSub | '_02') <> 0);
    SubsetDestroy(cDimSource, cSub | '_02');
Endif;






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
