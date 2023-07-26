601,100
602,"}APQ.Cub.Glossary.Update.Description"
562,"ODBC"
586,"Pulse.Docs.H2.DB"
585,"Pulse.Docs.H2.DB"
564,"READER"
565,"mDtd\PPs\XxWYzwTxU2NKy=O7]^ejdofuZ1ip9w=CuPjJ0dHbCIM[[?CY9cvNJ2iRpUd2an3etaEk=vqPANlk9[p_B3rwx5l5MNgB;?iaswQL77`rQ=8Zm7IwI1W4abGp;P MGnFBie2D_5iq^a(M;Qsj]3n4=[LjmbUcH%]Edp00u2BS0y9`!miN>8Ty<QeFiJQMQgQmDtd\PPs\XxWYlwTxU2NKy=O7]^ejdo6pZ1ip9w=CuPjJ`eHbCIM[[?CYIevNJbfRpUd5an3etQCk=rqPANlk9[p_B3wwx5l5MNWL;?iaswQL7gerQ=8Zm7IwI1WtagGp;^0EGnFBieRJ_5Iz^aXB;Qsj]3n4=[LjmbScHUREdp0`t2BS0y9`qeiN>8TylU5IiJQMQgQ"
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
566,3
SELECT ServerName,  ServiceName, 'Cube' As Type, Name, SubString(Description from 1 for 250) As Description1, SubString(Description from 251 for 250) As Description2, SubString(Description from 501 for 250) As Description3, SubString(Description from 751 for 250) As Description4, SubString(Description from 1001 for 250) As Description5 FROM "Cube"
WHERE ServiceName = 'cubewise_}APQ 
ORDER BY ServerName, ServiceName, Type, Name
567,","
588,"."
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,1
pDoProcessLogging
561,1
2
590,1
pDoProcessLogging,"1"
637,1
pDoProcessLogging,"Write log records to process logging cube?"
577,9
servername
servicename
type
name
description1
description2
description3
description4
description5
578,9
2
2
2
2
2
2
2
2
2
579,9
1
2
3
4
5
6
7
8
9
580,9
0
0
0
0
0
0
0
0
0
581,9
0
0
0
0
0
0
0
0
0
582,9
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,121
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
### Loads object descriptions from PULSE into the Glossary cube

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = '';
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
cCubTgt         = '}APQ Glossary';
cDimHTMLEntity  = '}APQ HTML Character Entity';
nHTMLEntities   = DimSiz( cDimHTMLEntity );
cProcessStart   = TimSt( Now, '\Y\m\d\h\i' );
sDebugFile      = GetProcessErrorFileDirectory | GetProcessName | cProcessStart | '_Debug.txt';
cCubSettings    = '}APQ Settings';
cTM1Svr         = CellGetS( cCubSettings, 'TM1 Server Name', 'String' );
cODBCSrc        = CellGetS( cCubSettings, 'Pulse ODBC', 'String' );
cODBCUsr        = CellGetS( cCubSettings, 'Pulse ODBC User', 'String' );
cODBCPwd        = CellGetS( cCubSettings, 'Pulse ODBC Pwd', 'String' );
cPulseVer       = CellGetS( cCubSettings, 'Pulse Version', 'String' );
# The minumum required length of description field entry to load to the glossary cube
cMinDescLen     = 10;
# Version switch where pulse H2 DB includes a HTMLTOTEXT function to strip html to plain text in the description field
cPulseVerSwitch = '5.1.0';
# Version switch where pulse includes a description field in the Application table
cPulseAppSwitch = '5.3.0';

## Set Datasource Query

IF( cPulseVer @< cPulseVerSwitch );

cODBCQuery = 
'SELECT ServerName,  ServiceName, ''Cube'' As Type, Name, SubString(Description from 1 for 250) As Description1, SubString(Description from 251 for 250) As Description2, SubString(Description from 501 for 250) As Description3, SubString(Description from 751 for 250) As Description4, SubString(Description from 1001 for 250) As Description5 FROM "Cube"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Dimension'' As Type, Name, SubString(Description from 1 for 250) As Description1, SubString(Description from 251 for 250) As Description2, SubString(Description from 501 for 250) As Description3, SubString(Description from 751 for 250) As Description4, SubString(Description from 1001 for 250) As Description5 FROM "Dimension"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Process'' As Type, Name, SubString(Description from 1 for 250) As Description1, SubString(Description from 251 for 250) As Description2, SubString(Description from 501 for 250) As Description3, SubString(Description from 751 for 250) As Description4, SubString(Description from 1001 for 250) As Description5 FROM "Process"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Chore'' As Type, Name, SubString(Description from 1 for 250) As Description1, SubString(Description from 251 for 250) As Description2, SubString(Description from 501 for 250) As Description3, SubString(Description from 751 for 250) As Description4, SubString(Description from 1001 for 250) As Description5 FROM "Chore"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
ORDER BY ServerName, ServiceName, Type, Name';

ElseIF( cPulseVer @>= cPulseVerSwitch & cPulseVer @< cPulseAppSwitch );

cODBCQuery = 
'SELECT ServerName,  ServiceName, ''Cube'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Cube"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Dimension'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Dimension"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Process'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Process"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Chore'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Chore"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
ORDER BY ServerName, ServiceName, Type, Name';

Else;

