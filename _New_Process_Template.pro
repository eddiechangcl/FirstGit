601,100
602,"_New_Process_Template"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,"apliqo_reader"
565,"qKNuJXX?DJ_mUTP:@n5`]N7[g8RTfK7sS3n;mLm[gL33a}0b1GenTNQD\OAKobO3pk8k<EB;JXBDfmCPa]_FUM=C186C2Tn\zo<0M\ze1FZ2cjgIU`U`TOd^Yq8C_V`B9@uRODjQPz5>BHNiIz;q;7R`lvYq:8=YXUXbWo61UnmNjO=;AE?LH>84KC^^bxAbQ<SF`=Wm"
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
From 	TABLE
567,","
588,"."
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,2
pDoProcessLogging
pDebug
561,2
2
2
590,2
pDoProcessLogging,"1"
pDebug,"0"
637,2
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
577,1
vCub
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
572,262
#Region - Header
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################
# PURPOSE:
#    
# 
# DATA SOURCE:
#    
#
# REMARK:
#    none
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2020-09-07  Lingo               Refresh with APQ 3.4 + Bedrock 4
#   2020-09-30  Lingo				Refresh with APQ 3.5 + Bedrock 4.1.2
##############################################################################################################
#EndRegion - Header

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName(); sProcLogParams = '';
### Params
# If you want to explicitly choose yourself which parameters will be logged then set the sProcLogParams variable like in the example below
# sProcLogParams = Expand('pParam1:%pParam1% & pParam2:%pParam2% & pParam3:%pParam3% & pParamN:%pParamN%');
# If you leave the variable blank per the default value then all parameters will be automatically gathered from the system cube and inserted in the log
### Params
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQ Processes',sThisProcName)=0);DimensionElementInsertDirect('}APQ Processes','',sThisProcName,'N');DimensionElementComponentAddDirect('}APQ Processes','Total APQ Processes',sThisProcName,1);EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Initialize Logging
##############################################################################################################

### Prolog script commences

##############################################################################################################
#Region - Declare Constants
# Standard naming convention for source and target cubes/dimensions
cCubSrc         = 'my Source Cube';
cCubTgt         = 'my Target Cube';
cCubParam       = '}APQ Settings';
# If not using ODBC as source then delete this comment & the following 4 lines.Change the data source as needed (additional ODBC connection params can be defined in }APQ Settings)
cODBCParam      = 'ODBC Datasource';
cODBCSrc        = CellGetS( cCubParam, cODBCParam, 'String' );
cODBCUsr        = CellGetS( cCubParam, cODBCParam | 'User', 'String' );
cODBCPwd        = CellGetS( cCubParam, cODBCParam | 'Pwd', 'String' );
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
nDebug          = StringToNumber( pDebug );
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

DatasourceASCIIDelimiter        = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
DatasourceASCIIQuoteCharacter   = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );
#EndRegion - Declare Constants
##############################################################################################################

######################
### Log Process Response Message
# DELETE if NOT REQUIRED

If(DimIx('}APQ Clients', sProcessRunBy)=0 & DimIx('}Clients', sProcessRunBy)>0);DimensionElementInsertDirect('}APQ Clients', '', sProcessRunBy, 'N');EndIf;
If(DimIx('}APQ Processes', sThisProcName)=0 & DimIx('}Processes', sThisProcName)>0);DimensionElementInsertDirect('}APQ Processes', '', sThisProcName, 'N');EndIf;

If( DimIx('}APQ Clients', sProcessRunBy)>0 & DimIx('}APQ Processes', sThisProcName)>0);
  cCubRespMsg = '}APQ Process Response Message';
  cDTformat = CellGetS(cCubParam, 'Date Time format', 'String');
  CellPutS(TimSt(nProcessStartTime, cDTformat), cCubRespMsg, sProcessRunBy, sThisProcName, 'Start Time');
  CellPutS(sProcLogParams, cCubRespMsg, sProcessRunBy, sThisProcName, 'Parameters');
  CellPutS('Process running', cCubRespMsg, sProcessRunBy, sThisProcName, 'Status');
EndIf;

### End - Log Process Response Message
######################


######################
### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

##############################################################################################################
#Region - Test parameters

