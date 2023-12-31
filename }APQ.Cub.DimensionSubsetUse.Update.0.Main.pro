601,100
602,"}APQ.Cub.DimensionSubsetUse.Update.0.Main"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,"apliqo_reader"
565,"h;X3=ldInbonQe9TDcO`yTs_?_G?srddQdOpspTwA@LH[r0S0?1diib;sLamgqFs5ctb\AI@65MdXGX>iejl656Cfe0c0Vg@e1ZmI]Xlm[a77hnIeO8_Y8qbz0ul^j2U]6=Q?OC:7ft\^kJJpGRG\eBA>V\n>1D]1?\RgreGNs:3g_abw`EkXPonN3qm8u1faB\[]Z`T"
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
pCube
pDim
pSub
pDebug
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pCube,""
pDim,""
pSub,""
pDebug,"0"
637,5
pDoProcessLogging,"Optional: Record in process log"
pCube,"Optional: Cube name. Use with caution! This process can take a long time to iterate folders and *.vue files. If cube name entered then the dimension & subset arguments are ignored and the process will loop through all dimensions of a given cube"
pDim,"Required: (unless giving cube name in which case ignorred). The dimension name. If given without subset parameter then ill loop through all subsets of  the dimension"
pSub,"Optional: Subset name: If given in combination with dimension then restricts search to a single dimension\subset"
pDebug,"Write debug log file?"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,309
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
### 	This process depending on the input parameters either analyses the subset -> view dependencies for: 
### 		- a single subset 
### 		- all subsets of a given dimension
### 		- all subsets of all dimensions of a given cube
### 	First one sub-process is called which generates and executes a batch script using findstr to locate all instances of a subset reference within all view files.
### 	Then a 2nd sub-process is called which reads the contents of the output file generated by the batch and writes the relationships to the analysis cube
### 	The sub-proceses run for a single dimension\subset combination and are called iteratively if a loop is required
### DATA SOURCE:
### 	None
### INTENDED USAGE:
### 	To assist in development and troubleshoting to determine in which views a subset is used. Partucularly for the use case where 
### 	a subset cannot be deleted due to being used in a view.
### NOTE:
###     Only catalogs subsets from same named hierarchy used in "traditional" views (*.vue files). Subset dependencies for subsets used in MDX views and Workspace views are not considdered.
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pCube:%pCube% & pDim:%pDim% & pSub:%pSub% & pDebug:%pDebug%' );
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

