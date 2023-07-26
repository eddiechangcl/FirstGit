601,100
602,"Sys.Menu.Cube.Sys Menu.Page.Copy"
562,"VIEW"
586,"Sys Menu"
585,"Sys Menu"
564,
565,"pRLDvjGsIjm@VTdKa1O1Bb\kbfiatWrON_2M8ukTFy7:b1`1qXnXVjO_c:B^8DM3uB5QYTTdVjKLh\8HRUWM;YPl6AAQ=6`<\m`o4fx;;BEru5mliCsqKN[@x>j9sDKypq3v^6u@]8F3SN;wGxhJJ_KVI6=nsj@S^_9CbOTz076vcdgcXku1lp;KR=l26ZIbOpTVrF0d"
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
560,6
pDoProcessLogging
pDebug
pSourceClient
pTargetClient
pSourcePage
pTargetPage
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1"
pDebug,"0"
pSourceClient,"Default Application Entry"
pTargetClient,""
pSourcePage,"Favorite Page"
pTargetPage,""
637,6
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pSourceClient,"Source Profile"
pTargetClient,"Target Profile"
pSourcePage,"Source Page"
pTargetPage,"Target Page"
577,6
vClient
vPage
vRow
vColumn
vMeasure
vValue
578,6
2
2
2
2
2
2
579,6
1
2
3
4
5
6
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,6
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,236
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to copy a single page from one profile to another profile
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
#   2019-07-09  Tat Seng Wong       Upgrade to }Bedrock 4
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

cDimensionDelim = CellGetS(cCubParam,'pDimDelim','String');
cElementStartDelim = CellGetS(cCubParam,'pEleStartDelim','String');
cElementDelim = CellGetS(cCubParam,'pEleDelim','String');

cProcessName = GetProcessName();
cCube = 'Sys Menu';

cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
While (ViewExists(cCube, cTempName | '_Source') <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;

cSourceView = cTempName | '_Source';
cTargetView = cTempName | '_Target';
cSub = cTempName;

cClientDim = 'Sys Menu Profile';
cPageDim = 'Sys Menu Page';
cMeasureDim = 'M Sys Menu';

cSourceClient = pSourceClient;
cTargetClient = pTargetClient;
cSourcePage = pSourcePage;
cTargetPage = pTargetPage;

If (cSourceClient @<> '');
     cSourceClient = DimensionElementPrincipalName(cClientDim, cSourceClient);
Endif;
If (cTargetClient @<> '');
     cTargetClient = DimensionElementPrincipalName(cClientDim, cTargetClient);
Endif;

If (cSourcePage @<> '');
     cSourcePage = DimensionElementPrincipalName(cPageDim, cSourcePage);
Endif;
If (cTargetPage @<> '');
     cTargetPage = DimensionElementPrincipalName(cPageDim, cTargetPage);
Endif;


############################################
### Create SOURCE View for copying
If (ViewExists(cCube, cSourceView) = 0);
     ViewCreate(cCube, cSourceView, 1);
Endif;

############################################
### Sys Menu Client
sDim='Sys Menu Profile';
If (SubsetExists(sDim, cSub) = 0);
     SubsetCreate(sDim, cSub, 1);
Else;
     SubsetDeleteAllElements(sDim, cSub);
Endif;
SubsetElementInsert(sDim, cSub, cSourceClient, 1);
ViewSubsetAssign(cCube, cSourceView, sDim, cSub);

############################################
### Sys Menu Page
sDim = 'Sys Menu Page';
If (SubsetExists(sDim, cSub) = 0);
     SubsetCreate(sDim, cSub, 1);
Else;
     SubsetDeleteAllElements(sDim, cSub);
Endif;
SubsetElementInsert(sDim, cSub, cSourcePage, 1);
ViewSubsetAssign(cCube, cSourceView, sDim, cSub);

############################################
### Sys Menu Page Row
sDim = 'Sys Menu Page Row'; sElementConsolidated = 'All Rows';
sMDX = '{TM1FilterByLevel({Descendants({[' | sDim | '].[' | sElementConsolidated | ']})}, 0)}';
If (SubsetExists(sDim, cSub) <> 0);
  SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim, 1);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCube, cSourceView, sDim, cSub);

############################################
### Sys Menu Page Column
sDim = 'Sys Menu Page Column'; sElementConsolidated = 'All Columns';
sMDX = '{TM1FilterByLevel({Descendants({[' | sDim | '].[' | sElementConsolidated | ']})}, 0)}';
If (SubsetExists(sDim, cSub) <> 0);
  SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim, 1);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCube, cSourceView, sDim, cSub);


############################################
### M Sys Menu
sDim = 'M Sys Menu';
sMDX = '{TM1FilterByLevel({TM1SubsetAll([' | sDim | '])},0)}';
If (SubsetExists(sDim, cSub) <> 0);
  SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim, 1);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCube, cSourceView, sDim, cSub);

nDim = 5;
nCount = 1;
While (nCount <= nDim);
       sDim = TabDim(cCube, nCount);
       ViewRowDimensionSet(cCube, cSourceView, sDim, nCount);
       nCount = nCount + 1;
End;


############################################
### Clear Out Target Area

sFilter = cClientDim | cElementStartDelim | cTargetClient;
sFilter = sFilter | cDimensionDelim | cPageDim | cElementStartDelim | cTargetPage;
sFilter = sFilter | cDimensionDelim | cMeasureDim | cElementStartDelim  |
                                'Button Type' | cElementDelim |
                                'Button ID' | cElementDelim |
                                'Button Name' | cElementDelim |
                                'Button Hyperlink';
ExecuteProcess ( '}bedrock.cube.data.clear',
                             'pLogOutput', 0,
                             'pCube', cCube,
                             'pView', cTargetView,
                             'pFilter', sFilter,
                             'pFilterParallel', '',
                             'pParallelThreads', 0,
                             'pDimDelim',cDimensionDelim,
                             'pEleStartDelim',cElementStartDelim,
                             'pEleDelim',cElementDelim,
                             'pCubeLogging',0,
                             'pTemp',1
                            );

ViewExtractSkipCalcsSet( cCube, cSourceView, 0);
ViewExtractSkipRuleValuesSet (cCube, cSourceView, 0);
ViewExtractSkipZeroesSet (cCube, cSourceView, 0);
DatasourceNameForServer = cCube;
DatasourceNameForClient = cCube;
DatasourceType='VIEW';
DatasourceCubeView = cSourceView;


############################################
### END Prolog






573,19
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



######################
### END Metadata
574,36
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




IF ( CellIsUpdateable(cCube, cTargetClient, cTargetPage, vRow, vColumn, vMeasure) = 1);

     IF (DTYPE(cMeasureDim, vMeasure) @='S');
          CellPutS (vValue, cCube, cTargetClient, cTargetPage, vRow, vColumn, vMeasure);
     ELSE;
          nValue = NUMBR (vValue);
          CellPutN (nValue, cCube, cTargetClient, cTargetPage, vRow, vColumn, vMeasure);
     ENDIF;

ENDIF;






##############################################################################################################
### END Data script
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


576,
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
