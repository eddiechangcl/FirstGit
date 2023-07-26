601,100
602,"Sys.Dim.UDC.Update"
562,"SUBSET"
586,"Line Item"
585,"Line Item"
564,
565,"v3uRCmFV5WiJXFnOpgQ2x[arlQ]Fyb\1FOMuQsT=Wp9DvqI>_Pj@C8tNCJMUXCJYLDsqM4Y18\K2GGn1_4QCFEuIWm0LFARF43kysvbv:ng4PzoflX^oU;upilJGIgdBYF\odrYAmiDsPp>fvTyBF_p@RDCheNcICz8yUp5>90SO_62iVa<T8NM]ct7EW?DGHC_erjW@"
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
560,5
pDimension
pDimensionCopy
pUDC
pCreateNewChild
pDoProcessLogging
561,5
2
2
2
2
2
590,5
pDimension,"Demo Product"
pDimensionCopy,""
pUDC,"UDC01"
pCreateNewChild,"0"
pDoProcessLogging,"1"
637,5
pDimension,"Source Dim to Create UDC"
pDimensionCopy,"Target Dim to Create UDC (blank=Source Dim) - OPTIONAL"
pUDC,"UDC # to Create"
pCreateNewChild,"Create new Bottom Level Elment when it doesn't exit (0=No, 1=Yes)"
pDoProcessLogging,"Log to process logging cube"
577,1
vLineItem
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
572,180
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

cProcess = cProcessName;

### validation para ###

If (pUDC @= '' % pDimension @='');
     ProcessQuit;
Endif;

If (pDimensionCopy @= '');
     pDimensionCOpy = pDimension;
Endif;

### Constants ###

cUDCDim = 'UDC';
cMeasureDim = 'M UDC';
cUDC = pUDC;
cMasterDim = pDimension ;
cTargetDim = pDimensionCopy;
cLineItemDefault = '0000';

cCube = 'Sys Dimension UDC';

cUDCCode = cUDC;
cUDCPrefix = '#' | SubSt (cUDCCode, 4,2);
cUDCRootDesc = CellGetS(cCube, cMasterDim, cUDCCode, cLineItemDefault, 'Root Desc');
cUDCRootEl = cUDCPrefix;
cAllUDCEl = 'All UDCs';
cUDCNotUsedElC = '#99 Not Used C';
cUDCNotUsedElN = '#99 Not Used N';

cView = '}TI_' | cProcess | '_' | '_' | cUDC | '_' | NumberToString(Rand());
cSub = cView;

### Create Target Dim ###
If (DimensionExists(cTargetDim) = 0);
    DimensionCreate(cTargetDim);
Endif;


### Create root elements ###

If (DimIx(cTargetDim, cAllUDCEl) = 0);
     DimensionElementInsertDirect(cTargetDim, '', cAllUDCEl, 'C');
Endif;


### Create UDC attributes ###
sAttrName = 'UDC Desc';
If (DimIx('}ElementAttributes_' | cTargetDim, sAttrName) = 0);
      AttrInsert( cTargetDim, '', sAttrName, 'S');
Endif;

sAttrName = 'UDC Level';
If (DimIx('}ElementAttributes_' | cTargetDim, sAttrName) = 0);
      AttrInsert( cTargetDim, '', sAttrName, 'N');
Endif;

sAttrName = 'UDC Gen';
If (DimIx('}ElementAttributes_' | cTargetDim, sAttrName) = 0);
      AttrInsert( cTargetDim, '', sAttrName, 'N');
Endif;


### create the source view ###
cDim = 'Line Item' ;
If (SubsetExists(cDim, cSub) <> 0);
     SubsetDestroy(cDim, cSub);
Endif;

sSortingMDX = '{ORDER(FILTER ({[Line Item].[All Line Items].Children},[' | cCube | '].('
                  | '[UDC Dimension].[' | cMasterDim | '],[UDC].[' | cUDCCode | ']'
                  | ',[M UDC].[Sorting ID]) <>""), [' | cCube | '].('
                  | '[UDC Dimension].[' | cMasterDim | '],[UDC].[' | cUDCCode | '],[M UDC].[Sorting ID]), BASC)}';
                  

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

### Check if UDC is not empty ###
nSubsetSize = SubsetGetSize(cDim, cSub);
If (nSubsetSize = 0);
     ProcessBreak;
EndIf;

### Create UDC Root elements ###
If (DimIx(cTargetDim, cUDCRootEl) = 0);
     DimensionElementInsertDirect(cTargetDim, '', cUDCRootEl, 'C');
Endif;

If (ElisPar(cTargetDim, cAllUDCEl, cUDCRootEl) = 0);
     DimensionElementComponentAddDirect(cTargetDim, cAllUDCEl, cUDCRootEl, 1);
Endif;


DatasourceNameForServer = cDim ;
573,250
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


sChild = DimensionElementPrincipalName(cMasterDim, CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'C1'));
sChildDesc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'C1 Desc');
IF (sChildDesc @='');
    sChildDesc = sChild;
Endif;

nChildWeight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'C1W'));

