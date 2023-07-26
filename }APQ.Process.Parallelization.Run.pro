601,100
602,"}APQ.Process.Parallelization.Run"
562,"SUBSET"
586,"}APQ Processes"
585,"}APQ Processes"
564,
565,"ftj]]QzV;X<>0tq]4fGdtNkMCHGQIJaf91ownu2X]oAXoXIZDcmY`il0@YJYon85SWDD9p\RopVT_1_AxsoFABMM;?tX65cFDiE_VxKuW\wV>:UUeucG]I;ty?1AWjYEecg<LYANgx47cwhBTR`]hDyZZTOyCx;B5i[GjWW\Qb`h;=YZyY;rIvNShhf<mKTeb9J>>8mftj]]QtV;X<>0tq]4fGdtNkMCHGQIJav41ownu2X]oAXoXDZDcmY`il0@iGQonx:SWD40p\RopfV_o3_AxsoFABMM;_rX65cFDiuTVxKuW\wV>J._eucG]I;ty?1A\mYEueG9LYANgxt1cw8OTRpQhDyZZTOyCx;B5YWGj7]\Qb`X6=YZyY;rizNShhf<MIdab9J>>8m"
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
571,All
569,0
592,0
599,1000
560,8
pDoProcessLogging
pDebug
pProcess
pUseRunTIConfig
pClearHustle
pExecuteHustle
pWaitForHustle
pMaxHustleCalls
561,8
2
2
2
2
2
2
2
2
590,8
pDoProcessLogging,"1"
pDebug,"1"
pProcess,""
pUseRunTIConfig,"1"
pClearHustle,"1"
pExecuteHustle,"0"
pWaitForHustle,"0"
pMaxHustleCalls,"10"
637,8
pDoProcessLogging,"Log in process activity log"
pDebug,"Write debug logging"
pProcess,"Specific process to setup Hustle and RunTI files for. If blank then all processes"
pUseRunTIConfig,"If true use RunTI ini file. If false explicitly write out all connection params to command line"
pClearHustle,"Clear previous Hustle & RunTI files in prolog"
pExecuteHustle,"Execute the Hustle batch file on completion in epilog"
pWaitForHustle,"Force process to wait for hustle cmd line to finish before proceeding"
pMaxHustleCalls,"Maximum number of sequential Hustle processes to call"
577,1
vProcess
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
572,197
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

### Purpose:	Create a config file for TM1RunTI for parallel loading with Hustle
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Author
#    - Scott Wiltshire 20150320
# 
# Prerequisites for Parallel Loading
#    - Unique Subset in target process for dimension to Loop. If parallelization ele insufficient then append "TRIM(STR(RAND,100,10))"
#    - Unique View in target process.  If parallelization ele insufficient then append "TRIM(STR(RAND,100,10))"
#    - One User Account
#    - Max Connection = 0 for User Account
#    - Up to 20 parameters in the process to be run in parallel with RunTI (or else need to edit this process)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
IF( pProcess @= '' ); pProcess = 'ALL'; EndIF;
sProcLogParams = 'pUseRunTIConfig:' | pUseRunTIConfig |' & '| 'pProcess:' | pProcess |' & '| 'pClearHustle:' | pClearHustle |' & '| 'pExecuteHustle:' | pExecuteHustle;
sProcLogParams = sProcLogParams |' & '| 'pMaxHustleCalls:' | pMaxHustleCalls;
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

#~~~~~~~~~~~~~~~~~~~~~
# Inits / Declarations / Constants
#~~~~~~~~~~~~~~~~~~~~~
cDim                = '}APQ Processes';
cCubSettings        = '}APQ Settings';
cCubProcess_Info    = '}APQ Process Parameters Info';
cCubProcess_Parallel= '}APQ Process Parallelization Control';
cPrefixHustle       = 'Hustle_';
cPrefixRunTI        = 'TM1RunTI_';
cDelBat             = 'Bedrock.DeleteFile.bat';
sErr                = '';
cDebugFile          = CellGetS( cCubSettings, 'Location: Debugging', 'String' ) | GetProcessName | '_Debug';
sDebugFile          = cDebugFile | '_Prolog.txt';

