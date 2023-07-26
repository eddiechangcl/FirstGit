601,100
602,"}APQ.Dim.Sub.DefaultSubsets.Copy"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"ryYx2cK?\dSWR48`IGnBwE]nrPlD2<@jUe<[DXDxT3HsFx`jcWDh?hcmNCa4yyHCBxEf<z^s[jA4Go0m8hTns9Rn@I1cJ?yqXg?Ssf[ufvxGnHnIEWwkHFIw@LMfLK3cWv;Z_RW5IUde5rlI?[398Pgc6uCqTpjuHqXrkK6=i_FXa?Zvt?NzttD3`MA?d}AmqQ=@zH_s"
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
560,4
pDoProcessLogging
pSubSrc
pSubTgt
pDim
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pSubSrc,"Standard"
pSubTgt,"Default"
pDim,""
637,4
pDoProcessLogging,"Record in process log"
pSubSrc,"Copy from Subset"
pSubTgt,"Copy to Subset"
pDim,"Target dimension (blank=ALL)"
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
572,81
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
### Update default subsets in all dimensions from "master language" to other supported languages

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pSubSrc:' | pSubSrc |' & '| 'pSubTgt:' | pSubTgt |' & '| 'pDim:' | pDim;
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

### Inits - declare constants

cDimSrc         = '}Dimensions';
cMasterAlias    = 'Code and DEscription';
nErr            = 0;
sErr            = '';

### Test parameters

IF( pDim @= '' % pDim @= 'ALL' );
  pDim = 'ALL';
ElseIF( DimensionExists( pDim ) = 0 );
  nErr = nErr + 1;
  sErr = 'Invalid target dimension.';
EndIF;

IF( pSubSrc @= '' );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Subset names cannot be blank.';
ElseIF( pSubSrc @= pSubTgt );
  nErr = nErr + 1;
  IF( sErr @<> '' ); sErr = sErr | ' & '; EndIF;
  sErr = sErr | 'Source & target subset names cannot be the same.';
EndIF;

pSubSrc = Trim( pSubSrc );
pSubTgt = Trim( pSubTgt );

### Assign data source

IF( nErr = 0 & pSubTgt @= '' );
  #silent skip as no target defined
  DataSourceType = 'NULL';
ElseIF( nErr = 0 );
  DataSourceType = 'SUBSET';
  DataSourceNameForServer = cDimSrc;
  DatasourceDimensionSubset = 'ALL';
Else;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

### END Prolog
573,72
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

# Skips

IF( DimensionExists( vDim ) = 0 );
  ItemSkip;
EndIF;

IF( pDim @<> 'ALL' );
  IF( vDim @<> pDim );
    ItemSkip;
  EndIF;
EndIF;

# Determine if source default subset exists

IF( SubsetExists( vDim, pSubSrc ) = 0 );
  ItemSkip;
Else;
  nSubLoop = SubsetGetSize( vDim, pSubSrc );
  sAttrDim = '}ElementAttributes_' | vDim;
EndIF;

# Clear target subset

IF( SubsetExists( vDim, pSubTgt ) = 0 );
  SubsetCreate( vDim, pSubTgt );
Else;
  SubsetDeleteAllElements( vDim, pSubTgt );
EndIF;

# "Clean" the source subset 
# If the source subset contains members that are subsets (acting as UDCs) not elements then delete them as SubsetElementInsert will fail

nEle = 1;
While( nEle <= nSubLoop );
  sEle = SubsetGetElementName( vDim, pSubSrc, nEle );
  IF( DimIx( vDim, sEle ) = 0 );
    SubsetElementDelete( vDim, pSubSrc, nEle );
    nEle = nEle - 1;
    IF( SubsetExists( vDim, sEle ) = 1 );
      IF( SubsetGetSize( vDim, sEle ) = 0 );
        SubsetDestroy( vDim, sEle );
      EndIF;
    EndIF;
  EndIF;
  nEle = nEle + 1;
End;


######################
### END Metadata
574,65
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
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

# Skips

IF( DimensionExists( vDim ) = 0 );
  ItemSkip;
EndIF;

IF( pDim @<> 'ALL' );
  IF( vDim @<> pDim );
    ItemSkip;
  EndIF;
EndIF;

# Determine if source default subset exists

IF( SubsetExists( vDim, pSubSrc ) = 0 );
  ItemSkip;
Else;
  nSubLoop = SubsetGetSize( vDim, pSubSrc );
  sAttrDim = '}ElementAttributes_' | vDim;
EndIF;

# Set Alias 

IF( DimensionExists( sAttrDim ) = 0 );
  # no alias to set
ElseIF( DimIx( sAttrDim, cMasterAlias ) > 0 );
  IF( DType( sAttrDim, cMasterAlias ) @= 'AA' );
    SubsetAliasSet( vDim, pSubTgt, cMasterAlias );
  EndIF;
EndIF;

# Copy source subset to target

nEle = 1;
While( nEle <= nSubLoop );
  sEle = SubsetGetElementName( vDim, pSubSrc, nEle );
  SubsetElementInsert( vDim, pSubTgt, sEle, nEle );
  nEle = nEle + 1;
End;


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
