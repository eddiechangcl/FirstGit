601,100
602,"Sys.Dim.Hierarchies.Copy.From Another Dimension"
562,"SUBSET"
586,"Account"
585,"Account"
564,
565,"qC7G_IIn0R=n1pP7MaLuxJlJUwTf]a>VEId;nZwk4eFtjAM1VEhmhwE6qD9ic6tYNkCN3i`oIDFwvVfvV>q5c4ZnLdNYkwEIh<Q0RfoG<r_bUO>TQ2Rv<MLS@VB:UMH9i8w^YZTGDxTJhZT<9zPojj0nx>bXe^ot@P1SMvLV^p1LWp?`kga4@lC;G_=8@iSb3V5D6J^x"
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
571,All
569,0
592,0
599,1000
560,7
pDoProcessLogging
pSourceDim
pSourceNode
pTargetDim
pTargetNode
pUnwindTargetToLevel1
pOnlyCLevel
561,7
2
2
2
2
2
1
1
590,7
pDoProcessLogging,"0"
pSourceDim,""
pSourceNode,""
pTargetDim,""
pTargetNode,""
pUnwindTargetToLevel1,1
pOnlyCLevel,0
637,7
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pSourceDim,"Source Dim:"
pSourceNode,"Source Node:"
pTargetDim,"Target Dim:"
pTargetNode,"Target Node:"
pUnwindTargetToLevel1,"Unwind Target Node until Level 1: (1=Yes, 0=No)"
pOnlyCLevel,"Only C Level Element Gets Copied: (1=Yes, 0=No)"
577,1
vElement
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
572,112
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


cDimSource = pSourceDim;
cNodeSource = pSourceNode;
cDimTarget = pTargetDim;
cNodeTarget = pTargetNode;
cUnwindTargetToLevel1= pUnwindTargetToLevel1;
cOnlyCLevel = pOnlyCLevel;

#Define Temporary Object Name, and Check if the view already exists
cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
While (SubsetExists(cDimSource, cTempName) <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;
cSub = cTempName;
                                           
sDim = cDimSource; sElementConsolidated = cNodeSource;
sMDX = '{Descendants({[' | sDim | '].[' | sElementConsolidated | ']})}';
If (SubsetExists(sDim, cSub) <> 0);
  SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim, 1);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);

sProcess = 'Sys.Dim.Hierarchy.Unwind.Consolidation.Until Level 1';
sParam1Name = 'pDimension';
sParam1Value = cDimTarget;
sParam2Name = 'pConsol';
sParam2Value = cNodeTarget;
nParam3Name = 'pRecursive';
nParam3Value = cUnwindTargetToLevel1;
ExecuteProcess ( sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value,
                                             nParam3Name, nParam3Value);

DatasourceNameForServer = cDimSource;
DatasourceNameForClient = cDimSource;
DatasourceType='SUBSET';
DatasourceCubeView = cSub;
573,58
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

If (cOnlyCLevel = 1);
    If (ElLev(cDimSource, vElement) = 0);
        If (DimIx(cDimTarget, vElement) = 0);
            ItemSkip;
        Endif;
    Endif;
Endif;

If (DimIx(cDimTarget, vElement) = 0);
    DimensionElementInsert(cDimTarget, '', vElement, 'C');
Endif;

If (vElement @= cNodeSource);
    ItemSkip;
Endif;

sElType = DType( cDimSource, vElement );

If (sElType @= 'C' & ElCompN(cDimSource, vElement) > 0);
    nChildren = ElCompN(cDimSource, vElement);
    nCount = 1;
    While (nCount <= nChildren);
       sChildElement = ElComp(cDimSource, vElement, nCount);
       sChildWeight = ElWeight(cDimSource, vElement, sChildElement);
       If (cOnlyCLevel = 1);
           If (DimIx(cDimTarget, sChildElement) <> 0);
               DimensionElementComponentAdd(cDimTarget, vElement, sChildElement, sChildWeight);
           Endif;
       Else;
           DimensionElementComponentAdd(cDimTarget, vElement, sChildElement, sChildWeight);
       Endif;
       nCount = nCount + 1;
    End;
Endif;

If (ElisPar(cDimSource, cNodeSource, vElement) <> 0);
    If (DimIx(cDimTarget, vElement) = 0);
        ItemSkip;
    Endif;
    nNodeWeight = ElWeight(cDimSource, cNodeSource, vElement);
    DimensionElementComponentAdd(cDimTarget, cNodeTarget, vElement, nNodeWeight);
Endif;

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
575,41
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
