601,100
602,"}APQ.Security.Elements.LoadAccessRights"
562,"VIEW"
586,"}APQ Security Manage Element Access"
585,"}APQ Security Manage Element Access"
564,
565,"e8m:4a4AKpUV@JHo;f9;IUjm]d>=nc8u89PYI@RF3dV:FP`9_maZ@OJg7hI7t`vdL5u\^vJjawTT:p@Gj?W=OJ>0Q4hh;kqBGp9lLI:Scj79lD<tW`omPXgBqJBaN?`D7fa1^zalT]W7T3hla`\zQdmJ]^cm@L`RyvJKghg@z8DY\AY9JgyjJVH_p7Dh5OLmyz<WGtfJ"
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
570,Dimension Level Settings
571,
569,0
592,0
599,1000
560,8
pDoProcessLogging
pDebug
pDimension
pGroup
pDelimiter
pMode
pClear
pSecurityRefresh
561,8
2
2
2
2
2
2
2
2
590,8
pDoProcessLogging,"1"
pDebug,"0"
pDimension,""
pGroup,""
pDelimiter,""
pMode,"0"
pClear,"0"
pSecurityRefresh,"1"
637,8
pDoProcessLogging,"Optional: Record in process log"
pDebug,"Optional: Debug mode? (don't apply element security. Just do ""mock up"" to effective security measure in source cube )"
pDimension,"Optional: Dimension(s) Blank = ALL"
pGroup,"Optional: Group(s) to include Blank = ALL"
pDelimiter,"Optional: Element List delimiter for use in object type & groups list (Blank = take value from framework element delimiter settings)"
pMode,"Optional: Simulate mode? If true then simulate only and change only the ""permission level"" measure with no change to security model (Default = false)"
pClear,"Optional: Clear current element security (default = FALSE)"
pSecurityRefresh,"Optional: security refresh (default=TRUE)"
577,5
vGrp
vDim
vEle
vMeasure
Value
578,5
2
2
2
2
2
579,5
1
2
3
4
5
580,5
0
0
0
0
0
581,5
0
0
0
0
0
582,5
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,327
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
###     Manage element security for all dimensions all in one place
### DATA SOURCE:
###     Cube: }APQ Security Manage Element Access
### INTENDED USAGE:
###     Set security to TM1 element security cubes.
###     If pDebug = 1 then the element security will be applied only the the Effective Security Level measure and not to the element security cube.
#EndRegion @DOC
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2018-03-12 		    SW   	    Creation of Process
### 2020-01-07 		    SW   	    FIX:#188 (add docstring)
### 2020-06-03 		    SW   	    FIX:#151 (add support for alternate hierachies)
### 2020-12-14 		    SW   	    FIX:#321 enhance element security model
##############################################################################################################

##############################################################################################################
#Region - Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pDimension:%pDimension% & pGroup:%pGroup% & pDelimiter:%pDelimiter% & pMode:%pMode% & pClear:%pClear% & pSecurityRefresh:%pSecurityRefresh%');
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

cCubSrc         = '}APQ Security Manage Element Access';
cCubTgt         = cCubSrc;
cDimSecLvl      = '}APQ Security Level';
cDimSrc         = '}APQ Groups';
cDimDims        = '}APQ Dimension Hierarchies';
cDimEles        = '}APQ Dimension Elements';
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
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';

cDimGrp         = '}Groups';
cAllEle         = 'TOTAL DIMENSION ELEMENTS';
cFilter         = '';
sFilter         = '';

######################
### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

#Is framework licensed?
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

# mode (simulate or change security model)
If( pMode @= '1' % pMode @= 'Y' % pMode @= 'YES' % pMode @= 'T' % pMode @= 'TRUE' );
    pMode = '1';
Else;
    pMode = '0';
EndIf;

# dimension
IF( pDimension @<> '' );
    IF( ( DimensionExists( pDimension ) = 0 % DimIx( cDimDims, pDimension ) = 0 ) & Scan( pDelimiter, pDimension ) = 0 );
        nErr = 1;
        sErr = IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension parameter ' | pDimension;
    Else;
        If( pMode @= '0' & Scan( pDelimiter, pDimension ) = 0 & CubeExists( '}ElementSecurity_' | pDimension ) = 0 );
            nErr = 1;
            sErr = IF( sErr @<> '', ' & ', '' ) | 'No element security defined for dimension ' | pDimension;
        EndIf;
        cFilter = Expand( '%cDimDims%%sDelimEleStart%%pDimension%%sDelimDim%' );
    EndIF;
