601,100
602,"}APQ.Security.Elements.CreateGroups"
562,"SUBSET"
586,"}APQ Dimensions"
585,"}APQ Dimensions"
564,
565,"e1kBdagdVTJy]Ascy=8zt2rVtD6xyhqc]hYuU=_gbu1mw7Y[mk[ToOi16w2k8fVp7Ff=riShcyajPyysF5LPzeCg^VUq\HqwPVJ5vUrkC2:HhE1Y0Z>yyz^oLBd@Zf@[rNuyibFaPlENo\W0sTLW4MA<Q58EfwPdtF`fy^AeeaDoN9mwET@C13eShi0tH4eDAht;i38k"
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
560,8
pDoProcessLogging
pDebug
pDimension
pDelimiter
pMode
pClear
pSecurityRefresh
pFramework
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
pDelimiter,""
pMode,"0"
pClear,"0"
pSecurityRefresh,"1"
pFramework,"1"
637,8
pDoProcessLogging,"Optional: Record in process log"
pDebug,"Optional: Write debug log file?"
pDimension,"Optional: Dimension(s) Blank = ALL"
pDelimiter,"Optional: Element List delimiter for use in dimension list (Blank = take value from framework element delimiter settings)"
pMode,"Optional: Simulate mode? If true then simulate only and change only the ""permission level"" measure with no change to security model (Default = false)"
pClear,"Optional: Clear current element security (default = FALSE)"
pSecurityRefresh,"Optional: security refresh (default=TRUE)"
pFramework,"Optional: update APQ Dimension Elements control list dimension (default=TRUE)"
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
572,278
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
###     Automatically create element security groups and set security
### DATA SOURCE:
###     Cube: }APQ Security Manage Element Security Groups
### INTENDED USAGE:
###     Create groups for element security and set the security all in one step.
###     If pDebug = 1 then:
###         1. Element security cubes will not be created (if not already existing).
###         2. Groups will be created only in the }APQ Groups dimension and not in the real }Groups dimension.
###         3. the element security will be applied only the the Effective Security Level measure and not to the element security cube.
### WARNING:
###     If using this process on even middle-sized dimensions could create a lot of groups. Make sure the GroupsCreationLimit parameter
###     in tm1s.cfg is set high enough to accomodate the group creation!
#EndRegion @DOC
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2019-03-25 		    SW   	    Creation of Process
### 2020-01-07 		    SW   	    FIX:#188 (docstring text) FIX:#257 (managing dimension not working as expected)
### 2020-12-14 		    SW   	    FIX:#321 enhance element security model
##############################################################################################################

##############################################################################################################
#Region - Logging
sThisProcName = GetProcessName(); sProcLogParams = '';
### Params
sProcLogParams = Expand('pDimension:%pDimension% & pDelimiter:%pDelimiter% & pMode:%pMode% & pClear:%pClear% & pSecurityRefresh:%pSecurityRefresh% & pFramework:%pFramework%');
### Params
If(pDoProcessLogging@='1');
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQProcesses',sThisProcName)=0);ExecuteProcess('}APQ.Dim.ControlDimensionCopies.Update','pDoProcessLogging',pDoProcessLogging,'pClear','0');EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

##############################################################################################################
#Region - Declare constants
cCubSrc         = '}APQ Security Manage Element Security Groups';
cCubTgt         = '}APQ Security Manage Element Access';
cDimSrc         = '}APQ Dimensions';
cDimSrc2        = '}APQ Dimension Hierarchies';
cDimDims        = '}Dimensions';
cDimTgt         = '}APQ Groups';
cGrpTot         = 'Total APQ Groups';
cGrpEleSec      = 'Total APQ Element Security Groups';
cElePlaceHldr   = 'TOTAL DIMENSION ELEMENTS';
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
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

DatasourceASCIIDelimiter        = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
DatasourceASCIIQuoteCharacter   = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );
#EndRegion - Declare Constants
##############################################################################################################

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

# Dimension
IF( pDimension @<> '' );
    If( ( DimensionExists( pDimension ) = 0 % DimIx( cDimDims, pDimension ) = 0 ) & Scan( pDelimiter, pDimension ) = 0 );
       nErr = nErr + 1;
       sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDimension;
    ElseIf( DimensionExists( pDimension ) = 1 & DimIx( cDimDims, pDimension ) >= 1 );
        sMDXBase = Expand('{[%cDimSrc%].[%cDimSrc%].[%pDimension%]}');
    ElseIf( Scan( pDelimiter, pDimension ) > 0 );
        If( SubSt( pDimension, Long( pDimension ), 1 ) @<> pDelimiter );
            pDimension = pDimension | pDelimiter;
        EndIf;
        sMDXBase = '';
        sDimensions = pDimension;
        While( Scan( pDelimiter, sDimensions ) > 0 );
            sDim = SubSt( sDimensions, 1, Scan( pDelimiter, sDimensions ) - 1 );
            sDimensions = SubSt( sDimensions, Scan( pDelimiter, sDimensions ) + 1, Long( sDimensions ) );
            If( DimensionExists( sDim ) = 1 & DimIx( cDimDims, sDim ) >= 1 );
                sMDXBase = sMDXBase | If( sMDXBase @<> '', ',', '' ) | Expand('[%cDimSrc%].[%cDimSrc%].[%sDim%]');
            EndIf;
        End;
        sMDXBase = Expand('{%sMDXBase%}');
    EndIf;
