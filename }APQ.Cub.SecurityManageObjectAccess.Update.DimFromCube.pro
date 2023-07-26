601,100
602,"}APQ.Cub.SecurityManageObjectAccess.Update.DimFromCube"
562,"VIEW"
586,"}APQ Security Manage Object Access"
585,"}APQ Security Manage Object Access"
564,
565,"kAeltH2PrEGav_z3iAUHVa9XD[Y\v<o6>XE[U^1W^4@=7i9WMP[3Hd`WRL@RnMEn>YvdQas^U\?AM2nQVKeK;;0p>6b`liqnHiteA\g]JRd2r_g7C6X8=APGBAta`Doq?;QdF`8=ybat\Y<l]c8<PU=W<Abc75Op1I8BsRB[[tzvdKAf3eIzlYfM;dXTmoh_`;7iJ\P<"
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
570,Set Cube Security
571,
569,0
592,0
599,1000
560,3
pGroup
pDelimiter
pMode
561,3
2
2
2
590,3
pGroup,""
pDelimiter,""
pMode,"0"
637,3
pGroup,"Optional: Group(s) to include Blank = ALL"
pDelimiter,"Optional: Element List delimiter for use in object type & groups list (Blank = take value from framework element delimiter settings)"
pMode,"Optional: Simulate mode? If true then simulate only and change only the ""permission level"" measure with no change to security model (Default = false)"
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
572,223
##############################################################################################################
#Region - Header
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright ? 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
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
###     Read security assignments for cubes and push to all associated dimensions and element attribute cubes
### DATA SOURCE:
###     Cube: }APQ Security Manage Object Access
#EndRegion @DOC
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE   CHANGED BY  COMMENT
### 2018-02-13    SW    Creation of Process (TBMS)
### 2018-03-10    SW    Generalize for framework inclusion
### 2018-03-30    SW    Add automatic inclusion of }Picklist & }CubeDrill if base object selected & APQ User catch-all defaults.
### 2019-03-06    SW    Convert Bedrock4 & temp view
### 2019-03-22    SW    Modify for addition of permission index dim to source cube
### 2019-09-28    SW    Don't ovewrite dependent objects with READ if set independently with higher value (#0245)
### 2020-01-07 	  SW   	FIX:#188 docstring tags
### 2020-06-02 	  SW   	FIX:#151 alternate hierarchy support
### 2020-12-14 	  SW   	FIX:#324 enhance object security model
##############################################################################################################

##############################################################################################################
#Region - Logging
sThisProcName = GetProcessName();
pDoProcessLogging = '1';
### Params
# object type will ALWAYS be cube
pObjectType = 'Cube';
sProcLogParams = Expand('pObjectType:%pObjectType% & pGroup:%pGroup% & pDelimiter:%pDelimiter% & pMode:%pMode%');
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

#     Standard naming convention for source and target cubes/dimensions
cCubSrc         = '}APQ Security Manage Object Access';
cCubTgt         = cCubSrc;
cDimSrc         = '}APQ Groups';
cDimObjTyp      = '}APQ TM1 Object Type';
cDimPermission  = '}APQ Security Permission Index';
cDimObject      = '}APQ TM1 Objects';
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
cCommentCube    = CellGetS( cCubParam, 'Std Comment Cube Name', 'String' );
cCommentCube    = SubSt( cCommentCube, 1, Scan( '<cube>', cCommentCube ) - 1 );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cFilter         = '';
nErr            = 0;
sErr            = '';

######################
### Debug
IF( nDebug > 0 );
    LogOutPut('INFO', sDebugFile);
    AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
    AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
    AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
    nErr = nErr+ 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Failed license validation.';
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
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('Conflict of list delimiter %pDelimiter% with bedrock dimension delimiter!');
EndIf;

# object type (hardcoded to Cube)
If( pObjectType @<> '' );
    IF( DIMIX( cDimObjTyp, pObjectType) = 0 );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid Object Type:' | pObjectType; 
    EndIF;