# Example:
#IF( CubeExists( pCube ) = 0 );
#   nErr = nErr + 1;
#   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid cube:' | pCube; 
#EndIF;
# Example:
#IF( DimensionExists( pDim ) = 0 );
#   nErr = nErr + 1;
#   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDim; 
#EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

#EndRegion - Test parameters
##############################################################################################################

######################
### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

#  Can be done either with CubeSetLogChanges or writing NO with CellPutS to }CubeProperties
#  No need to use CubeGetLogChanges, the dafault value should always be to log changes except when there is an explicit reason to disable (e.g. for performance during a bulk upload)
CubeSetLogChanges( cCubTgt, 0 );
# OR
# CellPutS( 'NO', '}CubeProperties', cCubTgt, 'LOGGING' );


##############################################################################################################
#Region - ZeroOut

sProc = '}bedrock.cube.data.clear';
# Set filter as per logic requirement of the ZeroOut
sFilter = 'Dim1' | sDelimEleStart | 'El1' | sDelimDim | 'Dim2' | sDelimEleStart | 'El1';
nRet = ExecuteProcess( sProc,
	'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', sFilter,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1, 'pLogOutput', nDebug 
);
If( nRet <> ProcessExitNormal() );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Error in ZeroOut.';
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIf;

#EndRegion - ZeroOut
##############################################################################################################

##############################################################################################################
#Region - Create DataSource

sProc   = '}bedrock.cube.view.create';
# Set filter as per logic requirement of the data source processing
sFilter = Expand('Dim1%sDelimEleStart%El1%sDelimEle%El2%sDelimEle%El3%sDelimDim%Dim2%sDelimEleStart%El1%sDelimEle%El2%sDelimDim%Dim3%sDelimEleStart%El1');
# Adjust parameters for skipping of blanks / consols / rule calcs as required
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 1;
nRet = ExecuteProcess( sProc,
	'pLogOutput', nDebug, 
	'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', cBedrockTmp
);
If( nRet <> ProcessExitNormal() );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Error in source view creation.';
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIf;

### In some cases simple 1 step bedrock view creation may not be sufficient (example when needing to process C elements and use leaf only subsets on most dimensions to prevent excessive processing load)
### In such cases assign these subsets to the view as a post step

# Example:
# Bedrock.Dim.Sib.Create supports lots of other options. It is only necassary to pass parameters differing from the default values
sProc = '}bedrock.hier.sub.create';
sProc   = '}bedrock.hier.sub.create';
nRet    = ExecuteProcess( sProc,
    'pLogOutput', nDebug,
    'pDim', 'my Dimension (should be a variable/constant not literal string)',
    'pHier', '',
    'pSub', cSubSrc,
    'pConsol', '',
    'pAttr', '',
    'pAttrValue', '',
    'pLevelFrom', 0,
    'pLevelTo', 0,
    'pExclusions', '',
    'pDelim', sDelimList,
    'pAddToSubset', 1,
    'pAlias', '',
    'pTemp', cBedrockTmp
);
If( nRet <> ProcessExitNormal() );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Error in source subset creation.';
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIf;
ViewSubsetAssign( cCubSrc, cViewSrc, 'my Dimension', cSubSrc );

######################
### Assign data source

# ------ >   delete the sections not needed depending on the type of data source  < ------

# ------ >  Cube View
DatasourceType          = 'VIEW';
DatasourceNameForServer = cCubSrc;
DatasourceCubeView      = cViewSrc;
# ------ >  Dimension Subset
#DatasourceType             = 'SUBSET';
#DatasourceNameForServer    = cDimSrc;
#DatasourceDimensionSubset  = cSubSrc;
# ------ >  Text
#DatasourceType                 = 'CHARACTERDELIMITED';
#DatasourceNameForServer        = cSrcFile;
#DatasourceASCIIDelimiter       = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
#DatasourceASCIIDecimalSeparator= CellGetS( cCubParam, 'DatasourceASCIIDecimalSeparator', 'String' );
#DatasourceASCIIQuoteCharacter  = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );
# ------ >  ODBC
#DatasourceType         = 'ODBC';
#DatasourceNameForServer= cODBCSrc;
#DatasourceUserName     = cODBCUsr;
#DatasourcePassword     = cODBCPwd;
## If ODBC data source either set the query directly in the prolog with sODBCQry variable or ?pParam? modification to the query defined in the data source tab
#DatasourceQuery        = sODBCQry;