#~~~~~~~~~~~~~~~~~~~~~
# Variables
#~~~~~~~~~~~~~~~~~~~~~
cHustle             = CellGetS( cCubSettings, 'Location: Hustle', 'String' );
cTM1RunTI           = CellGetS( cCubSettings, 'Location: TM1RunTI', 'String' );
cHustlePath         = CellGetS( cCubSettings, 'Location: Hustle Path', 'String' );
cTM1RunTIConfig     = CellGetS( cCubSettings, 'Location: TM1RunTI Config', 'String' );
cBatchPath          = CellGetS( cCubSettings, 'Location: Scripts', 'String' );
cAdminHost          = CellGetS( cCubSettings, 'TM1 Admin Host', 'String' );
cServerName         = CellGetS( cCubSettings, 'TM1 Server Name', 'String' );
cNoOfCPU            = CellGetS( cCubSettings, 'Max CPUs', 'String' );
IF( pUseRunTIConfig @= '0' );
  cUserNm           = CellGetS( cCubSettings, 'RunTIUser', 'String' );
  cUserPwd          = CellGetS( cCubSettings, 'RunTIPwd', 'String' );
EndIF;

IF( SubSt( cHustlePath, Long(cHustlePath), 1 ) @<> '\' ); cHustlePath = cHustlePath | '\'; EndIF;
IF( SubSt( cBatchPath, Long(cBatchPath), 1 ) @<> '\' ); cBatchPath = cBatchPath | '\'; EndIF;

#~~~~~~~~~~~~~~~~~~~~~
# Param Validation
#~~~~~~~~~~~~~~~~~~~~~
IF( pProcess @<> 'ALL' );
  IF( DimIx( cDim, pProcess ) = 0 );
    sErr = pProcess | ' is not a valid process.';
    IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
    EndIF;
    DatasourceType = 'NULL';
    ItemReject( sErr );
  EndIF;
EndIF;

IF( DimIx( cDim, pProcess ) = 0 & pExecuteHustle @= '1' );
  sErr = 'Executing hustle scripts is only recommended for a single named processs!!';
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
EndIF;

IF( pExecuteHustle @= '1' & ( pWaitForHustle @<> '0' & pWaitForHustle @<> '1' ) );
  sErr = 'pWaitForHustle can only be 1 or 0!';
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DatasourceType = 'NULL';
  ItemReject( sErr );
EndIF;

IF( pUseRunTIConfig @= '1' & FileExists( cTM1RunTIConfig ) = 0 );
  sErr = 'RunTI config file not found: ' | cTM1RunTIConfig;
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DatasourceType = 'NULL';
  ItemReject( sErr );
EndIF;

IF( FileExists( cTM1RunTI ) = 0 );
  sErr = 'RunTI not found: ' | cTM1RunTI;
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DatasourceType = 'NULL';
  ItemReject( sErr );
EndIF;

IF( FileExists( cHustle ) = 0 );
  sErr = 'Hustle not found: ' | cHustle;
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DatasourceType = 'NULL';
  ItemReject( sErr );
EndIF;

cTestVal1 = CellGetS( cCubSettings, 'Customer Key', 'String' );
cTestVal2 = DimNm( '}APQ Escape Characters', 1 );
cTestVal3 = CellGetS( cCubSettings, 'Customer Name', 'String' );
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;

#~~~~~~~~~~~~~~~~~~~~~
# Set data source
#~~~~~~~~~~~~~~~~~~~~~
DatasourceType              = 'SUBSET';
DatasourceNameForServer     = cDim;
DatasourceDimensionSubset   = 'ALL';
DatasourceASCIIDelimeter    = ' ';
DatasourceASCIIQuoteCharacter = '';

#~~~~~~~~~~~~~~~~~~~~~
# Clear Hustle & RunTI text files from prior runs
#~~~~~~~~~~~~~~~~~~~~~
IF( pClearHustle @<> '0' );

  IF( pProcess @<> 'ALL' );
    sHustleFilter = cPrefixHustle | pProcess | '.bat';
    sRunTIFilter = cPrefixRunTI | pProcess | '.txt';    
  Else;
    sHustleFilter = cPrefixHustle | cServerName | '*.bat';
    sRunTIFilter = cPrefixRunTI | cServerName | '*.txt';
  EndIF;

   IF( pDebug @>= '1' );
     AsciiOutput( sDebugFile, 'sHustleFilter', sHustleFilter );
     AsciiOutput( sDebugFile, 'sRunTIFilter', sRunTIFilter );
   EndIF;

  sDelBat = Char(34) | cBatchPath | cDelBat | Char(34);

  # Added by Marius 20160407
  sDelBatWithoutQuotes = cBatchPath | cDelBat;
  IF (FileExists( sDelBatWithoutQuotes ) = 0);
    sCmd = 'cmd /c echo DEL %1 > ' | sDelBat ;
    ExecuteCommand( sCmd , 1); 
  ENDIF;

  sDelParam = Char(34) | cHustlePath | sHustleFilter | Char(34);
  sCmd = sDelBat |' '| sDelParam;
   IF( pDebug @>= '1' );
     AsciiOutput( sDebugFile, 'Running cmd', sCmd );
   EndIF;
  ExecuteCommand( sCmd, 1 );
  sDelParam = Char(34) | cHustlePath | sRunTIFilter | Char(34);
  sCmd = sDelBat |' '| sDelParam;
   IF( pDebug @>= '1' );
     AsciiOutput( sDebugFile, 'Running cmd', sCmd );
   EndIF;
  ExecuteCommand( sCmd, 1 );

EndIF;

######################
### END Prolog
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,400
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
### Data Start

sDebugFile = cDebugFile | '_Data.txt';

#~~~~~~~~~~~~~~~~~~~~~
# SKIP if not Level 0
#~~~~~~~~~~~~~~~~~~~~~
IF( ELLEV( cDim, vProcess ) <> 0 );
   IF( pDebug @>= '1' );
     AsciiOutput( sDebugFile , 'Skipping not leaf:', vProcess );
   EndIF;       
   ItemSkip;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~
# SKIP if not a current process
#~~~~~~~~~~~~~~~~~~~~~
IF( DimIx( '}Processes', vProcess ) = 0 );
   IF( pDebug @>= '1' );
     AsciiOutput( sDebugFile , 'Skipping deleted process:', vProcess );
   EndIF;       
   ItemSkip;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~
# Check for specific process name
#~~~~~~~~~~~~~~~~~~~~~
IF( pProcess @<> 'ALL' );
  IF( vProcess @<> pProcess );
    IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile , 'Skipping not the specified process:', vProcess, pProcess );
    EndIF;       
    ItemSkip;
  Else;
    IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile , 'Name match!', vProcess, pProcess );
    EndIF;       
  EndIF;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~