EndIf;

# group(s)
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

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
   IF( nDebug > 0 );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

######################
### All users must have access to certain control cubes and dimensions e.g. }Dimensions, }DimensionAttributes
### Make sure that the APQ User group (which EVERY user should be a member of) has access to these objects. Update lists as required. 
### Note!! Logic of loop requires trailing delimiter in list.

cAPQGrpAttr = 'APQ User';
cAPQUserGrp = CellGetS( cCubParam, 'Security Group: End User', 'String' );
sCubeList   = '}CubeAttributes+}DimensionAttributes+';
sDimList    = '}Annotation_ApplicationID+}AnnotationMeasures+}APQ Cell Comment Index+}APQ Cell Comment Measure+}APQ PickList Validations+}CubeAttributes+}CubeDrillString+}DimensionAttributes+}Dimensions+}PickList+';

If( DimIx( '}Groups', cAPQUserGrp ) > 0 );
    sDim = '}APQ Cubes';
    sList = sCubeList;
    While( Scan( '+', sList ) > 0 );
        sObj = SubSt( sList, 1, Scan( '+', sList ) - 1 );
        If( CubeExists( sObj ) = 1 );
            AttrPutS( 'READ', sDim, sObj, cAPQGrpAttr );
        EndIf;
        sList = SubSt( sList, Scan( '+', sList ) + 1, Long( sList ) );
    End;
    sDim = '}APQ Dimensions';
    sList = sDimList;
    While( Scan( '+', sList ) > 0 );
        sObj = SubSt( sList, 1, Scan( '+', sList ) - 1 );
        If( DimensionExists( sObj ) = 1 );
            AttrPutS( 'READ', sDim, sObj, cAPQGrpAttr );
        EndIf;
        sList = SubSt( sList, Scan( '+', sList ) + 1, Long( sList ) );
    End;
EndIf;

######################
### Create the view to assign as data source for the process

sProc           = '}bedrock.cube.view.create';
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 0;
sFilter         = Expand( '%cFilter%%cDimObjTyp%%sDelimEleStart%%pObjectType%%sDelimDim%%cDimM%%sDelimEleStart%Permission Level' );
ExecuteProcess( sProc, 'pLogOutput', nDebug, 
    'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
    'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1
);

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

574,248
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright ? 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
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

# skip if permission index is "All Permissions"
If( vPermissionNo @= 'All Permissions' );
    ItemSkip;
EndIf;

# check if record is flagged as inactive
If( CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, vObject, 'Inactive' ) = 1 );
    ItemSkip;
EndIf;

# check if access for PermissionIndex is flagged as NONE
If( CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, vObject, 'Permission Numeric' ) = 0 );
    ItemSkip;
EndIf;

