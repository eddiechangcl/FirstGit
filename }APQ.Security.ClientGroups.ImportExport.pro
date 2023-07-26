601,100
602,"}APQ.Security.ClientGroups.ImportExport"
562,"CHARACTERDELIMITED"
586,"D:\TM1Models\CAMAuthentication\Export\CAMUsers.csv"
585,"D:\TM1Models\CAMAuthentication\Export\CAMUsers.csv"
564,
565,"wsU4dawUAMQBv>9637gTk<qa@bH0Q?CJakV3wDl]4k4t2Gypp7E7LWU]:pyaI[IsqirE^[dDaBT9bT<6LyEg5:ZE6zaCY_xc8df0v;JiWMCkE2B^J@w1IqnUe^0bJ[\hvubN2Fs[icdpgV:z8O1DW:YqX=ITZNCzXX00E<MATwhDBBBMqSB^;OSXq9QdPbBCD`x\?Vn;"
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
568,"'"
570,
571,
569,1
592,0
599,1000
560,4
pDim
pMode
pCAMOnly
pImportFile
561,4
2
2
2
2
590,4
pDim,"}Clients"
pMode,"Export"
pCAMOnly,"0"
pImportFile,""
637,4
pDim,"Mandatory: target dimension }Clients or }Groups or }ClientGroups for group memberships"
pMode,"Mandatory: Import, Export or Duplicate (Default if blank = Export)"
pCAMOnly,"Optional: Only import/Export CAM Users/Groups (Default if blank ALL elements)"
pImportFile,"Mandatory if mode = Import: The file of Users or Groups to import"
577,3
vCAMID
vDisplayAlias
vUniqueID
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,122
##############################################################################################################
#Region - Header
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
#Region @DOC
### PURPOSE:
###     Import CAM users from a flat file
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Logging
pDoProcessLogging   = '1';
sThisProcName       = GetProcessName();
### Params
sProcLogParams      = Expand('pDim:%pDim% & pMode:%pMode% & pCAMOnly:%pCAMOnly% & pImportFile:%pImportFile%');
### Params
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total Years', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
#EndRegion - Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

cCubSrc         = '}ClientGroups';
cDimTgt         = pDim;
cCubParam       = '}APQ Settings';
cAlias          = '}TM1_DefaultDisplayValue';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cExportLoc       = CellGetS( cCubParam, 'Location: Export', 'String' );
nErr            = 0;
sErr            = '';

