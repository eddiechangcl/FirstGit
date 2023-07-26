601,100
602,"Sys.Menu.Dim.Sys Menu Application Entry.Update from }ApplicationEntries"
562,"SUBSET"
586,"}ApplicationEntries"
585,"}ApplicationEntries"
564,
565,"rDS`bi9SID_<L2s=OuaiXt7w]sO7W;Ee:zS\mY2AUmV3]SH46YfXPYzCWas7h6L82f\f7RC4xQruNrX_10ZpTURB2;SU\Q35Sa>jD^dxfx]Z8jE6ZS2Q4x2^kJc8qGOYz7\@45F`QRicxM:mMpy>eR<YtgHR7lc4rALGHPMi^ZLsWeL1`d8s2Hr623uYK=8YM98OYgEl"
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
pDoProcessLogging
pDebug
pDeleteAllElements
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pDebug,"0"
pDeleteAllElements,"1"
637,3
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pDebug,"Write debug log file?"
pDeleteAllElements,"Remove ALL elements from the dimension?"
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
572,144
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to update Sys Parameter info from tm1s.cfg file
# 
# DATA SOURCE:
#    none
#
# REMARK:
#    Reading "tm1s.cfg Location" path from Sys Parameter Cube, if path parameter is empty.
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2016-12-09  Tat Seng Wong       Create
#   2018-02-19  Lingo Wang          Apply }APQ Logging
#   2019-07-09  Tat Seng Wong       Upgrade to }Bedrock 4
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

cCube = 'Sys Menu Application Entry';

cDimSource = '}ApplicationEntries';
cDimTarget = 'Sys Menu Application Entry';
cDimAttribute = '}ElementAttributes_' | cDimSource;

cAttr = 1;

############################################
###  INITIALIZE TARGET DIMENSION

If (DimensionExists(cDimTarget) = 0);
     DimensionCreate (cDimTarget);
Else;
     If (pDeleteAllElements @='1');
              DimensionDeleteAllElements(cDimTarget);
              DimensionElementInsert( cDimTarget, '', '}Applications', 'C' );
     Endif;
Endif;

############################################
###  PREPARE DATA SOURCE

