601,100
602,"}APQ.Security.Objects.LoadAccessRights"
562,"VIEW"
586,"}APQ Security Manage Object Access"
585,"}APQ Security Manage Object Access"
564,
565,"zFvFU7]nVE4QaGUM<LkCwC7ctBaxsmh_nyxn3hOg2ure7BCX0aE0I`pzjzDVgjhoaetU=]oPvu:meamrER6h?yte2QOT<bym_iNbz72vn02pL:6uJT`j2SrZdpQw4M8TYhztqZ7j:W12xh8JWzP`@x7d]d5o^eROhqKLvmFy?5X4fJL?blrGjTh:_VQsqZDx2@i_9uN1"
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
570,Set Dimension Security
571,
569,0
592,0
599,1000
560,7
pDoProcessLogging
pDebug
pObjTyp
pGroup
pDelimiter
pMode
pSecurityRefresh
561,7
2
2
2
2
2
2
2
590,7
pDoProcessLogging,"1"
pDebug,"0"
pObjTyp,""
pGroup,""
pDelimiter,""
pMode,"0"
pSecurityRefresh,"1"
637,7
pDoProcessLogging,"Optional: Record in process log"
pDebug,"Optional: Write debug log file?"
pObjTyp,"Optional: Object Type (optional) Blank = ALL"
pGroup,"Optional: Group(s) to include Blank = ALL"
pDelimiter,"Optional: Element List delimiter for use in object type & groups list (Blank = take value from framework element delimiter settings)"
pMode,"Optional: Simulate mode? If true then simulate only and change only the ""permission level"" measure with no change to security model (Default = false)"
pSecurityRefresh,"Optional: security refresh"
577,6
vGrp
vObjTyp
vPermissionNo
vObject
vMeasure
Value
578,6
2
2
2
2
2
2
579,6
1
2
3
4
5
6
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,6
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,261
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
###     Manage security for all objects types all in one place
### DATA SOURCE:
###     Cube: }APQ Security Manage Object Access
### INTENDED USAGE:
###     Set security to TM1 security cubes
#EndRegion @DOC
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2018-03-10 		    SW   	    Creation of Process
### 2019-03-22          SW          Modify for addition of permission index dim to source cube
### 2019-09-18          SW          Fix 1, remove sending blank to sec cube on data (as need to aggregate over all permissions). Fix 2, convert CubeClearData to loop on groups & objects (as due to server bug CubeClearData "divorces" security model from security cubes)
### 2019-09-28          SW          Add check for new object (#0246). New req to add app security from lowest level (#0244)
### 2020-01-07 		    SW   	    FIX:#188 (add docstring)
### 2020-12-14 		    SW   	    FIX:#324 enhance object security model
##############################################################################################################

##############################################################################################################
#Region - Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pObjTyp:%pObjTyp% & pGroup:%pGroup% & pDelimiter:%pDelimiter% & pMode:%pMode% & pSecurityRefresh:%pSecurityRefresh%');
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
#EndRegion - Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################
### Prolog script commences

######################
### Inits - declare constants

cCubSrc         = '}APQ Security Manage Object Access';
cDimSecLvl      = '}APQ Security Level';
cDimSrc         = '}APQ Groups';
cDimObjTyp      = '}APQ TM1 Object Type';
cDimPermission  = '}APQ Security Permission Index';
cDimObject      = '}APQ TM1 Objects';
cDimApps        = '}APQ Applications';
cDimM           = cCubSrc | ' Measure';
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
cExportLoc      = CellGetS( cCubParam, 'Location: Export', 'String' );
cExportFile     = cViewSrc | '.csv';
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
sDelimField     = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
sQuoteField     = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );
nErr            = 0;
sErr            = '';
sSubProc        = '}APQ.Cub.SecurityManageObjectAccess.Update.DimFromCube';
cDimGrp         = '}Groups';
cFilter         = '';

######################
### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