EndIF;

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
### Create Source View

sProc           = '}bedrock.cube.view.create';
sFilter         = Expand( '%cFilter%%cCubSrc% Measure%sDelimEleStart%Permission Type' );
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 1;
nRet = ExecuteProcess( sProc, 'pLogOutput', nDebug, 
		'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
		'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
		'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
		'pTemp', 1
);
If( nRet = ProcessExitNormal() );
    # change to support alternate hierarchies. Leave bSuppressC=1 when caling bedrock process but then set to zero or else same named dimension hierarchies will be skipped 
    ViewExtractSkipCalcsSet( cCubSrc, cViewSrc, 0 );
    If( pDimension @<> '' & SubsetExists( cDimDims, cSubSrc ) = 1 );
        # if processing a specific dimension then remove from source subset (if processing all dimensions then we need to test and skip theese on data tab)
        If( DimIx( cDimDims, pDimension ) > 0 & Scan( pDelimiter, pDimension ) = 0 );
            If( SubsetElementExists( cDimDims, cSubSrc, pDimension ) = 0 );
                SubsetElementInsert( cDimDims, cSubSrc, pDimension, 1 );
            EndIf;
            If( SubsetElementExists( cDimDims, cSubSrc, pDimension|':'|pDimension ) = 1 );
                nIdx = SubsetElementGetIndex( cDimDims, cSubSrc, pDimension|':'|pDimension, 1);
                If( nIdx >= 1 );
                    SubsetElementDelete( cDimDims, cSubSrc, nIdx );
                EndIf;
            EndIf;
            If( SubsetElementExists( cDimDims, cSubSrc, pDimension|':Leaves' ) = 1 );
                nIdx = SubsetElementGetIndex( cDimDims, cSubSrc, pDimension|':Leaves', 1);
                If( nIdx >= 1 );
                    SubsetElementDelete( cDimDims, cSubSrc, nIdx );
                EndIf;
            EndIf;
        EndIf;
    EndIf;
EndIf;

######################
### Clear Target area of source cube

sProc           = '}bedrock.cube.data.clear';
sFilter         = Expand( '%cFilter%%cCubSrc% Measure%sDelimEleStart%Effective Permission Level' );
nRet = ExecuteProcess( sProc, 'pLogOutput', nDebug, 
    'pCube', cCubSrc, 'pView', cViewClr, 'pFilter', sFilter,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1
);

######################
### Clear Target Security Cube(s)

If( pMode @= '0' & pClear @= '1' & pDebug @= '0' );
    If( pDimension @<> '' );
        If( DimIx( cDimDims, pDimension ) > 0 );
            sCubTgt = '}ElementSecurity_' | pDimension;
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
        ElseIf( Scan( pDelimiter, pDimension ) > 0 );
            # loop through dimensions in the filter
            If( SubSt( pDimension, Long( pDimension ), 1 ) @<> pDelimiter );
                pDimension = pDimension | pDelimiter;
            EndIf;
            sDimensions = pDimension;
            While( Scan( pDelimiter, sDimensions ) > 0 );
                sDim = SubSt( sDimensions, 1, Scan( pDelimiter, sDimensions ) - 1 );
                sDimensions = SubSt( sDimensions, Scan( pDelimiter, sDimensions ) + 1, Long( sDimensions ) );
                sCubTgt = '}ElementSecurity_' | sDim;
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
            End;
        EndIf;
    Else;
        iDim = 1;
        While( iDim <= DimSiz( cDimDims ) );
            sDim = DimNm( cDimDims, iDim );
            sCubTgt = '}ElementSecurity_' | sDim;
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
            iDim = iDim + 1;
        End;
    EndIf;
    If( pSecurityRefresh @= '1' );
        sProc = '}bedrock.security.refresh';
        ExecuteProcess( sProc, 'pLogOutput', nDebug );
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

574,579
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

