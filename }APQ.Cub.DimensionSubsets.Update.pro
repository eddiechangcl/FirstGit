601,100
602,"}APQ.Cub.DimensionSubsets.Update"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"jGtgrTDmX_a;4uKgUL9V6UU?;=VTsS1zW@Ay@Q@aNLXV32kSrZWyY0KTitH5JAQ_U[@l50sFhv^r^JecZRBxuyywfn^Al3Tflb`Ch]02Cl1TV\MHNSroo@0CL;Ah6q\@:9`b07jomQ5Pw6V;razWGNb]C;:pwnMCr8_ko4S<Hj>00ipD0PBl^WTBOtsET8d7F3G_9^SO"
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
pForceLargeDimRefresh
pDebug
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pForceLargeDimRefresh,"0"
pDebug,"0"
637,3
pDoProcessLogging,"Record in process log"
pForceLargeDimRefresh,"Force refresh of element count for dimensions over the size threshold"
pDebug,"Write to debug log"
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
572,95
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.00
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

### Purpose:	Process to }APQ Dimension Subset dimension & cube

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pForceLargeDimRefresh:' | pForceLargeDimRefresh | ' & pDebug:' | pDebug;
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
### Prolog script

### Inits - declare constants

cDimSrc         = '}Dimensions';
cDimTgt         = '}APQ Dimension Subsets';
cDimTgt2        = '}APQ Subsets';

cCubTgt         = '}APQ Dimension Subsets';
cCubSettings    = '}APQ Settings';
cTestVal1       = CellGetS( cCubSettings, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cCubSettings, 'Customer Name', 'String' );
cSubDefault     = CellGetS( cCubSettings, 'Std Localized Default', 'String' );
cSubAllNcode    = CellGetS( cCubSettings, 'Std All N Elements Principal', 'String' );
cSubAllN        = CellGetS( cCubSettings, 'Std All N Elements', 'String' );
cSubAllC        = CellGetS( cCubSettings, 'Std All C Elements', 'String' );
cSubTop         = CellGetS( cCubSettings, 'Std Top Elements', 'String' );
cSubAll         = CellGetS( cCubSettings, 'Std All Elements', 'String' );
cSubDefMbr      = CellGetS( cCubSettings, 'Std Default Member Subset', 'String' );
nMaxDimSiz      = CellGetN( cCubSettings, 'Max dimension size for subset info refresh', 'Numeric' );
nMaxSubs        = CellGetN( cCubSettings, 'Max subsets per dimension', 'Numeric' );

sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cDebugLoc       = CellGetS( cCubSettings, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );

cTM1Ver         = CellGetS( cCubSettings, 'TM1 Version', 'String' );
nTM1Ver         = CellGetN( cCubSettings, 'TM1 Version', 'Numeric' );
nVerPA          = 11;

