601,100
602,"}APQ.Cub.DimensionSemiDynamicSubsets.Import"
562,"CHARACTERDELIMITED"
586,
585,"}Cubes"
564,
565,"wJwO280\3Q:AM8Qo9T?o47Qaz?SH8<hqq_JDE8eIHY?lNsiFEB>owqTXff0c^g]Lw1p1ih0jgkcsudM_P^odxpzx]yJL==__FIFYu16rS[ZH3byouzoQBf:=<G]P?Thk]WJE^Yf1rsrfTbBxuCLvwSqTdd?ptzeotdn6OhqDDp_5?W<:G\;rqrxhAoyAvqNadY[vWWOK"
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
589,","
568,""""
570,
571,All
569,1
592,0
599,1000
560,4
pPreserveUnique
pSourceFile
pDelim
pQuote
561,4
2
2
2
2
590,4
pPreserveUnique,"1"
pSourceFile,""
pDelim,""
pQuote,""
637,4
pPreserveUnique,"Optional: Preserve existing entries not present in the import file"
pSourceFile,"Optional: full path to source file (if omitted then assume defined import directory and standard export file name)"
pDelim,"Optional: text file field delimiter (if blank uses the standard character used in Server.Settings.ImportExport, otherwise the defined character)"
pQuote,"Optional: text file quote character (if blank uses the standard character used in Server.Settings.ImportExport, otherwise the defined character)"
577,5
vCube
vDim
vItem
vMeasure
vValue
578,5
2
2
2
2
2
579,5
1
2
3
4
5
580,5
0
0
0
0
0
581,5
0
0
0
0
0
582,5
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,181
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
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	    COMMENT
### 2020-06-15 		    SW 	            Creation of Process
##############################################################################################################
#Region @DOC
# Description:
#   This process imports data while preserving data alredy in the cube which is not present in the source file. The process does this by matching on 
#   a key of hierarchyName.subsetName for a given dimension and allocating the item index value of the matched key. If the key is not found in the existing definitions then the first 
#   unused item index will be allocated to the subset. 
# Data Source:
#   Text file created by bedrock.cube.data.export
# Use Case:
#   Import subset definitions _without overwriting subsets which exist on target instance but are not present in the source file._
# Note:
#   The processing logic assumes that: 
#       1. the export processing order of the dimensions is dim > item > measure. **The cube cannot be re-ordered** or this logic will break!  
#       2. _that **SubsetName** (and Hierarchy) variables must be encountered **before** any of the other variables which need to be written to the cube._ 
#       3. logic for determining uniqueness and allocating index ID assumes no break in used item indicies
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName(); pDoProcessLogging = '1';
### Params
sProcLogParams = Expand('pPreserveUnique:%pPreserveUnique% & pSourceFile:%pSourceFile% & pDelim:%pDelim% & pQuote:%pQuote%');
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
#EndRegion - Header
##############################################################################################################

##############################################################################################################
#Region - Declare constants
cCubTgt         = '}APQ Dimension SemiDynamic Subsets';
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
cImportLoc      = CellGetS( cCubParam, 'Location: Source Data', 'String' );
cImportLoc      = cImportLoc | IF( SubSt( cImportLoc, Long( cImportLoc ), 1 ) @<> '\', '\', '' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

# Initialize custom data variables
nLastUpdate     = 0;
nItem           = 1;
sItem           = '';
sHier           = '';
sSub            = '';
sAlias          = '';
sFreq           = '';
sWkDay          = '';
sBaseEle        = '';
sType           = '';
sDynamic        = '';
sMDXExpr        = '';
sDesc           = '';
sKey            = '';
#EndRegion - Declare constants
##############################################################################################################

######################
### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

##############################################################################################################
#Region - Test parameters

# Is framework licensed?
If( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Customer key not found!';
EndIf;

# Preserve existing unique entries
If( pPreserveUnique @<> '0' & pPreserveUnique @<> '' );
    pPreserveUnique = '1';
EndIf;

# Source file
If( pSourceFile @= '' );
    pSourceFile = cImportLoc | cCubTgt | '.csv';
EndIf;
If( FileExists( pSourceFile ) = 0 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('File not found: %pSourceFile%');
EndIf;

# delimiter
If( pDelim @= '' );
    DatasourceASCIIDelimiter = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
Else;
    DatasourceASCIIDelimiter = pDelim;
EndIf;

# quote
If( pQuote @= '' );
    DatasourceASCIIQuoteCharacter = Char(14);
Else;
    DatasourceASCIIQuoteCharacter = pQuote;
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

#EndRegion - Test parameters
##############################################################################################################

CubeSetLogChanges( cCubTgt, 1 );

######################
### Assign data source

DataSourceType                 = 'CHARACTERDELIMITED';
DataSourceNameForServer        = pSourceFile;

#EndRegion - Define data source
##############################################################################################################

##############################################################################################################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,141
##################################################################################################################
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
### Logging - common script

nDataRecordCount = nDataRecordCount + 1;
sDebugFile = cDebugFile | '_Data.log';

##################################################################################################################
### Data script

# skip all other non-data entry measures
If( vMeasure    @= 'IsUsedCount' % vMeasure @= 'NumberOfElements' % vMeasure @= 'LastConstructN' % vMeasure @= 'ConstructTimeN' % vMeasure @= 'LastConstruct' % vMeasure @= 'ConstructTime' % vMeasure @= 'HasError'  % vMeasure @= 'HierarchyUsed' );
    ItemSkip;
EndIf;

# If overwriting and not presving existing subsets just overwrite directly
If( pPreserveUnique @= '0' );
    If( CellIsUpdateable( cCubTgt, vDim, vItem, vMeasure ) = 1 );
        CellPutS( vValue, cCubTgt, vDim, vItem, vMeasure );
    EndIf;
    ItemSkip;
EndIf;

# Send data & reset variables
# NOTE: If exported with rule values then IsUsedCount will be the first measure, if only input values then Hierarchy is first (if used) else SubsetName. 
#       However, Hierarchy is optional so we need to cover cases where Hierarchy is first measure and where SubsetName is first
If( sItem   @<> '' & vMeasure @= 'Hierarchy' & sSub @<> '' );
    # update cube values
    CellPutS( sHier, cCubTgt, vDim, sItem, 'Hierarchy' );
    CellPutS( sSub, cCubTgt, vDim, sItem, 'SubsetName' );
    CellPutS( sDesc, cCubTgt, vDim, sItem, 'Description' );
    CellPutS( sAlias, cCubTgt, vDim, sItem, 'AliasToSet' );
    CellPutS( sFreq, cCubTgt, vDim, sItem, 'RegenerationFrequency' );
    If( CellIsUpdateable( cCubTgt, vDim, sItem, 'RegenerationDay' ) = 1 );
        CellPutS( sWkDay, cCubTgt, vDim, sItem, 'RegenerationDay' );
    EndIf;
    CellPutS( sDynamic, cCubTgt, vDim, sItem, 'KeepSubsetDynamic' );
    CellPutS( sBaseEle, cCubTgt, vDim, sItem, 'AutomatedMDXBaseElement' );
    CellPutS( sType, cCubTgt, vDim, sItem, 'AutomatedMDXType' );
    If( CellIsUpdateable( cCubTgt, vDim, sItem, 'SubsetExpression' ) = 1 );
        CellPutS( sMDXExpr, cCubTgt, vDim, sItem, 'SubsetExpression' );
    EndIf;
    # reset variables
    nLastUpdate = nDataRecordCount;
    nItem       = 1;
    sItem       = '';
    sHier       = vValue;
    sSub        = '';
    sAlias      = '';
    sFreq       = '';
    sWkDay      = '';
    sBaseEle    = '';
    sType       = '';
    sDynamic    = '';
    sMDXExpr    = '';
    sDesc       = '';
    sKey        = '';
ElseIf( sItem   @<> '' & vMeasure @= 'SubsetName' & nDataRecordCount > nLastUpdate + 1 );
    # update cube values
    CellPutS( sHier, cCubTgt, vDim, sItem, 'Hierarchy' );
    CellPutS( sSub, cCubTgt, vDim, sItem, 'SubsetName' );
    CellPutS( sDesc, cCubTgt, vDim, sItem, 'Description' );
    CellPutS( sAlias, cCubTgt, vDim, sItem, 'AliasToSet' );
    CellPutS( sFreq, cCubTgt, vDim, sItem, 'RegenerationFrequency' );
    If( CellIsUpdateable( cCubTgt, vDim, sItem, 'RegenerationDay' ) = 1 );
        CellPutS( sWkDay, cCubTgt, vDim, sItem, 'RegenerationDay' );
    EndIf;
    CellPutS( sDynamic, cCubTgt, vDim, sItem, 'KeepSubsetDynamic' );
    CellPutS( sBaseEle, cCubTgt, vDim, sItem, 'AutomatedMDXBaseElement' );
    CellPutS( sType, cCubTgt, vDim, sItem, 'AutomatedMDXType' );
    If( CellIsUpdateable( cCubTgt, vDim, sItem, 'SubsetExpression' ) = 1 );
        CellPutS( sMDXExpr, cCubTgt, vDim, sItem, 'SubsetExpression' );
    EndIf;
    # reset variables
    nLastUpdate = nDataRecordCount;
    nItem       = 1;
    sItem       = '';
    sHier       = '';
    sSub        = vValue;
    sAlias      = '';
    sFreq       = '';
    sWkDay      = '';
    sBaseEle    = '';
    sType       = '';
    sDynamic    = '';
    sMDXExpr    = '';
    sDesc       = '';
    sKey        = '';
EndIf;

# set variables
If( vMeasure    @= 'Hierarchy' );
    sHier       = vValue;
ElseIf( vMeasure@= 'SubsetName' );
    sSub        = vValue;
ElseIf( vMeasure@= 'Description' );
    sDesc       = vValue;
ElseIf( vMeasure@= 'AliasToSet' );
    sAlias      = vValue;
ElseIf( vMeasure@= 'RegenerationFrequency' );
    sFreq       = vValue;
ElseIf( vMeasure@= 'RegenerationDay' );
    sWkDay      = vValue;
ElseIf( vMeasure@= 'KeepSubsetDynamic' );
    sDynamic    = vValue;
ElseIf( vMeasure@= 'AutomatedMDXBaseElement' );
    sBaseEle    = vValue;
ElseIf( vMeasure@= 'AutomatedMDXType' );
    sType       = vValue;
ElseIf( vMeasure@= 'SubsetExpression' );
    sMDXExpr    = vValue;
EndIf;

# determine item index to use
If( vMeasure    @= 'SubsetName' );
    # determine if subset of same name is already defined for the same dimension/hierarchy combination
    sItem       = Fill( '0', 4 - Long( NumberToString(nItem) ) ) | NumberToString(nItem);
    sKey        = vDim | sHier | sSub;
    sCurSub     = CellGetS( cCubTgt, vDim, sItem, 'SubsetName' );
    sCurKey     = vDim | CellGetS( cCubTgt, vDim, sItem, 'Hierarchy' ) | sCurSub;
    While( sCurSub @<> '' & sCurKey @<> sKey );
        nItem   = nItem + 1;
        sItem   = Fill( '0', 4 - Long( NumberToString(nItem) ) ) | NumberToString(nItem);
        sCurSub = CellGetS( cCubTgt, vDim, sItem, 'SubsetName' );
        sCurKey = vDim | CellGetS( cCubTgt, vDim, sItem, 'Hierarchy' ) | sCurSub;
    End;
EndIf;

##################################################################################################################
### END Data
575,53
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
CubeSetLogChanges( cCubTgt, 1 );

# If preserving entries then need to catch the last subset update
If( pPreserveUnique @= '1' & sSub @<> '' );
    # update cube values of the last subset of the last processed dim/item combination
    CellPutS( sHier, cCubTgt, vDim, sItem, 'Hierarchy' );
    CellPutS( sSub, cCubTgt, vDim, sItem, 'SubsetName' );
    CellPutS( sDesc, cCubTgt, vDim, sItem, 'Description' );
    CellPutS( sAlias, cCubTgt, vDim, sItem, 'AliasToSet' );
    CellPutS( sFreq, cCubTgt, vDim, sItem, 'RegenerationFrequency' );
    If( CellIsUpdateable( cCubTgt, vDim, sItem, 'RegenerationDay' ) = 1 );
        CellPutS( sWkDay, cCubTgt, vDim, sItem, 'RegenerationDay' );
    EndIf;
    CellPutS( sDynamic, cCubTgt, vDim, sItem, 'KeepSubsetDynamic' );
    CellPutS( sBaseEle, cCubTgt, vDim, sItem, 'AutomatedMDXBaseElement' );
    CellPutS( sType, cCubTgt, vDim, sItem, 'AutomatedMDXType' );
    If( CellIsUpdateable( cCubTgt, vDim, sItem, 'SubsetExpression' ) = 1 );
        CellPutS( sMDXExpr, cCubTgt, vDim, sItem, 'SubsetExpression' );
    EndIf;
EndIf;

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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
#EndRegion - Finalize Logging
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