cCubTgt         = '}APQ Dimension Subset Use';
cDimTgt         = '}APQ Dimension Subsets';
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cScriptLoc      = CellGetS( cCubParam, 'Location: Scripts', 'String' );
cScriptLoc      = cScriptLoc | IF( SubSt( cScriptLoc, Long( cScriptLoc ), 1 ) @<> '\', '\', '' );
cExportLoc      = CellGetS( cCubParam, 'Location: Export', 'String' );
cExportLoc      = cExportLoc | IF( SubSt( cExportLoc, Long( cExportLoc ), 1 ) @<> '\', '\', '' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

cDimSub         = pDim | IF( pSub @<> '', '\', '' ) | pSub;
bDimUpdate      = 0;
cScriptFile     = 'FindSubsetInViews.bat';
cSourceFile     = 'FindSubsetInViews.txt';
sScriptFile     = cScriptLoc | cScriptFile;
sSourceFile     = cExportLoc | cSourceFile;
cSubLimit       = 50;

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Reset parameters

IF( pCube @<> '' );
   pDim = '';
   pSub = '';
EndIF;

######################
### Test parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

IF( pCube @<> '' & CubeExists( pCube ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid cube:' | pCube; 
EndIF;

IF( pCube @= '' );

   IF( DimensionExists( pDim ) = 0 );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDim;
   EndIF;

   IF( pSub @<> '' & DimensionExists( pDim ) = 1 );
      IF( SubsetExists( pDim, pSub ) = 0 );
          nErr = nErr + 1;
         sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid subset:' | pDim |'\'| pSub;
      EndIF;
   EndIF;

   IF( pSub @<> '' & pDim @= '' );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Cannot define subset without context of dimension!';
   EndIF;

EndIF;

IF( pCube @= '' & pDim @= '' & pSub @= '' );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No parameter values set!';
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Test framework

IF( pCube @<> '' );
   iDim = 1;
   While( TabDim( pCube, iDim ) @<> '' );
      sDim = TabDim( pCube, iDim );
      IF( DimIx( cDimTgt, sDim ) = 0 );
         bDimUpdate = 1;
      EndIF;
      iDim = iDim + 1;
   End;
EndIF;

IF( pDim @<> '' & pSub @= '' );
   IF( DimIx( cDimTgt, pDim ) = 0 );
      bDimUpdate = 1;
   EndIF;
EndIF;

IF( pSub @<> '' );
   IF( DimIx( cDimTgt, cDimSub ) = 0 );
      IF( DimIx( cDimTgt, pDim ) = 0 );
         DimensionElementInsertDirect( cDimTgt, '', pDim, 'C' );
         DimensionElementComponentAddDirect( cDimTgt, 'Total Dimensions', pDim, 1 );
      EndIF;
      DimensionElementInsertDirect( cDimTgt, '', cDimSub, 'N' );
      DimensionElementComponentAddDirect( cDimTgt, pDim, cDimSub, 1 );
      AttrPutS( pDim, cDimTgt, cDimSub, 'Dimension' );
      AttrPutS( pSub, cDimTgt, cDimSub, 'Subset' );
      DimensionUpdateDirect( cDimTgt );
   EndIF;
EndIF;

IF( bDimUpdate > 0 );
   sProc = '}APQ.Dim.ControlDimensionCopies.Update';
   ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging );
   sProc = '}APQ.Cub.DimensionSubsets.Update';
   ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging );
EndIF;

######################
### Switch transaction logging off 

CubeSetLogChanges( cCubTgt, 0 );

######################
### Perform zero out on the target cube using Bedrock process so analysisis up to date

sFilter = cDimTgt | sDelimEleStart;

IF( pCube @<> '' );
   iDim = 1;
   While( TabDim( pCube, iDim ) @<> '' );
      sDim = TabDim( pCube, iDim );
      sFilter = sFilter | sDim | sDelimEle;
      iDim = iDim + 1;
   End;
   sFilter = SubSt( sFilter, 1, Long( sFilter ) - 1 );
ElseIF( pDim @<> '' & pSub @= '' );
   sFilter = sFilter | pDim;
Else;
   sFilter = sFilter | cDimSub;
EndIF;

sProc      = '}bedrock.cube.data.clear';
ExecuteProcess( sProc, 'pLogOutput', nDebug,
    'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', sFilter,
    'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
    'pTemp', 1, 'pCubeLogging', 0
);

######################
### Clear any existing script & output files

# Done in 1st sub-process before re-generation

######################
### Loop the dimensions & subsets (if required)

# Can't wait for batch file to finish executing as sometimes FINDSTR can hang indefinately. Therefore need to put in sleep to allow for output file generation.
# The wait is handled in the sub-process. NOTE this is currently with wait for command = true (some risk of indefinate wait!)
# If cSubLimit exceeded then BREAK as if pCube or pDim given without pSub then will take too long to loop through all public subsets.

IF( pCube @<> '' );
   iDim = 1;
   While( TabDim( pCube, iDim ) @<> '' );
      sDim = TabDim( pCube, iDim );
      iSub = 1;
      nSubs = ElCompN( cDimTgt, sDim );
      IF( nSubs > cSubLimit );
         sErr = Expand( '%sDim% has %nSubs% public subsets. Aborting...' );
         IF( pDebug @>= '1' );
           AsciiOutput( sDebugFile, sErr );
         EndIF;
         ItemReject( sErr );
      EndIF;
      While( iSub <= nSubs );
         sHierSub = ElComp( cDimTgt, sDim, iSub );
         # only search for subset in views if same named hierarchy since only same named hierarchy can be used in traditional views
         If( Scan( sDim|':'|sDim, sHierSub ) = 1 );
             sSub = AttrS( cDimTgt, ElComp( cDimTgt, sDim, iSub ), 'Subset' );
             sProc = '}APQ.Cub.DimensionSubsetUse.Update.1.GenerateCmd';
             ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDim, 'pSub', sSub, 'pDebug', pDebug );
             If( FileExists( sSourceFile ) = 1 );
                sProc = '}APQ.Cub.DimensionSubsetUse.Update.2.FromOutputFile';
                ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDim', sDim, 'pSub', sSub, 'pDebug', pDebug );
             EndIf;
         EndIf;
         iSub = iSub + 1;
      End;
      iDim = iDim + 1;
   End;
   sFilter = SubSt( sFilter, 1, Long( sFilter ) - 1 );
ElseIF( pDim @<> '' & pSub @= '' );
   iSub = 1;
   nSubs = ElCompN( cDimTgt, pDim );
   IF( nSubs > cSubLimit );
      sErr = Expand( '%pDim% has %nSubs% public subsets. Aborting...' );
      IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, sErr );
      EndIF;
      ItemReject( sErr );
   EndIF;
   While( iSub <= nSubs );
      sHierSub = ElComp( cDimTgt, pDim, iSub );
      # only search for subset in views if same named hierarchy since only same named hierarchy can be used in traditional views
      If( Scan( pDim|':'|pDim, sHierSub ) = 1 );
          sSub = AttrS( cDimTgt, sHierSub, 'Subset' );
          sProc = '}APQ.Cub.DimensionSubsetUse.Update.1.GenerateCmd';
          ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDim', pDim, 'pSub', sSub, 'pDebug', pDebug );
          If( FileExists( sSourceFile ) = 1 );
             sProc = '}APQ.Cub.DimensionSubsetUse.Update.2.FromOutputFile';
             ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDim', pDim, 'pSub', sSub, 'pDebug', pDebug );
          EndIf;
      EndIf;
      iSub = iSub + 1;
   End;
Else;
   sProc = '}APQ.Cub.DimensionSubsetUse.Update.1.GenerateCmd';
   ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDim', pDim, 'pSub', pSub, 'pDebug', pDebug );
   IF( FileExists( sSourceFile ) = 1 );
      sProc = '}APQ.Cub.DimensionSubsetUse.Update.2.FromOutputFile';
      ExecuteProcess( sProc, 'pDoProcessLogging', pDoProcessLogging, 'pDim', pDim, 'pSub', pSub, 'pDebug', pDebug );
   EndIF;
EndIF;

######################
### Assign data source

DatasourceType = 'NULL';

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,38
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

######################
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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
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
