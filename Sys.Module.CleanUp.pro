601,100
602,"Sys.Module.CleanUp"
562,"NULL"
586,"Sys Module Object"
585,"Sys Module Object"
564,
565,"tm8KsYl\p@sVvcylcSELa9kV1swC4Vp_<V4Bzp<;e3Za[5hJBYuO5BICo^ru5g]li\KYVg>j<A\cWj\qkZS`0XJYfYif:si0b=:vKNO@7qg<EG7zfqi=5OJsEQ;lh>4udBhn[rd7V;17wZ\Sty=hdpS]^d7]RIYWOYp62n=5E3u9r?0vP4LH^9\BrytT3GmE4@O_Roix"
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
560,12
pDoProcessLogging
pAPQFrameworkUpdate
pAPQDimensionElementsUpdate
pCleanUp_APQLog
pCleanUp_APQPulseLog
pUninstallDemoGL
pUninstallDemoSales
pUninstallDemoHR
pUninstallDemoDimensions
pUnstiallFXRate
pUninstallMode
pDebug
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
pDoProcessLogging,"0"
pAPQFrameworkUpdate,"Y"
pAPQDimensionElementsUpdate,"Y"
pCleanUp_APQLog,"Y"
pCleanUp_APQPulseLog,"Y"
pUninstallDemoGL,"N"
pUninstallDemoSales,"N"
pUninstallDemoHR,"N"
pUninstallDemoDimensions,"N"
pUnstiallFXRate,"N"
pUninstallMode,"1"
pDebug,"0"
637,12
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pAPQFrameworkUpdate,"Update APQ Framework?"
pAPQDimensionElementsUpdate,"Update Elements for All Dimensions"
pCleanUp_APQLog,"Clean up }APQ Process Execution Log Cube ?"
pCleanUp_APQPulseLog,"Clean up }APQ Pulse User Login Cube ?"
pUninstallDemoGL,"Delete GL Demo Cube/Dimensions"
pUninstallDemoSales,"Delete Sales Demo Cube/Dimensions"
pUninstallDemoHR,"Delete HR Demo Cube/Dimensions"
pUninstallDemoDimensions,"Delete Demo Dimensions: Customer, Product, Profit Centerss, Entity"
pUnstiallFXRate,"Delete FX Rate Cube/Dimensions"
pUninstallMode,"""0"" = Backup; ""1"" = Delete Object; ""2"" Delete Object & Backup the object;"
pDebug,"Write debug log file?"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,187
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#   to Update APQ Framework
#   to Cleanup APQ Logs
#   to Remove ALL Demo Modules
#
# DATA SOURCE:
#    NONE
#
# REMARK:
#    
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2020-04-12  Lingo Wang          Create
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

### Update the APQ Framework
If (pAPQFrameworkUpdate @='Y');
    ExecuteProcess('}APQ.Process.Item.Run',
         'pListItem', '01'
        );
Endif;

### Update the }APQ Dimension Elements cube with elements from ALL dimensions
If (pAPQDimensionElementsUpdate @='Y');
    ExecuteProcess('}APQ.Dim.DimensionElements.Update',
         'pSelectedDimsOnly', '0',
         'pDim', '',
         'pClear','1'
        );
Endif;


### Clean up APQ Logging Cubes
If (pCleanUp_APQLog @='Y');
    sCube = '}APQ Process Execution Log';
    ExecuteProcess('}bedrock.cube.data.clear',
         'pCube', sCube
        );

    sCube = '}APQ Cube Last Updated by Process';
    ExecuteProcess('}bedrock.cube.data.clear',
         'pCube', sCube
        );

    sCube = '}APQ Server Message Log Info';
    ExecuteProcess('}bedrock.cube.data.clear',
         'pCube', sCube
        );
        
Endif;

### Clean up Pulse Logging Cubes
If (pCleanUp_APQPulseLog @='Y');
    sCube = '}APQ Pulse User Login ';
    ExecuteProcess('}bedrock.cube.data.clear',
         'pCube', sCube
        );

    sCube = '}APQ Pulse Workbook Tracker';
    ExecuteProcess('}bedrock.cube.data.clear',
         'pCube', sCube
        );
        
Endif;


### Uninstall Demo Model
If (pUninstallDemoGL @='Y');
    ExecuteProcess('Sys.Module.Uninstaller',
         'pDoProcessLogging', '0',
         'pModule', 'S52',
         'pUninstallMode', pUninstallMode
        );
Endif;

### Uninstall Sales Model
If (pUninstallDemoSales @='Y');
    ExecuteProcess('Sys.Module.Uninstaller',
         'pDoProcessLogging', '0',
         'pModule', 'S54',
         'pUninstallMode', pUninstallMode
        );
Endif;

### Uninstall HR Model
If (pUninstallDemoHR @='Y');
    ExecuteProcess('Sys.Module.Uninstaller',
         'pDoProcessLogging', '0',
         'pModule', 'S53',
         'pUninstallMode', pUninstallMode
        );
Endif;

### Uninstall Demon Dimensions: 
If (pUninstallDemoDimensions @='Y');
    ExecuteProcess('Sys.Module.Uninstaller',
         'pDoProcessLogging', '0',
         'pModule', 'S50',
         'pUninstallMode', pUninstallMode
        );
Endif;


### Uninstall FX Rate Module 
If (pUnstiallFXRate @='Y');
    ExecuteProcess('Sys.Module.Uninstaller',
         'pDoProcessLogging', '0',
         'pModule', 'S51',
         'pUninstallMode', pUninstallMode
        );
Endif;












############################################
### END Prolog



573,21
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
575,40
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
