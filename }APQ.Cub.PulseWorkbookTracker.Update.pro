601,100
602,"}APQ.Cub.PulseWorkbookTracker.Update"
562,"ODBC"
586,"PulseDocs"
585,"PulseDocs"
564,"Reader"
565,"eH_0rzCk=EKeK;LJ;X:SZj3MkuogeNRf68_q0Gg76yYz2;SFZB]sh5=UFbff9[9Ujcl2I4^IiI0Us;R7gQ0r>R8bUu5pUgf1[QU`rO6kd=Lo]5cctv0AK@HO>vMo66Am0nS,]er0WN;0Dk1dBY:,m4bTmATteU:AI81cEs'=iTI3>X8fct8c4.]9oT]fKeukFNGxP@:IeH_0rlCk=EKeK;LJ;X:SZj3MkuogeNRv08_q0Gg76yYz2kQFZB]sh5=UFb8d9[9Xjcl2I4^IiIp\sKV7gQ0r>R8bUu5qUgf1[QUprO6kd=Lo]53arv0AK@HO>vMoFjFm0nQ<Wer0WN;@Fk1dNY:lc4bTmATteU:AI8abEsW=iTI3nQ8fct8c4>[9oT]fK5s;ANGxP@:I"
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
566,11
SELECT   ServerName
       , Opentime 
       , Closetime 
       , Username 
       , ActionType 
       , Workbookpath 
       , Workbooktype 
       , TM1Logins
FROM     [WorkbookLog] 
WHERE    Opentime >= '?pDateFrom?' AND Opentime <= '?pDateTo?'
ORDER BY Opentime Desc;
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
pDateFrom
pDateTo
pZeroTarget
pQuote
pServer
pDoProcessLogging
pDebug
pClear
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
pDateFrom,""
pDateTo,""
pZeroTarget,"1"
pQuote,"'"
pServer,""
pDoProcessLogging,"1"
pDebug,"0"
pClear,"1"
637,8
pDateFrom,"Start Date (Format: YYYY-MM-DD)"
pDateTo,"End Date (Format: YYYY-MM-DD)"
pZeroTarget,"Zero out Target Cube PRIOR to Load data? (Boolean 1=True)"
pQuote,"Quotation"
pServer,"TM1 Server Name (If Blank, Server Name taken from }APQ Settings"
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pClear,"Clear dimension elements"
577,8
vservername
vopentime
vclosetime
vusername
vactiontype
vworkbookpath
vworkbooktype
vtm1logins
578,8
2
2
2
2
2
2
2
2
579,8
1
2
3
4
5
6
7
8
580,8
0
0
0
0
0
0
0
0
581,8
0
0
0
0
0
0
0
0
582,8
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,626
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
### 	This process maintains dimensions & cube data in the cube }APQ Pulse Workbook Tracker.
### 	Data from the Pulse H2 DB WorkbookLog table which tracks excel TM1 usage for users with Extend is loaded to the cube for analysis.
### DATA SOURCE: 
### 	ODBC (Pulse Docs)
### INTENDED USAGE:
### 	Loads the Workbook info from Pulse DB (Pulse Docs) to the }APQ Pulse Workbook Tracker cube
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2017-04-24 		Sayi          	Creation of Process
### 2017-05-22      Sayi            Change of dimension structure
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pDateFrom:' |  pDateFrom |' & '|'pDateTo:'|pDateTo;
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
cCubTgt             = '}APQ Pulse Workbook Tracker';
cCubParam           = '}APQ Settings';
cDim1               = '}APQ Time Year';
cDim2               = '}APQ Time Day in Year';
cDim3               = '}APQ Pulse ServerName';
cDim3Par            = 'Total APQ Pulse ServerName';
cDim4               = '}APQ Pulse Service Name';
cDim5               = '}APQ Pulse Workbook Path';
cDim6               = '}APQ Pulse Workbook';
cDim7               = '}APQ Pulse Workbook Clients';
cDim8               = '}APQ Pulse Workbook Tracker Measure';
cDimTest            = '}APQ Escape Characters';
cWinSerName         = CellGetS( cCubParam, 'Windows Service Name', 'String' );
cTM1SerName         = CellGetS( cCubParam, 'TM1 Server Name', 'String' );
cLocationInstance   = CellGetS( cCubParam, 'Location: Instance', 'String' );
nPulseCfg           = CellGetN( cCubParam, 'Pulse ODBC', 'Numeric' );
cODBC               = CellGetS( cCubParam, 'Pulse ODBC', 'String' );
cODBCUser           = CellGetS( cCubParam, 'Pulse ODBC User', 'String' );
cODBCPwd            = CellGetS( cCubParam, 'Pulse ODBC Pwd', 'String' );
cPath1              = CellGetS( cCubParam, 'Supported Workbook Path1', 'String' );
cPath2              = CellGetS( cCubParam, 'Supported Workbook Path2', 'String' );
cPath3              = CellGetS( cCubParam, 'Supported Workbook Path3', 'String' );
cPath4              = CellGetS( cCubParam, 'Supported Workbook Path4', 'String' );
cPath5              = CellGetS( cCubParam, 'Supported Workbook Path5', 'String' );
sTimeStamp          = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt          = NumberToString( INT( RAND( ) * 1000 ));
cViewClrPrefix      = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr            = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr             = cViewClr;
cTestVal1           = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2           = DimNm( cDimTest, 1 );
cTestVal3           = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc           = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc           = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile          = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile          = cDebugFile | '_Prolog.log';
nDebug              = StringToNumber( pDebug );
sDelim              = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim           = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart      = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle           = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr                = 0;
sErr                = '';

### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

### Test parameters

###Check whether Pulse is installed. If not then terminate the process

If( nPulseCfg <> 1 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Pulse is not installed'; 
Endif;

### If Target cube exists
IF( CubeExists( cCubTgt ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid cube:' | cCubTgt; 
EndIF;

IF( pDateFrom @= '' );
   pDateFrom = SubSt( Today(1), 1, 4 ) | '-01-01';
EndIF;

IF( pDateTo @= '' );
   pDateTo = Today(1);
EndIF;

sToday = Today(1);
if( pDateto @> sToday % pDateto @< pDateFrom );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid To Date:' | pDateto; 
Endif;

##Checking windows service name and TM1 server name
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
  ItemReject( sErr );
EndIF;

### If required switch transaction logging off

CubeSetLogChanges( cCubTgt, 0 );

### Deleting the dimension elements

IF( pClear @= '1' );
  DimensionDeleteAllElements( cDim3 );
  DimensionDeleteAllElements( cDim5 );
  DimensionDeleteAllElements( cDim6 );
  DimensionDeleteAllElements( cDim7 );
EndIF;

### Creating the consolidation elements in dimension

DimensionElementInsert( cDim3, '', 'Total ' | Subst(cDim3,2,long(cDim3)), 'C' );
DimensionElementInsert( cDim4, '', 'Total ' | Subst(cDim4,2,long(cDim4)), 'C' );

###Inserting Consolidation elements in Dim5 ('}APQ Pulse Workbook Path')

DimensionElementInsert( cDim5, '', 'Total ' | Subst(cDim5,2,long(cDim5)), 'C' );
DimensionElementInsert( cDim5, '', 'Supported', 'C' );
DimensionElementInsert( cDim5, '', 'Non Supported', 'C' );
DimensionElementComponentAdd( cDim5, 'Total ' | Subst(cDim5,2,long(cDim5)), 'Supported', 1 );
DimensionElementComponentAdd( cDim5, 'Total ' | Subst(cDim5,2,long(cDim5)), 'Non Supported', 1 );
DimensionElementInsert( cDim5, '', 'TM1 Applications', 'C' );
DimensionElementInsert( cDim5, '', 'Workbook Paths', 'C' );
DimensionElementInsert( cDim5, '', 'TM1 Web', 'C' );
DimensionElementComponentAdd( cDim5, 'Supported', 'TM1 Applications',1 );
DimensionElementInsert( cDim5, '', 'Active Form', 'N' );
DimensionElementInsert( cDim5, '', 'Slice', 'N' );
DimensionElementComponentAdd( cDim5, 'TM1 Applications','Active Form',1 );
DimensionElementComponentAdd( cDim5, 'TM1 Applications','Slice',1 );
DimensionElementComponentAdd( cDim5, 'Supported', 'Workbook Paths',1 );
DimensionElementComponentAdd( cDim5, 'Supported', 'TM1 Web',1 );
DimensionElementInsert( cDim5, '', 'Workbook Path1', 'C' );
DimensionElementInsert( cDim5, '', 'Workbook Path2', 'C' );
DimensionElementInsert( cDim5, '', 'Workbook Path3', 'C' );
DimensionElementInsert( cDim5, '', 'Workbook Path4', 'C' );
DimensionElementInsert( cDim5, '', 'Workbook Path5', 'C' );
DimensionElementComponentAdd( cDim5, 'Workbook Paths', 'Workbook Path1',1 );
DimensionElementComponentAdd( cDim5, 'Workbook Paths', 'Workbook Path2',1 );
DimensionElementComponentAdd( cDim5, 'Workbook Paths', 'Workbook Path3',1 );
DimensionElementComponentAdd( cDim5, 'Workbook Paths', 'Workbook Path4',1 );
DimensionElementComponentAdd( cDim5, 'Workbook Paths', 'Workbook Path5',1 );
DimensionElementInsert( cDim5, '', 'Websheet Path', 'C' );
DimensionElementInsert( cDim5, '', 'Cubes', 'C' );
DimensionElementComponentAdd( cDim5, 'TM1 Web','Websheet Path',1 );
DimensionElementComponentAdd( cDim5, 'TM1 Web','Cubes',1 );

###Inserting Consolidation elements in Dim6 ('}APQ Pulse Workbook')

DimensionElementInsert( cDim6, '', 'Total ' | Subst(cDim6,2,long(cDim6)), 'C' );
DimensionElementInsert( cDim6, '', 'Supported', 'C' );
DimensionElementInsert( cDim6, '', 'Non Supported', 'C' );
DimensionElementComponentAdd( cDim6, 'Total ' | Subst(cDim6,2,long(cDim6)), 'Supported', 1 );
DimensionElementComponentAdd( cDim6, 'Total ' | Subst(cDim6,2,long(cDim6)), 'Non Supported', 1 );
DimensionElementInsert( cDim6, '', 'TM1 Applications', 'C' );
DimensionElementInsert( cDim6, '', 'Workbook Paths', 'C' );
DimensionElementInsert( cDim6, '', 'TM1 Web', 'C' );
DimensionElementComponentAdd( cDim6, 'Supported', 'TM1 Applications',1 );
DimensionElementInsert( cDim6, '', 'Active Form', 'C' );
DimensionElementInsert( cDim6, '', 'Sliced Reports', 'C' );
DimensionElementComponentAdd( cDim6, 'TM1 Applications','Active Form',1 );
DimensionElementComponentAdd( cDim6, 'TM1 Applications','Sliced Reports',1 );
DimensionElementComponentAdd( cDim6, 'Supported', 'Workbook Paths',1 );
DimensionElementComponentAdd( cDim6, 'Supported', 'TM1 Web',1 );
DimensionElementInsert( cDim6, '', 'Workbook Path1', 'C' );
DimensionElementInsert( cDim6, '', 'Workbook Path2', 'C' );
DimensionElementInsert( cDim6, '', 'Workbook Path3', 'C' );
DimensionElementInsert( cDim6, '', 'Workbook Path4', 'C' );
DimensionElementInsert( cDim6, '', 'Workbook Path5', 'C' );
DimensionElementComponentAdd( cDim6, 'Workbook Paths', 'Workbook Path1',1 );
DimensionElementComponentAdd( cDim6, 'Workbook Paths', 'Workbook Path2',1 );
DimensionElementComponentAdd( cDim6, 'Workbook Paths', 'Workbook Path3',1 );
DimensionElementComponentAdd( cDim6, 'Workbook Paths', 'Workbook Path4',1 );
DimensionElementComponentAdd( cDim6, 'Workbook Paths', 'Workbook Path5',1 );
DimensionElementInsert( cDim6, '', 'Websheet Name', 'C' );
DimensionElementInsert( cDim6, '', 'Cube View Name', 'C' );
DimensionElementComponentAdd( cDim6, 'TM1 Web','Websheet Name',1 );
DimensionElementComponentAdd( cDim6, 'TM1 Web','Cube View Name',1 );

##Inserting Consolidation Element in Dim7 ('}APQ Pulse Workbook Clients')
DimensionElementInsert( cDim7, '', 'Total ' | Subst(cDim7,2,long(cDim7)), 'C' );

### To Ceate a Target View and Zero out the data

### Create the view to assign as data source for the process
sProc = '}bedrock.cube.view.create';
bSuppressNull = 1;
bSuppressC = 1;
bSuppressRule = 1;
ExecuteProcess( sProc, 'pLogOutput', nDebug,
	'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', '',
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1 
);

sYearFrom = Subst(pDatefrom,1,4);
sYearTo = Subst(pDateTo,1,4);
nYearDiff = StringtoNumber(sYearTo) - StringtoNumber(sYearFrom);
sDayFrom = Subst(pDateFrom,6,5);
sDayTo = Subst(pDateTo,6,5);

####Zero out the target cube

If( pZeroTarget @= '1' );

#### Case 1: Performing View Zero out for Same year

###Subset creation for }APQ Time Year dimension
  if(sYearFrom @= sYearTo);
    sElements = sYearFrom;
    sProc = '}bedrock.hier.sub.create.byelement';
    ExecuteProcess( sProc, 'pLogOutput', nDebug,
		'pDim', cDim1, 'pSub', cSubClr, 'pEle', sElements, 
		'pDelim', sDelim,
		'pTemp', 1
	);
    ViewSubsetAssign( cCubTgt, cViewClr, cDim1, cSubClr );

####Subset Creation for }APQ Time Day in Year dimension

    sStartday = sdayFrom;
    if(subsetexists(cDim2,cSubclr) = 1);
      subsetdestroy(cDim2,cSubclr);
    endif;
    subsetcreate(cDim2,cSubclr);
    subsetelementinsert(cDim2,cSubClr,sStartday,1);
    sdate=sDayFrom;
    nCtr =2;
    nDimsize = Dimsiz(cDim2);
    While(nCtr < nDimsize);
      sNextDay = ATTRS (cDim2,sDate,'Next Day');
      sDate=sNextDay;
      subsetelementinsert(cDim2,cSubClr,sDate,nctr);
      If(sNextDay @= sDayTo);
        nCtr = nDimSize;
      endif;
      nCtr = nCtr+1;
    end;
    ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );

####Subset Creation for }APQ Pulse Workbook Tracker Measure dimension
    
    if(subsetexists(cDim8,cSubclr) = 1);
      subsetdestroy(cDim8,cSubclr);
    endif;
    subsetcreate(cDim8,cSubclr);
    nCtr = 1;
    nMeasureDimsiz = Dimsiz(cDim8);
    nIndex = 1;
    sElement = '';
    while (nCtr <= nMeasureDImsiz);
      sElement = Dimnm(cDim8,nIndex);
      if(sElement @<> 'CubeViewer' & sElement @<> 'Websheet');
        Subsetelementinsert(cDim8,cSubclr,sElement,1);
      endif;
      nIndex = nIndex+1;
      nCtr = nCtr+1;
    end;
    ViewSubsetAssign( cCubTgt, cViewClr, cDim8, cSubClr );
    ViewZeroout(cCubTgt,cViewClr);

####End of Case 1###############


##### Case 2: Performing View Zero Out for Consecutive years
  elseif(nYearDiff = 1);
  sYear01 = sYearFrom;
  sYear02 = sYearTo;

##Step1: Creating a subset and Inserting Year in }APQ Time Year dimension 
## Step2: Creating a subset and Inserting Dayfrom to DayTo in }APQ Time Day in Year 
## Step3: Perform a view zero out

###Subset creation for }APQ Time Year dimension
  sProc1 = '}bedrock.hier.sub.create.byelement';
  ExecuteProcess( sProc1, 'pLogOutput', nDebug,
    'pDim', cDim1, 'pSub', cSubClr, 'pEle', sYear01, 
    'pDelim', sDelim,
    'pTemp', 1
  ); 
  ViewSubsetAssign( cCubTgt, cViewClr, cDim1, cSubClr );

###Subset creation for }APQ Time Day in Year dimension
  sStartday = sdayFrom;
  if(subsetexists(cDim2,cSubclr) = 1);
    subsetdestroy(cDim2,cSubclr);
  endif;
  subsetcreate(cDim2,cSubclr);
  subsetelementinsert(cDim2,cSubClr,sStartday,1);
  sdate=sDayFrom;
  nCtr =2;
  nDimsize = Dimsiz(cDim2);
  While(nCtr <= nDimsize);
    sNextDay = ATTRS (cDim2,sDate,'Next Day');
    sDate=sNextDay;
    subsetelementinsert(cDim2,cSubClr,sDate,nctr);
    If(sNextDay @= '12-31');
      nCtr = nDimSize;
    endif;
    nCtr = nCtr+1;
  end;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );

###Subset creation for }APQ Pulse Workbook Tracker Measure dimension
  if(subsetexists(cDim8,cSubclr) = 1);
    subsetdestroy(cDim8,cSubclr);
  endif;
  subsetcreate(cDim8,cSubclr);
  nCtr = 1;
  nMeasureDimsiz = Dimsiz(cDim8);
  nIndex = 1;
  sElement = '';
  While (nCtr <= nMeasureDImsiz);
    sElement = Dimnm(cDim8,nIndex);
    if(sElement @<> 'CubeViewer' & sElement @<> 'Websheet');
      Subsetelementinsert(cDim8,cSubclr,sElement,1);
    endif;
    nIndex = nIndex+1;
    nCtr = nCtr+1;
  end;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim8, cSubClr );
  ViewZeroout(cCubTgt,cViewClr);

