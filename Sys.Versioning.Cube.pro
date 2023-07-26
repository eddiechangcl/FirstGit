601,100
602,"Sys.Versioning.Cube"
562,"VIEW"
586,"Sys Versioning Cube"
585,"Sys Versioning Cube"
564,
565,"kzV6wtZ`SQXaKuG0pW@gRe4bR^C1lh7]5]kbkX0leMqZ7D<tx`d0;br8Uc>Sa;LUhpGlnE2j^XsGCu5uEIz_Y@Dj^m5gYr9hzyh^Nru[Xd@VI]RpOtWey\kykQ>;<H\wH]A5>IhUVuc^j9pyd=:dAc9M?uw5kb5eK0FD[ktsm2QTQ=6zfsR5CCWYsDXclnYa]4LJa@`7"
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
570,Temp
571,
569,0
592,0
599,1000
560,13
pDoProcessLogging
pDebug
pCube
pScenarioFrom
pScenarioTo
pVersionFrom
pVersionTo
pYearFrom
pYearTo
pFilter
pDimensionDelim
pElementStartDelim
pElementDelim
561,13
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
2
590,13
pDoProcessLogging,"1"
pDebug,"0"
pCube,"Sys Definition Cost Center"
pScenarioFrom,"EA1"
pScenarioTo,"EA1"
pVersionFrom,"WIP"
pVersionTo,"WIP"
pYearFrom,"2016/17"
pYearTo,"2016/17"
pFilter,""
pDimensionDelim,"&"
pElementStartDelim,":"
pElementDelim,"+"
637,13
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pCube,"Cube:"
pScenarioFrom,"Scenario From:"
pScenarioTo,"Scenario To:"
pVersionFrom,"Version From:"
pVersionTo,"Version To:"
pYearFrom,"Year From:"
pYearTo,"Year To:"
pFilter,"Filter: Entity: HQ+Region Entities&Cost Center:Controlling"
pDimensionDelim,"Delimiter for start of Dimension/Element set"
pElementStartDelim,"Delimiter for start of element list"
pElementDelim,"Delimiter between elements"
577,29
v1
v2
v3
v4
v5
v6
v7
v8
v9
v10
v11
v12
v13
v14
v15
v16
v17
v18
v19
v20
v21
v22
v23
v24
v25
v26
v27
v28
v29
578,29
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
2
2
2
2
2
579,29
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
580,29
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
581,29
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
582,29
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,374
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

cDimensionDelim = pDimensionDelim;
cElementStartDelim = pElementStartDelim;
cElementDelim = pElementDelim;

cCubeSource = pCube;
cCubeTarget = pCube;

cDimScenario = 'Scenario';
cDimYear = 'Year';
cDimVersion = 'Version';

nDimScenario = 0;
nDimVersion = 0;
nDimYear = 0;

sDimBusiness01 = ''; sDimBusiness02 = ''; sDimBusiness03 = '';
sDimBusiness04 = ''; sDimBusiness05 = ''; sDimBusiness06 = '';
sDimBusiness07 = ''; sDimBusiness08 = ''; sDimBusiness09 = '';

sEleBusiness01 = ''; sEleBusiness02 = ''; sEleBusiness03 = '';
sEleBusiness04 = ''; sEleBusiness05 = ''; sEleBusiness06 = '';
sEleBusiness07 = ''; sEleBusiness08 = ''; sEleBusiness09 = '';

nDimBusiness01 = 0; nDimBusiness02 = 0; nDimBusiness03 = 0;
nDimBusiness04 = 0; nDimBusiness05 = 0; nDimBusiness06 = 0;
nDimBusiness07 = 0; nDimBusiness08 = 0; nDimBusiness09 = 0;

cScenarioSource = pScenarioFrom;
cScenarioTarget = pScenarioTo;
cVersionSource = pVersionFrom;
cVersionTarget = pVersionTo;
cYearSource = pYearFrom;
cYearTarget = pYearTo;
cFilter = pFilter;

