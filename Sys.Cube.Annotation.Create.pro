601,100
602,"Sys.Cube.Annotation.Create"
562,"NULL"
586,
585,
564,
565,"qOtdG;=ixLtSdXzQYa2Jj<jqqKYfQw?aR_kF<UciafEvpW^54s?H<mD=:^JP\HpPHO=`PJZYIEjitJODfj:AdtZT7VqZ]j1aDDVS[odQlTo8PXAOnPbCEZ?U<dlrS;vrwBOL;CmFy8aNnCx]O<ual<BK`?6`[NPEV]D]8;FAs`eqrcmaLm4FWG[YjzKw]ox??TONq8[f"
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
560,3
pDoProcessLogging
pMeasureAnnotation
pCube
561,3
2
2
2
590,3
pDoProcessLogging,"0"
pMeasureAnnotation,"M Annotation"
pCube,""
637,3
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pMeasureAnnotation,"Annotation Measure:"
pCube,"Cube:"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,195
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


cMeasureDim = pMeasureAnnotation;
cCube = pCube;
cCubeAnnotation = cCube | ' Annotation';

If (DimIx('}Dimensions', cMeasureDim) = 0);
    AsciiOutput(sDebugFile, 'Dimension: ' | cMeasureDim | ' not found.');
    ProcessQuit();
Endif;

If (CubeExists(cCube) = 0);
    AsciiOutput(sDebugFile, 'Cube: ' | cCube | ' not found.');
    ProcessQuit();
Endif;

If (CubeExists(cCubeAnnotation) = 1);
    AsciiOutput(sDebugFile, 'Annotation Cube: ' | cCubeAnnotation | ' already been created.');
    ProcessQuit();
Endif;

nDim = 0;
nAll = 256;
nCount = 1;
While (nCount <= nAll);
    sDim = TabDim (cCube, nCount);
    If (sDim @= '');
        nDim = nCount - 1;
        nCount = nAll;
    Endif;
    nCount = nCount + 1;
End;

asciioutput('c:\test.txt', numbertostring(ndim));

If (nDim = 2);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), cMeasureDim);
ElseIf (nDim = 3);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), cMeasureDim);
ElseIf (nDim = 4);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), cMeasureDim);
ElseIf (nDim = 5);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), cMeasureDim);
ElseIf (nDim = 6);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), cMeasureDim);
ElseIf (nDim = 7);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), cMeasureDim);
ElseIf (nDim = 8);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), cMeasureDim);
ElseIf (nDim = 9);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), cMeasureDim);
ElseIf (nDim = 10);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), cMeasureDim);
ElseIf (nDim = 11);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), cMeasureDim);
ElseIf (nDim = 12);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), cMeasureDim);
ElseIf (nDim = 13);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), cMeasureDim);
ElseIf (nDim = 14);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), cMeasureDim);
ElseIf (nDim = 15);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), cMeasureDim);
ElseIf (nDim = 16);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), cMeasureDim);
ElseIf (nDim = 17);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), cMeasureDim);
ElseIf (nDim = 18);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), cMeasureDim);
ElseIf (nDim = 19);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), cMeasureDim);
ElseIf (nDim = 20);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), TabDim(cCube, 20), cMeasureDim);
ElseIf (nDim = 21);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), TabDim(cCube, 20), TabDim(cCube, 21), cMeasureDim);
ElseIf (nDim = 22);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), TabDim(cCube, 20), TabDim(cCube, 21), TabDim(cCube, 22), cMeasureDim);
ElseIf (nDim = 23);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), TabDim(cCube, 20), TabDim(cCube, 21), TabDim(cCube, 22), TabDim(cCube, 23), cMeasureDim);
ElseIf (nDim = 24);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), TabDim(cCube, 20), TabDim(cCube, 21), TabDim(cCube, 22), TabDim(cCube, 23), TabDim(cCube, 24), cMeasureDim);
ElseIf (nDim = 25);
    CubeCreate(cCubeAnnotation, TabDim(cCube, 1), TabDim(cCube, 2), TabDim(cCube, 3), TabDim(cCube, 4), TabDim(cCube, 5), TabDim(cCube, 6), 
                                                     TabDim(cCube, 7), TabDim(cCube, 8), TabDim(cCube, 9), TabDim(cCube, 10), TabDim(cCube, 11), TabDim(cCube, 12), 
                                                     TabDim(cCube, 13), TabDim(cCube, 14), TabDim(cCube, 15), TabDim(cCube, 16), TabDim(cCube, 17), TabDim(cCube, 18), 
                                                     TabDim(cCube, 19), TabDim(cCube, 20), TabDim(cCube, 21), TabDim(cCube, 22), TabDim(cCube, 23), TabDim(cCube, 24), 
                                                     TabDim(cCube, 25), cMeasureDim);
Endif;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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
