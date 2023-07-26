601,100
602,"}APQ.Cub.Staging.LoadFromStaging"
562,"VIEW"
586,"}APQ Staging"
585,"}APQ Staging"
564,
565,"xuKpS7cw1nvn=Ec0wLJyHQHraEbIHvJt3TdVwYLgiDvoO5Gh0_mgwylm8ah2b<=KTg`KX5e4j8<t8kIq1>ut9kFMZYlMp:u0DILRKq\GnHEXY<wpxfx5=Svtn?N\<pN8B84Y[`pFq:V>[>>FdG=ykn=4JcEqTeDC`Rtr8DdFe:QxyLC>=<DhJSa;eQ@K96pv?<4]\<G>"
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
570,View1
571,
569,0
592,0
599,1000
560,3
pDoProcessLogging
pDebug
pSource
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pDebug,"0"
pSource,""
637,3
pDoProcessLogging,"Record in process logRecord in process log"
pDebug,"Debug"
pSource,"Source"
577,5
vStagingDataSource
vStagingVariableName
vDataSourceRow
vStagingMeasure
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
572,299
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
### 2019-06-10 		    AJastrzebska 	Migrate from Apliqo FPM to standard framework
##############################################################################################################
#Region @DOC
# Description:
# Export data from the staging cube to the ultimate target cube (whatever that is). 
# 
# Data Source: }APQ Staging
# 
# Use Case:
# Used when **}APQ Staging** is being sed as an intermediate repository for the source data.
#EndRegion @DOC
##############################################################################################################

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
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQProcesses',sThisProcName)=0);ExecuteProcess('}APQ.Dim.ControlDimensionCopies.Update','pDoProcessLogging',pDoProcessLogging,'pClear','0');EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');nCountTime=nCountTime+1;If(sProcLogParams@<>'');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');EndIf;End;
  If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Initialize Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

### Prolog script


### Inits

# Cubes
cCubSrc = '}APQ Staging';
cCubCtrl = '}APQ Staging Control';
cCubDimMap = '}APQ Staging Dimension Mapping';
cCubDimUsed = '}APQ Dimension Use';

cDimCub = '}APQ Cubes';
cDimStatus = '}APQ PickList Validations';

cParamCubTgt = 'Target cube';
cParamLoadStaging = 'Load From Staging';
cParamIteration = 'Value Iteration';

cParamFilterTgt = 'FilterTgt';
cParamDelimDimTgt = 'DelimiterDimTgt';
cParamDelimElemTgt = 'DelimiterElemTgt';
cParamDelimFirstElemTgt = 'DelimiterFirstElemTgt';

cParamStatus = 'Status Target';
cParamStatusCom = 'Status Target Comment';
cParamStartTime = 'Target Last Update Start Time';
cParamEndTime = 'Target Last Update End Time';
cParamDuration = 'Target Last Update Duration';
cParamRecord = 'Target Last Update Record Count';
cParamUser = 'Target User';
cParamErrorFile = 'Target Error File';
cSubsetStatus = 'PickList Checklist';

cDateFormat = '\d/\m/\Y - \h:\i:\s';
cDurationFormat = '\h:\i:\s';
nStartTime = NOW();
sStartTime = TIMST( nStartTime , cDateFormat );

cMeasureS = 'String';

CellPutS( sStartTime, cCubCtrl, pSource, cParamStartTime, cMeasureS );

cStringVal = 'String';
cTotVarName = 'Total APQ Staging Variable Name';


cMapType = 'Mapping Type';
cMapVal = 'Mapping Value ';
cMapDim = 'Dimension Name';
cMapAttrDim = 'Mapping Attribute Dim';
cMapAttrName = 'Mapping Attribute Name';

cType = 'Type';

cVar = 'Variable';
cFix = 'Fix';
cVal = 'Value';
cVarCol = 'Variable Column';
vValCol = 'Value Column';
cAttr = 'Attribute';

nErr = 0;
sErr = '';
nRecordCount = 0;