### Need to set quote & delim (can't use framework default quote as can't use "
DatasourceASCIIDelimiter        = ',';
DatasourceASCIIQuoteCharacter   = '''';

### Check Params
If( cDimTgt @= '' ); cDimTgt = '}Clients'; EndIf;
If( cDimTgt @<> '}Clients' & cDimTgt @<> '}Groups' & cDimTgt @<> '}ClientGroups' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid target dimension ' | cDimTgt;
EndIf;

If( pMode @<> 'Import' & pMode @<> 'Export' & pMode @<> 'Duplicate' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid mode ' | pMode;
EndIf;

If( pMode @= 'Import' & FileExists( pImportFile ) = 0 );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid source file ' | pImportFile;
EndIf;

If( pMode @= 'Duplicate' );
    pCAMOnly = '1';
EndIf;

If( pMode @= 'Duplicate' & cDimTgt @= '}Groups' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Duplicate mode can only be used for }Clients!';
EndIf;

If( pCAMOnly @= '' ); pCAMOnly = '0'; EndIf;

If( pMode @= 'Export' );
    If( SubSt( cExportLoc, Long(cExportLoc), 1 ) @<> '\' ); cExportLoc = cExportLoc | '\'; EndIf;
    If( cDimTgt @= '}Clients' );
        cExportFile = cExportLoc | 'UserExport.csv';
    ElseIf( cDimTgt @= '}Groups' );
        cExportFile = cExportLoc | 'GroupExport.csv';
    Else;
        cExportFile = cExportLoc | 'UserGroupExport.csv';
    EndIf;
EndIf;

### Error check
If( nErr > 0 );
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIf;

### Set Data Source
If( cDimTgt @= '}ClientGroups' );
    cDimTgt = '}Clients';
EndIf;
If( pMode @= 'Import' );
    DataSourceType              = 'CHARACTERDELIMITED';
    DataSourceNameForServer     = pImportFile;
    DataSourceASCIIHeaderRecords= 1;
Else;
    cDimSrc                     = cDimTgt;
    DataSourceType              = 'SUBSET';
    DataSourceNameForServer     = cDimSrc;
    DataSourceDimensionSubset   = 'ALL';    
EndIf;

### Make sure display alias exists
If( DimIx( '}ElementAttributes_' | cDimTgt, cAlias ) = 0 );
    AttrInsert( cDimTgt, '', cAlias, 'A' );
EndIf;
573,98
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
   nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

### Header
If( pMode @= 'Export' & nMetadataRecordCount = 1 );
    If( pDim @= '}ClientGroups' );
        ASCIIOutput( cExportFile, 'UserID', 'GroupID', 'Member' );
    ElseIf( cDimTgt @= '}Clients' );
        ASCIIOutput( cExportFile, 'CAMID', 'Display Alias', 'UniqueID' );
    ElseIf( cDimTgt @= '}Groups' );
        ASCIIOutput( cExportFile, 'CAMID', 'Display Alias', '' );
    EndIf;
EndIf;

### Skip Admin
If( vCAMID @= 'Admin' );
    ItemSkip;
EndIf;

### Check for CAM User/Group
If( pCAMOnly @>= '1' & SubSt( vCAMID, 1, 7 ) @<> 'CAMID("' );
    ItemSkip;
EndIf;

### Add user or group if mode is import
If( pMode @= 'Import' );
    If( cDimTgt @= '}Clients' );
        If( DimIx( cDimTgt, vCAMID ) = 0 );
            AddClient( vCAMID );
        EndIf;
        If( pDim @= '}ClientGroups' );
            AddGroup( vDisplayAlias );
        EndIf;
    ElseIf( cDimTgt @= '}Groups' );
        If( DimIx( cDimTgt, vCAMID ) = 0 );
            AddGroup( vCAMID );
        EndIf;
    EndIf;
EndIf;

### Duplicate (Only for users) 
If( pMode @= 'Duplicate' );
    sUniqueID = CellGetS( '}ClientProperties', vCAMID, 'UniqueID' );
    If( sUniqueID @= '' );
        LogOutput( 'WARN', Expand('Cannot convert user %vCAMID% No UniqueID') );
        ItemSkip;
    ElseIf( Scan( '@', sUniqueID ) = 0 );
        LogOutput( 'WARN', Expand('Cannot convert user %vCAMID% Malformed UniqueID %sUniqueID%') );
        ItemSkip;
    EndIf;
    sTM1Usr = SubSt( sUniqueID, 1, Scan( '@', sUniqueID ) - 1 );
    If( DimIx( cDimTgt, sTM1Usr ) = 0 );
        AddClient( sTM1Usr );  
    EndIf;
EndIf;

### Export
If( pMode @= 'Export' );
    If( pDim @= '}ClientGroups' );
        nMax = DimSiz( '}Groups' );
        nCtr = 1;
        While( nCtr <= nMax );
            sGrp = DimNm( '}Groups', nCtr );
            sMember = CellGetS( cCubSrc, vCAMID, sGrp );
            If( sMember @= sGrp );
                ASCIIOutput( cExportFile, vCAMID, sGrp, '1' );
            EndIf;
            nCtr = nCtr + 1;
        End;
    Else;
        sAlias = AttrS( cDimSrc, vCAMID, cAlias );
        sUniqueID = '';
        If( CubeExists( '}ClientProperties' ) = 1 & cDimTgt @= '}Clients' );
            sUniqueID = CellGetS( '}ClientProperties', vCAMID, 'UniqueID' );
        EndIf;
        ASCIIOutput( cExportFile, vCAMID, sAlias, sUniqueID );
    EndIf;
EndIf;

######################
### END Metadata

574,146
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

If( pMode @= 'Export' );
    ItemSkip;
EndIf;
    
IF( pDoProcessLogging @= '1' );
   nDataRecordCount = nDataRecordCount + 1;
EndIF;

### Skip Admin
If( vCAMID @= 'Admin' );
    ItemSkip;
EndIf;

### Check for CAM User/Group
If( pCAMOnly @>= '1' & SubSt( vCAMID, 1, 7 ) @<> 'CAMID("' );
    ItemSkip;
EndIf;

If( pMode @= 'Import' );
    If( pDim @= '}ClientGroups' );
        AssignClientToGroup( vCAMID, vDisplayAlias );
    Else;
        If( DimIx( cDimTgt, vCAMID ) > 0 & DimIx( cDimTgt, vDisplayAlias ) = 0 );
            If( CellIsUpdateable( '}ElementAttributes_' | cDimTgt, vCAMID, cAlias ) = 1 );
                AttrPutS( vDisplayAlias, cDimTgt, vCAMID, cAlias, 1 );
            EndIf;
            If( cDimTgt @= '}Clients' );
                If( CellIsUpdateable( '}ClientProperties', vCAMID, 'UniqueID' ) = 1 );
                    CellPutS( vUniqueID, '}ClientProperties', vCAMID, 'UniqueID' );
                EndIf;
            EndIf;
        EndIf;
    EndIf;
EndIf;

# Duplicate is valid only for }Clients
If( pMode @= 'Duplicate' );
    sUniqueID = CellGetS( '}ClientProperties', vCAMID, 'UniqueID' );
    If( Scan( '@', sUniqueID ) = 0 );
        ItemSkip;
    EndIf;
    sTM1Usr = SubSt( sUniqueID, 1, Scan( '@', sUniqueID ) - 1 );
    If( DimIx( cDimTgt, sTM1Usr ) > 0 );
        
        # Replicate group memberships from CAM user to TM1 authentication user
        sDim = '}Groups';
        nMax = DimSiz( sDim );
        nCtr = 1;
        While( nCtr <= nMax );
            sGrp = DimNm( sDim, nCtr );
            If( CellGetS( '}ClientGroups', vCAMID, sGrp ) @= sGrp );
                AssignClientToGroup( sTM1Usr, sGrp );
            EndIf;
            nCtr = nCtr + 1;
        End;
        
        # Modify }TM1_DefaultDisplayValue Alias to substitute "TM1" for the CAMNamespace Name
        # CAM Alias could be either separated with \ or /
        sAlias = AttrS( cDimSrc, vCAMID, cAlias );
        If( Scan( '/', sAlias ) > 0 );
            sNewAlias = 'TM1' | SubSt( sAlias, Scan( '/', sAlias ), 50 );
        Else;
            sNewAlias = 'TM1' | SubSt( sAlias, Scan( '\', sAlias ), 50 );
        EndIf;
        If( CellIsUpdateable( '}ElementAttributes_' | cDimTgt, sTM1Usr, cAlias ) = 1 );
            AttrPutS( sNewAlias, cDimTgt, sTM1Usr, cAlias, 1 );
        EndIf;
        
        # Copy any attributes from source to target user
        sDim = '}ElementAttributes_' | cDimTgt;
        If( CubeExists( sDim ) = 1 );
            nMax = DimSiz( sDim );
            nCtr = 1;
            While( nCtr <= nMax );
                sProperty = DimNm( sDim, nCtr );
                If( CellIsUpdateable( sDim, sTM1Usr, cAlias ) = 1 );
                    If( sProperty @= cAlias );
                    ElseIf( DType( sDim, sProperty ) @= 'AA' );
                        AttrPutS( sNewAlias, cDimTgt, sTM1Usr, sProperty, 1 );
                    ElseIf( DType( sDim, sProperty ) @= 'AN' );
                        AttrPutN( AttrN( cDimTgt, vCAMID, sProperty ), cDimTgt, sTM1Usr, sProperty );
                    Else;
                        AttrPutS( AttrS( cDimTgt, vCAMID, sProperty ), cDimTgt, sTM1Usr, sProperty );
                    EndIf;
                EndIf;
                nCtr = nCtr + 1;
            End;
        EndIF;
        
        # Copy any client properties from source to target user
        sDim = '}ClientProperties';
        If( CubeExists( sDim ) = 1 );
            nMax = DimSiz( sDim );
            nCtr = 1;
            While( nCtr <= nMax );
                sProperty = DimNm( sDim, nCtr );
                If( CellIsUpdateable( sDim, sTM1Usr,  sProperty ) = 1 & sProperty @<> 'ACTIVE' );
                    If( DType( sDim, sProperty ) @= 'S' );
                        CellPutS( CellGetS( sDim, vCAMID,  sProperty ), sDim, sTM1Usr,  sProperty );
                    Else;
                        CellPutN( CellGetN( sDim, vCAMID,  sProperty ), sDim, sTM1Usr,  sProperty );
                    EndIf;
                EndIf;
                nCtr = nCtr + 1;
            End;
        EndIF;
        
        # Copy any client settings from source to target user
        sDim = '}ClientSettings';
        If( CubeExists( sDim ) = 1 );
            nMax = DimSiz( sDim );
            nCtr = 1;
            While( nCtr <= nMax );
                sProperty = DimNm( sDim, nCtr );
                If( CellIsUpdateable( sDim, sTM1Usr,  sProperty ) = 1 );
                    If( DType( sDim, sProperty ) @= 'S' );
                        CellPutS( CellGetS( sDim, vCAMID,  sProperty ), sDim, sTM1Usr,  sProperty );
                    Else;
                        CellPutN( CellGetN( sDim, vCAMID,  sProperty ), sDim, sTM1Usr,  sProperty );
                    EndIf;
                EndIf;
                nCtr = nCtr + 1;
            End;
        EndIF;

    EndIf;
EndIf;

######################
### END Metadata

575,30
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

#Region - Finalize Logging
##############################################################################################################
### Logging - common script 	----------------- START
### ( Place as last code block on epilog )
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
#EndRegion
### END Epilog
576,
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
