601,100
602,"Sys.Server.Restart Windows Services.Task Scheduler"
562,"NULL"
586,
585,
564,
565,"iZOwlxn><aZtBfI>;R`X\xe[lRIz;bL=uVu_bTHHbzP@RxUyI]VcE[10a5[MYZPkMozvQ^u<Q0;hUOugcL7D;;8ODO8sX^YH^N?`9KQa8dYcHs]<QR<[C9HlH4s=:1elDd70VWTlk7rfLl<sPFX9_:`DP5l]_P<D4\PIpHDbL710>lYTO7aHg>^wFw>29oNB@fzVpBb:"
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
560,2
pDoProcessLogging
pDebug
561,2
2
2
590,2
pDoProcessLogging,"1"
pDebug,"0"
637,2
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,234
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#   to configure Services Restart task in Windows Task Scheduler. The aim of this is to create a standard environment even outside TM1, 
#   so that the administrator is easier to administrate the system.
# 
# DATA SOURCE:
#    none
#
# REMARK:
#   need to ensure Powershell version is at least version 3
#   For Windows 2008 R2:
#   http://social.technet.microsoft.com/wiki/contents/articles/20623.step-by-step-upgrading-the-powershell-version-4-on-2008-r2.aspx#Installing_the_DOTnet_amp_after_that_reboot_is_required
#   Sys Parameter Requirement
#   1. Administrator Username
#   2. Administrator Password
#   3. Restart Services Script Path
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

DatasourceASCIIQuoteCharacter = '';

cCubeConfig = 'Sys Parameter';
cAdminUserName = CellGetS(cCubeConfig, 'Administrator Username', 'Text');
cAdminPassword = CellGetS(cCubeConfig, 'Administrator Password', 'Text');

cScriptPath = CellGetS(cCubeConfig, 'Export Folder', 'Text');
cScriptFile = cScriptPath | If (SubSt(cScriptPath, Long(cScriptPath), 1) @<> '\', '\', '') | 'CubewiseRegisterTask.ps1';

cTaskPath = 'Cubewise';
cTaskName = 'Restart TM1 Related Services';
cTaskDescription = 'To restart TM1, Cognos BI, Pulse and Canvas periodically! `r`nPossible Reasons: `r`n  1. Periodic System Patching. `r`n  2. Release Server Resources.';
cTaskPSPath = CellGetS(cCubeConfig, 'Restart Services Script Path', 'Text');

############################################
### PRODUCE THE POWERSHELL SCRIPT
# 1.This part of the code is only to create the .ps1 file to execute in Epilog
# 2.The script contains 2 functions
#     2.1. Create new Task Folder called "Cubewise" in Task Scheduler.
#     2.2. Create a task and register it on Task Scheduler
# 3.The last part of the script would check whether the task already existsed or not
#     3.1. If Not Exists, it would create a new task
#     3.2. If Exists, it would update the existing task
# 4.The scirpt would also check user credential against AD, best practice is to assign to a AD account with administrator access
#     4.1. It uses Administrator Username and Administrator Passowrd from Sys Parameter cube for reference
#     4.2. These parameters maybe using TM1's credential and not AD's credential depending on environment
#     4.3. In case the username and password is invalid, it uses SYSTEM as the default user.
#     4.4. If the username and password is valid, it uses the configured AD as the default user.
# 5.By default, the trigger has set to execute 2am everyday, but disabled by default, it would require administrator to update the trigger later.
# 6.Updating the script would not update the trigger, so therefore the configured trigger will not be affected if anything needs to update.
############################################

AsciiOutput(cScriptFile, '$taskPath = "' | cTaskPath | '"');
AsciiOutput(cScriptFile, '$taskName = "' | cTaskName | '"');
AsciiOutput(cScriptFile, '$taskDescription = "' | cTaskDescription | '"');
AsciiOutput(cScriptFile, '$taskPSPath = "' | cTaskPSPath | '"');
AsciiOutput(cScriptFile, '$userName= "' | cAdminUserName | '"');
AsciiOutput(cScriptFile, '$password = "' | cAdminPassword | '"');

AsciiOutput(cScriptFile, 'Function New-ScheduledTaskFolder {');
AsciiOutput(cScriptFile, '    Param ($taskpath)');
AsciiOutput(cScriptFile, '    $ErrorActionPreference = "stop"');
AsciiOutput(cScriptFile, '    $ScheduleObject = New-Object -ComObject schedule.service');
AsciiOutput(cScriptFile, '    $ScheduleObject.connect()');
AsciiOutput(cScriptFile, '    $RootFolder = $ScheduleObject.GetFolder("\")');
AsciiOutput(cScriptFile, '    Try {$null = $ScheduleObject.GetFolder($taskpath)}');
AsciiOutput(cScriptFile, '    Catch { $null = $rootFolder.CreateFolder($taskpath) }');
AsciiOutput(cScriptFile, '    Finally { $ErrorActionPreference = "continue" } ');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, 'Function New-ScheduledTaskRegistration {');
AsciiOutput(cScriptFile, 'Param ($TaskName, $TaskPath, $TaskDescription, $PSScriptPath, $UserName, $Password)');