# Parallel Config Variables
#~~~~~~~~~~~~~~~~~~~~~
sDimension = CellGetS( cCubProcess_Parallel, vProcess, 'Dimension' );
sHierarchy = CellGetS( cCubProcess_Parallel, vProcess, 'Hierarchy' );
nLevel = CellGetN( cCubProcess_Parallel, vProcess, 'Level' );
sParameterDim = CellGetS( cCubProcess_Parallel, vProcess, 'ParameterDim' );
sParameterEle = CellGetS( cCubProcess_Parallel, vProcess, 'ParameterEle' );
nNoOfParameters = CellGetN( cCubProcess_Info, vProcess, 'Total APQ Process Parameters', 'Count' );

#~~~~~~~~~~~~~~~~~~~~~
# SKIP if parallelization fields are not filled out (therefore parallelization is NOT enabled for the process)
#~~~~~~~~~~~~~~~~~~~~~
IF( sDimension @= '' % sHierarchy @= '' % ( sParameterDim @= '' & sParameterEle @= '' ) );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile , 'Skipping parallelization params not set:', vProcess, sDimension, sHierarchy, sParameterDim, sParameterEle );
  EndIF;       
  ItemSkip;
  Else;
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile , 'Hustle files will be created:', vProcess );
  EndIF;
ENDIF;

#~~~~~~~~~~~~~~~~~~~~~
# Process Variables
#~~~~~~~~~~~~~~~~~~~~~
sExportTM1RunTIFile = 'TM1RunTI_' | vProcess | '.txt';
sExportTM1RunTIFilePath = cHustlePath | sExportTM1RunTIFile;
sExportHustleFilePath = cHustlePath | 'Hustle_' | vProcess | '.bat';

#~~~~~~~~~~~~~~~~~~~~~
# Process Variables
#~~~~~~~~~~~~~~~~~~~~~
sP1_Name = CellGetS( cCubProcess_Info, vProcess, 'P1', 'Parameter' );
sP1_Value = CellGetS( cCubProcess_Info, vProcess, 'P1', 'Parallelization Default' );
sP1_Type = CellGetS( cCubProcess_Info, vProcess, 'P1', 'Type' );
sP1_Quote = IF( sP1_Type @= 'N', '', '"' );

