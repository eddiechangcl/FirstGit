601,100
602,"Sys.Sync.Cube.Data.Import.Caller"
562,"NULL"
586,
585,
564,
565,"wzy9ITU5xsw9dO987Snf7mlypM8yCw`EBcllEHP5ef`MC74GY@BX_\8Lh@UA1W0Y4h0i9u@Bc?09R o6OGF\<qWYJGhz0JcZ\XO5]TI8VJy67b}3idTzz9[2_KVJ;Dej9;VgTzjjmhi/OQpWykF;=fufvGUBK`Fu[^{V29Zg`pe[`xxzWl8UFeRG;if>@vr2tJUhSF0T"
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
571,
569,0
592,0
599,1000
560,11
pDoProcessLogging
pTransferSpecification
pCube
pDataFile
pStaticView
pClearFilter
pDimensionDelim
pElementStartDelim
pElementDelim
pColumnDelim
pQuoteChar
561,11
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
590,11
pDoProcessLogging,"1"
pTransferSpecification,"IE0001"
pCube,"}ElementAttributes_Plant"
pDataFile,"}ElementAttributes_Plant_Full Cube"
pStaticView,""
pClearFilter,"Clear Cube"
pDimensionDelim,"°"
pElementStartDelim,"±"
pElementDelim,"?"
pColumnDelim,","
pQuoteChar,""
637,11
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pTransferSpecification,"Transfer Specification:"
pCube,"Cube Name:"
pDataFile,"Data File Name:"
pStaticView,"Static View (Optional, if provided, the clear filter will not take any effect)"
pClearFilter,"Filter: Year: 2006 + 2007 & Scenario: Actual + Budget & Organization: North America Operations"
pDimensionDelim,"Delimiter for start of Dimension/Element set"
pElementStartDelim,"Delimiter for start of element list"
pElementDelim,"Delimiter between elements"
pColumnDelim,"Delimiter Character (default=Comma)"
pQuoteChar,"Quote Character (default=Double Quote)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,237
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to import data from data file for "sync server" to use
# 
# DATA SOURCE:
#    Cube
#
# REMARK:
#    none
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2018-08-26  Eddie Chang          Initial Build
#   2020-03-12  Lingo Wang           Apply for APQ 3.3
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


cDimensionDelim = Char(176);
cElementStartDelim = Char(177);
cElementDelim = Char(178);
 


#####################################################################################
cCubeConfig = 'Sys Parameter';
cCubeTransferConfig = 'Sys Transfer Parameter';
cDimTransferSpecification = 'Sys Transfer Specification';
sTransferSpecificationDirectory = CellGetS(cCubeTransferConfig, 'Transfer Specification Directory', 'Text');
sTransferOutputDirectory = CellGetS(cCubeTransferConfig, 'Transfer Object Output Directory', 'Text');

cCube = pCube;
cStaticView = pStaticView;
cTransferSpecification = pTransferSpecification;
cDimensionDelim = pDimensionDelim;
cElementStartDelim = pElementStartDelim;
cElementDelim = pElementDelim;
cClearFilter = pClearFilter;
cDataFile = pDataFile;
cExportColumnDelim = pColumnDelim;
cExportQuote = pQuoteChar;

sClearView = '}TI_' | cProcessName | '_' | sRandomInt | '_' | cCube | '_Clear';

cDataFile = cDataFile | '.csv';

sTransferOutputDirectory = sTransferOutputDirectory | '\' | cTransferSpecification | '\data transfer\' | cCube | '\';
cDataTransferFile = sTransferOutputDirectory | cDataFile;

nError = 0;
sErrorString = '';

#######################################################################################
#
# VALIDATION
#
#######################################################################################

If (cCube @= '');
    sError = 'Cube Name cannot be empty.';
    nError = 1;
    AsciiOutput(sDebugFile, sError);
    If (sErrorString @<> '');
        sErrorString = sErrorString | Char(10) | Char(13);
    Endif;
    sErrorString = sErrorString | sError;