#Extract Dimension Name out From Filter
sFilter = Trim(cFilter);
If (sFilter @<> '');
    nDimensionDelim = Scan(cDimensionDelim, sFilter);
    While (nDimensionDelim > 0 & sFilter @<> '');
        sDimElePair = SubSt(sFilter, 1, nDimensionDelim - 1);
        sFilter = Trim(Delet(sFilter, 1, Long(sDimElePair) + 1));
        sDimElePair = Trim(sDimElePair);
        nElementStartDelim = Scan(cElementStartDelim, sDimElePair);
        sDimensionName = Trim(SubSt(sDimElePair, 1, nElementStartDelim - 1));
        sElementList = Trim(SubSt(sDimElePair, nElementStartDelim + 1, Long(sDimElePair) - nElementStartDelim));
        If (sDimBusiness01 @= ''); sDimBusiness01 = sDimensionName;  sEleBusiness01 = sElementList;
        ElseIf (sDimBusiness02 @= ''); sDimBusiness02 = sDimensionName; sEleBusiness02 = sElementList;
        ElseIf (sDimBusiness03 @= ''); sDimBusiness03 = sDimensionName; sEleBusiness03 = sElementList;
        ElseIf (sDimBusiness04 @= ''); sDimBusiness04 = sDimensionName; sEleBusiness04 = sElementList;
        ElseIf (sDimBusiness05 @= ''); sDimBusiness05 = sDimensionName; sEleBusiness05 = sElementList;
        ElseIf (sDimBusiness06 @= ''); sDimBusiness06 = sDimensionName; sEleBusiness06 = sElementList;
        ElseIf (sDimBusiness07 @= ''); sDimBusiness07 = sDimensionName; sEleBusiness07 = sElementList;
        ElseIf (sDimBusiness08 @= ''); sDimBusiness08 = sDimensionName; sEleBusiness08 = sElementList;
        ElseIf (sDimBusiness09 @= ''); sDimBusiness09 = sDimensionName; sEleBusiness09 = sElementList;
        Endif;
        nDimensionDelim = Scan(cDimensionDelim, sFilter);
    End;
Endif;

nDimensionCount = 0;
sDimension = TabDim( cCubeSource, nDimensionCount + 1 );
While( sDimension @<> '' );
  nDimensionCount = nDimensionCount + 1;
  If (sDimension @= cDimScenario);
     nDimScenario = nDimensionCount;
  Endif;
  If (sDimension @= cDimYear);
     nDimYear = nDimensionCount;
  Endif;
  If (sDimBusiness01 @<> '');
     If (sDimension @= sDimBusiness01);
         nDimBusiness01 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness02 @<> '');
     If (sDimension @= sDimBusiness02);
         nDimBusiness02 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness03 @<> '');
     If (sDimension @= sDimBusiness03);
         nDimBusiness03 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness04 @<> '');
     If (sDimension @= sDimBusiness04);
         nDimBusiness04 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness05 @<> '');
     If (sDimension @= sDimBusiness05);
         nDimBusiness05 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness06 @<> '');
     If (sDimension @= sDimBusiness06);
         nDimBusiness06 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness07 @<> '');
     If (sDimension @= sDimBusiness07);
         nDimBusiness07 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness08 @<> '');
     If (sDimension @= sDimBusiness08);
         nDimBusiness08 = nDimensionCount;
     Endif;
  Endif;
  If (sDimBusiness09 @<> '');
     If (sDimension @= sDimBusiness09);
         nDimBusiness09 = nDimensionCount;
     Endif;
  Endif;
  If (sDimension @= cDimVersion);
     nDimVersion = nDimensionCount;
  Endif;
  sDimension = TabDim( cCubeSource, nDimensionCount + 1 );
End;

#Define Temporary Object Name, and Check if the view already exists
cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000)) | cCubeSource;
While (ViewExists(cCubeSource, cTempName | '_Source') <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;
cViewSource = cTempName | '_Source';
cViewTarget = cTempName | '_Target';
cSub = cTempName | '_Source';

nError = 0;
If (nDimScenario = 0);
    AsciiOutput(sDebugFile, 'Scenario dimension is not part of the cube ' | cCubeSource);
    nError = 1;
Endif;

If (nDimVersion = 0);
    AsciiOutput(sDebugFile, 'Version dimension is not part of the cube ' | cCubeSource);
    nError = 1;
Endif;

If (nDimYear = 0);
    AsciiOutput(sDebugFile, 'Financial Year dimension is not part of the cube ' | cCubeSource);
    nError = 1;
Endif;

If (nError = 1);
    ProcessBreak();
Endif;

If (ViewExists(cCubeSource, cViewSource) = 0);
    ViewCreate(cCubeSource, cViewSource);
Endif;

nDim = nDimensionCount;
nCount = 1;
While (nCount <= nDim);
    sDim = TabDim (cCubeSource, nCount);
    sProcess = 'Bedrock.Dim.Sub.Create';
    sParam1Name = 'pDimension';
    sParam1Value = sDim;
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
    ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);
    nCount = nCount + 1;
