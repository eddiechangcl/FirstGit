601,100
602,"Sys.Versioning.Caller"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"u^OUP2HxL=mR\bwuZvK^EaX]6N]Ix[F=bFXB2D8fP[zCp\Ejsb_E5O`6e6JHMR5BSDjEaN<?YQHhTs>UamomErPJWxdygkAt6rxrT@4ESr_5NRHq4OE5PkT\?W@yGvxVpfLT^7ERXklvm\AH8;<f^DGq6sK4qWQS>79Erl4kX9Riew]uAZROJd^<`m:MgZg6ajWq]=_m"
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
560,12
pDoProcessLogging
pDebug
pModule
pScenarioFrom
pScenarioTo
pVersionFrom
pVersionTo
pYearFrom
pYearTo
pEntity
pCostCenter
pComment
561,12
2
2
2
2
2
2
2
2
2
2
2
2
590,12
pDoProcessLogging,"1"
pDebug,"0"
pModule,""
pScenarioFrom,""
pScenarioTo,""
pVersionFrom,"WIP"
pVersionTo,""
pYearFrom,""
pYearTo,""
pEntity,""
pCostCenter,""
pComment,""
637,12
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pModule,"Module:"
pScenarioFrom,"Scenario From:"
pScenarioTo,"Scenario To:"
pVersionFrom,"Version From:"
pVersionTo,"Version To:"
pYearFrom,"Year From:"
pYearTo,"Year To:"
pEntity,"Entity: (Optional, blank = All)"
pCostCenter,"Cost Center: (Optional, blank = All)"
pComment,"Comment: (Optional)"
577,2
vCube
V2
578,2
2
2
579,2
1
2
580,2
0
0
581,2
0
0
582,2
VarType=32ColType=827
VarType=32ColType=827
603,0
572,209
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


cCubeDefinition = 'Sys Versioning Cube';

cDimSource = '}Cubes';
cDimModule = 'Sys Versioning Log';
cDimScenario = 'Scenario';
cDimYear = 'Year';
cDimEntity = 'Entity';
cDimCostCenter = 'Cost Center';
cDimVersion = 'Version';

cModule = pModule;
cScenarioSource = pScenarioFrom;
cScenarioTarget = pScenarioTo;
cVersionSource = pVersionFrom;
cVersionTarget = pVersionTo;
cYearSource = pYearFrom;
cYearTarget = pYearTo;
cEntity = pEntity;
cCostCenter = pCostCenter;
cComment = pComment;


#######################################################################################
#
# VALIDATION
#
#######################################################################################

#Validate both Empty and Invalid
sValidation001 = cModule; sDimValidation001 = cDimModule; sEmptyError001 = 'Module cannot be empty.'; sInvalidError001 = 'Invalid Module: ' | cModule;
sValidation002 = cScenarioSource; sDimValidation002 = cDimScenario; sEmptyError002 = 'Source Scenario cannot be empty.'; sInvalidError002 = 'Invalid Source Scenario: ' | cScenarioSource;
sValidation003 = cScenarioTarget; sDimValidation003 = cDimScenario; sEmptyError003 = 'Target Scenario cannot be empty.'; sInvalidError003 = 'Invalid Target Scenario: ' | cScenarioTarget;
sValidation004 = cVersionSource; sDimValidation004 = cDimVersion; sEmptyError004 = 'Source Version cannot be empty.'; sInvalidError004 = 'Invalid Source Version: ' | cVersionSource;
sValidation005 = cVersionTarget; sDimValidation005 = cDimVersion; sEmptyError005 = 'Target Version cannot be empty.'; sInvalidError005 = 'Invalid Target Version: ' | cVersionTarget;
sValidation006 = cYearSource; sDimValidation006 = cDimYear; sEmptyError006 = 'Source Year cannot be empty.'; sInvalidError006 = 'Invalid Source Year: ' | cYearSource;
sValidation007 = cYearTarget; sDimValidation007 = cDimYear; sEmptyError007 = 'Target Year cannot be empty.'; sInvalidError007 = 'Invalid Target Year: ' | cYearTarget;
nValidations = 7;

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

If (nError <> 0);
    ProcessBreak();
Endif;

#Validate only if not empty
sValidation001 = cEntity; sDimValidation001 = cDimEntity; sInvalidError001 = 'Invalid Entity: ' | cEntity;
sValidation002 = cCostCenter; sDimValidation002 = cDimCostCenter; sInvalidError002 = 'Invalid Cost Center: ' | cCostCenter;
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

