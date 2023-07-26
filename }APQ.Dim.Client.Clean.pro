601,100
602,"}APQ.Dim.Client.Clean"
562,"VIEW"
586,"}APQ User Last Active"
585,"}APQ User Last Active"
564,
565,"uD>=heQM6wMK=i2t4DkpHaKTQILZ0BAI`IPyv3ddMo?_Ou9Lm<LsHY=5kie\2:56Dns@d4Rz^X?mAt>v>l^tJgx6@3hXVX4jv5rS5MPOOj6Q3[Sfb25O?`P16X_8k;]x>lers4iV5@^raCKV7B>EuiYy]keSPx`1jH2xvY_hT<Nb=W]rs=_Tn<BP?kgGZtsltDmas`?c"
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
570,Default
571,All
569,0
592,0
599,1000
560,5
pDoProcessLogging
pDay
pSkipAdmin
pSkipNew
pDebug
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pDay,"90"
pSkipAdmin,"0"
pSkipNew,"0"
pDebug,"0"
637,5
pDoProcessLogging,"Record in process log"
pDay,"Delete all users with inactivity since more than pDay"
pSkipAdmin,"Optional: skip users in ADMIN group (e.g. even if inactivity exceeds limit users will not be removed)"
pSkipNew,"Optional: skip new users who have never logged in and don't have a last login timestamp recorded"
pDebug,"Debug (1/0) if debug=true then output a list of users to be deleted without actually deleting"
577,3
vClient
vMeasure
vValue
578,3
2
2
1
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
603,0
572,115
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
### Go through the cube }APQ User Last Active to detect inactive users since a long time and delete the account in TM1
### NOTE!! Only non Admin Client will be impacted : attribute Admin User in }APQ Clients dimension

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pDay:%pDay% & pSkipAdmin:%pSkipAdmin% & pSkipNew:%pSkipNew% & pDebug:%pDebug%') ;
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

### Inits - declare constants

cCubSrc         = '}APQ User Last Active';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cDimMeasure     = '}APQ User Last Active Measure';
cDimMeasureElSrc= 'Days Since Last Activity';
cDimMeasureLastConnect = 'Last Login';
cDimClient      = '}Clients';
cDimClientCopy  = '}APQ Clients';
cAttrTypeUser   = 'Admin User';
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '/', '/', '' );
cDefaultUser    = CellGetS( cCubParam, 'Default User', 'String' );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( pDay @= '0' % pDay @= '' );
  nErr = nErr + 1;
  sErr = 'Empty parameter pDay.';
EndIF;

### Debug parameters

IF( pDebug @>= '1' );
  cDebugFile = cDebugLoc | sThisProcName |'_debug_';
  sDebugFile = cDebugFile | 'prolog.csv';
  ASCIIOutput( sDebugFile,  'pDay', pDay );
EndIF;

######################
### Build the source view

sProc = '}bedrock.cube.view.create';
sFilter = cDimMeasure | sDelimEleStart | cDimMeasureElSrc;
bSuppressNull   = StringToNumber( pSkipNew );
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
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile, sErr ); ASCIIOutput( sDebugFile, 'Exiting.' );
  EndIF;
  ItemReject( sErr );
EndIF;

######################
### END Prolog
573,75
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
  nMetaDataRecordCount = nMetaDataRecordCount + 1;
EndIF;

######################
### MetaData script


IF( pDebug @>= '1' );
  sDebugFile = cDebugFile | 'metadata.csv';
EndIF;

# Skip if Client does not exist
IF( Dimix ( cDimClient, vClient ) = 0 );
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile,  'skipping', vClient, 'does not exist' );
  EndIF;
  ItemSkip;
EndIF;

# Skip the current user. Cannot delete self!
If( vClient @= TM1User() );
    ItemSkip;
EndIf;

# Skip if Client is an admin
IF( pSkipAdmin @= '1' );
  nTypeUser = AttrN( cDimClientCopy, vClient, cAttrTypeUser );
  IF ( nTypeUser <> 0 );
    IF( pDebug @>= '1' );
      ASCIIOutput( sDebugFile,  'skipping', vClient, 'admin user' );
    EndIF;
    ItemSkip;
  EndIF;
EndIF;

# Skip if the default user
IF( vClient @= cDefaultUser );
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile,  'skipping', vClient, 'default user' );
  EndIF;
  ItemSkip;
EndIF;

# Skip if the user did not connect yet (handled by pSkipNew parameter

# If inactivity day is higher than the parameter -> Delete Client
IF ( vValue > StringToNumber ( pDay ) );
  IF( pDebug @>= '1' );
    ASCIIOutput( sDebugFile,  'DELETE:', vClient, 'inactive > threshhold' );
  EndIF;
  IF( pDebug @<= '1' );
    sMsg = Expand('%sThisProcName%: deleting user %vClient% inactive > %pDay% day inactivity threshhold');
    LogOutput( 'INFO', sMsg );
    DimensionElementDelete ( cDimClient, vClient );
    DimensionElementDelete ( cDimClientCopy, vClient );
  EndIF;
EndIF;

######################
### END Metadata
574,7


#****Begin: Generated Statements***
#****End: Generated Statements****



575,27
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