sCubTgt = CellGetS( cCubCtrl, pSource, cParamCubTgt, cStringVal );

If( sCubTgt @= '' % DimIx( cDimCub, sCubTgt ) = 0 );
   nErr = nErr + 1;
   If( sErr @<> '' ); sErr = sErr | '. '; EndIF;
   sErr = sErr | 'Invalid Target cube name: ' | sCubTgt;
EndIf;

sLoadFromStaging = CellGetS( cCubCtrl, pSource, cParamLoadStaging, cStringVal );
If( sLoadFromStaging @<> '1' );
   nErr = nErr + 1;
   If( sErr @<> '' ); sErr = sErr | '. '; EndIF;
   sErr = sErr | 'Invalid Parameters in Staging Control for Load from Staging.';
EndIf;

nNumberDim = CellGetN( cCubDimUsed, sCubTgt, 'Total APQ Dimensions', 'Is Used' );
nIterationValCol = CellGetS( cCubCtrl, pSource, cParamIteration, cStringVal );


cCubAdmin = '}APQ Settings';
# Views and Subsets
sTimeStamp = NumbertoString( now());

cPathDebug = CellGetS( cCubAdmin, 'Location: Debugging', 'String' );
cErrorFile = cPathDebug  | '\' |  sThisProcName |  'Errors_' | TIMST( nProcessStartTime,'\Y\m\d\h\i\s' ) | '.log';

cViewClr = 'ZeroOut_' | sCubTgt | '_' |  sThisProcName | '_' | pSource | '_' | sTimeStamp;
cSubClr = cViewClr; 

cViewSrc = 'DataSource_' |  sThisProcName | '_' | pSource | '_' | sTimeStamp;
cSubSrc = cViewSrc;

# Dimensions Source
cDimStagingDataSource = '}APQ Staging Data Source';
cDimStagingVarName = '}APQ Staging Variable Name';
cDimStagingSrcRow = '}APQ Data Source Row';
cDimStagingMeasure = '}APQ Staging Measure';


# Value Element for source and target
cVarName  =  'V2';
cMeasure  =  'Used';
cTypeVar = 'Type';

#  Can be done either with CubeSetLogChanges or writing NO with CellPutS to }CubeProperties
CellPutS( 'NO', '}CubeProperties', sCubTgt, 'LOGGING' );


If( nErr > 0 );
  ProcessBreak;
EndIF;


# -------------------------------------------------------------------------------------------------------------------------------------
# If target cube has more than 20 dimensions, you need to define additionnal variables
# -------------------------------------------------------------------------------------------------------------------------------------
# Dimension name and type mapping for all dimensions of the target cube

