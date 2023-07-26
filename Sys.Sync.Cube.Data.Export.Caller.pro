601,100
602,"Sys.Sync.Cube.Data.Export.Caller"
562,"NULL"
586,
585,
564,
565,"w]TZbwk\CoyDgMRAQ3c^pECy`?oKE`iOB=4C0\;opuwbZ5T0xo_D6M0fjGUq8W2IEqmm9J`OU\4YS#_mbHlDf`fT]EazBraZdxT;m<BH^>b5m`z3Y_pD8e7Qn6R44dP`L0vkdW=ifq](_;P]YAg4}wGicML^GATtUkw64OW76td9aX<c4gN4;b2n4LiV;vR5TB2^Msgb"
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
560,14
pDoProcessLogging
pTransferSpecification
pCube
pDataFile
pStaticView
pExportFilter
pDimensionDelim
pElementStartDelim
pElementDelim
pQuoteChar
pSuppressRules
pSuppressConsol
pSuppressZero
pTitleRecord
561,14
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
1
1
1
1
590,14
pDoProcessLogging,"1"
pTransferSpecification,"IE0002"
pCube,"Sys Transfer Parameter"
pDataFile,"Sys Transfer Parameter_Full Cube"
pStaticView,""
pExportFilter,""
pDimensionDelim,"&"
pElementStartDelim,":"
pElementDelim,"+"
pQuoteChar,""""
pSuppressRules,1
pSuppressConsol,1
pSuppressZero,1
pTitleRecord,0
637,14
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pTransferSpecification,"Transfer Specification:"
pCube,"Cube Name:"
pDataFile,"Data File Name:"
pStaticView,"Static View (Optional, if provided, the export filter will not take any effect)"
pExportFilter,"Filter: Year: 2006 + 2007 & Scenario: Actual + Budget & Organization: North America Operations"
pDimensionDelim,"Delimiter for start of Dimension/Element set"
pElementStartDelim,"Delimiter for start of element list"
pElementDelim,"Delimiter between elements"
pQuoteChar,"Quote Character (default=Double Quote)"
pSuppressRules,"Suppress Rules (Skip = 1)"
pSuppressConsol,"Suppress Consolidations (Skip = 1)"
pSuppressZero,"Suppress Zero Data (Skip = 1)"
pTitleRecord,"Include Title Record in Export File? (Boolean 1=Yes)"
577,0
578,0
579,0
580,0
581,0
582,0
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
#    to export data from instance for "sync server" to use
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
sTransferSpecificationDirectory = sTransferSpecificationDirectory | If (SubSt(sTransferSpecificationDirectory, Long(sTransferSpecificationDirectory), 1) @<> '\', '\', '');
sTransferOutputDirectory = CellGetS(cCubeTransferConfig, 'Transfer Object Output Directory', 'Text');
sTransferOutputDirectory = sTransferOutputDirectory | If (SubSt(sTransferOutputDirectory, Long(sTransferOutputDirectory), 1) @<> '\', '\', '');

cTransferSpecification = pTransferSpecification;
cCube = pCube;
cDataFile = pDataFile;
cStaticView = pStaticView;
cExportFilter = pExportFilter;
cDimensionDelim = pDimensionDelim;
cElementStartDelim = pElementStartDelim;
cElementDelim = pElementDelim;
cExportQuote = pQuoteChar;
cSuppressRules = pSuppressRules;
cSuppressConsol = pSuppressConsol;
cSuppressZero = pSuppressZero;
cTitleRecord = pTitleRecord;

sTransferOutputDirectory = sTransferOutputDirectory | cTransferSpecification | '\data transfer\' | cCube | '\';
cDataTransferFile = sTransferOutputDirectory | cDataFile;
sDataTransferFile = cDataTransferFile | '.csv';

ExecuteCommand('cmd /c mkdir "' | sTransferOutputDirectory | '"', 1);

sExportView = '}TI_' | cProcessName | '_' | sRandomInt | '_' | cCube | '_Export';

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

If (cTransferSpecification @= '');
    sError = 'Transfer Specification cannot be empty.';
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

ExecuteCommand('cmd /c echo. 2>"' | sDataTransferFile | '"', 1);

#######################################################################################
#
# CUBE CREATE VIEW
#
#######################################################################################

If (cStaticView @= '');
    sProcess = '}bedrock.cube.view.create';
    sParam1Name = 'pCube';
    sParam1Value = cCube;
    sParam2Name = 'pView';
    sParam2Value = sExportView;
    sParam3Name = 'pFilter';
    sParam3Value = cExportFilter;
    nParam4Name = 'pSuppressZero';
    nParam4Value = cSuppressZero;
    nParam5Name = 'pSuppressConsol';
    nParam5Value = cSuppressConsol;
    nParam6Name = 'pSuppressRules';
    nParam6Value = cSuppressRules;
    sParam7Name = 'pDimDelim';
    sParam7Value = cDimensionDelim;
    sParam8Name = 'pEleStartDelim';
    sParam8Value = cElementStartDelim;
    sParam9Name = 'pEleDelim';
    sParam9Value = cElementDelim;
    ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                                 sParam3Name, sParam3Value, nParam4Name, nParam4Value,
                                                 nParam5Name, nParam5Value, nParam6Name, nParam6Value,
                                                 sParam7Name, sParam7Value, sParam8Name, sParam8Value,
                                                 sParam9Name, sParam9Value);
Endif;


#######################################################################################
#
# EXPORT DATA TO FILE
#
#######################################################################################

sProcess = 'Sys.Sync.Cube.Data.ViewExportToFile';
sParam1Name = 'pCube';
sParam1Value = cCube;
sParam2Name = 'pExportPath';
sParam2Value = sTransferOutputDirectory;
sParam3Name = 'pExportFile';
sParam3Value = cDataFile;
sParam4Name = 'pView';
sParam4Value = If (cStaticView @= '', sExportView, cStaticView);
nParam5Name = 'pSkipRuleValues';
nParam5Value = cSuppressRules;
nParam6Name = 'pSkipCalcValues';
nParam6Value = cSuppressConsol;
nParam7Name = 'pSkipNullValues';
nParam7Value = cSuppressZero;
nParam8Name = 'pTitleRecord';
nParam8Value = cTitleRecord;
nParam9Name = 'pDebug';
nParam9Value = 0;
sParam10Name = 'pQuote';
sParam10Value = cExportQuote;

ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                             sParam3Name, sParam3Value, sParam4Name, sParam4Value,
                                             nParam5Name, nParam5Value, nParam6Name, nParam6Value,
                                             nParam7Name, nParam7Value, nParam8Name, nParam8Value,
                                             nParam9Name, nParam9Value, sParam10Name, sParam10Value);
                                             

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,62
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


#######################################################################################
#
# CLEAN UP
#
#######################################################################################
If ( nError = 0 & cStaticView @= '');
  
ExecuteProcess('}bedrock.cube.viewandsubsets.delete',
   'pLogOutput', 0,
   'pCube', '',
   'pView', '',
   'pSub', '',
   'pMode', 1
  );  
    sProcess = '}bedrock.cube.viewandsubsets.delete';
    sParam1Name = 'pCube';
    sParam1Value = cCube;
    sParam2Name = 'pView';
    sParam2Value = sExportView;
    sParam3Name = 'pSub';
    sParam3Value = sExportView;
    nParam4Name = 'pMode';
    nParam4Value = 1;
    ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value
                                                   , sParam3Name, sParam3Value
                                                   , nParam4Name, nParam4Value
                                                   );
ENDIF;

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