# Loop through all dimensions in cube to add dimension & element attribute access
# For any UI using Rest API direct access to ElementAttribute, Picklist & Drill cubes is required
sCube = vObject;
nCtr = 1;
While( TabDim( sCube, nCtr ) @<> '' );
    sDim = TabDim( sCube, nCtr );
    # check object exists in APQ dimension
    If( DimIx( cDimObject, sDim ) = 0 );
        DimensionElementInsertDirect( cDimObject, '', sDim, 'N' );
        DimensionElementComponentAddDirect( cDimObject, 'Total APQ Dimensions', sDim, 1 );
    EndIf;
    # Check that object doesn't have permissions set against it directly
    nPermission     = CellGetN( cCubTgt, vGrp, 'Dimension', vPermissionNo, sDim, 'Permission Numeric' );
    nPermissionAll  = CellGetN( cCubTgt, vGrp, 'Dimension', 'All Permissions', sDim, 'Permission Numeric' );
    # Set dimension access to READ unless it already has a higher direct permission
    If( CellIsUpdateable( cCubTgt, vGrp, 'Dimension', vPermissionNo, sDim, vMeasure ) = 1 & nPermission <= 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, sDim, vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}DimensionSecurity', sDim, vGrp ) = 1 & nPermissionAll <= 1 );
        CellPutS( 'READ', '}DimensionSecurity', sDim, vGrp );
    EndIf;
    # If the dim has attributes then also set read access to }ElementAttributes cube (required for UX Rest MDX queries)
    sLocDim = '}LocalizedElementAttributes_' | sDim;
    sDim = '}ElementAttributes_' | sDim;
    If( CubeExists( sDim ) = 1 );
        # check object exists in APQ dimension
        If( DimIx( cDimObject, sDim ) = 0 );
            DimensionElementInsertDirect( cDimObject, '', sDim, 'N' );
            DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', sDim, 1 );
            DimensionElementComponentAddDirect( cDimObject, 'Total APQ Dimensions', sDim, 1 );
        EndIf;
        # Check that object doesn't have permissions set against it directly
        nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, sDim, 'Permission Numeric' );
        nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', sDim, 'Permission Numeric' );
        # Set cube access to READ unless it already has a higher direct permission
        If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, sDim, vMeasure ) = 1 & nPermission <= 1 );
            CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, sDim, vMeasure );
        EndIf;
        If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', sDim, vGrp ) = 1 & nPermissionAll <= 1 );
            CellPutS( 'READ', '}CubeSecurity', sDim, vGrp );
        EndIf;
        # Set }ElementAttributes dim access should be READ
        If( CellIsUpdateable( cCubTgt, vGrp, 'Dimension', vPermissionNo, sDim, vMeasure ) = 1 );
            CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, sDim, vMeasure );
        EndIf;
        If( pMode @= '0' & CellIsUpdateable( '}DimensionSecurity', sDim, vGrp ) = 1 );
            CellPutS( 'READ', '}DimensionSecurity', sDim, vGrp );
        EndIf;
    EndIf;
    If( CubeExists( sLocDim ) = 1 );
        # check object exists in APQ dimension
        If( DimIx( cDimObject, sLocDim ) = 0 );
            DimensionElementInsertDirect( cDimObject, '', sLocDim, 'N' );
            DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', sLocDim, 1 );
        EndIf;
        # Check that object doesn't have permissions set against it directly
        nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, sLocDim, 'Permission Numeric' );
        nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', sLocDim, 'Permission Numeric' );
        # Set cube access to READ unless it already has a higher direct permission
        If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, sLocDim, vMeasure ) = 1 & nPermission <= 1 );
            CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, sLocDim, vMeasure );
        EndIf;
        If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', sLocDim, vGrp ) = 1 & nPermissionAll <= 1 );
            CellPutS( 'READ', '}CubeSecurity', sLocDim, vGrp );
        EndIf;
    EndIf;
    nCtr = nCtr + 1;
End;

# Associated Picklist cube
If( CubeExists( '}PickList_' | sCube ) = 1 );
    # check object exists in APQ dimension
    If( DimIx( cDimObject, '}PickList_' | sCube ) = 0 );
        DimensionElementInsertDirect( cDimObject, '', '}PickList_' | sCube, 'N' );
        DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', '}PickList_' | sCube, 1 );
    EndIf;
    # Check that object doesn't have permissions set against it directly
    nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, '}PickList_' | sCube, 'Permission Numeric' );
    nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', '}PickList_' | sCube, 'Permission Numeric' );
    # Assign security
    If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, '}PickList_' | sCube, vMeasure ) = 1 & nPermission <= 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, '}PickList_' | sCube, vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', '}PickList_' | sCube, vGrp ) = 1 & nPermissionAll <= 1 );
        CellPutS( 'READ', '}CubeSecurity', '}PickList_' | sCube, vGrp );
    EndIf;
    If( CellIsUpdateable( cCubTgt, vGrp, 'Dimension', vPermissionNo, '}PickList', vMeasure ) = 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, '}PickList', vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}DimensionSecurity', '}PickList', vGrp ) = 1 );
        CellPutS( 'READ', '}DimensionSecurity', '}PickList', vGrp );
    EndIf;
