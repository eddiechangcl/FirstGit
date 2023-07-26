601,100
602,"}APQ.Security.Group.Copy"
562,"NULL"
586,"}APQ Security Manage Client Groups"
585,"}APQ Security Manage Client Groups"
564,
565,"c17ajVQ_tG6`;^]IYc?1IiUkMiypQi2bD:V`8L8CNSTRe:Bt?d:_Il;R>bgvu>ul`u2^>y<lE9z:6L1TG706D61n=5[J5;xasFHm4xP8@Yh[Zh2_qMo4vricn;aK1y74pugeuyDTpn`qPYGwo\YF:g2Z7:?oO;5MK6pd\BF?FdU:0pd6Ba1p?axzZt`[]5Xn?Wo7NW5E"
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
570,Assign Client to Group
571,
569,0
592,0
599,1000
560,6
pSrcGrp
pTgtGrp
pMemberships
pPermissions
pMode
pDelim
561,6
2
2
2
2
2
2
590,6
pSrcGrp,""
pTgtGrp,""
pMemberships,"0"
pPermissions,"1"
pMode,"ADD"
pDelim,""
637,6
pSrcGrp,"Optional: Source Group (If blank then groups will only be created and no permissions or memberships copied. Ignorred if pMemberships=0 & pPermissions=0)"
pTgtGrp,"Required: List of Target Groups Separated by Delimiter"
pMemberships,"Optional: Copy user memberships to new group (default = FALSE). Ignorred if pSrcGrp is empty"
pPermissions,"Optional: Copy object permissions to new group (default = TRUE). Ignorred if pSrcGrp is empty"
pMode,"Optional: Mode REPLACE or ADD (default = ADD)"
pDelim,"Optional: Delimiter (Use for a list of target groups. Defaults to standard list delimiter if blank.)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,289
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
###     Either/Or copy
###         1. all user group associations from one group to a target group or list of groups.
###         2. all object security permissions from one group to a target group or list of groups.
###     Any groups in the pTgtGrp list not already existing will be created.
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Logging
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
#EndRegion - Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

cCubSrc         = '}ClientGroups';
cCubTgt1        = cCubSrc;
cCubTgt2        = '}APQ Security Manage Client Groups';
cCubTgt3        = '}APQ Security Manage Object Access';
cCubTgt4        = '}APQ Security Manage Element Access';
cDimSrc         = '}Groups';
cDimTgt         = '}APQ Groups';
cDimCubes       = '}Cubes';
cDimClient      = '}Clients';
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
cSecCubes       = Expand('}ApplicationSecurity%sDelimList%}ChoreSecurity%sDelimList%}CubeSecurity%sDelimList%}DimensionSecurity%sDelimList%}ProcessSecurity');
cBedrockTmp     = 1;
cTotGrp         = 'Total APQ Groups';
cTotEle         = 'Total APQ Element Security Groups';
sFilterGrps     = '';
nErr            = 0;
sErr            = '';