Else;
    sMDXBase = Expand('{TM1FILTERBYLEVEL( {TM1SUBSETALL([%cDimSrc%].[%cDimSrc%])}, 0)}');
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
### Update framework control list dimension

If( pFramework @= '1' );
    If( DimensionExists( pDimension ) = 1 );
        If( DimIx( cDimSrc, pDimension ) = 0 & Scan( ':', pDimension ) = 0 );
            DimensionElementInsertDirect( cDimSrc, '', pDimension, 'N' );
            DimensionElementComponentAddDirect( cDimSrc, 'Total APQ Dimensions', pDimension, 1 );
            If( SubSt( pDimension, 1, 1 ) @= '}' );
                DimensionElementComponentAddDirect( cDimSrc, 'Total Control APQ Dimensions', pDimension, 1 );
            Else;
                DimensionElementComponentAddDirect( cDimSrc, 'Total User APQ Dimensions', pDimension, 1 );
            EndIf;
        EndIf;
        If( DimIx( cDimSrc2, pDimension ) = 0 );
            If( Scan( ':', pDimension ) = 0 );
                DimensionElementInsertDirect( cDimSrc2, '', pDimension, 'C' );
                DimensionElementComponentAddDirect( cDimSrc2, 'Total APQ Dimensions', pDimension, 1 );
                DimensionElementInsertDirect( cDimSrc2, '', pDimension|':'|pDimension, 'N' );
                DimensionElementComponentAddDirect( cDimSrc2, pDimension, pDimension|':'|pDimension, 1 );
            Else;
                DimensionElementInsertDirect( cDimSrc2, '', pDimension, 'N' );
                sDimPar = SubSt( pDimension, 1, Scan( ':', pDimension ) - 1 );
                If( DimIx( cDimSrc2, sDimPar ) = 0 );
                    DimensionElementInsertDirect( cDimSrc2, '', sDimPar, 'C' );
                    DimensionElementComponentAddDirect( cDimSrc2, 'Total APQ Dimensions', sDimPar, 1 );
                EndIf;
                DimensionElementComponentAddDirect( cDimSrc2, sDimPar, pDimension, 1 );
            EndIf;
        EndIf;
    EndIf;
    sProc = '}APQ.Dim.DimensionElements.Update';
    If( DimensionExists( pDimension ) = 1 % pDimension @= '' );
        ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging,
        	'pSelectedDimsOnly', '1',
        	'pCreateSubs', '1',
        	'pDim', pDimension,
        	'pClear', '0'
        );
    ElseIf( Scan( pDelimiter, pDimension ) > 0 );
        sDimensions = pDimension;
        While( Scan( pDelimiter, sDimensions ) > 0 );
            sDim = SubSt( sDimensions, 1, Scan( pDelimiter, sDimensions ) - 1 );
            sDimensions = SubSt( sDimensions, Scan( pDelimiter, sDimensions ) + 1, Long( sDimensions ) );
            If( DimensionExists( sDim ) = 1 & DimIx( cDimDims, sDim ) >= 1 );
                ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging,
                	'pSelectedDimsOnly', '1',
                	'pCreateSubs', '1',
                	'pDim', sDim,
                	'pClear', '0'
                );
            EndIf;
        End;
    EndIf;
EndIf;

######################
### Transaction logging 

CubeSetLogChanges( cCubTgt, 1 );

######################
#Region - Define data source

# Temp subset 1. Loop through dimension to check that }ElementSecurity cubes exist
sMDX = Expand('{FILTER( %sMDXBase%, [%cCubSrc%].([%cDimSrc%].[%cDimSrc%].CurrentMember, [%cDimM%].[Require Element Security]) = 1)}');
If( SubsetExists( cDimSrc, cSubSrc ) = 0 );
    SubsetCreatebyMDX( cSubSrc, sMDX, cDimSrc, 1 );
Else;
    SubsetMDXSet( cDimSrc, cSubSrc, sMDX );
EndIf;
nMax = SubsetGetSize( cDimSrc, cSubSrc );
nCtr = 1;
While( nCtr <= nMax );
    sDim = SubsetGetElementName( cDimSrc, cSubSrc, nCtr );
    If( pMode @= '0' & CubeExists( '}ElementSecurity_' | sDim ) = 0 & pDebug @< '1' );
        # Flagged to create element security but security cube not yet existing. Perform ElementSecurityPut to create security cube
        sEle = DimNm( sDim, 1 );
        sGrp = CellGetS( cCubParam, 'Security Group: End User', 'String' );
        ElementSecurityPut( 'NONE', sDim, sEle, sGrp );
    EndIf;
    If( pMode @= '0' );
        CellPutS( 'Y', '}DimensionProperties', sDim, 'ELEMENT_SECURITY' );
    EndIf;
    AttrPutS( 'TRUE', cDimSrc, sDim, 'ELEMENT_SECURITY' );
    nCtr = nCtr + 1;
