601,100
602,"}APQ.Cub.DimensionDefaults.Update"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"r@CyE=n>1kw`@pS\q1zrHIgUJgRJ=B8Ndk=GL]G:sW>82Tqp>cVgS?th5RRdfYboRyjrJaGzuuhWH~D[Eo2Q?U==4DwJQj^XxFETvrj\Nvlov[nyU9\Bk[aokfH@FGc4Hs6Z2Qtxul8cTxNnsZ:9BmX^y1tg2FHW23Aeby1qOH^ShoZjfO0kr=fAMt^mjGjB8HImkyFNr@CyE=n>1kw`@pS\q1trHIgUJgRJ=B8Nck=GL]G:sW>82Dvp>cVgS?th52adfY2dRyjbAaGzuuHZH~C[Eo2Q?U==4DGLQj^XxFE4urj\Nvlov[NCY9\Bk[aokfH@6<c4HS:z5Qtxul8cZxNNtZ:iLmX^y1tg2FHW23adby1}OH^S(kZjfO0kr=`AMt^mj'or:HImkyFN"
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
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,1
pSkipControlObj
561,1
2
590,1
pSkipControlObj,"1"
637,1
pSkipControlObj,"Skip control objects?"
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
572,76
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
### Update default_member elements per dimension in }APQ Dimension Defaults cube
### Update na_member elements per dimension in }APQ Dimension Defaults cube
### 
########################################################################################

######################
### Logging - common script
sThisProcName = GetProcessName();
### Params
pDoProcessLogging = '1';
sProcLogParams = 'pSkipControlObj:' | pSkipControlObj;
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
### Prolog script commences

######################
### Inits - declare constants

cDimSrc         = '}Dimensions';
cDimTgt         = '}APQ Dimension Hierarchies';
cCubTgt         = '}APQ Dimension Defaults';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cStdTopNode     = CellGetS( cCubParam, 'Std Top Node Name', 'String' );
cStdTotal       = CellGetS( cCubParam, 'Std Default Hierarchy', 'String' );
cStdNAEle       = CellGetS( cCubParam, 'Std NA Element', 'String' );
cStdAlias1      = CellGetS( cCubParam, 'Std Alias 1', 'String' );
cStdAlias2      = CellGetS( cCubParam, 'Std Alias 2', 'String' );

nErr            = 0;
sErr            = '';

######################
### Assign data source

DataSourceType              = 'SUBSET';
DataSourceNameForServer     = cDimSrc;
DatasourceDimensionSubset   = 'ALL';

######################
### END Prolog

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,191
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

IF( pSkipControlObj @= '1' & SubSt( vDim, 1, 1 ) @= '}' );
   ItemSkip;
EndIF;

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

# Skip if dimension not in }APQ Dimension Hierarchies
IF( DimIx( cDimTgt, vDim ) = 0 );
  ItemSkip;
EndIF;

# Skip alternate hierarchies (these are handled separately)
IF( Scan( ':', vDim ) > 0 );
  ItemSkip;
EndIF;

# Determine the default alias. Alias written only on main dimension and inherited to alternate hierarchies via rule
vAlias = '';
If( DimensionExists( '}ElementAttributes_' | vDim ) = 1 );
    If( DimIx( '}ElementAttributes_' | vDim, cStdAlias1 ) > 0 );
        vAlias = cStdAlias1;
    ElseIf( DimIx( '}ElementAttributes_' | vDim, cStdAlias2 ) > 0 );
        vAlias = cStdAlias2;
    EndIf;
EndIf;
# Default might be "Caption" or "Description" which might not always be of type alias
If( DimIx( '}ElementAttributes_' | vDim, vAlias ) > 0 );
    If( DType( '}ElementAttributes_' | vDim, vAlias ) @<> 'AA' );
        vAlias = '';
    EndIf;
EndIf;
CellPutS( vAlias, cCubTgt, vDim, 'Automatic Alias', 'String' );

# Substitute constants for variables