# test if dummy element for same named hierarchy or Leaves. Skip these
If( Scan( ':', vDim ) > 0 );
    sDim = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
    sHier = Trim( SubSt( vDim, Scan( ':', vDim ) + 1, Long( vDim ) ) );
    If( Scan( ':LEAVES', Upper(vDim) ) > 0 );
        ItemSkip;
    EndIf;
    If( sDim @= sHier );
        ItemSkip;
    EndIf;
Else;
    sDim = vDim;
    sHier = vDim;
EndIf;
sCubTgt = '}ElementSecurity_' | sDim;
sType = sValue;

# Check if rule is active
If( CellGetS( cCubSrc, vGrp, vDim, vEle, 'Inactive' ) @= '1' );
    ItemSkip;
EndIf;

# Check element is in dimension
If( vEle @= cAllEle );
    # don't skip
ElseIf( DimIx( vDim, vEle ) = 0 );
    LogOutput( 'WARN', Expand('%sThisProcName% unable to apply element security %vEle% not a member of %vDim%.') );
    ItemSkip;
EndIf;

# Get the permission type
sSecLevel = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Permission Level' );
If( DimIx( cDimSecLvl, sSecLevel ) = 0 );
    ItemSkip;
EndIf;

# Get the inherit to level
nRecursionLevel = StringToNumber( CellGetS( cCubSrc, vGrp, vDim, vEle, 'InheritToDimLevel' ) );

# Debug logging
If( pDebug @>= '1' );
    LogOutput( 'INFO', Expand('Grp:%vGrp% Dim:%vDim% Ele:%vEle% PermissionType:%sType% Level:%sSecLevel%') );
EndIf;

# Get extra data if wildcard type
If( sType @= 'WILDCARD' );
    # Scan is case sensitive. Make test case insensitive
    sWildcard = Lower( CellGetS( cCubSrc, vGrp, vDim, vEle, 'Wildcard Entry' ) );
    If( Scan( '*', sWildcard ) = 0 );
        sWildcardType = 'Contains';
    ElseIf( SubSt( sWildcard, 1, 1 ) @= '*' & SubSt( sWildcard, Long(sWildcard), 1 ) @= '*' );
        sWildcardType = 'Contains';
        sWildcard = SubSt( sWildcard, 2, Long(sWildcard) - 2 );
    ElseIf( SubSt( sWildcard, Long(sWildcard), 1 ) @= '*' );
        sWildcardType = 'Starts';
        sWildcard = SubSt( sWildcard, 1, Long(sWildcard) - 1 );
    Else;
        sWildcardType = 'Ends';
        sWildcard = SubSt( sWildcard, 2, Long(sWildcard) - 1 );
    EndIf;            
    sWildcardAlias = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Wildcard Alias' );
    If( sWildcardAlias @<> '' );
        If( DimensionExists( '}ElementAttributes_' | vDim ) = 0 );
            sWildcardAlias = '';
        ElseIf( DimIx( '}ElementAttributes_' | vDim, sWildcardAlias ) = 0 );
            sWildcardAlias = '';
        EndIf;
    EndIF;
    If( pDebug @>= '1' );
        LogOutput( 'INFO', Expand('Grp:%vGrp% Dim:%vDim% Ele:%vEle% Wildcard:%sWildcard% WildcardType:%sWildcardType%') );
    EndIf;
EndIf;

# Get extra data if attribute type
If( sType @= 'ATTRIBUTE' );
    sAttrVal    = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Wildcard Entry' );
    sAttrName   = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Wildcard Alias' );
    If( sAttrName @<> '' );
        If( DimensionExists( '}ElementAttributes_' | sDim ) = 0 );
            sAttrName = '';
        ElseIf( DimIx( '}ElementAttributes_' | sDim, sAttrName ) = 0 );
            sAttrName = '';
        EndIf;
    EndIF;
    If( pDebug @>= '1' );
        LogOutput( 'INFO', Expand('Grp:%vGrp% Dim:%vDim% Ele:%vEle% AttrName:%sAttrName% AttrValue:%sAttrVal%') );
    EndIf;
EndIf;

