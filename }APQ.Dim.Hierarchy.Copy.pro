601,100
602,"}APQ.Dim.Hierarchy.Copy"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"shNb[`awHN=2JmGwWxKa\JNUo]T338@;kzi;fW3ha690qNYmhUiq>2Oqn4@5N4NxeKDNh?XX<;qM;Eyp2E71?^DG9:K9MY[>8DL1jNLC_C7q6flLU1o_V0zOzGgscn64jwn98PAqNWvo<w4k4hq5=KX>k>Wa?ciBye@]R9MxkF\n<Q?Uf^zVF_Ah2DKaQqr^SpY9Ddi9"
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
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,17
pDoProcessLogging
pTargetDim
pTempPrefix
pSourceDim
pTargetHier
pSourceHier
pSourceHierExcl
pSourceDimAlias
pSwapDimNm
pAttr
pUnwind
pClearMethod
pAllowInsertN
pPrefix
pSuffix
pDebug
pOverrideHierWht
561,17
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
590,17
pDoProcessLogging,"1"
pTargetDim,""
pTempPrefix,""
pSourceDim,""
pTargetHier,""
pSourceHier,""
pSourceHierExcl,""
pSourceDimAlias,""
pSwapDimNm,"0"
pAttr,"0"
pUnwind,"1"
pClearMethod,"Children"
pAllowInsertN,"1"
pPrefix,""
pSuffix,""
pDebug,"0"
pOverrideHierWht,"0"
637,17
pDoProcessLogging,"Record in process log"
pTargetDim,"Dimension to replace/insert hierarchy"
pTempPrefix,"Prefix appended to target dim name to derive source object"
pSourceDim,"Leave blank if using prefix. If field is not blank then this value will be used instead"
pTargetHier,"Hierarchy to replace in target"
pSourceHier,"Source hierarchy -blank for whole dimension otherwise specific named sub-hierarchy"
pSourceHierExcl,"Named portion of source hierarchy to EXCLUDE"
pSourceDimAlias,"Alias name in source dim to match to principal name or alias in target (if required)"
pSwapDimNm,"If dimension name is part of element name substitute the new dimension name (for cases not covered by Std element names such as NA element, Total element, etc.)"
pAttr,"Include alias attributes"
pUnwind,"Unwind the hierarchy (1) or not (0)"
pClearMethod,"Children / Recursive: Method to clear hierarchy first in target dim"
pAllowInsertN,"Allow insertion of N elements into target dim if they do not already exist"
pPrefix,"Add Prefix to Element"
pSuffix,"Add Suffix to Element"
pDebug,"Debug"
pOverrideHierWht,"Weight overwrite value (empty or 0=keep original weight)"
577,1
vEle
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
572,213
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

########################################################################################
### PURPOSE:
###    Update target hierarchy in target dim from structure in source dim
###    * copies hierarchy from one dimension to another including options to ...
###      * unwind the target hierarchy prior to the copy
###      * exclude a portion of the source hierarchy from the target
###      * substitute principal name in source for alias name to use a principal in target. Substitute hierarchy name
###      * use source element weightings versus universal weighting of 1
###      * prefix or suffix element names
###      * substitute the target dim name for the source dim name where dim name is part of the element principal name (e.g. NA elements)
###      * include or exclude copying alias values (where matching attribute name is found)
###      * insert leaf elements into target dimension or stop hierarchy copy at 1st level parent
### DATA SOURCE:
###    Any hierarchical dimension
### INTENDED USAGE:
###    For analog dimensions copy a hierarchy already defined in one dimension to another dimension
### NOTES / KNOWN ISSUES:
###    The process assumes BOTH the target dimension and target hierarchy already exist. In situations where the target dimension is to be created this should be handled in an external caller process to create the dimension and insert as C element the target hierarchy name
########################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pTargetDim:' | pTargetDim |' & '| 'pTempPrefix:' | pTempPrefix |' & '| 'pSourceDim:' | pSourceDim |' & '| 'pTargetHier:' | pTargetHier |' & '| 'pSourceHier:' | pSourceHier |' & '| 'pSourceHierExcl:' | pSourceHierExcl 
 |' & '| 'pSourceDimAlias:' | pSourceDimAlias |' & '| 'pSwapDimNm:' | pSwapDimNm |' & ' | 'pClearMethod:' | pClearMethod |' & '| 'pAttr:' | pAttr |' & '| 'pAllowInsertN:' | pAllowInsertN |' & '| 'pOverrideHierWht:' | pOverrideHierWht;
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