EndIf;

# Associated ViewAttributes cube
If( CubeExists( '}ViewAttributes_' | sCube ) = 1 );
    # check object exists in APQ dimension
    If( DimIx( cDimObject, '}ViewAttributes_' | sCube ) = 0 );
        DimensionElementInsertDirect( cDimObject, '', '}ViewAttributes_' | sCube, 'N' );
        DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', '}ViewAttributes_' | sCube, 1 );
    EndIf;
    # Check that object doesn't have permissions set against it directly
    nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, '}ViewAttributes_' | sCube, 'Permission Numeric' );
    nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', '}ViewAttributes_' | sCube, 'Permission Numeric' );
    # Assign security
    If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, '}ViewAttributes_' | sCube, vMeasure ) = 1 & nPermission <= 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, '}ViewAttributes_' | sCube, vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', '}ViewAttributes_' | sCube, vGrp ) = 1 & nPermissionAll <= 1 );
        CellPutS( 'READ', '}CubeSecurity', '}ViewAttributes_' | sCube, vGrp );
    EndIf;
    If( CubeExists( '}LocalizedViewAttributes_' | sCube ) = 1 );
        # check object exists in APQ dimension
        If( DimIx( cDimObject, '}LocalizedViewAttributes_' | sCube ) = 0 );
            DimensionElementInsertDirect( cDimObject, '', '}LocalizedViewAttributes_' | sCube, 'N' );
            DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', '}LocalizedViewAttributes_' | sCube, 1 );
        EndIf;
        # Check that object doesn't have permissions set against it directly
        nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, '}LocalizedViewAttributes_' | sCube, 'Permission Numeric' );
        nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', '}LocalizedViewAttributes_' | sCube, 'Permission Numeric' );
        # Assign security
        If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, '}LocalizedViewAttributes_' | sCube, vMeasure ) = 1 & nPermission <= 1 );
            CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, '}LocalizedViewAttributes_' | sCube, vMeasure );
        EndIf;
        If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', '}LocalizedViewAttributes_' | sCube, vGrp ) = 1 & nPermissionAll <= 1 );
            CellPutS( 'READ', '}CubeSecurity', '}LocalizedViewAttributes_' | sCube, vGrp );
        EndIf;
    EndIf;
EndIf;

# Associated Drill cube
If( CubeExists( '}CubeDrill_' | sCube ) = 1 );
    # check object exists in APQ dimension
    If( DimIx( cDimObject, '}CubeDrill_' | sCube ) = 0 );
        DimensionElementInsertDirect( cDimObject, '', '}CubeDrill_' | sCube, 'N' );
        DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', '}CubeDrill_' | sCube, 1 );
    EndIf;
    # Check that object doesn't have permissions set against it directly
    nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, '}CubeDrill_' | sCube, 'Permission Numeric' );
    nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', '}CubeDrill_' | sCube, 'Permission Numeric' );
    # Assign security
    If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, '}CubeDrill_' | sCube, vMeasure ) = 1 & nPermission <= 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, '}CubeDrill_' | sCube, vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', '}CubeDrill_' | sCube, vGrp ) = 1 & nPermissionAll <= 1 );
        CellPutS( 'READ', '}CubeSecurity', '}CubeDrill_' | sCube, vGrp );
    EndIf;
    If( CellIsUpdateable( cCubTgt, vGrp, 'Dimension', vPermissionNo, '}CubeDrillString', vMeasure ) = 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, '}CubeDrillString', vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}DimensionSecurity', '}CubeDrillString', vGrp ) = 1 );
        CellPutS( 'READ', '}DimensionSecurity', '}CubeDrillString', vGrp );
    EndIf;