###Subset creation for }APQ Time Year dimension
  ExecuteProcess( sProc1, 'pLogOutput', nDebug,
    'pDime', cDim1, 'pSub', cSubClr, 'pEle', sYear02, 
    'pDelim', sDelim,
    'pTemp', 1
  ); 
  ViewSubsetAssign( cCubTgt, cViewClr, cDim1, cSubClr );

###Subset creation for }APQ Time Day in Year dimension
  sDate = '01-01'; 
  subsetelementinsert(cDim2,cSubClr,sDate,1);
  nCtr = 2;
  While(nCtr <= nDimsize);
    sNextDay = ATTRS (cDim2,sDate,'Next Day');
    sDate = sNextDay;
    subsetelementinsert(cDim2,cSubClr,sDate,nctr);
    If(sDate @= sDayTo);
      nCtr = nDimSize;
    endif;
    nCtr = nCtr+1;
  end;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );

###Subset creation for }APQ Pulse Workbook Tracker Measure dimension
  nCtr = 1;
  nMeasureDimsiz = Dimsiz(cDim8);
  nIndex = 1;
  sElement = '';
  While (nCtr <= nMeasureDImsiz);
    sElement = Dimnm(cDim8,nIndex);
    if(sElement @<> 'CubeViewer' & sElement @<> 'Websheet');
      Subsetelementinsert(cDim8,cSubclr,sElement,1);
    endif;
    nIndex = nIndex+1;
    nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim8, cSubClr );
  ViewZeroout(cCubTgt,cViewClr);