sP2_Name = CellGetS( cCubProcess_Info, vProcess, 'P2', 'Parameter' );
sP2_Value = CellGetS( cCubProcess_Info, vProcess, 'P2', 'Parallelization Default' );
sP2_Type = CellGetS( cCubProcess_Info, vProcess, 'P2', 'Type' );
sP2_Quote = IF( sP2_Type @= 'N', '', '"' );

sP3_Name = CellGetS( cCubProcess_Info, vProcess, 'P3', 'Parameter' );
sP3_Value = CellGetS( cCubProcess_Info, vProcess, 'P3', 'Parallelization Default' );
sP3_Type = CellGetS( cCubProcess_Info, vProcess, 'P3', 'Type' );
sP3_Quote = IF( sP3_Type @= 'N', '', '"' );

sP4_Name = CellGetS( cCubProcess_Info, vProcess, 'P4', 'Parameter' );
sP4_Value = CellGetS( cCubProcess_Info, vProcess, 'P4', 'Parallelization Default' );
sP4_Type = CellGetS( cCubProcess_Info, vProcess, 'P4', 'Type' );
sP4_Quote = IF( sP4_Type @= 'N', '', '"' );

sP5_Name = CellGetS( cCubProcess_Info, vProcess, 'P5', 'Parameter' );
sP5_Value = CellGetS( cCubProcess_Info, vProcess, 'P5', 'Parallelization Default' );
sP5_Type = CellGetS( cCubProcess_Info, vProcess, 'P5', 'Type' );
sP5_Quote = IF( sP5_Type @= 'N', '', '"' );

sP6_Name = CellGetS( cCubProcess_Info, vProcess, 'P6', 'Parameter' );
sP6_Value = CellGetS( cCubProcess_Info, vProcess, 'P6', 'Parallelization Default' );
sP6_Type = CellGetS( cCubProcess_Info, vProcess, 'P6', 'Type' );
sP6_Quote = IF( sP6_Type @= 'N', '', '"' );

sP7_Name = CellGetS( cCubProcess_Info, vProcess, 'P7', 'Parameter' );
sP7_Value = CellGetS( cCubProcess_Info, vProcess, 'P7', 'Parallelization Default' );
sP7_Type = CellGetS( cCubProcess_Info, vProcess, 'P7', 'Type' );
sP7_Quote = IF( sP7_Type @= 'N', '', '"' );

sP8_Name = CellGetS( cCubProcess_Info, vProcess, 'P8', 'Parameter' );
sP8_Value = CellGetS( cCubProcess_Info, vProcess, 'P8', 'Parallelization Default' );
sP8_Type = CellGetS( cCubProcess_Info, vProcess, 'P8', 'Type' );
sP8_Quote = IF( sP8_Type @= 'N', '', '"' );

sP9_Name = CellGetS( cCubProcess_Info, vProcess, 'P9', 'Parameter' );
sP9_Value = CellGetS( cCubProcess_Info, vProcess, 'P9', 'Parallelization Default' );
sP9_Type = CellGetS( cCubProcess_Info, vProcess, 'P9', 'Type' );
sP9_Quote = IF( sP9_Type @= 'N', '', '"' );

sP10_Name = CellGetS( cCubProcess_Info, vProcess, 'P10', 'Parameter' );
sP10_Value = CellGetS( cCubProcess_Info, vProcess, 'P10', 'Parallelization Default' );
sP10_Type = CellGetS( cCubProcess_Info, vProcess, 'P10', 'Type' );
sP10_Quote = IF( sP10_Type @= 'N', '', '"' );

sP11_Name = CellGetS( cCubProcess_Info, vProcess, 'P11', 'Parameter' );
sP11_Value = CellGetS( cCubProcess_Info, vProcess, 'P11', 'Parallelization Default' );
sP11_Type = CellGetS( cCubProcess_Info, vProcess, 'P11', 'Type' );
sP11_Quote = IF( sP11_Type @= 'N', '', '"' );

sP12_Name = CellGetS( cCubProcess_Info, vProcess, 'P12', 'Parameter' );
sP12_Value = CellGetS( cCubProcess_Info, vProcess, 'P12', 'Parallelization Default' );
sP12_Type = CellGetS( cCubProcess_Info, vProcess, 'P12', 'Type' );
sP12_Quote = IF( sP12_Type @= 'N', '', '"' );