EndIf;

# Associated Annotations & APQ Comments cube
If( CubeExists( '}CellAnnotations_' | sCube ) = 1 );
    # check object exists in APQ dimension
    If( DimIx( cDimObject, '}CellAnnotations_' | sCube ) = 0 );
        DimensionElementInsertDirect( cDimObject, '', '}CellAnnotations_' | sCube, 'N' );
        DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', '}CellAnnotations_' | sCube, 1 );
    EndIf;
    # Check that object doesn't have permissions set against it directly
    nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, '}CellAnnotations_' | sCube, 'Permission Numeric' );
    nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', '}CellAnnotations_' | sCube, 'Permission Numeric' );
    # Assign security
    If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, '}CellAnnotations_' | sCube, vMeasure ) = 1 & nPermission <= 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, '}CellAnnotations_' | sCube, vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', '}CellAnnotations_' | sCube, vGrp ) = 1 & nPermissionAll <= 1 );
        CellPutS( 'READ', '}CubeSecurity', '}CellAnnotations_' | sCube, vGrp );
    EndIf;
    If( CellIsUpdateable( cCubTgt, vGrp, 'Dimension', vPermissionNo, '}AnnotationMeasures', vMeasure ) = 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, '}AnnotationMeasures', vMeasure );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, '}Annotation_ApplicationID', vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}DimensionSecurity', '}AnnotationMeasures', vGrp ) = 1 );
        CellPutS( 'READ', '}DimensionSecurity', '}AnnotationMeasures', vGrp );
        CellPutS( 'READ', '}DimensionSecurity', '}Annotation_ApplicationID', vGrp );
    EndIf;
EndIf;
If( CubeExists( cCommentCube | sCube ) = 1 );
    # check object exists in APQ dimension
    If( DimIx( cDimObject, cCommentCube | sCube ) = 0 );
        DimensionElementInsertDirect( cDimObject, '', cCommentCube | sCube, 'N' );
        DimensionElementComponentAddDirect( cDimObject, 'Total APQ Cubes', cCommentCube | sCube, 1 );
    EndIf;
    # Check that object doesn't have permissions set against it directly
    nPermission     = CellGetN( cCubTgt, vGrp, vObjTyp, vPermissionNo, cCommentCube | sCube, 'Permission Numeric' );
    nPermissionAll  = CellGetN( cCubTgt, vGrp, vObjTyp, 'All Permissions', cCommentCube | sCube, 'Permission Numeric' );
    # Assign security
    If( CellIsUpdateable( cCubTgt, vGrp, 'Cube', vPermissionNo, cCommentCube | sCube, vMeasure ) = 1 & nPermission <= 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Cube', vPermissionNo, cCommentCube | sCube, vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}CubeSecurity', cCommentCube | sCube, vGrp ) = 1 & nPermissionAll <= 1 );
        CellPutS( 'READ', '}CubeSecurity', cCommentCube | sCube, vGrp );
    EndIf;
    If( CellIsUpdateable( cCubTgt, vGrp, 'Dimension', vPermissionNo, '}APQ Cell Comment Index', vMeasure ) = 1 );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, '}APQ Cell Comment Index', vMeasure );
        CellPutS( 'READ', cCubTgt, vGrp, 'Dimension', vPermissionNo, '}APQ Cell Comment Measure', vMeasure );
    EndIf;
    If( pMode @= '0' & CellIsUpdateable( '}DimensionSecurity', '}APQ Cell Comment Index', vGrp ) = 1 );
        CellPutS( 'READ', '}DimensionSecurity', '}APQ Cell Comment Index', vGrp );
        CellPutS( 'READ', '}DimensionSecurity', '}APQ Cell Comment Measure', vGrp );
    EndIf;
EndIf;

######################
### END Data
575,60
###############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright ? 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
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

# Get alternate hierarchy permissions from main dimension
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
