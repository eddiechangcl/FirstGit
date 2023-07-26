601,100
602,"Sys.Archive.Clear Source Data.Hustle"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"ppf`w\02cR]4VsuOz^L`88aLymGm7MWuS5bQE;WtM5uK?!oZSlfc@O8GTdE2WID:NN;J4`yQm@ai`1FZoX]fT1H>jmssR6n_A>>mU6;rqFz\72P256]HO0r:o\pM~DuKB3uFMncehRtE2a]_ZSh&oVE1QW?B8[je=j?RAzvF]nL?ce7v9S_V9jfsJWmtzB_yEUKDfE8qppf`w\02cR]4VsuOz^L`88aLymGm7MWuU5bQE;WtM5uK?agZSlfc@O8GTD=5WIT8NN;z6`yQm@Ao`aEZoX]fT1H>jmczR6n_A>>mX6;rqFz\72@o46]HO0r:o\pMNC|KBcqvEncehRtE3a]OZSh6eVE1QW?B8[je=jO_AzvA]nL?ch7v9S_V9zfsJWmtz2VIGUKDfE8qppf`w\02cR]4VsuOo^L`88aLymGm7MW5U5bQE;WtM5uK?QhZSlfc@O8GTDq1WId;NN;:8`yQm@Qd`1DZoX]fT1H>jmspR6n_A>>=P6;rqFz\72@j96]HO0r:o\pMn1xKBSpFKncehRt54a]_TShvfVE1QW?B8[je=jRAzfM]nL?3b7v9S_V9jcsJWmtzbZIOUKDfE8q"
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
571,All
569,0
592,0
599,1000
560,2
pDoProcessLogging
pArchiveID
561,2
2
2
590,2
pDoProcessLogging,"1"
pArchiveID,"20170604_002"
637,2
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pArchiveID,"Archive ID:"
577,1
vElem
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
603,0
572,228
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    
# 
# DATA SOURCE:
#    
#
# REMARK:
#    none
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
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

######################
### Source File
cDate = TimSt(Now(), '\Y\m\d' );

cCubeConfig = 'Sys Archive Parameter';
cDimConfig = 'Sys Archive Parameter';

######################
### Hustle Definition

