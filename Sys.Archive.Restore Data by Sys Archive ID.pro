601,100
602,"Sys.Archive.Restore Data by Sys Archive ID"
562,"VIEW"
586,"Bedrock Test"
585,"Bedrock Test"
564,
565,"q_Du<qngNRRYd>jWazgz;[SRgRSPc3Ixc2qm8Si]?gbAK-OX3<8<dZ_T:dE2lpIJiccGD:538cd9U0VPPaOEMU?\WErCRz9Tz<@gen<IdMB?MZT2EYw@>8e6?hqj}Deg=65L=`7fqwnMbG?VJ0A'?XwrFmSbR<xQt_6BmO}v]7L0i5j^[UI3O`67q]f2JNpe9LI2GkMq_Du<qngNRRYd>jWazgz;[SRgRSPc3Ixe2qm8Si]?gbAKmGX3<8<dZ_T:D=5lpYHiccwF:538cD?U`UPPaOEMU?\WEbJRz9Tz<@ghn<IdMB?MZDoDYw@>8e6?hqjMClg=f1|5`7fqwnMcG?FJ0A75XwrFmSbR<xQt_FOmO}q]7L0i8j^[UI3Op67q]f2J>v@g9LI2GkMq_Du<qngNRRYd>jWaogz;[SRgRSPc3IHg2qm8Si]?gbAK]HX3<8<dZ_T:Da9lpiKicc7H:538cT4U`RPPaOEMU?\WEr@Rz9Tz<@7an<IdMB?MZDjIYw@>8e6?hqj]llg=V9L;`7fqwn=iG?vE0Aw4XwrFmSbR<xQt_vBmO]u]7L092j^[UI3O`37q]f2Jnz@o9LI2GkM"
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
572,332
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

cTempConvertToStr = '<TOBECONVERT>' ;

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

#ProcessBreak();

#####################################################################################################################################################
#Create Source Cube View and Susbets

#Create Source View
IF( ViewExists( sArchivedCube, sSourceView ) = 1 );
    ViewDestroy( sArchivedCube, sSourceView );
ENDIF ;

ViewCreate( sArchivedCube, sSourceView ) ;

nTempIndex = 1 ;

#Create Source Subsets
WHILE( nTempIndex <= nDimensionCount );

    sTempDim = TABDIM( sArchivedCube, nTempIndex ) ;    

     #AsciiOutput(sDebugFile, sTempDim);

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
    #CONVERT MDX
    # From  zArchived_**_<>  TO   <TOBECONVERT>
    #From ** TO <TOBECONVERT>    (TABDIM( cSourceCube, nTempIndex ) )
    #From <TOBECONVERT> TO zArchived_**_<>

    ###########

    sTempConvertFrom01=sTempDim;sTempConvertTo01=cTempConvertToStr;
    sTempConvertFrom02=TABDIM( cSourceCube, nTempIndex );sTempConvertTo02=cTempConvertToStr;
    sTempConvertFrom03=cTempConvertToStr;sTempConvertTo03=sTempDim;

    nConvertStepIndex = 1;
    WHILE( nConvertStepIndex <= 3 ) ;

        sTempConvertFrom = Expand( '%sTempConvertFrom' | NumberToStringEx( nConvertStepIndex, '00', '', '' ) | '%' ) ;
        sTempConvertTo = Expand( '%sTempConvertTo' | NumberToStringEx( nConvertStepIndex, '00', '', '' ) | '%' ) ;

        sTargetStr = sTempMDX ;
        nReplaceStrIndex = 1 ;

        WHILE( nReplaceStrIndex > 0 ) ;
            nReplaceStrIndex = SCAN( sTempConvertFrom, sTargetStr )  ;
            IF( nReplaceStrIndex > 0 );
                sTargetStr = DELET( sTargetStr, nReplaceStrIndex, LONG( sTempConvertFrom ) ) ;
                sTargetStr = INSRT( sTempConvertTo, sTargetStr, nReplaceStrIndex ) ;
            ENDIF ;
        END ;

        sTempMDX = sTargetStr ;        

        nConvertStepIndex = nConvertStepIndex + 1;
    END;

    ############################################

   #AsciiOutput(sDebugFile, 'After Convert: ' | sTempMDX );

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

    ViewSubsetAssign( sArchivedCube, sSourceView, sTempDim, sSourceView );

    nTempIndex = nTempIndex + 1 ;
END;

#######################################################################################################################
#Data Source Setup

ViewExtractSkipCalcsSet(sArchivedCube, sSourceView, 1);
ViewExtractSkipRuleValuesSet(sArchivedCube, sSourceView, 1);
ViewExtractSkipZeroesSet(sArchivedCube, sSourceView, 1);

DataSourceType = 'VIEW';
DatasourceNameForServer = sArchivedCube;
DatasourceNameForClient = sArchivedCube;
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
574,270
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################
#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START (CUBEWISE APLIQODE FRAMEWORK)
IF( pDoProcessLogging @= '1' ); nDataRecordCount = nDataRecordCount + 1;EndIF;
sDebugFile = cDebugFile | '_Data.log';

##############################################################################################################
### Data script




### Record Count

nRecordCount = nRecordCount + 1;

