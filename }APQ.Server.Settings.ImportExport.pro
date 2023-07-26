601,100
602,"}APQ.Server.Settings.ImportExport"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,"apliqo_reader"
565,"bNyc=4M`057Un=mEHtot9>OEc2KL>[FZhsaJ;w>7Z^osA\xKPsWasGEs?BcGQ4c7ERsVd<3q]vT8o]4JzoiUSru<d:lOW;I3kgs<=w\L:kkS7r:DVlEw4Lg>j5ztSV^[V@z5;A0C6muRAFBawe>mx^6N0_dL^M<T:r2bWCwre`f86G\<rP:w@qfGO0Z<Vb_HS]ym8[G"
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
From 	[apliqoC3].[salesforce].[T_CRM_D_Account];
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,9
pDoProcessLogging
pDebug
pFunction
pInclude
pExclude
pFolderName
pRulesBkp
pReAttacheRules
pUserInputOnly
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
pDoProcessLogging,"1"
pDebug,"0"
pFunction,"Export"
pInclude,""
pExclude,""
pFolderName,""
pRulesBkp,"0"
pReAttacheRules,"0"
pUserInputOnly,"1"
637,9
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pFunction,"Action to perform (Import or Export)?"
pInclude,"Include cubes in addition to APQ (blank = NONE) or specify the cubes to Import"
pExclude,"Exclude cubes (blank = NONE)"
pFolderName,"Sub-Folder name in the Export folder (blank = value of 'Location: Export' parameter from the }APQ Settings cube + datestamp)"
pRulesBkp,"Back-up rule files (1 - back-up, anything else - don't keep a back-up)"
pReAttacheRules,"Drop and re-attach rule file for Non APQ cubes (1 - Yes, anything else - No, don't touch the rule file)"
pUserInputOnly,"Only export cubes with potential for user input (Default: 1=True)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,290
##################################################################################################################
#Region Header
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##################################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	    COMMENT
### 2017-07-21 		    Ciprian Popa 	Creation of Process
##################################################################################################################
#Region @DOC
# Description:
# This process is used to either
# * export the contents of all (or selected via wildcard filter) **}APQ** cubes to the defined "export directory" folder
# * import any previously exported CSV files of **}APQ** cubes back to the target cubes
#
# Data Source: 
# All **}APQ** cubes or source files
# 
# Use Case: 
# * Back-up and restore the user driven input values in **}APQ** settings cubes
# * Prior to upgrade export data and import back after upgrade to preserv any custom settings or values 
#EndRegion @DOC
##################################################################################################################

##################################################################################################################
#Region Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pFunction:%pFunction% & pInclude:%pInclude% & pExclude:%pExclude% & pFolderName:%pFolderName% & pUserInputOnly:%pUserInputOnly%');
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
#EndRegion Logging
##################################################################################################################
#EndRegion Header
##################################################################################################################
### Prolog script commences

######################
### Inits - declare constants

cCubParam       = '}APQ Settings';
cDimCubes       = '}APQ Cubes';
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
cDelimiter      = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
cQuote          = Char(14);
nErr            = 0;
sErr            = '';

cAPQ            = '}APQ';
cAPQC3          = '}APQ C3';
cBlankRuleFileName = 'BLANKRULE.RUX';
cExcludeCubeList = sDelimEle | '}APQ Pulse User Login' | sDelimEle | '}APQ Pulse Workbook Tracker' | sDelimEle ;
cExcludeCubeDrill = '}CubeDrill_';
cExcludeCubePickList = '}PickList_';
cExcludeCubeAttr = '}ElementAttributes_';

pInclude        = TRIM( pInclude );
pExclude        = TRIM( pExclude );
pFolderName     = TRIM( pFolderName );

