601,100
602,"}APQ.Dim.DimensionElements.Update"
562,"NULL"
586,
585,
564,
565,"w7z_>bcsYjW6kvo^aQ\fh_Ja8^zu8u[xlsVXgT4iAKs>d70c;u=5W_8r=;XwQt\UW[?BL71q5DSVZOj4=Rjm<r7DEK76D\14pxkVp5h=XAWieqW2=;^F4HVHIG@_oWoU<F\9[IbB:WYREsE][_yQ28?Mt\F9\TO@sPBNHJf<WlueV?Jey:Pi]Zd6@UX3bE9LC9nL_2zg"
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
571,
569,0
592,0
599,1000
560,5
pDoProcessLogging
pSelectedDimsOnly
pCreateSubs
pDim
pClear
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pSelectedDimsOnly,"1"
pCreateSubs,"1"
pDim,""
pClear,"0"
637,5
pDoProcessLogging,"Log process"
pSelectedDimsOnly,"Only create for selected dimensions"
pCreateSubs,"Create subsets per dimension"
pDim,"Specific dimension (blank=ALL, also supports specific hierarchy with dim:hier)"
pClear,"Clear dimension"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,186
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
### Purpose:
### Creates flat dimension containing all elements from all dimensions, including aliases

######################
### Logging - common script

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pSelectedDimsOnly:' | pSelectedDimsOnly |' & '| 'pCreateSubs:' | pCreateSubs |' & '| 'pDim:' | pDim |' & '| 'pClear:' | pClear;
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

######################
### Inits - declare constants

cCubParam       = '}APQ Settings';
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| TimSt( Now(), '\Y\m\d\h\i\s' );
sDebugFile      = cDebugFile | '_Prolog.log';
sMaxEles        = CellGetS( cCubParam, 'Max dimension size for element copy', 'String' );
nMaxEles        = StringToNumber( sMaxEles );
nMaxEles        = IF( nMaxEles = 0, 1000000, nMaxEles );

nErr            = 0;
sErr            = '';

cBadFileNameChars = '^\/:*#"|<>' | Char(39);
cAltChar        = '@';

#------------------
# Loop through all Dimensions & export content
#------------------

sObjectDim      = '}Dimensions';
sAPQDim         = '}APQ Dimensions';
sDimTgt         = '}APQ Dimension Elements';
cDimSubs        = '}APQ Dimension Subsets';
cCubDef         = '}APQ Dimension Defaults';
cAPQSubSrc      = 'APQ Internal - DimensionElements';

# check license key. If empty then quit
IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
  ProcessQuit;
EndIF;

# if pDim param invalid then quit
IF( pDim @= '' );
  pDim = 'ALL'; 
EndIF;
IF( pDim @<> 'ALL' );
  IF( DimensionExists( pDim ) = 0 );
    ProcessQuit;
  EndIF;
EndIF;

# Clear existing dimension first
IF( DimensionExists( sDimTgt ) = 0 );
  DimensionCreate( sDimTgt );
EndIF;
IF( pClear @= '1' );
  DimensionDeleteAllElements( sDimTgt );
EndIF;

# Create Caption attribute so that attribute cube exists for Rest Queries
If( DimIx( '}ElementAttributes_' | sDimTgt, 'Caption' ) = 0 );
    AttrInsert( sDimTgt, '', 'Caption', 'S' );
EndIf;

# Insert dummy element to dimension (for purposes of recording mappings at dimension level not element level).
If( DimIx( sDimTgt, 'TOTAL DIMENSION ELEMENTS' ) = 0 );
    DimensionElementInsert( sDimTgt, '', 'TOTAL DIMENSION ELEMENTS', 'N' );
EndIf;

# Loop through all dimensions in model
nObjectCount = DimSiz( sObjectDim );
nObjectIndex = 1;

