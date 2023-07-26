601,100
602,"}Drill_drill to APQ Universal View source"
562,"VIEW"
586,"}APQ C3 UX Universal View Data"
585,"}APQ C3 UX Universal View Data"
564,
565,"obG1DnbyWSsvkMMaeixj26C\s_QxDjv;yAE8DrjgSZStOMtDbHcf:lSmw:Zd@\tXVYVA<f8iqMfcvCX2Ofy5rwF?RNWUv@eLLiuvN^WQ@Uy>@NcXDu7xG8YlTC:vZ05I6Qz7q`Ueod`0ZID7q@2bF?l3GbUavU<:aM\Y0B830VKl]IRGH5e2Fns:=C4]4H2s_0R_;bzn"
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
570,Default
571,
569,0
592,0
599,1000
560,7
CubeName
pUser
pView
pRowEle
pColumnEle
pMeasureEle
pMeasure
561,7
2
2
2
2
2
2
2
590,7
CubeName,"}APQ C3 UX Universal View Data"
pUser,"Total APQ Clients"
pView,"All Views"
pRowEle,"All Rows"
pColumnEle,"All Columns"
pMeasureEle,"All Measures"
pMeasure,"CubeAccess"
637,7
CubeName,""
pUser,""
pView,""
pRowEle,""
pColumnEle,""
pMeasureEle,""
pMeasure,""
577,0
578,0
579,0
580,0
581,0
582,7
IgnoredInputVarName=V1VarType=32ColType=1165
IgnoredInputVarName=V2VarType=32ColType=1165
IgnoredInputVarName=V3VarType=32ColType=1165
IgnoredInputVarName=V4VarType=32ColType=1165
IgnoredInputVarName=V5VarType=32ColType=1165
IgnoredInputVarName=V6VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=32ColType=1165
603,0
572,204
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
# From **}APQ Universal View Data** cube drill-through to the source cube whatever that may be.
# 
# Data Source: #  NA
#
# Use Case: 
# From }APQ Universal View Data cube allow the user to access equivalent view of the source cube.
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName(); 
### Params
pDoProcessLogging = '1';
sProcLogParams = Expand( 'pUser:%pUser% & pView:%pView% & pRowEle:%pRowEle% & pColumnEle:%pColumnEle% & pMeasureEle:%pMeasureEle% & pMeasure:%pMeasure%' );
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

### Prolog script commences

######################
### Inits - declare constants

# 		Standard naming convention for source and target cubes/dimensions
cCubSrc = 	'}APQ Universal View Source Mapping';
cCubSrcDim = 	'}APQ Universal View Dimension Mapping';
cCubFilter = 	'}APQ Universal View Filter';
cCubView = 	'}APQ Universal View Data';
cCubParam = 	'}APQ Settings';
cDimTest        = '}APQ Escape Characters';
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
sTimeStamp = 	TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = 	NumberToString( INT( RAND( ) * 1000 ));

cCubTgt = 	CellGetS( cCubSrc, pView, 'Cube' );
cDimRow = 	CellGetS( cCubSrc, pView, 'RowDimName' );
cDimCol = 	CellGetS( cCubSrc, pView, 'ColumnDimName' );
cDimMeas = 	CellGetS( cCubSrc, pView, 'MeasureDimName' );
cDimRowID = 	CellGetS( cCubSrc, pView, 'RowDim' );
cDimColID = 	CellGetS( cCubSrc, pView, 'ColumnDim' );
cDimMeasID = 	CellGetS( cCubSrc, pView, 'MeasureDim' );
cDimRowSub = 	CellGetS( cCubSrcDim, pView, cDimRowID, 'Subset' );
cDimColSub = 	CellGetS( cCubSrcDim, pView, cDimColID, 'Subset' );
cDimMeasSub = 	CellGetS( cCubSrcDim, pView, cDimMeasID, 'Subset' );

cCharSwap = 	'.';
cUserClean = 	'';

nErr = 		0;
sErr = 		'';

######################
### Clean the user name (user name will be part of view name & subset name so cannot contain characters invalid for file system objects or view creation will fail)

nCheckMax = DimSiz( cDimTest );
iChar = 1;
While( iChar <= Long( sProcessRunBy ) );
   sChar = SubSt( sProcessRunBy, iChar, 1 );
   cUserClean = cUserClean | sChar;
   iTest = 1;
   While( iTest <= nCheckMax );
      sTest = DimNm( cDimTest, iTest );
      IF( Long( sTest ) = 1 );
         IF( sChar @= sTest );
            cUserClean = SubSt( cUserClean, 1, iChar - 1 ) | cCharSwap;
            iTest = nCheckMax;
         EndIF;
      EndIF;
      iTest = iTest + 1;
   End;
   iChar = iChar + 1;