Else;
    If (CubeExists(cCube) = 0);
        sError  = 'Cube does not exists: ' | cCube;
        nError = 1;
        AsciiOutput(sDebugFile, sError);
        If (sErrorString @<> '');
            sErrorString = sErrorString | Char(10) | Char(13);
        Endif;
        sErrorString = sErrorString | sError;
    Else;
        If (cStaticView @<> '');
            If (ViewExists(cCube, cStaticView) = 0);
                 sError  = 'Cube View does not exists. Cube: ' | cCube | ', View: ' | cStaticView;
                 nError = 1;
                 AsciiOutput(sDebugFile, sError);
                 If (sErrorString @<> '');
                    sErrorString = sErrorString | Char(10) | Char(13);
                Endif;
                sErrorString = sErrorString | sError;
            Endif;
        Endif;
    Endif;
Endif;

If (FileExists(cDataTransferFile) = 0);
    sError = 'Data File Not Found: "' | cDataTransferFile | '".';
    nError = 1;
    AsciiOutput(sDebugFile, sError);
    If (sErrorString @<> '');
        sErrorString = sErrorString | Char(10) | Char(13);
    Endif;
    sErrorString = sErrorString | sError;
Endif;

If (nError <> 0);
    ProcessBreak();
Endif;

#######################################################################################
#
# CUBE CLEAR
#
#######################################################################################

If (cStaticView @= '');
    sProcess = 'Bedrock.Cube.Data.Clear';
    sParam1Name = 'pCube';
    sParam1Value = cCube;
    sParam2Name = 'pView';
    sParam2Value = sClearView;
    sParam3Name = 'pFilter';
    sParam3Value = cClearFilter;
    sParam4Name = 'pDimensionDelim';
    sParam4Value = cDimensionDelim;
    sParam5Name = 'pElementStartDelim';
    sParam5Value = cElementStartDelim;
    sParam6Name = 'pElementDelim';
    sParam6Value = cElementDelim;
    nParam7Name = 'pDestroyTempObj';
    nParam7Value = 1;
    nParam8Name = 'pDebug';
    nParam8Value = 0;
    ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                                 sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                                 sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                                 nParam7Name, nParam7Value, nParam8Name, nParam8Value);
Else;
    ViewZeroOut(cCube, cStaticView);
Endif;

#######################################################################################
#
# IMPORT DATA FROM FILE
#
#######################################################################################

sProcess = 'Sys.Sync.Cube.Data.ImportFromFile';
sParam1Name = 'pSourceDir';
sParam1Value = sTransferOutputDirectory;
sParam2Name = 'pSourceFile';
sParam2Value = cDataFile;
sParam3Name = 'pCube';
sParam3Value = cCube;
sParam4Name = 'pDimension';
sParam4Value = '';
sParam5Name = 'pSourceElement';
sParam5Value = '';
sParam6Name = 'pTargetElement';
sParam6Value = '';
nParam7Name = 'pTitleRows';
nParam7Value = 0;
sParam8Name = 'pDelimiter';
sParam8Value = cExportColumnDelim;
nParam9Name = 'pCumulate';
nParam9Value = 0;
nParam10Name = 'pDebug';
nParam10Value = 0;
sParam11Name = 'pQuote';
sParam11Value = cExportQuote;
If (cExportQuote @= '"');
    ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                                 sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                                 sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                                 nParam7Name, nParam7Value, sParam8Name, sParam8Value,
                                                 nParam9Name, nParam9Value, nParam10Name, nParam10Value);
Else;
    ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                                 sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                                 sParam5Name, sParam5Value, sParam6Name, sParam6Value,
                                                 nParam7Name, nParam7Value, sParam8Name, sParam8Value,
                                                 nParam9Name, nParam9Value, nParam10Name, nParam10Value,
                                                 sParam11Name, sParam11Value);
Endif;


573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,37
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Debug
sDebugFile = cDebugFile | '_Epilog.log';

##############################################################################################################
### Epilog script

If (FileExists(cDataTransferFile) = 1);
    #AsciiDelete(cDataTransferFile);
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