####End of Case 2##### 

##### Case 3: Performing View Zero Out for date range
  elseif(nYearDiff >1);
    sYearFrom = Subst(pDatefrom,1,4);
    sYearTo = Subst(pDateTo,1,4);
    sYear01 = sYearFrom;
    sYear02 = sYearTo;
    nYearFrom = StringtoNumber(sYearFrom); 
    nYearTo = StringtoNumber(sYearTo);
    nYearNext = nYearFrom + 1;
    nYearBefore = nYearTo - 1;
    sYearNext = NumbertoString(nYearNext);
    sYearBefore = NumbertoString(nYearBefore);

##Step1: Creating a subset and Inserting YearFrom in }APQ Time Year dimension 
## Step2: Creating a subset and Inserting Dayfrom to 12-31 in }APQ Time Day in Year 
## Step3: Perform a view zero out

#####Subset creation for }APQ Time Year dimension
  sProc1 = '}bedrock.hier.sub.create.byelement';
  ExecuteProcess( sProc1, 'pLogOutput', nDebug,
    'pDim', cDim1, 'pSub', cSubClr, 'pEle', sYear01, 
    'pDelim', sDelim,
    'pTemp', 1
  ); 
  ViewSubsetAssign( cCubTgt, cViewClr, cDim1, cSubClr );