sTypeMapD1 = CellGetS( cCubDimMap, pSource, 'Dimension 1', cMapType );
sDimMapD1 = CellGetS( cCubDimMap, pSource, 'Dimension 1', cMapDim );
sTypeMapD2 = CellGetS( cCubDimMap, pSource, 'Dimension 2', cMapType );
sDimMapD2 = CellGetS( cCubDimMap, pSource, 'Dimension 2', cMapDim );
sTypeMapD3 = CellGetS( cCubDimMap, pSource, 'Dimension 3', cMapType );
sDimMapD3 = CellGetS( cCubDimMap, pSource, 'Dimension 3', cMapDim );
sTypeMapD4 = CellGetS( cCubDimMap, pSource, 'Dimension 4', cMapType );
sDimMapD4 = CellGetS( cCubDimMap, pSource, 'Dimension 4', cMapDim );
sTypeMapD5 = CellGetS( cCubDimMap, pSource, 'Dimension 5', cMapType );
sDimMapD5 = CellGetS( cCubDimMap, pSource, 'Dimension 5', cMapDim );
sTypeMapD6 = CellGetS( cCubDimMap, pSource, 'Dimension 6', cMapType );
sDimMapD6 = CellGetS( cCubDimMap, pSource, 'Dimension 6', cMapDim );
sTypeMapD7 = CellGetS( cCubDimMap, pSource, 'Dimension 7', cMapType );
sDimMapD7 = CellGetS( cCubDimMap, pSource, 'Dimension 7', cMapDim );
sTypeMapD8 = CellGetS( cCubDimMap, pSource, 'Dimension 8', cMapType );
sDimMapD8 = CellGetS( cCubDimMap, pSource, 'Dimension 8', cMapDim );
sTypeMapD9 = CellGetS( cCubDimMap, pSource, 'Dimension 9', cMapType );
sDimMapD9 = CellGetS( cCubDimMap, pSource, 'Dimension 9', cMapDim );
sTypeMapD10 = CellGetS( cCubDimMap, pSource, 'Dimension 10', cMapType );
sDimMapD10 = CellGetS( cCubDimMap, pSource, 'Dimension 10', cMapDim );
sTypeMapD11 = CellGetS( cCubDimMap, pSource, 'Dimension 11', cMapType );
sDimMapD11 = CellGetS( cCubDimMap, pSource, 'Dimension 11', cMapDim );
sTypeMapD12 = CellGetS( cCubDimMap, pSource, 'Dimension 12', cMapType );
sDimMapD12 = CellGetS( cCubDimMap, pSource, 'Dimension 12', cMapDim );
sTypeMapD13 = CellGetS( cCubDimMap, pSource, 'Dimension 13', cMapType );
sDimMapD13 = CellGetS( cCubDimMap, pSource, 'Dimension 13', cMapDim );
sTypeMapD14 = CellGetS( cCubDimMap, pSource, 'Dimension 14', cMapType );
sDimMapD14 = CellGetS( cCubDimMap, pSource, 'Dimension 14', cMapDim );
sTypeMapD15 = CellGetS( cCubDimMap, pSource, 'Dimension 15', cMapType );
sDimMapD15 = CellGetS( cCubDimMap, pSource, 'Dimension 15', cMapDim );
sTypeMapD16 = CellGetS( cCubDimMap, pSource, 'Dimension 16', cMapType );
sDimMapD16 = CellGetS( cCubDimMap, pSource, 'Dimension 16', cMapDim );
sTypeMapD17 = CellGetS( cCubDimMap, pSource, 'Dimension 17', cMapType );
sDimMapD17 = CellGetS( cCubDimMap, pSource, 'Dimension 17', cMapDim );
sTypeMapD18 = CellGetS( cCubDimMap, pSource, 'Dimension 18', cMapType );
sDimMapD18 = CellGetS( cCubDimMap, pSource, 'Dimension 18', cMapDim );
sTypeMapD19 = CellGetS( cCubDimMap, pSource, 'Dimension 19', cMapType );
sDimMapD19 = CellGetS( cCubDimMap, pSource, 'Dimension 19', cMapDim );
sTypeMapD20 = CellGetS( cCubDimMap, pSource, 'Dimension 20', cMapType );
sDimMapD20 = CellGetS( cCubDimMap, pSource, 'Dimension 20', cMapDim );
sTypeMapD21 = CellGetS( cCubDimMap, pSource, 'Dimension 21', cMapType );
sDimMapD21 = CellGetS( cCubDimMap, pSource, 'Dimension 21', cMapDim );


# -------------------------------------------------------------------------------------------------------------------------------------
# If target cube has more than 20 dimensions, you need to define additionnal variables
# -------------------------------------------------------------------------------------------------------------------------------------

# ------------ Clear Target -------------------

If( ViewExists( sCubTgt, cViewClr  ) = 1 );
 ViewDestroy( sCubTgt, cViewClr  );
EndIF;

sFilterTgt = CellGetS( cCubCtrl, pSource, cParamFilterTgt, cStringVal );
sDelimDimTgt = CellGetS( cCubCtrl, pSource, cParamDelimDimTgt, cStringVal );
sDelimElemTgt = CellGetS( cCubCtrl, pSource, cParamDelimElemTgt, cStringVal );
sDelimFirstElemTgt = CellGetS( cCubCtrl, pSource, cParamDelimFirstElemTgt, cStringVal );