#Define Temporary Object Name, and Check if the subset already exists
cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
While (SubsetExists(cDimSource, cTempName) <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;
cSub = cTempName;

sDim = cDimSource;
sMDX = '{TM1SORT( {TM1SUBSETALL( [' | sDim | '] )}, ASC)}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim, 1);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);

############################################
###  ASSIGN DATA SOURCE

DatasourceNameForServer = cDimSource;
DatasourceNameForClient = cDimSource;
DataSourceType = 'SUBSET';
DatasourceDimensionSubset = cSub;

############################################
###  REPLICATE ATTRIBUTES

# Note: DType on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"
If( cAttr = 1 & DimensionExists( cDimAttribute ) = 1 );
  nNumAttrs = DimSiz( cDimAttribute );
  nCount = 1;
  While( nCount <= nNumAttrs );
    sAttrName = DimNm( cDimAttribute, nCount );
    sAttrType = SubSt(DType( cDimAttribute, sAttrName ), 2, 1 );
    If( sAttrName @<> 'Format' );
        AttrInsert( cDimTarget, '', sAttrName, sAttrType );
    EndIf;
    nCount = nCount + 1;
  End;
EndIf;


############################################
### END Prolog
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


############################################
###  Skip Cube,Dimension, Chore, Process
IF (SUBST(vElement, LONG(vElement)-4,5) @='.cube'
     % SUBST(vElement, LONG(vElement)-9,10) @='.dimension'
     % SUBST(vElement, LONG(vElement)-5,6) @='.chore'
     % SUBST(vElement, LONG(vElement)-7,8) @='.process'
     % SUBST(vElement, LONG(vElement)-6,7) @='.subset'
     );
    ItemSkip;
ENDIF;

sElType = DType( cDimSource, vElement );
DimensionElementInsert( cDimTarget, '', vElement, sElType );  

IF( sElType @= 'C' & ElCompN( cDimSource, vElement ) > 0 );
    nChildren = ElCompN( cDimSource, vElement );
    nCount = 1;
    While( nCount <= nChildren );
      sChildElement = ElComp( cDimSource, vElement, nCount );
      sChildType = DType( cDimSource, sChildElement );
      sChildWeight = ElWeight( cDimSource, vElement, sChildElement );
      sChildWeight = 1;

      ## ONLY BLOB & VIEW & C Level
      IF (sChildType @= 'C'
         % SUBST(sChildElement, LONG(sChildElement)-4,5) @='.blob'
         % SUBST(sChildElement, LONG(sChildElement)-4,5) @='.view'
         % SUBST(sChildElement, LONG(sChildElement)-4,5) @='.extr'
         );
            DimensionElementInsert( cDimTarget, '', sChildElement, sChildType );
            DimensionElementComponentAdd( cDimTarget, vElement, sChildElement, sChildWeight );
      ENDIF;
      nCount = nCount + 1;
    End;
    
EndIf;




######################
### END Metadata
574,173
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



## Skip Cube,Dimension, Chore, Process
IF (SUBST(vElement, LONG(vElement)-4,5) @='.cube'
     % SUBST(vElement, LONG(vElement)-9,10) @='.dimension'
     % SUBST(vElement, LONG(vElement)-5,6) @='.chore'
     % SUBST(vElement, LONG(vElement)-7,8) @='.process'
     % SUBST(vElement, LONG(vElement)-6,7) @='.subset'
     );
    ItemSkip;
ENDIF;


############################################
###  Replicate Attributes ###

# Note: DTYPE on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"

  If( cAttr = 1 & DimensionExists( cDimAttribute ) = 1 );

    nCount = 1;
    While( nCount <= nNumAttrs );
      sAttrName = DimNm( cDimAttribute, nCount );
      sAttrType = SubSt( DTYPE( cDimAttribute, sAttrName ), 2, 1 );
      If( sAttrType @= 'S' % sAttrType @= 'A' );
        sAttrVal = AttrS( cDimSource, vElement, sAttrName );
        If( sAttrVal @<> '' );
          AttrPutS( sAttrVal, cDimTarget, vElement, sAttrName );
        EndIf;
      Else;
        nAttrVal = AttrN( cDimSource, vElement, sAttrName );
        If( nAttrVal <> 0 );
          AttrPutN( nAttrVal, cDimTarget, vElement, sAttrName );
        EndIf;
      EndIf;
      nCount = nCount + 1;
    End;

  EndIf;


############################################
###  Update Sys Menu Application Folder Cube ###


IF (SUBST(vElement, LONG(vElement)-4,5) @='.blob');

      sMeasure = 'Entry Type';
      sVal = 'Template';
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Name';
      sVal = '';
      sTempName =SUBST( vElement, 1, LONG( vElement)-5);
      sTempChar = SUBST(sTempName,LONG(sTempName),1);
      While (sTempName @<>'' & sTempChar @<> '\');
            sVal = sTempChar | sVal;
            sTempName = SUBST(sTempName, 1, LONG(sTempName)-1);
            sTempChar = SUBST(sTempName,LONG(sTempName),1);
      END;
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Display Name';
      sOriginEntryDisplayName = CellGetS (cCube, vElement, sMeasure );
      IF (sOriginEntryDisplayName @='');
           CellPutS( sVal, cCube, vElement, sMeasure );
      ENDIF;

      sMeasure = 'Entry Count Template';
      nVal = 1;
      CellPutN( nVal, cCube, vElement, sMeasure );

ELSEIF  (SUBST(vElement, LONG(vElement)-4,5) @='.view');

      sMeasure = 'Entry Type';
      sVal = 'View';
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Name';
      sVal = '';
      sTempName =SUBST( vElement, 1, LONG( vElement)-5);
      sTempChar = SUBST(sTempName,LONG(sTempName),1);
      While (sTempName @<>'' & sTempChar @<> '\');
            sVal = sTempChar | sVal;
            sTempName = SUBST(sTempName, 1, LONG(sTempName)-1);
            sTempChar = SUBST(sTempName,LONG(sTempName),1);
      END;
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Display Name';
      sOriginEntryDisplayName = CellGetS (cCube, vElement, sMeasure );
      IF (sOriginEntryDisplayName @='');
           CellPutS( sVal, cCube, vElement, sMeasure );
      ENDIF;

      sMeasure = 'Entry Count View';
      nVal = 1;
      CellPutN( nVal, cCube, vElement, sMeasure );

ELSEIF  (SUBST(vElement, LONG(vElement)-4,5) @='.extr');

      sMeasure = 'Entry Type';
      sVal = 'URL';
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Name';
      sVal = '';
      sTempName =SUBST( vElement, 1, LONG( vElement)-5);
      sTempChar = SUBST(sTempName,LONG(sTempName),1);
      While (sTempName @<>'' & sTempChar @<> '\');
            sVal = sTempChar | sVal;
            sTempName = SUBST(sTempName, 1, LONG(sTempName)-1);
            sTempChar = SUBST(sTempName,LONG(sTempName),1);
      END;
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Display Name';
      sOriginEntryDisplayName = CellGetS (cCube, vElement, sMeasure );
      IF (sOriginEntryDisplayName @='');
           CellPutS( sVal, cCube, vElement, sMeasure );
      ENDIF;

      sMeasure = 'Entry Count URL';
      nVal = 1;
      CellPutN( nVal, cCube, vElement, sMeasure );

ELSE;

      sMeasure = 'Entry Type';
      sVal = 'Folder';
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Name';
      sVal = '';
      sTempName =SUBST( vElement, 1, LONG( vElement));
      sTempChar = SUBST(sTempName,LONG(sTempName),1);
      While (sTempName @<>'' & sTempChar @<> '\');
            sVal = sTempChar | sVal;
            sTempName = SUBST(sTempName, 1, LONG(sTempName)-1);
            sTempChar = SUBST(sTempName,LONG(sTempName),1);
      END;
      CellPutS( sVal, cCube, vElement, sMeasure );

      sMeasure = 'Entry Display Name';
      sOriginEntryDisplayName = CellGetS (cCube, vElement, sMeasure );
      IF (sOriginEntryDisplayName @='');
           CellPutS( sVal, cCube, vElement, sMeasure );
      ENDIF;

ENDIF;





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



############################################
### Update Reference URL

sProcess = 'Sys.Menu.Cube.Sys Menu Application Entry.Reference.Update.Caller';
sParam1Name = 'pDoProcessLogging';
sParam1Value = '1';
ExecuteProcess(sProcess, sParam1Name, sParam1Value);


############################################
### Remove the Empty C elements

sProcess = 'Sys.Menu.Dim.Sys Menu Application Entry.Clean Empty C Elements';
ExecuteProcess(sProcess);




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
920,0
921,""
922,""
923,0
924,""
925,""
926,""
927,""
