601,100
602,"}APQ.Server.Objects.Delete"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,"apliqo_reader"
565,"y51EKGA_Qzll2I6nWTuh23jU;ylDYTCD8ep7\iXic8DO>EAAzkYlqUh=>@L1<uj_6=4OA=<>OwA^7/k:<Vv6?:7e4uL]lr;hzoD3}Kg>cs_Qx=KDv2GGycftgyk<q@`x`D4G8zzY4H5RYNePPD]=}TN8G]Kx<9@Q2KoofIg8K:hoVZXXC=r7;J\uL0m4>9VI^GRL1E2v"
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
560,5
pDoProcessLogging
pDebug
pType
pMatch
pConfirm
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pDebug,"0"
pType,""
pMatch,"APQ.Demo*"
pConfirm,"0"
637,5
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pType,"Object type (optional): Blank=ALL otherwise specify cube, dimension, process, chore"
pMatch,"Wildcard match (mandatory): string* = begins with, *string = ends with, string = contains, *string* = contains"
pConfirm,"Confirm (mandatory): Must be 1 and override the default value of 0 to run. Safeguard against accidental usage"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,277
##############################################################################################################
#Region Header
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region @DOC
# Description:
# Delete all objects on server matching a given string e.g. APQ.Demo\* to remove all demo objects.
#
# Data Source:
# None.
#
# Use Case:
# * Cleanly remove demo application from fresh apliqode framework install. 
# * Can be used to remove any group of objects following a distinct naming convention.
#
# Warning:
# **TO BE USED WITH CAUTION!** Process accepts wildcard string and can be used to clean up a model by deleting any set of objects in bulk.
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region Logging
sThisProcName = GetProcessName();
### Params
IF( pMatch @= '' ); pMatch = 'APQ.Demo*'; EndIF;
sProcLogParams = Expand( 'pDebug:%pDebug% & pType:%pType% & pMatch:%pMatch% & pConfirm:%pConfirm%' );
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
##############################################################################################################
#EndRegion Header
##############################################################################################################
### Prolog script commences

######################
### Inits - declare constants

cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cDataDir        = CellGetS( cCubParam, 'Location: Data Dir', 'String' );
cDataDir        = cDataDir | IF( SubSt( cDataDir, Long( cDataDir ), 1 ) @<> '\', '\', '' );
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
nErr            = 0;
sErr            = '';

sMatchType      = '';
bDelete         = 0;
sFilter         = '';

######################
### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
   AsciiOutput( sDebugFile, '' );
EndIF;

######################
### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( pConfirm @<> '1' );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Confirm <> True!'; 
EndIF;

IF( pType @<> '' );
   IF( pType @<> 'Chore' & pType @<> 'Cube' & pType @<> 'Dimension' & pType @<> 'Process' );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid object type:' | pType; 
   EndIF;
EndIF;

IF( Scan( '*', pMatch ) = 0 );
   sMatchType = 'CONTAINS';
ElseIF( SubSt( pMatch, 1, 1 ) @= '*' & SubSt( pMatch, Long( pMatch ), 1 ) @= '*' );
   sMatchType = 'CONTAINS';
   pMatch = SubSt( pMatch, 2, Long( pMatch ) - 2 ); 
ElseIF( SubSt( pMatch, 1, 1 ) @<> '*' & SubSt( pMatch, Long( pMatch ), 1 ) @= '*' );
   sMatchType = 'STARTWITH';
   pMatch = SubSt( pMatch, 1, Long( pMatch ) - 1 ); 
ElseIF( SubSt( pMatch, 1, 1 ) @= '*' & SubSt( pMatch, Long( pMatch ), 1 ) @<> '*' );
   sMatchType = 'ENDWITH';
   pMatch = SubSt( pMatch, 2, Long( pMatch ) - 1 );
Else;
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Unknown match.';
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, Expand( 'MatchType=%sMatchType% MatchString=%pMatch%' ) );
   AsciiOutput( sDebugFile, '' );
EndIF;

IF( nErr > 0 );
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

### NOTES:
##1 As deleting objects traverse control dimensions in reverse
##2 Skip }ElementAttributes cubes & dimensions as these will be automatically deleted when the matching dimension is deleted. (This is handled internally within bedrock process)

######################
### Chores