End;

#Scenario
sDim = cDimScenario;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, cScenarioSource, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Version
sDim = cDimVersion;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, cVersionSource, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#Year
sDim = cDimYear;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, cYearSource, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

nCountBusinessDim = 1;
While (nCountBusinessDim <= 9);
    sDim = Expand('%sDimBusiness' | NumberToStringEx(nCountBusinessDim, '00', '', '') | '%');
    sProcess = 'Bedrock.Dim.Sub.Create';
    sParam1Name = 'pDimension';
    sParam1Value = sDim;
    sParam2Name = 'pSubset';
    sParam2Value = cSub;
    sParam3Name = 'pConsol';
    sParam3Value = 'ToFix';
    nParam4Name = 'pLevelFrom';
    nParam4Value = 0;
    nParam5Name = 'pLevelTo';
    nParam5Value = 0;
    ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                               sParam3Name, sParam3Value, nParam4Name, nParam4Value,
                                               nParam5Name, nParam5Value);
    ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);    
    nCountBusinessDim = nCountBusinessDim + 1;
End;

nDim = nDimensionCount;
nCount = 1;
While (nCount <= nDim);
    sDim = TabDim (cCubeSource, nCount);
    ViewRowDimensionSet(cCubeSource, cViewSource, sDim, nCount);
    nCount = nCount + 1;
End;

ViewExtractSkipCalcsSet(cCubeSource, cViewSource, 1);
ViewExtractSkipRuleValuesSet(cCubeSource, cViewSource, 0);
ViewExtractSkipZeroesSet(cCubeSource, cViewSource, 1);
DataSourceNameForServer = cCubeSource;
DataSourceNameForClient = cCubeSource;
DataSourceType = 'VIEW';
DataSourceCubeView = cViewSource;

sProcess = 'Bedrock.Cube.Data.Clear';
sParam1Name = 'pCube';
sParam1Value = cCubeTarget;
sParam2Name = 'pView';
sParam2Value = cViewTarget;
sParam3Name = 'pFilter';
sParam3Value = cDimVersion | cElementStartDelim | cVersionTarget |
                           cDimensionDelim | cDimScenario | cElementStartDelim | cScenarioTarget |
                           cDimensionDelim | cDimYear | cElementStartDelim | cYearTarget |
                           If (sDimBusiness01  @= '', '', cDimensionDelim | sDimBusiness01 | cElementStartDelim | sEleBusiness01) |
                           If (sDimBusiness02  @= '', '', cDimensionDelim | sDimBusiness02 | cElementStartDelim | sEleBusiness02) |
                           If (sDimBusiness03  @= '', '', cDimensionDelim | sDimBusiness03 | cElementStartDelim | sEleBusiness03) |
                           If (sDimBusiness04  @= '', '', cDimensionDelim | sDimBusiness04 | cElementStartDelim | sEleBusiness04) |
                           If (sDimBusiness05  @= '', '', cDimensionDelim | sDimBusiness05 | cElementStartDelim | sEleBusiness05) |
                           If (sDimBusiness06  @= '', '', cDimensionDelim | sDimBusiness06 | cElementStartDelim | sEleBusiness06) |
                           If (sDimBusiness07  @= '', '', cDimensionDelim | sDimBusiness07 | cElementStartDelim | sEleBusiness07) |
                           If (sDimBusiness08  @= '', '', cDimensionDelim | sDimBusiness08 | cElementStartDelim | sEleBusiness08) |
                           If (sDimBusiness09  @= '', '', cDimensionDelim | sDimBusiness09 | cElementStartDelim | sEleBusiness09);
sParam4Name = 'pDimensionDelim';
sParam4Value = cDimensionDelim;
sParam5Name = 'pElementStartDelim';
sParam5Value = cElementStartDelim;
sParam6Name = 'pElementDelim';
sParam6Value = cElementDelim;
nParam7Name = 'pDestroyTempObj';
nParam7Value = 1;
ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                           sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                           sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                           nParam7Name, nParam7Value);

