601,100
602,"}APQ.Cub.Vue.Management"
562,"VIEW"
586,"}APQ Cube Views Management"
585,"}APQ Cube Views Management"
564,
565,"oITHUAb@hTPgio5a0=wcb_XH\mi9xnNirpT9ohu<dC_yZKTVyPjaPVyIC=u]CwIOSDte6\L9^[1H]?hPmUM>d`WnvpG`Y80e3C3P0hRoMOaqE:nrl10\E;<FJwqd<=nqHgccOcl\nSFLxnkFtCH_Doh1TLJ]J1kmXeJaSU3vK2SmX`hxc<^EUlEzLE6BDU`^q>OK?Ve:"
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
570,Default
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pCube
561,2
2
2
590,2
pDoProcessLogging,"1"
pCube,""
637,2
pDoProcessLogging,"Record in process log"
pCube,"Cube name for filtering views from a specific cube (All or Blank value will rebuild all views from all cubes)"
577,4
vSysCube
vIndex
V3
vValue
578,4
2
2
2
2
579,4
1
2
3
4
580,4
0
0
0
0
581,4
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,110
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

##############################################################################################################
#Region @DOC
# Description
# Purpose:	Process to update the views defined in }APQ Cube Views Management (classic view and/or MDX view)
# 
# Data Source: cube }APQ Cube Views Management
# 
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pCube:' | pCube;
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

### Inits - declare constants

nErr            = 0;
sErr            = '';
nDebug          = 0;
cCubSrc         = '}APQ Cube Views Management';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

cDefViewType = 'Classic';
cMDXViewSuffix = ' MDX';

IF( Trim(pCube)@='' % pCube@='All');
  sCubeFilter ='';

ELSEIF( CubeExists( pCube )=0);
  nErr = nErr+1;
  sErr = 'The cube "'|pCube|'" is not a valid cube name';
  ItemReject( sErr );
ELSE;
  sCubeFilter = Expand('%sDelimDim%}APQ Cubes%sDelimEleStart%%pCube%');
ENDIF;


######################
### Build the source view

sProc           = '}bedrock.cube.view.create';
sFilter         = Expand('}APQ Cube Views Management Measure%sDelimEleStart%IsUsedCount%sCubeFilter%');
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 0;
ExecuteProcess( sProc, 'pLogOutput', 0,
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1
);

######################
### Assign data source

IF( nErr = 0 );
  DataSourceType = 'VIEW';
  DataSourceNameForServer = cCubSrc;
  DataSourceCubeView = cViewSrc;
Else;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### END Prolog
573,197
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

### Logging - common script

IF( pDoProcessLogging @= '1' );
  nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

######################
### Metadata script


sViewName = CellGetS( cCubSrc, vSysCube, vIndex, 'View Name');
nIsNotValid = CellGetN( cCubSrc, vSysCube, vIndex, 'IsNotValid');

# Check if the view is properly defined
IF( nIsNotValid > 0 );
  IF( nDebug=1);
    nErr = nErr+1;
    sErr = 'The view "'| sViewName |'" for the cube "'| vSysCube |'" is not properly defined';
    ItemReject( sErr );
  ELSE;
    Itemskip;
  ENDIF;
ENDIF;

# Determine the view type
sViewType = CellGetS( cCubSrc, vSysCube, vIndex, 'View Type');
sViewType = If(sViewType @='', cDefViewType, sViewType);

# Construct the MDX string
If( sViewType @= 'MDX' % sViewType @= 'Both');
  sViewNameMDX = sViewName | cMDXViewSuffix;
  nDimCount = CellGetN( cCubSrc, vSysCube, vIndex, 'Dim Count');
  sMDXRow = '';
  sMDXCol = '';
  sMDXWhere = '';

  # MDX View Creation
  IF( ViewExists( vSysCube, sViewNameMDX )=1);
    ViewDestroy( vSysCube, sViewNameMDX );
  ENDIF;

  i = 1;
  While( i <= nDimCount );
    j = 1;
  
    # check if the position "i" is found
    While( j <= nDimCount );
  
      sParamID = 'Dim' | SUBST( '00' | NumberToString( j ), LONG( '00' | NumberToString( j ) ) - 1, 2 );
      sPos = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Position');
      nStackedPos = If( sPos @<> 'Title', StringToNumber( CellGetS( cCubSrc, vSysCube, vIndex, sParamID |' Stacked Position' ) ), 0 );
  
      If( sPos @<> 'Title' & nStackedPos = i );
        sCurDim = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Name');
        sSubset = CellGetS( cCubSrc, vSysCube, vIndex, sParamID |' Subset' );
  
        sTempMDX = Expand('{TM1SubsetToSet([%sCurDim%].[%sCurDim%], "%sSubset%")}');
        
        If( sPos @='Row');
          sMDXRow = sMDXRow | sTempMDX | ' * ';
        ElseIf(sPos @='Column');
          sMDXCol = sMDXCol | sTempMDX | ' * ';
        EndIf;
      EndIf;

      j = j + 1;
  
    End;
    
    sParamID = 'Dim' | SUBST( '00' | NumberToString( i ), LONG( '00' | NumberToString( i ) ) - 1, 2 );
    sPos = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Position');

    If( sPos @= 'Title');
        sCurDim = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Name');
        sSubset = CellGetS( cCubSrc, vSysCube, vIndex, sParamID |' Subset' );
        sTitleElement = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Title Element Set');

        sMDXWhere = sMDXWhere | Expand('[%sCurDim%].[%sCurDim%].[%sTitleElement%],');
    EndIf;

    i = i + 1;
  End;