### Check Params
# If no source client has been specified then terminate process
If( DimIx( cDimSrc, pSrcGrp ) = 0 & pSrcGrp @<> '' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Source group does not exist ' | pSrcGrp;
ElseIf( DimIx( cDimTgt, pSrcGrp ) = 0 & pSrcGrp @<> '' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Source group does not exist in framework ' | pSrcGrp;
ElseIf( pSrcGrp @<> '' );
    pSrcGrp = DimensionElementPrincipalName( cDimSrc, pSrcGrp );
    If( AttrS( cDimTgt, pSrcGrp, 'ELEMENT_SECURITY' ) @<> '' );
        bEleSec = 1;
    Else;
        bEleSec = 0;
    EndIf;
Else;
    # pSrcGrp @= ''
    bEleSec = 0;
    pMemberships = '0';
    pPermissions = '0';
    pMode = 'ADD';
EndIf;

# If unsupported mode specified then abort
If( pMode @= '' );
    pMode = 'ADD';
ElseIf( pMode @<> 'ADD' & pMode @<> 'REPLACE' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid mode ' | pMode;
EndIf;

# If no target groups have been specified then terminate process
If( Trim( pTgtGrp ) @= '' );
    nErr = 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No target group(s) specified.';
EndIf;

# pMemberships & pPermissions
If( pMemberships @<> '1' );
    pMemberships = '0';
EndIf;
If( pPermissions @<> '1' );
    pPermissions = '0';
EndIf;

# Check list delimiter
If( pDelim @= '' );
    pDelim = sDelimList;
EndIf;

### Error check
If( nErr > 0 );
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIf;

# loop delimited string of target groups. Add new elements to both }Groups & }APQ Groups dimensions
sGroups             = Trim( pTgtGrp );
nDelimiterIndex     = 1;
While( nDelimiterIndex <> 0 );
    nDelimiterIndex = Scan( pDelim, sGroups );
    If( nDelimiterIndex = 0 );
        sGroup     = sGroups;
    Else;
        sGroup     = Trim( SubSt( sGroups, 1, nDelimiterIndex - 1 ) );
        sGroups    = Trim( Subst( sGroups, nDelimiterIndex + Long(pDelim), Long( sGroups ) ) );
    EndIf;
    # Don't attempt to add a blank group
    If( sGroup @<> '' );
        If( DimIx( cDimSrc, sGroup ) = 0 );
            AddGroup( sGroup );
        EndIf;
        If( DimIx( cDimTgt, sGroup ) = 0 );
            DimensionElementInsert( cDimTgt, '', sGroup, 'N' );
            DimensionElementComponentAdd( cDimTgt, cTotGrp, sGroup, 1 );
            If( bEleSec = 1 & pPermissions @= '1' );
                DimensionElementComponentAdd( cDimTgt, cTotEle, sGroup, 1 );
            EndIf;
        Else;
            sGroup = DimensionElementPrincipalName( cDimTgt, sGroup );
            sFilterGrps = sFilterGrps | If( sFilterGrps @<> '', sDelimEle, '' ) | sGroup;
        EndIf;
    EndIf;
End;

###  ZeroOut (only if pMode=REPLACE and sFilterGrps is not empty)
# Clear }ClientGroups if pMemberships=1 
If( pMode @= 'REPLACE' & pMemberships @= '1' & sFilterGrps @<> '' );
    sProc   = '}bedrock.cube.data.clear';
    sFilter = cDimSrc | sDelimEleStart | sFilterGrps;
    nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt1, 'pView', cViewClr, 'pFilter', sFilter,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pTemp', 1, 'pCubeLogging', 0
    );
    If( nRet <> ProcessExitNormal() );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Error during ZeroOut of %cCubTgt1%%.');
        DataSourceType = 'NULL';
        ItemReject( sErr );
    EndIf;
    sFilter = cDimTgt | sDelimEleStart | sFilterGrps;
    nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt2, 'pView', cViewClr, 'pFilter', sFilter,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pTemp', 1, 'pCubeLogging', 0
    );
    If( nRet <> ProcessExitNormal() );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Error during ZeroOut of %cCubTgt2%%.');
        DataSourceType = 'NULL';
        ItemReject( sErr );
    EndIf;
EndIF;

# Clear Object security cubes if pPermissions=1 
If( pMode @= 'REPLACE' & pPermissions @= '1' & sFilterGrps @<> '' );
    sProc   = '}bedrock.cube.data.clear';
    sFilter = cDimSrc | sDelimEleStart | sFilterGrps;
    # while loop through list of security cubes
    nDelimiterIndex     = 1;
    sSecCubes           = cSecCubes;
    While( nDelimiterIndex <> 0 );
        nDelimiterIndex = Scan( sDelimList, sSecCubes );
        If( nDelimiterIndex = 0 );
            sSecCube    = sSecCubes;
        Else;
            sSecCube    = Trim( SubSt( sSecCubes, 1, nDelimiterIndex - 1 ) );
            sSecCubes   = Trim( Subst( sSecCubes, nDelimiterIndex + Long( sDelimList ), Long( cSecCubes ) ) );
        EndIf;
        # Only attempt zero out if security cube exists
        If( CubeExists( sSecCube ) = 1 );
            nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
                'pCube', sSecCube, 'pView', cViewClr, 'pFilter', sFilter,
                'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
                'pTemp', 1, 'pCubeLogging', 0
            );
            If( nRet <> ProcessExitNormal() );
                nErr = nErr + 1;
                sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Error during ZeroOut of %sSecCube%%.');
                DataSourceType = 'NULL';
                ItemReject( sErr );
            EndIf;
        EndIf;
    End;    

    # Clear APQ cube for all combined object permissions
    sFilter = cDimTgt | sDelimEleStart | sFilterGrps;
    nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt3, 'pView', cViewClr, 'pFilter', sFilter,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pTemp', 1, 'pCubeLogging', 0
    );
    If( nRet <> ProcessExitNormal() );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Error during ZeroOut of %cCubTgt3%%.');
        DataSourceType = 'NULL';
        ItemReject( sErr );
    EndIf;
EndIF;

