601,100
602,"}APQ.Dim.Definition.Export.All"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,"apliqo_reader"
565,"h2Qs>8Usy_Nmedd36SD\J_y0zo6HKAGKxZjey9Dk7Sik6B1@0LGqL5ZB5ALq`ucOSGqFQ1qU0jAN_,{z3D\Krd[0=UJMNBGG[dl;]bpRFvm^PxADvvL<u6WFiS8U{`2rHO4KH>iSTZu\Ip\V`T53}h[YObvhW\vcz[hoXynXv6nBR:OrYU:8VKlw0n4SU2fANWXwp;m]"
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
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,5
pDoProcessLogging
pDebug
pExportPath
pTemplateType
pMatch
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pDebug,"0"
pExportPath,""
pTemplateType,"ByParentChild"
pMatch,"FIN*"
637,5
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pExportPath,"OPTIONAL: Export folder for the file (if blank defaults to the directory defined for Exports)"
pTemplateType,"OPTIONAL: ByParentChild for original template or ByRollup for new template (if blank, the default type will be ""ByParentChild"")"
pMatch,"Wildcard match (mandatory): string* = begins with, *string = ends with, string = contains, *string* = contains"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,166
##############################################################################################################
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
### PURPOSE:
### 	Export all dimensions/hierarchies with name match to file in apliqode framework format
### DATA SOURCE:
### 	NA
### INTENDED USAGE:
### 	Easy transport of metadata in csv format
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDebug:%pDebug% & pExportPath:%pExportPath% & pMatch:%pMatch%' );
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

# 		Standard naming convention for source and target cubes/dimensions
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
nErr            = 0;
sErr            = '';

sMatchType      = '';
bExport         = 0;

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

IF( pMatch @= '' );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No match string entered.';
ElseIF( Scan( '*', pMatch ) = 0 );
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

# Validate template type
If( pTemplateType @<> 'ByRollup' );
    pTemplateType = 'ByParentChild';
EndIf;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, Expand( 'MatchType=%sMatchType% MatchString=%pMatch%' ) );
   AsciiOutput( sDebugFile, '' );
EndIF;

### NOTES:
##1 Skip }ElementAttributes dimensions as these will be handled in dimension export

######################
### Dimensions

sDim = '}Dimensions';
nMax = DimSiz( sDim );
nCtr = 1;
While( nCtr <= nMax );
   bExport = 0;
   sEl = DimNm( sDim, nCtr );
   IF( sMatchType @= 'CONTAINS' & Scan( pMatch, sEl ) > 0 );
      bExport = 1;
   ElseIF( sMatchType @= 'STARTWITH' & Scan( pMatch, sEl ) = 1 );
      bExport = 1;
   ElseIF( sMatchType @= 'ENDWITH' & Scan( pMatch, sEl ) > 0 & Scan( pMatch, sEl ) = ( 1 + Long( sEl ) - Long( pMatch ) ) );
      bExport = 1;
   EndIF;
   IF( Scan( '}ElementAttributes_', sEl ) = 1 );
      # skip attribute dimensions 
      bExport = 0;
   EndIF;
   IF( bExport = 1 );
      IF( pDebug @>= '1' );
         AsciiOutput( sDebugFile, 'Exporting dimension: ' | sEl );
      EndIF;  
      IF( pDebug @<= '1' );
         ExecuteProcess( '}APQ.Dim.Definition.ExtractToFile', 'pDoProcessLogging', pDoProcessLogging, 
            'pDim', sEl, 'pExportPath', pExportPath, 'pExportFile', '', 'pTemplateType', pTemplateType, 'pDebug', pDebug 
         );
      EndIF;        
   EndIF;
   nCtr = nCtr + 1;
End;

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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
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