While( nObjectIndex <= nObjectCount );

  sObjectName = DimNm( sObjectDim, nObjectIndex );
  # Need to account for alternate hierarchies which are listed in }Dimensions as dim:hier
  If( Scan( ':', sObjectName ) = 0 );
    sElementDim = sObjectName;
    sHier = '';
  Else;
    sElementDim = SubSt( sObjectName, 1, Scan( ':', sObjectName ) - 1 );
    sHier = SubSt( sObjectName, Scan( ':', sObjectName ) + 1, Long( sObjectName ) - Scan( ':', sObjectName ) );
  EndIf;
  
  If( SubSt( sElementDim, 1, 1 ) @<> '}' % sObjectName @= pDim );
    If( pSelectedDimsOnly @= '1' & AttrS( sAPQDim, sElementDim, 'ELEMENT_FRAMEWORK' ) @<> 'TRUE' & sElementDim @<> pDim );
      # Do not export
    ElseIF( pDim @<> 'ALL' & sElementDim @<> pDim );
      # Do not export
    ElseIF( DimSiz( sObjectName ) > nMaxEles & sElementDim @<> pDim );
      # Do not export
    Else;
      # Cleared conditions to export elements

      #----------------
      # Export Elements
      #----------------
      LogOutput( 'INFO', Expand('Exporting dimension %sObjectName% to }APQ Dimension Elements.') );
    
      sAttributeDim = '}ElementAttributes_' | sElementDim;
    
      nElementCount = Min( DimSiz( sObjectName ), nMaxEles );
      nElementIndex = 1;
    
      sAliases = 'No';
      If( CubeExists( sAttributeDim ) = 1 );
        nAttributeCount = DimSiz( sAttributeDim );
        nAttributeIndex = 1;
        While( nAttributeIndex <= nAttributeCount );
          sAttributeName = DimNm( sAttributeDim, nAttributeIndex );
          sAttributeType = DType( sAttributeDim, sAttributeName );
          If( sAttributeType @= 'AA' );
            sAliases = 'Yes';
            nAttributeIndex = nAttributeCount;
          EndIf;
          nAttributeIndex = nAttributeIndex + 1;
        End;
      EndIf;
    
      While( nElementIndex <= nElementCount );
    
        sElementName = DimNm( sObjectName, nElementIndex );
        DimensionElementInsert( sDimTgt, '', sElementName, 'N' );
    
        # Export Alias Names
        If( sAliases @= 'Yes' );
          nAttributeIndex = 1;
          While( nAttributeIndex <= nAttributeCount );
            sAttributeName = DimNm( sAttributeDim, nAttributeIndex );
            sAttributeType = DType( sAttributeDim, sAttributeName );
            If( sAttributeType @= 'AA' );
              sAttributeValue = AttrS( sObjectName, sElementName, sAttributeName );
              If( sAttributeValue @<> '' );
                DimensionElementInsert( sDimTgt, '', sAttributeValue, 'N' );
              EndIf;
            EndIf;
            nAttributeIndex = nAttributeIndex + 1;
          End;
        EndIf;
    
        nElementIndex = nElementIndex + 1;
      End;

    EndIf;
  EndIf;
 
  nObjectIndex = nObjectIndex + 1;
End;

#################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,186
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

IF( pCreateSubs @= '1' );

#------------------
# Loop through all Dimensions & create subsets per dimension & alias combination
#------------------

nObjectCount = DimSiz( sObjectDim );
nObjectIndex = 1;

