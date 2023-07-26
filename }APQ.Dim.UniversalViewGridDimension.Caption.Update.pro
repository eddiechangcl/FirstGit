601,100
602,"}APQ.Dim.UniversalViewGridDimension.Caption.Update"
562,"VIEW"
586,"}APQ C3 UX Universal View Dimension Mapping"
585,"}APQ C3 UX Universal View Dimension Mapping"
564,
565,"rxCCKDOPGAX6I_=itlath]<3Qvb^5z[R:H[43u_A;Y40RqgiR[=w^eZmkLXc>Xdq\:xF03ahqvttinz]VlCnufCi=XA0g[R\d4:;oVwmpaiTl\w@:G2[4Bw3waSgMxElq0waq7tWGK0dLn>:p10t=jagJ3ai:uJZFmLz;u0DWGRgDZO[C2DWwP`vD3x;tf8c?y5hb;@z"
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
570,}TI_Dummy_View
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pAlias
561,2
2
2
590,2
pDoProcessLogging,"1"
pAlias,""
637,2
pDoProcessLogging,"Record in process log"
pAlias,"Alias name to set row & column captions"
577,4
vView
vDim
vMeas
Value
578,4
2
2
2
2
579,4
1
2
3
4
580,4
0
0
0
0
581,4
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,166
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
# After all row, column and measure subset elements are entered AND after any additional manual grid dimension element caption placeholders 
# (to be assigned custom calculations) are entered this process should be run to set the per view caption and format attributes of the row, column and measure dimensions.
# 
# Use Case: 
# In the UI allow the user to interact with captions from the mapped dimensions and not the technical names of the row & column dimensions (e.g. R001, C001, etc.)
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

### Prolog script commences

######################
### Inits - declare constants

cCubSrc         = '}APQ Universal View Dimension Mapping';
cCubMultiCaption= '}APQ Universal View Source Mapping';
cDimSrc         = '}APQ Universal View';
cViewTot        = 'All Views';
cDimTot         = 'All Dimensions';
cDimTgt1        = cDimSrc | ' Row'; cCubTgt1 = '}ElementAttributes_'  | cDimTgt1;
cDimTgt2        = cDimSrc  | ' Column'; cCubTgt2 = '}ElementAttributes_'  | cDimTgt2;
cDimTgt3        = cDimSrc  | ' Measure'; cCubTgt3 = '}ElementAttributes_'  | cDimTgt3;
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

######################
### Make sure attribute cubes exist

IF( CubeExists( cCubTgt1 ) = 0 );
   AttrInsert( cDimTgt1, '', 'Format', 'S' );
EndIF;
IF( CubeExists( cCubTgt2 ) = 0 );
   AttrInsert( cDimTgt2, '', 'Format', 'S' );
EndIF;IF( CubeExists( cCubTgt3 ) = 0 );
   AttrInsert( cDimTgt3, '', 'Format', 'S' );
EndIF;

######################
### Switch transaction logging off 

CubeSetLogChanges( cCubTgt1, 0 );
CubeSetLogChanges( cCubTgt2, 0 );
CubeSetLogChanges( cCubTgt3, 0 );

######################
### Create Attributes

sDim = cDimSrc;
nMax = DimSiz( sDim );
nCtr = 1;
WHILE( nCtr <= nMax );
  sEl = DimNm( sDim, nCtr );
   IF( sEl @<> cViewTot );
      sAttr = 'Caption ' | sEl;
      IF( DimIx( cCubTgt1, sAttr ) = 0 );
         AttrInsert( cDimTgt1, '', sAttr, 'S' );
      EndIF;
      IF( DimIx( cCubTgt2, sAttr ) = 0 );
         AttrInsert( cDimTgt2, '', sAttr, 'S' );
      EndIF;
      IF( DimIx( cCubTgt3, sAttr ) = 0 );
         AttrInsert( cDimTgt3, '', sAttr, 'S' );
      EndIF;
      sAttr = 'Format ' | sEl;
      IF( DimIx( cCubTgt1, sAttr ) = 0 );
         AttrInsert( cDimTgt1, '', sAttr, 'S' );
      EndIF;
      IF( DimIx( cCubTgt2, sAttr ) = 0 );
         AttrInsert( cDimTgt2, '', sAttr, 'S' );
      EndIF;
      IF( DimIx( cCubTgt3, sAttr ) = 0 );
         AttrInsert( cDimTgt3, '', sAttr, 'S' );
      EndIF;
   EndIF;
  nCtr = nCtr + 1;
END;

######################
### Create the view to assign as data source for the process

