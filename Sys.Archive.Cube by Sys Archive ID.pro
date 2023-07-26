601,100
602,"Sys.Archive.Cube by Sys Archive ID"
562,"VIEW"
586,"Bedrock Test"
585,"Bedrock Test"
564,
565,"z:^TavtcD9Q_b]@PbvBnX5ykx6zC2G4sCK[_UB8W1u4OE&V8[yKteXXmdErm<GjEidLTzKk0Xn9>86>M>but60D0Sxcj]y<>;\h5WbS6=LfMOU2EVFN?SHWD]iJuDe\>5uHmB879jVHRkU^j4k&_abZuFVgQ`@hIZ5btMtF`B\PfERur5ve=mFu[@cZaNtePGAd8\Qz:^TavtcD9Q_b]@PbvBnX5ykx6zC2G4sEK[_UB8W1u4OEfwV8[yKteXXmD=um<WhEid|VzKk0XN?>h5>M>but60D0Shjj]y<>;\h8WbS6=LfMOEoDVFN?SHWD]iJECl\>eqxeB879jVHSkUNj4k6UabZuFVgQ`@hIZEotMtA`B\PfHRur5ve=}Fu[@cZa>vDgPGAd8\Qz:^TavtcD9Q_b]@PbvBnX5ykx6oC2G4SDK[_UB8W1u4OEVxV8[yKteXXmDQxm<gkEid<XzKk0X^4>x1>M>but60D0Sx`j]y<>;\X4WbS6=LfMOEjIVFN?SHWD]iJE5a\>5yHkB879jVXRkU^d4kVWabZuFVgQ`@hIZubtMDK`B\P6BRur5ve=mCu[@cZanzDoPGAd8\Q"
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
577,31
V1
V2
V3
V4
V5
V6
V7
V8
V9
V10
V11
V12
V13
V14
V15
V16
V17
V18
V19
V20
V21
V22
V23
V24
V25
V26
V27
V28
V29
V30
Value
578,31
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
579,31
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
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
580,31
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
0
0
0
0
0
0
0
581,31
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
0
0
0
0
0
0
0
582,31
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,404
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
#AsciiOutput(sDebugFile, sClearSourceDataFlag);

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
    sError = 'Source Cube: ' | cSourceCube | ' was not set to Archive!' ;
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
    sError = 'ArchivedCube:' | sArchivedCube | ' not exists!' ;
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

sMName01=cMArchivedBy; sMValue01=sRunBy;
sMName02=cMArchivedStartTime; sMValue02=TimSt(Now(), '\Y-\m-\d \h:\i:\s' );

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
#Create Source Cube View and Susbets

#Create Source View
IF( ViewExists( cSourceCube, sSourceView ) = 1 );
    ViewDestroy( cSourceCube, sSourceView );
ENDIF ;

ViewCreate( cSourceCube, sSourceView ) ;

nTempIndex = 1 ;

#Create Source Subsets
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

        If (SubsetExists( sTempDim, sSourceView ) <> 0);
            SubsetDestroy( sTempDim, sSourceView );
        Endif;
        SubsetCreatebyMDX( sSourceView, sTempMDX, sTempDim );
        nElements = SubsetGetSize( sTempDim, sSourceView );
        sLastElement = SubsetGetElementName(sTempDim, sSourceView, nElements);
        SubsetElementDelete(sTempDim, sSourceView, nElements);
        SubsetElementInsert(sTempDim, sSourceView, sLastElement, nElements);

    ELSEIF( sTempSUBSET @<> '' ) ;
        ExecuteProcess('Bedrock.Dim.Sub.Clone',
        'pDimension', sTempDim ,
        'pSourceSub',sTempSUBSET ,
        'pTargetSub',sSourceView,
        'pDebug',0
        );        
    ENDIF ;

    ViewSubsetAssign( cSourceCube, sSourceView, sTempDim, sSourceView );

    nTempIndex = nTempIndex + 1 ;
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

#######################################################################################################################
#Data Source Setup

ViewExtractSkipCalcsSet(cSourceCube, sSourceView, 0);
ViewExtractSkipRuleValuesSet(cSourceCube, sSourceView, 0);
ViewExtractSkipZeroesSet(cSourceCube, sSourceView, 1);

DataSourceType = 'VIEW';
DatasourceNameForServer = cSourceCube;
DatasourceNameForClient = cSourceCube;
DatasourceCubeView = sSourceView;

################################


### End Prolog ###
573,14
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script
574,267
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


### Record Count

nRecordCount = nRecordCount + 1;

