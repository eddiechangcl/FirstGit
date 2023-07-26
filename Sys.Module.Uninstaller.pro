601,100
602,"Sys.Module.Uninstaller"
562,"VIEW"
586,"Sys Module Object"
585,"Sys Module Object"
564,
565,"aaRedVUXPlC];HL3\ZcFfL_BXEr6G5\>Hx@;sgGpss]jbyQko33Bv:Q;dt:AupRU9xdOXSi3>sWlQ\lLh<gWKWBk97@tMMC[Nyl;^6LNJj:`Q9g\GGr0s=>M3rOQSjsEcO>>NSfhvZ=V_GjpwkxZxhCF2rW\Uxuxs93^BnZp[0\vDL9i@5J<?:\:@JgBLZy<R3J9\qR;"
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
560,5
pDoProcessLogging
pDebug
pModule
pBackupPath
pUninstallMode
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pDebug,"0"
pModule,"S55"
pBackupPath,""
pUninstallMode,"0"
637,5
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pModule,"Module To Delete, Empty = Do Nothing, ""ALL"" = All modules"
pBackupPath,""
pUninstallMode,"""0"" = Backup; ""1"" = Delete Object; ""2"" Delete Object & Backup the object;"
577,5
vModule
vObjectType
vItem
vMeasure
vObjectName
578,5
2
2
2
2
2
579,5
1
2
3
4
5
580,5
0
0
0
0
0
581,5
0
0
0
0
0
582,5
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,198
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#   to remove selected "sys" objects by module (defined in Sys Module Object cube)
#   Cubewise Base Model has a lot of modules that may not be entirely suitable for any projects.
#   In order to keep the relevant, we therefore need a process to remove the objects that is not relevant to the projects.
#
# DATA SOURCE:
#    Sys Module Object
#
# REMARK:
#    
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


############################################
### Inits - declare constants
cCubeConfig = 'Sys Parameter';
cCubeSysModule = 'Sys Module Object';

cAdminHost = CellGetS(cCubeConfig, 'Admin Host', 'Text');
cHTTPPort = CellGetS(cCubeConfig, 'HTTP Port Number', 'Text');
cHTTPUseSSL = CellGetS(cCubeConfig, 'HTTP Use SSL', 'Text');
cDataPath = CellGetS(cCubeConfig, 'TM1 Data Directory', 'Text');
cDataPath = cDataPath | IF( SubSt( cDataPath, Long( cDataPath ), 1 ) @= '\', '', '\' );
cExportPath = CellGetS(cCubeConfig, 'Export Folder', 'Text');
cExportPath = cExportPath | IF( SubSt( cExportPath, Long( cExportPath ), 1 ) @= '\', '', '\' );
cExportPath = cExportPath | 'Module_Objects_' | pModule | '_' | sTimeStamp | '\' ;
cCURL = CellGetS(cCubeConfig, 'curl.exe Path', 'Text');

cAdminUser = CellGetS(cCubeConfig, 'Administrator Username', 'Text');
cAdminPwd = CellGetS(cCubeConfig, 'Administrator Password', 'Text');
cAdminAuthenticationHeader = CellGetS(cCubeConfig, 'Administrator Basic Authentication Header', 'Text');

cHTTPAuthentication = 'Authorization: Basic ' | cAdminAuthenticationHeader;
#cHTTPAuthentication = 'Authorization: CAMNamespace base64(user:password:namespace)';

cExportLogFile = cExportPath | 'Module_Objects_' | pModule | '.log';
cExportLogSummaryFile = cExportPath | 'Module_Objects_' | pModule | '_Summary.log';

nCountExport = 0;
nCountDelete = 0;

############################################
### Validation
If (Upper(pModule) @<> 'ALL' & DimIx ('Sys Module', pModule) = 0);
    sError = 'Sys Module not found, Module Name: "' | pModule | '"';
    AsciiOutput(sDebugFile, sError);
    If (sErr @<> '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
Endif;

If (pUninstallMode @<> '0' & pUninstallMode @<> '1' & pUninstallMode @<> '2');
    sError = 'Invlid Uninstall Mode, Mode Code: "' |  pUninstallMode | '"';
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

sFileName = cExportPath;
IF (FileExists(sFileName) = 0);
        sCommand = 'cmd /c mkdir "' | sFileName | '"' ;
        ExecuteCommand (sCommand, 1);
Endif;

############################################
### Create Source View by Module

sSubName = '}TI_' | cProcessName | '_' | cTimeStamp | '_' | sRandomInt;
sViewName = '}TI_' | cProcessName | '_' | cTimeStamp | '_' | sRandomInt;

cCubeSource = cCubeSysModule;
cViewSource = sViewName;
ViewCreate(cCubeSource, sViewName, 1);

sDim = 'Sys Module';
If (Upper(pModule) @= 'ALL');
    SubsetCreatebyMDX(sSubName, '{TM1SORT({TM1FILTERBYLEVEL({TM1SUBSETALL([' | sDim | '])}, 0)},ASC)}', 1 );
Else;
    If (SubsetExists(sDim, sSubName) = 0);
        SubsetCreate(sDim, sSubName, 1);
    Endif;
    sElement = pModule;
    SubsetDeleteAllElements(sDim, sSubName);
    SubsetElementInsert(sDim, sSubName, sElement, 1);
Endif;
ViewSubsetAssign(cCubeSource, cViewSource, sDim, sSubName);
ViewRowDimensionSet(cCubeSource, cViewSource, sDim, 1);

sDim = 'Sys Module Object Type';
SubsetCreatebyMDX(sSubName, '{TM1SORT({TM1FILTERBYLEVEL({TM1SUBSETALL([' | sDim | '])}, 0)},ASC)}', 1 );
ViewSubsetAssign(cCubeSource, cViewSource, sDim, sSubName);
ViewRowDimensionSet(cCubeSource, cViewSource, sDim, 2);

sDim = 'Line Item';
SubsetCreatebyMDX(sSubName, '{TM1SORT({TM1FILTERBYLEVEL({TM1SUBSETALL([' | sDim | '])}, 0)},ASC)}', 1 );
ViewSubsetAssign(cCubeSource, cViewSource, sDim, sSubName);
ViewRowDimensionSet(cCubeSource, cViewSource, sDim, 3);

sDim = 'M Sys Module Object';
    If (SubsetExists(sDim, sSubName) = 0);
        SubsetCreate(sDim, sSubName, 1);
    Endif;
    sElement = 'Object Name';
    SubsetDeleteAllElements(sDim, sSubName);
    SubsetElementInsert(sDim, sSubName, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, sSubName);
ViewColumnDimensionSet(cCubeSource, cViewSource, sDim, 1);

ViewExtractSkipCalcsSet(cCubeSource, cViewSource, 1);
ViewExtractSkipRuleValuesSet(cCubeSource, cViewSource, 1);
ViewExtractSkipZeroesSet(cCubeSource, cViewSource, 1);

############################################
### Assign Data Source

DataSourceType = 'VIEW';
DatasourceNameForServer = cCubeSource;
DatasourceNameForClient = cCubeSource;
DatasourceCubeView = cViewSource;

############################################
### END Prolog



573,393
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script

############################################
### Backup 

IF(pUninstallMode @='0' % pUninstallMode @='2');

# Backup - App Files
IF (vObjectType @='Application');
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'App Entry File');
    sObjectName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'File Name');
    sFilePath = SubSt (sFileName, 1, Long (sFileName) - Long (sObjectName));
    nAppIsFolder = CellGetN (cCubeSysModule, vModule, vObjectType, vItem, 'App Entry is folder');
    IF (FileExists(sFileName) = 1 & nAppIsFolder = 0);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\' | SubSt(sFilePath, Long(cDataPath) + 1, Long(sFilePath)) |'" ' ;
        sCommand = sCommand | '/S /Y';
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'App Entry', SubSt(sFileName, Long(cDataPath) + 1, Long(sFileName)));        
        nCountExport = nCountExport + 1;
        Endif;
    
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'App Template File');
    sFilePath = cDataPath | '}Externals\';
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\' | SubSt(sFilePath, Long(cDataPath) + 1, Long(sFilePath)) |'" ' ;
        sCommand = sCommand | '/S /Y';
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'App Template', SubSt(sFileName, Long(cDataPath) + 1, Long(sFileName)));        
        nCountExport = nCountExport + 1;
        Endif;
Endif;

# Backup - Cube Files
IF (vObjectType @='Cube');
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Cube File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Cube', sFileName);        
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Cube Rule File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Cube Rule', sFileName);     
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Cube Picklist Cube File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Cube Picklist Cube File', sFileName);        
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Cube Picklist Cube Rule File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Cube Picklist Cube Rule File', sFileName);     
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Cube View Folder');
    IF (FileExists(sFileName) = 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', vObjectType, SubSt(sFileName, Long(cDataPath) + 1, Long(sFileName))); 
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\' | SubSt(sFileName, Long(cDataPath) + 1, Long(sFileName)) |'\" ';
        sCommand = sCommand | '/S /Y';
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Cube Views', sFileName);  
        nCountExport = nCountExport + 1;
        Endif;
Endif;

# Backup - Dimension Files
IF (vObjectType @='Dimension');
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension', sFileName);  
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Attribute Dimension File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Attribute', sFileName);  
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Attribute Cube File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Attribute Cube', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Attribute Cube Rule File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Attribute Cube Rule', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Attribute Cube Picklist Cube File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Attribute Cube Picklist Cube File', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Attribute Cube Picklist Cube Rule File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Attribute Cube Picklist Cube Rule File', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;

    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Localize Cube File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Localize Cube File', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Localize Cube Rule File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Localize Cube Rule File', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
        
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Dimension Subset Folder');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\' | SubSt(sFileName, Long(cDataPath) + 1, Long(sFileName)) |'\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Dimension Subsets', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
Endif;


# Backup - }dimension files
IF (vObjectType @='Cube' % vObjectType @='Dimension');

    sFileName = '}Cultures.dim';
    sSourceFileName = cDataPath | sFileName;
    sTargetFileName = cExportPath | 'Data\' | sFileName;
    IF (FileExists(sSourceFileName) = 1 & FileExists(sTargetFileName) = 0);
        sCommand = 'cmd /c xcopy "' | sSourceFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', '}Cultures', sFileName);        
        nCountExport = nCountExport + 1;
        Endif;
      
    sFileName = '}ElementAttributes_}Cultures.cub';
    sSourceFileName = cDataPath | sFileName;
    sTargetFileName = cExportPath | 'Data\' | sFileName;
    IF (FileExists(sSourceFileName) = 1 & FileExists(sTargetFileName) = 0);
        sCommand = 'cmd /c xcopy "' | sSourceFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', '}Cultures', sFileName);        
        nCountExport = nCountExport + 1;
        Endif;

    sFileName = '}ElementAttributes_}Cultures.dim';
    sSourceFileName = cDataPath | sFileName;
    sTargetFileName = cExportPath | 'Data\' | sFileName;
    IF (FileExists(sSourceFileName) = 1 & FileExists(sTargetFileName) = 0);
        sCommand = 'cmd /c xcopy "' | sSourceFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', '}Cultures', sFileName);        
        nCountExport = nCountExport + 1;
        Endif;

    sFileName = '}PickList.dim';
    sSourceFileName = cDataPath | sFileName;
    sTargetFileName = cExportPath | 'Data\' | sFileName;
    IF (FileExists(sSourceFileName) = 1 & FileExists(sTargetFileName) = 0);
        sCommand = 'cmd /c xcopy "' | sSourceFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', '}PickList.dim', sFileName);        
        nCountExport = nCountExport + 1;
        Endif;

Endif;



# Backup - Process Files
IF (vObjectType @='Process');
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Process File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Process', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
Endif;

# Backup - Chore File
IF (vObjectType @='Chore');
    sFileName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Chore File');
    IF (FileExists(sFileName) = 1);
        sCommand = 'cmd /c xcopy "' | sFileName | '" "' | cExportPath | 'Data\" ';
        sCommand = sCommand | '/S /Y';
        #ASCIIOUTPUT (cExportPath | 'xCopy.bat',sCommand); 
        ExecuteCommand ( sCommand, 1);
        ASCIIOUTPUT (cExportLogFile, 'Export: ', 'Chore', sFileName); 
        nCountExport = nCountExport + 1;
        Endif;
Endif;

Endif;




############################################
### DELETE OBJECTS

IF(pUninstallMode @='1' % pUninstallMode @='2');

# DELETE - App Entries
IF (vObjectType @='Application');
    sAppEntry = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Object Name');
    sObjectName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'File Name');
    sAppHttpString = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'App Http String');
    sCleanFlag = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Clean Flag');
    sDeleteDim = '}ApplicationEntries';

    If (sCleanFlag @='Y' & Long(Trim(sAppHttpString)) <> 0 & DimIx (sDeleteDim, sAppEntry) > 0 );
        nToBeReplace = SCAN(' ', sAppHttpString); 
        sReplaceValue = '%20';
        While (nToBeReplace > 0);
            sAppHttpString = Subst ( sAppHttpString , 1, nToBeReplace - 1) | sReplaceValue  | Subst ( sAppHttpString, nToBeReplace +1, Long (sAppHttpString) - nToBeReplace);
            nToBeReplace = SCAN(' ', sAppHttpString);
        End;

        sHTTPCommand = 'cmd /c ' | cCURL | ' -X DELETE';
        sHTTPCommand = sHTTPCommand | ' -H "' | cHTTPAuthentication | '"';
        sHTTPCommand = sHTTPCommand | ' -H "Content-type: application/json"';
        sHTTPCommand = sHTTPCommand | ' http' | If (Trim(cHTTPUseSSL) @= 'T', 's', '') | '://' | cAdminHost | ':' | cHTTPPort | '/api/v1/' | sAppHttpString | ' ';
        sHTTPCommand = sHTTPCommand | ' -k';
        ASCIIOUTPUT (cExportPath | 'HttpCommand.bat', sHTTPCommand);
        ExecuteCommand ( sHTTPCommand, 0);
        ASCIIOUTPUT (cExportLogFile, 'DELETED: ', 'App Entry',  sAppEntry);
        nCountDelete = nCountDelete + 1;
    Endif;
    
    sDeleteDim = '}APQ Applications';
    IF (DimIx (sDeleteDim, sAppEntry) > 0 );
        DimensionElementDelete(sDeleteDim, sAppEntry);
    Endif;
Endif;
    
# DELETE - Cube
IF (vObjectType @='Cube');
    sCubeDeleteName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Object Name');
    sCleanFlag = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Clean Flag');
    If (sCleanFlag @='Y' & CubeExists(sCubeDeleteName) <> 0 );
        CubeDestroy(sCubeDeleteName);
        ASCIIOUTPUT (cExportLogFile, 'DELETED: ', 'Cube',  sCubeDeleteName);
        nCountDelete = nCountDelete + 1;
    Endif;
Endif;

# DELETE - Dimension
IF (vObjectType @='Dimension');
    sDimDeleteName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Object Name');
    sCleanFlag = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Clean Flag');
    If (sCleanFlag @='Y' & DimensionExists(sDimDeleteName) <> 0 );
       DimensionDestroy(sDimDeleteName);
        ASCIIOUTPUT (cExportLogFile, 'DELETED: ', 'Dimension',  sDimDeleteName);
       nCountDelete = nCountDelete + 1;
    Endif;
Endif;

# DELETE - Chore
IF (vObjectType @='Chore');
    sChoreDeleteName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Object Name');
    sCleanFlag = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Clean Flag');
    sDeleteDim = '}Chores';

    If (sCleanFlag @='Y' & DimIx (sDeleteDim, sChoreDeleteName) > 0 );
            nToBeReplace = SCAN(' ', sChoreDeleteName); sReplaceValue = '%20';
            While (nToBeReplace > 0);
                sChoreDeleteName = Subst ( sChoreDeleteName , 1, nToBeReplace - 1) | sReplaceValue  | Subst ( sChoreDeleteName, nToBeReplace +1, Long (sChoreDeleteName) - nToBeReplace);
                nToBeReplace = SCAN(' ', sChoreDeleteName);
            End;

            sHTTPCommand = 'cmd /c ' | cCURL | ' -X DELETE';
            sHTTPCommand = sHTTPCommand | ' -H "' | cHTTPAuthentication | '"';
            sHTTPCommand = sHTTPCommand | ' -H "Content-type: application/json"';
            sHTTPCommand = sHTTPCommand | ' http' | If (Trim(cHTTPUseSSL) @= 'T', 's', '') | '://' | cAdminHost | ':' | cHTTPPort | '/api/v1/Chores(''' | sChoreDeleteName |  ''')';
            sHTTPCommand = sHTTPCommand | ' -k';
        ASCIIOUTPUT (cExportPath | 'HttpCommand.bat', sHTTPCommand);
        ExecuteCommand ( sHTTPCommand, 0);
        ASCIIOUTPUT (cExportLogFile, 'DELETED: ', 'Chore',  sChoreDeleteName);
        nCountDelete = nCountDelete + 1;
    Endif;
Endif;

# DELETE - Process
IF (vObjectType @='Process');
    sProcessDeleteName = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Object Name');
    sCleanFlag = CellGetS (cCubeSysModule, vModule, vObjectType, vItem, 'Clean Flag');
    sDeleteDim = '}Processes';

    If (sCleanFlag @='Y' & DimIx (sDeleteDim, sProcessDeleteName) > 0 );
            nToBeReplace = SCAN(' ', sProcessDeleteName); sReplaceValue = '%20';
            While (nToBeReplace > 0);
                sProcessDeleteName = Subst ( sProcessDeleteName , 1, nToBeReplace - 1) | sReplaceValue  | Subst ( sProcessDeleteName, nToBeReplace +1, Long (sProcessDeleteName) - nToBeReplace);
                nToBeReplace = SCAN(' ', sProcessDeleteName);
            End;

            sHTTPCommand = 'cmd /c ' | cCURL | ' -X DELETE';
            sHTTPCommand = sHTTPCommand | ' -H "' | cHTTPAuthentication | '"';
            sHTTPCommand = sHTTPCommand | ' -H "Content-type: application/json"';
            sHTTPCommand = sHTTPCommand | ' http' | If (Trim(cHTTPUseSSL) @= 'T', 's', '') | '://' | cAdminHost | ':' | cHTTPPort | '/api/v1/Processes(''' | sProcessDeleteName |  ''')';
            sHTTPCommand = sHTTPCommand | ' -k';
        ASCIIOUTPUT (cExportPath | 'HttpCommand.bat', sHTTPCommand);
        ExecuteCommand ( sHTTPCommand, 0);
        ASCIIOUTPUT (cExportLogFile, 'DELETED: ', 'Process',  sProcessDeleteName);
        nCountDelete = nCountDelete + 1;
    Endif;
Endif;



Endif;


############################################
### END Metadata

574,20
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
#IF( pDoProcessLogging @= '1' ); nDataRecordCount = nDataRecordCount + 1;EndIF;
#sDebugFile = cDebugFile | '_Data.log';

##############################################################################################################
### Data script




##############################################################################################################
### END Data script
575,61
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



############################################
### Summary and Clean Folder if it is Empty

IF (pUninstallMode @= '0' % pUninstallMode @= '2');
    ASCIIOUTPUT (cExportLogSummaryFile, NumberToString (nCountExport) | ' items have been exported.' ); 
ENDIF;
IF (pUninstallMode @= '1' % pUninstallMode @= '2');
    ASCIIOUTPUT (cExportLogSummaryFile, NumberToString (nCountDelete) | ' items have been deleted.' ); 
ENDIF;

sFirstFile = WildcardFileSearch(cExportPath | '\Data\*.*', '');
IF (sFirstFile @='');
      sCommand = 'cmd /c rmdir "' | cExportPath | '\Data\" /S /Y';
      ExecuteCommand ( sCommand, 1);
ENDIF;

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
