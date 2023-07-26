601,100
602,"}APQ.Cube.Data.Save"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"rKDbmxDrdtQt5s8bKXaU>8aUysEH_M@E3;b]d`Ew68cCfrKD]S9xMi;YDx<lflMViv4FP2Db8Lx50@:ebnrBEQ1CcQ=KGOjFCp\dLG_W>uTm_4@dv<l3IkmS7j[aMj5wJ8=03Mi>ihfV>wW3Qyhp`rR<VH0=@VX;;WD:5XQVDwMxfa^wzzV[YBTf4Msbf]lrL2E0>VKq"
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
569,0
592,0
599,1000
560,2
pDoProcessLogging
pCube
561,2
2
2
590,2
pDoProcessLogging,"1"
pCube,""
637,2
pDoProcessLogging,"Record in process log?"
pCube,"Specific cube to save (blank or * =ALL). If ALL, the ""CubeSaveData"" attribute of  }APQ Cubes dimension will be checked. Also accepts wildcards for starts, ends and contains matches"
577,1
vCube
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
572,96
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
### 2020-04-23		    JNG 	        Creation of Process
### 2020-05-18 		    SW 	            Integrate into 3.4 Framework
##############################################################################################################
#Region @DOC
### Purpose:
### Cycle through all cubes and save data depending of the parameter. This allows a more frequent data write to disk vs using SaveDataAll exclusively.
### When empty or "ALL" the process will check flagged cubes in the "CubeSaveData" attribute of the dimension **}APQ Cubes**.
### If the parameter has any other value then this will be used as a wildcard to filter **}APQ Cubes** to determine which cubes to save (regardless of the value of the CubeSaveData flag).
#EndRegion @DOC
##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pCube:' | IF( pCube @= '' % pCube @= '*', 'ALL', pCube );
### Params
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQProcesses',sThisProcName)=0);DimensionElementInsertDirect('}APQ Processes','',sThisProcName,'N');DimensionElementComponentAddDirect('}APQ Processes','Total APQ Processes',sThisProcName,1);EndIf;
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

### Inits - declare constants
cCubParam   = '}APQ Settings';
cCubTgt     = '}CubeProperties';
cDimSrc     = '}Cubes';
cDimCheck   = '}APQ Cubes';
cMatchType  = '';
pDebug      = '0';
nErr        = 0;
sErr        = '';

### Test parameters
If( DimIx( '}ElementAttributes_' | cDimCheck, 'CubeSaveData' ) = 0 );
    AttrInsert( cDimCheck, '', 'CubeSaveData', 'S' );
EndIf;
    
If( pCube @= '' % pCube @= '*' % pCube @= 'ALL' );
    pCube       = 'ALL';
    cMatchType  = 'ALL';
ElseIf( CubeExists( pCube ) = 1 );
    cMatchType  = 'EXACT';
ElseIf( Scan( '*', pCube ) = 0 & CubeExists( pCube ) = 0 );
    nErr        = nErr + 1;
    sErr        = 'Invalid target cube.';
ElseIf( Scan( '*', pCube ) = 1 & SubSt( pCube, Long(pCube), 1 ) @= '*' );
    pCube       = SubSt( pCube, 2, Long( pCube ) - 2 );
    cMatchType  = 'CONTAINS';
ElseIf( Scan( '*', pCube ) = 1 & SubSt( pCube, Long(pCube), 1 ) @<> '*' );
    pCube       = SubSt( pCube, 2, Long( pCube ) - 1 );
    cMatchType  = 'ENDS';
ElseIf( SubSt( pCube, Long( pCube ), 1 ) @= '*' );
    pCube       = SubSt( pCube, 1, Long( pCube ) - 1 );
    cMatchType  = 'STARTS';
EndIf;

### Assign data source
IF( nErr = 0 );
    DataSourceType = 'SUBSET';
    DataSourceNameForServer = cDimSrc;
    DatasourceDimensionSubset = 'ALL';
Else;
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIF;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,99
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
### Data script

# Skip if cube not loaded
IF( CubeExists( vCube ) = 0 );
    If( pDebug @>= '1' );
        LogOutput( 'INFO', Expand('Skipping 1. %vCube%. Cube is not loaded!') );
    EndIf;
    ItemSkip;
EndIF;

# Skip if match not found
If( cMatchType  @= 'ALL' );
    # Check if cube exists in }APQ Cubes, if not exit as attempting attribute check would cause an error
    If( DimIx( cDimCheck, vCube ) = 0 );
        If( pDebug @>= '1' );
            LogOutput( 'INFO', Expand('Skipping 2.1 %vCube%. Cube not added to Framework.') );
        EndIf;
        ItemSkip;
    EndIf;
    # If cube is marked as True for its "Cube Save Data" attribute in the "}APQ Cubes" dimension. Also accept other common Boolean variants (T,Yes,Y,1)
    sCheck      = Upper( AttrS( cDimCheck, vCube, 'CubeSaveData') );
    If( sCheck  @= 'T' );
        sCheck  = 'TRUE';
    ElseIf( sCheck @= 'YES' );
        sCheck  = 'TRUE';
    ElseIf( sCheck @= 'Y' );
        sCheck  = 'TRUE';
    ElseIf( sCheck @= '1' );
        sCheck  = 'TRUE';
    EndIf;
    If( sCheck @<> 'TRUE' );
        If( pDebug @>= '1' );
            LogOutput( 'INFO', Expand('Skipping 2.2 %vCube%. Cube not flagged to save.') );
        EndIf;
        ItemSkip;
    EndIf;
Else;
    If( cMatchType @= 'EXACT' );
        If( vCube @<> pCube );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', Expand('Skipping 3 %vCube% not exact match for %pCube%.') );
            EndIf;
            ItemSkip;
        EndIf;
    ElseIf( cMatchType @= 'STARTS' );
        If( Scan( Upper( pCube ), Upper( vCube ) ) <> 1 );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', Expand('Skipping 4 %vCube%. Starts with check in %pCube% not passed.') );
            EndIf;
            ItemSkip;
        EndIf;
    ElseIf( cMatchType @= 'CONTAINS' );
        If( Scan( Upper( pCube ), Upper( vCube ) ) = 0 );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', Expand('Skipping 5 %vCube%. Contains check in %pCube% not passed.') );
            EndIf;
            ItemSkip;
        EndIf;
    ElseIf( cMatchType @= 'ENDS' );
        If( Scan( Upper( pCube ), Upper( vCube ) ) <> Long( vCube ) - Long( pCube ) + 1 );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', Expand('Skipping 6 %vCube%. Ends with check in %pCube% not passed.') );
            EndIf;
            ItemSkip;
        EndIf;
    EndIf;    
EndIf;

If( pDebug @>= '1' );
  LogOutput( 'INFO', Expand('Checks passed. Data Saving for %vCube%.') );
EndIf;
CubeSaveData( vCube );

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
