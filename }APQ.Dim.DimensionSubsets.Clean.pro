601,100
602,"}APQ.Dim.DimensionSubsets.Clean"
562,"NULL"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"jA67cH@NA6zUuRxesq=G\W3fRLD`BrkLmgosDsGQh<1:r _aXGSekyhOsl[Vb;)oxP0gaCBDmX7h3EJ@c8jfz6SUk7jDSZdiM83pYg>H2bSsRG}W9hU1lGGg[m9qJ?@N0}ygk73iQ^ha71jJ}^s_At`ORDHVX\=gqjeEk_6I4xEm`^5LIUy6XA3]Wa@aaD8EX>0bH<O4jA67cH@NA6tUuRxesq=G\W3fRLD`Brk,ogosDsGQh<1:rpYaXGSekyhOsl2Rb;IjxP0GbCBDmXgm3eO@c8jfz6SUk7jLSZdiM83`Tg>H2bSsRG]J;hU1lGGg[m9qzGMN0=qGa73iQ^hA51jZz^sOEt`ORDHVX\=gqjuEk_6M4xEmPT5LIUy6X18]Wa@aaD7EY>0bH<O4"
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
588,","
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDebug
561,2
2
2
590,2
pDoProcessLogging,"1"
pDebug,"0"
637,2
pDoProcessLogging,"Record in process log"
pDebug,"Write to debug log"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,230
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

### Purpose:	Process to }APQ Dimension Subset dimension & cube

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDebug:' | pDebug;
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
bMDXGet         = IF( cTM1Ver @>= '10.2.2', 1, 0 );
cTotal          = 'Total APQ Dimensions';
cTotal2         = 'Total APQ Subsets';

cDataFolder     = CellGetS( cCubSettings, 'Location: Data Dir', 'String' );
cDataFolder     = cDataFolder | If( SubSt( cDataFolder, Long(cDataFolder ), 1) @<> '\', '\', '' );

cAliasName      = 'Caption_Default';
cDimName        = 'Dimension Name';
cSubName        = 'Subset Name';

bSkipControlObj = 0;

# Check if Planning Analytics (v11)
bPA             = 0;
IF( nTM1Ver > nVerPA );
    bPA         = 1;
EndIf;

### Get the number of subsets per dimension. Clean out dimension subset of deleted dimensions
nMax            = DIMSIZ( cDimTgt );
nCtr            = nMax;
WHILE( nCtr >= 1 );
    sDimSub = DIMNM( cDimTgt, nCtr );
    sDim = CellGetS( cCubTgt, sDimSub, cDimName );
    sSub = CellGetS( cCubTgt, sDimSub, cSubName );
    If( sDimSub @<> cTotal & DimensionExists( sDimSub ) = 0 & sSub @= '' );
        # dimension node which no longer exists
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, Expand( 'Step=deleted dims: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting dimension C element %sDimSub% from %cDimTgt%' ) );
        EndIf;
        # just delete the dimension element, if there are any subset elements they will get cleaned up in next step
        DimensionElementDelete( cDimTgt, sDimSub );
        # as the dimension doesn't exist remove the subsets
        If( SubsetExists( cDimTgt, sSub ) = 1 );
            SubsetDestroy( cDimTgt, sSub );
        EndIf;
        If( SubsetExists( cDimTgt2, sSub ) = 1 );
            SubsetDestroy( cDimTgt2, sSub );
        EndIf;
    ElseIf( DimensionExists( sDim ) = 0 & DType( cDimTgt, sDimSub ) @= 'N' & sSub @<> '' );
        # subset node belonging to dimension that doesn't exist
        IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, Expand( 'Step=deleted dims: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting subset N element %sDimSub% from %cDimTgt%' ) );
        EndIF;
        DimensionElementDelete( cDimTgt, sDimSub );
    EndIF;
    nCtr = nCtr - 1;
END;

### Loop through the subsets in the Subsets dimension & clean out subsets of deleted dimensions
sCnsl = '}APQ Subsets';
nCtr = ELCOMPN( cDimTgt, sCnsl );
WHILE( nCtr > 0 );
  sDimSub = ELCOMP( cDimTgt, sCnsl, nCtr );
  sDim = CellGetS( cCubTgt, sDimSub, cDimName );
  sSub = CellGetS( cCubTgt, sDimSub, cSubName );
   # Protect against deletion of standard subsets in case empty in the reference dimension being evaluated (as these will not be dimension names!)
  IF( sSub @= cSubDefault % sSub @= cSubAll % sSub @= cSubAllC % sSub @= cSubAllN % sSub @= cSubAllNCode % sSub @= cSubTop % sSub @= cSubDefMbr );
     # nothing
  Else;
    IF( DimensionExists( sSub ) = 0 );
      IF( SubsetExists( sDim, sSub ) = 1 );
        IF( pDebug @>= '1' );
          AsciiOutput( sDebugFile, Expand( 'Step=}APQ Subsets: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting subset %sSub% from %sDim%' ) );
        EndIF;
        SubsetDestroy( sDim, sSub );
      EndIF;
      IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, Expand( 'Step=}APQ Subsets: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting element %sDimSub% from %cDimTgt%' ) );
      EndIF;
      DimensionElementDelete( cDimTgt, sDimSub );    
    EndIF;
  EndIF;
  nCtr = nCtr - 1;