### Determine dimensions in source cube ###
sDim1 = TabDim( cCubeTarget, 1 );
sDim2 = TabDim( cCubeTarget, 2 );
sDim3 = TabDim( cCubeTarget, 3 );
sDim4 = TabDim( cCubeTarget, 4 );
sDim5 = TabDim( cCubeTarget, 5 );
sDim6 = TabDim( cCubeTarget, 6 );
sDim7 = TabDim( cCubeTarget, 7 );
sDim8 = TabDim( cCubeTarget, 8 );
sDim9 = TabDim( cCubeTarget, 9 );
sDim10 = TabDim( cCubeTarget, 10 );
sDim11 = TabDim( cCubeTarget, 11 );
sDim12 = TabDim( cCubeTarget, 12 );
sDim13 = TabDim( cCubeTarget, 13 );
sDim14 = TabDim( cCubeTarget, 14 );
sDim15 = TabDim( cCubeTarget, 15 );
sDim16 = TabDim( cCubeTarget, 16 );
sDim17 = TabDim( cCubeTarget, 17 );
sDim18 = TabDim( cCubeTarget, 18 );
sDim19 = TabDim( cCubeTarget, 19 );
sDim20 = TabDim( cCubeTarget, 20 );
sDim21 = TabDim( cCubeTarget, 21 );
sDim22 = TabDim( cCubeTarget, 22 );
sDim23 = TabDim( cCubeTarget, 23 );
sDim24 = TabDim( cCubeTarget, 24 );
sDim25 = TabDim( cCubeTarget, 25 );
sDim26 = TabDim( cCubeTarget, 26 );
sDim27 = TabDim( cCubeTarget, 27 );

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


574,438
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


### Check for error in prolog ###

nDimCheck01 = nDimScenario;
sDimValueReplace01 = cScenarioTarget;
nDimCheck02 = nDimVersion;
sDimValueReplace02 = cVersionTarget;
nDimCheck03 = nDimYear;
sDimValueReplace03 = cYearTarget;

nDimChecks = 3;
nCountCheck = 1;
While (nCountCheck <= nDimChecks);
    nDimCheck = StringToNumber(Expand('%nDimCheck' | NumberToStringEx(nCountCheck, '00', '', '') | '%'));
    sDimValueReplace = Expand('%sDimValueReplace' | NumberToStringEx(nCountCheck, '00', '', '') | '%');
    If (nDimCheck = 1);
        v1 = sDimValueReplace;
    ElseIf (nDimCheck = 2);
        v2 = sDimValueReplace;
    ElseIf (nDimCheck = 3);
        v3 = sDimValueReplace;
    ElseIf (nDimCheck = 4);
        v4 = sDimValueReplace;
    ElseIf (nDimCheck = 5);
        v5 = sDimValueReplace;
    ElseIf (nDimCheck = 6);
        v6 = sDimValueReplace;
    ElseIf (nDimCheck = 7);
        v7 = sDimValueReplace;
    ElseIf (nDimCheck = 8);
        v8 = sDimValueReplace;
    ElseIf (nDimCheck = 9);
        v9 = sDimValueReplace;
    ElseIf (nDimCheck = 10);
        v10 = sDimValueReplace;
    ElseIf (nDimCheck = 11);
        v11 = sDimValueReplace;
    ElseIf (nDimCheck = 12);
        v12 = sDimValueReplace;
    ElseIf (nDimCheck = 13);
        v13 = sDimValueReplace;
    ElseIf (nDimCheck = 14);
        v14 = sDimValueReplace;
    ElseIf (nDimCheck = 15);
        v15 = sDimValueReplace;
    ElseIf (nDimCheck = 16);
        v16 = sDimValueReplace;
    ElseIf (nDimCheck = 17);
        v17 = sDimValueReplace;
    ElseIf (nDimCheck = 18);
        v18 = sDimValueReplace;
    ElseIf (nDimCheck = 19);
        v19 = sDimValueReplace;
    ElseIf (nDimCheck = 20);
        v20 = sDimValueReplace;
    ElseIf (nDimCheck = 21);
        v21 = sDimValueReplace;
    ElseIf (nDimCheck = 22);
        v22 = sDimValueReplace;
    ElseIf (nDimCheck = 23);
        v23 = sDimValueReplace;
    ElseIf (nDimCheck = 24);
        v24 = sDimValueReplace;
    ElseIf (nDimCheck = 25);
        v25 = sDimValueReplace;
    ElseIf (nDimCheck = 26);
        v26 = sDimValueReplace;
    ElseIf (nDimCheck = 27);
        v27 = sDimValueReplace;
    ElseIf (nDimCheck = 28);
        v28 = sDimValueReplace;
    ElseIf (nDimCheck = 29);
        v29 = sDimValueReplace;
    Endif;
    nCountCheck = nCountCheck + 1;