IF( Value_Is_String = 1 );

        IF( nDimensionCount = 2 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2 );
            ENDIF;
        ELSEIF( nDimensionCount = 3 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3 );
            ENDIF;
        ELSEIF( nDimensionCount = 4 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4 );
            ENDIF;
        ELSEIF( nDimensionCount = 5 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5 );
            ENDIF;
        ELSEIF( nDimensionCount = 6 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6 );
            ENDIF;
        ELSEIF( nDimensionCount = 7 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7 );
            ENDIF;
        ELSEIF( nDimensionCount = 8 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8 );
            ENDIF;
        ELSEIF( nDimensionCount = 9 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 );
            ENDIF;
        ELSEIF( nDimensionCount = 10 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 );
            ENDIF;
        ELSEIF( nDimensionCount = 11 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 );
            ENDIF;
        ELSEIF( nDimensionCount = 12 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 );
            ENDIF;
        ELSEIF( nDimensionCount = 13 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 );
            ENDIF;
        ELSEIF( nDimensionCount = 14 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 );
            ENDIF;
        ELSEIF( nDimensionCount = 15 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 );
            ENDIF;
        ELSEIF( nDimensionCount = 16 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 );
            ENDIF;
        ELSEIF( nDimensionCount = 17 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 );
            ENDIF;
        ELSEIF( nDimensionCount = 18 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
            ENDIF;
        ELSEIF( nDimensionCount = 19 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 );
            ENDIF;
        ELSEIF( nDimensionCount = 20 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 );
            ENDIF;
        ELSEIF( nDimensionCount = 21 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 );
            ENDIF;
        ELSEIF( nDimensionCount = 22 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 );
            ENDIF;
        ELSEIF( nDimensionCount = 23 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 );
            ENDIF;
        ELSEIF( nDimensionCount = 24 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 );
            ENDIF;
        ELSEIF( nDimensionCount = 25 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 );
            ENDIF;
        ELSEIF( nDimensionCount = 26 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 );
            ENDIF;
        ELSEIF( nDimensionCount = 27 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 );
            ENDIF;
        ELSEIF( nDimensionCount = 28 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 );
            ENDIF;
        ELSEIF( nDimensionCount = 29 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 );
            ENDIF;
        ELSEIF( nDimensionCount = 30 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 ) = 1 );
                CellPutS( SValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 );
            ENDIF;
        ENDIF;
    
ELSE;

        IF( nDimensionCount = 2 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2 );
            ENDIF;
        ELSEIF( nDimensionCount = 3 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3 );
            ENDIF;
        ELSEIF( nDimensionCount = 4 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4 );
            ENDIF;
        ELSEIF( nDimensionCount = 5 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5 );
            ENDIF;
        ELSEIF( nDimensionCount = 6 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6 );
            ENDIF;
        ELSEIF( nDimensionCount = 7 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7 );
            ENDIF;
        ELSEIF( nDimensionCount = 8 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8 );
            ENDIF;
        ELSEIF( nDimensionCount = 9 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 );
            ENDIF;
        ELSEIF( nDimensionCount = 10 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 );
            ENDIF;
        ELSEIF( nDimensionCount = 11 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 );
            ENDIF;
        ELSEIF( nDimensionCount = 12 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 );
            ENDIF;
        ELSEIF( nDimensionCount = 13 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 );
            ENDIF;
        ELSEIF( nDimensionCount = 14 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 );
            ENDIF;
        ELSEIF( nDimensionCount = 15 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 );
            ENDIF;
        ELSEIF( nDimensionCount = 16 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 );
            ENDIF;
        ELSEIF( nDimensionCount = 17 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 );
            ENDIF;
        ELSEIF( nDimensionCount = 18 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
            ENDIF;
        ELSEIF( nDimensionCount = 19 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 );
            ENDIF;
        ELSEIF( nDimensionCount = 20 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 );
            ENDIF;
        ELSEIF( nDimensionCount = 21 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 );
            ENDIF;
        ELSEIF( nDimensionCount = 22 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 );
            ENDIF;
        ELSEIF( nDimensionCount = 23 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 );
            ENDIF;
        ELSEIF( nDimensionCount = 24 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 );
            ENDIF;
        ELSEIF( nDimensionCount = 25 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 );
            ENDIF;
        ELSEIF( nDimensionCount = 26 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 );
            ENDIF;
        ELSEIF( nDimensionCount = 27 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 );
            ENDIF;
        ELSEIF( nDimensionCount = 28 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 );
            ENDIF;
        ELSEIF( nDimensionCount = 29 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 );
            ENDIF;
        ELSEIF( nDimensionCount = 30 );
            IF( CellIsUpdateable( sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 ) = 1 );
                CellPutN( NValue, sArchivedCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 );
            ENDIF;
        ENDIF;

ENDIF;



##############################################################################################################
### END Data script

575,79
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


######################
#Clear Temp Subsets and Views

ExecuteProcess('Bedrock.Cube.ViewAndSubsets.Delete',
'pCube',cSourceCube,
'pView',sSourceView,
'pSubset',sSourceView,
'pMode',1,
'pDebug',0
);

ExecuteProcess('Bedrock.Cube.ViewAndSubsets.Delete',
'pCube',sArchivedCube,
'pView',sTargetView,
'pSubset',sTargetView,
'pMode',1,
'pDebug',0
);

######################
#Update Archive End Time

IF( CellIsUpdateable( cRefCube, cElemArchiveID, cSourceCube, cMArchivedEndTime ) = 1 );
    CellPutS( TimSt(Now(), '\Y-\m-\d \h:\i:\s' ),  cRefCube, cElemArchiveID, cSourceCube, cMArchivedEndTime );
ENDIF;

#AsciiOutput(sDebugFile,  NumberToString( nRecordCount  ) );

#Clear TargetView for source cube
IF( sClearSourceDataFlag @<> '' );
    ViewZeroOut(  cSourceCube, sTargetView );
    #AsciiOutput(sDebugFile, 'Data Cleared!' );
ENDIF;

ExecuteProcess('Bedrock.Cube.ViewAndSubsets.Delete',
'pCube',cSourceCube,
'pView',sTargetView,
'pSubset',sTargetView,
'pMode',1,
'pDebug',0
);

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
