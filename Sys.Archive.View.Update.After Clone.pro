601,100
602,"Sys.Archive.View.Update.After Clone"
562,"VIEW"
586,"Bedrock Test"
585,"Bedrock Test"
564,
565,"rds34cJEIiH44GQ=cszj5aDL2AWF`U5<P<jPFp>X7NTPXws6<4x6\9y\H`77^weQrdXNlmMaV[;U]sj=dlpWlbzznzFL_A2zZU7&O\s^s^`H@pgv1cT9:8^x<l6mrzZlafvRWZoQCG4ihVGCwn7?6bp6J=s_E]8Fj1'{cPCK;xVpHUEC^9sS7s3F@5>U2d>Cj2oN4wOIrds34cJEIiH44GQ=cstj5aDL2AWF`U5l]<jPFp>X7NTPXgx6<4x6\9y\H`;:^wESrdXnlmMaV[{Z]co=dlpWlbzznzVD_A2zZU7fA\s^s^`H@pGi4cT9:8^x<l6mb0Rlaf{2UZoQCG4iaVGSzn7?3bp6J=s_E]8Fj1GrcP3M;xVpxXEC^9sS732F@5>U2D3Cj2oN4wOI"
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
560,5
pDoProcessLogging
pSourceCube
pArchiveID
pSourceView
pErrorDimensionList
561,5
2
2
2
2
2
590,5
pDoProcessLogging,"1"
pSourceCube,""
pArchiveID,"20170620_001"
pSourceView,""
pErrorDimensionList,"Scenario~Year~Planning Year"
637,5
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pSourceCube,"Input Source Cube:"
pArchiveID,"Input Archive ID:"
pSourceView,"Input Source View:"
pErrorDimensionList,"Error Dimensions List:"
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

#######################################################################################################################
#### Constant 

cArchivePrefix = 'zArchived_' ;

cSourceCube = pSourceCube;
cDimArchiveID = 'Sys Archive ID' ;
cElemArchiveID = pArchiveID ;

cTargetCube = cArchivePrefix | cSourceCube | '_' | cElemArchiveID ;
cSourceView = pSourceView ;
cTargetView = cTargetCube | ' - ' | cSourceView ;

cMAX = 9999999999999;

nDimensionCount = 0;

sDelimiter = '~' ;

sDimSubsetElems01='';sDimSubsetElems02='';sDimSubsetElems03='';sDimSubsetElems04='';sDimSubsetElems05='';
sDimSubsetElems06='';sDimSubsetElems07='';sDimSubsetElems08='';sDimSubsetElems09='';sDimSubsetElems10='';
sDimSubsetElems11='';sDimSubsetElems12='';sDimSubsetElems13='';sDimSubsetElems14='';sDimSubsetElems15='';
sDimSubsetElems16='';sDimSubsetElems17='';sDimSubsetElems18='';sDimSubsetElems19='';sDimSubsetElems20='';
sDimSubsetElems21='';sDimSubsetElems22='';sDimSubsetElems23='';sDimSubsetElems24='';sDimSubsetElems25='';
sDimSubsetElems26='';sDimSubsetElems27='';sDimSubsetElems28='';sDimSubsetElems29='';sDimSubsetElems30='';

#######################################################################################################################
#### Validation

#Source Cube
If ( CubeExists( cSourceCube ) = 0 );
       sError = 'Source Cube ' | cSourceCube | ' does not exist! ';
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

#Sys Archive ID
If ( DIMIX( cDimArchiveID, cElemArchiveID )= 0 );
       sError = 'Invalid ArchiveID:  ' | cElemArchiveID ;
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

#Target Cube
If ( CubeExists( cTargetCube ) = 0 );
       sError = 'Target Cube ' | cTargetCube | ' does not exist! ';
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

#Source View
If ( ViewExists( cSourceCube, cSourceView )= 0 );
       sError = 'Source View ' | cSourceView | ' does not exist! ';
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

#######################################################################################################################
#Get Target Dimensions and Susbets Information

#Dimensions Count for Target Cube
nIndex = 1;
WHILE( nIndex <= 30 );
    sTempDim = TABDIM( cTargetCube, nIndex );
    IF( DimensionExists( sTempDim ) > 0 );
        nDimensionCount = nDimensionCount + 1;
    ELSE;
        nIndex = cMAX;
    ENDIF;
    nIndex = nIndex + 1 ;
END;

#######################################################################################################################
#Error Dimensions

nErrorDimensionCount = 0 ;

nErrorDimensionIndex01=0;nErrorDimensionIndex02=0;nErrorDimensionIndex03=0;nErrorDimensionIndex04=0;nErrorDimensionIndex05=0;
nErrorDimensionIndex06=0;nErrorDimensionIndex07=0;nErrorDimensionIndex08=0;nErrorDimensionIndex09=0;nErrorDimensionIndex10=0;
nErrorDimensionIndex11=0;nErrorDimensionIndex12=0;nErrorDimensionIndex13=0;nErrorDimensionIndex14=0;nErrorDimensionIndex15=0;
nErrorDimensionIndex16=0;nErrorDimensionIndex17=0;nErrorDimensionIndex18=0;nErrorDimensionIndex19=0;nErrorDimensionIndex20=0;
nErrorDimensionIndex21=0;nErrorDimensionIndex22=0;nErrorDimensionIndex23=0;nErrorDimensionIndex24=0;nErrorDimensionIndex25=0;
nErrorDimensionIndex26=0;nErrorDimensionIndex27=0;nErrorDimensionIndex28=0;nErrorDimensionIndex29=0;nErrorDimensionIndex30=0;