sP13_Name = CellGetS( cCubProcess_Info, vProcess, 'P13', 'Parameter' );
sP13_Value = CellGetS( cCubProcess_Info, vProcess, 'P13', 'Parallelization Default' );
sP13_Type = CellGetS( cCubProcess_Info, vProcess, 'P13', 'Type' );
sP13_Quote = IF( sP13_Type @= 'N', '', '"' );

sP14_Name = CellGetS( cCubProcess_Info, vProcess, 'P14', 'Parameter' );
sP14_Value = CellGetS( cCubProcess_Info, vProcess, 'P14', 'Parallelization Default' );
sP14_Type = CellGetS( cCubProcess_Info, vProcess, 'P14', 'Type' );
sP14_Quote = IF( sP14_Type @= 'N', '', '"' );

sP15_Name = CellGetS( cCubProcess_Info, vProcess, 'P15', 'Parameter' );
sP15_Value = CellGetS( cCubProcess_Info, vProcess, 'P15', 'Parallelization Default' );
sP15_Type = CellGetS( cCubProcess_Info, vProcess, 'P15', 'Type' );
sP15_Quote = IF( sP15_Type @= 'N', '', '"' );

sP16_Name = CellGetS( cCubProcess_Info, vProcess, 'P16', 'Parameter' );
sP16_Value = CellGetS( cCubProcess_Info, vProcess, 'P16', 'Parallelization Default' );
sP16_Type = CellGetS( cCubProcess_Info, vProcess, 'P16', 'Type' );
sP16_Quote = IF( sP16_Type @= 'N', '', '"' );

sP17_Name = CellGetS( cCubProcess_Info, vProcess, 'P17', 'Parameter' );
sP17_Value = CellGetS( cCubProcess_Info, vProcess, 'P17', 'Parallelization Default' );
sP17_Type = CellGetS( cCubProcess_Info, vProcess, 'P17', 'Type' );
sP17_Quote = IF( sP17_Type @= 'N', '', '"' );

sP18_Name = CellGetS( cCubProcess_Info, vProcess, 'P18', 'Parameter' );
sP18_Value = CellGetS( cCubProcess_Info, vProcess, 'P18', 'Parallelization Default' );
sP18_Type = CellGetS( cCubProcess_Info, vProcess, 'P18', 'Type' );
sP18_Quote = IF( sP18_Type @= 'N', '', '"' );

sP19_Name = CellGetS( cCubProcess_Info, vProcess, 'P19', 'Parameter' );
sP19_Value = CellGetS( cCubProcess_Info, vProcess, 'P19', 'Parallelization Default' );
sP19_Type = CellGetS( cCubProcess_Info, vProcess, 'P19', 'Type' );
sP19_Quote = IF( sP19_Type @= 'N', '', '"' );

sP20_Name = CellGetS( cCubProcess_Info, vProcess, 'P20', 'Parameter' );
sP20_Value = CellGetS( cCubProcess_Info, vProcess, 'P20', 'Parallelization Default' );
sP20_Type = CellGetS( cCubProcess_Info, vProcess, 'P20', 'Type' );
sP20_Quote = IF( sP20_Type @= 'N', '', '"' );