ExecuteProcess('}bedrock.cube.data.clear',
	'pLogOutput',0,
	'pCube', sCubTgt,
	'pView', cViewClr,
	'pFilter', sFilterTgt,
	'pDimDelim', sDelimDimTgt,
	'pEleStartDelim', sDelimFirstElemTgt,
	'pEleDelim', sDelimElemTgt,
	'pCubeLogging',0,
	'pTemp',1);


# ------------ Create and set the data source view -------------------

If( ViewExists( cCubSrc, cViewSrc  ) = 1 );
  ViewDestroy( cCubSrc, cViewSrc  );
EndIF;

sProc = 		'Bedrock.Cube.View.Create';
# Set filter as per logic requirement of the data source processing
sFilterSrc = 	cDimStagingDataSource | sDelimFirstElemTgt | pSource;
sFilterSrc = 	sFilterSrc | sDelimDimTgt | cDimStagingVarName | sDelimFirstElemTgt | cVarName;
sFilterSrc = 	sFilterSrc | sDelimDimTgt | cDimStagingMeasure | sDelimFirstElemTgt | cMeasure;



# Adjust parameters for skipping of blanks / consols / rule calcs as required
bSuppressNull = 	1;
bSuppressC = 	1;
bSuppressRule = 	1;

ExecuteProcess('}bedrock.cube.view.create',
	'pLogOutput',0,
	'pCube', cCubSrc,
	'pView', cViewSrc,
	'pFilter', sFilterSrc,
	'pSuppressZero', bSuppressNull,
	'pSuppressConsol', bSuppressC,
	'pSuppressRules', bSuppressRule,
	'pDimDelim','&',
	'pEleStartDelim',':',
	'pEleDelim','+',
	'pTemp',1,
	'pSubN',0);

######################
### Assign data source

If( nErr = 0 );
  DataSourceType = 'VIEW';
  DataSourceNameForServer = cCubSrc;
  DataSourceCubeView = cViewSrc;
Else;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,268
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

If( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

iter = 1;
nErrorStaging = 0;

#Count the records in source
nRecordCount = nRecordCount +1;

   # Go through the iteration if there are multiple columns for values in the source
   WHILE ( iter <=  StringToNumber( nIterationValCol) );
    sTypeMapD = '';
    sTypeMapDM = '';
    sTypeMeas = '';
    sTypeMeasV = '';
    sMapAttrDim = '';
    sMapAttrName = '';
    
     nditer = 1;
     While (nditer < nNumberDim +2);

     # Get the value for each dimension and value
      sTypeMapD = Expand('%sTypeMapD'|numbertostring(nditer)|'%');
      sValMapD = CellGetS( cCubDimMap, vStagingDataSource, 'Dimension '|numbertostring(nditer), cMapVal | NumberToString( iter ) );
      sDimMapD = Expand('%sDimMapD'|numbertostring(nditer)|'%');
      # If the type of mapping is variable, value or value in columns we get the value in the Staging cube 
      If( sTypeMapD @= cVar % sTypeMapD @= cVarCol % sTypeMapD @= cAttr );
        sTypeMeas = 'ValueSTR';
        V0 = CellGetS( cCubSrc, vStagingDataSource, sValMapD, vDataSourceRow, sTypeMeas );
          If( sTypeMapD @= cAttr );
            sMapAttrDim = CellGetS( cCubDimMap, vStagingDataSource, 'Dimension '|numbertostring(nditer), cMapAttrDim );
            sMapAttrName = CellGetS( cCubDimMap, vStagingDataSource, 'Dimension '|numbertostring(nditer), cMapAttrName );
            V0 = ATTRS( sMapAttrDim, V0, sMapAttrName );
          EndIf;
          If(nditer = nNumberDim);
            sTypeMeasV = If( DType( sDimMapD, V0 ) @= 'S' , 'ValueSTR', 'Value' );
          Endif;  
      ElseIF( sTypeMapD @= cVal % sTypeMapD @= vValCol );
        V0num = CellGetN( cCubSrc, vStagingDataSource, sValMapD, vDataSourceRow, sTypeMeasV );
        V0 = NumberToString( V0num );
      # If the type of mapping is Fix or variable in column we get the data in the Dimension mapping
      ElseIf( sTypeMapD @= cFix % sTypeMapD @= cVarCol );
         V0 = sValMapD;
      Else;
         sMessage =  sTypeMapD | ' is a wrong dimension type for Dimension '|numbertostring(nditer);
         ASCIIOUTPUT( cErrorFile, sMessage );
         DataMinorErrorCount = DataMinorErrorCount +1;
         ItemSkip;            
      EndIf;

      # Check and Error management
      If(nditer < nNumberDim);
        If( DimIx( sDimMapD, V0 ) = 0 % ELLEV( sDimMapD, V0 ) <> 0 );
          sMessage = 'Element: ' | V0 | ' does not exist in ' | sDimMapD | ' dimension or is consolidated';
          ASCIIOUTPUT( cErrorFile, sMessage );
          DataMinorErrorCount = DataMinorErrorCount +1;
          ItemSkip;
        Else;
          V0Code = DimensionElementPrincipalName ( sDimMapD, V0 );
        EndIF;
      ElseIf(nditer = nNumberDim);
          If( DimIx( sDimMapD, V0 ) = 0 % ELLEV( sDimMapD, V0 ) <> 0 );
          sMessage = 'Element: ' | V0 | ' does not exist in ' | sDimMapD | ' dimension or is consolidated';
          ASCIIOUTPUT( cErrorFile, sMessage );
          DataMinorErrorCount = DataMinorErrorCount +1;
          ItemSkip;
        Else;
          V0Code = DimensionElementPrincipalName ( sDimMapD, V0 );
          sDimMapDM = sDimMapD;
        EndIF;
      Else;
        V0Code = V0;
      Endif; 

      # set the variable to proper variable number - to be able to write CellPut
      If(nditer = 1);
        V1 = V0Code;
      ElseIf(nditer = 2);
        V2 = V0Code;
      ElseIf(nditer = 3);
        V3 = V0Code;
      ElseIf(nditer = 4);
        V4 = V0Code;
      ElseIf(nditer = 5);
        V5 = V0Code;
      ElseIf(nditer = 6);
        V6 = V0Code;
      ElseIf(nditer = 7);
        V7 = V0Code;
      ElseIf(nditer = 8);
        V8 = V0Code;
      ElseIf(nditer = 9);
        V9 = V0Code;
      ElseIf(nditer = 10);
        V10 = V0Code;
      ElseIf(nditer = 11);
        V11 = V0Code;
      ElseIf(nditer = 12);
        V12 = V0Code;
      ElseIf(nditer = 13);
        V13 = V0Code;
      ElseIf(nditer = 14);
        V14 = V0Code;
      ElseIf(nditer = 15);
        V15 = V0Code;
      ElseIf(nditer = 16);
        V16 = V0Code;
      ElseIf(nditer = 17);
        V17 = V0Code;
      ElseIf(nditer = 18);
        V18 = V0Code;
      ElseIf(nditer = 19);
        V19 = V0Code;
      ElseIf(nditer = 20);
        V20 = V0Code;
      ElseIf(nditer = 21);
        V21 = V0Code;
      Else;
        sMessage = 'Element: ' | V0Code | ' is over the limit of dimensions.' ;
        ASCIIOUTPUT( cErrorFile, sMessage );
        DataMinorErrorCount = DataMinorErrorCount +1;
        ItemSkip;
      EndIf;  

      nditer = nditer +1;
      End;
      
      # Send data
      If(nNumberDim = 2);
        If( DType( sDimMapDM, V2 ) @= 'S' );
         CellPutS( V3, sCubTgt, V1, V2 );
        Else;
         CellIncrementN( StringToNumber( V3 ), sCubTgt, V1, V2 );
        EndIf;
      ElseIf(nNumberDim = 3);  
        If( DType( sDimMapDM, V3 ) @= 'S' );
         CellPutS( V4, sCubTgt, V1, V2, V3 );
        Else;
         CellIncrementN( StringToNumber( V4 ), sCubTgt, V1, V2, V3 );
        EndIf;
      ElseIf(nNumberDim = 4);  
        If( DType( sDimMapDM, V4 ) @= 'S' );
         CellPutS( V5, sCubTgt, V1, V2, V3, V4 );
        Else;
         CellIncrementN( StringToNumber( V5 ), sCubTgt, V1, V2, V3, V4 );
        EndIf;
      ElseIf(nNumberDim = 5);  
        If( DType( sDimMapDM, V5 ) @= 'S' );
         CellPutS( V6, sCubTgt, V1, V2, V3, V4, V5 );
        Else;
         CellIncrementN( StringToNumber( V6 ), sCubTgt, V1, V2, V3, V4, V5 );
        EndIf;
      ElseIf(nNumberDim = 6);  
        If( DType( sDimMapDM, V6 ) @= 'S' );
         CellPutS( V7, sCubTgt, V1, V2, V3, V4, V5, V6 );
        Else;
         CellIncrementN( StringToNumber( V7 ), sCubTgt, V1, V2, V3, V4, V5, V6 );
        EndIf;
      ElseIf(nNumberDim = 7);  
        If( DType( sDimMapDM, V7 ) @= 'S' );
         CellPutS( V8, sCubTgt, V1, V2, V3, V4, V5, V6, V7 );
        Else;
         CellIncrementN( StringToNumber( V8 ), sCubTgt, V1, V2, V3, V4, V5, V6, V7 );
        EndIf;
      ElseIf(nNumberDim = 8);  
        If( DType( sDimMapDM, V8 ) @= 'S' );
         CellPutS( V9, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8 );
        Else;
         CellIncrementN( StringToNumber( V9 ), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8 );
        EndIf;
      ElseIf(nNumberDim = 9);  
        If( DType( sDimMapDM, V9 ) @= 'S' );
         CellPutS( V10, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9 );
        Else;
         CellIncrementN( StringToNumber( V10), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9 );
        EndIf;
      ElseIf(nNumberDim = 10);  
        If( DType( sDimMapDM, V10 ) @= 'S' );
         CellPutS( V11, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 );
        Else;
         CellIncrementN( StringToNumber( V11), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 );
        EndIf;
      ElseIf(nNumberDim = 11);  
        If( DType( sDimMapDM, V11 ) @= 'S' );
         CellPutS( V12, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 );
        Else;
         CellIncrementN( StringToNumber( V12), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 );
        EndIf;
      ElseIf(nNumberDim = 12);  
        If( DType( sDimMapDM, V12 ) @= 'S' );
         CellPutS( V13, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 );
        Else;
         CellIncrementN( StringToNumber( V13), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 );
        EndIf;
      ElseIf(nNumberDim = 13);  
        If( DType( sDimMapDM, V13 ) @= 'S' );
         CellPutS( V14, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 );
        Else;
         CellIncrementN( StringToNumber( V14), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 );
        EndIf;
      ElseIf(nNumberDim = 14);  
        If( DType( sDimMapDM, V14 ) @= 'S' );
         CellPutS( V15, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 );
        Else;
         CellIncrementN( StringToNumber( V15), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 );
        EndIf;
      ElseIf(nNumberDim = 15);  
        If( DType( sDimMapDM, V15 ) @= 'S' );
         CellPutS( V16, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 );
        Else;
         CellIncrementN( StringToNumber( V16), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 );
        EndIf;
      ElseIf(nNumberDim = 16);  
        If( DType( sDimMapDM, V16 ) @= 'S' );
         CellPutS( V17, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 );
        Else;
         CellIncrementN( StringToNumber( V17), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 );
        EndIf;
      ElseIf(nNumberDim = 17);  
        If( DType( sDimMapDM, V17 ) @= 'S' );
         CellPutS( V18, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 );
        Else;
         CellIncrementN( StringToNumber( V18), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 );
        EndIf;
      ElseIf(nNumberDim = 18);  
        If( DType( sDimMapDM, V18 ) @= 'S' );
         CellPutS( V19, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
        Else;
         CellIncrementN( StringToNumber( V19), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
        EndIf;
      ElseIf(nNumberDim = 19);  
        If( DType( sDimMapDM, V19 ) @= 'S' );
         CellPutS( V20, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
        Else;
         CellIncrementN( StringToNumber( V20), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
        EndIf;
      ElseIf(nNumberDim = 20);  
        If( DType( sDimMapDM, V20 ) @= 'S' );
         CellPutS( V21, sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 );
        Else;
         CellIncrementN( StringToNumber( V21), sCubTgt, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 );
        EndIf;
      Endif;
      
      iter = iter + 1;   
   END;

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

#  Can be done either with CubeSetLogChanges or writing YES with CellPutS to }CubeProperties
CellPutS( 'YES', '}CubeProperties',sCubTgt, 'LOGGING' );

##############################################################################################################################
If( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While( nCountTime <= nTotalLogTime );    sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
  CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' ); CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
  CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' ); CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
  CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' ); CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
  CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );  nCountTime = nCountTime + 1; End;
  If( nDataRecordCount > 0 ); If( cCubTgt @<> '' ); CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' ); EndIF; EndIF;
EndIF;
##############################################################################################################################

nEndTime = NOW();
sEndTime = TIMST( nEndTime , cDateFormat );
nElapsedTime = nEndTime - nStartTime;
sElapsedTime = TIMST( nElapsedTime , cDurationFormat );

CellPutS( sEndTime, cCubCtrl, pSource, cParamEndTime, cMeasureS );
CellPutS( sElapsedTime, cCubCtrl, pSource, cParamDuration, cMeasureS );
CellPutS( NumberToString( nRecordCount ), cCubCtrl, pSource, cParamRecord, cMeasureS );
CellPutS( TM1User(), cCubCtrl, pSource, cParamUser, cMeasureS );

If(nErr > 0);
   sStatus = SubsetGetElementName( cDimStatus, cSubsetStatus, 3 );
   sStatusCom = 'There were errors in process configuration.';
   CellPutS( sStatus, cCubCtrl, pSource, cParamStatus, cMeasureS );
   CellPutS( sStatusCom, cCubCtrl, pSource, cParamStatusCom, cMeasureS );
   CellPutS( If(FileExists(cErrorFile)=1,cErrorFile,''), cCubCtrl, pSource, cParamErrorFile, cMeasureS );
   ItemReject('There were errors in process configuration.');
ElseIF( DataMinorErrorCount <> 0 );
   sStatus = SubsetGetElementName( cDimStatus, cSubsetStatus, 3 );
   sStatusCom = 'Data Record Count : ' | NumberToString( nRecordCount ) | '. With ' | NumberToString ( DataMinorErrorCount ) | ' rejects';
   CellPutS( sStatus, cCubCtrl, pSource, cParamStatus, cMeasureS );
   CellPutS( sStatusCom, cCubCtrl, pSource, cParamStatusCom, cMeasureS );
   CellPutS( cErrorFile, cCubCtrl, pSource, cParamErrorFile, cMeasureS );
   ItemReject('There were errors in data. Check logfiles "' | cErrorFile | ' for details');
Else;
   sStatus = SubsetGetElementName( cDimStatus, cSubsetStatus, 2 );
   sStatusCom = 'Data Record Count : ' | NumberToString( nRecordCount ) | '. With 0 rejects';
   CellPutS( sStatus, cCubCtrl, pSource, cParamStatus, cMeasureS );
   CellPutS( '', cCubCtrl, pSource, cParamErrorFile, cMeasureS );
   CellPutS( sStatusCom, cCubCtrl, pSource, cParamStatusCom, cMeasureS );
EndIf;

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