######################
### Inits - declare constants

cDimSrc         = IF( pSourceDim @<> '', pSourceDim, pTempPrefix |' '| pTargetDim);
cCubSrc         = '}ElementAttributes_' | cDimSrc;
cDimTgt         = pTargetDim;
cCubTgt         = '}ElementAttributes_' | cDimTgt;
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';

cHier           = pTargetHier;
cHierSource     = pSourceHier;
nRecursive      = IF( pClearMethod @= 'Recursive', 1, 0 ); 
nDescCheck      = 0;
nAliasCheck     = 0;

### Totals, NA & not mapped elements
cNA_Generic     = CellGetS( cCubParam, 'Std NA Element', 'String' );
IF( Scan( '<dimension>', cNA_Generic ) = 0 );
  cNA_Source    = cNA_Generic;
  cNA_Target    = cNA_Generic;
ElseIF( Scan( '<dimension>', cNA_Generic ) = 1 );
  cNA_Source    = pSourceDim | SubSt( cNA_Generic, 12, Long( cNA_Generic ) - 11 );
  cNA_Target    = pTargetDim | SubSt( cNA_Generic, 12, Long( cNA_Generic ) - 11 );
Else;
  cNA_Source    = SubSt( cNA_Generic, 1, Scan( '<dimension>', cNA_Generic ) - 1 ) | pSourceDim | SubSt( cNA_Generic, Scan( '<dimension>', cNA_Generic ) + 11, Long( cNA_Generic ) - Scan( '<dimension>', cNA_Generic ) + 10 );
  cNA_Target    = SubSt( cNA_Generic, 1, Scan( '<dimension>', cNA_Generic ) - 1 ) | pTargetDim | SubSt( cNA_Generic, Scan( '<dimension>', cNA_Generic ) + 11, Long( cNA_Generic ) - Scan( '<dimension>', cNA_Generic ) + 10 );
EndIF;

cNM_Generic     = CellGetS( cCubParam, 'Std Unallocated Node', 'String' );
IF( Scan( '<dimension>', cNM_Generic ) = 0 );
  cNM_Source    = cNM_Generic;
  cNM_Target    = cNM_Generic;
ElseIF( Scan( '<dimension>', cNM_Generic ) = 1 );
  cNM_Source    = pSourceDim | SubSt( cNM_Generic, 12, Long( cNM_Generic ) - 11 );
  cNM_Target    = pTargetDim | SubSt( cNM_Generic, 12, Long( cNM_Generic ) - 11 );
Else;
  cNM_Source    = SubSt( cNM_Generic, 1, Scan( '<dimension>', cNM_Generic ) - 1 ) | pSourceDim | SubSt( cNM_Generic, Scan( '<dimension>', cNM_Generic ) + 11, Long( cNM_Generic ) - Scan( '<dimension>', cNM_Generic ) + 10 );
  cNM_Target    = SubSt( cNM_Generic, 1, Scan( '<dimension>', cNM_Generic ) - 1 ) | pTargetDim | SubSt( cNM_Generic, Scan( '<dimension>', cNM_Generic ) + 11, Long( cNM_Generic ) - Scan( '<dimension>', cNM_Generic ) + 10 );
EndIF;

cTot_Generic    = CellGetS( cCubParam, 'Std Default Hierarchy', 'String' );
IF( Scan( '<dimension>', cNM_Generic ) = 0 );
  cTot_Source   = cTot_Generic;
  cTot_Target   = cTot_Generic;
ElseIF( Scan( '<dimension>', cTot_Generic ) = 1 );
  cTot_Source   = pSourceDim | SubSt( cTot_Generic, 12, Long( cTot_Generic ) - 11 );
  cTot_Target   = pTargetDim | SubSt( cTot_Generic, 12, Long( cTot_Generic ) - 11 );
Else;
  cTot_Source   = SubSt( cTot_Generic, 1, Scan( '<dimension>', cTot_Generic ) - 1 ) | pSourceDim | SubSt( cTot_Generic, Scan( '<dimension>', cTot_Generic ) + 11, Long( cTot_Generic ) - Scan( '<dimension>', cTot_Generic ) + 10 );
  cTot_Target   = SubSt( cTot_Generic, 1, Scan( '<dimension>', cTot_Generic ) - 1 ) | pTargetDim | SubSt( cTot_Generic, Scan( '<dimension>', cTot_Generic ) + 11, Long( cTot_Generic ) - Scan( '<dimension>', cTot_Generic ) + 10 );
