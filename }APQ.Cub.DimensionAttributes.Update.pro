601,100
602,"}APQ.Cub.DimensionAttributes.Update"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"o2;fx=sX?qA_?P\aPyYF\TFishVnwYRE@OkP<lF8bDF[aGRqToFeq;3\Y[0DK5Nnh2GmgWfu;zfY=WrftvD\8f\8LyfrGOxf3_x9\fzUbbEJq:p`B;H<jg\S4\ENi26;n4AHOJmS@mSf1Rd:mVNX=\QIuVffyIE<PZ8O[UD8^6y`LbtZ]r`PjjyBsIZ;:8:NAd_tzQa7"
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
pDimension
pClear
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pDimension,""
pClear,"0"
637,3
pDoProcessLogging,"Log to process loging cube"
pDimension,"Specific dimension. If blank=ALL"
pClear,"Clear cube before updating"
577,1
vDim
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
572,130
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
############################################################################################################################## 

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Purpose:
### Reads dimension attributes into }APQ dimension attributes cube
### This process runs with sys control objects replicate chore
### Also called manually from attribute definition framework setup

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDimension:' | pDimension |' & '| 'pClear:' | pClear;
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

################################
##~~    Inits

cDimSrc         = '}Dimensions';
cDimAPQ         = '}APQ Dimensions';
cDimEle         = '}APQ Dimension Elements';
cDimTgt         = '}APQ Dimension Attributes';
cDimDefM        = '}APQ Dimension Attribute Definition Measure';
cDimHier        = '}APQ Dimension Hierarchies';
cDimLang        = '}Cultures';
cCubTgt         = '}APQ Dimension Attributes';
cCubTgt2        = '}APQ Dimension Attribute Matrix';
cCubTgt3        = '}APQ Dimension Attribute Definition';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;

sErr            = '';
nErr            = 0;

cDimTotalTgt    = 'Total APQ Dimension Attributes';
nIdx            = 1;
sMod            = '';
sPrevMod        = '';

######################
### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( DimensionExists( pDimension ) = 0 & pDimension @<> '' );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDimension;
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
    DataSourceType = 'NULL';
    ItemReject( sErr );
Else;
    DataSourceType          = 'SUBSET';
    DatasourceNameForServer = cDimSrc;
    DatasourceDimensionSubset = 'ALL';
EndIF;

######################
### Logging in target cubes 

CubeSetLogChanges( cCubTgt, 1 );
CubeSetLogChanges( cCubTgt2, 1 );

######################
### Clear data in target cubes 

IF( pClear @= '1' & pDimension @= '' );
    # if no dimension specified then useCubeClearData
    CubeClearData( cCubTgt );
    CubeClearData( cCubTgt2 );
ElseIF( pClear @= '1' & DimIx( cDimAPQ, pDimension ) > 0 );
    # set filter to dimension name and use bedrock
    sProc = '}bedrock.cube.data.clear';
    sFilter = cDimAPQ | sDelimEleStart | pDimension;
    ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', sFilter,
        'pFilterParallel', '', 'pParallelThreads', 0,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pCubeLogging', 0, 'pTemp', cBedrockTmp, 'pSandbox', ''
    );
    ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt2, 'pView', cViewClr, 'pFilter', sFilter,
        'pFilterParallel', '', 'pParallelThreads', 0,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pCubeLogging', 0, 'pTemp', cBedrockTmp, 'pSandbox', ''
    );
EndIF;


### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,85
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
############################################################################################################################## 

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

IF( pDimension @<> '' );
  IF( vDim @<> pDimension ); ItemSkip; EndIF;
EndIF;

######################
### Data script

# Skip attribute dimensions
If( SubSt( vDim, 1, 19 ) @= '}ElementAttributes' );
    ItemSkip;
EndIf;

# Skip new PA dimensions
If( SubSt( vDim, 1, 9 ) @= '}Subsets_' % SubSt( vDim, 1, 13 ) @= '}Hierarchies_' % SubSt( vDim, 1, 7 ) @= '}Views_' );
    ItemSkip;
EndIf;

# Skip if dim is not yet in replica dimension
IF( DimIx( cDimAPQ, vDim ) = 0 ); ItemSkip; EndIF;

### Dimension Attributes

sDimAttr = '}ElementAttributes_' | vDim;
IF( DimensionExists( sDimAttr ) = 1 );
    nMax = DimSiz( sDimAttr );
    nCtr = 1;
    While( nCtr <= nMax );
        sAttr = DimNm( sDimAttr, nCtr );
        IF( DimIx( cDimTgt, sAttr ) = 0 );
            DimensionElementInsertDirect( cDimTgt, '', sAttr, 'N' );
            DimensionElementComponentAddDirect( cDimTgt, cDimTotalTgt, sAttr, 1 );
        EndIF;
        sTyp = SubSt( DType( sDimAttr, sAttr ), 2, 1 );
        sIdx = Fill( '0', 4 - Long( NumberToString( nCtr ) ) ) | NumberToString( nCtr );
        CellPutS( sAttr, cCubTgt, vDim, sIdx, 'ATTRIBUTE NAME' );
        CellPutS( sTyp, cCubTgt, vDim, sIdx, 'TYPE' );
        CellPutN( 1, cCubTgt2, vDim, sAttr, 'IsUsed' );
        CellPutS( sTyp, cCubTgt2, vDim, sAttr, 'TYPE' );
        nCtr = nCtr + 1;
    End;
    sLocAttr = '}LocalizedElementAttributes_' | vDim;
    If( CubeExists( sLocAttr ) = 1 );
        ExecuteProcess( sThisProcName | '.Localized', 'pDoProcessLogging', pDoProcessLogging, 'pDimension', vDim );
    EndIf;
    IF( ViewExists( cCubTgt3, vDim ) = 0 & SubsetExists( cDimEle, vDim ) = 1 & CubeExists( cCubTgt3 ) = 1 ); 
        IF( SubSetGetSize( cDimEle, vDim ) > 0 );
            ViewCreate( cCubTgt3, vDim );
            ViewTitleDimensionSet( cCubTgt3, vDim, cDimHier );
            ViewTitleElementSet( cCubTgt3, vDim, cDimHier, DimIx( cDimHier, vDim|':'|vDim ) );
            IF( SubsetExists( cDimHier, '}Hierarchies_' | vDim ) = 1 );
                ViewSubsetAssign( cCubTgt3, vDim, cDimHier, '}Hierarchies_' | vDim );
            EndIF;
            ViewRowDimensionSet( cCubTgt3, vDim, cDimEle, 1 );
            ViewSubsetAssign( cCubTgt3, vDim, cDimEle, vDim );
            ViewColumnDimensionSet( cCubTgt3, vDim, cDimTgt, 1 );
            IF( SubsetExists( cDimTgt, vDim ) = 1 );
              ViewSubsetAssign( cCubTgt3, vDim, cDimTgt, vDim );
            EndIF;
            ViewColumnDimensionSet( cCubTgt3, vDim, cDimDefM, 2 );
            ViewSubsetAssign( cCubTgt3, vDim, cDimDefM, 'Default' );
        EndIF; 
    EndIF;
EndIF;

######################
### END Data
575,29
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
############################################################################################################################## 

#****Begin: Generated Statements***
#****End: Generated Statements****

DimensionUpdateDirect( cDimTgt );

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
### Logging - common script 	-----------------  END
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