If (nError <> 0);
    ProcessBreak();
Endif;

#######################################################################################
#
# PREPARE DATA SOURCE
#
#######################################################################################

#Define Temporary Object Name, and Check if the view already exists
cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
While (SubsetExists(cDimSource, cTempName) <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;
cSub = cTempName;

sProcess = 'Bedrock.Dim.Sub.Create';
sParam1Name = 'pDimension';
sParam1Value = cDimSource;
sParam2Name = 'pSubset';
sParam2Value = cSub;
sParam3Name = 'pConsol';
sParam3Value = '';
nParam4Name = 'pLevelFrom';
nParam4Value = 0;
nParam5Name = 'pLevelTo';
nParam5Value = 0;
ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                           sParam3Name, sParam3Value, nParam4Name, nParam4Value,
                                           nParam5Name, nParam5Value);

DatasourceNameForServer = cDimSource;
DatasourceNameForClient = cDimSource;
DatasourceType='SUBSET';
DatasourceCubeView = cSub;
573,24
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
#
##############################################################################################################
### Metadata script


############################################
### END Data






574,96
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





#######################################################################################
#
# VERSIONING
# 1. Do not snapshot Control Objects
# 2. Only snapshot cubes that belongs to the specific module, mapping in "Sys Definition Version Control" cube
#
#######################################################################################

If (SubSt(vCube, 1, 1) @= '}');
    ItemSkip;
Endif;

If (CellGetS(cCubeDefinition, cScenarioSource, cVersionSource, cYearSource, cModule, vCube, 'REQUIRE VERSIONING') @<> '√');
    ItemSkip;
Endif;

sProcess = 'Sys.Versioning';
sParam1Name = 'pCube';
sParam1Value = vCube;
sParam2Name = 'pScenarioFrom';
sParam2Value = cScenarioSource;
sParam3Name = 'pScenarioTo';
sParam3Value = cScenarioTarget;
sParam4Name = 'pVersionFrom';
sParam4Value = cVersionSource;
sParam5Name = 'pVersionTo';
sParam5Value = cVersionTarget;
sParam6Name = 'pYearFrom';
sParam6Value = cYearSource;
sParam7Name = 'pYearTo';
sParam7Value = cYearTarget;
sParam8Name = 'pEntity';
sParam8Value = cEntity;
sParam9Name = 'pCostCenter';
sParam9Value = cCostCenter;
ExecuteProcess (sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                            sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                            sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                            sParam7Name, sParam7Value, sParam8Name, sParam8Value,
                                            sParam9Name, sParam9Value);

sProcess = 'Sys.Versioning.Cube.String Only';
sParam1Name = 'pCube';
sParam1Value = vCube;
sParam2Name = 'pScenarioFrom';
sParam2Value = cScenarioSource;
sParam3Name = 'pScenarioTo';
sParam3Value = cScenarioTarget;
sParam4Name = 'pVersionFrom';
sParam4Value = cVersionSource;
sParam5Name = 'pVersionTo';
sParam5Value = cVersionTarget;
sParam6Name = 'pFinancialYearFrom';
sParam6Value = cYearSource;
sParam7Name = 'pFinancialYearTo';
sParam7Value = cYearTarget;
sParam8Name = 'pEntity';
sParam8Value = cEntity;
sParam9Name = 'pCostCenter';
sParam9Value = cCostCenter;
ExecuteProcess (sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                            sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                            sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                            sParam7Name, sParam7Value, sParam8Name, sParam8Value,
                                            sParam9Name, sParam9Value);
                                            



##############################################################################################################
### END Data script






575,77
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



######################
### Log Version Control

sProcess = 'Sys.Versioning.Log.Update';
sParam1Name = 'pDoProcessLogging';
sParam1Value = pDoProcessLogging;
sParam2Name = 'pScenario';
sParam2Value = cScenarioTarget;
sParam3Name = 'pVersionTarget';
sParam3Value = cVersionTarget;
sParam4Name = 'pYear';
sParam4Value = cYearTarget;
sParam5Name = 'pModule';
sParam5Value = cModule;
sParam6Name = 'pComment';
sParam6Value = cComment;
sParam7Name = 'pClientExecute';
sParam7Value = '';
ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                           sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                           sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                           sParam7Name, sParam7Value);


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