cDataFolder     = CellGetS( cCubSettings, 'Location: Data Dir', 'String' );
cDataFolder     = cDataFolder | If( SubSt( cDataFolder, Long(cDataFolder ), 1) @<> '\', '\', '' );
cAPQFolder      = CellGetS( cCubSettings, 'Location: Framework', 'String' );
cAPQFolder      = If( cAPQFolder @= '', cDataFolder, cAPQFolder );
cAPQFolder      = cAPQFolder | If(SubSt(cAPQFolder, Long(cAPQFolder), 1) @<> '\', '\', '');

cSpecialDims    = 'Scale+Time Analysis+';
cAliasName      = 'Caption_Default';
cDimName        = 'Dimension Name';
cSubName        = 'Subset Name';

bSkipControlObj = 0;

# Check if Planning Analytics (v11)
bPA = 0;
IF( nTM1Ver > nVerPA );
    bPA = 1;
EndIf;

### Set data source

DatasourceType = 'SUBSET';
DatasourceNameForServer = cDimSrc;
DatasourceDimensionSubset = 'All';

### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,114
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.00
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

sDebugFile = cDebugFile | '_Data.log';

######################
### data script

# Skip new PA dimensions
If( SubSt( vDim, 1, 9 ) @= '}Subsets_' % SubSt( vDim, 1, 13 ) @= '}Hierarchies_' % SubSt( vDim, 1, 7 ) @= '}Views_' );
   ItemSkip;
EndIf;

# Skip hierarchy dimensions (for all dimensions we loop hierarchies)
If( Scan( ':', vDim ) > 0 );
   ItemSkip;
EndIf;

# Skip other control dimensions
If( bSkipControlObj = 1 );
    If( SubSt( vDim, 1, 1 ) @= '}' & SubSt( vDim, 1, 4 ) @<> '}APQ' );
        ItemSkip;
    EndIf;
EndIf;

# If debug option then print out dimension name
If( pDebug @>= '1' );
    sMsg = Expand('processing subsets for dim %vDim%');
    ASciiOutput( sDebugFile, sMsg );
    LogOutput( 'INFO', sMsg );
EndIf;

# If Planning Analytics with }Subsets_ control dimensions then get subset names directly without WildcardFileSearch
sDimSubs = '}Subsets_' | vDim;
If( DimensionExists( sDimSubs ) = 1 ); If( DimSiz( sDimSubs ) >= 1 );
    CellPutS( vDim, cCubTgt, vDim, cDimName );
    nSubs = DimSiz( sDimSubs );
    iSub = 1;
    While( iSub <= nSubs );
        sSub = DimNm( sDimSubs, iSub );
        If( Scan( ':', sSub ) = 0 );
            sHier = vDim;
            sDimHier = vDim | ':' | sHier;
            sDimSub = sDimHier | ':' | sSub;
        Else;
            sHier = SubSt( sSub, 1, Scan( ':', sSub ) - 1 );
            sDimHier = vDim | ':' | sHier;
            sSub = SubSt( sSub, Scan( ':', sSub ) + 1, Long( sSub ) );
            sDimSub = sDimHier | ':' | sSub;
        EndIf;
        sAlias = vDim |'\'| sHier |'\'| sSub;
        IF( DimIx( cDimTgt, sDimSub ) = 0 );
            DimensionElementInsertDirect( cDimTgt, '', sDimSub, 'N' );
        EndIF;
        IF( DimIx( cDimTgt2, sSub ) = 0 );
            DimensionElementInsertDirect( cDimTgt2, '', sSub, 'N' );
        EndIF;
        CellPutS( vDim, cCubTgt, vDim, cDimName );
        CellPutS( vDim, cCubTgt, sDimSub, cDimName );
        CellPutS( sSub, cCubTgt, sDimSub, cSubName );
        AttrPutS( vDim, cDimTgt, vDim, 'Dimension' );
        AttrPutS( vDim, cDimTgt, sDimSub, 'Dimension' );
        AttrPutS( sSub, cDimTgt, sDimSub, 'Subset' );
        AttrPutS( sAlias, cDimTgt, sDimSub, cAliasName, 1 );
        sMDX = '';
        IF( SubsetExists( sDimHier, sSub ) = 1 );
            AttrPutN( 1, cDimTgt, sDimSub, 'showPopUp' );
            sMDX = SubsetMDXGet( sDimHier, sSub );
            IF( sMDX @<> '' );
                CellPutN( 1, cCubTgt, sDimSub, 'IsDynamic' );
                CellPutS( sMDX, cCubTgt, sDimSub, 'MDX Expression' );
            EndIF;
            IF( pForceLargeDimRefresh @= '1' );
                nEles = SubsetGetSize( sDimHier, sSub );
                CellPutN( nEles, cCubTgt, sDimSub, 'Element Count' );
            Else;
                IF( sMDX @<> '' );
                    IF( DimSiz( sDimHier ) <= nMaxDimSiz );
                        nEles = SubsetGetSize( sDimHier, sSub );
                        CellPutN( nEles, cCubTgt, sDimSub, 'Element Count' );
                    EndIF;
                Else;
                    nEles = SubsetGetSize( sDimHier, sSub );
                    CellPutN( nEles, cCubTgt, sDimSub, 'Element Count' );
                    EndIF;
                IF( DimSiz( sDimHier ) <= nMaxDimSiz );
                    nEles = SubsetGetSize( sDimHier, sSub );
                    CellPutN( nEles, cCubTgt, sDimSub, 'Element Count' );
                EndIF;
            EndIF;
        EndIF;
        # increment to next subset in dimension
        iSub = iSub + 1;
    End;
EndIf; EndIf;

######################
### END data
575,29
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.00
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

sDebugFile = cDebugFile | '_Epilog.log';

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