#~~~~~~~~~~~~~~~~~~~~~
# Export for TM1RunTI
#~~~~~~~~~~~~~~~~~~~~~
nCount = 1;
nDimSize = DIMSIZ( sDimension );
WHILE( nCount <= nDimSize );

   sElement = DIMNM( sDimension, nCount );

   nElementLevel = ELLEV( sDimension, sElement );
   nIsAncestor = ELISANC( sDimension, sHierarchy, sElement );
   IF( sElement @= sHierarchy ); nIsAncestor = 1; EndIF;

   # Determine which parameter to replace DIMENSION on which the parallelization will occurr
   IF( sP1_Name @= sParameterDim );
      sP1_Value = sDimension;
   ELSEIF( sP2_Name @= sParameterDim );
      sP2_Value = sDimension;
   ELSEIF( sP3_Name @= sParameterDim );
      sP3_Value = sDimension;
   ELSEIF( sP4_Name @= sParameterDim );
      sP4_Value = sDimension;
   ELSEIF( sP5_Name @= sParameterDim );
      sP5_Value = sDimension;
   ELSEIF( sP6_Name @= sParameterDim );
      sP6_Value = sDimension;
   ELSEIF( sP7_Name @= sParameterDim );
      sP7_Value = sDimension;
   ELSEIF( sP8_Name @= sParameterDim );
      sP8_Value = sDimension;
   ELSEIF( sP9_Name @= sParameterDim );
      sP9_Value = sDimension;
   ELSEIF( sP10_Name @= sParameterDim );
      sP10_Value = sDimension;
   ELSEIF( sP11_Name @= sParameterDim );
      sP11_Value = sDimension;
   ELSEIF( sP12_Name @= sParameterDim );
      sP12_Value = sDimension;
   ELSEIF( sP13_Name @= sParameterDim );
      sP13_Value = sDimension;
   ELSEIF( sP14_Name @= sParameterDim );
      sP14_Value = sDimension;
   ELSEIF( sP15_Name @= sParameterDim );
      sP15_Value = sDimension;
   ELSEIF( sP16_Name @= sParameterDim );
      sP16_Value = sDimension;
   ELSEIF( sP17_Name @= sParameterDim );
      sP17_Value = sDimension;
   ELSEIF( sP18_Name @= sParameterDim );
      sP18_Value = sDimension;
   ELSEIF( sP19_Name @= sParameterDim );
      sP19_Value = sDimension;
   ELSEIF( sP20_Name @= sParameterDim );
      sP20_Value = sDimension;
   ENDIF;

   # Determine which parameter to cycle ELEMENT SPLIT on which the parallelization will occurr
   IF( sP1_Name @= sParameterEle );
      sP1_Value = sElement;
   ELSEIF( sP2_Name @= sParameterEle );
      sP2_Value = sElement;
   ELSEIF( sP3_Name @= sParameterEle );
      sP3_Value = sElement;
   ELSEIF( sP4_Name @= sParameterEle );
      sP4_Value = sElement;
   ELSEIF( sP5_Name @= sParameterEle );
      sP5_Value = sElement;
   ELSEIF( sP6_Name @= sParameterEle );
      sP6_Value = sElement;
   ELSEIF( sP7_Name @= sParameterEle );
      sP7_Value = sElement;
   ELSEIF( sP8_Name @= sParameterEle );
      sP8_Value = sElement;
   ELSEIF( sP9_Name @= sParameterEle );
      sP9_Value = sElement;
   ELSEIF( sP10_Name @= sParameterEle );
      sP10_Value = sElement;
   ELSEIF( sP11_Name @= sParameterEle );
      sP11_Value = sElement;
   ELSEIF( sP12_Name @= sParameterEle );
      sP12_Value = sElement;
   ELSEIF( sP13_Name @= sParameterEle );
      sP13_Value = sElement;
   ELSEIF( sP14_Name @= sParameterEle );
      sP14_Value = sElement;
   ELSEIF( sP15_Name @= sParameterEle );
      sP15_Value = sElement;
   ELSEIF( sP16_Name @= sParameterEle );
      sP16_Value = sElement;
   ELSEIF( sP17_Name @= sParameterEle );
      sP17_Value = sElement;
   ELSEIF( sP18_Name @= sParameterEle );
      sP18_Value = sElement;
   ELSEIF( sP19_Name @= sParameterEle );
      sP19_Value = sElement;
   ELSEIF( sP20_Name @= sParameterEle );
      sP20_Value = sElement;
   ENDIF;

   # Clear Params in case last process had more params than current process
   sP1 = '';
   sP2 = '';
   sP3 = '';
   sP4 = '';
   sP5 = '';
   sP6 = '';
   sP7 = '';
   sP8 = '';
   sP9 = '';
   sP10 = '';
   sP11 = '';
   sP12 = '';
   sP13 = '';
   sP14 = '';
   sP15 = '';
   sP16 = '';
   sP17 = '';
   sP18 = '';
   sP19 = '';
   sP20 = '';

   # Format Parameters for Export
   IF( nNoOfParameters >= 1 );
      sP1 = sP1_Name | '=' | sP1_Quote | sP1_Value | sP1_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 2 );
      sP2 = sP2_Name | '=' | sP2_Quote | sP2_Value | sP2_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 3 );
      sP3 = sP3_Name | '=' | sP3_Quote | sP3_Value | sP3_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 4 );
      sP4 = sP4_Name | '=' | sP4_Quote | sP4_Value | sP4_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 5 );
      sP5 = sP5_Name | '=' | sP5_Quote | sP5_Value | sP5_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 6 );
      sP6 = sP6_Name | '=' | sP6_Quote | sP6_Value | sP6_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 7 );
      sP7 = sP7_Name | '=' | sP7_Quote | sP7_Value | sP7_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 8 );
      sP8 = sP8_Name | '=' | sP8_Quote | sP8_Value | sP8_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 9 );
      sP9 = sP9_Name | '=' | sP9_Quote | sP9_Value | sP9_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 10 );
      sP10 = sP10_Name | '=' | sP10_Quote | sP10_Value | sP10_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 11 );
   sP11 = sP11_Name | '=' | sP11_Quote | sP11_Value | sP11_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 12 );
      sP12 = sP12_Name | '=' | sP12_Quote | sP12_Value | sP12_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 13 );
      sP13 = sP13_Name | '=' | sP13_Quote | sP13_Value | sP13_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 14 );
      sP14 = sP14_Name | '=' | sP14_Quote | sP14_Value | sP14_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 15 );
      sP15 = sP15_Name | '=' | sP15_Quote | sP15_Value | sP15_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 16 );
      sP16 = sP16_Name | '=' | sP16_Quote | sP16_Value | sP16_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 17 );
      sP17 = sP17_Name | '=' | sP17_Quote | sP17_Value | sP17_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 18 );
      sP18 = sP18_Name | '=' | sP18_Quote | sP18_Value | sP18_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 19 );
      sP19 = sP19_Name | '=' | sP19_Quote | sP19_Value | sP19_Quote | ' ';
   ENDIF;
   IF( nNoOfParameters >= 20 );
      sP20 = sP20_Name | '=' | sP20_Quote | sP20_Value | sP20_Quote | ' ';
   ENDIF;

   # Setup Export
   IF( nIsAncestor = 1 & nElementLevel = nLevel );
      IF( pUseRunTIConfig @= '1' );
         sString = '"' | cTM1RunTI | '"' | ' -i ' | '"' | cTm1RunTIConfig | '"' | ' -process ' | '"' | vProcess | '"' | ' ' |
                     	sP1 | sP2 | sP3 | sP4 | sP5 | sP6 | sP7 | sP8 | sP9 | sP10 | sP11 | sP12 | sP13 | sP14 | sP15 | sP16 | sP17 | sP18 | sP19 | sP20;
      Else;
         sString = '"' | cTM1RunTI | '"' | ' -adminhost ' | '"' | cAdminHost | '"' | ' -server ' | '"' | cServerName | '"' | ' -user ' | '"' | cUserNm | '"' | ' -pwd ' | '"' | cUserPwd | '"' |
                     	' -process ' | '"' | vProcess | '"' | ' ' | sP1 | sP2 | sP3 | sP4 | sP5 | sP6 | sP7 | sP8 | sP9 | sP10 | sP11 | sP12 | sP13 | sP14 | sP15 | sP16 | sP17 | sP18 | sP19 | sP20;
      EndIF;
      # Write out the hustle control text file
      AsciiOutput( sExportTM1RunTIFilePath, sString );
   ENDIF;

   nCount = nCount + 1;

