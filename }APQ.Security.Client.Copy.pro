601,100
602,"}APQ.Security.Client.Copy"
562,"VIEW"
586,"}APQ Security Manage Client Groups"
585,"}APQ Security Manage Client Groups"
564,
565,"aaYyYvcQKkV:zA<yipZHzQFkOB7\IXhp=zu2S^6^7CTm4O_T`T2CSq6e9zDM@;g38n8DHBJPleZLxm^C[2FcUe;5H2Yd^9fK^8f?ZR5X2rgXeWet1>9JlwXJaL6NXl`e>uSM_3dLa^b]b4GkHyNkmON`5<Ki6b`DpIU\qhgwHQ_AM@0haqXG__X@^L:9d:ys1wZQ<=ep"
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
568,"'"
570,Assign Client to Group
571,
569,1
592,0
599,1000
560,5
pSrcClient
pTgtClient
pPassword
pMode
pDelim
561,5
2
2
2
2
2
590,5
pSrcClient,""
pTgtClient,""
pPassword,""
pMode,"REPLACE"
pDelim,""
637,5
pSrcClient,"Optional: Source Client (If blank then clients will only be created and no group memberships copied)"
pTgtClient,"Required: List of Target Clients Separated by Delimiter"
pPassword,"Optinal: Initial password for new users only. Parameter is ignorred for already existing users."
pMode,"Optional: Mode REPLACE or ADD (default = REPLACE)"
pDelim,"Optional: Delimiter (Use for a list of target users. Defaults to standard list delimiter if blank.)"
577,4
vClient
vGroup
vMeasure
vValue
578,4
2
2
2
2
579,4
1
2
3
4
580,4
0
0
0
0
581,4
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,196
##############################################################################################################
#Region - Header
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
#Region @DOC
### PURPOSE:
###     Copy all user group associations from one user to a target user or list of users.
###     Any users in the pTgtClient list not already existing will be created.
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Initialize Logging
pDoProcessLogging = '1'; sThisProcName = GetProcessName(); sProcLogParams = '';
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQProcesses',sThisProcName)=0);ExecuteProcess('}APQ.Dim.ControlDimensionCopies.Update','pDoProcessLogging',pDoProcessLogging,'pClear','0');EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Initialize Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

cCubSrc         = '}APQ Security Manage Client Groups';
cCubTgt         = cCubSrc;
cDimSrc         = '}Clients';
cDimTgt         = '}APQ Clients';
cCubParam       = '}APQ Settings';
cAlias          = '}TM1_DefaultDisplayValue';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;
cTotAdmin       = 'Admin Users';
cTotUser        = 'End Users';
sFilter         = '';
nErr            = 0;
sErr            = '';