sDataFolder = CellGetS( cCubParam , 'Location: Data Dir', 'String');
If( SubSt( sDataFolder , Long( sDataFolder ), 1 ) @= '\' % SubSt( sDataFolder , Long( sDataFolder ), 1 ) @= '/' );
   sDataFolder = SubSt( sDataFolder, 1, Long( sDataFolder ) -1 );
EndIf;
sDefExportFolder = CellGetS( cCubParam , 'Location: Export', 'String');


######################
### Test parameters

IF( UPPER( pFunction ) @<>'IMPORT' & UPPER( pFunction ) @<>'EXPORT');
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid pFunction parameter value'; 
EndIF;

If( TRIM(pFolderName) @<> '' );
  If( SubSt( pFolderName, Long( pFolderName ), 1 ) @= '\' % SubSt( pFolderName, Long( pFolderName ), 1 ) @= '/' );
    pFolderName= SubSt( pFolderName, 1, Long( pFolderName ) -1 );
  EndIf;
  If( FileExists( sDefExportFolder | '\' | pFolderName ) = 0 & UPPER(pFunction) @= 'IMPORT' );
   If( pDebug @<> '0' );
     sMessage = 'Invalid file folder: ' | sDefExportFolder | '\' | pFolderName;
     AsciiOutput( sDebugFile, sMessage );
   EndIf;
   ProcessQuit;
  EndIf;

EndIf;

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Logic

nDimSz = DIMSIZ ( '}Cubes' );

If( TRIM(pFolderName) @= '' );
  sTimeStamp = TimSt( Now, '\Y\m\d' );
  sFolder = sDefExportFolder | '\APQ.Settings_' | sTimeStamp;
ELSE;
  sFolder = sDefExportFolder | '\' | TRIM(pFolderName);
EndIF;

IF( UPPER( pFunction ) @= 'EXPORT' );

  IF( FileExists (sFolder) = 0 );
    ExecuteCommand('cmd /c "MD ' | sFolder | '"', 1);
  EndIF;

# create the blank rule file
  sBlankRuleFile = sFolder | '\' | cBlankRuleFileName;
  ExecuteCommand('cmd /c "copy nul "' | sBlankRuleFile | '" "', 1);

  i = nDimSz;

  WHILE ( i > 0);
    vCub = DIMNM ( '}Cubes' , i);

    IF( pUserInputOnly @< '1' % ( pUserInputOnly @>= '1' & AttrS( cDimCubes, vCub, 'HASUSERINPUT' ) @= 'TRUE' ) );
    IF( (pExclude @='' % SCAN( UPPER( pExclude ), UPPER(vCub) ) = 0) & SCAN( sDelimEle | UPPER(vCub) | sDelimEle, UPPER(cExcludeCubeList) ) = 0 & SCAN( UPPER( cExcludeCubeDrill ), UPPER(vCub) ) = 0 & SCAN( UPPER( cExcludeCubePickList ), UPPER(vCub) ) = 0 );

      IF( ( pInclude @<>'' & SCAN( UPPER(pInclude), UPPER(vCub) ) > 0 ) % SCAN( cAPQ, UPPER(vCub) ) > 0 % SCAN( cAPQC3, UPPER(vCub) ) > 0 );

            IF ( FileExists ( sDataFolder | '\' | vCub | '.RUX' ) = 1 );

# Don't delete rules for the Included cubes if the pReAttacheRules is NOT =1
            IF( pInclude @<>'' & SCAN( UPPER(pInclude), UPPER(vCub) ) > 0 & pReAttacheRules @<>'1' );
            ELSE;
               sCmd = 'cmd /c "copy """' | sDataFolder | '\' | vCub | '.RUX"""  """' | sFolder | '\' | vCub | '.RUX.bkp""" "';
               ExecuteCommand('cmd /c "copy "' | sDataFolder | '\' | vCub | '.RUX"  "' | sFolder | '\' | vCub | '.RUX.bkp" "', 1);
               RuleLoadFromFile ( vCub, sBlankRuleFile );

	   If( pDebug @<> '0' );
	     sMessage = 'Back-up rules in ' | sFolder | '\' | vCub | '.RUX.bkp';
	     AsciiOutput( sDebugFile, sMessage );
	   EndIf;

            EndIF;
            EndIF;

	   If( pDebug @<> '0' );
	     sMessage = 'Export data in ' | sFolder | '\' | vCub | '.csv';
	     AsciiOutput( sDebugFile, sMessage );
	   EndIf;

       sProc = '}bedrock.cube.data.export';
       nRet = ExecuteProcess( sProc, 'pLogOutput', nDebug, 
		'pCube', vCub, 'pView', '', 'pFilter', '',
		'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
		'pSuppressRules', 1, 'pSuppressConsol', 1, 'pSuppressRules', 0,
		'pTemp', 1, 
		'pFilePath', sFolder, 'pFileName', vCub | '.csv',
		'pDelim', cDelimiter, 'pQuote', cQuote
       );

	   IF( nRet = ProcessExitNormal());
	     sMessage = 'Data export for the cube ' | vCub | ' finished successfully.';
	   ELSE;
	     sMessage = 'Data export for the cube ' | vCub | ' finished with errors.';
	     LogOutput( 'ERROR', sMessage );
	   EndIF;
	   If( pDebug @<> '0' );
	     AsciiOutput( sDebugFile, sMessage );
	   EndIf;

            IF ( FileExists(sFolder | '\' | vCub | '.RUX.bkp') = 1 );
               RuleLoadFromFile ( vCub, sFolder | '\' | vCub | '.RUX.bkp');
               IF ( pRulesBkp @<> '1' );
                 ExecuteCommand('cmd /c "del "' | sFolder | '\' | vCub | '.RUX.bkp" "', 1);
               EndIF;
            EndIF;

      EndIF;
    EndIF;
    EndIF;

  i=i-1;
  END;

ELSEIF( UPPER( pFunction ) @= 'IMPORT' );

  i = nDimSz;

  WHILE ( i > 0);
    vCub = DIMNM ( '}Cubes' , i);

#IF( ( pInclude @<>'' & SCAN( UPPER(pInclude), UPPER(vCub) ) > 0 ) % SCAN( cAPQ, UPPER(vCub) ) > 0 % SCAN( cAPQC3, UPPER(vCub) ) > 0 );
#
#IF ( FileExists ( sDataFolder | '\' | vCub | '.RUX' ) = 1 );

    sFile = sFolder | '\' | vCub | '.csv';
    IF( FileExists (sFile) = 0 );
      If( nDebug >= 1 );
        sMessage = 'Invalid source file specified: ' | sFile;
        AsciiOutput( sDebugFile, sMessage );
      EndIf;

    AsciiOutput( sFolder | '\Import Report ' | sTimeStamp | '.csv', vCub | ' - NOT Loaded');

    ELSEIF( ( pInclude @<>'' & SCAN( UPPER(pInclude), UPPER(vCub) ) > 0 ) % Trim(pInclude) @= '' );

    If( pDebug @<> '0' );
      sMessage = 'Start importing the data into ' | vCub;
      AsciiOutput( sDebugFile, sMessage );
    EndIf;

    sProc = '}bedrock.cube.data.import';
    nRet = ExecuteProcess( sProc, 'pLogOutput', nDebug, 
    		'pSrcDir', sFolder  | '\',
    		'pSrcFile', vCub | '.csv',
    		'pCube', vCub, 'pDim', '',
    		'pSrcEle', '', 'pTgtEle', '',
    		'pTitleRows', 1, 'pDelim', cDelimiter, 'pQuote', cQuote,
    		'pCumulate', 0
    );

    If( pDebug @<> '0' );
      IF( nRet = ProcessExitNormal());
        sMessage = 'Data import into the cube ' | vCub | ' finished successfully.';
      ELSE;
        sMessage = 'Data import into the cube ' | vCub | ' finished with errors.';
      EndIF;
      AsciiOutput( sDebugFile, sMessage );
    EndIf;

    AsciiOutput( sFolder | '\Import Report ' | sTimeStamp | '.csv', vCub | ' - Loaded');

    EndIF;

    i = i -1;
  END;


EndIF;

######################
### Assign data source

DataSourceType = 'NULL';

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,36
###################################################################################################################
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

# remove Blank rule file
AsciiDelete ( sBlankRuleFile);

##############################################################################################################
#Region Logging
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
#EndRegion Logging
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