# Determine the default total sum rollup
IF( Scan( '<dimension>', cStdTotal ) = 0 );
  vStdTotal = cStdTotal;
ElseIF( Scan( '<dimension>', cStdTotal ) = 1 );
  vStdTotal = vDim | SubSt( cStdTotal, 12, Long( cStdTotal ) - 11 );
Else;
  vStdTotal = SubSt( cStdTotal, 1, Scan( '<dimension>', cStdTotal ) - 1 ) | vDim | SubSt( cStdTotal, Scan( '<dimension>', cStdTotal ) + 11, Long( cStdTotal ) - Scan( '<dimension>', cStdTotal ) + 10 );
EndIF;

# Determine the default NA element. 
IF( Scan( '<dimension>', cStdNAEle ) = 0 );
  vStdNAEle = cStdNAEle;
ElseIF( Scan( '<dimension>', cStdNAEle ) = 1 );
  vStdNAEle = vDim | SubSt( cStdNAEle, 12, Long( cStdNAEle ) - 11 );
Else;
  vStdNAEle = SubSt( cStdNAEle, 1, Scan( '<dimension>', cStdNAEle ) - 1 ) | vDim | SubSt( cStdNAEle, Scan( '<dimension>', cStdNAEle ) + 11, Long( cStdNAEle ) - Scan( '<dimension>', cStdNAEle ) + 10 );
EndIF;

# Determine the default organizational top node
IF( Scan( '<dimension>', cStdTopNode ) = 0 );
  vStdTopNode = cStdTopNode;
ElseIF( Scan( '<dimension>', cStdTopNode ) = 1 );
  vStdTopNode = vDim | SubSt( cStdTopNode, 12, Long( cStdTopNode ) - 11 );
Else;
  vStdTopNode = SubSt( cStdTopNode, 1, Scan( '<dimension>', cStdTopNode ) - 1 ) | vDim | SubSt( cStdTopNode, Scan( '<dimension>', cStdTopNode ) + 11, Long( cStdTopNode ) - Scan( '<dimension>', cStdTopNode ) + 10 );
EndIF;

vTryTotal = 'Total ' | vDim;
vTryAll = 'All ' | vDim;

## Insert element names into target cube

## NA element : Write the std. NA element name as per the conventions in }APQ settings cube. NA element written only on main dimension and inherited to alternate hierarchies via rule

IF( DIMIX( vDim|':'|vDim, vStdNAEle ) > 0 );
   CellPutS( vStdNAEle, cCubTgt, vDim, 'Automatic NA', 'String' );
EndIF;

## Default element : find as the first "top node". If the dimension has a "Rollups" organizational top node then find the first child

IF( DIMIX( vDim|':'|vDim, vStdTotal ) > 0 );
   CellPutS( vStdTotal, cCubTgt, vDim, 'Automatic Default', 'String' );
   CellPutS( vStdTotal, cCubTgt, vDim, 'Automatic Total', 'String' );
ElseIF( DIMIX( vDim|':'|vDim, vTryTotal ) > 0 );   
   CellPutS( vTryTotal, cCubTgt, vDim, 'Automatic Default', 'String' );
ElseIF( DIMIX( vDim|':'|vDim, vTryAll ) > 0 );
   CellPutS( vTryAll, cCubTgt, vDim, 'Automatic Default', 'String' );