End;

# Temp subset 2. Subset for group creation which will be set as data source
sMDX = Expand('{FILTER( %sMDXBase%, [%cCubSrc%].([%cDimSrc%].[%cDimSrc%].CurrentMember, [%cDimM%].[Auto Create Groups]) = 1)}');
SubsetMDXSet( cDimSrc, cSubSrc, sMDX );

#EndRegion

######################
### Assign data source

DataSourceType             = 'SUBSET';
DataSourceNameForServer    = cDimSrc;
DatasourceDimensionSubset  = cSubSrc;

######################
### END Prolog
573,237
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

sDebugFile = cDebugFile | '_Metadata.log';

######################
### Metadata script

# Declare constants for dimension
sMgrDim1    = CellGetS( cCubSrc, vDim, 'Managing Dimension 1' );
sMgrDim2    = CellGetS( cCubSrc, vDim, 'Managing Dimension 2' );
sMgrDim3    = CellGetS( cCubSrc, vDim, 'Managing Dimension 3' );

# if different "managing dimension" in use then substitute for group creation
If( vDim @= sMgrDim1 % sMgrDim1 @= '' );
    # do nothing, continue with current vDim 
ElseIf( DimIx( cDimSrc, sMgrDim1 ) > 0 );
    vDim    = sMgrDim1;
Else;
    # invalid mnanaging dimension. Skip group creation
    LogOutput( 'WARN', Expand('%sThisProcName%: Invalid managing dimension "%sMgrDim1%" for element security in dimension %vDim%.') );
    ItemSkip;
EndIf;

bAll        = CellGetN( cCubSrc, vDim, 'Create All Group' );
bRoot       = CellGetN( cCubSrc, vDim, 'Create Root Only Group' );
bPoint      = CellGetN( cCubSrc, vDim, 'Create Point Only Groups for C Elements' );
bReadOnly   = CellGetN( cCubSrc, vDim, 'Create Read Only Groups' );
bDimNm      = CellGetN( cCubSrc, vDim, 'Exclude Dimension from Group Name' );
nLevelTo    = CellGetN( cCubSrc, vDim, 'Create Groups to Element Level' );
sPrefix     = CellGetS( cCubSrc, vDim, 'Group Name Prefix' );
sDelimNm    = If( CellGetS( cCubSrc, vDim, 'Group Name Part Delimiter' ) @= '', ':', CellGetS( cCubSrc, vDim, 'Group Name Part Delimiter' ) );
sAttrDim    = CellGetS( cCubSrc, vDim, 'Dimension Attribute for Name' );
sAttrEle    = CellGetS( cCubSrc, vDim, 'Element Attribute for Name' );
bAttrEle    = If( sAttrEle @<> '' & DimensionExists( '}ElementAttributes_' | vDim ) = 1, 1, 0 );
nGrpAdd     = 0;

# Apply Naming convention
# Prefix
If( sPrefix @= '' );
    sGrpNmD = '';
Else;
    sGrpNmD = Expand('%sPrefix%%sDelimNm%');
EndIf;
# Dimension name
sDimNm      = '';
If( bDimNm  = 0 );
    If( DimIx( '}ElementAttributes_' | cDimSrc, sAttrDim ) > 0 );
        sDimNm = AttrS( cDimSrc, vDim, sAttrDim );
    EndIf;
    sDimNm  = If( sDimNm @= '', vDim, sDimNm );
    sGrpNmD = Expand('%sGrpNmD%%sDimNm%%sDelimNm%');
EndIf;
# Recursive / Point
If( bPoint  = 0 );
    sRec    = '';
    sPnt    = '';
Else;
    sRec    = Expand('%sDelimNm%REC');
    sPnt    = Expand('%sDelimNm%PNT');
EndIf;    
# Read / Write
If( bReadOnly  = 0 );
    sRead   = '';
    sWrite  = '';
Else;
    sRead   = Expand('%sDelimNm%READ');
    sWrite  = Expand('%sDelimNm%WRITE');
EndIf;    
# Element name (here placeholder, name per element inserted during loop of elements)
sGrpNmRR    = '%sGrpNmD%%sEleNm%%sRec%%sRead%';
sGrpNmRW    = '%sGrpNmD%%sEleNm%%sRec%%sWrite%';
sGrpNmPR    = '%sGrpNmD%%sEleNm%%sPnt%%sRead%';
sGrpNmPW    = '%sGrpNmD%%sEleNm%%sPnt%%sWrite%';

