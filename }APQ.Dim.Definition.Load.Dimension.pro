601,100
602,"}APQ.Dim.Definition.Load.Dimension"
562,"NULL"
586,
585,
564,
565,"n@4M1C_o5_`49Hz=5N`_Mt2F]Uno34Ba]UJRG^78@6OvjDFYFmj[g7VNptdGKctXKpwW0L[=4a^E?lR8F25I\A7T:S7IY`Mn23:GUW`6VyM>:g8DE5J`r9fiDRIqIdRItRC)_LQj7ZYdMa>}fsUxIA1jaiTpFzkGo2j<QVuPVm2cGC]hMDNs1=pWGIB2lUV2c?dkFLQ>n@4M1C_o5_`49Ht=5N`_Mt2F]Uno34BAYUJRG^78@6OvjTEYFmj[g7VNpDmAKc4WKpwW9L[=4a>G?|S8F25I\A7T:SgLY`Mn23:W[W`6VyM>:gxqF5J`r9fiDRIqi3YItBLIQLQj7ZYdBa>MfsUHGA1jaiTpFzkGo2Z4QV5]Vm2cGK]hMDNs1M~WGIB2luRri?dkFLQ>"
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
571,
569,0
592,0
599,1000
560,4
pDoProcessLogging
pDimToBuild
pSubCall
pDebug
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pDimToBuild,""
pSubCall,"0"
pDebug,"0"
637,4
pDoProcessLogging,"Record in process log"
pDimToBuild,"Hierarchy or dimension to load (if dimension will call all child hiers. to load only a specific hierarchy use dim:hier)"
pSubCall,"Used internally if process called recursively in case of dim looping through hiers"
pDebug,"Debug 0=false 1=true"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,282
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
### PURPOSE:
### 	Build/Update all hierarchies in a dimension or a specific hierarchy based on the information stored in the cube }APQ Dimension Definition
### 	This TI will trigger the TI }APQ.Dim.Definition.Load.Dimension.Step which actually update the dimension hierarchies.
### DATA SOURCE:
### 	Defined in the process according to the cube }APQ Dimension Definition
### INTENDED USAGE:
### 	Update a dimension hierarchy according to the source
##############################################################################################################

##############################################################################################################
### Logging - common script
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDimToBuild:' | pDimToBuild |' & pSubCall:' | pSubCall |' & pDebug:' | pDebug;
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Constant and variable definition
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cDimDefinitionCube      = '}APQ Dimension Definition';
cDimPropertyCube        = '}DimensionProperties';
cProcessStep            = '}APQ.Dim.Definition.Load.Dimension.Step';
cProcessGlobal          = '}APQ.Dim.Definition.Load.Dimension';
cProcessLauncherPro     = 'APQ.Process.Execute';
cSysDim                 = '}APQ Dimension Hierarchies';
cCubParam               = '}APQ Settings';
cDateFormat             = '\d/\m/\Y - \h:\i:\s';
cDurationFormat         = '\h:\i:\s';
nStartTime              = NOW();
sStartTime              = TIMST( nStartTime , cDateFormat );
sTimeStamp              = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugLoc               = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc               = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile              = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile              = cDebugFile | '_Prolog.log';
nDebug                  = StringToNumber( pDebug );
nErr                    = 0;
sErr                    = '';p

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Check the Parameter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );
IF( nErr > 0 );
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid customer key!';
EndIf;

