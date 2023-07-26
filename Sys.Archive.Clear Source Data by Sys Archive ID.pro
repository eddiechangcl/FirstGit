601,100
602,"Sys.Archive.Clear Source Data by Sys Archive ID"
562,"NULL"
586,"Bedrock Test"
585,"Bedrock Test"
564,
565,"pBbZ=QqgpOEA`?aBzNrm_u>yy=_FfBS|s\OW8RF8Oh^@c,?vGBQ=]:_3UeEBnEAJZ[>Bd[t9yrf98>vGhjIPC0^m;0wCdLBY;lemUgMT96A6yRV2uvnxszCe7AVnuDe[C9uC=iuZwJzFB=ZZJ_?)Ocyem@w6anRlV=:rx1rFsFZfnuU@[FkTBbvJN@dKcNvE7uax>wzpBbZ=QqgpOEA`?aBzNrm_u>yy=_FfBS|u\OW8RF8Oh^@cl7vGBQ=]:_3UE=EnEQHZ[>rf[t9yrF?8nuGhjIPC0^m;0gJdLBY;lemXgMT96A6yRFotvnxszCe7AVnECl[Ciqs5iuZwJzFC=ZJJ_?9Ecyem@w6anRlV=Jx1rAsFZfnxU@[FkTBrvJN@dKc>vFG7uax>wzpBbZ=QqgpOEA`?aBoNrm_u>yy=_FfBSlt\OW8RF8Oh^@c\8vGBQ=]:_3UEAInEaKZ[>2h[t9yrV48^yGhjIPC0^m;0w@dLBY;le=TgMT96A6yRFjyvnxszCe7AVnE^f[CirC;iuZwJzfG=ZZF_?Y@cyem@w6anRlV=zrx1bEsFZf>rU@[FkTBbsJN@dKcnzFO7uax>wz"
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
570,Temp
571,
569,0
592,0
599,1000
560,4
pDoProcessLogging
pArchiveCube
pArchiveID
pRunBy
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pArchiveCube,""
pArchiveID,"20170604_002"
pRunBy,""
637,4
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pArchiveCube,"Archive Cube:"
pArchiveID,"Archive ID:"
pRunBy,"User Name:"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,313
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
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
#   2020-03-12  Lingo Wang          Refresh with APQ 3.3 + Bedrock 4
#
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	-----------------  START (CUBEWISE APLIQODE FRAMEWORK)
sThisProcName = GetProcessName();
sProcLogParams = '';
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
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
### Logging - common script 	-----------------  END


### Debug
sTimeStamp = 	TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt = 	NumberToString( INT( RAND( ) * 1000 ));

cProcessName = sThisProcName;
cTimeStamp = sTimeStamp;

cCubParam = '}APQ Settings';
cDebugLoc = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile = cDebugLoc | sThisProcName |'_'| sTimeStamp | '_' | sRandomInt;
sDebugFile = cDebugFile | '_Prolog.log';

cBedrockTmp     = 1;

nErr = 0;
sErr = '';

##############################################################################################################
### Prolog script commences



######################
#### Constant 

sSourceView = cProcessName | '.' | cTimeStamp | '.' | sRandomInt ;

sTargetView = sSourceView | '_TARGETVIEW' ;

cRefCube = 'Sys Archive Profile' ;

cSourceCube = pArchiveCube ;

cDimArchiveID = 'Sys Archive ID' ;

cElemArchiveID = pArchiveID;

nRecordCount = 0 ;

cDelimiter = '~' ;

cPrefix_ELEMSETS = 'ELEM SETS ' ;
cPrefix_ELEMSETSTYPE = 'ELEM SETS TYPE ' ;

cPL_NLEVEL = 'All N Level Elements' ;
cPL_SUBSET = 'From Subset' ;
cPL_MDX = 'By MDX' ;
cPL_ELEM = 'Specified Element' ;
cPL_ALLELEMENTS = 'All Elements' ;
cPL_VARIABLEFROMSYSPARAMETER = 'Variable From Sys Archive Parameter' ;

cMDimensionCount = 'Dimension Count' ;
cMArchivedCube = 'Archived Cube' ;
cMArchiveFlag = 'Archive Flag' ;
cMArchivedBy = 'Cube Archived By' ;
cMArchivedStartTime = 'Cube Archived Start Time' ;
cMArchivedEndTime = 'Cube Archived End Time' ;
cMArchiveRulesFlag = 'Archive Rules Flag' ;
cMClearSourceDataFlag = 'Clear Source Cube Data Flag' ;