END;

### Loop through the subsets in the Cube Views dimension & clean out subsets of deleted cubes
sCnsl = '}APQ Cube Views';
nCtr = ELCOMPN( cDimTgt, sCnsl );
WHILE( nCtr > 0 );
    sDimSub = ELCOMP( cDimTgt, sCnsl, nCtr );
    sDim = CellGetS( cCubTgt, sDimSub, cDimName );
    sSub = CellGetS( cCubTgt, sDimSub, cSubName );
    If( CellGetN( cCubTgt, sDimSub, 'IsEmpty' ) = 1 );
        IF( CubeExists( sSub ) = 0 );
            IF( pDebug @>= '1' );
                AsciiOutput( sDebugFile, Expand( 'Step=}APQ Cube Views: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting element %sDimSub% from %cDimTgt%' ) );
            EndIF;
            DimensionElementDelete( cDimTgt, sDimSub );    
            IF( SubsetExists( sDim, sSub ) = 1 );
                IF( pDebug @>= '1' );
                    AsciiOutput( sDebugFile, Expand( 'Step=}APQ Cube Views: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting subset %sSub% from %sDim%' ) );
                EndIF;
                SubsetDestroy( sDim, sSub );
            EndIF;
            IF( SubsetExists( '}APQ Views', sSub ) = 1 );
                IF( pDebug @>= '1' );
                    AsciiOutput( sDebugFile, Expand( 'Step=}APQ Cube Views: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting subset %sSub% from }APQ Views' ) );
                EndIF;
                SubsetDestroy( '}APQ Views', sSub );
            EndIF;
        EndIF;
    EndIF;
    nCtr = nCtr - 1;
END;

### Loop through the subsets in the Views dimension & clean out subsets of deleted cubes
sCnsl = '}APQ Views';
nCtr = ELCOMPN( cDimTgt, sCnsl );
WHILE( nCtr > 0 );
  sDimSub = ELCOMP( cDimTgt, sCnsl, nCtr );
  sDim = CellGetS( cCubTgt, sDimSub, cDimName );
  sSub = CellGetS( cCubTgt, sDimSub, cSubName );
   # Protect against deletion of standard subsets in case empty in the reference dimension being evaluated (as these will not be cube names!)
  IF( sSub @= cSubDefault % sSub @= cSubAll % sSub @= cSubAllC % sSub @= cSubAllN % sSub @= cSubAllNCode % sSub @= cSubTop % sSub @= cSubDefMbr );
     # nothing
  Else;
    IF( CubeExists( sSub ) = 0 );
      IF( SubsetExists( sDim, sSub ) = 1 );
        IF( pDebug @>= '1' );
          AsciiOutput( sDebugFile, Expand( 'Step=}APQ Views: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting subset %sSub% from %sDim%' ) );
        EndIF;
        SubsetDestroy( sDim, sSub );
      EndIF;
      IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, Expand( 'Step=}APQ Views: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting element %sDimSub% from %cDimTgt%' ) );
      EndIF;
      DimensionElementDelete( cDimTgt, sDimSub );    
    EndIF;
  EndIF;
  nCtr = nCtr - 1;
END;

### Loop through the subsets in the Dimensions dimension & clean out subsets of deleted cubes (in }APQ Dimensions dim a subset created per cube of the dimensions in that cube)
sCnsl = '}APQ Dimensions';
nCtr = ELCOMPN( cDimTgt, sCnsl );
WHILE( nCtr > 0 );
    sDimSub = ELCOMP( cDimTgt, sCnsl, nCtr );
    sDim = CellGetS( cCubTgt, sDimSub, cDimName );
    sSub = CellGetS( cCubTgt, sDimSub, cSubName );
    IF( SubSt( sSub, 1, 6 ) @= '}Cube_' );
        IF( CubeExists( SubSt( sSub, 7, Long( sSub ) - 6 ) ) = 0 );
            IF( pDebug @>= '1' );
                AsciiOutput( sDebugFile, Expand( 'Step=}APQ Dimensions: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting element %sDimSub% from %cDimTgt%' ) );
            EndIF;
            DimensionElementDelete( cDimTgt, sDimSub );    
            IF( SubsetExists( sDim, sSub ) = 1 );
                IF( pDebug @>= '1' );
                    AsciiOutput( sDebugFile, Expand( 'Step=}APQ Dimensions: sDimSub:%sDimSub% sDim:%sDim% sSub:%sSub% deleting subset %sSub% from %sDim%' ) );
                EndIF;
                SubsetDestroy( sDim, sSub );
            EndIF;
        EndIF;
    EndIF;
    nCtr = nCtr - 1;
END;

### Set data source
DatasourceType = 'NULL';

### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,29
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
576,
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