EndIf;

# Construct the Classic view
If( sViewType @= 'Classic' % sViewType @= 'Both');

  If( ViewExists( vSysCube, sViewName )=1);
    ViewDestroy( vSysCube, sViewName );
  EndIf;
  ViewCreate( vSysCube, sViewName );

  i=1;
  WHILE( TabDim( vSysCube, i ) @<> '' );
  
    sCurDim = TabDim( vSysCube, i );
    sParamID = 'Dim' | SUBST( '00' | NumberToString( i ), LONG( '00' | NumberToString( i ) ) - 1, 2 );
    sPos = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Position');
    nStackedPos = If( sPos @<> 'Title', StringToNumber( CellGetS( cCubSrc, vSysCube, vIndex, sParamID |' Stacked Position' ) ), 0 );
    sSubset = CellGetS( cCubSrc, vSysCube, vIndex, sParamID |' Subset' );
    
    If( SubsetExists( sCurDim, sSubset ) = 0 );
        CellPutS( '', cCubSrc, vSysCube, vIndex, sParamID | ' Subset' );
        sMsg = Expand('%cCubSrc% view definition error. Subset does not exist for dimension! cube:%vSysCube% item:%vIndex% dim:%sCurDim% subset:%sSubset%');
        LogOutput( 'WARN', sMsg );
        # If default subset exists then attempt to assign that
        If( SubsetExists( sCurDim, 'Default' ) = 1 );
          sSubset = 'Default';
        EndIf;
    EndIf;
  
    If( sViewType @= 'Classic' % sViewType @= 'Both');
      ViewSubsetAssign( vSysCube, sViewName, sCurDim, sSubset );
    EndIf;
        
    IF( sPos @='Title');
      ViewTitleDimensionSet( vSysCube, sViewName, sCurDim );
  
      # Define the title element if mentionned in the cube
      sTitleElement = CellGetS( cCubSrc, vSysCube, vIndex, sParamID|' Title Element Set');
      IF( sTitleElement @<> '');
        nTitleElementIndex = DIMIX(sCurDim,sTitleElement);
        IF( nTitleElementIndex <> 0);
  
          nMax = SubsetGetSize(sCurDim,sSubset);
          nCtr = 1;
          nPositionInSubset = 0;
          # Loop through the subset to get the element position in the subset
          WHILE(nCtr <= nMax & nPositionInSubset = 0);
          
            sEl = SubsetGetElementName(sCurDim,sSubset,nCtr);
            nPositionInSubset = IF( DIMIX(sCurDim,sEl) = nTitleElementIndex, nCtr,0);
            nCtr = nCtr + 1;
          END;
          ViewTitleElementSet(  vSysCube, sViewName, sCurDim, nPositionInSubset);
        ENDIF;
      ENDIF;
    ELSEIF( sPos @='Column');
      ViewColumnDimensionSet( vSysCube, sViewName, sCurDim, nStackedPos );
    ELSEIF( sPos @='Row');
      ViewRowDimensionSet( vSysCube, sViewName, sCurDim, nStackedPos );
    ENDIF;
        
    i = i+1;
  END;
  
EndIf;

sRowSuppressed = CellGetS( cCubSrc, vSysCube, vIndex, 'Delete Zeroes On Rows');
IF( sRowSuppressed @='Y');
  If( sViewType @= 'Classic' % sViewType @= 'Both' );
    ViewRowSuppressZeroesSet( vSysCube, sViewName, 1 );
  EndIf;
  If( sViewType @= 'MDX' % sViewType @= 'Both' );
    sMDXRow = 'NON EMPTY ' | sMDXRow ;
  EndIf;
ENDIF;

sColSuppressed = CellGetS( cCubSrc, vSysCube, vIndex, 'Delete Zeroes On Columns');
IF( sColSuppressed @='Y');
  If( sViewType @= 'Classic' % sViewType @= 'Both' );
    ViewColumnSuppressZeroesSet( vSysCube, sViewName, 1 );
  EndIf;
  If( sViewType @= 'MDX' % sViewType @= 'Both' );
    sMDXCol = 'NON EMPTY ' | sMDXCol ;
  EndIf;
ENDIF;

If( sViewType @= 'MDX' % sViewType @= 'Both' );
    sMDXRow = Subst(sMDXRow, 1, Long(sMDXRow)-3 );
    sMDXCol = Subst(sMDXCol, 1, Long(sMDXCol)-3 );
    sMDXwhere = Subst(sMDXWhere, 1, Long(sMDXWhere)-1 );
    
    sFinalMDX = Expand(' SELECT %sMDXCol% ON COLUMNS, %sMDXRow% ON ROWS FROM [%vSysCube%] WHERE ( %sMDXwhere%)');
    
    CellPutS( sFinalMDX, cCubSrc, vSysCube, vIndex, 'MDX' );
    
    ViewCreateByMDX(vSysCube, sViewNameMDX, sFinalMDX);
EndIf;

CellPutS( TimSt( Now(), CellGetS('}APQ Settings', 'Date Time format','String') ), cCubSrc, vSysCube, vIndex, 'LastConstructTime' );

######################
### END Metadata
574,4


#****Begin: Generated Statements***
#****End: Generated Statements****
575,32
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
