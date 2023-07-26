601,100
602,"Sys.Menu.Cube.Sys Menu Application Entry.Reference.Update"
562,"CHARACTERDELIMITED"
586,"D:\TM1_APP\apms\data\}Applications\0.Global\APMS Welcome.xls.blob"
585,"D:\TM1_APP\apms\data\}Applications\0.Global\APMS Welcome.xls.blob"
564,
565,"iLkX66wFjatJ0_PB]ws\Pw@gD1za?2SV143fBxp>wcGvqsMnCIj7op:v6_uUOg4d]eWy;bah<XG?<fHFG=muVhj3EsyK=D^STb>ewD7]RYJy7OZNSqCyZK?<0RGuYpjtYcWPGhk\;=8I8U`1>WJWe8_ouXXk]Nuf;;:rZ4=rGf0cgMCVRYiiX^1=kAASkJkS:7XH9YL0"
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
569,0
592,0
599,1000
560,3
pDoProcessLogging
pDebug
pElement
561,3
2
2
2
590,3
pDoProcessLogging,"0"
pDebug,"0"
pElement,"0.Global\APMS Welcome.xls.blob"
637,3
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pElement,"0.Global\APMS Welcome.xls.blob"
577,2
vEntry
vEntryValue
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
572,129
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to update App Entry Reference - from .extr files
# 
# DATA SOURCE:
#    none
#
# REMARK:
#    
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

##############################################################################################################
### Prolog script commences

cDim  = 'Sys Menu Application Entry';
cElement = pElement;
cSysMenuParameterCube = 'Sys Menu Parameter';

cReference = 'ENTRYREFERENCE';
cReferenceLength = Long(cReference);

### Get Webserver and Port
cAdminHost = CellGetS(cSysMenuParameterCube, 'Admin Host Name', 'String Value');
cTM1ServerName = CellGetS(cSysMenuParameterCube, 'Server Name', 'String Value');
cTM1WebServerName = CellGetS(cSysMenuParameterCube, 'TM1Web Server Name', 'String Value');
cTM1WebServerPort = CellGetS(cSysMenuParameterCube, 'TM1Web Server Port', 'String Value');
cURLAPIPreFix = CellGetS(cSysMenuParameterCube, 'TM1Web URL', 'String Value');

