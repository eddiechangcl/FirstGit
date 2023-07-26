601,100
602,"}APQ.Dim.Attr.Definition.Update.FromReferenceDim"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"bWa?ZKW\EkkLrrtngBfcGk2_1_h_8XfJtzrl4[8Uso<k]GJb5RtKDK3w6OvX=Q4`>dxZHUXyQKKM[Z0INrmZGYrBOlsG9dfJg9S3^@FDW=F1>OL0?6Y:WybV2@<CBsvQIebn\uiSWHFyw[_aWnNQA=9Q>NRX3fcB0jyS5JGaJ3d[>@]CwaaQ_vrJ6xJdNg0b8QWmYC=H"
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
From 	[];
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,10
pDoProcessLogging
pTargetDim
pSourceDim
pSourceHier
pSourceHierExcl
pSourceDimAlias
pAttrFilter
pFilterDelimiter
pDirect
pDebug
561,10
2
2
2
2
2
2
2
2
2
2
590,10
pDoProcessLogging,"1"
pTargetDim,""
pSourceDim,""
pSourceHier,""
pSourceHierExcl,""
pSourceDimAlias,""
pAttrFilter,""
pFilterDelimiter,"+"
pDirect,"1"
pDebug,"0"
637,10
pDoProcessLogging,"Record in process log"
pTargetDim,"Mandatory: Dimension to update attributes into (can accept dim:hier)"
pSourceDim,"Mandatory: The source or reference dimension (can accept dim:hier)"
pSourceHier,"Optional: Limit scope to source hierarchy -blank for whole dimension (default) otherwise specific named hierarchy"
pSourceHierExcl,"Optional: If source hierarchy named portion of source hierarchy to EXCLUDE"
pSourceDimAlias,"Optional: Alias name in source dim to match to principal name or alias in target (if required)"
pAttrFilter,"Optional: Filter attribute updates to specified list of attributes"
pFilterDelimiter,"Optional: Delimiter for the attribute filter"
pDirect,"Optional: Directly update attributes or update inderectly via attribute maintenance framework (default=1, direct)"
pDebug,"Debug"
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
603,0
572,131
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

########################################################################################
### PURPOSE:
###    Update attributes in target dim from source dim. The process also accepts dim:hier for alternate hierarchy references for both source & target dimensions
### DATA SOURCE:
###    Any dimension
### INTENDED USAGE:
###    For analog dimensions copy attribute values already defined in one dimension to another dimension
########################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pTargetDim:' | pTargetDim |' & '| 'pSourceDim:' | pSourceDim |' & '| 'pSourceHier:' | pSourceHier |' & '| 'pSourceHierExcl:' | pSourceHierExcl 
 |' & '| 'pSourceDimAlias:' | pSourceDimAlias |' & '| 'pAttrFilter:' | pAttrFilter |' & '| 'pFilterDelimiter:' | pFilterDelimiter |' & '| 'pDirect:' | pDirect;
### Params
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################

######################
### Inits - declare constants

cDimSrc         = pSourceDim;
cCubSrc         = '}ElementAttributes_' | If( Scan( ':', cDimSrc ) = 0, cDimSrc, SubSt( cDimSrc, 1, Scan( ':', cDimSrc ) - 1 ) );
cDimTgt         = pTargetDim;
cCubTgt         = '}ElementAttributes_' | If( Scan( ':', cDimTgt ) = 0, cDimTgt, SubSt( cDimTgt, 1, Scan( ':', cDimTgt ) - 1 ) );
cCubTgt2        = '}APQ Dimension Attribute Definition';
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
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';

cHierSource     = pSourceHier;
nAliasCheck     = 0;

######################
### Test parameters