# Create ALL group(s) for dimension
If( bAll    = 1 );
    nGrpAdd = nGrpAdd + 1;
    sEleNm  = 'ALL';
    sGrp    = Expand( '%sGrpNmD%%sEleNm%%sWrite%' );
    If( DimIx( cDimTgt, sGrp ) = 0 );
        DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
        DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
        DimensionElementComponentAdd( cDimTgt, cGrpEleSec, sGrp, 1 );
    EndIf;
    If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
        AddGroup( sGrp );
    EndIf;
    If( bReadOnly = 1 );
        nGrpAdd = nGrpAdd + 1;
        sGrp= Expand( '%sGrpNmD%%sEleNm%%sRead%' );
        If( DimIx( cDimTgt, sGrp ) = 0 );
            DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
            DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
            DimensionElementComponentAdd( cDimTgt, cGrpEleSec, sGrp, 1 );
        EndIf;
        If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
            AddGroup( sGrp );
        EndIf;
    EndIf;
EndIf;

# Create ROOT group(s) for dimension
If( bRoot   = 1 );
    nGrpAdd = nGrpAdd + 1;
    sEleNm  = 'ROOT';
    sGrp    = Expand( '%sGrpNmD%%sEleNm%%sWrite%' );
    If( DimIx( cDimTgt, sGrp ) = 0 );
        DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
        DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
    EndIf;
    If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
        AddGroup( sGrp );
    EndIf;
    If( bReadOnly = 1 );
        nGrpAdd = nGrpAdd + 1;
        sGrp= Expand( '%sGrpNmD%%sEleNm%%sRead%' );
        If( DimIx( cDimTgt, sGrp ) = 0 );
            DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
            DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
        EndIf;
        If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
            AddGroup( sGrp );
        EndIf;
    EndIf;
EndIf;

# Determine if dimension contains hiearchies and if so loop each one
sMDX = Expand('{[}Dimensions].[%vDim%],TM1FilterByPattern([}Dimensions].Members,"%vDim%:*")}');
If( SubsetExists( cDimDims, cSubSrc ) = 0 );
    SubsetCreatebyMDX( cSubSrc, sMDX, cDimDims, 1 );
Else;
    SubsetMDXSet( cDimDims, cSubSrc, sMDX );
EndIf;
nHierMax = SubsetGetSize( cDimDims, cSubSrc );
nHier = 1;
While( nHier <= nHierMax );
    # Loop each hierarchy to create all the other element dependent groups
    vDimHier = SubsetGetElementName( cDimDims, cSubSrc, nHier );
    # Skip leaves hierarchy
    If( Scan( ':LEAVES', Upper(vDimHier) ) = 0 );
        nMax = DimSiz( vDimHier );
        nCtr = 1;
        While( nCtr <= nMax );
            sEle = DimNm( vDimHier, nCtr );
            # only do the group creation if level of element >= the defined LevelTo
            nElLev = ElLev( vDimHier, sEle );
            If( nElLev >= nLevelTo );
                sEleNm = sEle;
                If( bAttrEle = 1 );
                    If( vDim @= vDimHier );
                        If( AttrS( vDim, sEle, sAttrEle ) @<> '' );
                            sEleNm = AttrS( vDim, sEle, sAttrEle );
                        EndIf;
                    Else;
                        sHier = SubSt( vDimHier, Scan(':', vDimHier)+1, Long(vDimHier) );
                        If( ElementAttrS( vDim, sHier, sEle, sAttrEle ) @<> '' );
                            sEleNm = ElementAttrS( vDim, sHier, sEle, sAttrEle );
                        EndIf;
                    EndIf;
                EndIf;
                If( nElLev >= 1 );
                    # Default group Recursive Write
                    nGrpAdd = nGrpAdd + 1;
                    sGrp = Expand( sGrpNmRW );
                    If( DimIx( cDimTgt, sGrp ) = 0 );
                        DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
                        DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
                        DimensionElementComponentAdd( cDimTgt, cGrpEleSec, sGrp, 1 );
                    EndIf;
                    If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
                        AddGroup( sGrp );
                    EndIf;
                ElseIf( nElLev = 0 );
                    # Write Group for Leaves
                    nGrpAdd = nGrpAdd + 1;
                    sGrp = Expand( sGrpNmPW );
                    If( DimIx( cDimTgt, sGrp ) = 0 );
                        DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
                        DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
                        DimensionElementComponentAdd( cDimTgt, cGrpEleSec, sGrp, 1 );
                    EndIf;
                    If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
                        AddGroup( sGrp );
                    EndIf;
                EndIf;
                If( nElLev >= 1 & bReadOnly = 1 );
                    # Read Only Groups (Recursive)
                    nGrpAdd = nGrpAdd + 1;
                    sGrp = Expand( sGrpNmRR );
                    If( DimIx( cDimTgt, sGrp ) = 0 );
                        DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
                        DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
                        DimensionElementComponentAdd( cDimTgt, cGrpEleSec, sGrp, 1 );
                    EndIf;
                    If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
                        AddGroup( sGrp );
                    EndIf;
                EndIf;
                If( ( bPoint = 1 % nElLev = 0 ) & bReadOnly = 1 );
                    # Read Only Groups (Point)
                    nGrpAdd = nGrpAdd + 1;
                    sGrp = Expand( sGrpNmPR );
                    If( DimIx( cDimTgt, sGrp ) = 0 );
                        DimensionElementInsert( cDimTgt, '', sGrp, 'N' );
                        DimensionElementComponentAdd( cDimTgt, cGrpTot, sGrp, 1 );
                        DimensionElementComponentAdd( cDimTgt, cGrpEleSec, sGrp, 1 );
                    EndIf;
                    If( pMode @= '0' & DimIx( '}Groups', sGrp ) = 0 & pDebug @< '1' );
                        AddGroup( sGrp );
                    EndIf;
                EndIf;
            EndIf;
            nCtr = nCtr + 1;
        End;
    EndIf;
    nHier = nHier + 1;
