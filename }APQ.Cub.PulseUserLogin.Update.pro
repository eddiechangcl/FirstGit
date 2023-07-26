601,100
602,"}APQ.Cub.PulseUserLogin.Update"
562,"ODBC"
586,"PulseDocs"
585,"PulseDocs"
564,"admin"
565,"htwLI31Nasz?Rwn<G^16W^z5ZZ]VcZrTbj3FgKw]dDzDYtqU>P0Z[=D?cJ@E?uep8L7T1yzBnM`Ov4]5pJ;ilQ]1VR9POcbncZTsnYPX`T9V0FV=Fw?i?OD_^]T^2Z4MS_1lLRLr7UuEwXH<Dcv7bl=O@1jD55yCC6wnqN`R6SW@\kmeavZ_M>]GIFhh[O8[<ADhSJbH"
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
566,15
SELECT    ServerName
        , ServiceName
        , UserName
        , Substring(LoginTime , 1, 10 ) AS LoginDate 
        , Count(LoginTime) AS LoginCount
        , Sum(SessionTime) AS SessionTime
        , Sum(LogCount) AS LogCount
        , Sum(WaitingCount) AS WaitingCount
        , Sum(RunningCount) AS RunningCount
        , Sum(CommittingCount) AS CommittingCount
        , Sum(RollingBackCount) AS RollingBackCount
        , Sum(UserWaitingCount) AS UserWaitingCount 
FROM      [Session] 
WHERE     LoginTime >= '?pDateFrom?' AND LoginTime <= '?pDateTo?' 
GROUP BY  ServerName, ServiceName, UserName, LoginDate;
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
pDoProcessLogging
pDebug
pServer
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
pDoProcessLogging,"1"
pDebug,"0"
pServer,""
pClear,"1"
637,8
pDateFrom,"Start Date (Format: YYYY-MM-DD)"
pDateTo,"End Date (Format: YYYY-MM-DD)"
pZeroTarget,"Zero out Target Cube PRIOR to Load data? (Boolean 1=True)"
pQuote,"Quote"
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pServer,"TM1 Service Name (If Blank, Name taken from }APQ Settings)"
pClear,"Clear dimension elements"
577,12
vServerName
vServiceName
vUserName
vLoginDate
vLoginCount
vSessionTime
vLogCount
vWaitingCount
vRunningCount
vCommittingCount
vRollingBackCount
vUserWaitingCount
578,12
2
2
2
2
1
1
1
1
1
1
1
1
579,12
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
11
12
580,12
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
0
0
581,12
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
0
0
582,12
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
VarType=33ColType=827
603,0
572,490
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
### INTENDED USAGE: Loads the user details from Pulse DB (Pulse Monitor) to the }APQ Pulse User login cube
### 
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2017-04-24 		    Sayi        Creation of Process
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
cCubTgt         = '}APQ Pulse User Login';
cCubParam       = '}APQ Settings';
cDim1           = '}APQ Time Year';
cDim2           = '}APQ Time Day in Year';
cDim3           = '}APQ Pulse ServerName';
cDim4           = '}APQ Pulse Service Name';
cDim5           = '}APQ Clients';
cDim6           = '}APQ Pulse User Login Measure';
cWinSerName     = CellGetS( cCubParam, 'Windows Service Name', 'String' );
cTM1SerName     = CellGetS( cCubParam, 'TM1 Server Name', 'String' );
nPulseCfg       = CellGetN( cCubParam, 'Pulse ODBC', 'Numeric' );
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
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
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

### Validate parameters