cMSourceDataClearedBy = 'Source Data Cleared By' ;
cMSourceDataClearedStartTime = 'Source Data Cleared Start Time' ;
cMSourceDataClearedEndTime = 'Source Data Cleared End Time' ;

######################
#Validation

#Validate Cube
If ( Trim(cSourceCube) @= '' % CubeExists( cSourceCube ) = 0 );
    sError = 'Invalid Cube :' | cSourceCube ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
Endif;

If (nError <> 0);
    ProcessBreak();
Endif;

#Validate Sys Archive ID
IF( DIMIX( cDimArchiveID, cElemArchiveID ) = 0 );
    sError = 'Invalid Sys Archive ID :' | cElemArchiveID ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
ENDIF ;

If (nError <> 0);
    ProcessBreak();
Endif;    

###############################
#Archive Information

nDimensionCount = CellGetN( cRefCube, cElemArchiveID, cSourceCube, cMDimensionCount );
sArchivedCube = CellGetS( cRefCube, cElemArchiveID, cSourceCube, cMArchivedCube );
sArchiveFlag = CellGetS( cRefCube, cElemArchiveID, cSourceCube, cMArchiveFlag );
sArchiveRulesFlag = CellGetS( cRefCube, cElemArchiveID, cSourceCube, cMArchiveRulesFlag );
sClearSourceDataFlag = CellGetS( cRefCube, cElemArchiveID, cSourceCube, cMClearSourceDataFlag );

IF( nDimensionCount = 0 );
    sError = 'Source Cube Dimension Count is Zero!' ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
ENDIF ;

If (nError <> 0);
    ProcessBreak();
Endif;    

IF( sArchiveFlag @= '' );
    sError = 'Source Cube: ' | cSourceCube | ' was not set to Archive! CAN NOT CLEAR DATA!' ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
ENDIF ;

If (nError <> 0);
    ProcessBreak();
Endif;   

IF( CubeExists( sArchivedCube ) = 0 );
    sError = 'ArchivedCube:' | sArchivedCube | ' not exists! CAN NOT CLEAR DATA!' ;
    AsciiOutput(sDebugFile, sError);
    If (sErr @= '');
        sErr = sErr | Char(10) | Char(13);
    Endif;
    sErr = sErr | sError;
    nError = 1;
ENDIF ;

If (nError <> 0);
    ProcessBreak();
Endif;   

################################
#Update Information

sRunBy = pRunBy;
IF( DimIx( '}Clients', sRunBy ) = 0 );
   sRunBy = TM1User();
Endif;
IF( DimIx( '}Clients', sRunBy ) > 0 );
  sRunBy = IF( AttrS( '}Clients', sRunBy, '}TM1_DefaultDisplayValue' ) @= '', sRunBy, AttrS( '}Clients', sRunBy, '}TM1_DefaultDisplayValue' ) );
EndIF;

sMName01=cMSourceDataClearedBy; sMValue01=sRunBy;
sMName02=cMSourceDataClearedStartTime; sMValue02=TimSt(Now(), '\Y-\m-\d \h:\i:\s' );

nIndex=1;
WHILE( nIndex <= 2 );

    sTempMName = Expand( '%sMName' | NumberToStringEx( nIndex, '00', '', '' ) | '%' );
    sTempMValue = Expand( '%sMValue' | NumberToStringEx( nIndex, '00', '', '' ) | '%' );

    IF( CellIsUpdateable( cRefCube, cElemArchiveID, cSourceCube, sTempMName ) = 1 );
        CellPutS( sTempMValue,  cRefCube, cElemArchiveID, cSourceCube, sTempMName );
    ENDIF;

    nIndex = nIndex + 1 ;

END;

#####################################################################################################################################################
#Create Target View for source cube for data clear purpose

#Create Target View
IF( ViewExists( cSourceCube, sTargetView ) = 1 );
    ViewDestroy( cSourceCube, sTargetView );
ENDIF ;

ViewCreate( cSourceCube, sTargetView ) ;

nTempIndex = 1 ;