cTM1RunTI = CellGetS(cCubeConfig, 'TM1RunTI.exe Path', 'Text');
cHustlePath =  CellGetS(cCubeConfig, 'Hustle.exe Path', 'Text');
cHustleThread = CellGetN(cCubeConfig, 'Maximum Hustle Threads', 'Numeric');
cAdminHost = CellGetS(cCubeConfig, 'Admin Host', 'Text');
cCAMNamespace = CellGetS(cCubeConfig, 'CAM Namespace', 'Text');
cTM1Server = CellGetS(cCubeConfig, 'TM1 Server Name', 'Text');
cExportFolder = CellGetS(cCubeConfig, 'Export Folder', 'Text');
cExportFolder = cExportFolder | If (SubSt(cExportFolder, Long(cExportFolder), 1) @<> '\', '\', '');
DataSourceASCIIQuoteCharacter = '';

cHustleExportFolder = cExportFolder | 'Hustle\';
cHustleDefinitionFile = cHustleExportFolder | cProcessName | '.' | cTimeStamp | '.' | sRandomInt | '.hustle';

nTotalHustleUser = 0;
nCount = 1;
While (nCount <= 10);
    sHustleUserNameConfig = 'TM1 Process Runner ' | NumberToStringEx(nCount, '00', '', '') | ' Username';
    sHustlePasswordConfig = 'TM1 Process Runner ' | NumberToStringEx(nCount, '00', '', '') | ' Password';
    If (DimIx(cDimConfig, sHustleUsernameConfig) = 0 % DimIx(cDimConfig, sHustlePasswordConfig) = 0);
        nCount = 10;
    Else;
        sHustleUser = CellGetS(cCubeConfig, sHustleUserNameConfig, 'Text');
        sHustlePassword = CellGetS(cCubeConfig, sHustlePasswordConfig, 'Text');
        If (sHustleUser @<> '');
            If (nCount = 1); sHustleUser01 = sHustleUser; sHustlePassword01 = sHustlePassword;
            ElseIf (nCount = 2); sHustleUser02 = sHustleUser; sHustlePassword02 = sHustlePassword;
            ElseIf (nCount = 3); sHustleUser03 = sHustleUser; sHustlePassword03 = sHustlePassword;
            ElseIf (nCount = 4); sHustleUser04 = sHustleUser; sHustlePassword04 = sHustlePassword;
            ElseIf (nCount = 5); sHustleUser05 = sHustleUser; sHustlePassword05 = sHustlePassword;
            ElseIf (nCount = 6); sHustleUser06 = sHustleUser; sHustlePassword06 = sHustlePassword;
            ElseIf (nCount = 7); sHustleUser07 = sHustleUser; sHustlePassword07 = sHustlePassword;
            ElseIf (nCount = 8); sHustleUser08 = sHustleUser; sHustlePassword08 = sHustlePassword;
            ElseIf (nCount = 9); sHustleUser09 = sHustleUser; sHustlePassword09 = sHustlePassword;
            ElseIf (nCount = 10); sHustleUser10 = sHustleUser; sHustlePassword10 = sHustlePassword;
            ElseIf (nCount = 11); sHustleUser11 = sHustleUser; sHustlePassword11 = sHustlePassword;
            ElseIf (nCount = 12); sHustleUser12 = sHustleUser; sHustlePassword12 = sHustlePassword;
            ElseIf (nCount = 13); sHustleUser13 = sHustleUser; sHustlePassword13 = sHustlePassword;
            ElseIf (nCount = 14); sHustleUser14 = sHustleUser; sHustlePassword14 = sHustlePassword;
            ElseIf (nCount = 15); sHustleUser15 = sHustleUser; sHustlePassword15 = sHustlePassword;
            ElseIf (nCount = 16); sHustleUser16 = sHustleUser; sHustlePassword16 = sHustlePassword;
            ElseIf (nCount = 17); sHustleUser17 = sHustleUser; sHustlePassword17 = sHustlePassword;
            ElseIf (nCount = 18); sHustleUser18 = sHustleUser; sHustlePassword18 = sHustlePassword;
            ElseIf (nCount = 19); sHustleUser19 = sHustleUser; sHustlePassword19 = sHustlePassword;
            ElseIf (nCount = 20); sHustleUser20 = sHustleUser; sHustlePassword20 = sHustlePassword;
            ElseIf (nCount = 21); sHustleUser21 = sHustleUser; sHustlePassword21 = sHustlePassword;
            ElseIf (nCount = 22); sHustleUser22 = sHustleUser; sHustlePassword22 = sHustlePassword;
            ElseIf (nCount = 23); sHustleUser23 = sHustleUser; sHustlePassword23 = sHustlePassword;
            ElseIf (nCount = 24); sHustleUser24 = sHustleUser; sHustlePassword24 = sHustlePassword;
            ElseIf (nCount = 25); sHustleUser25 = sHustleUser; sHustlePassword25 = sHustlePassword;
            ElseIf (nCount = 26); sHustleUser26 = sHustleUser; sHustlePassword26 = sHustlePassword;
            ElseIf (nCount = 27); sHustleUser27 = sHustleUser; sHustlePassword27 = sHustlePassword;
            ElseIf (nCount = 28); sHustleUser28 = sHustleUser; sHustlePassword28 = sHustlePassword;
            ElseIf (nCount = 29); sHustleUser29 = sHustleUser; sHustlePassword29 = sHustlePassword;
            ElseIf (nCount = 30); sHustleUser30 = sHustleUser; sHustlePassword30 = sHustlePassword;
            Endif;
            nTotalHustleUser = nCount;
        Else;
            nCount = 10;
        Endif;
    Endif;
    nCount = nCount + 1;
End;

#######################################################################################
sSourceView = cProcessName | '.' | cTimeStamp | '.' | sRandomInt ;

cDimension = '}Cubes' ;
cDimArchiveID = 'Sys Archive ID' ;
cDimMeasure = 'M Sys Archive Profile' ;
cCube = 'Sys Archive Profile' ;
cElemArchiveID = pArchiveID ;

cProcessName1 = 'Sys.Archive.Clear Source Data by Sys Archive ID' ;

cParamName1 = 'pDoProcessLogging' ;
cParamName2 = 'pArchiveCube' ;
cParamName3 = 'pArchiveID' ;
cParamName4 = 'pRunBy' ;

cParamValue1 = 1 ;
cParamValue2 = '' ;
cParamValue3 = cElemArchiveID ;
cParamValue4 = sProcessRunBy ;

################################
#Validation

#Validate Sys Archive ID
IF( DIMIX( cDimArchiveID, cElemArchiveID ) = 0 );
    sError = 'Invalid Sys Archive ID :' | cElemArchiveID ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
ENDIF ;

If (nError <> 0);
    ProcessBreak();
Endif;   

################################
#Get Target TM1 Server information

sAdminHost = AttrS(cDimArchiveID, cElemArchiveID, 'Target Admin Host');
If (sAdminHost @= '');
    sAdminHost = cAdminHost;
Endif;

sTM1Server = AttrS(cDimArchiveID, cElemArchiveID, 'Target TM1 Server');
If (sTM1Server @= '');
    sTM1Server = cTM1Server;
Endif;

################################
#Create Source Subset

sMDX = '{ FILTER( {TM1SUBSETALL( [' | cDimension | '] )} , [' | cCube | '].( [' | cDimArchiveID | '].[' | cElemArchiveID | '], [' | cDimMeasure | '].[Archive Flag] ) = "✓"  ) }' ;

If (SubsetExists( cDimension, sSourceView ) <> 0);
    SubsetDestroy( cDimension, sSourceView );
Endif;
SubsetCreatebyMDX( sSourceView, sMDX, cDimension );
nElements = SubsetGetSize( cDimension, sSourceView );
sLastElement = SubsetGetElementName(cDimension, sSourceView, nElements);
SubsetElementDelete(cDimension, sSourceView, nElements);
SubsetElementInsert(cDimension, sSourceView, sLastElement, nElements);

nSubsetSize = SubsetGetSize( cDimension, sSourceView ) ;

################################
#Data Source Setup

DataSourceType = 'SUBSET' ;
DataSourceDimensionSubset = sSourceView ;
DataSourceNameForServer = cDimension ;
DataSourceNameForClient = cDimension ;

################################

################################
#Initiate Hustle User Variable
nCountUser = 1;

### End Prolog ###
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




##############################################################################################################
### End Metadata

574,52
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



sCub = vElem ;

cParamValue2 = sCub ;

###########################
#Process 1

sHustleUser = Expand('%sHustleUser' | NumberToStringEx(nCountUser, '00', '', '') | '%');
sHustlePassword = Expand('%sHustlePassword' | NumberToStringEx(nCountUser, '00', '', '') | '%');

sTM1RunTICommand = '"' | cTM1RunTI | '" ' |
                                               '-process "' | cProcessName1 | '" ' |
                                               '-adminhost "' | sAdminHost | '" ' |
                                               '-server "' | sTM1Server | '" ' |
                                               '-CAMNamespace "' | cCAMNamespace | '" ' |
                                               '-user "' | sHustleUser | '" ' |
                                               '-pwd "' | sHustlePassword | '" ' |
                                               cParamName1 | '=' | NumberToString(cParamValue1) | ' ' |
                                               cParamName2 | '="' | cParamValue2 | '" ' |
                                               cParamName3 | '="' | cParamValue3 | '" ' |
                                               cParamName4 | '=' | cParamValue4;

TextOutput(cHustleDefinitionFile, sTM1RunTICommand);

nCountUser = nCountUser + 1;
If (nCountUser > nTotalHustleUser);
    nCountUser = 1;
Endif;




##############################################################################################################
### END Data script

575,55
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
# Clear Temp Subsets and Views

ExecuteProcess('}bedrock.hier.sub.delete',
   'pLogOutput', 0,
   'pDim', cDimension,
   'pHier', cDimension,
   'pSub', sSourceView,
   'pDelim', '&',
   'pMode', 0
  );



######################
### Execute Hustle Call

ExecuteCommand ( cHustlePath | ' "' | cHustleDefinitionFile | '" ' | NumberToString(cHustleThread), 0);

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