EndIF;

cTop_Generic    = CellGetS( cCubParam, 'Std Top Node Name', 'String' );
IF( Scan( '<dimension>', cNM_Generic ) = 0 );
  cTop_Source   = cTop_Generic;
  cTop_Target   = cTop_Generic;
ElseIF( Scan( '<dimension>', cTop_Generic ) = 1 );
  cTop_Source   = pSourceDim | SubSt( cTop_Generic, 12, Long( cTop_Generic ) - 11 );
  cTop_Target   = pTargetDim | SubSt( cTop_Generic, 12, Long( cTop_Generic ) - 11 );
Else;
  cTop_Source   = SubSt( cTop_Generic, 1, Scan( '<dimension>', cTop_Generic ) - 1 ) | pSourceDim | SubSt( cTop_Generic, Scan( '<dimension>', cTop_Generic ) + 11, Long( cTop_Generic ) - Scan( '<dimension>', cTop_Generic ) + 10 );
  cTop_Target   = SubSt( cTop_Generic, 1, Scan( '<dimension>', cTop_Generic ) - 1 ) | pTargetDim | SubSt( cTop_Generic, Scan( '<dimension>', cTop_Generic ) + 11, Long( cTop_Generic ) - Scan( '<dimension>', cTop_Generic ) + 10 );
EndIF;

######################
### Test parameters

