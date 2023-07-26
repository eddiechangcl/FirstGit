601,100
602,"Sys.Archive.View.Clone All"
562,"NULL"
586,"D:\DBs\HOI\Data\Sys Parameter}vues\All.vue"
585,"D:\DBs\HOI\Data\Sys Parameter}vues\All.vue"
564,
565,"gPmyt`szrt]M4rPb:NU:Q495F4AJ9eMAzg4LG[F?kFD?wfC8<v55NKT5P1i9OFgKHrIV3jCT_jeCKZGPWqLiFh<BgZXf8H6^eGXhWpt=EY=O9xDh3]Gk3Iq]Ki=pqa==IG>HMGgdUJxWRLBHUrPJ<o0HAYD6BzYcgTl=G47sUha3b|KN1Sk;EeyU3LTi6tw>6CoLwALjgPmyt`szrt]M4rPb:NU:Q495F4AJ9eMQug4LG[F?kFD?wvH8<v55NKT5PA54OF7AHrIV0jCT_jeLKJCPWqLiFh<BgZHf8H6^eGXhXpt=EY=O9xd\6]Gk3Iq]Ki=p!_9=I79x@GgdUJxwSLB8SrP:1o0HAYD6BzYcgTL;G4GtUha3BKN1Sk;EevU3LTi6D~N5CoLwALjgPmyt`szrt]M4rPb:NU:Q495F4AJ9eMasg4LG[F?kFD?wVI8<v55NKT5Pa<8OFGNHrIV5jCT_jEAKJOPWqLiFh<BgZhm8H6^eGXXZpt=EY=O9xt96]Gk3Iq]Ki=pab;=Iw:HAGgdUJx7PLBHUrPJ4o0HAYD6BzYcgTl=G47xUha3B~KN1Sk;EUwU3LTi6d|N;CoLwALjgPmyt`szrt]M4rPb:NU:Q495F4AJ9eM1rg4LG[F?kFD?w6G8<v55NKT5Pai;OFWJHrI&?jCT_jU@KJNPWqLiFh<BgZXe8H6^eGX(_pt=EY=O9xdy6]Gk3Iq]Ki=pAL<=Iw2XCGgdUJxgTLBxUrPZ8o0HAYD6BzYcgTl6G47vUha3BuKN1Sk;EEzU3LTi6tz>0CoLwALjgPmyt`sirt]M4rPb:NU:Q495F4AJ9eMazg4LG[F?kFD?wVH8<v55NKT5Pq]=OFgCHrIf;jCT_jeBKJFPWqLiFh<BgZ8m8H6^eGXxRpt=EY=O9xTH3]Gk3Iq]Ki=p1N7=IW7xFGgdUJxWVLBXTrPZ;o0HAYD6BzYcgTl1G4wpUha3bxKN1Sk;EezU3LTi6Tq>2CoLwALj"
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
567,"	"
588,"."
589,","
568,""
570,
571,
569,0
592,0
599,1000
560,3
pDoProcessLogging
pSourceCube
pArchiveID
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pSourceCube,"Retail Sales Demand FCST"
pArchiveID,"20170720_001"
637,3
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pSourceCube,"Input Source Cube:"
pArchiveID,"Input Archive ID:"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,145
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

#######################################################################
#Constant

cCubeConfig = 'Sys Archive Parameter';

cSourceCube = pSourceCube;
cDimArchiveID = 'Sys Archive ID' ;
cElemArchiveID = pArchiveID ;

cDataFolder = CellGetS( cCubeConfig, 'TM1 Data Directory', 'Text' ) ;
IF (SUBST(cDataFolder, Long(cDataFolder), 1) @= '\'); cDataFolder = SubSt(cDataFolder, 1, Long(cDataFolder) - 1); ENDIF;
cViewFolder = cDataFolder | '\' | cSourceCube | '}vues\' ;
cSourceFilePath = cViewFolder | '*.vue' ;

cOutputFile = GetProcessErrorFileDirectory | cProcessName | cTimeStamp | sRandomInt | '-DEBUG.Log' ;

cProcessCloneView = 'Sys.Archive.View.Clone' ;

#######################################################################
#### Validation

#Source Cube
If ( CubeExists( cSourceCube ) = 0 );
       sError = 'Source Cube ' | cSourceCube | ' does not exist! ';
       AsciiOutput(sDebugFile, sError);
       If (sErr @= '');
           sErr = sErr | Char(10) | Char(13);
       Endif;
       sErr = sErr | sError;
       nError = 1;
Endif;

If (nError <> 0);
    ProcessBreak();
Endif;

#Sys Archive ID
If ( DIMIX( cDimArchiveID, cElemArchiveID )= 0 );
       sError = 'Invalid ArchiveID:  ' | cElemArchiveID ;
       AsciiOutput(sDebugFile, sError);
       If (sErr @= '');
           sErr = sErr | Char(10) | Char(13);
       Endif;
       sErr = sErr | sError;
       nError = 1;
Endif;

If (nError <> 0);
    ProcessBreak();
Endif;

#######################################################################
#Loop all views under Vues folder for source cube

sTempLoopFilePath = cSourceFilePath ;
sTempCurrentFilePath = '' ;
sTempLastFilePath = '' ;
nLoopStopFlag = 0 ;

WHILE( nLoopStopFlag = 0 );
    sTempCurrentFilePath = WildcardFileSearch( sTempLoopFilePath, sTempLastFilePath );
    sTempLastFilePath = sTempCurrentFilePath ;
    IF( sTempCurrentFilePath @= '' );
        nLoopStopFlag = 1 ;
    ELSE;
       sTempViewName = SUBST( sTempCurrentFilePath, 1, SCAN( '.vue', sTempCurrentFilePath ) - 1 );
       #AsciiOutput(cOutputFile, sTempViewName);
       IF( ViewExists( pSourceCube, sTempViewName ) = 1 );
           ExecuteProcess( cProcessCloneView, 'pDoProcessLogging', 1, 'pSourceCube', pSourceCube, 'pArchiveID', pArchiveID, 'pSourceView', sTempViewName );
       ENDIF;
    ENDIF;
END;

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
575,39
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