sTempErrorDimensionList = pErrorDimensionList ;
IF( LONG( sTempErrorDimensionList ) > 0 );

    sTempErrorDimensionList = IF( SUBST( sTempErrorDimensionList, 1, 1 ) @= sDelimiter, '', sDelimiter ) | 
                                                            sTempErrorDimensionList | 
                                                            IF( SUBST( sTempErrorDimensionList, LONG( sTempErrorDimensionList ), 1 ) @= sDelimiter, '', sDelimiter ) ;
    sTempErrorDimensionList = SUBST( sTempErrorDimensionList, 2, LONG( sTempErrorDimensionList ) - 1 );

    AsciiOutput(sDebugFile, sTempErrorDimensionList );

    #Find all error dimensions when building subsets
    nLoopIndex = 0 ;
    sTempStr = sTempErrorDimensionList;
    nStopFlag = 0 ; 

    WHILE( nStopFlag = 0 );

        nLoopIndex = SCAN( sDelimiter, sTempStr );
        IF( nLoopIndex > 0 );
            sTempDim = SUBST( sTempStr, 1, nLoopIndex - 1 );
            IF( LONG( sTempDim ) > 0 );
                nErrorDimensionCount = nErrorDimensionCount + 1 ;

                nTempDimIndex = 1;
                WHILE( nTempDimIndex <= nDimensionCount );
                    sTEMPDIMNAME = TABDIM( cSourceCube, nTempDimIndex );
                    IF( sTEMPDIMNAME @= sTempDim );

                        IF( nErrorDimensionCount = 1 );
                            nErrorDimensionIndex01 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 2 );
                            nErrorDimensionIndex02 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 3 );
                            nErrorDimensionIndex03 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 4 );
                            nErrorDimensionIndex04 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 5 );
                            nErrorDimensionIndex05 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 6 );
                            nErrorDimensionIndex06 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 7 );
                            nErrorDimensionIndex07 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 8 );
                            nErrorDimensionIndex08 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 9 );
                            nErrorDimensionIndex09 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 10 );
                            nErrorDimensionIndex10 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 11 );
                            nErrorDimensionIndex11 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 12 );
                            nErrorDimensionIndex12 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 13 );
                            nErrorDimensionIndex13 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 14 );
                            nErrorDimensionIndex14 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 15 );
                            nErrorDimensionIndex15 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 16 );
                            nErrorDimensionIndex16 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 17 );
                            nErrorDimensionIndex17 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 18 );
                            nErrorDimensionIndex18 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 19 );
                            nErrorDimensionIndex19 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 20 );
                            nErrorDimensionIndex20 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 21 );
                            nErrorDimensionIndex21 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 22 );
                            nErrorDimensionIndex22 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 23 );
                            nErrorDimensionIndex23 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 24 );
                            nErrorDimensionIndex24 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 25 );
                            nErrorDimensionIndex25 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 26 );
                            nErrorDimensionIndex26 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 27 );
                            nErrorDimensionIndex27 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 28 );
                            nErrorDimensionIndex28 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 29 );
                            nErrorDimensionIndex29 = nTempDimIndex ;
                        ELSEIF( nErrorDimensionCount = 30 );
                            nErrorDimensionIndex30 = nTempDimIndex ;
                        ENDIF;

                        nTempDimIndex = cMAX ;

                    ENDIF;
                    nTempDimIndex = nTempDimIndex + 1 ;
                END;

            ENDIF;
            AsciiOutput(sDebugFile, sTempDim );
            sTempStr = DELET( sTempStr, 1, nLoopIndex );
        ELSE;
            nStopFlag = 1 ;
        ENDIF;

    END;

ENDIF;




#######################################################################################################################
#Data Source Setup

ViewExtractSkipCalcsSet(cSourceCube, cSourceView, 0);
ViewExtractSkipRuleValuesSet(cSourceCube, cSourceView, 0);
ViewExtractSkipZeroesSet(cSourceCube, cSourceView, 1);

DataSourceType = 'VIEW';
DatasourceNameForServer = cSourceCube;
DatasourceNameForClient = cSourceCube;
DatasourceCubeView = cSourceView;

########################################################################################################################

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
#IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
#sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script
574,53
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



nTempIndex = 1;

WHILE( nTempIndex <= nErrorDimensionCount );

    nTempErrorDimensionIndex = StringToNumber (Expand( '%nErrorDimensionIndex' | NumberToStringEx( nTempIndex, '00', '', '' ) | '%' ) );
    sTempDim = TABDIM( cTargetCube, nTempErrorDimensionIndex );
    sTempSourceDim = TABDIM( cSourceCube, nTempErrorDimensionIndex ) ;

    sTempElem = Expand( '%V' | NumberToString( nTempErrorDimensionIndex ) | '%' );
    sTempElem = DimensionElementPrincipalName( sTempSourceDim, sTempElem );

    nTempCurrSubsetSize = SubsetGetSize( sTempDim, cTargetView );
    nElemIndex = 1;
    WHILE( nElemIndex <= nTempCurrSubsetSize );
        sTempSubsetElem = SubsetGetElementName( sTempDim, cTargetView, nElemIndex );
        IF( sTempSubsetElem @= sTempElem );
            nElemIndex = cMAX ;
        ENDIF;
        nElemIndex = nElemIndex + 1 ;
    END;

    IF( nElemIndex < cMAX );
        IF( DIMIX( sTempDim, sTempElem ) > 0 );
            SubsetElementInsert( sTempDim, cTargetView, sTempElem, nTempCurrSubsetSize + 1 );
        ENDIF;
    ENDIF;

    nTempIndex = nTempIndex + 1;

END;




##############################################################################################################
### END Data script
575,43
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
