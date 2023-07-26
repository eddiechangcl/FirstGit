601,100
602,"}APQ.Dim.UniversalViewGridDimension.Update"
562,"NULL"
586,
585,
564,
565,"cJeaK[yJ1Bn405Wq9GZl=K^Y?7[1<k5wN0wN[by3BsFHIrS]7hmoStyGwUgc;Y`Nf2QM@<Nuye1;?T@[s9G<wy_k3:illj`IXGKWZxCWVkNs8Z<Zu<5XgBydb<`W4G18[y`sod7IHa`vAZ@IObCVs8rSiLd_2B8;AXMa>OfPo>shP7=bx:8J35<G_`OgC3mMtgp@]kXi"
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
560,4
pDoProcessLogging
pNumberItems
pItemTyp
pDebug
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pNumberItems,"1000"
pItemTyp,"Row"
pDebug,"0"
637,4
pDoProcessLogging,"Record in process log"
pNumberItems,"Input the number of item elements for the row & column dimensions"
pItemTyp,"Row, Column or Measure (Default=Row)"
pDebug,"Debug (1/0) if debug=true then output a list of users to be deleted without actually deleting"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,157
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
# Update the dimension }APQ Data Source Row with number of rows equal to the number inputted in parameter
# 
# Use Case: 
# Expand (or reduce) the number of available items in the grid dimensions.
#
# Note:
# All items in the grid dimension will be always deleted before recreating. So if the number input in parameter is less than the current version, some items will be deleted.
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

cDimSrc         = '}APQ Universal View Dimension Mapping Measure';
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
cAlias          = 'Idx0';
nItems          = 1;
cDefaultUser    = CellGetS( cCubParam, 'Default User', 'String' );
cMax            = 1000;


### Debug parameters

IF( pDebug @>= '1' );
  cDebugFile = cDebugLoc | sThisProcName |'_debug_';
  sDebugFile = cDebugFile | 'prolog.csv';
  ASCIIOutput( sDebugFile,  'pNumberItems', pNumberItems );
  ASCIIOutput( sDebugFile,  'pItemTyp', pItemTyp );
EndIF;

### Test parameters

IF( pNumberItems @= '0' % pNumberItems @= '' );
  nErr          = nErr + 1;
  sErr          = 'Empty parameter pNumberItems.';
ElseIF( StringToNumber ( pNumberItems ) > cMax );
  nErr          = nErr + 1;
  sErr          = 'Maximum items exceeded.';
Else;
  nItemsMax     = StringToNumber ( pNumberItems );
EndIF;

IF( pItemTyp @= '' );
   pItemTyp     = 'Row';
EndIF;

IF( pItemTyp @<> 'Row' & pItemTyp @<> 'Column' & pItemTyp @<> 'Measure' );
   ProcessError;
EndIF;

cAll            = 'All ' | pItemTyp | 's';
cAllSum         = 'Sum of ' | pItemTyp | 's';
cItem           = Upper( SubSt( pItemTyp, 1, 1 ) );
cDimTgt         = '}APQ Universal View ' | pItemTyp;
sLastRollup     = '';

### Create / Reset Item dimension

IF( nErr = 0 );
  DimensionDeleteAllElements( cDimTgt );
  DimensionElementInsert( cDimTgt, '', cAll, 'C' );
  DimensionElementInsert( cDimTgt, '', cAllSum, 'C' );
  nLen = Long( Trim( NumberToString( cMax ) ) );
  While ( nItems <=  nItemsMax );
     sItems = NumberToString( nItems );
     sItems = cItem | Fill( '0', nLen - Long( sItems ) ) | sItems;
     DimensionElementInsert( cDimTgt, '', sItems, 'N' );
     DimensionElementComponentAdd( cDimTgt, cAll, sItems, 1 );
     sRollup = 'S ' | sItems;
     DimensionElementInsert( cDimTgt, '', sRollup, 'C' );
     DimensionElementComponentAdd( cDimTgt, cAllSum, sRollup, 1 );
     IF( nItems > 1 );
        DimensionElementComponentAdd( cDimTgt, sRollup, sLastRollup, 1 );
     EndIF;
     DimensionElementComponentAdd( cDimTgt, sRollup, sItems, 1 );        
     sLastRollup = sRollup;
     nItems = nItems +1;
  End;
Else;
  DataSourceType = 'NULL';
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, sErr ); ASCIIOutput( sDebugFile, 'Exiting.' );
  EndIF;
  ItemReject( sErr );
EndIF;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,47
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

IF( nErr = 0 );
  nLen = Long( Trim( NumberToString( cMax ) ) );
  nItems = 1;
  While ( nItems <=  nItemsMax );
     sItems = NumberToString( nItems );
     sItems = cItem | Fill( '0', nLen - Long( sItems ) ) | sItems;
     sIdx0 = cItem | NumberToString( nItems );
     sIdx00 = cItem | Fill( '0', 2 - Long( NumberToString( nItems ) ) ) | NumberToString( nItems );
     sIdx000 = cItem | Fill( '0', 3 - Long( NumberToString( nItems ) ) ) | NumberToString( nItems );
     AttrPutS( sIdx0, cDimTgt, sItems, 'Idx0' );
     AttrPutS( sIdx00, cDimTgt, sItems, 'Idx00' );
     AttrPutS( sIdx000, cDimTgt, sItems, 'Idx000' );
     AttrPutS( 'S' | sIdx0, cDimTgt, 'S' | sItems, 'Idx0' );
     AttrPutS( 'S' | sIdx00, cDimTgt, 'S' | sItems, 'Idx00' );
     AttrPutS( 'S' | sIdx000, cDimTgt, 'S' | sItems, 'Idx000' );
     nItems = nItems +1;
  End;
EndIF;

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
##############################################################################################################
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