#EndRegion - Create DataSource
##############################################################################################################

######################
### END Prolog
573,19
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script



######################
### END Metadata
574,32
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' );nDataRecordCount = nDataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

## No explicit rules for coding on metadata and data tabs except for
## 1/ write code properly, NEVER use the mapping wizards regardless of old TI editor or Performance Modler:
## 2/ observe Hungarian notation:
## 	pVariable is reserved for parameters declared on the Parameters Tab
## 	cVariable is reserved for constants declared on the Prolog (csVariable & cnVariable if you are pedantic)
## 	vVariable is reserved for variables defined as data source columns
## 	nVariable & sVariable for variables created on the metadata or data tabs 
## 	iCtr is used for integer looping in while loops. Don't just use i or iCount, make it obvious WHAT is being counted
## 3/ don't use Ctrl + i for indenting as the tabs are too wide.  Use double or tripple space per indent
## 4/ make sure code is well commented. Variable names should be self commenting, any other developer reading your code should be able to understand it with little effort
##     Short 1-2 lines of comment before each major block describing the purpose. 1 line before each While describing what is being looped
## 5/ If do action is needed on EITHER the metadata or data tab(s) then make sure there is no code present on the tab to prevent unecessary double processing of the data source
##     ( this includes logging record counters which shoudl be removed if not needed )


######################
### END Data
575,61
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK TURBOINTEGRATOR TEMPLATE
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

######################
### Delete the data source processing view and subset objects from the system

If( cBedrockTmp = 0 );
    sProc = '}bedrock.cube.viewandsubsets.delete';
    ExecuteProcess( sProc, 
    	'pCube', cCubSrc, 'pView', cViewSrc, 'pSub', cSubSrc,
    	'pMode', 1, 'pLogOutput', nDebug 
    );
EndIf;

######################
### Reenable data transaction logging to the target cube

CubeSetLogChanges( cCubTgt, 1 );
# OR
# CellPutS( 'YES', '}CubeProperties', cCubTgt, 'LOGGING' );

##############################################################################################################
#Region - Finalize Logging
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime=Now();sProcessErrorLogFile=GetProcessErrorFileName;sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessFinishTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessFinishTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessCompletedFlag');
  CellPutN(nMetaDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataRecordCount');CellPutN(nDataRecordCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataRecordCount');
  CellPutN(PrologMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nPrologMinorErrorCount');CellPutN(MetadataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nMetaDataMinorErrorCount');
  CellPutN(DataMinorErrorCount,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nDataMinorErrorCount');CellPutN(ProcessReturnCode,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessReturnCode');
  CellPutS(sProcessErrorLogFile,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sProcessErrorLogFile');nCountTime=nCountTime+1;End;
  If(nDataRecordCount>0);If(cCubTgt@<>'');CellPutN(nProcessFinishTime,sCubLogCube,cCubTgt,'nLastTimeUpdate');CellPutS(sThisProcName,sCubLogCube,cCubTgt,'sProcess');CellPutS(sProcessRunBy,sCubLogCube,cCubTgt,'sProcessRunBy');EndIf;EndIf;
EndIF;

######################
### Log Process Response Message
# DELETE if NOT REQUIRED

If( DimIx('}APQ Clients', sProcessRunBy)>0 & DimIx('}APQ Processes', sThisProcName)>0);
  CellPutS(TimSt(nProcessFinishTime, cDTformat), cCubRespMsg, sProcessRunBy, sThisProcName, 'Finish Time');
  CellPutS('Process finished', cCubRespMsg, sProcessRunBy, sThisProcName, 'Status');
  CellPutS('Success message', cCubRespMsg, sProcessRunBy, sThisProcName, 'Success Message');
  CellPutS('Failure message', cCubRespMsg, sProcessRunBy, sThisProcName, 'Failure Message');
  CellPutS(sProcessErrorLogFile, cCubRespMsg, sProcessRunBy, sThisProcName, 'TM1ProcessError File');
EndIf;

### End - Log Process Response Message
######################

#EndRegion - Finalize Logging
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