IF( DimensionExists( pDimToBuild ) = 0 % DIMIX( cSysDim, pDimToBuild ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDimToBuild;
ElseIf( Scan( ':', pDimToBuild ) > 0 );
   # if same named hierarchy then convert tp base dimension name
   If( SubSt( pDimToBuild, 1, Scan( ':', pDimToBuild ) - 1 ) @= SubSt( pDimToBuild, Scan( ':', pDimToBuild ) + 1, Scan( ':', pDimToBuild ) - 1 ) );
       pDimToBuild = SubSt( pDimToBuild, 1, Scan( ':', pDimToBuild ) - 1 );
   EndIf;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Check the if there is at least one step
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nSourceCount = CellGetN( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Dimension To Build', 'Count' );

# Only generate an error if called directly (if a recursive call due to dim name passed & looping through all hierarchies then simply skip any hierarchy without steps)
IF( nSourceCount = 0  & pSubCall @= '0' );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No steps are defined for dimension:' | pDimToBuild;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Quit if dimension parameter invalid or no steps defined
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

IF( nErr > 0 );
   IF( nDebug >= 1 );
      ASCIIOutput( sDebugFile, sErr );
   EndIF;
   LogOutput( 'WARN', sThisProcName | ' - ' | sErr );
   ProcessQuit;
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Log the start time to dimension definition cube
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If( pDoProcessLogging @<> '1' );
    sProcessRunBy = TM1User(); 
    If( DimIx( '}Clients', sProcessRunBy ) > 0 ); 
        sProcessRunBy = If( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); 
    EndIf;
EndIf;
CellPutS( sStartTime, cDimDefinitionCube, pDimToBuild, 'Total Items', 'Last Update Start Time', 'String' );
CellPutS( sProcessRunBy, cDimDefinitionCube, pDimToBuild, 'Total Items', 'User', 'String' );

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Manage when the dimension doesn't exist yet
#	Dimension is created in the epilog of this TI
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sDimFinale = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Dimension To Build', 'String' );
If( Scan( ':', sDimFinale ) = 0 );
    sDim = sDimFinale;
Else;
    sDim = SubSt( sDimFinale, 1, Scan( ':', sDimFinale ) - 1 );
    sHier = SubSt( sDimFinale, Scan( ':', sDimFinale ) + 1, Scan( ':', sDimFinale ) - 1 );
EndIf;
IF( DimensionExists( sDimFinale ) = 0 );
    If( Scan( ':', sDimFinale ) = 0 );
        DimensionCreate( sDimFinale );
    Else;
        HierarchyCreate( sDim, sHier );
    EndIf;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Launch a precursor custom process 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If( DimIx( '}Processes', CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Launch a custom process BEFORE step 1', 'String' ) ) > 0 );
    sTIProcessName  = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Launch a custom process BEFORE step 1', 'String' );
    # we take "steps" 1,2,3 as param array & delimiters
	sParamArray     = CellGetS( cDimDefinitionCube, pDimToBuild, '0001', 'Launch a custom process BEFORE step 1', 'String' );
	sParamDelimiter = CellGetS( cDimDefinitionCube, pDimToBuild, '0002', 'Launch a custom process BEFORE step 1', 'String' );
	sParamStartValue= CellGetS( cDimDefinitionCube, pDimToBuild, '0003', 'Launch a custom process BEFORE step 1', 'String' );
	ExecuteProcess( cProcessLauncherPro,
		'pProcess', sTIProcessName,
		'pParamArray', sParamArray,
		'pParamDelim', sParamDelimiter,
		'pParamValueStartDelim', sParamStartValue,
		'pDebug', pDebug
	);
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Clean the dimension if needed
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nRebuidMode 	    = IF( CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Dimension Delete All Elements', 'String' ) @= 'Y', 1, 0 );
nAttrRefreshMode 	= IF( CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Delete And Recreate All Attributes', 'String' ) @= 'Y', 1, 0 );
nUnwindMode 	    = IF( CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Dimension Unwind', 'String' ) @= 'Y', 1, 0 );
sUnwindConso 	    = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Unwind Consolidation List', 'String' );
sUnwindConsoSep	    = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Unwind Consolidation List Separator', 'String' );
nUnwindRecursive	= IF( CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Unwind Recursively', 'String' ) @= 'Y', 1, 0 );
sDelimEle           = CellGetS( cCubParam, 'pEleDelim', 'String' );
sDelimEle           = IF( sDelimEle @= '', '+', sDelimEle );
sUnwindConsoSep     = IF( sUnwindConsoSep @= '', sDelimEle, sUnwindConsoSep );
If( sUnwindConso    @<> '' );
    If( Scan( sUnwindConsoSep, sUnwindConso ) = 0 );
        sUnwindConso = sUnwindConso | sUnwindConsoSep;
    EndIf;
EndIf;

### Check if Attribute Recreate Mode is activated
If( nAttrRefreshMode = 1 );
    If( DimensionExists( '}ElementAttributes_' | sDimFinale ) = 1 & CubeExists( '}ElementAttributes_' | sDimFinale ) = 1 );
        CubeClearData( '}ElementAttributes_' | sDimFinale );
    	i=1;
    	While( DIMNM( '}ElementAttributes_' | sDimFinale, i ) @<> '' );
    		AttrDelete( sDimFinale, DIMNM( '}ElementAttributes_' | sDimFinale, i ) );
    	End;
    EndIf;
EndIf;

### Check Rebuild Mode 
IF( nRebuidMode = 1 & nSourceCount > 1 );
	# No need to do DimensionDeleteAllElements as this is managed either in STEP 0001 if only one step or in Bedrock.Dim.Clone if multi-step
ENDIF;

### Check if Unwind Mode is activated
IF( nUnwindMode = 1 );

	# Check if there is specific consolidation to unwind
	IF( sUnwindConso @<> '' );

		# Create a temp list for the consolidation elements
		sTmpUnwindConso = sUnwindConso;

		# Loop through the elements of list
		WHILE( sTmpUnwindConso @<> '' );

			# Define the current consolidation to unwind
			IF( SCAN( sUnwindConsoSep, sTmpUnwindConso ) > 0 );
				sCurConso = SUBST( sTmpUnwindConso, 1, SCAN( sUnwindConsoSep, sTmpUnwindConso ) - 1 );
			ELSE;
				sCurConso = SUBST( sTmpUnwindConso, 1, LONG( sTmpUnwindConso ) );
			ENDIF;

			# Update the list of consolidations
			IF( SCAN( sUnwindConsoSep, sTmpUnwindConso ) > 0 );
				sTmpUnwindConso = SUBST( sTmpUnwindConso, LONG( sCurConso ) + LONG( sUnwindConsoSep ) + 1, LONG( sTmpUnwindConso ) );
			ELSE;
				sTmpUnwindConso = '';
			ENDIF;

			# Check if the current Consolidation exists in the dimension
			IF( DIMIX( sDimFinale, sCurConso) = 0 );
				nErr = nErr + 1;
				sErr = 'Invalid consolidation to unwind in ' | sDimFinale | ':' | sCurConso;
				IF( nDebug >= 1 );
					ASCIIOutput( sDebugFile, sErr );
				EndIF;
				LogOutput( 'WARN', sThisProcName | ' - ' | sErr );

			ELSE;

				# Unwind the current consolidation
				IF( DTYPE( sDimFinale, sCurConso ) @= 'C' & ELCOMPN( sDimFinale, sCurConso ) >= 1 );
				    ExecuteProcess('}bedrock.hier.unwind',
				        'pLogOutput', nDebug, 'pStrictErrorHandling', 1,
				        'pDim', sDimFinale, 'pHier', '',
				        'pConsol', sCurConso,
				        'pRecursive', nUnwindRecursive, 'pDelim', sUnwindConsoSep
				    );
				ENDIF;

			ENDIF;

		END;

	# If no specific consolidation is mentioned then we Unwind All
	ELSEIF( DNLEV( sDimFinale ) >= 2 );
	    ExecuteProcess('}bedrock.hier.unwind',
	        'pLogOutput', nDebug, 'pStrictErrorHandling', 1,
	        'pDim', sDimFinale, 'pHier', '',
	        'pConsol', '*',
	        'pRecursive', 1, 'pDelim', sUnwindConsoSep
	    );
	ENDIF;
ENDIF;


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Manage Dimension sorting
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sSortFlag = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items','Dimension Sort Order', 'String' );

IF( sSortFlag @= 'Y' );
	sCompSortType = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Component Sort Type', 'String' );
	sCompSortSense = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Component Sort Sense', 'String' );
	sEltSortType = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Element Sort Type', 'String' );
	sEltSortSense = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Element Sort Sense', 'String' );

	CellPutS( sCompSortType, cDimPropertyCube, pDimToBuild, 'SORTCOMPONENTSTYPE' );
	CellPutS( sCompSortSense, cDimPropertyCube, pDimToBuild, 'SORTCOMPONENTSSENSE' );
	CellPutS( sEltSortType, cDimPropertyCube, pDimToBuild, 'SORTELEMENTSTYPE' );
	CellPutS( sEltSortSense, cDimPropertyCube, pDimToBuild, 'SORTELEMENTSSENSE' );
	
	DimensionSortOrder( sDimFinale, sCompSortType , sCompSortSense, sEltSortType, sEltSortSense );
ENDIF;


######################
### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,270
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Debug management
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sDebugFile = cDebugFile | '_Epilog.log';

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Launch the different steps to build the dimension
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sDim        = '}APQ Item Index';
sCnsl       = 'Total Items';
nMax        = ELCOMPN(sDim,sCnsl);
nCtr        = 1;
WHILE( 	nCtr <= nMax );

  	sEl = ELCOMP( sDim, sCnsl, nCtr );
	sCheckedMeasure = CellGetS( cDimDefinitionCube, pDimToBuild, sEl, 'Dimension To Build', 'String' );
	nCheckStep = CellGetN( cDimDefinitionCube, pDimToBuild, sEl, 'Dimension To Build', 'Count' );
	
	If( sCheckedMeasure @<> '' & nCheckStep = 0 );
	    LogOutput( 'WARN', Expand('Dimension load step %sEl% is disabled and will be skipped.') );
	EndIf;
	
	IF( nCheckStep = 1 );
		ExecuteProcess( cProcessStep, 'pDoProcessLogging', pDoProcessLogging, 'pDimToBuild', pDimToBuild, 'pID', sEl, 'pSingleStep', '0', 'pDebug', pDebug );
		# The last dimension updated is kept for the epilog and check if a clone dimension is needed
		sDimStepLast = CellGetS( cDimDefinitionCube, pDimToBuild, sEl, 'Dimension To Build', 'String' );
	ENDIF;
  	nCtr = nCtr + 1;
END;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Check if a Temp Dimension has been used 
#	and trigger the "commit/clone" if needed
#	and delete the technical dimension used
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

IF( nRebuidMode = 1 );
	nKeepExisting = 0;
ELSE;
	nKeepExisting = 2;
ENDIF;
IF( sDimFinale @<> sDimStepLast );
    If( Scan( ':', sDimFinale ) = 0 );
        sDim = sDimFinale;
        sHier = sDimFinale;
    Else;
        sDim = SubSt( sDimFinale, 1, Scan( ':', sDimFinale ) - 1 );
        sHier = SubSt( sDimFinale, Scan( ':', sDimFinale ) + 1, Scan( ':', sDimFinale ) - 1 );
    EndIf;
    ExecuteProcess('}bedrock.hier.clone',
        'pLogOutput', nDebug,
        'pSrcDim', sDimStepLast, 'pSrcHier', '',
        'pTgtDim', sDim, 'pTgtHier', sHier,
        'pAttr', 1,
        'pUnwind', nKeepExisting
    );
	ExecuteProcess( '}bedrock.dim.delete',
	    'pLogOutput', nDebug, 
	    'pDim', sDimStepLast,
	    'pDelim', '&'
	);
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Generic dimension maintenance options
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sTopNode    = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Automatically Create Top Node', 'String' );
sNAEle      = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Automatically Create NA Element', 'String' );
sOrphanN    = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Group Orphan N Elements', 'String' );
sOrphanC    = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Delete Orphan C Elements', 'String' );
sDummyN     = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Automatically Create Dummy N Elements', 'String' );
sDummyNLvl  = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Automatically Create Dummy N Elements to Level', 'String' );
sProcess    = '}APQ.Dim.Maintenance.Options';

IF( sDummyN @= 'Y' );
   sMode = '5';
   If( sDummyNLvl @<= '1' );
      sDummyNLvl = '0';
   EndIf;
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDimSource', sDimFinale, 'pDimTarget', sDimFinale, 'pMode', sMode, 'pToLevel', sDummyNLvl, 'pDebug', pDebug );
EndIF;
IF( sOrphanC @= 'Y' );
   sMode = '6';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDimSource', sDimFinale, 'pDimTarget', sDimFinale, 'pMode', sMode, 'pDebug', pDebug );
EndIF;
IF( sOrphanN @= 'Y' );
   sMode = '7';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDimSource', sDimFinale, 'pDimTarget', sDimFinale, 'pMode', sMode, 'pDebug', pDebug );
EndIF;
IF( sTopNode @= 'Y' );
   sMode = '8';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDimSource', sDimFinale, 'pDimTarget', sDimFinale, 'pMode', sMode, 'pDebug', pDebug );
EndIF;
IF( sNAEle @= 'Y' );
   sMode = '9';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDimSource', sDimFinale, 'pDimTarget', sDimFinale, 'pMode', sMode, 'pDebug', pDebug );
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Refresh standard subsets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sDoSubsetUpdate = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Launch Standard Subset Updates', 'String' );
IF( sDoSubsetUpdate @= 'Y' );
   sProcess = '}APQ.Dim.Sub.StandardSubsets.Update';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDimFinale );
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Refresh subsets & user defined consolidations
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sDoSubsetUpdate = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Launch Subset Framework Updates', 'String' );
IF( sDoSubsetUpdate @= 'Y' );
   sProcess = '}APQ.Dim.Sub.SemiDynamicSubsets.Update';
   If( CellGetN( '}APQ Dimension SemiDynamic Subsets', If( Scan( ':', pDimToBuild ) = 0, pDimToBuild, SubSt( pDimToBuild, 1, Scan( ':', pDimToBuild ) - 1 ) ), 'Total Items', 'IsUsedCount' ) >= 1 );
       ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDimFinale );
   EndIf;
   sProcess = '}APQ.Dim.Sub.StaticSubsets.Update';
   If( CellGetN( '}APQ Dimension Static Subsets And UDC', If( Scan( ':', pDimToBuild ) = 0, pDimToBuild, SubSt( pDimToBuild, 1, Scan( ':', pDimToBuild ) - 1 ) ), 'Static Subset', 'Total APQ Dimension Use Index', 'Total Items', 'IsValid' ) >= 1 );
       ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDimFinale );
   EndIf;
   sProcess = '}APQ.Dim.UDC.Flat.Update';
   If( CellGetN( '}APQ Dimension Static Subsets And UDC', If( Scan( ':', pDimToBuild ) = 0, pDimToBuild, SubSt( pDimToBuild, 1, Scan( ':', pDimToBuild ) - 1 ) ), 'Flat Consolidation', 'Total APQ Dimension Use Index', 'Total Items', 'IsValid' ) >= 1 );
       ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDimFinale );
   EndIf;
   sProcess = '}APQ.Dim.UDC.Hier.Update';
   If( CellGetN( '}APQ Dimension Static Subsets And UDC', If( Scan( ':', pDimToBuild ) = 0, pDimToBuild, SubSt( pDimToBuild, 1, Scan( ':', pDimToBuild ) - 1 ) ), 'Hier Consolidation', 'Total APQ Dimension Use Index', 'Total Items', 'IsValid' ) >= 1 );
       ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDimFinale );
   EndIf;
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Refresh attribute framework
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sDoAttrUpdate = CellGetS( cDimDefinitionCube, sDimFinale, 'Total Items', 'Launch Attribute Framework Updates', 'String' );
IF( sDoAttrUpdate @= 'Y' );
   sProcess = '}APQ.Dim.DimensionElements.Update';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDoProcessLogging', '1', 'pCreateSubs', '1', 'pDim', sDimFinale, 'pClear', '0' );
   sProcess = '}APQ.Dim.Attr.Definition.Update';
   ExecuteProcess( sProcess, 'pDimension', sDimFinale, 'pMetadata', '1' );
   sProcess = '}APQ.Dim.Sub.DimensionAttributeType.Update';
   ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDimFinale );
EndIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Recursive calling of hierarchies if primary dimension is called
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If( Scan( ':', pDimToBuild ) = 0 & ElCompN( cSysDim, pDimToBuild ) > 1 );
    # loop through the hierarchies (skipping the same named hierarchy)
    nMax = ElCompN( cSysDim, pDimToBuild );
    nCtr = 1;
    While( nCtr <= nMax );
        sHier = ElComp( cSysDim, pDimToBuild, nCtr );
        If( sHier @<> pDimToBuild |':'| pDimToBuild );
            If( CellGetN( cDimDefinitionCube, sHier, 'Total Items', 'Dimension To Build', 'Count' ) >= 1 );
                # don't log recursive sub-process calls
                ExecuteProcess( sThisProcName,
                	'pDoProcessLogging', '0',
                	'pDimToBuild', sHier,
                	'pSubCall', '1',
                	'pDebug', pDebug
                );
            EndIf;
        EndIf;
        nCtr = nCtr + 1;
    End;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Update element security 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If( Scan( ':', pDimToBuild ) = 0 & CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Update Element Security', 'String') @= 'Y' );
    # only launch element security for dimension level load (not hierarchy) simce element security a dimension level concept not hierarchy level (at this point)
    If( CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Full element security refresh (including automatic group creation)', 'String') @= 'Y' );
        sProcess = '}APQ.Security.Elements.CreateGroups';
        ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDebug', '0',
            'pDimension', pDimToBuild, 'pClear','', 'pSecurityRefresh', '0', 'pFramework', '1'
        );
    ElseIf( CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Element security refresh for preconfigured groups', 'String') @= 'Y' );
        sProcess = '}APQ.Security.Elements.LoadAccessRights';
        ExecuteProcess( sProcess, 'pDoProcessLogging', pDoProcessLogging, 'pDebug', '0',
            'pDimension', pDimToBuild, 'pClear', '1', 'pSecurityRefresh', '0'
        );
    EndIf;
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Launch a subsequent custom process 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If( DimIx( '}Processes', CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Launch a custom process AFTER final step', 'String' ) ) > 0 );
    sTIProcessName  = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Launch a custom process AFTER final step', 'String' );
    # we take "steps" 1,2,3 as param array & delimiters
	sParamArray     = CellGetS( cDimDefinitionCube, pDimToBuild, '0001', 'Launch a custom process AFTER final step', 'String' );
	sParamDelimiter = CellGetS( cDimDefinitionCube, pDimToBuild, '0002', 'Launch a custom process AFTER final step', 'String' );
	sParamStartValue= CellGetS( cDimDefinitionCube, pDimToBuild, '0003', 'Launch a custom process AFTER final step', 'String' );
	ExecuteProcess( cProcessLauncherPro,
		'pProcess', sTIProcessName,
		'pParamArray', sParamArray,
		'pParamDelim', sParamDelimiter,
		'pParamValueStartDelim', sParamStartValue,
		'pDebug', pDebug
	);
EndIf;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 	Launch a subsequent dimension 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Manage 'Launch another dimension' parameter
sNextDimension = CellGetS( cDimDefinitionCube, pDimToBuild, 'Total Items', 'Launch another dimension', 'String' );

IF( sNextDimension @= pDimToBuild % Scan( sNextDimension | ':', pDimToBuild ) = 1 );
	nErr = nErr + 1;
	sErr = 'Next dimension cannot be the same as current dimension! Exiting recursive loop.';
	IF( nDebug >= 1 );
		ASCIIOutput( sDebugFile, sErr );
	EndIF;
	LogOutput( 'WARN', sThisProcName | ' - ' | sErr );
	ProcessError;
ELSEIF ( DimensionExists( sNextDimension ) = 1 );
	ExecuteProcess( cProcessGlobal, 'pDimToBuild', sNextDimension, 'pSubCall', '0', 'pDebug', pDebug );
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#	Log the Finish Time within the Dimension Definition cube
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nEndTime = NOW();
sEndTime = TIMST( nEndTime, cDateFormat );
nElapsedTime = nEndTime - nStartTime;
sElapsedTime = TIMST( nElapsedTime , cDurationFormat );
CellPutS( sEndTime, cDimDefinitionCube, pDimToBuild, 'Total Items', 'Last Update End Time', 'String' );
CellPutS( sElapsedTime, cDimDefinitionCube, pDimToBuild, 'Total Items', 'Last Update Duration', 'String' );
CellPutS( IF( GetProcessErrorFilename @= '', '', GetProcessErrorFileDirectory | GetProcessErrorFilename ), cDimDefinitionCube, pDimToBuild, 'Total Items', 'Error File', 'String' );

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
