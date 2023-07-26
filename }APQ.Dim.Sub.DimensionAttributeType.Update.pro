601,100
602,"}APQ.Dim.Sub.DimensionAttributeType.Update"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"cP@yXjE\Kco@bhu9Rfynp9u0TlwEh;_cboUAOD\V5J@xn:YIqU<Cklk:cdSafE0Edb6VB>7EwD4bwhQG0CfisK[b1cVIuqA4;io5mURV=Xh6ox(K>oU;G`f8X9YvGuwHT~Pzf`WR\`k04tg2FfP?]RaypFHGG_^v@Vbo5oO{bFqvJMdeHy0mSkdarqKHnS3PSHwT5d:l"
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
570,z_Update SemiDynamic Subsets
571,All
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDim
561,2
2
2
590,2
pDoProcessLogging,"0"
pDim,""
637,2
pDoProcessLogging,"Log to process logging cube"
pDim,"Specific dimension to update: Blank=ALL"
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
572,75
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
### Purpose:
### Update subset per element attributes dimension of Alias attributes

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDim: %pDim%' );
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

### Setup

sDim        = '}Dimensions';
sFind       = '}ElementAttributes_';
sSubA       = 'Alias Attributes';
sSubS       = 'String Attributes';
sSubAS      = 'String & Alias Attributes';
sSubN       = 'Numeric Attributes';
cDimTgt     = '';
cDimSub     = '}APQ Dimension Subsets';
cAPQSubSrc  = 'APQ Internal - DimensionAttributeType';
nErr        = 0;
sErr        = '';

### Test params

IF( pDim @<> '' );
   IF( DimIx( sDim, pDim ) = 0 );
      nErr = 1;
      sErr = Expand( 'Invalid dimension: %pDim%.' );
   Else;
      cDimTgt = sFind |'_'| pDim;
   EndIF; 
EndIF;

IF( nErr > 0 );
   DatasourceType = 'NULL';
   ItemReject( sErr );
EndIF;

### Assign data source

DataSourceType            = 'SUBSET';
DataSourceNameForServer   = sDim;
DatasourceDimensionSubset = 'ALL';


### END Prolog
573,62
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
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nMetaDataRecordCount = nMetaDataRecordCount + 1;
EndIF;

######################
### Metadata script

IF( Scan( sFind, vDim )  <> 1 );
  ItemSkip;
EndIF;

IF( cDimTgt @<> '' );
   IF( cDimTgt @<> vDim );
      ItemSkip;
   EndIF;
EndIF;

IF( SubSetExists( vDim, sSubA ) = 0 ); SubsetCreate( vDim, sSubA ); Else; SubsetDeleteAllElements( vDim, sSubA ); EndIF;
IF( SubSetExists( vDim, sSubS ) = 0 ); SubsetCreate( vDim, sSubS ); Else; SubsetDeleteAllElements( vDim, sSubS ); EndIF;
IF( SubSetExists( vDim, sSubAS ) = 0 ); SubsetCreate( vDim, sSubAS ); Else; SubsetDeleteAllElements( vDim, sSubAS ); EndIF;
IF( SubSetExists( vDim, sSubN ) = 0 ); SubsetCreate( vDim, sSubN ); Else; SubsetDeleteAllElements( vDim, sSubN ); EndIF;

nAttrs = DimSiz( vDim );
iAttr = 1; iA = 0; iS = 0; iN = 0;
While( iAttr <= nAttrs );
  sAttr = DimNm( vDim, iAttr );
  sTyp = DType( vDim, sAttr );
  IF( sTyp @= 'AA' );
    iA = iA + 1;
    SubsetElementInsert( vDim, sSubA, sAttr, iA );
  ElseIF(  sTyp @= 'AS' );
    iS = iS + 1;
    SubsetElementInsert( vDim, sSubS, sAttr, iS );
  ElseIF(  sTyp @= 'AN' );
    iN = iN + 1;
    SubsetElementInsert( vDim, sSubN, sAttr, iN );
  Else;
  EndIF;
  IF( sTyp @= 'AA' % sTyp @= 'AS' );
    SubsetElementInsert( vDim, sSubAS, sAttr, iA+iS );
  EndIF;
  iAttr = iAttr + 1;
End;


######################
### END Metadata
574,90
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
### Logging - common script

If( pDoProcessLogging @= '1' );
    nDataRecordCount = nDataRecordCount + 1;
EndIf;

######################
### Data script

If( Scan( sFind, vDim )  <> 1 );
    ItemSkip;
EndIf;

If( cDimTgt @<> '' );
    If( cDimTgt @<> vDim );
        ItemSkip;
    EndIf;
EndIf;

sSub    = sSubA;
sDimSub = vDim |':'| vDim |':'| sSub;
If( SubSetExists( vDim, sSub ) = 1 ); 
    If( SubsetGetSize( vDim, sSub ) = 0 );
        SubsetDestroy( vDim, sSub );
    Else;
        If( DimIx( cDimSub, sDimSub ) = 0 );
            DimensionElementInsertDirect( cDimSub, '', sDimSub, 'N' );
        EndIf;
        AttrPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
        CellPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
    EndIf;
EndIf;

sSub    = sSubS;
sDimSub = vDim |':'| vDim |':'| sSub;
If( SubSetExists( vDim, sSub ) = 1 ); 
    If( SubsetGetSize( vDim, sSub ) = 0 );
        SubsetDestroy( vDim, sSub );
    Else;
        If( DimIx( cDimSub, sDimSub ) = 0 );
            DimensionElementInsertDirect( cDimSub, '', sDimSub, 'N' );
        EndIf;
        AttrPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
        CellPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
    EndIf;
EndIf;

sSub    = sSubAS;
sDimSub = vDim |':'| vDim |':'| sSub;
If( SubSetExists( vDim, sSub ) = 1 ); 
    If( SubsetGetSize( vDim, sSub ) = 0 );
        SubsetDestroy( vDim, sSub );
    Else;
        If( DimIx( cDimSub, sDimSub ) = 0 );
            DimensionElementInsertDirect( cDimSub, '', sDimSub, 'N' );
        EndIf;
        AttrPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
        CellPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
    EndIf;
EndIf;

sSub    = sSubN;
sDimSub = vDim |':'| vDim |':'| sSub;
If( SubSetExists( vDim, sSub ) = 1 ); 
    If( SubsetGetSize( vDim, sSub ) = 0 );
        SubsetDestroy( vDim, sSub );
    Else;
        If( DimIx( cDimSub, sDimSub ) = 0 );
            DimensionElementInsertDirect( cDimSub, '', sDimSub, 'N' );
        EndIf;
        AttrPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
        CellPutS( cAPQSubSrc, cDimSub, sDimSub, 'Source' );
    EndIf;
EndIf;

######################
### END Data
575,27
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