sParent1 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P1');
sParent2 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P2');
sParent3 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P3');
sParent4 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P4');
sParent5 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P5');
sParent6 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P6');
sParent7 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P7');
sParent8 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P8');
sParent9 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P9');

nParent1Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P1W'));
nParent2Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P2W'));
nParent3Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P3W'));
nParent4Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P4W'));
nParent5Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P5W'));
nParent6Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P6W'));
nParent7Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P7W'));
nParent8Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P8W'));
nParent9Weight = StringToNumber(CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P9W'));

#############################################################################
#
# Create Child Element in Dimension If Need
#
#############################################################################

If (pCreateNewChild @= '1');
  IF (sChild @= '' & sChildDesc @<>'');
      If (DimIx(cTargetDim, sChildDesc) = 0);
         DimensionElementInsert(cTargetDim, '', sChild, 'N');
      Endif;
  Endif;    
Endif;

#############################################################################
#
# Create Element in Dimension
# Add Child to Parent, skip the empty Parent in the middle
#
#############################################################################

If (sChild @<>'' & DimIx(cTargetDim, sChild) > 0);

      sCurChild = sChild;
      sCurChildDesc = sChildDesc;
      nCurChildWeight = nChildWeight;
      
      
      If (sParent1 @<> '');
          If (DimIx(cTargetDim, sParent1) = 0);
               DimensionElementInsert(cTargetDim, '', sParent1, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent1, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent1;
          nCurChildWeight = nParent1Weight;
           
      Endif;
      


      
      If (sParent2 @<> '');
          If (DimIx(cTargetDim, sParent2) = 0);
               DimensionElementInsert(cTargetDim, '', sParent2, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent2, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent2;
          nCurChildWeight = nParent2Weight;
           
      Endif;

      If (sParent3 @<> '');
          If (DimIx(cTargetDim, sParent3) = 0);
               DimensionElementInsert(cTargetDim, '', sParent3, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent3, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent3;
          nCurChildWeight = nParent3Weight;
           
      Endif;
      
      If (sParent4 @<> '');
          If (DimIx(cTargetDim, sParent4) = 0);
               DimensionElementInsert(cTargetDim, '', sParent4, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent4, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent4;
          nCurChildWeight = nParent4Weight;
           
      Endif;

      If (sParent5 @<> '');
          If (DimIx(cTargetDim, sParent5) = 0);
               DimensionElementInsert(cTargetDim, '', sParent5, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent5, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent5;
          nCurChildWeight = nParent5Weight;
           
      Endif;

      If (sParent6 @<> '');
          If (DimIx(cTargetDim, sParent6) = 0);
               DimensionElementInsert(cTargetDim, '', sParent6, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent6, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent6;
          nCurChildWeight = nParent6Weight;
           
      Endif;

      If (sParent7 @<> '');
          If (DimIx(cTargetDim, sParent7) = 0);
               DimensionElementInsert(cTargetDim, '', sParent7, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent7, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;

          sCurChild = sParent7;
          nCurChildWeight = nParent7Weight;
           
      Endif;

      If (sParent8 @<> '');
          If (DimIx(cTargetDim, sParent8) = 0);
               DimensionElementInsert(cTargetDim, '', sParent8, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent8, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent8;
          nCurChildWeight = nParent8Weight;
           
      Endif;

      If (sParent9 @<> '');
          If (DimIx(cTargetDim, sParent9) = 0);
               DimensionElementInsert(cTargetDim, '', sParent9, 'N');
          Endif;
          DimensionElementComponentAdd(cTargetDim, sParent9, sCurChild, nCurChildWeight);
          
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
      
          sCurChild = sParent9;
          nCurChildWeight = nParent9Weight;
           
      Endif;
      
      DimensionElementComponentAdd(cTargetDim, cUDCRootEl, sCurChild, nCurChildWeight);
      
          If (ElisPar(cTargetDim, cUDCNotUsedElN, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElN, sCurChild);
          Endif;
          If (ElisPar(cTargetDim, cUDCNotUsedElC, sCurChild) = 1);
              DimensionElementComponentDelete(cTargetDim, cUDCNotUsedElC, sCurChild);
          Endif;
          
          
Endif;


574,224
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




sChild = DimensionElementPrincipalName(cMasterDim, CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'C1'));
sChildDesc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'C1 Desc');
IF (sChildDesc @='');
    sChildDesc = sChild;
Endif;

sParent1 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P1');
sParent2 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P2');
sParent3 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P3');
sParent4 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P4');
sParent5 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P5');
sParent6 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P6');
sParent7 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P7');
sParent8 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P8');
sParent9 = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P9');

sParent1Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P1 Desc');
sParent2Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P2 Desc');
sParent3Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P3 Desc');
sParent4Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P4 Desc');
sParent5Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P5 Desc');
sParent6Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P6 Desc');
sParent7Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P7 Desc');
sParent8Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P8 Desc');
sParent9Desc = CellGetS(cCube, cMasterDim, cUDC, vLineItem , 'P9 Desc');

nParent1Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P1 Level');
nParent2Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P2 Level');
nParent3Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P3 Level');
nParent4Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P4 Level');
nParent5Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P5 Level');
nParent6Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P6 Level');
nParent7Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P7 Level');
nParent8Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P8 Level');
nParent9Lev = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P9 Level');

nParent1Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P1 Gen');
nParent2Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P2 Gen');
nParent3Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P3 Gen');
nParent4Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P4 Gen');
nParent5Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P5 Gen');
nParent6Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P6 Gen');
nParent7Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P7 Gen');
nParent8Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P8 Gen');
nParent9Gen = CellGetN(cCube, cMasterDim, cUDC, vLineItem , 'P9 Gen');

#############################################################################
#
# Create Element in Dimension
# Add Child to Parent, skip the empty Parent in the middle
#
#############################################################################

If (sChild @<> '');

      sAttr = 'UDC Desc';
      AttrPutS(sChildDesc, cTargetDim, sChild, sAttr);
      
      sAttr = 'UDC Level';
      AttrPutN(0, cTargetDim, sChild, sAttr);
      
      sAttr = 'UDC Gen';
      AttrPutN(nParent1Gen + 1, cTargetDim, sChild, sAttr);
Endif;      
      
If (sParent1 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent1Desc, cTargetDim, sParent1, sAttr);
      
    sAttr = 'UDC Level';
    nOriParentLev = AttrN(cTargetDim, sParent1, sAttr);
    If (nParent1Lev > nOriParentLev); 
        AttrPutN(nParent1Lev, cTargetDim, sParent1, sAttr);
    Endif;
    
    sAttr = 'UDC Gen';
    AttrPutN(nParent1Gen, cTargetDim, sParent1, sAttr);

Endif;
      
If (sParent2 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent2Desc, cTargetDim, sParent2, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent2, sAttr);
    If (nParent2Lev > nOriParentLev); 
        AttrPutN(nParent2Lev, cTargetDim, sParent2, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent2Gen, cTargetDim, sParent2, sAttr);
    
Endif;

If (sParent3 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent3Desc, cTargetDim, sParent3, sAttr);

    sAttr = 'UDC Level';      
    nOriParentLev = AttrN( cTargetDim, sParent3, sAttr);
    If (nParent3Lev > nOriParentLev); 
        AttrPutN(nParent3Lev, cTargetDim, sParent3, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent3Gen, cTargetDim, sParent3, sAttr);
    
Endif;
      
If (sParent4 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent4Desc, cTargetDim, sParent4, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent4, sAttr);
    If (nParent4Lev > nOriParentLev); 
        AttrPutN(nParent4Lev, cTargetDim, sParent4, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent4Gen, cTargetDim, sParent4, sAttr);
    
Endif;

If (sParent5 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent5Desc, cTargetDim, sParent5, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent5, sAttr);
    If (nParent5Lev > nOriParentLev); 
        AttrPutN(nParent5Lev, cTargetDim, sParent5, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent5Gen, cTargetDim, sParent5, sAttr);

Endif;

If (sParent6 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent6Desc, cTargetDim, sParent6, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent6, sAttr);
    If (nParent6Lev > nOriParentLev); 
        AttrPutN(nParent6Lev, cTargetDim, sParent6, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent6Gen, cTargetDim, sParent6, sAttr);
    
Endif;

If (sParent7 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent7Desc, cTargetDim, sParent7, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent7, sAttr);
    If (nParent7Lev > nOriParentLev); 
        AttrPutN(nParent7Lev, cTargetDim, sParent7, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent7Gen, cTargetDim, sParent7, sAttr);
    
Endif;

If (sParent8 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent8Desc, cTargetDim, sParent8, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent8, sAttr);
    If (nParent8Lev > nOriParentLev); 
        AttrPutN(nParent8Lev, cTargetDim, sParent8, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent8Gen, cTargetDim, sParent8, sAttr);

Endif;

If (sParent9 @<> '');
    sAttr = 'UDC Desc';
    AttrPutS(sParent9Desc, cTargetDim, sParent9, sAttr);
      
    sAttr = 'UDC Level';      
    nOriParentLev = AttrN(cTargetDim, sParent9, sAttr);
    If (nParent9Lev > nOriParentLev); 
        AttrPutN(nParent2Lev, cTargetDim, sParent9, sAttr);
    Endif;
      
    sAttr = 'UDC Gen';
    AttrPutN(nParent9Gen, cTargetDim, sParent9, sAttr);

Endif;





##############################################################################################################
### END Data script
575,65
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

If (DimIx(cTargetDim, cUDCRootEl) > 0);
     AttrPutS(cUDCRootDesc, cTargetDim, cUDCRootEl, 'UDC Desc');
Endif;

### update the RootEl Attr

      If (sParent1 @<> '');
          sAttr = 'UDC Desc';
          AttrPutS(sParent1Desc, cTargetDim, sParent1, sAttr);
            
          sAttr = 'UDC Level';
          AttrPutN(nParent1Lev, cTargetDim, sParent1, sAttr);
            
          sAttr = 'UDC Gen';
          AttrPutN(nParent1Gen, cTargetDim, sParent1, sAttr);

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
1217,0
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
