601,100
602,"}APQ.Dim.Attr.Definition.Update"
562,"VIEW"
586,"}APQ Dimension Attribute Definition"
585,"}APQ Dimension Attribute Definition"
564,
565,"u5Rj\]sJ8?HHnB[ZdLieyaLukS:[V[XGUZ7EzGGvhtbZkQK2G08mt0_RWkSto?ge<tV^9:mi8;YpgyzCo>_@`v_s7ztuT9u5t4u6Lh<X\5Bq\U7@TWL;R<DdJabG5U13[JG?E=xSneF=ncf7QctGeWO948rcZT`<?<S=eGnS=>z_[u8<vAvRFwlCiyZlau5CxD<8_Dm5"
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
570,}TI_Dummy_View
571,
569,0
592,0
599,1000
560,2
pDimension
pMetadata
561,2
2
2
590,2
pDimension,""
pMetadata,"0"
637,2
pDimension,"Required: The dimension to setup or update (also supports dim:hier)"
pMetadata,"Optional: Update alternate hierarchies using ""Parent"" parent attributes. Default = false (0) update attributes only. 1=Update alternate hierarchies via parent attributes. 2=Allow conversion of N element to C if mapped as parent."
577,5
vDim
vEle
vAttr
vMeas
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
572,171
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

########################################################################################
### PURPOSE:
### 	This process updates dimension attributes from the database cube }APQ Dimension Attribute Definition.
### 	This allows for manual but controlled maintenance of attribute values be non-admin but authorized users in a controlled framework.
###	    For dimensions with attributes maintained elsewhere this framework also allows for "master data corrections" by overiding the source system loaded value.
### DATA SOURCE:
### 	View from }APQ Dimension Attribute Definition
### INTENDED USAGE:
### 	Update attributes by authorized users. Create rollups from any attributes ending in "parent"
########################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2016-08-28 		SW	 	Creation of Process
### 2017-05-10		SW		adjust pMetadata param to allow N to C conversion if explicitly allowed. 0=false, update attributes only | 1=true update mapped parent rollupss (but don't allow N to C conversion) | 2=true update parent rollups & allow N to C conversion if mapped as parent.
########################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
pDoProcessLogging = '1';
### Params
sProcLogParams = 'pDimension:' | pDimension |' & '| 'pMetadata:' | pMetadata;
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

