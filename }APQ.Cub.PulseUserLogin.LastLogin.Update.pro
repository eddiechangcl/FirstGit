601,100
602,"}APQ.Cub.PulseUserLogin.LastLogin.Update"
562,"ODBC"
586,"PulseDocs"
585,"PulseDocs"
564,"reader"
565,"c^9zCo@XGFqqC4@y4YJG\jETS75w0S2fF?XQAP<:Z9dPW6CL_vI9[kQ5wcff5N:ENFy1IPBM6s>UX3BNDYpWV;B0OP>0pU7LMx^arC2k8g7`z;kctzN7[8lu>>_Z96Acif3&M[lZWgz?toVf2sh$m2TWyMt^?6p@8K3cM]!]LBZg0hG780PYy$=M_ZQKudeo6>v[t8P_c^9lCo@XGFqqC4@y4YJG\jETS75w0S2fC?XQAP<:Z9dPWfAL_vI9[kQ5w3Qd5N:HNFy1IPBM6s>UXCBNDYpWV;B0OP>1pU7LMx^qtC2k8g7`z;;arzN7[8lu>>_ZyiNci6?6G[lZWgzoqoVF8shTg2TWyMt^?6p@8KcbM]ARLBZg`aG780PYyt8M_ZQKu4c?1>v[t8P_"
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
566,4
SELECT Id, ServerName, ServiceName, UserName, DisplayName, IsActive, IsAdmin, 
	IsReadOnly, LastUpdated, LastLogin
FROM Client
ORDER BY LastLogin Desc;
567,","
588,"."
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,4
pDoProcessLogging
pDebug
pServer
pQuote
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pDebug,"0"
pServer,""
pQuote,"'"
637,4
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pServer,"TM1 Service Name (If Blank then take from APQ Settings)"
pQuote,"Quote"
577,10
vId
vServerName
vServiceName
vUserName
vDisplayName
vIsActive
vIsAdmin
vIsReadOnly
vLastUpdated
vLastLogin
578,10
1
2
2
2
2
1
1
1
2
2
579,10
1
2
3
4
5
6
7
8
9
10
580,10
0
0
0
0
0
0
0
0
0
0
581,10
0
0
0
0
0
0
0
0
0
0
582,10
VarType=33ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,135

##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05 
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
#############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### PURPOSE:
### A 1 - 3 line description of what this process does goes here!
### 
### DATA SOURCE: ODBC (Pulse Monitor)
### 
### INTENDED USAGE: Loads the Last Login details from Pulse DB (Pulse Monitor) to the }APQ Pulse User login cube
### 
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2017-04-24 		Sayi          	Creation of Process
### 
### 
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pServer:' | pServer;
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
cCubTgt         = '}APQ Pulse User Login';
cCubParam       = '}APQ Settings';
cDim1           = '}APQ Time Year';
cDim2           = '}APQ Time Day in Year';
cDim3           = '}APQ Pulse ServerName';
CDim3Par        = 'Total APQ Pulse ServerName';
cDim4           = '}APQ Pulse Service Name';
cDim4Par        = 'Total APQ Pulse Service Name';
cDim5           = '}APQ Clients';
cDim6           = '}APQ Pulse User Login Measure';
cWinSerName     = CellGetS( cCubParam, 'Windows Service Name', 'String' );
cTM1SerName     = CellGetS( cCubParam, 'TM1 Server Name', 'String' );
nPulseCfg       = CellGetN( cCubParam, 'Pulse ODBC', 'Numeric' );
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cODBC           = CellGetS( cCubParam, 'Pulse ODBC', 'String' );
cODBCUser       = CellGetS( cCubParam, 'Pulse ODBC User', 'String' );
cODBCPwd        = CellGetS( cCubParam, 'Pulse ODBC Pwd', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';

### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

### Validate parameters

If( nPulseCfg <> 1 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Pulse is not installed'; 
Endif;

IF( CubeExists( cCubTgt ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid cube:' | cCubTgt; 
EndIF;

##Checking Server parameter, windows service name and TM1 server name
if( pServer @= '' );
   cServer = cWinSerName;
else;
   cServer = pServer;
endif;

### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DataSourceType = 'NULL';
  Itemreject(sErr);
EndIF;

### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

CubeSetLogChanges( cCubTgt, 0 );

### Assign data source
DataSourceType          = 'ODBC';
DataSourceNameForServer = cODBC ;
DatasourceUserName      = cODBCUser;
DatasourcePassword      = cODBCPwd;

#####Assigning ODBC Query
sQuery          = 'SELECT Id, ServerName, ServiceName, UserName, DisplayName, IsActive, IsAdmin, IsReadOnly, LastUpdated, LastLogin FROM Client WHERE ServiceName = ' | pQuote|cServer|pQuote | ' ORDER BY LastLogin Desc;';
DatasourceQuery = sQuery;

### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,49
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05 
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
#############################################################################################################################

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

sLastLogin = Subst(vLastLogin,1,10);
sYear = Subst(vLastLogin,1,4);
sCurrYear = Subst(Today(1),1,4);
sLastUpdated = Subst(vLastUpdated,1,10);

If( Dimix( cDim3, vServername ) = 0 );
   Itemskip;
Endif;

If( Dimix( cDim4, vServiceName ) = 0 );
   Itemskip;
Endif;

If( Dimix( cDim5, vUsername ) = 0 );
   Itemskip;
Endif;

If( Dimix( cDim1, sYear ) > 0); 
   CELLPUTS( sLastLogin , cCubTgt , sYear, 'D000', vServername , vServiceName, vUsername , 'Last Login' );
Else;
   CELLPUTS( '.. User not logged in.' , cCubTgt , sCurrYear, 'D000', vServername , vServiceName, vUsername , 'Last Login' );
Endif;


### END Data
575,37
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05 
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
#############################################################################################################################


#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';


### Reenable data transaction logging to the target cube
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