#Create Target Subsets
WHILE( nTempIndex <= nDimensionCount );

    sTempDim = TABDIM( cSourceCube, nTempIndex ) ;    

    sTempIndexStr = NumberToStringEx( nTempIndex, '000', '', '' ) ;
    sTempM_ELEMSETSTYPE = cPrefix_ELEMSETSTYPE | sTempIndexStr ;
    sTempM_ELEMSETS = cPrefix_ELEMSETS | sTempIndexStr;

    sTempELEMSETSTYPE = CellGetS( cRefCube, cElemArchiveID, cSourceCube, sTempM_ELEMSETSTYPE ) ;
    sTempELEMSETS = CellGetS(  cRefCube, cElemArchiveID, cSourceCube, sTempM_ELEMSETS ) ;

    sTempMDX = '' ;
    sTempSUBSET = '' ;

    IF( sTempELEMSETSTYPE @= cPL_ELEM ) ;
        sTempMDX = '{[' | sTempDim | '].[' | sTempELEMSETS | ']}' ;
    ELSEIF( sTempELEMSETSTYPE @= cPL_SUBSET );
        IF( SubsetExists( sTempDim, sTempELEMSETS ) = 0 );
            sTempMDX = '{TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | sTempDim | '] )}, 0 )}' ;
        ELSE ;
            sTempSUBSET = sTempELEMSETS ;
        ENDIF ;
    ELSEIF( sTempELEMSETSTYPE @= cPL_NLEVEL );
        sTempMDX = sTempELEMSETS ;
    ELSEIF( sTempELEMSETSTYPE @= cPL_MDX );
        sTempMDX = sTempELEMSETS ;
    ELSEIF( sTempELEMSETSTYPE @= cPL_ALLELEMENTS );
        sTempMDX = sTempELEMSETS ;
    ELSEIF( sTempELEMSETSTYPE @= cPL_VARIABLEFROMSYSPARAMETER );
        sTempMDX = sTempELEMSETS ;
    ELSEIF( sTempELEMSETSTYPE @= '' );
        sTempMDX =  '{SUBSET({TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | sTempDim | '] )}, 0 )}, 0,1)}' ;
    ENDIF ;    

    #Create Source Subset
    IF( sTempMDX @= '' & sTempSUBSET @= '' );
        sTempMDX = '{SUBSET({TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | sTempDim | '] )}, 0 )}, 0,1)}' ;
    ENDIF ;

    ############################################

    #AsciiOutput(sDebugFile, sTempMDX);

    IF( sTempMDX @<> '' );

        If (SubsetExists( sTempDim, sTargetView ) <> 0);
            SubsetDestroy( sTempDim, sTargetView );
        Endif;
        SubsetCreatebyMDX( sTargetView, sTempMDX, sTempDim );
        nElements = SubsetGetSize( sTempDim, sTargetView );
        sLastElement = SubsetGetElementName(sTempDim, sTargetView, nElements);
        SubsetElementDelete(sTempDim, sTargetView, nElements);
        SubsetElementInsert(sTempDim, sTargetView, sLastElement, nElements);

    ELSEIF( sTempSUBSET @<> '' ) ;
        ExecuteProcess('Bedrock.Dim.Sub.Clone',
        'pDimension', sTempDim ,
        'pSourceSub',sTempSUBSET ,
        'pTargetSub',sTargetView,
        'pDebug',0
        );        
    ENDIF ;

    ViewSubsetAssign( cSourceCube, sTargetView, sTempDim, sTargetView );

    nTempIndex = nTempIndex + 1 ;
END;

#####################################################################################################################################################


### End Prolog ###
573,21
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
#IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
#sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script




##############################################################################################################
### End Metadata

574,20
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
#IF( pDoProcessLogging @= '1' ); nDataRecordCount = nDataRecordCount + 1;EndIF;
#sDebugFile = cDebugFile | '_Data.log';

##############################################################################################################
### Data script




##############################################################################################################
### END Data script
575,62
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Debug
sDebugFile = cDebugFile | '_Epilog.log';


###############################################################################################################
### Epilog script

###################################################################
#Clear TargetView for source cube and delete temp objects

ViewZeroOut(  cSourceCube, sTargetView );

If (ViewExists( cSourceCube, sTargetView) <> 0);
    ViewDestroy( cSourceCube, sTargetView);
Endif;

nCount = 1;
While (nCount <= nDimensionCount);
    sDim = TabDim ( cSourceCube, nCount);
    If (SubsetExists( sDim, sTargetView) <> 0);
        SubsetDestroy( sDim, sTargetView);
    Endif;
    nCount = nCount + 1;
End;

####################################################################
#Update Source Data Cleared End Time

IF( CellIsUpdateable( cRefCube, cElemArchiveID, cSourceCube, cMSourceDataClearedEndTime ) = 1 );
    CellPutS( TimSt(Now(), '\Y-\m-\d \h:\i:\s' ),  cRefCube, cElemArchiveID, cSourceCube, cMSourceDataClearedEndTime );
ENDIF;

##############################################################################################################
### END Epilog Script

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
### ( Place as last code block on epilog )
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
### Logging - common script 	-----------------  END




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
917,1
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