End;

######################
### END Metadata
574,346
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

If( CellIsUpdateable( cCubSrc, vDim, 'Number of Groups Created' ) = 1 );
    CellPutN( nGrpAdd, cCubSrc, vDim, 'Number of Groups Created' );
    CellPutS( TimSt( Now(), CellGetS('}APQ Settings', 'Date Time format','String') ), cCubSrc, vDim, 'Last Group Creation' );
EndIf;

sMgrDim1    = CellGetS( cCubSrc, vDim, 'Managing Dimension 1' );
If( sMgrDim1@= '' % sMgrDim1 @= vDim );
    # Standard case: element security not managed from another dimension

    # Declare constants for dimension
    bAll        = CellGetN( cCubSrc, vDim, 'Create All Group' );
    bRoot       = CellGetN( cCubSrc, vDim, 'Create Root Only Group' );
    bPoint      = CellGetN( cCubSrc, vDim, 'Create Point Only Groups for C Elements' );
    bReadOnly   = CellGetN( cCubSrc, vDim, 'Create Read Only Groups' );
    bDimNm      = CellGetN( cCubSrc, vDim, 'Exclude Dimension from Group Name' );
    nLevelTo    = CellGetN( cCubSrc, vDim, 'Create Groups to Element Level' );
    sPrefix     = CellGetS( cCubSrc, vDim, 'Group Name Prefix' );
    sDelimNm    = If( CellGetS( cCubSrc, vDim, 'Group Name Part Delimiter' ) @= '', ':', CellGetS( cCubSrc, vDim, 'Group Name Part Delimiter' ) );
    sAttrDim    = CellGetS( cCubSrc, vDim, 'Dimension Attribute for Name' );
    sAttrEle    = CellGetS( cCubSrc, vDim, 'Element Attribute for Name' );
    bAttrEle    = If( sAttrEle @<> '' & DimensionExists( '}ElementAttributes_' | vDim ) = 1, 1, 0 );
    
    # Apply Naming convention
    # Prefix
    If( sPrefix @= '' );
        sGrpNmD = '';
    Else;
        sGrpNmD = Expand('%sPrefix%%sDelimNm%');
    EndIf;
    # Dimension name
    sDimNm      = '';
    If( bDimNm  = 0 );
        If( DimIx( '}ElementAttributes_' | cDimSrc, sAttrDim ) > 0 );
            sDimNm = AttrS( cDimSrc, vDim, sAttrDim );
        EndIf;
        sDimNm  = If( sDimNm @= '', vDim, sDimNm );
        sGrpNmD = Expand('%sGrpNmD%%sDimNm%%sDelimNm%');
    EndIf;
    # Recursive / Point
    If( bPoint  = 0 );
        sRec    = '';
        sPnt    = '';
    Else;
        sRec    = Expand('%sDelimNm%REC');
        sPnt    = Expand('%sDelimNm%PNT');
    EndIf;    
    # Read / Write
    If( bReadOnly  = 0 );
        sRead   = '';
        sWrite  = '';
    Else;
        sRead   = Expand('%sDelimNm%READ');
        sWrite  = Expand('%sDelimNm%WRITE');
    EndIf;    
    # Element name (here placeholder, name per element inserted during loop of elements)
    sGrpNmRR    = '%sGrpNmD%%sEleNm%%sRec%%sRead%';
    sGrpNmRW    = '%sGrpNmD%%sEleNm%%sRec%%sWrite%';
    sGrpNmPR    = '%sGrpNmD%%sEleNm%%sPnt%%sRead%';
    sGrpNmPW    = '%sGrpNmD%%sEleNm%%sPnt%%sWrite%';

    # Determine if dimension contains hiearchies and if so loop each one
    sMDX = Expand('{[}Dimensions].[%vDim%],TM1FilterByPattern([}Dimensions].Members,"%vDim%:*")}');
    If( SubsetExists( cDimDims, cSubSrc ) = 0 );
        SubsetCreatebyMDX( cSubSrc, sMDX, cDimDims, 1 );
    Else;
        SubsetMDXSet( cDimDims, cSubSrc, sMDX );
    EndIf;
    nHierMax = SubsetGetSize( cDimDims, cSubSrc );
    nHier = 1;
    While( nHier <= nHierMax );
        # Loop each hierarchy to create all the other element dependent groups
        vDimHier = SubsetGetElementName( cDimDims, cSubSrc, nHier );
        # Skip leaves hierarchy
        If( Scan( ':LEAVES', Upper(vDimHier) ) = 0 );
        
            # Apply ALL elements security for dimension
            If( bAll    = 1 );
                sEleNm  = 'ALL';
                sGrp    = Expand( '%sGrpNmD%%sEleNm%%sWrite%' );
                CellPutS( 'ALL', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Type' );
                CellPutS( 'WRITE', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Level' );
                AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                If( bReadOnly = 1 );
                    sGrp= Expand( '%sGrpNmD%%sEleNm%%sRead%' );
                    CellPutS( 'ALL', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Type' );
                    CellPutS( 'READ', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Level' );
                    AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                EndIf;
            EndIf;
    
            # Apply ROOT elements security for dimension
            If( bRoot   = 1 );
                sEleNm  = 'ROOT';
                sGrp    = Expand( '%sGrpNmD%%sEleNm%%sWrite%' );
                CellPutS( 'ROOT', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Type' );
                CellPutS( 'WRITE', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Level' );
                AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                If( bReadOnly = 1 );
                    sGrp= Expand( '%sGrpNmD%%sEleNm%%sRead%' );
                    CellPutS( 'ROOT', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Type' );
                    CellPutS( 'READ', cCubTgt, sGrp, vDimHier, cElePlaceHldr, 'Permission Level' );
                    AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                EndIf;
            EndIf;
    
            # Loop hierarchy to apply all the other groups
            nMax = DimSiz( vDimHier );
            nCtr = 1;
            While( nCtr <= nMax );
                sEle = DimNm( vDimHier, nCtr );
                # only apply if level of element >= the defined LevelTo
                nElLev = ElLev( vDimHier, sEle );
                If( nElLev >= nLevelTo );
                    sEleNm = sEle;
                    If( bAttrEle = 1 );
                        If( vDim @= vDimHier );
                            If( AttrS( vDim, sEle, sAttrEle ) @<> '' );
                                sEleNm = AttrS( vDim, sEle, sAttrEle );
                            EndIf;
                        Else;
                            sHier = SubSt( vDimHier, Scan(':', vDimHier)+1, Long(vDimHier) );
                            If( ElementAttrS( vDim, sHier, sEle, sAttrEle ) @<> '' );
                                sEleNm = ElementAttrS( vDim, sHier, sEle, sAttrEle );
                            EndIf;
                        EndIf;
                    EndIf;
                    If( nElLev >= 1 );
                        # Default group Recursive Write
                        sGrp = Expand( sGrpNmRW );
                        CellPutS( 'RECURSIVE', cCubTgt, sGrp, vDimHier, sEle, 'Permission Type' );
                        CellPutS( 'WRITE', cCubTgt, sGrp, vDimHier, sEle, 'Permission Level' );
                        AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                    ElseIf( nElLev = 0 );
                        # Write Group for Leaves
                        sGrp = Expand( sGrpNmPW );
                        CellPutS( 'POINT', cCubTgt, sGrp, vDimHier, sEle, 'Permission Type' );
                        CellPutS( 'WRITE', cCubTgt, sGrp, vDimHier, sEle, 'Permission Level' );
                        AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                    EndIf;
                    If( nElLev >= 1 & bReadOnly = 1 );
                        # Read Only Groups (Recursive)
                        sGrp = Expand( sGrpNmRR );
                        CellPutS( 'RECURSIVE', cCubTgt, sGrp, vDimHier, sEle, 'Permission Type' );
                        CellPutS( 'READ', cCubTgt, sGrp, vDimHier, sEle, 'Permission Level' );
                        AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                    EndIf;
                    If( ( bPoint = 1 % nElLev = 0 ) & bReadOnly = 1 );
                        # Read Only Groups (Point)
                        sGrp = Expand( sGrpNmPR );
                        CellPutS( 'POINT', cCubTgt, sGrp, vDimHier, sEle, 'Permission Type' );
                        CellPutS( 'READ', cCubTgt, sGrp, vDimHier, sEle, 'Permission Level' );
                        AttrPutS( vDim, cDimTgt, sGrp, 'ELEMENT_SECURITY' );
                    EndIf;
                EndIf;
                nCtr = nCtr + 1;
            End;
        EndIf;
        nHier = nHier + 1;
    End;

    # create element security subsets in }APQ Groups dimension
    sSub = Expand('Element Security - %vDim%');
    sMDX = Expand('{Filter( {[%cDimTgt%].[%cDimTgt%].[Total APQ Element Security Groups].Children}, [%cDimTgt%].[%cDimTgt%].CurrentMember.Properties("ELEMENT_SECURITY") = "%vDim%" )}');
    If( SubsetExists( cDimTgt, sSub ) = 0 );
        SubsetCreatebyMDX( sSub, sMDX, cDimTgt, 0 );
    Else;
        SubsetMDXSet( cDimTgt, sSub, sMDX );
    EndIf;
    
Else;
    # Element security groups are sourced from another dimension. We assume that there must be a match on element name (and typically that the element from other dimension must be a C element in this dimension)    
    iMgrDim     = 1;
    While( iMgrDim <= 3 );
        sMgrDim = CellGetS( cCubSrc, vDim, 'Managing Dimension ' | NumberToString( iMgrDim ) );
        If( DimIx( cDimSrc, sMgrDim ) > 0 );
            
            # Declare constants for dimension
            bAll        = CellGetN( cCubSrc, sMgrDim, 'Create All Group' );
            bRoot       = CellGetN( cCubSrc, sMgrDim, 'Create Root Only Group' );
            bPoint      = CellGetN( cCubSrc, sMgrDim, 'Create Point Only Groups for C Elements' );
            bReadOnly   = CellGetN( cCubSrc, sMgrDim, 'Create Read Only Groups' );
            bDimNm      = CellGetN( cCubSrc, sMgrDim, 'Exclude Dimension from Group Name' );
            nLevelTo    = CellGetN( cCubSrc, sMgrDim, 'Create Groups to Element Level' );
            sPrefix     = CellGetS( cCubSrc, sMgrDim, 'Group Name Prefix' );
            sDelimNm    = If( CellGetS( cCubSrc, sMgrDim, 'Group Name Part Delimiter' ) @= '', ':', CellGetS( cCubSrc, vDim, 'Group Name Part Delimiter' ) );
            sAttrDim    = CellGetS( cCubSrc, sMgrDim, 'Dimension Attribute for Name' );
            sAttrEle    = CellGetS( cCubSrc, sMgrDim, 'Element Attribute for Name' );
            bAttrEle    = If( sAttrEle @<> '' & DimensionExists( '}ElementAttributes_' | sMgrDim ) = 1, 1, 0 );
            
            # Apply Naming convention
            # Prefix
            If( sPrefix @= '' );
                sGrpNmD = '';
            Else;
                sGrpNmD = Expand('%sPrefix%%sDelimNm%');
            EndIf;
            # Dimension name
            sDimNm      = '';
            If( bDimNm  = 0 );
                If( DimIx( '}ElementAttributes_' | cDimSrc, sAttrDim ) > 0 );
                    sDimNm = AttrS( cDimSrc, sMgrDim, sAttrDim );
                EndIf;
                sDimNm  = If( sDimNm @= '', sMgrDim, sDimNm );
                sGrpNmD = Expand('%sGrpNmD%%sDimNm%%sDelimNm%');
            EndIf;
            # Recursive / Point
            If( bPoint  = 0 );
                sRec    = '';
                sPnt    = '';
            Else;
                sRec    = Expand('%sDelimNm%REC');
                sPnt    = Expand('%sDelimNm%PNT');
            EndIf;    
            # Read / Write
            If( bReadOnly  = 0 );
                sRead   = '';
                sWrite  = '';
            Else;
                sRead   = Expand('%sDelimNm%READ');
                sWrite  = Expand('%sDelimNm%WRITE');
            EndIf;    
            # Element name (here placeholder, name per element inserted during loop of elements)
            sGrpNmRR    = '%sGrpNmD%%sEleNm%%sRec%%sRead%';
            sGrpNmRW    = '%sGrpNmD%%sEleNm%%sRec%%sWrite%';
            sGrpNmPR    = '%sGrpNmD%%sEleNm%%sPnt%%sRead%';
            sGrpNmPW    = '%sGrpNmD%%sEleNm%%sPnt%%sWrite%';
            
            # Apply ALL elements security for dimension
            If( bAll    = 1 );
                sEleNm  = 'ALL';
                sGrp    = Expand( '%sGrpNmD%%sEleNm%%sWrite%' );
                If( DimIx( cDimTgt, sGrp ) > 0 );
                    CellPutS( 'ALL', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Type' );
                    CellPutS( 'WRITE', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Level' );
                EndIf;
                If( bReadOnly = 1 );
                    sGrp= Expand( '%sGrpNmD%%sEleNm%%sRead%' );
                    If( DimIx( cDimTgt, sGrp ) > 0 );
                        CellPutS( 'ALL', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Type' );
                        CellPutS( 'READ', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Level' );
                    EndIf;
                EndIf;
            EndIf;
            
            # Apply ROOT elements security for dimension
            If( bRoot   = 1 );
                sEleNm  = 'ROOT';
                sGrp    = Expand( '%sGrpNmD%%sEleNm%%sWrite%' );
                If( DimIx( cDimTgt, sGrp ) > 0 );
                    CellPutS( 'ROOT', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Type' );
                    CellPutS( 'WRITE', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Level' );
                EndIf;
                If( bReadOnly = 1 );
                    sGrp= Expand( '%sGrpNmD%%sEleNm%%sRead%' );
                    If( DimIx( cDimTgt, sGrp ) > 0 );
                        CellPutS( 'ROOT', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Type' );
                        CellPutS( 'READ', cCubTgt, sGrp, vDim, cElePlaceHldr, 'Permission Level' );
                    EndIf;
                EndIf;
            EndIf;
            
            # Loop managing dimension to apply all the other groups
            # For each element in managing dimension test 1: does group exist. test 2: does element exist in target dimension. If both tests pass then apply security
            nMax = DimSiz( sMgrDim );
            nCtr = 1;
            While( nCtr <= nMax );
                # element name and caption for group name in managing dimension
                sEle = DimNm( sMgrDim, nCtr );
                sEleNm = sEle;
                If( bAttrEle = 1 );
                    If( AttrS( sMgrDim, sEle, sAttrEle ) @<> '' );
                        sEleNm = AttrS( sMgrDim, sEle, sAttrEle );
                    EndIf;
                EndIf;
                # does the element exist in the target dimension?
                sTgtEle = '';
                If( DimIx( vDim, sEle ) > 0 );
                    sTgtEle = DimensionElementPrincipalName( vDim, sEle );
                ElseIf( DimIx( vDim, sEleNm ) > 0 );
                    sTgtEle = DimensionElementPrincipalName( vDim, sEleNm );
                EndIf;
                # Recursive Write for C elements & Point Write for N elements
                sGrp = Expand( sGrpNmRW );
                If( DimIx( cDimTgt, sGrp ) > 0 & DimIx( vDim, sTgtEle ) > 0 );
                    If( ElLev( vDim, sTgtEle ) = 0 );
                        CellPutS( 'POINT', cCubTgt, sGrp, vDim, sTgtEle, 'Permission Type' );
                    Else;
                        CellPutS( 'RECURSIVE', cCubTgt, sGrp, vDim, sTgtEle, 'Permission Type' );
                    EndIf;
                    CellPutS( 'WRITE', cCubTgt, sGrp, vDim, sTgtEle, 'Permission Level' );
                EndIf;
                # Read Only Groups (Recursive)
                If( bReadOnly = 1 );
                    sGrp = Expand( sGrpNmRR );
                    If( DimIx( cDimTgt, sGrp ) > 0 & DimIx( vDim, sTgtEle ) > 0 );
                        If( ElLev( vDim, sTgtEle ) = 0 );
                            CellPutS( 'POINT', cCubTgt, sGrp, vDim, sTgtEle, 'Permission Type' );
                        Else;
                            CellPutS( 'RECURSIVE', cCubTgt, sGrp, vDim, sTgtEle, 'Permission Type' );
                        EndIf;
                        CellPutS( 'READ', cCubTgt, sGrp, vDim, sTgtEle, 'Permission Level' );
                    EndIf;
                EndIf;
                # Point Only Groups for C elements (only Read Only by definition)
                If( bPoint = 1 );
                    sGrp = Expand( sGrpNmPR );
                    If( DimIx( cDimTgt, sGrp ) > 0 & DimIx( vDim, sTgtEle ) > 0 );
                        CellPutS( 'POINT', cCubTgt, sGrp, vDim, sEle, 'Permission Type' );
                        CellPutS( 'READ', cCubTgt, sGrp, vDim, sEle, 'Permission Level' );
                    EndIf;
                EndIf;

                nCtr = nCtr + 1;
            End;
        
        EndIf;        
        iMgrDim = iMgrDim + 1;
    End;
EndIf;

######################
### END Data
575,47
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
### Call sub process to create and apply element security

sProc = '}APQ.Security.Elements.LoadAccessRights';
ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging,
	'pDebug', pDebug,
	'pDimension', pDimension,
	'pGroup', '',
	'pDelimiter', pDelimiter,
	'pMode', pMode,
	'pClear', pClear,
	'pSecurityRefresh', pSecurityRefresh
);

##############################################################################################################
#Region - Finalize Logging
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime=Now();sProcessErrorLogFile=GetProcessErrorFileName;sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessFinishTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessFinishTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessCompletedFlag');
  CellPutN(nMetaDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataRecordCount');CellPutN(nDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataRecordCount');
  CellPutN(PrologMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nPrologMinorErrorCount');CellPutN(MetadataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataMinorErrorCount');
  CellPutN(DataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataMinorErrorCount');CellPutN(ProcessReturnCode,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessReturnCode');
  CellPutS(sProcessErrorLogFile,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sProcessErrorLogFile');nCountTime=nCountTime+1;End;
  If(nDataRecordCount>0);If(cCubTgt@<>'');CellPutN(nProcessFinishTime,sCubLogCube,cCubTgt,'nLastTimeUpdate');CellPutS(sThisProcName,sCubLogCube,cCubTgt,'sProcess');CellPutS(sProcessRunBy,sCubLogCube,cCubTgt,'sProcessRunBy');EndIf;EndIf;
EndIF;
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
#EndRegion - Finalize Logging
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