Else;
   # use subset generated element
   IF( DimSiz( vDim ) > 0 );
     vLev = NumberToString( DnLev( vDim ) -1 );
     ## Create temporary subset
     vMDX = '{HEAD({TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | vDim | '] )}, ' | vLev | ')},1)}';
      sProc = '}bedrock.hier.sub.create.bymdx';
      ExecuteProcess( sProc, 'pLogOutput', 0, 
         'pDim', vDim, 'pSub', cSubSrc, 'pMDXExpr',vMDX,
         'pConvertToStatic', 1, 'pTemp', 1
      );

      vEle = SubsetGetElementName( vDim, cSubSrc,1 );
      # If the returned element is the top node organizational element then try the first child instead
      IF( vEle @= vStdTopNode );
         vEle = ElComp( vDim, vEle, 1 );
      EndIF;
      CellPutS( vEle, cCubTgt, vDim, 'Automatic Default', 'String' );
      IF( DnLev( vDim ) >= 2 );
        CellPutS( vEle, cCubTgt, vDim, 'Automatic Total', 'String' );
      Else;
        vEle = '(flat dimension)';
        CellPutS( vEle, cCubTgt, vDim, 'Automatic Total', 'String' );
      EndIF;
   Else;
      vEle = '(empty dimension)';
      CellPutS( vEle, cCubTgt, vDim, 'Automatic Default', 'String' );
      CellPutS( vEle, cCubTgt, vDim, 'Automatic Total', 'String' );
   EndIF;
   
EndIF;

## Default element & Total element : repeat for alternate hierarchies should the dimension have any

sHierDim = '}Hierarchies_' | vDim;
IF( DimensionExists( sHierDim ) = 1 );
    nHiers = DimSiz( sHierDim );
    IF( nHiers >= 2 );
        iHier = 1;
        While( iHier <= nHiers );
            sHier = DimNm( sHierDim, iHier );
            IF( Scan( ':', sHier ) > 0 );
                # For Leaves hierarchy Total is not relevant and make automatic default the 1st element
                IF( sHier @= vDim | ':Leaves' );
                    CellPutS( DimNm( sHier, 1 ), cCubTgt, sHier, 'Automatic Default', 'String' );
                Else;
                    IF( DIMIX( sHier, vStdTotal ) > 0 );
                       CellPutS( vStdTotal, cCubTgt, sHier, 'Automatic Default', 'String' );
                       CellPutS( vStdTotal, cCubTgt, sHier, 'Automatic Total', 'String' );
                    ElseIF( DIMIX( sHier, vTryTotal ) > 0 );   
                       CellPutS( vTryTotal, cCubTgt, sHier, 'Automatic Default', 'String' );
                    ElseIF( DIMIX( sHier, vTryAll ) > 0 );
                       CellPutS( vTryAll, cCubTgt, sHier, 'Automatic Default', 'String' );
                    Else;
                       # use subset generated element
                       vLev = NumberToString( DnLev( sHier ) -1 );
                       sHierNm = Trim( SubSt( sHier, Scan(':', sHier) + 1, Long(sHier) ) );
                       vMDX = Expand( '{HEAD({TM1FILTERBYLEVEL( {TM1SUBSETALL( [%vDim%].[%sHierNm%] )}, %vLev% )}, 1)}' );
                       
                       ## Create temporary subset
                       IF( DimSiz( sHier ) > 0 );
                          sProc = '}bedrock.hier.sub.create.bymdx';
                          ExecuteProcess( sProc,
                            'pDim', vDim,
                        	'pHier', sHierNm,
                        	'pSub', cSubSrc,
                        	'pMDXExpr', vMDX,
                        	'pConvertToStatic', 1
                          );
                          vEle = SubsetGetElementName( sHier, cSubSrc, 1 );
                          HierarchySubsetDestroy( vDim, sHierNm, cSubSrc );
                          IF( vEle @= vStdTopNode );
                             vEle = ElComp( sHier, vEle, 1 );
                          EndIF;
                          CellPutS( vEle, cCubTgt, sHier, 'Automatic Default', 'String' );
                          CellPutS( vEle, cCubTgt, sHier, 'Automatic Total', 'String' );
                       Else;
                          vEle = '(empty hierarchy)';
                          CellPutS( vEle, cCubTgt, sHier, 'Automatic Default', 'String' );
                          CellPutS( vEle, cCubTgt, sHier, 'Automatic Total', 'String' );
                       EndIF;
                       
                    EndIF;
                EndIF;
            EndIF;
            iHier = iHier + 1;
        End;
    EndIF;
EndIF;

######################
### END Data
575,30
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
