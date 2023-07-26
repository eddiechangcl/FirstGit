601,100
602,"}APQ.Dim.Hierarchy.Audit"
562,"NULL"
586,
585,
564,
565,"x`IOScTOfvJYYG4pRX?=hyadzWBXyGR<wKMn<rYu13KDGHiHp9;OGJ]p]FUPp_6HZ>B}chi7c7yaOAEKgKIZFlOUnRH;NZiNBY78dtTl?LzRH>9w5e[kmEaKN<\lm\wfOqXSZ6qCAkhVgoCovuMm>IFJbvQ0:Wz7[sP3di,?0@GmMKtuy\6Jc~1tm5mw==0a8VvU5Gl5x`IOScTOfvJYYG4pRX?=hyadzWBXyGRl{KMn<rYu13KDGX`Hp9;OGJ]p]V*[p_FLZ>BMdhi7c79hOAIKgKIZFlOUnRh<NZiNBY7X`tTl?LzRH>iA8e[kmEaKN<\l}ZtfOaXCW6qCAkh&koCOruM=4IFJbvQ0:Wz7[s@2di|:0@Gm=Ftuy\6Jc.?tm5mw==9A2VvU5Gl5x`IOScTOfvJYYG4pRX?=hyadoWBXyGRLzKMn<rYu13KDGHfHp9;OGJ]p]V`Sp_fGZ>B}ehi7c7ijOaAKgKIZFlOUnRX6NZiNBY7X`tTl?LzRH>YQ:e[kmEaKN<\lm^zfOa^ST6qCAkhFnoC?uuM]<IFJbvQ0:Wz7[s06diL;0@GmmGtuy\6Jcn=tm5mw=}0a1VvU5Gl5"
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
560,9
pDimension
pHierarchy
pOrphanCheck
pException
pExceptionDelimiter
pFilePath
pFileName
pSkipFile
pDebug
561,9
2
2
2
2
2
2
2
2
2
590,9
pDimension,""
pHierarchy,""
pOrphanCheck,"1"
pException,""
pExceptionDelimiter,"&"
pFilePath,""
pFileName,""
pSkipFile,"0"
pDebug,"0"
637,9
pDimension,"REQUIRED: Dimension To analyse"
pHierarchy,"OPTIONAL: The specific hierarchy to check (REQUIRED if dimension has > 10000 elements)"
pOrphanCheck,"OPTIONAL: 1/0 Also check for orphans as well as double-ups"
pException,"OPTIONAL: List of Exceptions Delimited (no spaces btw element & delimiter)"
pExceptionDelimiter,"OPTIONAL: Delimiter"
pFilePath,"OPTIONAL: File path, If blank, the output directory will be the error directory"
pFileName,"OPTIONAL: File name with .csv extension. If blank, pDimension|'_Check.csv'"
pSkipFile,"OPTIONAL: 1/0 Skip File if there is no issue (otherwise a file with ""no error"" Is generated)"
pDebug,"OPTIONAL: 1/0 Debug. If debugging don't destroy the temp objects"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,229
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