IF( pType @= '' % pType @= 'Chore' );
   sDim = '}Chores';
   nMax = DimSiz( sDim );
   nCtr = nMax;
   While( nCtr >= 1 );
      bDelete = 0;
      sEl = DimNm( sDim, nCtr );
      IF( sMatchType @= 'CONTAINS' & Scan( pMatch, sEl ) > 0 );
         bDelete = 1;
      ElseIF( sMatchType @= 'STARTWITH' & Scan( pMatch, sEl ) = 1 );
         bDelete = 1;
      ElseIF( sMatchType @= 'ENDWITH' & Scan( pMatch, sEl ) > 0 & Scan( pMatch, sEl ) = ( 1 + Long( sEl ) - Long( pMatch ) ) );
         bDelete = 1;
      EndIF;
      sFile = cDataDir | sEl | '.cho';
      IF( FileExists( sFile ) = 0 );
         # Already deleted
         bDelete = 0;
         IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Chore already deleted: ' | sFile );
         EndIF;  
      EndIF;
      IF( bDelete = 1 );
         IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Deleting chore: ' | sFile );
         EndIF;  
         IF( pDebug @<= '1' );
            LogOutput( 'WARN', Expand( 'Deleting chore file %sFile% restart server to effect changes.' ) );
            AsciiDelete( sFile );
         EndIF;        
      EndIF;
      nCtr = nCtr - 1;
   End;
EndIF;

######################
### Cubes

IF( pType @= '' % pType @= 'Cube' );
    IF( sMatchType @= 'CONTAINS' );
        sFilter = '*' | pMatch | '*';
    ElseIF( sMatchType @= 'STARTWITH' );
        sFilter = '*' | pMatch;
    ElseIF( sMatchType @= 'ENDWITH' );
        sFilter = pMatch | '*';
    Else;
        sFilter = pMatch;
    EndIF;
    IF( pDebug @<= '1' );
        IF( Scan( '*', sFilter ) = 0 );
            LogOutput( 'WARN', Expand( 'Deleting cube %pMatch%' ) );
        Else;
            LogOutput( 'WARN', Expand( 'Deleting cube(s) matching filter: %pMatch%' ) );
        EndIF;
    EndIF;
    ExecuteProcess( '}bedrock.cube.delete', 'pLogOutput', nDebug, 'pCube', sFilter, 'pDelim', sDelimList, 'pCtrlObj', 1 );
EndIF;

######################
### Dimensions

IF( pType @= '' % pType @= 'Dimension' );
    IF( sMatchType @= 'CONTAINS' );
        sFilter = '*' | pMatch | '*';
    ElseIF( sMatchType @= 'STARTWITH' );
        sFilter = '*' | pMatch;
    ElseIF( sMatchType @= 'ENDWITH' );
        sFilter = pMatch | '*';
    Else;
        sFilter = pMatch;
    EndIF;
    IF( pDebug @<= '1' );
        IF( Scan( '*', sFilter ) = 0 );
            LogOutput( 'WARN', Expand( 'Deleting dimension %pMatch%' ) );
        Else;
            LogOutput( 'WARN', Expand( 'Deleting dimension(s) matching filter: %pMatch%' ) );
        EndIF;
    EndIF;
    ExecuteProcess( '}bedrock.hier.delete', 'pLogOutput', nDebug, 'pDim', sFilter, 'pHier', '*', 'pDelim', sDelimList );
    ExecuteProcess( '}bedrock.dim.delete', 'pLogOutput', nDebug, 'pDim', sFilter, 'pDelim', sDelimList );
EndIF;

######################
### Processes

IF( pType @= '' % pType @= 'Process' );
   sDim = '}Processes';
   nMax = DimSiz( sDim );
   nCtr = nMax;
   While( nCtr >= 1 );
      bDelete = 0;
      sEl = DimNm( sDim, nCtr );
      IF( sMatchType @= 'CONTAINS' & Scan( pMatch, sEl ) > 0 );
         bDelete = 1;
      ElseIF( sMatchType @= 'STARTWITH' & Scan( pMatch, sEl ) = 1 );
         bDelete = 1;
      ElseIF( sMatchType @= 'ENDWITH' & Scan( pMatch, sEl ) > 0 & Scan( pMatch, sEl ) = ( 1 + Long( sEl ) - Long( pMatch ) ) );
         bDelete = 1;
      EndIF;
      sFile = cDataDir | sEl | '.pro';
      IF( FileExists( sFile ) = 0 );
         # Already deleted
         bDelete = 0;
         IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Process already deleted: ' | sFile );
         EndIF;  
      EndIF;
      IF( bDelete = 1 );
         IF( pDebug @>= '1' );
            AsciiOutput( sDebugFile, 'Deleting process: ' | sFile );
         EndIF;  
         IF( pDebug @<= '1' );
            LogOutput( 'WARN', Expand( 'Deleting process file %sFile% restart server to effect changes.' ) );
            AsciiDelete( sFile );
         EndIF;        
      EndIF;
      nCtr = nCtr - 1;
   End;
EndIF;

######################
### Assign data source

DataSourceType = 'NULL';


######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,33
###############################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
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