While( nObjectIndex <= nObjectCount );

  sObjectName = DimNm( sObjectDim, nObjectIndex );
  # Need to account for alternate hierarchies which are listed in }Dimensions as dim:hier
  If( Scan( ':', sObjectName ) = 0 );
    sElementDim = sObjectName;
    sHier = '';
  Else;
    sElementDim = SubSt( sObjectName, 1, Scan( ':', sObjectName ) - 1 );
    sHier = SubSt( sObjectName, Scan( ':', sObjectName ) + 1, Long( sObjectName ) - Scan( ':', sObjectName ) );
  EndIf;

  If( SubSt( sElementDim, 1, 1 ) @<> '}' % sElementDim @= pDim );
    If( pSelectedDimsOnly @= '1' & AttrS( sAPQDim, sElementDim, 'ELEMENT_FRAMEWORK' ) @<> 'TRUE' & sElementDim @<> pDim );
      # Do not export
    ElseIF( pDim @<> 'ALL' & sElementDim @<> pDim );
      # Do not export
    ElseIF( DimSiz( sObjectName ) > nMaxEles & sElementDim @<> pDim );
      # Do not export
    Else;
      # Cleared conditions to impport elements

  #----------------
  # Export Elements to Subset
  #----------------

  sAttributeDim = '}ElementAttributes_' | sElementDim;

  If( sHier @= '' );
    sSubName = sElementDim;
  Else;
    sSubName = sElementDim |' - '| sHier;
  EndIf;
  
  If( SubsetExists( sDimTgt, sSubName ) = 0 );
    SubsetCreate( sDimTgt, sSubName );
  Else;
    SubsetDeleteAllElements( sDimTgt, sSubName );
  EndIf;
  If( DimIx( cDimSubs, sDimTgt|':'|sDimTgt|':'|sSubName ) > 0 );
    AttrPutS( cAPQSubSrc, cDimSubs, sDimTgt|':'|sDimTgt|':'|sSubName, 'Source' );
    CellPutS( cAPQSubSrc, cDimSubs, sDimTgt|':'|sDimTgt|':'|sSubName, 'Source' );
  EndIf;

  sAliases = 'No';
  sCaption = '';
  If( CubeExists( sAttributeDim ) = 1 );
    # determine caption
    If( DimIx( sAttributeDim, 'Caption' ) > 0 );
      sCaption = 'Caption';
    ElseIf( DimIx( sAttributeDim, CellGetS( cCubDef, sObjectName, 'Default_Alias', 'String' ) ) > 0 );
      sCaption = CellGetS( cCubDef, sObjectName, 'Default_Alias', 'String' );
    EndIf;
    # loop attributes to determine how many aliases
    nAttributeCount = DimSiz( sAttributeDim );
    nAttributeIndex = 1;
    While( nAttributeIndex <= nAttributeCount );
      sAttributeName = DimNm( sAttributeDim, nAttributeIndex );
      sAttributeType = DType( sAttributeDim, sAttributeName );
      If( sAttributeType @= 'AA' );
        sAliases = 'Yes';
        nAliasLen = Long( sAttributeName );
        iChar = 1;
        sAliasSafeName = '';
        While( iChar <= nAliasLen );
          sChar = SubSt( sAttributeName, iChar, 1 );
          If( Scan( sChar, cBadFileNameChars ) = 0 );
            sAliasSafeName = sAliasSafeName | sChar;
          Else;
            sAliasSafeName = sAliasSafeName | cAltChar;
          EndIF;
          iChar = iChar + 1;
        End;
        If( SubsetExists( sDimTgt, sSubName |' - '| sAliasSafeName ) = 0 );
          SubsetCreate( sDimTgt, sSubName |' - '| sAliasSafeName );
        Else;
          SubsetDeleteAllElements( sDimTgt, sSubName |' - '| sAliasSafeName );
        EndIf;
        If( DimIx( cDimSubs, sDimTgt|':'|sDimTgt|':'|sSubName|' - '|sAliasSafeName ) > 0 );
          AttrPutS( cAPQSubSrc, cDimSubs, sDimTgt|':'|sDimTgt|':'|sSubName|' - '|sAliasSafeName, 'Source' );
          CellPutS( cAPQSubSrc, cDimSubs, sDimTgt|':'|sDimTgt|':'|sSubName|' - '|sAliasSafeName, 'Source' );
        EndIf;
      EndIf;
      nAttributeIndex = nAttributeIndex + 1;
    End;
  EndIf;

  nElementCount = Min( DimSiz( sObjectName ), nMaxEles );
  nElementIndex = 1;
  While( nElementIndex <= nElementCount );

    sElementName = DimNm( sObjectName, nElementIndex );
    SubsetElementInsert( sDimTgt, sSubName, sElementName, nElementIndex );

    # Populate Caption attribute for principal elements names
    If( sCaption @= '' );
      sElementCaption = sElementName;
    Else;
      sElementCaption = AttrS( sObjectName, sElementName, sCaption );
      If( sElementCaption @= '' );
        sElementCaption = sElementName;
      EndIf;
    EndIf;
    AttrPutS( sElementCaption, sDimTgt, sElementName, 'Caption' );

    # Export Alias Names
    If( sAliases @= 'Yes' );
      nAttributeIndex = 1;
      While( nAttributeIndex <= nAttributeCount );
        sAttributeName = DimNm( sAttributeDim, nAttributeIndex );
        sAttributeType = DType( sAttributeDim, sAttributeName );
        If( sAttributeType @= 'AA' );
          sAttributeValue = AttrS( sObjectName, sElementName, sAttributeName );
          If( sAttributeValue @= '' );
            sAttributeValue = sElementName;
          Else;
            AttrPutS( sElementCaption, sDimTgt, sAttributeValue, 'Caption' );
          EndIf;
          nAliasLen = Long( sAttributeName );
          iChar = 1;
          sAliasSafeName = '';
          While( iChar <= nAliasLen );
            sChar = SubSt( sAttributeName, iChar, 1 );
            If( Scan( sChar, cBadFileNameChars ) = 0 );
              sAliasSafeName = sAliasSafeName | sChar;
            Else;
              sAliasSafeName = sAliasSafeName | cAltChar;
            EndIF;
            iChar = iChar + 1;
          End;
          If( SubsetExists( sDimTgt, sSubName |' - '| sAliasSafeName ) = 0 );
            SubsetCreate( sDimTgt, sSubName |' - '| sAliasSafeName );
          EndIf;
          SubsetElementInsert( sDimTgt, sSubName |' - '| sAliasSafeName, sAttributeValue, nElementIndex );
        EndIf;
        nAttributeIndex = nAttributeIndex + 1;
      End;
    EndIf;

    nElementIndex = nElementIndex + 1;
  End;

  EndIf;
  EndIf;
 
  nObjectIndex = nObjectIndex + 1;
End;

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
920,0
921,""
922,""
923,0
924,""
925,""
926,""
927,""