###Subset creation for }APQ Time Day in Year dimension
  sStartday = sdayFrom;
  if(subsetexists(cDim2,cSubclr) = 1);
    subsetdestroy(cDim2,cSubclr);
  endif;
  subsetcreate(cDim2,cSubclr);
  subsetelementinsert(cDim2,cSubClr,sStartday,1);
  sdate=sDayFrom;
  nCtr =2;
  nDimsize = Dimsiz(cDim2);
  While(nCtr <= nDimsize);
    sNextDay = ATTRS (cDim2,sDate,'Next Day');
    sDate=sNextDay;
    subsetelementinsert(cDim2,cSubClr,sDate,nctr);
    If(sNextDay @= '12-31');
      nCtr = nDimSize;
    endif;
    nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );

###Subset creation for }APQ Pulse Workbook Tracker Measure dimension
  if(subsetexists(cDim8,cSubclr) = 1);
    subsetdestroy(cDim8,cSubclr);
  endif;
  subsetcreate(cDim8,cSubclr);
  nCtr = 1;
  nMeasureDimsiz = Dimsiz(cDim8);
  nIndex = 1;
  sElement = '';
  While (nCtr <= nMeasureDImsiz);
     sElement = Dimnm(cDim8,nIndex);
     If(sElement @<> 'CubeViewer' & sElement @<> 'Websheet');
       Subsetelementinsert(cDim8,cSubclr,sElement,1);
     Endif;
     nIndex = nIndex+1;
     nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim8, cSubClr );
  ViewZeroout(cCubTgt,cViewClr);

##Step1: Creating a subset and Inserting in between years in }APQ Time Year dimension 
## Step2: Creating a subset and Inserting all days i.e 01-01 to 12-31 in }APQ Time Day in Year 
## Step3: Perform a view zero out

#####Subset creation for }APQ Time Year dimension
  sStartYear = sYearFrom;
  sYear=sYearFrom;
  nCtr =1;
  nYearDimsize = Dimsiz(cDim1);
  While(nCtr < nYearDimsize);
    sNextYear = ATTRS (cDim1,sYear,'Next Year');
    sYear=sNextyear;
    subsetelementinsert(cDim1,cSubClr,sYear,nctr);
    If(sNextYear @>= NumbertoString(nYearBefore));
      nCtr = nYearDimSize;
    endif;
    nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim1, cSubClr );
 
#####Subset creation for }APQ Time Day in Year dimension
  sDate = '01-01'; 
  subsetelementinsert(cDim2,cSubClr,sDate,1);
  nCtr = 2;
  nMonDimsize = Dimsiz(cDim2);
  While(nCtr <= nMonDimsize);
    sNextDay = ATTRS (cDim2,sDate,'Next Day');
    sDate=sNextDay;
    subsetelementinsert(cDim2,cSubClr,sDate,nctr);
    If(sDate @= '12-31');
      nCtr = nMonDimSize;
    endif;
    nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );

#####Subset creation for }APQ Pulse Workbook Tracker Measure dimension
  nCtr = 1;
  nMeasureDimsiz = Dimsiz(cDim8);
  nIndex = 1;
  sElement = '';
  While (nCtr <= nMeasureDImsiz);
    sElement = Dimnm(cDim8,nIndex);
    if(sElement @<> 'CubeViewer' & sElement @<> 'Websheet');
      Subsetelementinsert(cDim8,cSubclr,sElement,1);
    endif;
    nIndex = nIndex+1;
    nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim8, cSubClr );
  ViewZeroout(cCubTgt,cViewClr);

##Step1: Creating a subset and Inserting YearTo in }APQ Time Year dimension 
## Step2: Creating a subset and Inserting days from 01-01 to DayTo in }APQ Time Day in Year 
## Step3: Perform a view zero out

#####Subset creation for }APQ Time Year dimension
  ExecuteProcess( sProc1, 'pLogOutput', nDebug,
    'pDim', cDim1, 'pSub', cSubClr, 'pEle', sYear02, 
    'pDelim', sDelim,
    'pTemp', 1
  ); 
  ViewSubsetAssign( cCubTgt, cViewClr, cDim1, cSubClr );

#####Subset creation for }APQ Time Day in Year dimension
  sDate = '01-01'; 
  subsetelementinsert(cDim2,cSubClr,sDate,1);
  nCtr = 2;
  While(nCtr <= nDimsize);
    sNextDay = ATTRS (cDim2,sDate,'Next Day');
    sDate=sNextDay;
    subsetelementinsert(cDim2,cSubClr,sDate,nctr);
    If(sDate @= sDayTo);
      nCtr = nDimSize;
    endif;
    nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );

#####Subset creation for }APQ Pulse Workbook Tracker Measure dimension
  nCtr = 1;
  nMeasureDimsiz = Dimsiz(cDim8);
  nIndex = 1;
  sElement = '';
  While (nCtr <= nMeasureDImsiz);
     sElement = Dimnm(cDim8,nIndex);
     if(sElement @<> 'CubeViewer' & sElement @<> 'Websheet');
       Subsetelementinsert(cDim8,cSubclr,sElement,1);
     endif;
     nIndex = nIndex+1;
     nCtr = nCtr+1;
  End;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim8, cSubClr );
  ViewZeroout(cCubTgt,cViewClr);

###End of Case 3#####
  Endif;
Endif;

######End of View Zero Out#######

### Assign data source

# ------ >  ODBC
DataSourceType = 'ODBC';
DataSourceNameForServer = cODBC ;
DatasourceUserName = cODBCUser;
DatasourcePassword = cODBCPwd;

#####Assigning ODBC Query

If(pDateFrom @<> ' ' & pDateTo @<> ' ');
    sQuery = 
'SELECT   ServerName
       , Opentime 
       , Closetime 
       , Username 
       , ActionType 
       , Workbookpath 
       , Workbooktype 
       , TM1Logins 
FROM     [WorkbookLog] 
WHERE    Opentime >= ' | pQuote | pDateFrom | pQuote | ' AND Opentime <= ' | pQuote | pDateTo | ' 23:59:59' | pQuote | ' AND tm1logins LIKE ' | pQuote | cServer | '%' | pQuote | ' 
ORDER BY Opentime Desc;';

Else;
    sQuery = 
'SELECT   ServerName
       , Opentime 
       , Closetime 
       , Username 
       , ActionType 
       , Workbookpath 
       , Workbooktype 
       , TM1Logins 
FROM     [WorkbookLog] 
WHERE    tm1logins LIKE ' | pQuote | cServer | '%' | pQuote | ' 
ORDER BY Opentime Desc;';
    
EndIf;

DatasourceQuery = sQuery;

### END Prolog
573,158
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
  nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Metadata.log';

######################
### Metadata script
sPath = '';

 IF( DIMIX( cDim3 , vServername ) = 0 );
   DimensionElementInsert( cDim3 , '', vServername , 'N' );
   DimensionElementComponentAdd( cDim3 , 'Total' | Subst(cDim3,2,long(cDim3)) , vServername , 1 );
 ENDIF;

IF( Scan( ':', vtm1logins ) > 0 );
   sTM1Server = SubSt( vtm1logins, 1, Scan( ':', vtm1logins ) - 1 );
Else;
   sTM1Server = cServer;
EndIF;

IF( DIMIX( cDim4 , sTM1Server ) = 0 );
   DimensionElementInsert( cDim4 , '', sTM1Server , 'N' );
   DimensionElementComponentAdd( cDim4 , 'Total' | Subst(cDim4,2,long(cDim4)) , sTM1Server , 1 );
ENDIF;

  IF( vUsername @= '' );
    sUser = 'Unknown';
  ELse;
    sUser = vUsername;
  Endif;


#Region "Workbook Path & Name"

