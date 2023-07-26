601,100
602,"}APQ.Dim.Alias.FillBlanks"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,"apliqo_reader"
565,"qx>h0B^CW7p3MgrOVybmTlozMb6>NaMYeYauivI2P`edK`lb0:;;Acqnv?xw:\W1UhuRCsO0Ki0fp`wTU3ivpzu<27SY6I8I:q^9]IesESUYqj\TPetL_kFl`3NRPiXMvdVbS<vJPmmCM507Q>U8]Of1aAnyW4Gm9O`rTWGVL=f?MyAQj3RKUa{K`OIh\A\mL0d:s]Z2"
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
560,4
pDoProcessLogging
pDebug
pDim
pAlias
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pDebug,"0"
pDim,""
pAlias,""
637,4
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pDim,"Wildcard Filter on dimensions to fill empty aliases. Blank = ALL"
pAlias,"Alias to update (exact match). Blank = ALL"
577,1
vDim
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
603,0
572,83
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

########################################################################################
### PURPOSE:
### 	In custom Rest front ends where Caption or Description alias or attribute is used for display if the alias is the same as principal and the cell in the }ElementAttribute cueb is empty then the display will be blank.
### 	Overcome this issue by populating blank alias velues with the principal element name
### DATA SOURCE: 
### 	Loop }Dimensions => Loop Elements => Loop Attributes
### INTENDED USAGE:
### 	Where alias value is blank, add the principal name 
########################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2017-09-21 		SW	 	Created
########################################################################################

######################
### Logging - common script 	###~ START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDim: %pDim% & pAlias: %pAlias%.' );
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

cDimSrc         = '}Dimensions';
cDimDims        = '}APQ Dimensions';
cCubParam       = '}APQ Settings';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nErr            = 0;
sErr            = '';

######################
### Debug

IF( pDebug @>= '1' );
   DatasourceASCIIDelimiter = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
   DatasourceASCIIQuoteCharacter = '';
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Assign data source

DataSourceType              = 'SUBSET';
DataSourceNameForServer     = cDimSrc;
DatasourceDimensionSubset   = 'ALL';

######################
### END Prolog
573,6

#****Begin: Generated Statements***
#****End: Generated Statements****



574,147
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
### Data script

sDebugFile = cDebugFile | '_Data.log';

######################
### Skips

# Need to handle hierarchies. For a given pDim should process all alternate hierarchies.
IF( pDim @<> '' );
  IF( Scan( Upper( pDim ), Upper( vDim ) ) = 0 );
    ItemSkip;
  EndIF;
EndIF;

sDimMain = vDim;
sHier = '';
IF( Scan( ':', vDim ) > 0 );
    sDimMain = SubSt( vDim, 1, Scan( ':', vDim ) - 1 );
    sHier = SubSt( vDim, Scan( ':', vDim ) + 1, Long( vDim ) - Scan( ':', vDim ) );
EndIF;

IF( CubeExists( '}ElementAttributes_' | sDimMain ) = 0 );
   nNumAttrs = 0;
   ItemSkip;
Else;
   nNumAttrs = DimSiz( '}ElementAttributes_' | sDimMain );
EndIF;

bContinue = 0;

IF( pAlias @<> '' );
   IF( DimIx( '}ElementAttributes_' | sDimMain, pAlias ) = 0 );
      ItemSkip;
   Else;
      bContinue = 1;
   EndIF;
Else;
   nAttr = 1;
   While( nAttr <= nNumAttrs );
      sAttr = DimNm( '}ElementAttributes_' | sDimMain, nAttr );
      IF( sAttr @= 'Caption' % DType( '}ElementAttributes_' | sDimMain, sAttr ) @= 'AA' );
         bContinue = 1;
      EndIF;
      nAttr = nAttr + 1;
   End;
EndIF;

IF( bContinue = 0 );
   ItemSkip;
EndIF;

######################
### Debug

IF( pDebug @>= '1' );
   sMsg = Expand( '%vDim% passed checks. Commencing scan for blank alias & caption values.' );
   AsciiOutput( sDebugFile, sMsg );
EndIF;

######################
### Loop all elements in dimension

nNumEles = DimSiz( vDim );
nEle = 1;
While( nEle <= nNumEles );
    sEle = DimNm( vDim, nEle );

   ### Logging - common script ( count per element not per dimension )
   IF( pDoProcessLogging @= '1' );
      nDataRecordCount = nDataRecordCount + 1;
   EndIF;

   ### Case: specific alias specified
   IF( DimIx( '}ElementAttributes_' | sDimMain, pAlias ) > 0 );
      sText = AttrS( vDim, sEle, pAlias );
      IF( sText @= '' );
         IF( pDebug @>= '1' );
            sMsg = Expand( '%pAlias% is blank for element %sEle%. Filling with principal name.' );
            AsciiOutput( sDebugFile, sMsg );
         EndIF;
         IF( sDimMain @= vDim );
             IF( pDebug @<= '1' & CellIsUpdateable( '}ElementAttributes_' | sDimMain, sEle, pAlias ) = 1 );
                AttrPutS( sEle, vDim, sEle, pAlias );
             EndIF;
         Else;
             # Use dim:hier with old AttrPutS but can't test with CellIsUpdateable as will recieve error for any element not in default hierarchy
#             IF( pDebug @<= '1' & CellIsUpdateable( '}ElementAttributes_' | sDimMain, sHier|':'|sEle, sHier|':'|pAlias ) = 1 );
                 AttrPutS( sEle, vDim, sEle, pAlias );
#             EndIF;
         EndIF;
      EndIF;
   EndIF;

   ### Case: no alias specified
   IF( pAlias @= '' );
      nAttr = 1;
      While( nAttr <= nNumAttrs );
         sAttr = DimNm( '}ElementAttributes_' | sDimMain, nAttr );
         IF( sAttr @= 'Caption' % DType( '}ElementAttributes_' | sDimMain, sAttr ) @= 'AA' );
            sText = AttrS( vDim, sEle, sAttr );
            IF( sText @= '' );
               IF( pDebug @>= '1' );
                  sMsg = Expand( '%sAttr% is blank for element %sEle%. Filling with principal name.' );
                  AsciiOutput( sDebugFile, sMsg );
               EndIF;
               IF( sDimMain @= vDim );
                   IF( pDebug @<= '1' & CellIsUpdateable( '}ElementAttributes_' | sDimMain, sEle, sAttr ) = 1 );
                      AttrPutS( sEle, vDim, sEle, sAttr );
                   EndIF;
               Else;
                   # Use dim:hier with old AttrPutS but can't test with CellIsUpdateable as will recieve error for any element not in default hierarchy
#                   IF( pDebug @<= '1' & CellIsUpdateable( '}ElementAttributes_' | sDimMain, sHier|':'|sEle, sHier|':'|pAlias ) = 1 );
                       AttrPutS( sEle, vDim, sEle, sAttr );
#                   EndIF;
               EndIF;
            EndIF;
         EndIF;
         # end loop on attributes
         nAttr = nAttr + 1;
      End;
   EndIF;

   # end loop on elements
   nEle = nEle + 1;
End;

IF( pDebug @>= '1' );
   sMsg = '';
   AsciiOutput( sDebugFile, sMsg );
EndIF;

######################
### END Data
575,35
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

sDebugFile = cDebugFile | '_Epilog.log';
IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Finished: ' | TimSt( Now, '\Y\m\d\h\i\s' ) );
EndIF;

### Logging - common script 	----------------- START
### ( Place as last code block on epilog )
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