IF( DimensionExists( cDimTgt ) = 0 % DimensionExists( cDimSrc ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' Source or target dimension does not exist.'; 
Else;
  IF( Scan( ':', cDimTgt ) = 0 );
    cDimTgt = cDimTgt |':'| cDimTgt;
  EndIF;
EndIF;

IF( cHierSource @<> '' );
  IF( DimIx( cDimSrc, cHierSource ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' Hierarchy does not exist in source dimension.';
  EndIF;
EndIF;

IF( pSourceDimAlias @<> '' );
  IF( DimIx( cCubSrc, pSourceDimAlias ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' Alias does not exist in source dimension.';
  EndIF;
EndIF;

IF( pAttrFilter @<> '' );
  IF( pFilterDelimiter @= '' );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' If attribute filter is used then delimiter is mandatory.';
  Else;
    pAttrFilter = UPPER( pFilterDelimiter | pAttrFilter | pFilterDelimiter );
  EndIF;
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

#  Can be done either with CubeSetLogChanges or writing NO with CellPutS to }CubeProperties
CubeSetLogChanges( cCubTgt, 0 );
CubeSetLogChanges( cCubTgt2, 0 );

######################
### Assign data source

DataSourceType = 'SUBSET';
DatasourceNameForServer = cDimSrc;
DatasourceDimensionSubset = 'ALL';

######################
### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,91
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

sEle = vEle;
IF( pSourceDimAlias @<> '' );
  sEle = AttrS( cDimSrc, vEle, pSourceDimAlias );
  IF( sEle @= '' ); sEle = vEle; EndIF;
EndIF;

### Check if element exists in target dimension

IF( DimIx( cDimTgt, sEle ) = 0 );
  ItemSkip;
Else;
   sEle = DimensionElementPrincipalName( cDimTgt, sEle );
EndIF;

### Check source hierarchy & exclusion area

IF( pSourceHier @<> '' );
  IF( ElIsAnc( cDimSrc, pSourceHier, vEle ) <> 1 & vEle @<> pSourceHier );
    ItemSkip;
  EndIF;
EndIF;

IF( pSourceHierExcl @<> '' );
  IF( ElIsAnc( cDimSrc, pSourceHierExcl, vEle ) = 1 % vEle @= pSourceHierExcl );
    ItemSkip;
  EndIF;
EndIF;

### Copy Attribute Values  ###
### Note: DTYPE on Attr dim returns "AS", "AN" or "AA" need to strip off leading "A"

nNumAttrs = DimSiz( cCubSrc );
nCount = 1;
While( nCount <= nNumAttrs );
   sAttrName = DimNm( cCubSrc, nCount );
   sTestStr = Upper( pFilterDelimiter | sAttrName | pFilterDelimiter );
   sAttrType = SubSt( DTYPE( cCubSrc, sAttrName ), 2, 1 );
   IF( Scan( sTestStr, pAttrFilter ) > 0 % pAttrFilter @= '' );
      IF( DimIx( cCubTgt, sAttrName ) > 0 );
         IF( sAttrType @= 'S' % sAttrType @= 'A' );
            sAttrVal = AttrS( pSourceDim, vEle, sAttrName );
            IF( pDirect @= '1' );
               IF( sAttrType @= 'A' );
                  AttrPutS( sAttrVal, pTargetDim, sEle, sAttrName, 1 );
               Else;
                  AttrPutS( sAttrVal, pTargetDim, sEle, sAttrName );
               EndIF;
            Else;
               CellPutS( sAttrVal, cCubTgt2, cDimTgt, sEle, sAttrName, 'Load Value' );
            EndIF;
         Else;
            nAttrVal = AttrN( pSourceDim, vEle, sAttrName );
            IF( pDirect @= '1' );
               AttrPutN( nAttrVal, pTargetDim, sEle, sAttrName );
            Else;
               sAttrVal = NumberToString( nAttrVal );
               CellPutS( sAttrVal, cCubTgt2, cDimTgt, sEle, sAttrName, 'Load Value' );
            EndIF;
         EndIF;
      EndIF;
   EndIF;
   nCount = nCount + 1;
End;


######################
### END Data
575,39
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

######################
### Reenable data transaction logging to the target cube

CubeSetLogChanges( cCubTgt, 1 );
CubeSetLogChanges( cCubTgt2, 1 );

##############################################################################################################
### Logging - common script 	----------------- START
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While( nCountTime <= nTotalLogTime );    sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
  CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' ); CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
  CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' ); CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
  CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' ); CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
  CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );  nCountTime = nCountTime + 1; End;
  IF( nDataRecordCount > 0 ); IF( cCubTgt @<> '' ); CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' ); EndIF; EndIF;
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
