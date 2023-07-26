601,100
602,"}APQ.Dim.Time.Update.Month.CalToFin.Conversion"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,"apliqo_reader"
565,"e0<8FnUaKzJK`kLB?tY1:lLDHy8Rp<p<_IPSoeSebn2Jgv0qtLy?fcqIWGaT^b@30GDhL8Sa0`JtMZ]Bep0t@Aos\13SU[hWf\oFWhWneG=J6foIEq5oumiE77ai3jw[D6hVoCFEda4hEIT_GH^o2T3@?uF0sG;ZIGXRpd9t=e5Ybo_F8A12VG?BF:zSP~1gAU3eCgD0"
559,0
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,2
Select	*
From 	[apliqoC3].[salesforce].[T_CRM_D_Account];
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,6
pDoProcessLogging
pDebug
pDimTgt
pStep
pAttr
pMap
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1"
pDebug,"0"
pDimTgt,""
pStep,"Start"
pAttr,""
pMap,"Alias1"
637,6
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pDimTgt,"Target dimension"
pStep,"Step (Start | Convert | End)"
pAttr,"If Step=Convert the text or alias attribute to convert"
pMap,"If Step=Convert the map to use (Alias1 | Alias2 | Alias3)"
577,1
vEle
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
931,1
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
603,0
572,185
##############################################################################################################
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
### PURPOSE:
###    Via a helpet cube }APQ Time Month Conversion this process can convert a time dimension from calendar year basis to financial year of vice versa
###    (assuming that the dimension is set with a principal name using codes e.g. M1 - M12 and just the aliases are to be changed)
### 
### DATA SOURCE:
###    Any time dimension containing months
### INTENDED USAGE:
###    To convert a time dimension
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2016-12-09 		Scott Wiltshire 	Creation of Process to support apliqo C3 for Australian, Indian, Japanese financial years
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDimTgt:%pDimTgt% & pStep:%pStep% & pAttr:%pAttr% & pMap:%pMap%' );
### Params
IF( pDoProcessLogging @= '1' );
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process';
  nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0;
  NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User();
  IF( DimIx( '}Clients', sProcessRunBy ) > 0 );
    sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) );
  EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' );
  IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry';
  nCountTime = 1; nTotalLogTime = 2; While ( nCountTime <= nTotalLogTime );
     sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
     sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
     CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' );
     CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
     CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' );
     CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
     CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' );
     CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' );
     nCountTime = nCountTime + 1;
  End;
EndIF;
IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### Prolog script commences

######################
### Inits - declare constants

cDimTgt = pDimTgt;
cCubSrc = '}APQ Time Month Conversion';
cCubTgt = '}ElementAttributes_' | cDimTgt;
cCubParam = '}APQ Settings';
cDimMth = '}APQ Time Month Simple';
cDimTest = '}APQ Escape Characters';
sTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc = cViewSrc;
cViewClrPrefix = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr = cViewClr;
cTestVal1 = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2 = DimNm( cDimTest, 1 );
cTestVal3 = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile = cDebugFile | '_Prolog.log';
nDebug = StringToNumber( pDebug );
nErr = 0;
sErr = '';

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