# Check if there are exclusions
sExcludeType = '';
bExclude = StringToNumber( CellGetS( cCubSrc, vGrp, vDim, vEle, 'Exclusions' ) );
If( bExclude = 1 );
    sExcludeType = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Exclusion Type' );
    sExclude = Lower( CellGetS( cCubSrc, vGrp, vDim, vEle, 'Exclusion Entry' ) );
    nExclusionLevel = StringToNumber( CellGetS( cCubSrc, vGrp, vDim, vEle, 'ExcludeToDimLevel' ) );
    sExcludeWildcardType = '';
    sExcludeAttrName = '';
    If( sExcludeType @= '' % sExclude @= '' );
        bExclude = 0;
        sExcludeType = '';
        sExclude = '';
    Else;
        If( sExcludeType @= 'WILDCARD' );
            If( Scan( '*', sExclude ) = 0 );
                sExcludeWildcardType = 'Contains';
            ElseIf( SubSt( sExclude, 1, 1 ) @= '*' & SubSt( sExclude, Long(sExclude), 1 ) @= '*' );
                sExcludeWildcardType = 'Contains';
                sExclude = SubSt( sExclude, 2, Long(sExclude) - 2 );
            ElseIf( SubSt( sExclude, Long(sExclude), 1 ) @= '*' );
                sExcludeWildcardType = 'Starts';
                sExclude = SubSt( sExclude, 1, Long(sExclude) - 1 );
            Else;
                sExcludeWildcardType = 'Ends';
                sExclude = SubSt( sExclude, 2, Long(sExclude) - 1 );
            EndIf;
            sExcludeAlias = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Exclusion Wildcard Alias' );
            If( sExcludeAlias @<> '' );
                If( DimensionExists( '}ElementAttributes_' | sDim ) = 0 );
                    sExcludeAlias = '';
                ElseIf( DimIx( '}ElementAttributes_' | sDim, sExcludeAlias ) = 0 );
                    sExcludeAlias = '';
                EndIf;
            EndIF;
        ElseIf( sExcludeType @= 'ATTRIBUTE' );
            sExclude = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Exclusion Entry' );
            sExcludeAttrName = CellGetS( cCubSrc, vGrp, vDim, vEle, 'Exclusion Wildcard Alias' );
            If( sExcludeAttrName @<> '' );
                If( DimensionExists( '}ElementAttributes_' | sDim ) = 0 );
                    sExcludeAttrName = '';
                ElseIf( DimIx( '}ElementAttributes_' | sDim, sExcludeAttrName ) = 0 );
                    sExcludeAttrName = '';
                EndIf;
            EndIF;

        ElseIf( sExcludeType @= 'POINT' % sExcludeType @= 'RECURSIVE' );
            If( DimIx( vDim, sExclude ) = 0 );
                bExclude = 0;
                sExcludeType = '';
                sExclude = '';
            Else;
                sExclude = DimensionElementPrincipalName( vDim, sExclude );
            EndIf;
        EndIf;
    EndIf;
    If( pDebug @>= '1' );
        LogOutput( 'INFO', Expand('Grp:%vGrp% Dim:%vDim% Ele:%vEle% ExcludeBy:%sExcludeType% ExcludeKey:%sExclude% WildcardType:%sExcludeWildcardType% AttrName:%sExcludeAttrName%') );
    EndIf;
EndIf;