AsciiOutput(cScriptFile, '$CurrentDomain = "LDAP://" + ([ADSI]"").distinguishedName');
AsciiOutput(cScriptFile, '$domain = New-Object System.DirectoryServices.DirectoryEntry($CurrentDomain,$UserName,$Password)');

AsciiOutput(cScriptFile, '$BasicParameters = @{');
AsciiOutput(cScriptFile, '    TaskName = $TaskName');
AsciiOutput(cScriptFile, '    TaskPath = $TaskPath');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$CredentialParameters = @{');
AsciiOutput(cScriptFile, '    User = $UserName');
AsciiOutput(cScriptFile, '    Password = $Password');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$PrincipalParameters = @{');
AsciiOutput(cScriptFile, '    UserID = $UserName');
AsciiOutput(cScriptFile, '    RunLevel = "Highest"');
AsciiOutput(cScriptFile, '    LogonType = "Password"');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, 'if ($domain.name -eq $null) {');
AsciiOutput(cScriptFile, '    $CredentialParameters = @{');
AsciiOutput(cScriptFile, '         User = "NT AUTHORITY\SYSTEM"');
AsciiOutput(cScriptFile, '    }');

AsciiOutput(cScriptFile, '    $PrincipalParameters = @{');
AsciiOutput(cScriptFile, '         UserID = "LOCALSERVICE"');
AsciiOutput(cScriptFile, '         RunLevel = "Highest"');
AsciiOutput(cScriptFile, '         LogonType = "ServiceAccount"');
AsciiOutput(cScriptFile, '    }');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$TriggerParameters = @{');
AsciiOutput(cScriptFile, '    At = "2am"');
AsciiOutput(cScriptFile, '    Daily = $true');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$ActionParameters = @{');
AsciiOutput(cScriptFile, '    Argument = "-NoLogo -NoProfile -ExecutionPolicy Bypass -File ""$PSScriptPath"""');
AsciiOutput(cScriptFile, '    Execute = "Powershell.exe"');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$SettingsParameters = @{');
AsciiOutput(cScriptFile, '    MultipleInstances = "IgnoreNew"');
AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$Principal = New-ScheduledTaskPrincipal @PrincipalParameters');
AsciiOutput(cScriptFile, '$Action = New-ScheduledTaskAction @ActionParameters');
AsciiOutput(cScriptFile, '$Triggers = New-ScheduledTaskTrigger @TriggerParameters');
AsciiOutput(cScriptFile, '$Settings = New-ScheduledTaskSettingsSet @SettingsParameters');

AsciiOutput(cScriptFile, '$UserTask = New-ScheduledTask -Principal $Principal -Action $Action -Trigger $Triggers -Settings $Settings');
AsciiOutput(cScriptFile, 'Register-ScheduledTask @BasicParameters @CredentialParameters -InputObject $UserTask');

AsciiOutput(cScriptFile, '}');

AsciiOutput(cScriptFile, '$CurrentDomain = "LDAP://" + ([ADSI]"").distinguishedName');
AsciiOutput(cScriptFile, '$domain = New-Object System.DirectoryServices.DirectoryEntry($CurrentDomain,$UserName,$Password)');

AsciiOutput(cScriptFile, '$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -eq $taskName }');
AsciiOutput(cScriptFile, 'if (!$taskExists) {');
AsciiOutput(cScriptFile, '    New-ScheduledTaskFolder -TaskPath $taskPath');
AsciiOutput(cScriptFile, '    New-ScheduledTaskRegistration `');
AsciiOutput(cScriptFile, '        -TaskPath $taskPath `');
AsciiOutput(cScriptFile, '        -TaskName $taskName `');
AsciiOutput(cScriptFile, '        -TaskDescription $taskDescription `');
AsciiOutput(cScriptFile, '        -UserName $userName `');
AsciiOutput(cScriptFile, '        -Password $password `');
AsciiOutput(cScriptFile, '        -PSScriptPath $taskPSPath ');
AsciiOutput(cScriptFile, '    $task = Get-ScheduledTask -TaskName $taskName ');
AsciiOutput(cScriptFile, '    $task.Author = "Cubewise Asia"');
AsciiOutput(cScriptFile, '    $task.Description = $taskDescription');
AsciiOutput(cScriptFile, '    if ($domain.name -eq $null) {');
AsciiOutput(cScriptFile, '        $task | Set-ScheduledTask -user "NT AUTHORITY\SYSTEM"');
AsciiOutput(cScriptFile,'     }');
AsciiOutput(cScriptFile, '    else {');
AsciiOutput(cScriptFile, '        $task | Set-ScheduledTask -user $userName -Password $password');
AsciiOutput(cScriptFile,'     }');
AsciiOutput(cScriptFile, '    $task | Disable-ScheduledTask');
AsciiOutput(cScriptFile,'}');
AsciiOutput(cScriptFile, 'else {');
AsciiOutput(cScriptFile, '    $task = Get-ScheduledTask -TaskName $taskName ');
AsciiOutput(cScriptFile, '    $task.Author = "Cubewise Asia"');
AsciiOutput(cScriptFile, '    $task.Description = $taskDescription');
AsciiOutput(cScriptFile, '    $task.Actions.Get(0).Arguments = "-NoLogo -NoProfile -ExecutionPolicy Bypass -File ""$taskPSPath"""');
AsciiOutput(cScriptFile, '    if ($domain.name -eq $null) {');
AsciiOutput(cScriptFile, '        $task.Principal.UserId = "LOCALSERVICE"');
AsciiOutput(cScriptFile, '        $task.Principal.LogonType = "ServiceAccount"');
AsciiOutput(cScriptFile, '        $task | Set-ScheduledTask -user "NT AUTHORITY\SYSTEM"');
AsciiOutput(cScriptFile,'     }');
AsciiOutput(cScriptFile, '    else {');
AsciiOutput(cScriptFile, '        $task.Principal.UserId = $UserName');
AsciiOutput(cScriptFile, '        $task.Principal.LogonType = "Password"');
AsciiOutput(cScriptFile, '        $task | Set-ScheduledTask -user $userName -Password $password');
AsciiOutput(cScriptFile,'     }');
AsciiOutput(cScriptFile,'}');

############################################
### END Prolog

573,14
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
575,51
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
### Execute script to create or update scheduled task

sCommandPS = 'powershell "' | cScriptFile | '"';
ExecuteCommand(sCommandPS, 1);
ExecuteCommand('cmd /c del "' | cScriptFile | '"', 0);




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
