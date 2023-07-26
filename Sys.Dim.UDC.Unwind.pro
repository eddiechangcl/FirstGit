﻿601,100
602,"Sys.Dim.UDC.Unwind"
562,"SUBSET"
586,"Line Item"
585,"Line Item"
564,
565,"eJhtpaV;Hj3>GEN0yZ<9wXFm]7YM2Doffn@0141j?IeL43mt4P`[kAn07WZlbm[BbqxM@QPj:WLVOhksxN:Hn0qLev:OZJ5;]bDQpHE2r]Oj1X?f\Uyn9_9T@rOC;^2TojgdwBQF?b2Hwg@w8LRztk?NuWaRMpIk>cQ:r[ut4<6q7C2:oEp0jcJJOm=G;;ESWy7G[Vsd"
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
560,3
pDimension
pUDC
pDoProcessLogging
561,3
2
2
2
590,3
pDimension,"zTemp"
pUDC,"UDC01"
pDoProcessLogging,"1"
637,3
pDimension,"Source Dim to Unwind UDC"
pUDC,"UDC # to Create"
pDoProcessLogging,"Log to process logging cube"
577,1
vEl
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
572,158
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to update UDC - User Defined Consolidation
# 
# DATA SOURCE:
#    Sys Dimension UDC
#
# REMARK:
#    none
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2019-05-15  Lingo Wang          Apply the new UDC cube
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

### validation para ###

If (pUDC @= '' % pDimension @='');
     ProcessQuit;
Endif;


### Constants ###

cUDCDim = 'UDC';
cMeasureDim = 'M UDC';
cUDC = pUDC;
cMasterDim = pDimension ;
cTargetDim = pDimension;
cLineItemDefault = '0000';

cCube = 'Sys Dimension UDC';

cUDCCode = cUDC;
cUDCPrefix = '#' | SubSt (cUDCCode, 4,2);
cUDCRootEl = cUDCPrefix;
cAllUDCEl = 'All UDCs';
cUDCNotUsedElC = '#99 Not Used C';
cUDCNotUsedElN = '#99 Not Used N';

cView = '}TI_' | cProcessName | '_' | '_' | cUDC | '_' | NumberToString(Rand());
cSub = cView;



### Create root elements ###

If (DimIx(cTargetDim, cAllUDCEl) = 0);
     DimensionElementInsertDirect(cTargetDim, '', cAllUDCEl, 'C');
Endif;

If (DimIx(cTargetDim, cUDCNotUsedElC) = 0);
     DimensionElementInsertDirect(cTargetDim, '', cUDCNotUsedElC, 'C');
Endif;

If (ElisPar(cTargetDim, cAllUDCEl, cUDCNotUsedElC) = 0);
     DimensionElementComponentAddDirect(cTargetDim, cAllUDCEl, cUDCNotUsedElC, 1);
Endif;

If (DimIx(cTargetDim, cUDCNotUsedElN) = 0);
     DimensionElementInsertDirect(cTargetDim, '', cUDCNotUsedElN, 'C');
Endif;

If (ElisPar(cTargetDim, cAllUDCEl, cUDCNotUsedElN) = 0);
     DimensionElementComponentAddDirect(cTargetDim, cAllUDCEl, cUDCNotUsedElN, 1);
Endif;


### create the source view ###
cDim = cTargetDim ;
If (SubsetExists(cDim, cSub) <> 0);
     SubsetDestroy(cDim, cSub);
Endif;

sSortingMDX = '{TM1DRILLDOWNMEMBER( {[' | cTargetDim | '].[' | cUDCRootEl | ']}, ALL, RECURSIVE )}';

sProcess = '}bedrock.hier.sub.create.bymdx';
sParam1Name = 'pDim';
sParam1Value = cDim ;
sParam2Name = 'pHier';
sParam2Value = cDim ;
sParam3Name = 'pSub';
sParam3Value = cSub;
sParam4Name = 'pMDXExpr';
sParam4Value = sSortingMDX;
nParam5Name = 'pConvertToStatic';
nParam5Value = 1;
nParam6Name = 'pTemp';
nParam6Value = 1;

ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value, sParam3Name, sParam3Value, sParam4Name, sParam4Value, nParam5Name, nParam5Value, nParam6Name, nParam6Value);



DatasourceNameForServer = cDim ;
DatasourceNameForClient = cDim;
DataSourceType='SUBSET';
DatasourceDimensionSubset = cSub;



573,47
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

nElLevel = AttrN(cTargetDim, vEl, 'UDC Level');
nElGen = AttrN(cTargetDim, vEl, 'UDC Gen');
sElDesc = AttrS(cTargetDim, vEl, 'UDC Desc');


### TEST if the Element is belong to UDC or not

If(Subst(vEl, 1, LONG(cUDCRootEl)) @<> cUDCRootEl);
  Itemskip;
Endif;


If( vEl @= cUDCRootEl % (DType( cTargetDim, vEl) @= 'C' & ElCompN(cTargetDim, vEl ) > 0 & nElLevel > 0));
  nChildren = ElCompN( cTargetDim, vEl);
  While( nChildren > 0 );
    sChild = ElComp( cTargetDim, vEl, nChildren );
    DimensionElementComponentDelete(cTargetDim, vEl, sChild);
    nChildren = nChildren - 1;
  End;
EndIf;

If( vEl @<> cUDCRootEl);
  If (nElLevel = 0);
    DimensionElementComponentAdd(cTargetDim, cUDCNotUsedElN, vEl, 1);
  Else;
    DimensionElementComponentAdd(cTargetDim, cUDCNotUsedElC, vEl, 1);
  Endif;
Endif;




574,21
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

575,49
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




If (SubsetExists( cDim , cSub) <> 0);
  SubsetDestroy( cDim , cSub);
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