###Check whether Pulse is installed. If not then terminate the process
If(  nPulseCfg <> 1 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Pulse is not installed'; 
Endif;

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
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid To date:' | pDateto; 
Endif;

if(Trim(pDateTo) @= '');
  pDateTo = sToday;
Else;
  pDateTo = pDateTo;
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
  Itemreject(sErr);
EndIF;

### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)

CubeSetLogChanges( cCubTgt, 0 );

### Deleting the dimension elements

IF( pClear @= '1' );
  DimensionDeleteAllElements( cDim3 );
  DimensionDeleteAllElements( cDim4 );
EndIF;

### Creating the consolidation elements in dimension

DimensionElementInsert( cDim3, '', 'Total ' | Subst(cDim3,2,long(cDim3)), 'C' );
DimensionElementInsert( cDim4, '', 'Total ' | Subst(cDim4,2,long(cDim4)), 'C' );

###  To Ceate a Target View and Zero out the data

### Create the view to assign as data source for the process

sProc           = '}bedrock.cube.view.create';
bSuppressNull   = 1;
bSuppressC      = 1;
bSuppressRule   = 1;
ExecuteProcess( sProc, 'pLogOutput', nDebug,
	'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', '',
	'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
	'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
	'pTemp', 1 
);

sYearFrom   = Subst(pDatefrom,1,4);
sYearTo     = Subst(pDateTo,1,4);
nYearDiff   = StringtoNumber(sYearTo) - StringtoNumber(sYearFrom);
sDayFrom    = Subst(pDateFrom,6,5);
sDayTo      = Subst(pDateTo,6,5);

####Zero out the target cube

if( pZeroTarget @= '1' );

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
  ViewZeroout(cCubTgt,cViewClr);

###Subset creation for }APQ Time Year dimension
  ExecuteProcess( sProc1, 'pLogOutput', nDebug,
    'pDim', cDim1, 'pSub', cSubClr, 'pEle', sYear02, 
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
    sDate=sNextDay;
    subsetelementinsert(cDim2,cSubClr,sDate,nctr);
    If(sDate @= sDayTo);
      nCtr = nDimSize;
    endif;
    nCtr = nCtr+1;
  end;
  ViewSubsetAssign( cCubTgt, cViewClr, cDim2, cSubClr );
  ViewZeroout(cCubTgt,cViewClr);

####End of Case 2##### 

##### Case 3: Performing View Zero Out for date range
  elseif(nYearDiff >1);
    sYearFrom   = Subst(pDatefrom,1,4);
    sYearTo     = Subst(pDateTo,1,4);
    sYear01     = sYearFrom;
    sYear02     = sYearTo;
    nYearFrom   = StringtoNumber(sYearFrom); 
    nYearTo     = StringtoNumber(sYearTo);
    nYearNext   = nYearFrom + 1;
    nYearBefore = nYearTo - 1;
    sYearNext   = NumbertoString(nYearNext);
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
  ViewZeroout(cCubTgt,cViewClr);

###End of Case 3#####
  Endif;
Endif;

######End of View Zero Out#######


### Assign data source

# ------ >  ODBC
DataSourceType          = 'ODBC';
DataSourceNameForServer = cODBC ;
DatasourceUserName      = cODBCUser;
DatasourcePassword      = cODBCPwd;

#####Assigning ODBC Query

If( pDateFrom @<> '' &  pDateTo @<> '' );
    sQuery = 
'SELECT    ServerName
        , ServiceName
        , UserName
        , Substring(LoginTime , 1, 10 ) AS LoginDate 
        , Count(LoginTime) AS LoginCount
        , Sum(SessionTime) AS SessionTime
        , Sum(LogCount) AS LogCount
        , Sum(WaitingCount) AS WaitingCount
        , Sum(RunningCount) AS RunningCount
        , Sum(CommittingCount) AS CommittingCount
        , Sum(RollingBackCount) AS RollingBackCount
        , Sum(UserWaitingCount) AS UserWaitingCount 
FROM      [Session] 
WHERE     LoginTime >= ' | pQuote | pDateFrom | pQuote | ' AND LoginTime <= ' | pQuote | pDateTo | pQuote | ' 
GROUP BY  ServerName, ServiceName, UserName, LoginDate;';

ElseIf( pDateFrom @<> '' & pDateTo @= '' );
    sQuery = 
'SELECT    ServerName
        , ServiceName
        , UserName
        , Substring(LoginTime , 1, 10 ) AS LoginDate 
        , Count(LoginTime) AS LoginCount
        , Sum(SessionTime) AS SessionTime
        , Sum(LogCount) AS LogCount
        , Sum(WaitingCount) AS WaitingCount
        , Sum(RunningCount) AS RunningCount
        , Sum(CommittingCount) AS CommittingCount
        , Sum(RollingBackCount) AS RollingBackCount
        , Sum(UserWaitingCount) AS UserWaitingCount 
FROM      [Session] 
WHERE     LoginTime >= ' | pQuote | pDateFrom | pQuote | ' 
GROUP BY  ServerName, ServiceName, UserName, LoginDate;';

ElseIf( pDateFrom @= '' & pDateTo @<> '' );
    sQuery = 
'SELECT    ServerName
        , ServiceName
        , UserName
        , Substring(LoginTime , 1, 10 ) AS LoginDate 
        , Count(LoginTime) AS LoginCount
        , Sum(SessionTime) AS SessionTime
        , Sum(LogCount) AS LogCount
        , Sum(WaitingCount) AS WaitingCount
        , Sum(RunningCount) AS RunningCount
        , Sum(CommittingCount) AS CommittingCount
        , Sum(RollingBackCount) AS RollingBackCount
        , Sum(UserWaitingCount) AS UserWaitingCount 
FROM      [Session] 
WHERE     LoginTime <= ' | pQuote | pDateTo | pQuote | ' 
GROUP BY  ServerName, ServiceName, UserName, LoginDate;';

Else;
    sQuery = 
'SELECT    ServerName
        , ServiceName
        , UserName
        , Substring(LoginTime , 1, 10 ) AS LoginDate 
        , Count(LoginTime) AS LoginCount
        , Sum(SessionTime) AS SessionTime
        , Sum(LogCount) AS LogCount
        , Sum(WaitingCount) AS WaitingCount
        , Sum(RunningCount) AS RunningCount
        , Sum(CommittingCount) AS CommittingCount
        , Sum(RollingBackCount) AS RollingBackCount
        , Sum(UserWaitingCount) AS UserWaitingCount 
FROM      [Session] 
GROUP BY  ServerName, ServiceName, UserName, LoginDate;';

EndIf;

DatasourceQuery = sQuery;

### END Prolog
573,44
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


If(StringtoNumber(pDebug) <=1);

  IF( DIMIX( cDim3 , vServername ) = 0 );
      DimensionElementInsert(  cDim3 , '', vServername , 'N' );
      DimensionElementComponentAdd( cDim3 , 'Total ' | Subst(cDim3,2,long(cDim3)) , vServername , 1 );
  ENDIF;

  IF( DIMIX( cDim4 , vServicename ) = 0 );
      DimensionElementInsert(  cDim4 , '', vServicename , 'N' );
      DimensionElementComponentAdd( cDim4 , 'Total ' | Subst(cDim4,2,long(cDim4)) , vServicename , 1 );
  ENDIF;

ENDIF;



### END Metadata

574,51
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

sYear = Subst(vLoginDate,1,4);
sMonthDay = Subst(vLoginDate,6,5);

If( Dimix( cDim3, vServername ) = 0 );
   Itemskip;
Endif;

If( Dimix( cDim4, vServiceName ) = 0 );
   Itemskip;
Endif;

If( Dimix( cDim5, vUsername ) = 0 );
   Itemskip;
Endif;

CELLPUTN( vLoginCount , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Login Count' );
CELLPUTN( vSessionTime , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Session Time' );
CELLPUTN( vLogCount , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Log Count' );
CELLPUTN( vWaitingCount , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Waiting Count' );
CELLPUTN( vRunningCount , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Running Count' );
CELLPUTN( vCommittingCount ,cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Committing Count' );
CELLPUTN( vRollingBackCount , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'Rolling Back Count' );
CELLPUTN( vUserWaitingCount , cCubTgt , sYear, sMonthDay, vServername, vServiceName, vUsername , 'User Waiting Count' );



### END Data
575,44
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

#####To update the Last login from Client table
sProc = '}APQ.Cub.PulseUserLogin.LastLogin.Update';
ExecuteProcess( sProc,
	'pDoProcessLogging',pDoProcessLogging ,
	'pDebug', pDebug, 
    'pServer',cServer
);

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