### Get DataFolder Path from Sys Menu Para Cube
cDataFolder = CellGetS(cSysMenuParameterCube, 'Server Data Folder Path', 'String Value');
IF (SUBST(cDataFolder, Long(cDataFolder), 1) @= '\'); cDataFolder = SubSt(cDataFolder, 1, Long(cDataFolder) - 1); ENDIF;

cAppFolder = cDataFolder | '\}Applications\';

### Get ServerName from Sys Menu Para Cube
cServerName = CellGetS(cSysMenuParameterCube, 'Server Name', 'String Value');

### Initialize Sys Menu Applicaiton Entry Cube
cCube = 'Sys Menu Application Entry';

cEntryFile = 'Entry File Location';
cEntryCube = 'Entry Cube';
cEntryView = 'Entry View';
#Entry Display Name
cEntryName = 'Entry Name';
cEntryType = 'Entry Type';
cEntryCountTemplate = 'Entry Count Template';
cEntryCountURL='Entry Count URL';


cEntryURL = 'Entry URL';
cEntryURLWebsheet = 'Entry URL Websheet';
cEntryURLWebsheetAPI = 'Entry URL Websheet API';
cEntryURLViewAPI = 'Entry URL View API';


### Set Data Source
cFile = cAppFolder | cElement;
DataSourceType='CHARACTERDELIMITED';
DatasourceNameForServer=cFile;
DatasourceNameForClient=cFile;


############################################
### END Prolog
573,18
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
574,120
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

IF (vEntry @='ENTRYTYPE');
     vEntryType = vEntryValue;

ELSEIF (vEntry @='ENTRYNAME');
     vEntryName = vEntryValue;

ELSEIF (vEntry @= cReference);

   ### translate the App Path into URL format, replace '\' into '/'
   sEntryAppPathTemp = SUBST(cElement, 1, LONG (cElement) - 5);

   sEntryAppPath = '';
   WHILE (sEntryAppPathTemp @<>'');
      sChar = SUBST(sEntryAppPathTemp, 1, 1);
      IF (sChar @='\'); sChar = '/' ; ENDIF;
      sEntryAppPath = sEntryAppPath | sChar;
      sEntryAppPathTemp = SUBST(sEntryAppPathTemp, 2, LONG(sEntryAppPathTemp));
   END;

   ### Update Sys Menu Applicaiton Folder Cube


  ## Template

   IF (vEntryType @='blob');
       sReference = vEntryValue;
       sReference = Insrt(cServerName, sReference, 7);
       sEntryFile = cDataFolder | SubSt(sReference, Scan('\', sReference), Long(sReference) - Scan('\', sReference) + 1);

## TM1 10.2.2 version
       sEntryURLAPI = cURLAPIPreFix | '/UrlApi.jsp#Action=Open&Type=websheet&workbook=Applications/';
       sEntryURLAPI = sEntryURLAPI | sEntryAppPath;
       sEntryURLAPI = sEntryURLAPI | '&TM1Server=' | cTM1ServerName;
       sEntryURLAPI = sEntryURLAPI | '&AdminHost=' | cAdminHost | '&AccessType=PUBLIC';

## TM1 10.2.1 version
#       sEntryURLAPI = cURLAPIPreFix | '/TM1WebWebSheeter.jsp?WebSheet=Applications/';
#       sEntryURLAPI = sEntryURLAPI | sEntryAppPath;
#       sEntryURLAPI = sEntryURLAPI | '&ServerName=' | cTM1ServerName;
#       sEntryURLAPI = sEntryURLAPI | '&HostName=' | cAdminHost | '&AccessType=PUBLIC';
    
       CellPutS(sReference, cCube, cElement, cEntryURL);
       CellPutS(sReference, cCube, cElement, cEntryURLWebsheet);
       CellPutS(sEntryURLAPI, cCube, cElement, cEntryURLWebsheetAPI);
       CellPutS(sEntryFile, cCube, cElement, cEntryFile);


  ## Template

   ELSEIF (vEntryType @='view');
       sReference = SUBST(vEntryValue,20, LONG(vEntryValue));
       sCubeName = SUBST(sReference, 1, SCAN('/', sReference) - 1);
       sViewName = SUBST(sReference, SCAN('/', sReference) +1, LONG(sReference));

## TM1 10.2.2 version
    sEntryURLAPI = cURLAPIPreFix | '/UrlApi.jsp#Action=Open&Type=CubeViewer&';
    sEntryURLAPI = sEntryURLAPI | 'Cube=' | sCubeName;
    sEntryURLAPI = sEntryURLAPI | '&View=' | sViewName;
    sEntryURLAPI = sEntryURLAPI | '&AdminHost=' | cAdminHost;
    sEntryURLAPI = sEntryURLAPI | '&TM1Server=' | cTM1ServerName;
    sEntryURLAPI = sEntryURLAPI | '&AccessType=Public';

## TM1 10.2.1 version
#       sEntryURLAPI = cURLAPIPreFix | '/TM1WebCubeViewer.jsp?';
#       sEntryURLAPI = sEntryURLAPI | 'CubeName=' | sCubeName;
#       sEntryURLAPI = sEntryURLAPI | '&CubeViewName=' | sViewName;
#       sEntryURLAPI = sEntryURLAPI | '&ServerName=' | cTM1ServerName;
#       sEntryURLAPI = sEntryURLAPI | '&HostName=' | cAdminHost | '&AccessType=PUBLIC';

       CellPutS(sEntryURLAPI, cCube, cElement, cEntryURL);
       CellPutS(sEntryURLAPI, cCube, cElement, cEntryURLViewAPI);
       CellPutS(sCubeName, cCube, cElement, cEntryCube);
       CellPutS(sViewName, cCube, cElement, cEntryView);

  ## Template

   ELSEIF (vEntryType @='extr');
       sReference = vEntryValue;
       CellPutS(sReference, cCube, cElement, cEntryURL);

       IF (UPPER(SUBST(sReference, 1, 4)) @<>'HTTP');
                IF (UPPER(SUBST(sReference, LONG (sReference) - 4,5)) @='.XLSX'
                     % UPPER(SUBST(sReference, LONG (sReference) - 3,4)) @='.XLS'
                      );
                     sEntryType = 'Template';
                     CellPutS(sEntryType, cCube, cElement, cEntryType);
                     CellPutN(1, cCube, cElement, cEntryCountTemplate);
                     CellPutN(0, cCube, cElement, cEntryCountURL);

                ELSE;
                    sEntryType = 'Document';
                     CellPutS(sEntryType, cCube, cElement, cEntryType);
                     CellPutN(0, cCube, cElement, cEntryCountURL);
                ENDIF;
       ENDIF;

   ENDIF;

ENDIF;



##############################################################################################################
### END Data script

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