############################################################
#
#  PURPOSE:
# This process checks in a dimension if there is any hierarchy duplication issue. It can also check for orphan N elements.
# The TI writes out the element(s) which cause the duplication and the 1st level consolidated node impacted above the duplicated element.
# A delimited list of elements to be excluded from the check can be included as a parameter
#
# TI Logic:
# The TI looks in the dimension for elements with multiple parents
# For each of these element the TI puts a value of 1 in a test cube created in the Prolog.
# If there is any consolidated element with a value different from 1, then the element roll-up multiple time in the consolidation and is logged in an output file.
#
# Parameter descriptions:
# - The pDimension parameter contains the name of the dimenson to be checked.
# - The pHierarchy parameter contains the name of the hierarchy within the dimensions to be checked.
# - The pOrphanCheck parameter flags whether to also check if N elements have a parent (within dimension or within hierarchy).
# - The pException parameter is a list of element to be ignored in the dimension check (ie: A technical regroupment which is known to have duplicated element
# - The pExceptionDelimiter is the delimiter used in the pException parameter to separate the elements
# - The pFilePath parameter specifies where the output file has to be exported
# - The pFileName parameter specifies the file name for the outputfile
# - The pSkipFile parameter enable to skip the log file if no issue has been raised.
#
############################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
pDoProcessLogging = '1';
If( pFileName @= '' ); pFileName = pDimension | If( pHierarchy @= '', '', '_'| pHierarchy ) | '_Check.csv'; EndIf;
sProcLogParams = 'pDimension:' | pDimension |' & '| 'pHierarchy:' | pHierarchy |' & '| 'pOrphanCheck:' | pOrphanCheck |' & '| 'pException:' | pException |' & '| 'pExceptionDelimiter:' | pExceptionDelimiter |' & '| 'pFilePath:' | pFilePath |' & '| 'pFileName:' | pFileName |' & '| 'pSkipFile:' | pSkipFile;
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

#----------------------------------------------------------------------------------------------------
#		Preliminary Checks
#----------------------------------------------------------------------------------------------------

sErrMsg     = '';
nErrors     = 0;
nDebug      = StringToNumber( pDebug );
cDimMaxSiz  = 10000;