IF( Value_Is_String = 1 );

        IF( nDimensionCount = 2 );
            IF( CellIsUpdateable( cSourceCube, V1, V2 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2 );
            ENDIF;
        ELSEIF( nDimensionCount = 3 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3 );
            ENDIF;
        ELSEIF( nDimensionCount = 4 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4 );
            ENDIF;
        ELSEIF( nDimensionCount = 5 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5 );
            ENDIF;
        ELSEIF( nDimensionCount = 6 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6 );
            ENDIF;
        ELSEIF( nDimensionCount = 7 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7 );
            ENDIF;
        ELSEIF( nDimensionCount = 8 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8 );
            ENDIF;
        ELSEIF( nDimensionCount = 9 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 );
            ENDIF;
        ELSEIF( nDimensionCount = 10 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 ) = 1 );
                CellPutS( SValue,cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 );
            ENDIF;
        ELSEIF( nDimensionCount = 11 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 );
            ENDIF;
        ELSEIF( nDimensionCount = 12 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 );
            ENDIF;
        ELSEIF( nDimensionCount = 13 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 );
            ENDIF;
        ELSEIF( nDimensionCount = 14 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 );
            ENDIF;
        ELSEIF( nDimensionCount = 15 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 );
            ENDIF;
        ELSEIF( nDimensionCount = 16 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 );
            ENDIF;
        ELSEIF( nDimensionCount = 17 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 );
            ENDIF;
        ELSEIF( nDimensionCount = 18 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
            ENDIF;
        ELSEIF( nDimensionCount = 19 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 );
            ENDIF;
        ELSEIF( nDimensionCount = 20 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 );
            ENDIF;
        ELSEIF( nDimensionCount = 21 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 );
            ENDIF;
        ELSEIF( nDimensionCount = 22 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 );
            ENDIF;
        ELSEIF( nDimensionCount = 23 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 );
            ENDIF;
        ELSEIF( nDimensionCount = 24 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 );
            ENDIF;
        ELSEIF( nDimensionCount = 25 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 );
            ENDIF;
        ELSEIF( nDimensionCount = 26 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 );
            ENDIF;
        ELSEIF( nDimensionCount = 27 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 );
            ENDIF;
        ELSEIF( nDimensionCount = 28 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 );
            ENDIF;
        ELSEIF( nDimensionCount = 29 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 );
            ENDIF;
        ELSEIF( nDimensionCount = 30 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 ) = 1 );
                CellPutS( SValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 );
            ENDIF;
        ENDIF;
    
ELSE;

        IF( nDimensionCount = 2 );
            IF( CellIsUpdateable( cSourceCube, V1, V2 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2 );
            ENDIF;
        ELSEIF( nDimensionCount = 3 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3 );
            ENDIF;
        ELSEIF( nDimensionCount = 4 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4 );
            ENDIF;
        ELSEIF( nDimensionCount = 5 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5 );
            ENDIF;
        ELSEIF( nDimensionCount = 6 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6 );
            ENDIF;
        ELSEIF( nDimensionCount = 7 );
            IF( CellIsUpdateable(cSourceCube, V1, V2, V3, V4, V5, V6, V7 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7 );
            ENDIF;
        ELSEIF( nDimensionCount = 8 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8 );
            ENDIF;
        ELSEIF( nDimensionCount = 9 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9 );
            ENDIF;
        ELSEIF( nDimensionCount = 10 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10 );
            ENDIF;
        ELSEIF( nDimensionCount = 11 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11 );
            ENDIF;
        ELSEIF( nDimensionCount = 12 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12 );
            ENDIF;
        ELSEIF( nDimensionCount = 13 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13 );
            ENDIF;
        ELSEIF( nDimensionCount = 14 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 );
            ENDIF;
        ELSEIF( nDimensionCount = 15 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 );
            ENDIF;
        ELSEIF( nDimensionCount = 16 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16 );
            ENDIF;
        ELSEIF( nDimensionCount = 17 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17 );
            ENDIF;
        ELSEIF( nDimensionCount = 18 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 ) = 1 );
                CellPutN( NValue,cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18 );
            ENDIF;
        ELSEIF( nDimensionCount = 19 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19 );
            ENDIF;
        ELSEIF( nDimensionCount = 20 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20 );
            ENDIF;
        ELSEIF( nDimensionCount = 21 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21 );
            ENDIF;
        ELSEIF( nDimensionCount = 22 );
            IF( CellIsUpdateable(cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22 );
            ENDIF;
        ELSEIF( nDimensionCount = 23 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23 );
            ENDIF;
        ELSEIF( nDimensionCount = 24 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24 );
            ENDIF;
        ELSEIF( nDimensionCount = 25 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25 );
            ENDIF;
        ELSEIF( nDimensionCount = 26 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26 );
            ENDIF;
        ELSEIF( nDimensionCount = 27 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27 );
            ENDIF;
        ELSEIF( nDimensionCount = 28 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28 );
            ENDIF;
        ELSEIF( nDimensionCount = 29 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29 );
            ENDIF;
        ELSEIF( nDimensionCount = 30 );
            IF( CellIsUpdateable( cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 ) = 1 );
                CellPutN( NValue, cSourceCube, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30 );
            ENDIF;
        ENDIF;

ENDIF;



##############################################################################################################
### END Data script


575,51
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

ExecuteProcess('}bedrock.cube.viewandsubsets.delete',
   'pLogOutput', 0,
   'pCube', sArchivedCube,
   'pView', sSourceView,
   'pSub', sSourceView,
   'pMode', 1
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
