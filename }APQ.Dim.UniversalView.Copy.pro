601,100
602,"}APQ.Dim.UniversalView.Copy"
562,"NULL"
586,
585,
564,
565,"n\Bu06Z?Nf<5j\ayb5fdwmAPH<mAb4nRE`Jn?G8^FeKRyCZtxMVBn:3gsGz`P58PbRi_>\rwIocvl]Gq\PDEtZJewcGlRQNFb_>1VySZ@Re2odZ^g=^ErTG^^c7W;Gt1]O9Yo:>c@Qq;_QbiKyVOTmAPDwXY;iTfBI_?IOtiVDp_iAI?1OG5STnv<TRuPCFIYS<ESyG="
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
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,3
pDoProcessLogging
pViewSrc
pViewTgt
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pViewSrc,""
pViewTgt,""
637,3
pDoProcessLogging,"Record in process log"
pViewSrc,"Source View"
pViewTgt,"Target View"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,146
##############################################################################################################
#Region Header
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	    COMMENT
### 2019-05-20 		    MMastrolonardo 	Convert from Apliqo FPM to Framework
##############################################################################################################
#Region @DOC
# Description:
# This process is intended to be used by power user or admin setting up and configuring views to copy settings from one view to another
# to cut down on the amount of manual data entry or copy & paste..
# 
# Data Source: }APQ Universal View Dimension Mapping
# 
# Use Case: 
# Reduce manual data entry.
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName(); sProcLogParams = '';
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
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');nCountTime=nCountTime+1;If(sProcLogParams@<>'');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');EndIf;End;
  If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Initialize Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

### Prolog script

### Inits - declare constants

cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;

cCubViewMap     = '}APQ Universal View Source Mapping';
cCubSrc         = '}APQ Universal View Dimension Mapping';
cCubTgt         = cCubSrc;
cDimView        = '}APQ Universal View';

sEntry          = CellGetS( cCubViewMap, pViewSrc, 'CubeEntry' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'CubeEntry' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'CubeEntry' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'CubeOverride' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'CubeOverride' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'CubeOverride' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'EnforceSecurityEntry' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'EnforceSecurityEntry' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'EnforceSecurityEntry' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'EnforceSecurityOverride' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'EnforceSecurityOverride' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'EnforceSecurityOverride' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'DefaultFormatEntry' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'DefaultFormatEntry' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'DefaultFormatEntry' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'DefaultFormatOverride' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'DefaultFormatOverride' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'DefaultFormatOverride' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'FormatDimEntry' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'FormatDimEntry' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'FormatDimEntry' );
EndIF;

sEntry = CellGetS( cCubViewMap, pViewSrc, 'FormatDimOverride' );
IF( CellIsUpdateable( cCubViewMap, pViewTgt, 'FormatDimOverride' ) = 1 );
    CellPutS( sEntry, cCubViewMap, pViewTgt, 'FormatDimOverride' );
EndIF;


sEleMapping     = cDimView | sDelimEleStart | pViewSrc | '->' | pViewTgt;
sProc           = '}bedrock.cube.data.copy';
ExecuteProcess( sProc, 'pLogOutput', nDebug,
    'pCube', cCubTgt, 'pEleMapping', sEleMapping, 'pMappingDelim', '->',
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pSuppressRules', 1, 'pZeroTarget', 1, 'pZeroSource', 0,
    'pTemp', cBedrockTmp
);

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,28
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region - Finalize Logging
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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
#EndRegion - Finalize Logging
##########################################
### END Epilog
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