IF( DimensionExists( pDimension ) = 0 );
	nErrors = 1;
	sErrMsg = 'The dimension '''|pDimension|''' does not exist: Check the parameter';
	ItemReject( sErrMsg );
ENDIF;

IF( pHierarchy @<> '' );
	IF( DimIx( pDimension, pHierarchy ) = 0 );
		bHierarchy = 0;
		nErrors = 1;
		sErrMsg = 'The dimension '''|pDimension|''' does not contain hierarchy: '| pHierarchy;
		ItemReject( sErrMsg );
	ELSE;
		bHierarchy = 1;
	ENDIF;
ELSE;
	bHierarchy = 0;
ENDIF;

IF( DIMSIZ( pDimension ) > cDimMaxSiz & DimIx( pDimension, pHierarchy ) = 0 );
	nErrors = 1;
	sErrMsg = 'For dimensions with over ' | NumberToString( cDimMaxSiz ) | ' elements the Hierarchy parameter is REQURED.';
	ItemReject( sErrMsg );
ENDIF;

# Validate file path
IF( Trim( pFilePath ) @= '' );
	pFilePath = GetProcessErrorFileDirectory;
ELSE;
	IF( SubSt( pFilePath, Long( pFilePath ), 1 ) @= '\' );
		pFilePath = SubSt( pFilePath, 1, Long( pFilePath ) -1 );
	ENDIF;
	IF( FileExists( pFilePath ) = 0 );
		nErrors = 1;
		sErrMsg = 'The file path does not exist or cannot be write:"' | pFilePath | '"';
		ItemReject( sErrMsg );
	ENDIF;
	pFilePath = pFilePath | '\';
ENDIF;

# Validate file name
IF( pFileName @= '' );
	pFileName = pDimension |'_Check.csv';
ENDIF;
IF( LOWER( SUBST( pFileName, LONG( pFileName )-3,4 ) ) @<> '.csv' );
	pFileName = pFileName | '.csv';
ENDIF;

#----------------------------------------------------------------------------------------------------
#		Constants and Variable Definition
#----------------------------------------------------------------------------------------------------

DataSourceASCIIQuoteCharacter = ''; 	

#String use for unique name
cNow = NumberToString( NOW() );
	
cDimMeasure = GetProcessName | ' Measure';
cMeasure = 'Count';
sListErrElt = '';
cCube = '}APQ ' | pDimension | If( pHierarchy @= '', '', '_'| pHierarchy ) | '_Check';
sSubName = 'MultipleParents';
sSubNameOrder = pDimension | '_Order';
sOutput = '';
cTestElement = pDimension | '_ElementForDetectingDuplication_' | sThisProcName;
cDimension = '}APQ ' | pDimension | IF( pHierarchy @= '', '', '_'| pHierarchy ) | '_Check_Dup';
cHierSub = '}APQ ' | pDimension | '_Hier_' | pHierarchy;
cOutputFile = pFilePath | pFileName;

#Add delimiter to end of exception list so that scan for exceptions will work
pException = pException | pExceptionDelimiter;

#----------------------------------------------------------------------------------------------------
#		 Duplicate the dimension / dimension hierrchy
#----------------------------------------------------------------------------------------------------

IF( DimIx( pDimension, pHierarchy ) > 0 );
	sMDX = '{ HIERARCHIZE( {TM1DRILLDOWNMEMBER( {[' | pDimension | '].[' | pHierarchy | '] }, ALL, RECURSIVE )} ) }';
	ExecuteProcess( '}bedrock.hier.sub.create.bymdx',
	    'pLogOutput', nDebug,
	    'pDim', pDimension,
	    'pHier', '',
	    'pSub', cHierSub,
	    'pMDXExpr', sMDX,
	    'pConvertToStatic', 1,
	    'pTemp', 1
	);
	ExecuteProcess( '}bedrock.hier.create.fromsubset',
	    'pLogOutput', nDebug,
	    'pSrcDim', pDimension,
	    'pSrcHier', '',
	    'pSubset', cHierSub,
	    'pTgtDim', cDimension,
	    'pTgtHier', '',
	    'pAttr', 0,
	    'pUnwind', 0,
	    'pFlat', 0
	);
ELSE;		
	ExecuteProcess( '}bedrock.hier.clone',
	    'pLogOutput', nDebug,
	    'pSrcDim', pDimension,
	    'pSrcHier', '',
	    'pTgtDim', cDimension,
	    'pTgtHier', '',
	    'pAttr', 0,
	    'pUnwind', 1
	);
ENDIF;

#----------------------------------------------------------------------------------------------------
#		Create element to gather the flag
#----------------------------------------------------------------------------------------------------

DimensionElementInsert( cDimension, '', cTestElement, 'N' );

#----------------------------------------------------------------------------------------------------
#		Clean elements if exist... 
#  		(usefull only if TI stopped without cleaning the elements or last run was Debug)
#----------------------------------------------------------------------------------------------------

IF( CubeExists( cCube ) = 1);
    CubeDestroy( cCube );
ENDIF;
IF( SubsetExists( cDimension, sSubName ) = 1 );
    SubsetDestroy( cDimension, sSubName );
ENDIF;
IF( SubsetExists( cDimension, sSubNameOrder ) = 1 );
    SubsetDestroy( cDimension, sSubNameOrder );
ENDIF;

#----------------------------------------------------------------------------------------------------
#		Structure Build for the checking
#		and list element with potential issues
#----------------------------------------------------------------------------------------------------
	
IF( DimensionExists( cDimMeasure ) = 0 ); 
	DimensionCreate( cDimMeasure );
	DimensionElementInsert( cDimMeasure, '' ,cMeasure, 'N' );
ENDIF;
CubeCreate( cCube, cDimension, cDimMeasure );

#Create the subset which list the potential issues (ie: one element has more than 1 parent)
#This TI will be uses as  a source for the element to check
SubsetCreate( cDimension, sSubName );

i = 1;
iMax = DimSiz(cDimension);
WHILE( i <= iMax );
	sCurElt = DimNm( cDimension, i );
	IF( SCAN( sCurElt | pExceptionDelimiter, pException ) = 0 );
		IF( ELPARN( cDimension, sCurElt ) > 1 );
			SubsetElementInsert( cDimension, sSubName, sCurElt, 1 );
		ENDIF;
	ENDIF;	
	i = i + 1;
END;

######################
### END Prolog

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,194
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

### If errors occurred terminate process with a major error status ###
IF( nErrors <> 0 );
	ProcessQuit;
ENDIF;

#----------------------------------------------------------------------------------------------------
#		Start Checking for multiple parents within rollup
#----------------------------------------------------------------------------------------------------	

### Loop trough elements with multiple parents
# This code section in the While could have been moved to the metadata tab,
# but for developpment and maintenance it is easier to not have the issue about the "Subset doesn't exist..."

iEltToCheck = 1;
iEltToCheckMax = SubsetGetSize( cDimension, sSubName );
WHILE( iEltToCheck <= iEltToCheckMax );

	# Grab the element to check in the subset built in prolog
	sCurEltToCheck = SubsetGetElementName( cDimension, sSubName, iEltToCheck );
		
	# Define the element to flag to analyse the potential issues
	# Link the test element as a Leaf element under the element with multiple elements to be tested
	IF( ElLev( cDimension, sCurEltToCheck ) <> 0 );
		DimensionElementComponentAddDirect( cDimension, sCurEltToCheck, cTestElement, 1 );
		sCurFlaggedElement = cTestElement;
	ELSE;
		sCurFlaggedElement = sCurEltToCheck;
	ENDIF;
		
	#Flag: A value of 1 is affected to check the duplication
	CellPutN( 1, cCube,sCurFlaggedElement, cMeasure );
		
	# Create an ordered Subset to find quickly the impacts:
	# --> Order by values : Duplicated element first
	# --> Order by level : Lower element last (as we take the last element
	sOrderMDX = '{ORDER({ ORDER ({TM1SUBSETALL( ['|cDimension|'] )}, ['|cDimension|'].CurrentMember.Level.Ordinal, BASC ) },['|cCube|'].([' | cDimMeasure | '].[Count]),BDESC)}';

		
	#Create the subset to check the element of this lvl
	SubsetCreatebyMDX( sSubNameOrder, sOrderMDX );

	iEltOrdered = 1;
	iEltOrderedMAX = SubsetGetSize( cDimension, sSubNameOrder );
		
	#Check Value = This number is high to avoid issues. The idea is to keep the last value (decreasing while looping through the elements ordered to find the impact point of duplication)
	iLastValue = 1000000; 	
	sLastElement = '';

	### Manage Specific Case of negative Weight
	sCurEltOrdered = SubsetGetElementName( cDimension, sSubNameOrder, 1 );
	iVal = CellGetN( cCube,sCurEltOrdered, cMeasure );
		
	IF ( iVal = 0 );
		SubsetDestroy( cDimension, sSubNameOrder );
		sOrderMDX = '{ORDER({ ORDER ({TM1SUBSETALL( ['|cDimension|'] )}, ['|cDimension|'].CurrentMember.Level.Ordinal, BASC ) },['|cCube|'].([' | cDimMeasure | '].[Count]),BASC)}';
		SubsetCreatebyMDX( sSubNameOrder, sOrderMDX );
	ENDIF;
	### End of/ Manage Specific Case of negative Weight
			
	#Loop Through the elements to find the impact point of duplication
	WHILE( iLastValue <>1 & iEltOrdered <= iEltOrderedMAX );
		sCurEltOrdered = SubsetGetElementName( cDimension, sSubNameOrder, iEltOrdered );
		iLastValue = ABS( CellGetN( cCube, sCurEltOrdered, cMeasure ) );
		IF( iLastValue > 1 );
			sLastElement = sCurEltOrdered;
		ENDIF;
		
		iEltOrdered = iEltOrdered + 1;
	END;
		
	# Check if the sLastElement hasn't been found yet
	IF (sLastElement @<> '' & Scan( sLastElement | pExceptionDelimiter, pException ) = 0 );
		IF( sOutput @= '' );
			sOutput = 'Root Element, Parent Issue, Description';
			AsciiOutPut( cOutputFile, sOutput );
		ENDIF;
		sOutput = sCurEltToCheck | ',' | sLastElement | ',' | 'The element "' | sCurEltToCheck | '" has multiple parents within the rollup: "' | sLastElement | '".';
		AsciiOutPut( cOutputFile, sOutput );
	ENDIF;
		
	#Cleaning
	CellPutN( 0, cCube, sCurFlaggedElement, cMeasure );		
	SubsetDestroy( cDimension, sSubNameOrder );	
	IF( ElLev( cDimension, sCurEltToCheck ) <> 0 );
		DimensionElementComponentDeleteDirect( cDimension, sCurEltToCheck, cTestElement );
	ENDIF;
					
	iEltToCheck = iEltToCheck + 1;
END;
	

#----------------------------------------------------------------------------------------------------
#		Start Checking for no parents (i.e. value missing as oppose dto double-counted)
#----------------------------------------------------------------------------------------------------	

### Loop trough original source dimension & check if hierarchy is ancestor or check if no parents at all if no hierarchy specified

IF( pOrphanCheck @= '1');

	i = 1;
	iMax = DimSiz( pDimension );
	WHILE( i <= iMax );
		sCurElt = DimNm( pDimension, i );
		IF( SCAN( sCurElt | pExceptionDelimiter, pException ) = 0 );

			IF( bHierarchy = 1 );
				IF( DIMIX( cDimension, sCurElt ) = 0 & DTYPE( pDimension, sCurElt ) @= 'N' );
 					IF( sOutput @= '' );
						sOutput = 'Root Element, Parent Issue, Description';
						AsciiOutPut( cOutputFile, sOutput );
					ENDIF;
					sOutput = sCurElt | ',,' | 'The element "' | sCurElt | '" has no parents within the hierarchy: "' | pHierarchy | '".';
					AsciiOutPut( cOutputFile, sOutput );
				ENDIF;
			ELSE;
				IF( ELPAR( pDimension, sCurElt,1 ) @= '' & DTYPE( pDimension, sCurElt ) @= 'N' );
 					IF( sOutput @= '' );
						sOutput = 'Root Element, Parent Issue, Description';
						AsciiOutPut( cOutputFile, sOutput );
					ENDIF;
					sOutput = sCurElt | ',,' | 'The element "' | sCurElt | '" has no parents within the dimension: "' | pDimension | '".';
					AsciiOutPut( cOutputFile, sOutput );
				ENDIF;
			ENDIF;

		ENDIF;	
		i = i+1;
	END;

ENDIF;

#----------------------------------------------------------------------------------------------------
#		Cleaning
#----------------------------------------------------------------------------------------------------

IF( pDebug @= '0' );
	CubeDestroy( cCube );
	DimensionDestroy( cDimension );
ENDIF;

#----------------------------------------------------------------------------------------------------
#		Standard bedrock process to create subsets of orphan N and C
#----------------------------------------------------------------------------------------------------	

ExecuteProcess( '}bedrock.hier.sub.create.orphans', 
    'pLogOutput', nDebug, 
    'pDim', pDimension, 'pHier', '' 
);

#----------------------------------------------------------------------------------------------------
#		Write message if everything went well
#----------------------------------------------------------------------------------------------------	
	
IF( sOutput @= '' & pSkipFile @= '0' );
	sOutput = 'No multiple parent duplication detected within "' | pDimension | '" dimension.';
	AsciiOutPut( cOutputFile, sOutput );
	IF( pOrphanCheck @= '1');
		sOutput = 'No orphan N elements detected within "' | pDimension | '" dimension.';
		AsciiOutPut( cOutputFile, sOutput );
	ENDIF;
	IF( pHierarchy @<> '' );
		sOutput = 'Within the hierachy "' | pHierarchy | '".';
		AsciiOutPut( cOutputFile, sOutput );
	ENDIF;
ENDIF;
	
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