# Special case of whole dimension placeholder. Only All, Wildcard & Attribute are supported.
If( vEle @= cAllEle );
    iEle = 1;
    nMax = DimSiz( vDim );
    While( iEle <= nMax );
        sEle = DimNm( vDim, iEle );
        bAssign = 1;
        If( nRecursionLevel > 0 );
            If( ElLev( vDim, sEle ) < nRecursionLevel );
                bAssign = 0;
            EndIf;
        EndIf;
        If( sType @= 'ALL' );
            If( bExclude = 0 % sExcludeType @= '' );
                # no exclusions just apply security to all elements
            Else;
                # apply security if exclusion doesn't apply
                If( ElLev( vDim, sEle ) >= nExclusionLevel );
                    If( sExcludeType @= 'POINT' );
                        If( sEle @= sExclude );
                            bAssign = 0;
                        EndIf;
                    ElseIf( sExcludeType @= 'RECURSIVE' );
                        If( sEle @= sExclude % ElIsAnc( vDim, sExclude, sEle ) = 1 );
                            bAssign = 0;
                        EndIf;
                    ElseIf( sExcludeType @= 'ATTRIBUTE' );
                        If( sExcludeAttrName @<> '' );
                            If( sDim @= vDim );
                                sExcludeEleAttrVal = AttrS( sDim, sEle, sExcludeAttrName );
                            Else;
                                sExcludeEleAttrVal = ElementAttrS( sDim, sHier, sEle, sExcludeAttrName );
                            EndIf;
                            If( sExcludeEleAttrVal @= sExclude );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    ElseIf( sExcludeType @= 'WILDCARD' );
                        If( sExcludeAlias @<> '' );
                            If( sDim @= vDim );
                                sEleAlias = Lower( AttrS( sDim, sEle, sExcludeAlias ) );
                            Else;
                                sEleAlias = Lower( ElementAttrS( sDim, sHier, sEle, sExcludeAlias ) );
                            EndIf;
                            If( sEleAlias @<> '' );
                                sEle = sEleAlias;
                            EndIf;
                        EndIf;
                        If( sExcludeWildcardType @= 'Contains' );
                            If( Scan( sExclude, sEle ) > 0 );
                                bAssign = 0;
                            EndIf;
                        ElseIf( sExcludeWildcardType @= 'Starts' );
                            If( Scan( sExclude, sEle ) = 1 );
                                bAssign = 0;
                            EndIf;
                        Else;
                            # Ends
                            If( sExclude @= SubSt( sEle, Scan( sExclude, sEle ), Long( sEle ) ) );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    EndIf;
                EndIf;
            EndIf;
        ElseIf( sType @= 'ROOT' );
            If( bExclude = 0 % sExcludeType @= '' );
                # Apply access to all "root" elements (elements without a parent)
                If( ElPar( vDim, sEle, 1 ) @<> '' );
                    bAssign = 0;
                EndIf;
            Else;
                # apply security if exclusion doesn't apply
                If( ElLev( vDim, sEle ) >= nExclusionLevel );
                    If( sExcludeType @= 'POINT' );
                        If( sEle @= sExclude );
                            bAssign = 0;
                        EndIf;
                    ElseIf( sExcludeType @= 'RECURSIVE' );
                        If( sEle @= sExclude % ElIsAnc( vDim, sExclude, sEle ) = 1 );
                            bAssign = 0;
                        EndIf;
                    ElseIf( sExcludeType @= 'ATTRIBUTE' );
                        If( sExcludeAttrName @<> '' );
                            If( sDim @= vDim );
                                sExcludeEleAttrVal = AttrS( sDim, sEle, sExcludeAttrName );
                            Else;
                                sExcludeEleAttrVal = ElementAttrS( sDim, sHier, sEle, sExcludeAttrName );
                            EndIf;
                            If( sExcludeEleAttrVal @= sExclude );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    ElseIf( sExcludeType @= 'WILDCARD' );
                        If( sExcludeAlias @<> '' );
                            If( sDim @= vDim );
                                sEleAlias = Lower( AttrS( sDim, sEle, sExcludeAlias ) );
                            Else;
                                sEleAlias = Lower( ElementAttrS( sDim, sHier, sEle, sExcludeAlias ) );
                            EndIf;
                            If( sEleAlias @<> '' );
                                sEle = sEleAlias;
                            EndIf;
                        EndIf;
                        If( sExcludeWildcardType @= 'Contains' );
                            If( Scan( sExclude, sEle ) > 0 );
                                bAssign = 0;
                            EndIf;
                        ElseIf( sExcludeWildcardType @= 'Starts' );
                            If( Scan( sExclude, sEle ) = 1 );
                                bAssign = 0;
                            EndIf;
                        Else;
                            # Ends
                            If( sExclude @= SubSt( sEle, Scan( sExclude, sEle ), Long( sEle ) ) );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    EndIf;
                EndIf;
            EndIf;
        ElseIf( sType @= 'WILDCARD' );
            If( sWildcardAlias @<> '' );
                sEleAlias = AttrS( vDim, sEle, sWildcardAlias );
                If( sEleAlias @<> '' );
                    sEle = sEleAlias;
                EndIf;
            EndIf;
            If( sWildcardType @= 'Contains' );
                If( Scan( sWildcard, Lower( sEle ) ) = 0 );
                    bAssign = 0;
                EndIf;
            ElseIf( sWildcardType @= 'Starts' );
                If( Scan( sWildcard, Lower( sEle ) ) <> 1 );
                    bAssign = 0;
                EndIf;
            Else;
                # Ends
                If( sWildcard @<> SubSt( sEle, Scan( sWildcard, sEle ), Long( sEle ) ) );
                    bAssign = 0;
                EndIf;
            EndIf;
            If( bExclude = 1 % sExcludeType @<> '' );
                If( ElLev( vDim, sEle ) >= nExclusionLevel );
                    If( sExcludeType @= 'ATTRIBUTE' );
                        If( sExcludeAttrName @<> '' );
                            If( sDim @= vDim );
                                sExcludeEleAttrVal = AttrS( sDim, sEle, sExcludeAttrName );
                            Else;
                                sExcludeEleAttrVal = ElementAttrS( sDim, sHier, sEle, sExcludeAttrName );
                            EndIf;
                            If( sExcludeEleAttrVal @= sExclude );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    ElseIf( sExcludeType @= 'WILDCARD' );
                        If( sExcludeAlias @<> '' );
                            If( sDim @= vDim );
                                sEleAlias = AttrS( sDim, sEle, sExcludeAlias );
                            Else;
                                sEleAlias = ElementAttrS( sDim, sHier, sEle, sExcludeAlias );
                            EndIf;
                            If( sEleAlias @<> '' );
                                sEle = sEleAlias;
                            EndIf;
                        EndIf;
                        If( sExcludeWildcardType @= 'Contains' );
                            If( Scan( sExclude, Lower( sEle ) ) > 0 );
                                bAssign = 0;
                            EndIf;
                        ElseIf( sExcludeWildcardType @= 'Starts' );
                            If( Scan( sExclude, Lower( sEle ) ) = 1 );
                                bAssign = 0;
                            EndIf;
                        Else;
                            # Ends
                            If( sExclude @= SubSt( sEle, Scan( sExclude, sEle ), Long( sEle ) ) );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    EndIf;
                EndIf;
            EndIf;
        ElseIf( sType @= 'ATTRIBUTE' );
            If( sAttrName @<> '' );
                If( sDim @= vDim );
                    sEleAttrVal = AttrS( sDim, sEle, sAttrName );
                Else;
                    sEleAttrVal = ElementAttrS( sDim, sHier, sEle, sAttrName );
                EndIf;
            EndIf;
            If( sEleAttrVal @<> sAttrVal );
                bAssign = 0;
            EndIf;
            If( bExclude = 1 % sExcludeType @<> '' );
                If( ElLev( vDim, sEle ) >= nExclusionLevel );
                    If( sExcludeType @= 'ATTRIBUTE' );
                        If( sExcludeAttrName @<> '' );
                            If( sDim @= vDim );
                                sExcludeEleAttrVal = AttrS( sDim, sEle, sExcludeAttrName );
                            Else;
                                sExcludeEleAttrVal = ElementAttrS( sDim, sHier, sEle, sExcludeAttrName );
                            EndIf;
                            If( sExcludeEleAttrVal @= sExclude );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    ElseIf( sExcludeType @= 'WILDCARD' );
                        If( sExcludeAlias @<> '' );
                            If( sDim @= vDim );
                                sEleAlias = AttrS( sDim, sEle, sExcludeAlias );
                            Else;
                                sEleAlias = ElementAttrS( sDim, sHier, sEle, sExcludeAlias );
                            EndIf;
                            If( sEleAlias @<> '' );
                                sEle = sEleAlias;
                            EndIf;
                        EndIf;
                        If( sExcludeWildcardType @= 'Contains' );
                            If( Scan( sExclude, Lower( sEle ) ) > 0 );
                                bAssign = 0;
                            EndIf;
                        ElseIf( sExcludeWildcardType @= 'Starts' );
                            If( Scan( sExclude, Lower( sEle ) ) = 1 );
                                bAssign = 0;
                            EndIf;
                        Else;
                            # Ends
                            If( sExclude @= SubSt( sEle, Scan( sExclude, sEle ), Long( sEle ) ) );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    EndIf;
                EndIf;
            EndIf;
        Else;
            # Nothing. Unsupported permission type.
            bAssign = 0;
        EndIf;
        # If alias on wildcard need to convert back to principal element name
        sEle = DimensionElementPrincipalName( vDim, sEle );
        # If framework not updated for the dimension being run. Insert the element
        If( DimIx( cDimEles, sEle ) = 0 );
            DimensionElementInsertDirect( cDimEles, '', sEle, 'N' );
        EndIf;
        If( bAssign = 1 );
            CellPutS( sSecLevel, cCubTgt, vGrp, vDim, sEle, 'Effective Permission Level' );
            If( pMode @= '0' & pDebug @< '1' );
                If( sDim @= vDim );
                    If( CellIsUpdateable( sCubTgt, sEle, vGrp ) = 1 );
                        CellPutS( sSecLevel, sCubTgt, sEle, vGrp );
                    EndIf;
                    ElementSecurityPut( sSecLevel, sDim, sEle, vGrp );
                Else;
                    If( CellIsUpdateable( sCubTgt, sHier:sEle, vGrp ) = 1 );
                        CellPutS( sSecLevel, sCubTgt, sHier:sEle, vGrp );
                    EndIf;
                    HierarchyElementSecurityPut( sSecLevel, sDim, sHier, sEle, vGrp );
                EndIf;
            EndIf;
        Else;
            CellPutS( '', cCubTgt, vGrp, vDim, sEle, 'Effective Permission Level' );
            If( pMode @= '0' & pDebug @< '1' );
                If( sDim @= vDim );
                    If( CellIsUpdateable( sCubTgt, sEle, vGrp ) = 1 );
                        CellPutS( '', sCubTgt, sEle, vGrp );
                    EndIf;
                    ElementSecurityPut( 'NONE', vDim, sEle, vGrp );
                Else;
                    If( CellIsUpdateable( sCubTgt, sHier:sEle, vGrp ) = 1 );
                        CellPutS( '', sCubTgt, sHier:sEle, vGrp );
                    EndIf;
                    HierarchyElementSecurityPut( 'NONE', sDim, sHier, sEle, vGrp );
                EndIf;
            EndIf;
        EndIf;
        iEle = iEle + 1;
    End;