# Clear Element security cubes if pPermissions=1 
If( pMode @= 'REPLACE' & pPermissions @= '1' & sFilterGrps @<> '' );
    sProc   = '}bedrock.cube.data.clear';
    sFilter = cDimSrc | sDelimEleStart | sFilterGrps;
    # while loop through list of element security cubes
    sMDX    = Expand('{TM1FILTERBYPATTERN( {TM1SUBSETALL( [%cDimCubes%].[%cDimCubes%] )}, "}ElementSecurity_*")}');
    If( SubsetExists( cDimCubes, cSubSrc ) = 0 );
        SubsetCreatebyMDX( cSubSrc, sMDX, cDimCubes, 1 );
    Else;
        SubsetMDXSet( cDimCubes, cSubSrc, sMDX );
    EndIf;
    nMax    = SubsetGetSize( cDimCubes, cSubSrc );
    nCtr    = 1;
    While( nCtr <= nMax );
        sSecCube        = SubsetGetElementName( cDimCubes, cSubSrc, nCtr );
        # Only attempt zero out if security cube exists
        If( CubeExists( sSecCube ) = 1 );
            nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
                'pCube', sSecCube, 'pView', cViewClr, 'pFilter', sFilter,
                'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
                'pTemp', 1, 'pCubeLogging', 0
            );
            If( nRet <> ProcessExitNormal() );
                nErr = nErr + 1;
                sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Error during ZeroOut of %sSecCube%%.');
                DataSourceType = 'NULL';
                ItemReject( sErr );
            EndIf;
        EndIf;
        nCtr = nCtr + 1;
    End;    

    # Clear APQ cube for all combined element permissions
    sFilter = cDimTgt | sDelimEleStart | sFilterGrps;
    nRet = ExecuteProcess( sProc, 'pLogOutput', 0,
        'pCube', cCubTgt4, 'pView', cViewClr, 'pFilter', sFilter,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pTemp', 1, 'pCubeLogging', 0
    );
    If( nRet <> ProcessExitNormal() );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand( 'Error during ZeroOut of %cCubTgt3%%.');
        DataSourceType = 'NULL';
        ItemReject( sErr );
    EndIf;
EndIF;

### Data source
DataSourceType          = 'NULL';

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,157
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

### Copy the memberships and/or permissions from the source group to the target group(s)

# memberships
If( pMemberships @= '1' & nErr = 0 );
    # outer loop delimited string of target groups. For each group copy the memberships source->target
    # inner loop of clients. If member of source group, assign to target group
    sGroups             = Trim( pTgtGrp );
    nDelimiterIndex     = 1;
    While( nDelimiterIndex <> 0 );
        nDelimiterIndex = Scan( pDelim, sGroups );
        If( nDelimiterIndex = 0 );
            sGroup     = sGroups;
        Else;
            sGroup     = Trim( SubSt( sGroups, 1, nDelimiterIndex - 1 ) );
            sGroups    = Trim( Subst( sGroups, nDelimiterIndex + Long(pDelim), Long( sGroups ) ) );
        EndIf;
        If( DimIx( cDimSrc, sGroup ) > 0 );
            nCtr = 1;
            nMax = DimSiz( cDimClient );
            While( nCtr <= nMax );
                sClient = DimNm( cDimClient, nCtr );
                If( CellGetS( cCubTgt1, sClient, pSrcGrp ) @= pSrcGrp );
                    AssignClientToGroup( sClient, sGroup );
                EndIf;
                nCtr = nCtr + 1;
            End;
        EndIf;
        If( DimIx( cDimTgt, sGroup ) > 0 );
            sProc   = '}bedrock.cube.data.copy';
            sFilter = cDimTgt | sDelimEleStart | pSrcGrp;
            sTgtMap = sFilter | '->' | sGroup;
            ExecuteProcess( sProc, 'pLogOutput', 0,
            	'pCube', cCubTgt2, 'pSrcView', cViewSrc, 'pTgtView', '',
            	'pFilter', sFilter, 'pFilterParallel', '', 'pEleMapping', sTgtMap,
            	'pMappingDelim', '->', 'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
            	'pFactor', 1, 'pSuppressRules', 1, 'pCumulate', 0, 'pZeroTarget', 0, 'pZeroSource', 0,
            	'pTemp', 1, 'pCubeLogging', 0, 'pThreadMode', 0 
            );
        EndIf;
    End;
EndIf;