# Is framework licensed?
If( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Customer key not found!';
EndIf;

# element list delimiter
If( pDelimiter @= '' );
    pDelimiter = sDelimEle;
Else;
    sDelimEle = pDelimiter;
EndIf;

If( pDelimiter @= sDelimEleStart );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('Conflict of list delimiter %pDelimiter% with bedrock element start delimiter!');
ElseIf( pDelimiter @= sDelimDim );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('Conflict of list delimiter %pDelimiter% with bedrock dimension delimiter!');
EndIf;

# object type
If( pObjTyp @<> '' );
    If( DimIx( cDimObjTyp, pObjTyp ) = 0 & Scan( pDelimiter, pObjTyp ) = 0 );
        nErr = 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid object type parameter ' | pObjTyp;
    Else;
        cFilter = Expand('%cDimObjTyp%%sDelimEleStart%%pObjTyp%%sDelimDim%');
    EndIf;
EndIf;

# group(s)
iGrp = 1;
bAddGrp = 0;
While( iGrp <= DimSiz( cDimSrc ) );
    sGrp = DimNm( cDimSrc, iGrp );
    IF( DType( cDimSrc, sGrp ) @= 'N' & DimIx( cDimGrp, sGrp ) = 0 );
        bAddGrp = 1;
    EndIF;
    iGrp = iGrp + 1;
End;
IF( bAddGrp = 1 );
    sProc = '}APQ.Dim.ControlDimensionCopies.Update';
    nRet = ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' );
EndIF;

If( pGroup @<> '' );
    If( DimIx( cDimSrc, pGroup ) = 0 & Scan( pDelimiter, pGroup ) = 0 );
        nErr = 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid group parameter ' | pGroup;
    Else;
        cFilter = Expand('%cDimSrc%%sDelimEleStart%%pGroup%%sDelimDim%');
    EndIf;
EndIf;

# mode (simulate or change security model)
If( pMode @= '1' % pMode @= 'Y' % pMode @= 'YES' % pMode @= 'T' % pMode @= 'TRUE' );
    pMode = '1';
Else;
    pMode = '0';
EndIf;

#SecurityRefresh (false if simulation mode)
If( pSecurityRefresh @= '1' % pSecurityRefresh @= 'Y' % pSecurityRefresh @= 'YES' % pSecurityRefresh @= 'T' % pSecurityRefresh @= 'TRUE' );
    pSecurityRefresh = '1';
Else;
    pSecurityRefresh = '0';
EndIf;

If( pMode @>= '1' );
    pSecurityRefresh = '0';
EndIf;

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
### Create Source View using Permission Level
sProc           = '}bedrock.cube.view.create';
sFilter         = Expand('%cFilter%%cDimM%%sDelimEleStart%Permission Level');
bSuppressNull   = 1;
bSuppressC      = 0;
bSuppressRule   = 0;
nRet = ExecuteProcess( sProc, 'pLogOutput', nDebug, 
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1
);

######################
### Clear Target Security Cube(s)

If( pMode @= '0' );
    If( pObjTyp @<> '' );
        sCubTgt = AttrS( cDimObjTyp, pObjTyp, 'SysSecObjNm' );
        If( CubeExists( sCubTgt ) = 1 );
            If( pGroup @= '' );
                CubeClearData( sCubTgt );
            Else;
                sProc = '}bedrock.cube.data.clear';
                ExecuteProcess( sProc, 'pLogOutput', nDebug, 'pStrictErrorHandling', 1,
                    'pCube', sCubTgt, 'pView', '', 'pFilter', Expand('}Groups%sDelimEleStart%%pGroup%'),
                    'pFilterParallel', '', 'pParallelThreads', 0,
                    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
                    'pCubeLogging', 0, 'pTemp', 1, 'pSandbox', '', 'pSubN', 0
                );
            EndIf;
        EndIf;
    Else;
        iObjTyp = 1;
        While( iObjTyp <= DimSiz( cDimObjTyp ) );
            sObjTyp = DimNm( cDimObjTyp, iObjTyp );
            sCubTgt = AttrS( cDimObjTyp, sObjTyp, 'SysSecObjNm' );
            If( CubeExists( sCubTgt ) = 1 );
                If( pGroup @= '' );
                    CubeClearData( sCubTgt );
                Else;
                    sProc = '}bedrock.cube.data.clear';
                    ExecuteProcess( sProc, 'pLogOutput', nDebug, 'pStrictErrorHandling', 1,
                        'pCube', sCubTgt, 'pView', '', 'pFilter', Expand('}Groups%sDelimEleStart%%pGroup%'),
                        'pFilterParallel', '', 'pParallelThreads', 0,
                        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
                        'pCubeLogging', 0, 'pTemp', 1, 'pSandbox', '', 'pSubN', 0
                    );
                EndIf;
            EndIf;
            iObjTyp = iObjTyp + 1;
        End;
    EndIf;
EndIf;

######################
### Assign data source

DataSourceType          = 'VIEW';
DataSourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,226
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

# Need to include C element "Total APQ TM1 Objects" from dim }APQ TM1 Objects for wildcard, attribute & all permissions. But otherwise need to skip C elements in other dims
If( DType( cDimSrc, vGrp ) @<> 'N' % DType( cDimObjTyp, vObjTyp ) @<> 'N' % DType( cDimPermission, vPermissionNo ) @<> 'N' );
    ItemSkip;
EndIf;

# skip if permission index is "All Permissions"
If( vPermissionNo @= 'All Permissions' );
    ItemSkip;
EndIf;

# check if record is flagged as inactive
If( CellGetN( cCubSrc, vGrp, vObjTyp, vPermissionNo, vObject, 'Inactive' ) = 1 );
    ItemSkip;
EndIf;

# what sec level
sSecLevel = sValue;
If( DimIx( cDimSecLvl, sSecLevel ) = 0 );
    ItemSkip;
EndIf;

# Update against permission ID. For security cube updates determine whether to update security based on cummulative model (level of permission must be >= highest permission accross all permission indcies)
nPermission     = CellGetN( cCubSrc, vGrp, vObjTyp, vPermissionNo, vObject, 'Permission Numeric' );
nPermissionAll  = CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', vObject, 'Permission Numeric' );
If( nPermission >= nPermissionAll );
    bUpdateSec  = 1;
Else;
    bUpdateSec  = 0;
EndIf;

# based on object type get names of dimension and sec cube
sDimTgt     = AttrS( cDimObjTyp, vObjTyp, 'SysObjNm' );
sCubTgt     = AttrS( cDimObjTyp, vObjTyp, 'SysSecObjNm' );
sObjTotal   = 'Total APQ ' | vObjTyp | If( vObjTyp @= 'Process', 'es', 's' );

# Check if set for all objects
If( vObject @= 'Total APQ TM1 Objects' );
    # Determine the security level being applied from the global setting
    nPermission = StringToNumber( DimensionElementPrincipalName( cDimSecLvl, sSecLevel ) );

    # Loop through all objects and set security
    sType   = CellGetS( cCubSrc, vGrp, vObjTyp, vPermissionNo, vObject, 'Permission Type' );
    If( sType @<> 'ALL' & sType @<> 'WILDCARD' & sType @<> 'ATTRIBUTE' );
        ItemSkip;
    EndIf;
    sMatch  = Lower( CellGetS( cCubSrc, vGrp, vObjTyp, vPermissionNo, vObject, 'Wildcard Entry' ) );
    sAttrNm = CellGetS( cCubSrc, vGrp, vObjTyp, vPermissionNo, vObject, 'Attribute Name' );
    If( sType @= 'ATTRIBUTE' );
        If( DimIx( '}ElementAttributes_' | sDimTgt, sAttrNm ) = 0 );
            LogOutput( 'WARN', Expand('Attribute %sAttrNm% not found in dimension %sDim%.') );
            ItemSkip;
        EndIf;
        If( pDebug @>= '1' );
            LogOutput( 'INFO', Expand('Grp:%vGrp% Dim:%sDimTgt% AttrName:%sAttrNm% AttrValue:%sMatch%') );
        EndIf;
    EndIf;
    If( sType @= 'WILDCARD' );
        If( Scan( '*', sMatch ) = 0 );
            sWildcardType = 'Contains';
        ElseIf( SubSt( sMatch, 1, 1 ) @= '*' & SubSt( sMatch, Long(sMatch), 1 ) @= '*' );
            sWildcardType = 'Contains';
            sMatch = SubSt( sMatch, 2, Long(sMatch) - 2 );
        ElseIf( SubSt( sMatch, Long(sMatch), 1 ) @= '*' );
            sWildcardType = 'Starts';
            sMatch = SubSt( sMatch, 1, Long(sMatch) - 1 );
        Else;
            sWildcardType = 'Ends';
            sMatch = SubSt( sMatch, 2, Long(sMatch) - 1 );
        EndIf;
        If( pDebug @>= '1' );
            LogOutput( 'INFO', Expand('Grp:%vGrp% Dim:%sDimTgt% Wildcard:%sMatch% WildcardType:%sWildcardType%') );
        EndIf;
    EndIf;
    nMax = DimSiz( sDimTgt );
    nCtr = 1;
    While( nCtr <= nMax );
        bAssign = 1;
        sObj = DimNm( sDimTgt, nCtr );
        If( vObjTyp @= 'Dimension' & ( Scan( ':', sObj ) > 0 % Scan( '}Hierarchies_', sObj ) = 1 % Scan( '}Subsets_', sObj ) = 1 % Scan( '}Views_', sObj ) = 1 ) );
            # Skip as can't assign dimension security to a hierarchy and hierarchy elements & new control objects don't exist in APQ TM1 Objects dimension
            bAssign = 0;
        Else;
            If( DimIx( cDimObject, sObj ) = 0 );
                DimensionElementInsertDirect( cDimObject, '', sObj, 'N' );
                DimensionElementComponentAddDirect( cDimObject, sObjTotal, sObj, 1 );
            EndIf;
            If( sType @= 'ALL' );
                If( pDebug @>= '1' );
                    ASCIIOutput( sDebugFile, vGrp, vObjTyp, vPermissionNo, vObject, vMeasure, sValue, sType, sType, sObj, sSecLevel );
                EndIf;
                CellPutS( sSecLevel, cCubSrc, vGrp, vObjTyp, vPermissionNo, sObj, 'Permission Level' );
                If( pMode @= '0' & CellIsUpdateable( sCubTgt, sObj, vGrp ) = 1 );
                    CellPutS( sSecLevel, sCubTgt, sObj, vGrp );
                EndIf;
            ElseIf( sType @= 'WILDCARD' );
                If( sWildcardType @= 'Contains' & Scan( sMatch, Lower( sObj ) ) > 0 );
                ElseIf( sWildcardType @= 'Starts' & Scan( sMatch, Lower( sObj ) ) = 1 );
                ElseIf( sWildcardType @= 'Ends' & sMatch @= SubSt( sObj, Scan( sMatch, Lower( sObj ) ), Long( sObj ) ) );
                Else;
                    bAssign = 0;
                EndIf;
            ElseIf( sType @= 'ATTRIBUTE' );
                If( AttrS( sDimTgt, sObj, sAttrNm ) @= sMatch );
                Else;
                    bAssign = 0;
                EndIf;
            EndIf;
            If( bAssign = 1 );
                nPermissionAll = CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', sObj, 'Permission Numeric' );
                If( nPermission >= nPermissionAll );
                    bUpdateSec = 1;
                Else;
                    bUpdateSec = 0;
                EndIf;
                If( CellIsUpdateable( cCubSrc, vGrp, vObjTyp, vPermissionNo, sObj, 'Permission Level' ) = 1 );
                    CellPutS( sSecLevel, cCubSrc, vGrp, vObjTyp, vPermissionNo, sObj, 'Permission Level' );
                EndIf;
                If( bUpdateSec = 1 );
                    If( pDebug @>= '1' );
                        ASCIIOutput( sDebugFile, vGrp, vObjTyp, vPermissionNo, vObject, vMeasure, sValue, sType, sMatch, sObj, sSecLevel );
                    EndIf;
                    If( pMode @= '0' & CellIsUpdateable( sCubTgt, sObj, vGrp ) = 1 );
                        CellPutS( sSecLevel, sCubTgt, sObj, vGrp );
                    EndIf;
                    # Application security: Handle CW China requirement to allocate at lower level and fill in READ path to root with NONE for siblings where no explicit permission given
                    If( vObjTyp @= 'Application' );
                        If( CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', ElPar( cDimApps, sObj, 1 ), 'Permission Numeric' ) < nPermission );
                            sPar = ElPar( cDimApps, sObj, 1 );
                            sSlf = sObj;
                            While( sPar @<> '}Applications' & sPar @<> '' );
                                # If parent has no access then need to grant access in order to be able to see object security granted to at lower level  
                                If( pMode @= '0' & CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', sPar, 'Permission Numeric' ) <= 1 & CellIsUpdateable( sCubTgt, sPar, vGrp ) = 1 );
                                    CellPutS( 'READ', sCubTgt, sPar, vGrp );
                                EndIf;
                                # Loop siblings and if no specific security entered in source cube then set to NONE in target cube
                                iSib = 1;
                                nSib = ElCompN( cDimApps, sPar );
                                While( iSib <= nSib );
                                    sSib = ElComp( cDimapps, sPar, iSib );
                                    If( pMode @= '0' & sSib @<> sSlf & CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', sSib, 'Permission Numeric' ) = 0 & CellGetS( sCubTgt, sSib, vGrp ) @= '' & CellIsUpdateable( sCubTgt, sSib, vGrp ) = 1 );
                                        CellPutS( 'NONE', sCubTgt, sSib, vGrp );
                                    EndIf;
                                    iSib = iSib + 1;
                                End;
                                # move on to next parent up
                                sSlf = sPar;
                                sPar = ElPar( cDimApps, sPar, 1 );
                            End;
                        EndIf;
                    EndIf;
                EndIf;
            ElseIf( CellIsUpdateable( cCubSrc, vGrp, vObjTyp, vPermissionNo, sObj, 'Permission Level' ) = 1 );
                If( pDebug @>= '1' );
                    ASCIIOutput( sDebugFile, vGrp, vObjTyp, vPermissionNo, vObject, vMeasure, sValue, sType, sMatch, sObj, 'NONE' );
                EndIf;
                CellPutS( '', cCubSrc, vGrp, vObjTyp, vPermissionNo, sObj, 'Permission Level' );
            EndIf;
        EndIf;
        nCtr = nCtr + 1;
    End;
Else;
    # Check that object being processed in APQ Obj dim still exists in target dim
    If( DimIx( sDimTgt, vObject ) = 0 );
        ItemSkip;
    EndIf;
    # Set security for single object
    If( pDebug @>= '1' );
        ASCIIOutput( sDebugFile, vGrp, vObjTyp, vPermissionNo, vObject, vMeasure, sValue, 'POINT' );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( sCubTgt, vObject, vGrp ) = 1 & bUpdateSec = 1 );
        CellPutS( sSecLevel, sCubTgt, vObject, vGrp );
    EndIf;
    # Application security: Handle CW China requirement to allocate at lower level and fill in READ path to root with NONE for siblings where no explicit permission given
    If( vObjTyp @= 'Application' ); 
        If( CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', ElPar( cDimApps, vObject, 1 ), 'Permission Numeric' ) < nPermission );
            sPar = ElPar( cDimApps, vObject, 1 );
            sSlf = vObject;
            While( sPar @<> '}Applications' & sPar @<> '' );
                # If parent has no access then need to grant access in order to be able to see object security granted to at lower level  
                If( pMode @= '0' & CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', sPar, 'Permission Numeric' ) <= 1 & CellIsUpdateable( sCubTgt, sPar, vGrp ) = 1 );
                    CellPutS( 'READ', sCubTgt, sPar, vGrp );
                EndIf;
                # Loop siblings and if no specific security entered in source cube then set to NONE in target cube
                iSib = 1;
                nSib = ElCompN( cDimApps, sPar );
                While( iSib <= nSib );
                    sSib = ElComp( cDimapps, sPar, iSib );
                    If( pMode @= '0' & sSib @<> sSlf & CellGetN( cCubSrc, vGrp, vObjTyp, 'All Permissions', sSib, 'Permission Numeric' ) = 0 & CellGetS( sCubTgt, sSib, vGrp ) @= '' & CellIsUpdateable( sCubTgt, sSib, vGrp ) = 1 );
                        CellPutS( 'NONE', sCubTgt, sSib, vGrp );
                    EndIf;
                    iSib = iSib + 1;
                End;
                # move on to next parent up
                sSlf = sPar;
                sPar = ElPar( cDimApps, sPar, 1 );
            End;
        EndIf; 
    EndIf;
EndIf;

######################
### END Data
575,108
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
### If updating for all object types or for dimensions then update the dimension dependencies

# This must be done on epilog as for "dependent security" if the "primary security" is set by wildcard or attribute then the dependent objects will be cleared on the data tab
If( nErr = 0 & ( pObjTyp @= 'Cube' % Scan('Cube' | pDelimiter, pObjTyp ) > 0 % pObjTyp @= 'Dimension' % Scan('Dimension' | pDelimiter, pObjTyp ) > 0 % pObjTyp @= '' ) );
    ExecuteProcess( sSubProc, 'pGroup', pGroup, 'pDelimiter', pDelimiter, 'pMode', pMode );
EndIf;

cExportFile = cExportLoc | IF( SubSt( cExportLoc, Long( cExportLoc ), 1 ) @<> '\', '\', '' ) | cExportFile;
If( FileExists( cExportFile ) = 1 );
    ASCIIDelete( cExportFile );
EndIf;

### Application Security is a special case. It is similar to element security except the default access level is READ. So for groups with no assignment we need to fill in NONE at the root folder level
If( pMode @= '0' & pObjTyp @= 'Application' % pObjTyp @= '' );
    sCubTgt = '}ApplicationSecurity';
    sDimApp = '}ApplicationEntries';
    sParApp = '}Applications';
    nMaxApp = ElCompN( sDimApp, sParApp );
    nCtrApp = 1;
    While( nCtrApp <= nMaxApp );
        sApp    = ElComp( sDimApp, sParApp, nCtrApp );
        nMaxGrp = DimSiz( cDimGrp );
        nCtrGrp = 1;
        While( nCtrGrp <= nMaxGrp );
            sGrp = DimNm( cDimGrp, nCtrGrp );
            If( sGrp @= 'ADMIN' % sGrp @= 'SecurityAdmin' % sGrp @= 'DataAdmin' % sGrp @= 'OperationsAdmin' );
                # Special built-in groups, do nothing.
            Else;
                If( CellGetS( sCubTgt, sApp, sGrp ) @= '' );
                    # Replace blank with NONE
                    CellPutS( 'NONE', sCubTgt, sApp, sGrp );
                EndIf;
            EndIf;
            nCtrGrp = nCtrGrp + 1;
        End;
        nCtrApp = nCtrApp + 1;
    End;
EndIf;

### Get alternate hierarchy permissions from main dimension
If( pMode @= '0' & CubeExists( '}DimensionSecurity' ) = 1 );
    iDim    = 1;
    nDimMax = DimSiz( '}Dimensions');
    While( iDim <= nDimMax );
        sDim = DimNm( '}Dimensions', iDim );
        If( Scan( ':', sDim ) > 1 );
            sDimHier = sDim;
            sDim = SubSt( sDim, 1, Scan( ':', sDim ) - 1 );
            # loop groups
            iGrp = 1;
            nGrpMax = DimSiz( '}Groups' );
            While( iGrp <= nGrpMax );
                sGrp = DimNm( '}Groups', iGrp );
                # Check that object doesn't have permissions set against it directly
                sPermissionHier = CellGets( '}DimensionSecurity', sDimHier, sGrp );
                sPermissionDim  = CellGets( '}DimensionSecurity', sDim, sGrp );
                If( sPermissionHier @= '' & sPermissionDim @<> '' & CellIsUpdateable( '}DimensionSecurity', sDimHier, sGrp ) = 1 );
                    CellPutS( sPermissionDim, '}DimensionSecurity', sDimHier, sGrp );
                EndIf;
                iGrp = iGrp + 1;
            End;
        EndIf;
        iDim = iDim + 1;
    End;
EndIf;

######################
### SecurityRefresh

If( pMode @= '0' & pDebug @= '0' & pSecurityRefresh @= '1' );
    sProc = '}bedrock.security.refresh';
    ExecuteProcess( sProc, 'pLogOutput', nDebug );
EndIf;

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