EndIf;

# General case of dimension element. Only Point & Recursive are supported.
If( sType @= 'POINT' );
    CellPutS( sSecLevel, cCubTgt, vGrp, vDim, vEle, 'Effective Permission Level' );
    If( pMode @= '0' & pDebug @< '1' );
        If( sDim @= vDim );
            If( CellIsUpdateable( sCubTgt, vEle, vGrp ) = 1 );
                CellPutS( sSecLevel, sCubTgt, vEle, vGrp );
            EndIf;
            ElementSecurityPut( sSecLevel, sDim, vEle, vGrp );
        Else;
            If( CellIsUpdateable( sCubTgt, sHier:vEle, vGrp ) = 1 );
                CellPutS( sSecLevel, sCubTgt, sHier:vEle, vGrp );
            EndIf;
            HierarchyElementSecurityPut( sSecLevel, sDim, sHier, vEle, vGrp );
        EndIf;            
    EndIf;
ElseIf( sType @= 'RECURSIVE' );
    iEle = 1;
    nMax = DimSiz( vDim );
    While( iEle <= nMax );
        sEle = DimNm( vDim, iEle );
        bAssign = 0;
        If( sEle @= vEle % ElIsAnc( vDim, vEle, sEle ) = 1 );
            bAssign = 1;
            If( nRecursionLevel > 0 );
                If( ElLev( vDim, sEle ) < nRecursionLevel );
                    bAssign = 0;
                EndIf;
            EndIf;
            If( bExclude = 0 % sExcludeType @= '' );
                # no exclusions just apply security to all descendants
            Else;
                # apply security if exclusion doesn't apply
                If( ElLev( vDim, sEle ) >= nExclusionLevel );
                    If( sExcludeType @= 'POINT' );
                        If( sEle @= sExclude );
                            bAssign = 0;
                        EndIf;
                    ElseIf( sExcludeType @= 'RECURSIVE' );
                        If( sEle @= sExclude % ElIsAnc( vDim, sExclude, sEle ) = 1 );
                            bAssign = 0;
                        EndIf;
                    ElseIf( sExcludeType @= 'ATTRIBUTE' );
                        If( sExcludeAttrName @<> '' );
                            If( sDim @= vDim );
                                sExcludeEleAttrVal = AttrS( sDim, sEle, sExcludeAttrName );
                            Else;
                                sExcludeEleAttrVal = ElementAttrS( sDim, sHier, sEle, sExcludeAttrName );
                            EndIf;
                            If( sExcludeEleAttrVal @= sExclude );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    ElseIf( sExcludeType @= 'WILDCARD' );
                        If( sExcludeAlias @<> '' );
                            If( sDim @= vDim );
                                sEleAlias = AttrS( sDim, sEle, sExcludeAlias );
                            Else;
                                sEleAlias = ElementAttrS( sDim, sHier, sEle, sExcludeAlias );
                            EndIf;
                            If( sEleAlias @<> '' );
                                sEle = sEleAlias;
                            EndIf;
                        EndIf;
                        If( sExcludeWildcardType @= 'Contains' );
                            If( Scan( sExclude, Lower( sEle ) ) > 0 );
                                bAssign = 0;
                            EndIf;
                        ElseIf( sExcludeWildcardType @= 'Starts' );
                            If( Scan( sExclude, Lower( sEle ) ) = 1 );
                                bAssign = 0;
                            EndIf;
                        Else;
                            # Ends
                            If( sExclude @= SubSt( sEle, Scan( sExclude, sEle ), Long( sEle ) ) );
                                bAssign = 0;
                            EndIf;
                        EndIf;
                    EndIf;
                EndIf;
            EndIf;
            # If alias on wildcard need to convert back to principal element name
            sEle = DimensionElementPrincipalName( vDim, sEle );
            If( DimIx( cDimEles, sEle ) = 0 );
                # Framework not updated for the dimension being run. Insert the element
                DimensionElementInsertDirect( cDimEles, '', sEle, 'N' );
            EndIf;
            If( bAssign = 1 );
                CellPutS( sSecLevel, cCubTgt, vGrp, vDim, sEle, 'Effective Permission Level' );
                If( pMode @= '0' & pDebug @< '1' & DimIx( '}Groups', vGrp ) > 0 );
                    If( sDim @= vDim );
                        If( CellIsUpdateable( sCubTgt, sEle, vGrp ) = 1 );
                            CellPutS( sSecLevel, sCubTgt, sEle, vGrp );
                        EndIf;
                        ElementSecurityPut( sSecLevel, sDim, sEle, vGrp );
                    Else;
                        If( CellIsUpdateable( sCubTgt, sHier:sEle, vGrp ) = 1 );
                            CellPutS( sSecLevel, sCubTgt, sHier:sEle, vGrp );
                        EndIf;
                        HierarchyElementSecurityPut( sSecLevel, sDim, sHier, sEle, vGrp );
                    EndIf;
                EndIf;
            Else;
                CellPutS( '', cCubTgt, vGrp, vDim, sEle, 'Effective Permission Level' );
                If( pMode @= '0' & pDebug @< '1' & DimIx( '}Groups', vGrp ) > 0 );
                    If( sDim @= vDim );
                        If( CellIsUpdateable( sCubTgt, sEle, vGrp ) = 1 );
                            CellPutS( '', sCubTgt, sEle, vGrp );
                        EndIf;
                        ElementSecurityPut( 'NONE', sDim, sEle, vGrp );
                    Else;
                        If( CellIsUpdateable( sCubTgt, sHier:sEle, vGrp ) = 1 );
                            CellPutS( '', sCubTgt, sHier:sEle, vGrp );
                        EndIf;
                        HierarchyElementSecurityPut( 'NONE', sDim, sHier, sEle, vGrp );
                    EndIf;
                EndIf;
            EndIf;
        EndIf;
        iEle = iEle + 1;
    End;
EndIf;

######################
### END Data
575,41
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