End;

cViewTgt = 	Expand( '%cCubView% (%cUserClean%)' );	
cSubTgt = 	cViewTgt;

######################
### Test view parameters

IF( CubeExists( cCubTgt ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid cube:' | cCubTgt;
EndIF;

IF( DimensionExists( cDimRow ) = 0 % DimensionExists( cDimCol ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid row or column dimension:' | cDimRow |':'| cDimCol;
EndIF;

IF( SubsetExists( cDimRow,  cDimRowSub ) = 0 % SubsetExists( cDimCol, cDimColSub ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid row or column subset:' | cDimRowSub |':'| cDimColSub;
EndIF;

IF( DimensionExists( cDimMeas ) = 1 );
   # defining a measure dimension is optional
   IF( SubsetExists( cDimMeas,  cDimMeasSub ) = 0 );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid measure subset:' | cDimMeas |':'| cDimMeasSub;
   EndIF;
EndIF;

######################
### If parameters fail validation then quit

IF( nErr > 0 );
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

######################
### Create the target view

IF( ViewExists( cCubTgt, cViewTgt )  = 0 );
   ViewCreate( cCubTgt, cViewTgt ); 
EndIF; 
ViewSuppressZeroesSet( cCubTgt, cViewTgt, 1 );

iDim = 1;
While( TabDim( cCubTgt, iDim ) @<> '' );
   sDim = TabDim( cCubTgt, iDim );
   sDimID = 'D' | IF( iDim < 10, '0', '' ) | NumberToString( iDim );
   sFunction = CellGetS( cCubSrcDim, pView, sDimID, 'Function' );
   sSub = CellGetS( cCubSrcDim, pView, sDimID, 'Subset' );
   sEle = CellGetS( cCubFilter, pUser, pView, sDimID, 'Element' );
   IF( sFunction @= 'Row' );
      ViewRowDimensionSet( cCubTgt, cViewTgt, sDim, 1 );
      ViewSubsetAssign( cCubTgt, cViewTgt, sDim, sSub );
   ElseIF( sFunction @= 'Column' );
      ViewColumnDimensionSet( cCubTgt, cViewTgt, sDim, 1 );
      ViewSubsetAssign( cCubTgt, cViewTgt, sDim, sSub );
   ElseIF( sFunction @= 'Measure' );
      ViewTitleDimensionSet( cCubTgt, cViewTgt, sDim );
      IF( SubsetExists( sDim, sSub ) = 1 );
         ViewSubsetAssign( cCubTgt, cViewTgt, sDim, sSub );
         sEle = CellGetS( cCubSrcDim, pView, sDimID, 'E' | SubSt( pMeasureEle, 2, 4 ) );
         ViewTitleElementSet( cCubTgt, cViewTgt, sDim, DimIx( sDim, sEle ) );
      Else;
         IF( SubsetExists( sDim, cSubTgt )  = 0 );
            SubsetCreate( sDim, cSubTgt ); 
         Else;
            SubsetDeleteAllElements( sDim, cSubTgt ); 
         EndIF;
         ViewTitleElementSet( cCubTgt, cViewTgt, sDim, DimIx( sDim, sEle ) );
         SubSetElementInsert( sDim, cSubTgt, sEle, 1 );
         ViewSubsetAssign( cCubTgt, cViewTgt, sDim, cSubTgt );
      EndIF;
   Else;
      ViewTitleDimensionSet( cCubTgt, cViewTgt, sDim );
      ViewTitleElementSet( cCubTgt, cViewTgt, sDim, DimIx( sDim, sEle ) );
      IF( SubsetExists( sDim, cSubTgt )  = 0 );
         SubsetCreate( sDim, cSubTgt ); 
      Else;
         SubsetDeleteAllElements( sDim, cSubTgt ); 
      EndIF;
      SubSetElementInsert( sDim, cSubTgt, sEle, 1 );
      ViewSubsetAssign( cCubTgt, cViewTgt, sDim, cSubTgt );
   EndIF;
   iDim = iDim + 1;
End;


######################
### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,33
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

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

RETURNVIEWHANDLE( cCubTgt, cViewTgt );

IF( 1 = 0 );
#****Begin: Generated Statements***
RETURNVIEWHANDLE('}APQ Universal View Data','Default');
#****End: Generated Statements****

EndIF;
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