Err = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( DimensionExists( pDimTgt ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDimTgt; 
EndIF;

IF(  pStep @<> 'Start' & pStep @<> 'Convert' & pStep @<> 'End'  );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid step:' | pStep; 
EndIF;

IF(  pStep @= 'Convert' );
  IF( DimIx( cCubTgt, pAttr ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid attribute:' | pAttr;
  Else;
    IF( pMap @<> 'Alias1' & pMap @<> 'Alias2' & pMap @<> 'Alias3' );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid map:' | pMap; 
    EndIF;
    sTgtTyp = DType( cCubTgt, pAttr );
    IF( sTgtTyp @= 'AA' );
      sTgtAttr = cViewSrcPrefix | pAttr;
    ElseIF( sTgtTyp @= 'AS' );
      sTgtAttr = pAttr;
    Else;
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid attribute:' | pAttr; 
    EndIF;
  EndIF;
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

CubeSetLogChanges( cCubTgt, 0 );

######################
### STEP = START
### -> create temp attributes to store text of existing aliases (need to clear existing aliases and do conversion in temp tet attribute to avoid name conflicts)

IF( pStep @= 'Start' );

  sDim = cCubTgt;
  nMax = DIMSIZ(sDim);
  nCtr = 1;
# weird error DimSiz on attribute control dimension returns 1 less than dimension size
#  WHILE( nCtr <= nMax );
  WHILE( DIMNM(sDim, nCtr) @<> '' );
    sEl = DIMNM(sDim, nCtr);
    sTyp = DType( sDim, sEl );
    IF( SubSt( sTyp, 2, 1 ) @= 'A' );
      AttrInsert( cDimTgt, '', cViewSrcPrefix | sEl, 'S' );
    EndIF;
    nCtr = nCtr + 1;
  END;

EndIF;

######################
### Assign data source

DataSourceType = 'SUBSET';
DataSourceNameForServer = cDimTgt;
DatasourceDimensionSubset = 'All';


######################
### END Prolog
573,13
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


574,99
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
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

######################
### STEP = START
### -> copy all alias attributes to text attribute to avoid name conflicts when updating names

IF( pStep @= 'Start' );

  sDim = cCubTgt;
  nMax = DIMSIZ(sDim);
  nCtr = 1;
  WHILE(nCtr <= nMax);
    sEl = DIMNM(sDim, nCtr);
    sTyp = DType( sDim, sEl );
    IF( SubSt( sTyp, 2, 1 ) @= 'A' );
      sAttr = AttrS( cDimTgt, vEle, sEl );
      AttrPutS( sAttr, cDimTgt, vEle, cViewSrcPrefix | sEl );
      AttrPutS( '', cDimTgt, vEle, sEl );
    EndIF;
    nCtr = nCtr + 1;
  END;

EndIF;

######################
### STEP = CONVERT
### -> substitute the month name text value from the defined From/To pair

IF( pStep @= 'Convert' );

  sAttrFrom = AttrS( cDimTgt, vEle, sTgtAttr ); nLenAttrFrom = Long( sAttrFrom );

  sDim = cDimMth;
  nMax = DIMSIZ(sDim);
  nCtr = 1;
  WHILE(nCtr <= nMax);
    sEl = DIMNM(sDim, nCtr);
    sFromTxt = CellGetS( cCubSrc, sEl, pMap | '.From' ); nLenFrom = Long( sFromTxt );
    sToTxt = CellGetS( cCubSrc, sEl, pMap | '.To' ); nLenTo = Long( sToTxt );
    nStart = Scan( sFromTxt, sAttrFrom );
    IF( nStart > 0 );
      IF( nStart = 1 );
        sAttrTo = sToTxt | SubSt( sAttrFrom, nLenFrom + 1, nLenAttrFrom - nLenFrom );
      Else;
        sAttrTo = SubSt( sAttrFrom, 1, nStart - 1 ) | sToTxt | SubSt( sAttrFrom, nStart + nLenFrom, nLenAttrFrom - ( nStart + nLenFrom - 1 ) );
      EndIF;
      nCtr = nMax;
      CellPutS( sAttrTo, cCubTgt, vEle, sTgtAttr );
    EndIF;
    nCtr = nCtr + 1;
  END;

EndIF;

######################
### STEP = END
### -> copy all new alias values back from the temp attributes to the alias attributes

IF( pStep @= 'End' );

  sDim = cCubTgt;
  nMax = DIMSIZ(sDim);
  nCtr = 1;
  WHILE(nCtr <= nMax);
    sEl = DIMNM(sDim, nCtr);
    IF( DimIx( cCubTgt, cViewSrcPrefix | sEl ) > 0 );
      sAttr = AttrS( cDimTgt, vEle, cViewSrcPrefix | sEl );
      AttrPutS( sAttr, cDimTgt, vEle, sEl );
    EndIF;
    nCtr = nCtr + 1;
  END;

EndIF;


######################
### END Data
575,72
###############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

######################
### STEP = END
### -> remove temp attributes

IF( pStep @= 'End' );

  sDim = cCubTgt;
  nMax = DIMSIZ(sDim);
  nCtr = 1;
# weird error DimSiz on attribute control dimension returns 1 less than dimension size
#  WHILE( nCtr <= nMax );
  WHILE( DIMNM(sDim, nCtr) @<> '' );
    sEl = DIMNM(sDim, nCtr);
    sTyp = DType( sDim, sEl );
    IF( SubSt( sTyp, 2, 1 ) @= 'A' );
      AttrDelete( cDimTgt, cViewSrcPrefix | sEl );
    EndIF;
    nCtr = nCtr + 1;
  END;

EndIF;

######################
### Reenable data transaction logging to the target cube

CubeSetLogChanges( cCubTgt, 1 );

##############################################################################################################
### Logging - common script 	----------------- START
### ( Place as last code block on epilog )
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry';
  nCountTime = 1; nTotalLogTime = 2; While( nCountTime <= nTotalLogTime );
      sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
      sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
      CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' );
      CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
      CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' );
      CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
      CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' );
      CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
      CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' );
      CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
      CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );
      nCountTime = nCountTime + 1;
  End;
  IF( nDataRecordCount > 0 ); IF( cCubTgt @<> '' );
     CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' );
  EndIF; EndIF;
EndIF;
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### END Epilog
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