nFound = 0;
IF( vActionType @= 'Open' % vActionType @= 'Close' % vActionType @= 'Saved');
  nPathLen = Long(vWorkbookpath);
  nCtr = 1 ;
  nLastSlash = 0;
  WHILE( nCtr <= nPathLen);
    sChar = SUBST( vWorkbookpath , nCtr , 1);
      IF( sChar @= '\' );
        nLastSlash = nCtr;
      ENDIF;
    nCtr = nCtr +1;
  END;
  sPath = SUBST( vWorkbookpath ,1 , nLastSlash-1 );
  sWorkbook = SUBST( vWorkbookpath ,nLastSlash +1 , nPathLen - nLastSlash );
    
  IF( SUBST( sPath , 1, 9) @='C:\Users\');
    sPath = SUBST( vWorkbookpath ,1 , nLastSlash-1 );
    sWorkbook = SUBST( vWorkbookpath ,nLastSlash +1 , nPathLen - nLastSlash );
  ELSEIF( SUBST( sPath , 1, 12) @='Applications' % Scan(cPath1,sPath) > 0 % Scan(cPath2,sPath) > 0 % Scan(cPath3,sPath) > 0 % Scan(cPath4,sPath) > 0 % Scan(cPath5,sPath) > 0);
    nFound = 1;
  ENDIF;
Else;
  nPathLength = Long(vWorkbookpath);
  nCtr = 1 ;
  nColon = 0;
  WHILE( nCtr <= nPathLength);
    sChar1 = SUBST( vWorkbookpath , nCtr , 1);
      IF( sChar1 @= ':' );
        nColon = nCtr;
      ENDIF;
    nCtr = nCtr +1;
  END;
  sWorkbook1 = SUBST( vWorkbookpath ,nColon +1 , nPathLength - nColon );
  nFound = 1;
ENDIF;

 
#End Region
 
  if(Dimix(cDim5,sPath) >0);
    DimensionElementInsert( cDim5, '', sPath , 'N' );
  Endif;

If(nfound = 1);
  If( SubSt(sPath,1,12) @= 'Applications' );
      DimensionElementComponentAdd( cDim5 , 'TM1 Applications' , sPath , 1 );
   ELSEIF( Scan(cPath1,sPath) > 0 & cPath1 @<>'');
      DimensionElementComponentAdd( cDim5 , 'Workbook Path1' , sPath , 1 );
   ELSEIF( Scan(cPath2,sPath) > 0 & cPath2 @<>'');
      DimensionElementComponentAdd( cDim5 , 'Workbook Path2' , sPath , 1 );
   ELSEIF( Scan(cPath3,sPath) > 0 & cPath3 @<>'');
      DimensionElementComponentAdd( cDim5 , 'Workbook Path3' , sPath , 1 );
   ELSEIF( Scan(cPath4,sPath) > 0 & cPath4 @<>'');
      DimensionElementComponentAdd( cDim5 , 'Workbook Path4' , sPath , 1 );
   ELSEIF( Scan(cPath5,sPath) > 0 & cPath5 @<>'');
      DimensionElementComponentAdd( cDim5 , 'Workbook Path5' , sPath , 1 );
   Endif;
ELSE;
    DimensionElementComponentAdd( cDim5 , 'Non Supported' , sPath , 1 ); 
ENDIF;

#Start: Update APQ Pulse Workbook

sWorkbook = TRIM(sWorkbook);
  if(Dimix(cDim6,sWorkbook) > 0); 
     DimensionElementInsert(  cDim6 , '', sWorkbook , 'N' );
     DimensionElementInsert(  cDim6 , '', sWorkbook1 , 'N' );
  Endif;

if(nFound = 1);
   If(Scan('Applications', sPath) > 0);
      DimensionElementComponentAdd( cDim6 , 'TM1 Applications' , sWorkbook , 1 );
   ELSEIF( Scan(cPath1,sPath) > 0 & cPath1 @<>'');
      DimensionElementComponentAdd( cDim6 , 'Workbook Path1' , sWorkbook , 1 );
   ELSEIF( Scan(cPath2,sPath) > 0 & cPath2 @<>'');
      DimensionElementComponentAdd( cDim6 , 'Workbook Path2' , sWorkbook , 1 );
   ELSEIF( Scan(cPath3,sPath) > 0 & cPath3 @<>'');
      DimensionElementComponentAdd( cDim6 , 'Workbook Path3' , sWorkbook , 1 );
   ELSEIF( Scan(cPath4,sPath) > 0 & cPath4 @<>'');
      DimensionElementComponentAdd( cDim6 , 'Workbook Path4' , sWorkbook , 1 );
   ELSEIF( Scan(cPath5,sPath) > 0 & cPath5 @<>'');
      DimensionElementComponentAdd( cDim6 , 'Workbook Path5' , sWorkbook , 1 );
   ELSEIF( Scan('Active Form',vWorkbooktype) > 0);
      DimensionElementComponentAdd( cDim6 , 'Active Form' , sWorkbook1 , 1 );
   ELSEIF(Scan('Slice',vWorkbooktype) > 0);
      DimensionElementComponentAdd( cDim6 , 'Sliced Reports' , sWorkbook1 , 1 );
   Endif;
ELSE;
    DimensionElementComponentAdd( cDim6 , 'Non Supported' , sWorkbook , 1 );
ENDIF;

#End: Update APQ Pulse Workbook
 
  nDelimIndex = Scan(':',vTM1Logins);
  sTM1User = Subst(vTM1Logins,nDelimIndex+1,long(vTM1Logins)-nDelimIndex);

  if(Dimix(cDim7,sUser)=0);
      DimensionElementInsert(  cDim7 , '', vUsername , 'N' );
      DimensionElementComponentAdd( cDim7 , 'Total' | Subst(cDim7,2,long(cDim7)) , vUsername , 1 );
  Endif;

  if(Dimix(cDim8,vActionType)=0);
   vActionType = TRIM(vActionType);
   DimensionElementInsert(  cDim8 , '', vActionType , 'N' );
  Endif;

### END Metadata

574,84
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
sPath = '';
sMonth = SUBST( vOpentime , 6 , 5);
sYear = SubST(vOpentime,1,4);

IF( Scan( ':', vtm1logins ) > 0 );
   sTM1Server = SubSt( vtm1logins, 1, Scan( ':', vtm1logins ) - 1 );
Else;
   sTM1Server = cServer;
EndIF; 

#####Region "Workbook Path & Name"

nFound = 0;
IF( vActionType @= 'Open' % vActionType @= 'Close' % vActionType @= 'Saved');
  nPathLen = Long(vWorkbookpath);
  nCtr = 1 ;
  nLastSlash = 0;
  WHILE( nCtr <= nPathLen);
    sChar = SUBST( vWorkbookpath , nCtr , 1);
      IF( sChar @= '\' );
        nLastSlash = nCtr;
      ENDIF;
    nCtr = nCtr +1;
  END;
  sPath = SUBST( vWorkbookpath ,1 , nLastSlash-1 );
  sWorkbook = SUBST( vWorkbookpath ,nLastSlash +1 , nPathLen - nLastSlash );
    
  IF( SUBST( sPath , 1, 9) @='C:\Users\');
    sPath = SUBST( vWorkbookpath ,1 , nLastSlash-1 );
    sWorkbook = SUBST( vWorkbookpath ,nLastSlash +1 , nPathLen - nLastSlash );
  ELSEIF( SUBST( sPath , 1, 12) @='Applications' % Scan(cPath1,sPath) > 0 % Scan(cPath2,sPath) > 0 % Scan(cPath3,sPath) > 0 % Scan(cPath4,sPath) > 0 % Scan(cPath5,sPath) > 0);
    nFound = 1;
  ENDIF;
Else;
  nPathLength = Long(vWorkbookpath);
  nCtr = 1 ;
  nColon = 0;
  WHILE( nCtr <= nPathLength);
    sChar1 = SUBST( vWorkbookpath , nCtr , 1);
      IF( sChar1 @= ':' );
        nColon = nCtr;
      ENDIF;
    nCtr = nCtr +1;
  END;
  sWorkbook1 = SUBST( vWorkbookpath ,nColon +1 , nPathLength - nColon );
  nFound = 1;
ENDIF;

#####End Region

  sWorkbook = TRIM(sWorkbook);
IF( vActionType @= 'Open' % vActionType @= 'Close' % vActionType @= 'Saved');
  CELLINCREMENTN( 1, cCubTgt , sYear,sMonth,vServername, sTM1Server, sPath , sWorkbook , vUsername, vActiontype );
ElseIf(vActiontype @= 'Active Form');
    CELLINCREMENTN( 1, cCubTgt , sYear,sMonth,vServername, sTM1Server, 'Active Form' , sWorkbook1 , vUsername, 'Active Form' );
Else;
    CELLINCREMENTN( 1, cCubTgt , sYear,sMonth,vServername, sTM1Server, 'Slice' , sWorkbook1 , vUsername, 'Slice' );
Endif;


### END Data
575,51
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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
### Logging - common script 	-----------------  END
##############################################################################################################

######################
### Call sub-process

sProc = '}APQ.Cub.PulseWorkbookTracker.Update.Weblog';
ExecuteProcess( 	sProc,
		'pDateFrom', pDateFrom, 'pDateTo', pDateTo, 
		'pZeroTarget', pZeroTarget, 
		'pQuote', pQuote, 
		'pDoProcessLogging', pDoProcessLogging, 
		'pDebug', pDebug, 
		'pServer', pServer 
);

######################
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