END;

# Write out the batch file to launch hustle
AsciiOutput( sExportHustleFilePath, '"' | cHustle | '"' | ' ' | '"' | sExportTM1RunTIFilePath | '"' | ' ' | cNoOfCPU );

######################
### END Data
575,62
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

sDebugFile = cDebugFile | '_Epilog.txt';

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Execute BAT Script
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
IF( pExecuteHustle @= '1' & sErr @= '' );
  nCount = 1;

  IF( pProcess @<> 'ALL' );
    sHustleFilter = cPrefixHustle | pProcess | '.bat';
  Else;
    sHustleFilter = cPrefixHustle | cServerName | '*.bat';
  EndIF;
  sFile = WildCardFileSearch( cHustlePath | sHustleFilter, '' );

  WHILE(sFile @<> '');
    
    IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile , 'Running cmd', cHustlePath | sFile );
    EndIF;

    ExecuteCommand('"' | cHustlePath | sFile | '"', StringToNumber( pWaitForHustle ) );
    sFile = WildCardFileSearch( cHustlePath | sHustleFilter, sFile );
    nCount = nCount + 1;
    IF(  nCount > StringToNumber( pMaxHustleCalls ) ); sFile = ''; EndIF;

  END; 

Else;
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile , 'pExecuteHustle=0' );
  EndIF;       
EndIF;

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