cODBCQuery = 
'SELECT ServerName,  ServiceName, ''Application'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Application"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Cube'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Cube"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Dimension'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Dimension"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Process'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Process"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
UNION 
SELECT ServerName,  ServiceName, ''Chore'' As Type, Name, SubString(HTMLTOTEXT(Description) from 1 for 250) As Description1, SubString(HTMLTOTEXT(Description) from 251 for 250) As Description2, SubString(HTMLTOTEXT(Description) from 501 for 250) As Description3, SubString(HTMLTOTEXT(Description) from 751 for 250) As Description4, SubString(HTMLTOTEXT(Description) from 1001 for 250) As Description5 FROM "Chore"
WHERE ServiceName = ' | Char(39) | cTM1Svr | Char(39) | '
ORDER BY ServerName, ServiceName, Type, Name';

EndIF;

## Assign Datasource

DataSourceType          = 'ODBC';
DatasourceNameForServer = cODBCSrc;
DatasourceUserName      = cODBCUsr;
DatasourcePassword      = cODBCPwd;
DataSourceQuery         = cODBCQuery;

### END Prolog

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,128
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

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

### Skip if Pulse has record of object that is since deleted

IF( Type @= 'Process' );
  sDim = '}APQ Processes';
Else;
  sDim = '}APQ ' | Type | 's';
EndIF;

IF( DimIx( sDim, Name ) = 0 );
  ItemSkip;
EndIF;

# ODBC driver limitation cuts strings at 256th character. Concatenate the description back together.  Allow for 1250 characters
sDescription = Description1 | Description2 | Description3 | Description4 | Description5;

IF( Long( Trim( sDescription ) ) > cMinDescLen );
  CellPutS( sDescription, cCubTgt, Type, Name, 'Description' );
Else;
  # Description in Pulse DB is shorter than the minimum parameter. Possibly a typo, skip loading.
  ItemSkip;
EndIF;

### Check the Pulse version. HTMLTOTEXT function introduced in v 5.1.0

IF( cPulseVer @>= cPulseVerSwitch );
  # The Description already loaded will already be clean
  ItemSkip;
Else;
  # Contine and clean the HTML via TI procedure
EndIF;

# First pass through description string remove html tags, i.e. everything between <tag> including the less and greater signs

sStartChar = '<';
sEndChar = '>';

#AsciiOutput( sDebugFile, '' );
#AsciiOutput( sDebugFile, Description );

sOrigDesc = sDescription;
sCleanDesc = '';
nStart = Scan( sStartChar, sOrigDesc );
nEnd = Scan( sEndChar, sOrigDesc );
nBreak = 1000;
iCount = 1;
While( nStart > 0 & nEnd - nStart > 0  );
#  AsciiOutput( sDebugFile, NumberToString( iCount ), NumberToString( nStart ), sOrigDesc );
  sCleanDesc = sCleanDesc | SubSt( sOrigDesc, 1, nStart - 1 );
#  AsciiOutput( sDebugFile, sCleanDesc );
  sOrigDesc = SubSt( sOrigDesc, nEnd + 1, Long( sOrigDesc ) - nEnd );
  nStart = Scan( sStartChar, sOrigDesc );
  nEnd = Scan( sEndChar, sOrigDesc );
  IF( nStart = 0 ); sCleanDesc = sCleanDesc | sOrigDesc; EndIF;
  iCount  = iCount  + 1;
  IF( iCount > nBreak ); nStart = 0; EndIF;
End;
 
#AsciiOutput( sDebugFile, '' );
sOrigDesc = sCleanDesc;
 
# Second pass through description string replacing html tags with the escaped characters
# HTML entity codes always begin with ampersand and end with semi-colon e.g. &nbsp; 
# If the remaining string which has already been stripped of html tags doesn't contain & or ; then skip the loop through the entity codes

IF( Scan( '&', sOrigDesc ) = 0 % Scan( ';', sOrigDesc ) = 0 );
  # nothing
Else;
  iEscCount = 1;
  While( iEscCount <= 2 );
    IF( iEscCount = 1 ); sEntityType = 'html entity code'; Else; sEntityType = 'html numeric code'; EndIF;
    iEntCount = 1;
    While( iEntCount <= nHTMLEntities );
      sEl = DimNm( cDimHTMLEntity, iEntCount );
      sEntity = AttrS( cDimHTMLEntity, sEl, sEntityType );
      IF( sEntity @= '' ); sEntity = '&' | sEl | ';'; EndIF;
      sChr = AttrS( cDimHTMLEntity, sEl, 'Character' );
      IF( sChr @= '' ); sChr = ' '; EndIF;
      nStart = Scan( sEntity, sOrigDesc );
      nEnd = nStart + Long( sEntity );
      iCount = 1;
      While( nStart > 0 );
#        AsciiOutput( sDebugFile, sEntity, NumberToString( iCount ), NumberToString( nStart ), sOrigDesc );
        sCleanDesc = SubSt( sOrigDesc, 1, nStart - 1 ) | sChr | SubSt( sOrigDesc, nEnd, Long( sOrigDesc ) );
#        AsciiOutput( sDebugFile, sEntity, NumberToString( iCount ), sCleanDesc );
        sOrigDesc = sCleanDesc;
        nStart = Scan( sEntity, sOrigDesc );
        nEnd = nStart + Long( sEntity );
        iCount = iCount  + 1;
        IF( iCount > nBreak ); nStart = 0; EndIF;
      End;
      # check if any more eescape codes left to be found
      IF( Scan( '&', sOrigDesc ) = 0 % Scan( ';', sOrigDesc ) = 0 );
        iEntCount = nHTMLEntities;
      EndIF;
      iEntCount = iEntCount + 1;
    End;
    iEscCount = iEscCount + 1;
  End;
 EndIF;

CellPutS( sCleanDesc, cCubTgt, Type, Name, 'Description' );

######################
### END Data
######################

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