cCubSrc         = '}APQ Dimension Attribute Definition';
cCubTgt         = '}ElementAttributes_' | pDimension;
cCubTgt2        = '}LocalizedElementAttributes_' | pDimension;
cDimTgt         = cCubTgt;
cDimDims        = '}Dimensions';
cDimSrc         = '}APQ Dimension Hierarchies';
cDimEle         = '}APQ Dimension Elements';
cDimAttr        = '}APQ Dimension Attributes';
cDimM           = cCubSrc | ' Measure';
cDimLang        = '}Cultures';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cSwapBlank      = CellGetS( cCubParam, 'Replace with blank value', 'String' );
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( '}APQ Escape Characters', 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
nNewEles        = 0;
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
# can't use the standard ":" as sDelimEleStart as this is the dim:hier separator
sDelimEleStart  = '\';
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

######################
### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( DimensionExists( pDimension ) = 0 );
  nErr          = nErr + 1;
  sErr          = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDimension; 
EndIF;

IF( Scan( ':', pDimension ) = 0 );
  cTgtDim       = pDimension;
  cTgtHier      = pDimension;
Else;
  cTgtDim       = SubSt( pDimension, 1, Scan( ':', pDimension ) - 1 );
  cTgtHier      = Trim( SubSt( pDimension, Scan( ':', pDimension ) + 1, 100 ) );
  cCubTgt       = '}ElementAttributes_' | cTgtDim;
  cDimTgt       = cCubTgt;
EndIF;

IF( DimIx( cDimSrc, pDimension ) = 0 );
  nErr          = nErr + 1;
  sErr          = sErr | IF( sErr @<> '', ' & ', '' ) | 'Dimension not added to framework:' | pDimension; 
EndIF;

IF( CubeExists( cCubTgt ) = 0 );
  nErr          = nErr + 1;
  sErr          = sErr | IF( sErr @<> '', ' & ', '' ) | 'No attributes found for dimension:' | pDimension; 
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Disable Logging

CubeSetLogChanges( cCubTgt, 0 );

######################
### ZeroOut Target

# NA for this process. Updating / overwriting attributes only. The set of attributes maintained here could be different from ones maintained elsewhere.

######################
### Create the view to assign as data source for the process

# if pDimension is a dimension with hierarchies (not a leaf alternate hierarchy) then view will contain the leaf hierarchies
sProc           = '}bedrock.cube.view.create';
sFilter         = cDimSrc | sDelimEleStart | pDimension | sDelimDim | cDimM | sDelimEleStart | 'Final Value';
bSuppressNull   = 1;
bSuppressC      = 0;
bSuppressRule   = 0;
ExecuteProcess( sProc, 'pLogOutput', nDebug, 
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1 
);

IF( SubsetExists( cDimEle, cTgtDim |' - '| cTgtHier ) = 1 );
  ViewSubsetAssign( cCubSrc, cViewSrc, cDimEle, cTgtDim |' - '| cTgtHier );
EndIF;
IF( SubsetExists( cDimAttr, cTgtDim ) = 1 );
  ViewSubsetAssign( cCubSrc, cViewSrc, cDimAttr, cTgtDim );
EndIF;

######################
### Assign data source

DataSourceType          = 'VIEW';
DataSourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;

######################
### END Prolog
573,87
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
### Metadata check

IF( pMetadata @<= '0' );
  ItemSkip;
EndIF;

IF( pMetadata @> '2' );
  ItemSkip;
EndIF;

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Data.log';

######################
### Metadata script

### Alternate hierarchy support
IF( Scan( ':', vDim ) = 0 );
  sTgtDim = vDim;
  sTgtHier = vDim;
Else;
  sTgtDim = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
  sTgtHier = Trim( SubSt( vDim, Scan( ':', vDim ) + 1, 100 ) );
EndIF;

### Check validity of element (could have been deleteions and element is still in subset & dimension elements dimension but no longer in the actual hierarchy)
IF( DimIx( vDim, vEle ) = 0 );
  ItemSkip;
EndIF;

### Check validity of attribute (could have been deletions)
IF( DimIx( cDimAttr, vAttr ) = 0 );
  ItemSkip;
EndIF;

### Skip unless it is a parent attribute (attribute name must end with "Parent"
IF( SubSt( Upper( vAttr ), Long( vAttr ) - 5, 6 ) @<> 'PARENT' );
  ItemSkip;
EndIF;

### Test if the parent is new
IF( DimIx( vDim, sValue ) = 0 );
  nNewEles = nNewEles + 1;
EndIF;

### Do the alternate hirearchy
IF( DimIx( vDim, sValue ) = 0 );
  DimensionElementInsert( vDim, '', sValue, 'C' );
EndIF;

###  avoid circular reference
IF( sValue @= vEle );
  ItemReject( 'Circular reference detected. Element cannot be mapped as own parent.' );
EndIF;

###  avoid conversion of N to C 
IF( pMetadata @< '2' );
  IF( DType( vDim, sValue ) @= 'N' );
    ItemReject( 'Element already exists in dimension as N element. Cannot convert to C element.' );
  EndIF;
EndIF;

### Do the alternate hirearchy
DimensionElementComponentAdd( vDim, sValue, vEle, 1 );


######################
### END Metadata
574,117
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

### Alternate hierarchy support
IF( Scan( ':', vDim ) = 0 );
  sTgtDim = vDim;
  sTgtHier = vDim;
Else;
  sTgtDim = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
  sTgtHier = Trim( SubSt( vDim, Scan( ':', vDim ) + 1, 100 ) );
EndIF;

### Check validity of element (could have been deleteions)
IF( DimIx( vDim, vEle ) = 0 );
  ItemSkip;
EndIF;

### Determine if attribute is localized
sLang = '';
If( Scan( '[', vAttr ) > 1 );
    sLang = SubSt( vAttr, Scan( '[', vAttr ) + 1, 6 );
    sLang = SubSt( sLang, 1, Scan( ']', sLang ) - 1 );
    vAttr = SubSt( vAttr, 1, Scan( '[', vAttr ) - 1 );
    If( DimIx( cDimLang, sLang ) = 0 );
        ItemSkip;
    EndIf;
EndIf;

### Check validity of attribute (could have been deleteions)
IF( DimIx( cDimAttr, vAttr ) = 0 );
  ItemSkip;
EndIF;

### Check Updatable status (attribute could be rule calculated)
IF( Scan( ':', vDim ) = 0 );
  IF( CellIsUpdateable( cCubTgt, vEle, vAttr ) = 0 );
    ItemSkip;
  EndIF;
Else;
  IF( CellIsUpdateable( cCubTgt, sTgtHier:vEle, vAttr ) = 0 );
    ItemSkip;
  EndIF;
EndIF;
IF( CubeExists( cCubTgt2 ) = 1 & sLang @<> '' );
    IF( Scan( ':', vDim ) = 0 );
        IF( CellIsUpdateable( cCubTgt2, vEle, sLang, vAttr ) = 0 );
            ItemSkip;
        EndIF;
    Else;
        IF( CellIsUpdateable( cCubTgt2, sTgtHier:vEle, sLang, vAttr ) = 0 );
            ItemSkip;
        EndIF;
    EndIF;
EndIF;

### Determine attribute type
sAttrTyp = DType( cDimTgt, vAttr );

### Determine blank replacement
IF( sValue @= cSwapBlank );
  sValue = '';
EndIF;

### Update attributes in target
IF( sLang @= '' );
    # no locale, standard attribute update
    IF( sAttrTyp @= 'AA' );
        IF( sValue @= '' );
            AttrPutS( vEle, vDim, vEle, vAttr );
        Else;
            AttrPutS( sValue, vDim, vEle, vAttr, 1 );
        EndIF;
    ElseIF( sAttrTyp @= 'AS' );
        AttrPutS( sValue, vDim, vEle, vAttr );
    ElseIF( sAttrTyp @= 'AN' );
        nValue = Numbr( sValue );
        AttrPutN( nValue, vDim, vEle, vAttr );
    EndIF;
Else;
    # locale present, include locale in AttrPut
    IF( sAttrTyp @= 'AA' );
        IF( sValue @= '' );
            AttrPutS( vEle, vDim, vEle, vAttr, sLang );
        Else;
            AttrPutS( sValue, vDim, vEle, vAttr, sLang, 1 );
        EndIF;
    ElseIF( sAttrTyp @= 'AS' );
        AttrPutS( sValue, vDim, vEle, vAttr, sLang );
    ElseIF( sAttrTyp @= 'AN' );
        nValue = Numbr( sValue );
        AttrPutN( nValue, vDim, vEle, vAttr, sLang );
    EndIF;
EndIF;
    
######################
### END Data
575,44
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
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

######################
### If new elements were created during the metadata then the framework for the dimension needs to be updated
IF( nNewEles > 0 );
  sProc = '}APQ.Dim.Attr.Definition.Setup';
  ExecuteProcess( 	sProc, 'pDimension', pDimension );
EndIF;

######################
### EnableLogging
CubeSetLogChanges( cCubTgt, 1 );

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