IF( DimensionExists( cDimTgt ) = 0 % DimensionExists( cDimSrc ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' Source or target dimension does not exist.'; 
EndIF;

IF( cHierSource @<> '' );
    IF( DimIx( cDimSrc, cHierSource ) = 0 );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' Hierarchy does not exist in source dimension.';
    EndIF;
EndIF;

IF( DimIx( cDimTgt, pTargetHier ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | ' Hierarchy does not exist in target dimension.';
EndIF;

IF( pSwapDimNm @<> '1' );
    pSwapDimNm = '0';
EndIf;

IF( pSourceDimAlias @<> '' );
    IF( DimensionExists( cCubSrc ) = 0 );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Matching alias %pSourceDimAlias% defined but source dimension %cDimSrc% has no attributes.' );
    ElseIF( DimIx( cCubSrc, pSourceDimAlias ) = 0 );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Matching alias %pSourceDimAlias% does not exist.' );
    ElseIF( DType( cCubSrc, pSourceDimAlias ) @<> 'AA' );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Matching alias %pSourceDimAlias% exists but attribute is not alias type.' );
    EndIF;
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Check if the hierarchy exist and clear Target Hierarchy

IF( pUnwind @= '1' );
   IF( ElcompN( cDimTgt, pTargetHier ) >= 1 );
     sProc = '}bedrock.hier.unwind';
     ExecuteProcess( sProc,
       'pDim', cDimTgt,
       'pConsol', cHier,
       'pRecursive', nRecursive,
       'pLogOutput', 0
     );
   Else;
      # nothing, target has no childeren therefore no need to unwind
   EndIF;
EndIF;

######################
### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

#  Can be done either with CubeSetLogChanges or writing NO with CellPutS to }CubeProperties
IF( pAttr @= '1' );
  CubeSetLogChanges( cCubTgt, 0 );
EndIF;

######################
### Assign data source

DataSourceType          = 'SUBSET';
DatasourceNameForServer = cDimSrc;
DatasourceDimensionSubset = 'ALL';

######################
### END Prolog
573,235
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

### Check source hierarchy & exclusion area

IF( pSourceHier @<> '' );
    IF( ElIsAnc( cDimSrc, pSourceHier, vEle ) <> 1 );
        ItemSkip;
    EndIF;
EndIF;

IF( pSourceHierExcl @<> '' );
    IF( ElIsAnc( cDimSrc, pSourceHierExcl, vEle ) = 1 % vEle @= pSourceHierExcl );
        ItemSkip;
    EndIF;
EndIF;

### Check if insertion of N members is allowed if not already existing

IF( pAllowInsertN @<> '1' & DType( cDimSrc, vEle ) @= 'N' );
    IF( DimIx( cDimTgt, vEle ) = 0 );
        ItemSkip;
    EndIF;
EndIF;

### Build hierarchy

sEle = vEle;

IF( pSourceHier @= '' );

    iPar = 1;
    sParentID = ElPar( cDimSrc, vEle, iPar );
    While( sParentID @<> '' );
        sDTyp = DType( cDimSrc, DimensionElementPrincipalName( cDimSrc, vEle ) );
        IF( pOverrideHierWht @<> '1' );
            nElWht = ElWeight( cDimSrc, sParentID, vEle );
        ELSE;
            nElWht = Numbr( pOverrideHierWht );
        EndIF;
        IF( pSwapDimNm @= '1' & vEle @= cNA_Source ); 
            sEle = cNA_Target;
        ElseIF( pSwapDimNm @= '1' & vEle @= cNM_Source ); 
            sEle = cNM_Target;
        ElseIF( pSwapDimNm @= '1' & vEle @= cTot_Source ); 
            sEle = cTot_Target;
        ElseIF( pSwapDimNm @= '1' & vEle @= cTop_Source ); 
            sEle = cTop_Target;
        ElseIF( pSwapDimNm @= '1' & Scan( Lower( cDimSrc ), Lower( vEle ) ) > 0 );
            IF( Scan( Lower( cDimSrc ), Lower( vEle ) ) = 1 );
                sEle = pTargetDim | SubSt( vEle, Long( cDimSrc ) + 1, Long( vEle ) - Long( cDimSrc ) );
            Else;
                sEle = SubSt( vEle, 1, Scan( Lower( cDimSrc ), Lower( vEle ) ) - 1 ) | pTargetDim | SubSt( vEle, Scan( Lower( cDimSrc ), Lower( vEle ) ) + Long( cDimSrc ), Long( vEle ) - Scan( Lower( cDimSrc ), Lower( vEle ) ) + ( Long( cDimSrc ) - 1 ) );
            EndIF;
        ElseIF( DimIx( '}ElementAttributes_' | cDimSrc, pSourceDimAlias ) >= 1 );
            sEle = AttrS( cDimSrc, vEle, pSourceDimAlias );
            IF( sEle @= '' );
                sEle = vEle;
            EndIF;
            sParAlias = AttrS( cDimSrc, sParentID, pSourceDimAlias );
            IF( sParAlias @<> '' );
                sParentID = sParAlias;
            EndIF;
        EndIF;
        IF( DimIx( cDimTgt, sParentID) > 0 & DType( cDimTgt, DimensionElementPrincipalName(cDimTgt, sParentID) ) @= 'N');
            ItemSkip;
        EndIF;
        IF ( sParentID @<> pTargetHier );
            sParentID = pPrefix | sParentID | pSuffix;
        EndIF;
        sEle = pPrefix | sEle | pSuffix;
        DimensionElementInsert( cDimTgt, '', sParentID, 'C' );
        IF( DType( cDimSrc, vEle) @= 'N' & DimIx( cDimTgt, sEle) = 0 & pAllowInsertN @<> '1' );
            # no action
            If( pDebug @>= '1' );
                sMsg = Expand('Insert of %sEle% into rollup prohibited as creation of new leaf elements is disabled by pAllowInsertN=0.');
                AsciiOutput( sDebugFile, sMsg );
            EndIf;
        Else;
            DimensionElementInsert( cDimTgt, '', sEle, sDTyp );
            DimensionElementComponentAdd( cDimTgt, sParentID, sEle, nElWht );
        EndIF;
        # Remove from n/a consolidation
        IF( Dimix( cDimTgt, cNM_Target ) > 0 & ElIsComp( cDimTgt, sEle, cNM_Target ) > 0 & sParentID @<> cNM_Source );
            DimensionElementComponentDelete( cDimTgt, cNM_Target, sEle );
        ENDIF; 
        iPar = iPar + 1;
        sParentID = ElPar( cDimSrc, vEle, iPar );
    End;

Else;

    nPars = ElParN( cDimSrc, vEle );
    iPar = 1;
    bAdd = 0;
    sParentID = '';
    While( iPar <= nPars );
    
        sParentID = ElPar( cDimSrc, vEle, iPar );
        IF( sParentID @= pSourceHier % ElIsAnc( cDimSrc, pSourceHier, sParentID ) = 1 );
            bAdd = 1;
            IF( pSourceDimAlias @<> '' );
                sEle = AttrS( cDimSrc, vEle, pSourceDimAlias );
                IF( sEle @= '' );
                    sEle = vEle;
                EndIF;
                sParAlias = AttrS( cDimSrc, sParentID, pSourceDimAlias );
                IF( sParAlias @<> '' );
                    sParentID = sParAlias;
                EndIF;
            EndIF;
        Else;
            bAdd = 0;
            sParentID = '';
        EndIF;
        
        IF( sParentID @= '' );
            sParentID = cHier;
        EndIF;
        IF( sParentID @= pSourceHier );
            sParentID = cHier;
        EndIF;
        
        IF( pOverrideHierWht @='1' );
            nElWht = NUMBR(pOverrideHierWht);
        ELSE;
            IF( sParentID @= cHier );
                nElWht = ElWeight( cDimSrc, pSourceHier, vEle );
            Else;
                nElWht = ElWeight( cDimSrc, sParentID, vEle );
            EndIF;
        EndIF;
        
        IF( DimIx( cDimTgt, vEle ) > 0 );
            sDTyp = DType( cDimTgt, vEle );
        Else;
            sDTyp = DType( cDimSrc, DimensionElementPrincipalName( cDimSrc, vEle ) );
        EndIF;
        IF( sDTyp @= '' );
            sDTyp = 'N';
        EndIF;
        
        IF( pSwapDimNm @= '1' & vEle @= cNA_Source ); 
            sEle = cNA_Target;
        ElseIF( pSwapDimNm @= '1' & vEle @= cNM_Source ); 
            sEle = cNM_Target;
        ElseIF( pSwapDimNm @= '1' & vEle @= cTot_Source ); 
            sEle = cTot_Target;
        ElseIF( pSwapDimNm @= '1' & vEle @= cTop_Source ); 
            sEle = cTop_Target;
        ElseIF( pSwapDimNm @= '1' & Scan( Lower( cDimSrc ), Lower( vEle ) ) > 0 );
            IF( Scan( Lower( cDimSrc ), Lower( vEle ) ) = 1 );
                sEle = pTargetDim | SubSt( vEle, Long( cDimSrc ) + 1, Long( vEle ) - Long( cDimSrc ) );
            Else;
                sEle = SubSt( vEle, 1, Scan( Lower( cDimSrc ), Lower( vEle ) ) - 1 ) | pTargetDim | SubSt( vEle, Scan( Lower( cDimSrc ), Lower( vEle ) ) + Long( cDimSrc ), Long( vEle ) - Scan( Lower( cDimSrc ), Lower( vEle ) ) + ( Long( cDimSrc ) - 1 ) );
            EndIF;
        ElseIF( DimIx( '}ElementAttributes_' | cDimSrc, pSourceDimAlias ) >= 1 );
            sEle = AttrS( cDimSrc, vEle, pSourceDimAlias );
            IF( sEle @= '' );
                sEle = vEle;
            EndIF;
            sParAlias = AttrS( cDimSrc, sParentID, pSourceDimAlias );
            IF( sParAlias @<> '' );
                sParentID = sParAlias;
            EndIF;
        EndIF;
        
        IF( bAdd = 1 );
            IF ( sParentID @<> pTargetHier ); 
                sParentID = pPrefix | sParentID | pSuffix;
            EndIF;
            IF (sDTyp @<> 'N');
                sEle = pPrefix | vEle | pSuffix;
            EndIF;
            IF( DimIx( cDimTgt, sParentID ) > 0 & DType( cDimTgt, DimensionElementPrincipalName( cDimTgt, sParentID ) ) @= 'N' );
                # Element type conversion detected from N to C
                sMsg = Expand('Insert of %sEle% into element %sParentID% prohibited due to N->C type conversion.');
                If( pDebug @>= '1' );
                    AsciiOutput( sDebugFile, sMsg );
                EndIf;
                LogOutput( 'WARN', sThisProcName |': '| sMsg );
                ItemSkip;
            EndIF;
            
            DimensionElementInsert( cDimTgt, '', sParentID, 'C' );
            IF( DimIx( cDimTgt, sEle ) > 0 );
                sEle = DimensionElementPrincipalName( cDimTgt, sEle );
            EndIF;
            IF( DType( cDimSrc, vEle) @= 'N' & DimIx( cDimTgt, sEle) = 0 & pAllowInsertN @<> '1' ); 
                # no action
                If( pDebug @>= '1' );
                    sMsg = Expand('Insert of %sEle% into rollup prohibited as creation of new leaf elements is disabled by pAllowInsertN=0.');
                    AsciiOutput( sDebugFile, sMsg );
                EndIf;
            Else;
                DimensionElementInsert( cDimTgt, '', sEle, sDTyp );
                DimensionElementComponentAdd( cDimTgt, sParentID, sEle, nElWht );
            EndIF;
        
            # Remove existing element from N/a consolidation
            IF( Dimix( cDimTgt, cNM_Target ) > 0 & Eliscomp( cDimTgt, sEle, cNM_Target ) > 0 );
                DimensionElementComponentDelete( cDimTgt, cNM_Target, sEle );
            ENDIF;  
        
        EndIF;
        
        iPar = iPar + 1;
    End;

EndIF;


######################
### END Metadata
574,91
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

IF( pAttr @<> '1' % DimensionExists( cCubSrc ) = 0 % DimensionExists( cCubTgt ) = 0 );
    ItemSkip;
EndIF;

IF( pDoProcessLogging @= '1' );
    nDataRecordCount = nDataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

# determine id dimension name within element name needs to be substituted
IF( pSwapDimNm @= '1' & vEle @= cNA_Source ); 
    sEle = cNA_Target;
ElseIF( pSwapDimNm @= '1' & vEle @= cNM_Source ); 
    sEle = cNM_Target;
ElseIF( pSwapDimNm @= '1' & vEle @= cTot_Source ); 
    sEle = cTot_Target;
ElseIF( pSwapDimNm @= '1' & vEle @= cTop_Source ); 
    sEle = cTop_Target;
ElseIF( pSwapDimNm @= '1' & Scan( Lower( cDimSrc ), Lower( vEle ) ) > 0 );
    IF( Scan( Lower( cDimSrc ), Lower( vEle ) ) = 1 );
        sEle = pTargetDim | SubSt( vEle, Long( cDimSrc ) + 1, Long( vEle ) - Long( cDimSrc ) );
    Else;
        sEle = SubSt( vEle, 1, Scan( Lower( cDimSrc ), Lower( vEle ) ) - 1 ) | pTargetDim | SubSt( vEle, Scan( Lower( cDimSrc ), Lower( vEle ) ) + Long( cDimSrc ), Long( vEle ) - Scan( Lower( cDimSrc ), Lower( vEle ) ) + ( Long( cDimSrc ) - 1 ) );
    EndIF;
ElseIF( DimIx( '}ElementAttributes_' | cDimSrc, pSourceDimAlias ) >= 1 );
    sEle = AttrS( cDimSrc, vEle, pSourceDimAlias );
    IF( sEle @= '' );
        sEle = vEle;
    EndIF;
    sParAlias = AttrS( cDimSrc, sParentID, pSourceDimAlias );
    IF( sParAlias @<> '' );
        sParentID = sParAlias;
    EndIF;
Else;
    sEle = vEle;
EndIF;


### Check source hierarchy & exclusion area

IF( pSourceHier @<> '' );
    IF( ElIsAnc( cDimSrc, pSourceHier, vEle ) <> 1 & vEle @<> pSourceHier );
        ItemSkip;
    EndIF;
EndIF;

IF( pSourceHierExcl @<> '' );
    IF( ElIsAnc( cDimSrc, pSourceHierExcl, vEle ) = 1 % vEle @= pSourceHierExcl );
        ItemSkip;
    EndIF;
EndIF;

### add aliases

sDim = cCubSrc;
sDimTgt = cCubTgt;
IF( DimensionExists( sDimTgt ) = 1 );
    nMax = DIMSIZ( sDim );
    nCtr = 1;
    WHILE( nCtr <= nMax );
        sAttr = DIMNM( sDim, nCtr );
        IF( DType( sDim, sAttr ) @= 'AA' );
            IF( DimIx( sDimTgt, sAttr ) > 0 );
                AttrPutS( AttrS( cDimSrc, vEle, sAttr ), cDimTgt, sEle, sAttr, 1 );
            EndIF;
        EndIF;
        nCtr = nCtr + 1;
    END;
EndIF;

######################
### END Data
575,39
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
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

######################
### Reenable data transaction logging to the target cube
IF( pAttr @= '1' );
  CubeSetLogChanges( cCubTgt, 1 );
EndIF;

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