### Check Params
# If no source client has been specified then terminate process
If( DimIx( cDimSrc, pSrcClient ) = 0 & pSrcClient @<> '' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Source client does not exist ' | pSrcClient;
ElseIf( DimIx( cDimTgt, pSrcClient ) = 0 & pSrcClient @<> '' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Source client does not exist in framework ' | pSrcClient;
ElseIf( pSrcClient @<> '' );
    pSrcClient = DimensionElementPrincipalName( cDimSrc, pSrcClient );
    If( CellGetS( '}ClientGroups', pSrcClient, 'ADMIN' ) @= 'ADMIN' );
        sTotUser = cTotAdmin;
    Else;
        sTotUser = cTotUser;
    EndIf;
Else;
    sTotUser = cTotUser;
EndIf;

# If unsupported mode specified then abort
If( pMode @= '' );
    pMode = 'REPLACE';
ElseIf( pMode @<> 'ADD' & pMode @<> 'REPLACE' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid mode ' | pMode;
EndIf;

# Check list delimiter
If( pDelim @= '' );
    pDelim = sDelimList;
EndIf;

# If no target clients have been specified then terminate process
If( Trim( pTgtClient ) @= '' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No target client(s) specified.';
EndIf;

### Error check
If( nErr > 0 );
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIf;

### Split pClients into individual Clients and add only if they don't exist
sClients            = Trim( pTgtClient );
nDelimiterIndex     = 1;

# loop delimited string of target clients
While( nDelimiterIndex <> 0 );
    nDelimiterIndex = Scan( pDelim, sClients );
    If( nDelimiterIndex = 0 );
        sClient     = sClients;
    Else;
        sClient     = Trim( SubSt( sClients, 1, nDelimiterIndex - 1 ) );
        sClients    = Trim( Subst( sClients, nDelimiterIndex + Long(pDelim), Long( sClients ) ) );
    EndIf;
    # Don't attempt to add a blank client
    If( sClient @<> '' );
        If( DimIx( cDimTgt, sClient ) = 0 );
            DimensionElementInsert( cDimTgt, '', sClient, 'N' );
            DimensionElementComponentAdd( cDimTgt, sTotUser, sClient, 1 );
        Else;
            sClient = DimensionElementPrincipalName( cDimTgt, sClient );
            sFilter = sFilter | If( sFilter @<> '', sDelimEle, cDimTgt | sDelimEleStart ) | sClient;
        EndIf;
    EndIf;
End;

#  ZeroOut (only if pMode=REPLACE and sFilter is not empty)
If( pMode @= 'REPLACE' & sFilter @<> '' );
    sProc   = '}bedrock.cube.data.clear';
    nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', sFilter,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pTemp', 1, 'pCubeLogging', 0
    );
    If( nRet <> ProcessExitNormal() );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Error during ZeroOut.';
        DataSourceType = 'NULL';
        ItemReject( sErr );
    EndIf;
EndIF;

### Call bedrock process to create users in }Clients dimension and copy in }ClientGroups cube
If( pSrcClient @<> '' );
    ExecuteProcess( '}bedrock.security.client.clone', 'pLogOutput', StringToNumber(pDoProcessLogging), 'pStrictErrorHandling', 1, 
    	'pSrcClient', pSrcClient, 'pTgtClient', pTgtClient,
    	'pMode', pMode, 'pDelim', pDelim
    );
Else;
    ExecuteProcess( '}bedrock.security.client.create', 'pLogOutput', StringToNumber(pDoProcessLogging), 'pStrictErrorHandling', 1, 
        'pClient', pTgtClient, 'pAlias', pTgtClient, 
        'pPassword', pPassword, 'pDelim', pDelim
    );
EndIf;

### Create the view to assign as data source for the process
If( pSrcClient @<> '' );
    sProc           = '}bedrock.cube.view.create';
    sFilter         = Expand('%cDimTgt%%sDelimEleStart%%pSrcClient%%sDelimDim%%cCubTgt% Measure%sDelimEleStart%Assignment%sDelimEle%Inactive');
    # Adjust parameters for skipping of blanks / consols / rule calcs as required
    bSuppressNull   = 1;
    bSuppressC      = 0;
    bSuppressRule   = 1;
    nRet    = ExecuteProcess( sProc, 'pLogOutput', 0,
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
    
    DataSourceType          = 'VIEW';
    DataSourceNameForServer = cCubSrc;
    DatasourceCubeView      = cViewSrc;
Else;
    DataSourceType          = 'NULL';
EndIf;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,49
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

IF( pDoProcessLogging @= '1' );
   nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

### Split pClients into individual Clients and add only if they don't exist
sClients            = Trim( pTgtClient );
nDelimiterIndex     = 1;

# loop delimited string of target clients
While( nDelimiterIndex <> 0 );
    nDelimiterIndex = Scan( pDelim, sClients );
    If( nDelimiterIndex = 0 );
        sClient     = sClients;
    Else;
        sClient     = Trim( SubSt( sClients, 1, nDelimiterIndex - 1 ) );
        sClients    = Trim( Subst( sClients, nDelimiterIndex + Long(pDelim), Long( sClients ) ) );
    EndIf;
    If( DimIx( cDimTgt, sClient ) > 0 );
        If( value_is_string = 1 );
            # source client could be inactivated on total groups
            CellPutS( sValue, cCubTgt, sClient, vGroup, vMeasure );
        ElseIf( CellIsUpdateable( cCubTgt, sClient, vGroup, vMeasure ) = 1 );
            # leaf intersection for group assignment 
            CellPutN( nValue, cCubTgt, sClient, vGroup, vMeasure );
        EndIf;
    EndIf;
End;


######################
### END Data
575,27
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
#EndRegion - Finalize Logging
##############################################################################################################
### END Epilog
576,
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