End;

sValue = Expand('%v' | NumberToString(nDimensionCount + 1) | '%');
sElType = DType( TabDim(cCubeTarget, nDimensionCount), Expand('%v' | NumberToString(nDimensionCount) | '%'));

If (nDimensionCount = 3);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3);
        Endif;
    Endif;
ElseIf (nDimensionCount = 4);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4);
        Endif;
    Endif;
ElseIf (nDimensionCount = 5);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5);
        Endif;
    Endif;
ElseIf (nDimensionCount = 6);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6);
        Endif;
    Endif;
ElseIf (nDimensionCount = 7);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7);
        Endif;
    Endif;
ElseIf (nDimensionCount = 8);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8);
        Endif;
    Endif;
ElseIf (nDimensionCount = 9);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9);
        Endif;
    Endif;
ElseIf (nDimensionCount = 10);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10);
        Endif;
    Endif;
ElseIf (nDimensionCount = 11);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11);
        Endif;
    Endif;
ElseIf (nDimensionCount = 12);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12);
        Endif;
    Endif;
ElseIf (nDimensionCount = 13);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13);
        Endif;
    Endif;
ElseIf (nDimensionCount = 14);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14);
        Endif;
    Endif;
ElseIf (nDimensionCount = 15);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15);
        Endif;
    Endif;
ElseIf (nDimensionCount = 16);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16);
        Endif;
    Endif;
ElseIf (nDimensionCount = 17);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17);
        Endif;
    Endif;
ElseIf (nDimensionCount = 18);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18);
        Endif;
    Endif;
ElseIf (nDimensionCount = 19);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19);
        Endif;
    Endif;
ElseIf (nDimensionCount = 20);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
        Endif;
    Endif;
ElseIf (nDimensionCount = 21);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21);
        Endif;
    Endif;
ElseIf (nDimensionCount = 22);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22);
        Endif;
    Endif;
ElseIf (nDimensionCount = 23);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23);
        Endif;
    Endif;
ElseIf (nDimensionCount = 24);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23, v24) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24);
        Endif;
    Endif;
ElseIf (nDimensionCount = 25);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23, v24, v25) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25);
        Endif;
    Endif;
ElseIf (nDimensionCount = 26);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23, v24, v25, v26) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26);
        Endif;
    Endif;
ElseIf (nDimensionCount = 27);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23, v24, v25, v26, v27) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26, v27);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26, v27);
        Endif;
    Endif;
ElseIf (nDimensionCount = 28);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23, v24, v25, v26, v27, v28) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26, v27, v28);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26, v27, v28);
        Endif;
    Endif;
ElseIf (nDimensionCount = 29);
    If (CellIsUpdateable(cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                          v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                          v21, v22, v23, v24, v25, v26, v27, v28, v29) = 1);
        If (sElType @= 'S');
            CellPutS(sValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26, v27, v28, v29);
        Else;
            nValue = StringToNumber(sValue);
            CellPutN(nValue, cCubeTarget, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10,
                                                              v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                                                              v21, v22, v23, v24, v25, v26, v27, v28, v29);
        Endif;
    Endif;
Endif;






##############################################################################################################
### END Data script







575,60
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

If (ViewExists(cCubeSource, cViewSource) <> 0);
    ViewDestroy(cCubeSource, cViewSource);
Endif;

nDim = nDimensionCount;
nCount = 1;
While (nCount <= nDim);
    sDim = TabDim (cCubeSource, nCount);
    If (SubsetExists(sDim, cSub) <> 0);
        SubsetDestroy(sDim, cSub);
    Endif;
    nCount = nCount + 1;
End;



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