# object & element permissions
If( pPermissions @= '1' & nErr = 0 );
    sProc   = '}bedrock.cube.data.copy';
    # Outer loop delimited string of target groups. For each group copy the permissions source->target
    # Inner loop 1 delimited string of possible security cubes
    # Inner loop 2 subset of element security cubes
    sGroups             = Trim( pTgtGrp );
    nDelimiterIndex     = 1;
    While( nDelimiterIndex <> 0 );
        nDelimiterIndex = Scan( pDelim, sGroups );
        If( nDelimiterIndex = 0 );
            sGroup     = sGroups;
        Else;
            sGroup     = Trim( SubSt( sGroups, 1, nDelimiterIndex - 1 ) );
            sGroups    = Trim( Subst( sGroups, nDelimiterIndex + Long(pDelim), Long( sGroups ) ) );
        EndIf;
        If( DimIx( cDimSrc, sGroup ) > 0 );
            sFilter = cDimSrc | sDelimEleStart | pSrcGrp;
            sTgtMap = sFilter | '->' | sGroup;
            # while loop through list of security cubes
            nDelimiterIndex2    = 1;
            sSecCubes           = cSecCubes;
            While( nDelimiterIndex2 <> 0 );
                nDelimiterIndex2 = Scan( sDelimList, sSecCubes );
                If( nDelimiterIndex2 = 0 );
                    sSecCube    = sSecCubes;
                Else;
                    sSecCube    = Trim( SubSt( sSecCubes, 1, nDelimiterIndex2 - 1 ) );
                    sSecCubes   = Trim( Subst( sSecCubes, nDelimiterIndex2 + Long( sDelimList ), Long( cSecCubes ) ) );
                EndIf;
                # Only attempt copy if security cube exists
                If( CubeExists( sSecCube ) = 1 );
                    ExecuteProcess( sProc, 'pLogOutput', 0,
                    	'pCube', sSecCube, 'pSrcView', cViewSrc, 'pTgtView', '',
                    	'pFilter', sFilter, 'pFilterParallel', '', 'pEleMapping', sTgtMap,
                    	'pMappingDelim', '->', 'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
                    	'pFactor', 1, 'pSuppressRules', 1, 'pCumulate', 0, 'pZeroTarget', 0, 'pZeroSource', 0,
                    	'pTemp', 1, 'pCubeLogging', 0, 'pThreadMode', 0 
                    );
                EndIf;
            End;    
            # while loop through subset of element security cubes
            sMDX    = Expand('{TM1FILTERBYPATTERN( {TM1SUBSETALL( [%cDimCubes%].[%cDimCubes%] )}, "}ElementSecurity_*")}');
            If( SubsetExists( cDimCubes, cSubSrc ) = 0 );
                SubsetCreatebyMDX( cSubSrc, sMDX, cDimCubes, 1 );
            Else;
                SubsetMDXSet( cDimCubes, cSubSrc, sMDX );
            EndIf;
            nMax    = SubsetGetSize( cDimCubes, cSubSrc );
            nCtr    = 1;
            While( nCtr <= nMax );
                sSecCube        = SubsetGetElementName( cDimCubes, cSubSrc, nCtr );
                # Only attempt copy if security cube exists
                If( CubeExists( sSecCube ) = 1 );
                    ExecuteProcess( sProc, 'pLogOutput', 0,
                    	'pCube', sSecCube, 'pSrcView', cViewSrc, 'pTgtView', '',
                    	'pFilter', sFilter, 'pFilterParallel', '', 'pEleMapping', sTgtMap,
                    	'pMappingDelim', '->', 'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
                    	'pFactor', 1, 'pSuppressRules', 1, 'pCumulate', 0, 'pZeroTarget', 0, 'pZeroSource', 0,
                    	'pTemp', 1, 'pCubeLogging', 0, 'pThreadMode', 0 
                    );
                EndIf;
                nCtr = nCtr + 1;
            End;    
        EndIf;
        # single framework cube for all object permissions 
        If( DimIx( cDimTgt, sGroup ) > 0 );
            sFilter = cDimTgt | sDelimEleStart | pSrcGrp;
            sTgtMap = sFilter | '->' | sGroup;
            ExecuteProcess( sProc, 'pLogOutput', 0,
            	'pCube', cCubTgt3, 'pSrcView', cViewSrc, 'pTgtView', '',
            	'pFilter', sFilter, 'pFilterParallel', '', 'pEleMapping', sTgtMap,
            	'pMappingDelim', '->', 'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
            	'pFactor', 1, 'pSuppressRules', 1, 'pCumulate', 0, 'pZeroTarget', 0, 'pZeroSource', 0,
            	'pTemp', 1, 'pCubeLogging', 0, 'pThreadMode', 0 
            );
            # single framework cube for all element permissions
            ExecuteProcess( sProc, 'pLogOutput', 0,
            	'pCube', cCubTgt4, 'pSrcView', cViewSrc, 'pTgtView', '',
            	'pFilter', sFilter, 'pFilterParallel', '', 'pEleMapping', sTgtMap,
            	'pMappingDelim', '->', 'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
            	'pFactor', 1, 'pSuppressRules', 1, 'pCumulate', 0, 'pZeroTarget', 0, 'pZeroSource', 0,
            	'pTemp', 1, 'pCubeLogging', 0, 'pThreadMode', 0 
            );
        EndIf;
    End;
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
