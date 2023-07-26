601,100
602,"Sys.Server.Sys Parameter.Update from tm1s.cfg"
562,"CHARACTERDELIMITED"
586,"D:\DBs\standard\tm1s.cfg"
585,"D:\DBs\standard\tm1s.cfg"
564,
565,"aaaBt`]3rmsJpT[7^EyO<mq8hZLhw7kVwMw1<7vQwvh2emM^@VkV5xkGBs=n_XhH^4OxrMEL4biEh@Dq2TTx>bgRJMr7<gfH]V>I0gP0CHA:cLu2CID7TwcPI2w=lCvj6=D0KClFDMVHcOoLLcvClPdIxCdWyFiwGlcEV;nmcDn[XAi]fCFkMChU1?Y`86d:x\\][]hU"
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
567,"="
588,"."
589,","
568,""""
570,
571,
569,11
592,0
599,1000
560,3
pDoProcessLogging
pDebug
pConfigFilePath
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pDebug,"0"
pConfigFilePath,""
637,3
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pConfigFilePath,"tm1s.cfg location (Optional, blank will read from Sys Parameter)"
577,2
vParameter
vValue
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
572,119
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to update Sys Parameter info from tm1s.cfg file
# 
# DATA SOURCE:
#    none
#
# REMARK:
#    Reading "tm1s.cfg Location" path from Sys Parameter Cube, if path parameter is empty.
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

##############################################################################################################
### Prolog script commences

############################################
### Inits - declare constants
cCubeConfig = 'Sys Parameter';
bRerRun = 0;

cConfigFile = pConfigFilePath;
If (cConfigFile @= '');
    cConfigFile = CellGetS(cCubeConfig, 'tm1s.cfg Location', 'Text');
Endif;
If (cConfigFile @= '');
    cConfigFile = '.\tm1s.cfg';
Endif;

############################################
### Validation
If (FileExists(cConfigFile) = 0);
    sError = 'Config File not found, path: "' | cConfigFile | '"';
    AsciiOutput(sDebugFile, sError);
    If (sErr @<> '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
Endif;

If (nError <> 0);
    ProcessBreak();
Endif;

############################################
### Create the view to assign as data source for the process


############################################
### Assign Data Source
DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = cConfigFile;
DatasourceNameForClient = cConfigFile;
DatasourceASCIIHeaderRecords=0;

############################################
### END Prolog
573,23
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



574,101
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



sParameter = Trim(vParameter);
sParameterValue = Trim(vValue);

If (SubSt(sParameterValue, 1, 1) @= '"' & SubSt(sParameterValue, Long(sParameterValue), 1) @= '"');
    sParameterValue = SubSt(sParameterValue, 2, Long(sParameterValue) - 1);
Endif;

######################
### Try look for tm1s.cfg Location
If (sParameter @= 'ApplicationTM1sConfigLocation');
    If (SubSt(cConfigFile, 1, 1) @= '.');
        CellPutS(sParameterValue, cCubeConfig, 'tm1s.cfg Location', 'Text');
        cConfigFile = sParameterValue;
        bReRun = 1;
        ProcessBreak();
    Endif;
Endif;

######################
### String Based Configuration

sParameterConfig001 = 'AdminHost'; sParameterElement001 = 'Admin Host';
sParameterConfig002 = 'ServerName'; sParameterElement002 = 'TM1 Server Name';
sParameterConfig003 = 'ServerCAMURI'; sParameterElement003 = 'CAM Server URI';
sParameterConfig004 = 'ClientCAMURI'; sParameterElement004 = 'CAM Client URI';
sParameterConfig005 = 'ApplicationTM1WebURL'; sParameterElement005 = 'TM1 Web URL';
sParameterConfig006 = 'ApplicationBackupFilePrefix'; sParameterElement006 = 'TM1 Backup File Name Prefix';
sParameterConfig007 = 'UseSSL'; sParameterElement007 = 'HTTP Use SSL';
sParameterConfig008 = 'HTTPPortNumber'; sParameterElement008 = 'HTTP Port Number';
nParameterMap = 8;

nCountMap = 1;
While (nCountMap <= nParameterMap);
    sParameterConfig = Expand('%sParameterConfig' | NumberToStringEx(nCountMap, '000', '', '') | '%');
    sParameterElement = Expand('%sParameterElement' | NumberToStringEx(nCountMap, '000', '', '') | '%');
    If (sParameterElement @<> '');
        If (sParameter @= sParameterConfig);
            If (sParameterValue @<> '');
                CellPutS(sParameterValue, cCubeConfig, sParameterElement, 'Text');
                ItemSkip;
            Endif;
        Endif;
    Endif;
    nCountMap = nCountMap + 1;
End;

######################
### Path Based Configuration

sParameterConfig001 = 'DataBaseDirectory'; sParameterElement001 = 'TM1 Data Directory';
sParameterConfig002 = 'LoggingDirectory'; sParameterElement002 = 'TM1 Logging Directory';
sParameterConfig003 = 'ApplicationExportDirectory'; sParameterElement003 = 'Export Folder';
sParameterConfig004 = 'ApplicationBackupDirectory'; sParameterElement004 = 'TM1 Model Backup Directory';
nParameterMap = 4;

nCountMap = 1;
While (nCountMap <= nParameterMap);
    sParameterConfig = Expand('%sParameterConfig' | NumberToStringEx(nCountMap, '000', '', '') | '%');
    sParameterElement = Expand('%sParameterElement' | NumberToStringEx(nCountMap, '000', '', '') | '%');
    If (sParameterElement @<> '');
        If (sParameter @= sParameterConfig);
            If (sParameterValue @<> '');
                sPath = sParameterValue;
                If (SubSt(sParameterValue, 1, 1) @= '.');
                    sPath = SubSt(cConfigFile, 1, Long(cConfigFile) - 9) | SubSt(sParameterValue, 2, Long(sParameterValue) - 1);
                Endif;
                If (SubSt(sPath, 1, 1) @<> '.');
                    CellPutS(sPath, cCubeConfig, sParameterElement, 'Text');
                Endif;
                ItemSkip;
            Endif;
        Endif;
    Endif;
    nCountMap = nCountMap + 1;
End;





##############################################################################################################
### END Data script


575,68
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
### Delete the data source processing view and subset objects from the system

######################
### Reenable data transaction logging to the target cube

######################
### Re-Run Process
If (bReRun = 1);
    sProcess = GetProcessName();
    sParam1Name = 'pDoProcessLogging';
    sParam1Value = pDoProcessLogging;
    sParam2Name = 'pDebug';
    sParam2Value = pDebug;
    sParam3Name = 'pConfigFilePath';
    sParam3Value = cConfigFile;
    ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value, sParam3Name, sParam3Value );
Endif;

############################################
### Quit Process When Validation Failed
If (nError <> 0);
    ProcessQuit();
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