# create view as whole cube but skip not relevant cells on data
sProc           = '}bedrock.cube.view.create';
sFilter         = '';
bSuppressNull   = 1;
bSuppressC      = 0;
bSuppressRule   = 1;
ExecuteProcess( sProc, 'pLogOutput', 0,
    'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
    'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', cBedrockTmp, 'pSubN', 0
);

######################
### Assign data source

DataSourceType = 'VIEW';
DataSourceNameForServer = cCubSrc;
DatasourceCubeView = cViewSrc;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,105
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

######################
### Skips

# Only subset element names, only leaf dimensions, views of any level
IF( sValue @= '' ); ItemSkip; EndIF;
IF( vView @= cViewTot ); ItemSkip; EndIF;
IF( vDim @= cDimTot ); ItemSkip; EndIF;
IF( SubSt( vMeas, 1, 1 ) @<> 'E' % Long( vMeas ) <> 5 ); ItemSkip; EndIF;

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
   nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

# Skip if not a Row, Column or Measure
sFunc = CellGetS( cCubSrc, vView, vDim, 'Function' );
IF( sFunc @<> 'Row' & sFunc @<> 'Column' & sFunc @<> 'Measure' );
   ItemSkip;
ElseIF( sFunc @= 'Row' );
   sDimTgt = cDimTgt1;
   sID = 'R' | SubSt( vMeas, 2, 4 );
ElseIF( sFunc @= 'Column' );
   sDimTgt = cDimTgt2;
   sID = 'C' | SubSt( vMeas, 2, 4 );
Else;
   sDimTgt = cDimTgt3;
   sID = 'M' | SubSt( vMeas, 4, 2 );
EndIF;

# Get the dimension
sDimName = CellGetS( cCubSrc, vView, vDim, 'Dimension' );

sAttr = 'Caption ' | vView;
sCap = '';

# Check if the alias exists in named source dimension, else check if Caption Attribute exists, else use the text in the dimension mapping cube
IF( DimIx( '}ElementAttributes_' | sDimName, pAlias ) > 0 );
   IF( DimIx( sDimName, sValue ) > 0 );
      sCap = AttrS( sDimName, sValue, pAlias );
   EndIF;
ElseIF( DimIx( '}ElementAttributes_' | sDimName, 'Caption' ) > 0 );
   IF( DimIx( sDimName, sValue ) > 0 );
      sCap = AttrS( sDimName, sValue, 'Caption' );
   EndIF;
EndIF;

IF( sCap @= '' );
   sCap = sValue;
EndIF;

# Multiple dimension row or column definitions
IF( ( sFunc @= 'Row' & CellGetN( cCubSrc, vView, 'All Dimensions', 'IsMultiRow' ) >= 1 ) % ( sFunc @= 'Column' & CellGetN( cCubSrc, vView, 'All Dimensions', 'IsMultiColumn' ) >= 1 ) );
   IF( CellGetS( cCubMultiCaption, vView, 'MultiPartCaption' ) @<> 'Y');
      ItemSkip;
   EndIF;
   sCap = '';
   iDim = 1;
   While( iDim <= 30 );
      sDim = 'D' | IF( iDim < 10, '0', '' ) | NumberToString( iDim );
      sDimFunc = CellGetS( cCubSrc, vView, sDim, 'Function' );
      IF( sDimFunc @= sFunc );
         sListItem = CellGetS( cCubSrc, vView, sDim, vMeas );
         IF( sListItem @<> '' );
            sCap = sCap | IF( sCap @= '', '', ' - ' ) | sListItem;
         EndIF;
      EndIF;
      iDim = iDim + 1;
   End;
EndIF;

# Send to attribute cube
AttrPutS( sCap, sDimTgt, sID, sAttr );

sAttr = 'Format ' | vView;
sFormat = '';

# Check if the format attribute exists in named source dimension
IF( DimIx( '}ElementAttributes_' | sDimName, 'Format' ) > 0 );
   IF( DimIx( sDimName, sValue ) > 0 );
      sFormat = AttrS( sDimName, sValue, 'Format' );
   EndIF;
EndIF;

# Send to attribute cube
AttrPutS( sFormat, sDimTgt, sID, sAttr );

######################
### END Data
575,49
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

######################
### Epilog script

######################
### Delete the data source processing view and subset objects from the system

If( cBedrockTmp = 0 );
    sProc = '}bedrock.cube.viewandsubsets.delete';
    ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubSrc, 'pView', cViewSrc, 'pSub', cSubSrc,
        'pMode', 1
    );
EndIf;

######################
### Reenable data transaction logging to the target cube

CubeSetLogChanges( cCubTgt1, 1 );
CubeSetLogChanges( cCubTgt2, 1 );
CubeSetLogChanges( cCubTgt3, 1 );

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
