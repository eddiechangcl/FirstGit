601,100
602,"Sys.Archive.View.Clone"
562,"CHARACTERDELIMITED"
586,"D:\DBs\HOI\Data\Sys Parameter}vues\All.vue"
585,"D:\DBs\HOI\Data\Sys Parameter}vues\All.vue"
564,
565,"ncl\`DZcoEb=gUzigwPplLEJ>V8m5eUMjiuW`gGsBfJBxnCtrFnN`9pFn3iY[Em[u41Y3_DB@wgCkUWdHzG5fm_PmaWfqW1gy43dWExa7F@Ud@FhSEAT^Zx`7A?Cyam29CnFMRO:iCESR;uKe<rJlSXKmSTh8f?0=dgMD71SI:Z_k<Nh`P1c\a9HSle@Xw?vqxyt6:Gncl\`DZcoEb=gUzigwPplLEJ>V8m5eU]eiuW`gGsBfJBx~HtrFnN`9pFnC5T[E=Qu41Y0_DB@wgLkESdHzG5fm_PmaGfqW1gy43dXExa7F@Ud@f\VEAT^Zx`7A?C)_i293iv@RO:iCEsS;u;c<r:aSXKmSTh8f?0=dGKD7ATI:Z_K?Nh`P1c\a6HSle@XO~Ouqxyt6:Gncl\`DZcoEb=gUzigwPplLEJ>V8m5eUmciuW`gGsBfJBx^ItrFnN`9pFnc<X[EM^u41Y5_DB@wGAkE_dHzG5fm_PmagmqW1gy43TZExa7F@Ud@v9VEAT^Zx`7A?Cibk29sjFARO:iCE3P;uKe<rJdSXKmSTh8f?0=dgMD71XI:Z_K>Nh`P1c\Q7HSle@Xo|O{qxyt6:Gncl\`DZcoEb=gUzigwPplLEJ>V8m5eU=biuW`gGsBfJBx>GtrFnN`9pFnci[[E]Zu41)?_DB@wW@kE^dHzG5fm_PmaWeqW1gy43$_Exa7F@Ud@fyVEAT^Zx`7A?CILl29sbVCRO:iCEcT;u{e<rZhSXKmSTh8f?0=dgFD71VI:Z_K5Nh`P1c\A:HSle@Xz?pqxyt6:Gncl\`DZcoEb=gUiigwPplLEJ>V8m5eUMniuW`gGsBfJBx^HtrFnN`9pFnCcV[EmSu41i;_DB@w7Mk5[dHzG5fm_Pma7mqW1gy434UExa7F@Ud@VHPEAT^Zx`7A?C9:d29sfvGRO:iCEsQ;u[h<rjeSXKmSTh8f?0=dWAD7A\I:Z_k8Nh`P1c\1;HSle@X_q?rqxyt6:G"
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
567,"	"
588,"."
589,","
568,""
570,
571,
569,0
592,0
599,1000
560,4
pDoProcessLogging
pSourceCube
pArchiveID
pSourceView
561,4
2
2
2
2
590,4
pDoProcessLogging,"1"
pSourceCube,""
pArchiveID,"20170622_001"
pSourceView,"Default"
637,4
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pSourceCube,"Input Source Cube:"
pArchiveID,"Input Archive ID:"
pSourceView,"Input Source View:"
577,1
V1
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
572,261
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

#######################################################################
#Constant

cArchivePrefix = 'zArchived_' ;

cCubeConfig = 'Sys Archive Parameter';

cSourceCube = pSourceCube;
cDimArchiveID = 'Sys Archive ID' ;
cElemArchiveID = pArchiveID ;

cReplaceStr = 'TOBEREPLACED' ;

cTargetCube = cArchivePrefix | cSourceCube | '_' | cElemArchiveID ;
cSourceView = pSourceView ;
cTargetView = cTargetCube | ' - ' | cSourceView ;

cDataFolder = CellGetS( cCubeConfig, 'TM1 Data Directory', 'Text' ) ;
IF (SUBST(cDataFolder, Long(cDataFolder), 1) @= '\'); cDataFolder = SubSt(cDataFolder, 1, Long(cDataFolder) - 1); ENDIF;
cViewFolder = cDataFolder | '\' | cSourceCube | '}vues\' ;
cSourceFilePath = cViewFolder | cSourceView | '.vue' ;

cOutputFile = GetProcessErrorFileDirectory | cProcessName | cTimeStamp | sRandomInt | '-DEBUG.Log' ;

##############################################
#
sTitleDimension01='';sTitleDimension02='';sTitleDimension03='';sTitleDimension04='';sTitleDimension05='';
sTitleDimension06='';sTitleDimension07='';sTitleDimension08='';sTitleDimension09='';sTitleDimension10='';
sTitleDimension11='';sTitleDimension12='';sTitleDimension13='';sTitleDimension14='';sTitleDimension15='';
sTitleDimension16='';sTitleDimension17='';sTitleDimension18='';sTitleDimension19='';sTitleDimension20='';
sTitleDimension21='';sTitleDimension22='';sTitleDimension23='';sTitleDimension24='';sTitleDimension25='';
sTitleDimension26='';sTitleDimension27='';sTitleDimension28='';sTitleDimension29='';sTitleDimension30='';


nTitleDimensionCount = 0 ;
nCurrentTitleDimensionIndex = 0 ;

nColumnDimensionCount = 0 ;
nCurrentColumnDimensionIndex = 0 ;

nRowDimensionCount = 0 ;
nCurrentRowDimensionIndex = 0 ;

nElementFlag = 0 ;
nElementCount = 0;
nCurrentElementIndex = 0 ;
nValidElementIndex = 0 ;

nTitleElementCount = 0 ;
nCurrentTitleElementIndex = 0 ;

sCurrentDimensionName = '' ;
sCurrentTargetDimensionName = '' ;

nMDXLenth = 0 ;

sDelimiter = '~' ;
sErrorSourceDimensionStr = '' ;
nCloneErrorFlag = 0 ;

##############################################
#ConstantCodes

cConsCode_CubeName = '390,' ;
cConsCode_TitleDimensionCount = '374,' ;
cConsCode_DimensionName = '7,' ;
cConsCode_SubsetName = '6,' ;
cConsCode_ColumnDimensionCount = '360,' ;
cConsCode_RowDimensionCount = '371,' ;
cConsCode_ElementCount = '270,' ;
cConsCode_Alias = '274,' ;
cConsCode_TitleElement = '373,' ;
cConsCode_MDX = '275,' ;
cConsCode_ExpandAbove = '281,' ;
cConsCode_SuppressRow = '384,' ;
cConsCode_SuppressCol = '385,' ;

#######################################################################
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

#Source View File
If ( FileExists( cSourceFilePath )= 0 );
       sError = 'Source File: ' | cSourceFilePath | ' does not exist! ';
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

#######################################################################
#Create Target Cube View

IF( ViewExists( cTargetCube, cTargetView ) <> 0 );
    ViewDestroy( cTargetCube, cTargetView );
ENDIF;

ViewCreate( cTargetCube, cTargetView );


#Create Target Subsets
nINDEX = 1 ;
WHILE( TABDIM( cTargetCube, nINDEX ) @<> '' );
    sTempDIM = TABDIM( cTargetCube, nINDEX );

    IF( SubsetExists( sTempDIM, cTargetView ) <> 0 );
        SubsetDestroy( sTempDIM, cTargetView );
    ENDIF;
    SubsetCreate( sTempDIM, cTargetView );
    ViewSubsetAssign( cTargetCube, cTargetView, sTempDIM, cTargetView );

    nINDEX = nINDEX + 1 ;
END;


#######################################################################
#DATA SOURCE

DatasourceNameForServer = cSourceFilePath ;
DataSourceType = 'CHARACTERDELIMITED' ;

#######################################################################

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
574,436
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



##################################################################################################
#390
IF( SUBST( V1, 1, LONG( cConsCode_CubeName ) ) @= cConsCode_CubeName );

##########
#DO NOTHING
##########

##################################################################################################
#374
ELSEIF( SUBST( V1, 1, LONG( cConsCode_TitleDimensionCount ) ) @= cConsCode_TitleDimensionCount );

    nTitleDimensionCount = StringToNumber( SUBST( V1, LONG( cConsCode_TitleDimensionCount ) + 1, LONG( V1 ) - LONG( cConsCode_TitleDimensionCount ) ) );
   
##################################################################################################
#360
ELSEIF( SUBST( V1, 1, LONG( cConsCode_ColumnDimensionCount ) ) @= cConsCode_ColumnDimensionCount );

    nColumnDimensionCount = StringToNumber( SUBST( V1, LONG( cConsCode_ColumnDimensionCount ) + 1, LONG( V1 ) - LONG( cConsCode_ColumnDimensionCount ) ) );

##################################################################################################
#371
ELSEIF( SUBST( V1, 1, LONG( cConsCode_RowDimensionCount ) ) @= cConsCode_RowDimensionCount );

    nRowDimensionCount = StringToNumber( SUBST( V1, LONG( cConsCode_RowDimensionCount ) + 1, LONG( V1 ) - LONG( cConsCode_RowDimensionCount ) ) );

##################################################################################################
#7:    TITLE ELEM INDEX or DIMENSION NAME
ELSEIF( SUBST( V1, 1, LONG( cConsCode_DimensionName ) ) @= cConsCode_DimensionName );

    sTEMPCurrentDimensionName = SUBST( V1, LONG( cConsCode_DimensionName ) + 1, LONG( V1 ) - LONG( cConsCode_DimensionName ) ) ;
    sTEMPCurrentTargetDimensionName = cArchivePrefix | sTEMPCurrentDimensionName | '_' | cElemArchiveID ;
    
    #Dimension Name
    IF( DimensionExists( sTEMPCurrentDimensionName ) > 0 );
####

        sCurrentDimensionName = sTEMPCurrentDimensionName ;
        sCurrentTargetDimensionName = sTEMPCurrentTargetDimensionName ;

        IF( nCurrentTitleDimensionIndex < nTitleDimensionCount  );
            nCurrentTitleDimensionIndex = nCurrentTitleDimensionIndex + 1 ;

            ViewTitleDimensionSet( cTargetCube, cTargetView, sCurrentTargetDimensionName );

            IF( nCurrentTitleDimensionIndex = 1 );
                sTitleDimension01 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 2 );
                sTitleDimension02 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 3 );
                sTitleDimension03 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 4 );
                sTitleDimension04 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 5 );
                sTitleDimension05 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 6 );
                sTitleDimension06 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 7 );
                sTitleDimension07 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 8 );
                sTitleDimension08 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 9 );
                sTitleDimension09 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 10 );
                sTitleDimension10 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 11 );
                sTitleDimension11 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 12 );
                sTitleDimension12 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 13 );
                sTitleDimension13 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 14 );
                sTitleDimension14 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 15 );
                sTitleDimension15 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 16 );
                sTitleDimension16 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 17 );
                sTitleDimension17 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 18 );
                sTitleDimension18 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 19 );
                sTitleDimension19 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 20 );
                sTitleDimension20 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 21 );
                sTitleDimension21 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 22 );
                sTitleDimension22 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 23 );
                sTitleDimension23 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 24 );
                sTitleDimension24 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 25 );
                sTitleDimension25 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 26 );
                sTitleDimension26 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 27 );
                sTitleDimension27 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 28 );
                sTitleDimension28 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 29 );
                sTitleDimension29 = sCurrentTargetDimensionName ;
            ELSEIF( nCurrentTitleDimensionIndex = 30 );
                sTitleDimension30 = sCurrentTargetDimensionName ;
            ENDIF;

        ELSEIF( nCurrentColumnDimensionIndex < nColumnDimensionCount );
            nCurrentColumnDimensionIndex =nCurrentColumnDimensionIndex + 1 ;

            ViewColumnDimensionSet( cTargetCube, cTargetView, sCurrentTargetDimensionName, nCurrentColumnDimensionIndex );        

        ELSEIF( nCurrentRowDimensionIndex < nRowDimensionCount );
            nCurrentRowDimensionIndex = nCurrentRowDimensionIndex + 1 ;

            ViewRowDimensionSet( cTargetCube, cTargetView, sCurrentTargetDimensionName, nCurrentRowDimensionIndex );     

        ENDIF;
####
    ELSE;
    #Title Dimension Element
####

        #Title Element Validation
        IF( nCurrentTitleElementIndex < nTitleElementCount );
            nCurrentTitleElementIndex = nCurrentTitleElementIndex + 1;
            sTempTitleDimension = Expand( '%sTitleDimension' | NumberToStringEx( nCurrentTitleElementIndex, '00', '', '' ) | '%' );
            nTempTitleElementIndex = StringToNumber( SUBST( V1, 1, SCAN( ',', V1 ) - 1 ) ) ;
            ViewTitleElementSet( cTargetCube, cTargetView, sTempTitleDimension, nTempTitleElementIndex );
        ENDIF;

####    
    ENDIF;


##################################################################################################
#6:  TITLE ELEM INDEX or SUBSET NAME
ELSEIF( SUBST( V1, 1, LONG( cConsCode_SubsetName ) ) @= cConsCode_SubsetName );

    sTempSubsetName = SUBST( V1, LONG( cConsCode_SubsetName ) + 1, LONG( V1 ) - LONG( cConsCode_SubsetName ) );
    sTempMDX = '' ;
    
    #SUBSET
    IF( SubsetExists( sCurrentDimensionName, sTempSubsetName ) <> 0 );
        #Clone Subset
        nTempSourceSubsetSize = SubsetGetSize( sCurrentDimensionName, sTempSubsetName );
        nTempIndex = 1;
        nTempValidIndex = 0;
        WHILE( nTempIndex <= nTempSourceSubsetSize );
            sTempElem = SubsetGetElementName( sCurrentDimensionName, sTempSubsetName, nTempIndex );
            IF( DIMIX( sCurrentTargetDimensionName, sTempElem ) > 0 );
                nTempValidIndex = nTempValidIndex + 1 ;
                SubsetElementInsert( sCurrentTargetDimensionName, cTargetView, sTempElem, nTempValidIndex );
            ENDIF;
            nTempIndex = nTempIndex + 1 ;
        END;
    ELSE;

        IF( sTempSubsetName @= 'All' );
 
####
                #Create Temple Subset
                sTEMPDIMSUBSET = cTargetView | '_TEMPSUBSET' ;
                IF( SubsetExists( sCurrentTargetDimensionName, sTEMPDIMSUBSET ) <> 0  );
                    SubsetDestroy( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
                ENDIF;
                sTempMDX = '{TM1SUBSETALL( [' | sCurrentTargetDimensionName | '] )}' ;
                SubsetCreateByMDX( sTEMPDIMSUBSET, sTempMDX, sCurrentTargetDimensionName );
                nElements = SubsetGetSize( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
                IF( nElements > 0 );
                    sLastElement = SubsetGetElementName( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nElements );
                    SubsetElementDelete( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nElements );
                    SubsetElementInsert( sCurrentTargetDimensionName, sTEMPDIMSUBSET, sLastElement, nElements );

                    nTEMPSUBSETELEMINDEX = 1;
                    WHILE( nTEMPSUBSETELEMINDEX <= nElements );
                        sTEMPSUBSETELEMNAME =  SubsetGetElementName( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nTEMPSUBSETELEMINDEX );
                        SubsetElementInsert(sCurrentTargetDimensionName, cTargetView, sTEMPSUBSETELEMNAME, nTEMPSUBSETELEMINDEX);
                        nTEMPSUBSETELEMINDEX = nTEMPSUBSETELEMINDEX + 1 ;
                    END;

                ENDIF;

                SubsetDestroy( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
####

        ELSE;

            #Title Element Validation
            IF( nCurrentTitleElementIndex < nTitleElementCount );
                nCurrentTitleElementIndex = nCurrentTitleElementIndex + 1;
                sTempTitleDimension = Expand( '%sTitleDimension' | NumberToStringEx( nCurrentTitleElementIndex, '00', '', '' ) | '%' );
                nTempTitleElementIndex = StringToNumber( SUBST( V1, 1, SCAN( ',', V1 ) - 1 ) ) ;
                ViewTitleElementSet( cTargetCube, cTargetView, sTempTitleDimension, nTempTitleElementIndex );
            ENDIF;

        ENDIF;

    ENDIF ;

    #ViewSubsetAssign( cTargetCube, cTargetView, sCurrentTargetDimensionName, cTargetView );

##################################################################################################
#270
ELSEIF( SUBST( V1, 1, LONG( cConsCode_ElementCount ) ) @= cConsCode_ElementCount );

    nElementCount = StringToNumber( SUBST( V1, LONG( cConsCode_ElementCount )+1, LONG( V1 )-LONG( cConsCode_ElementCount ) ) );
    IF( nElementCount > 0 );
        nCurrentElementIndex = 0 ;
        nElementFlag = 1;
        nValidElementIndex = 0;
    ENDIF;


##################################################################################################
#274
ELSEIF( SUBST( V1, 1, LONG( cConsCode_Alias ) ) @= cConsCode_Alias );

    sTempAlias = SUBST( V1, LONG(cConsCode_Alias)+1, LONG(V1)-LONG(cConsCode_Alias) );
    IF( LONG( sTempAlias ) > 0 );
        SubsetAliasSet( sCurrentTargetDimensionName, cTargetView, sTempAlias );
    ENDIF;

##################################################################################################
#373
ELSEIF( SUBST( V1, 1, LONG( cConsCode_TitleElement ) ) @= cConsCode_TitleElement );

    nTitleElementCount = StringToNumber( SUBST( V1, LONG( cConsCode_TitleElement )+1, LONG( V1 )-LONG( cConsCode_TitleElement ) ) );
    nCurrentTitleElementIndex = 0 ;

##################################################################################################
#275
ELSEIF( SUBST( V1, 1, LONG( cConsCode_MDX ) ) @= cConsCode_MDX );

  IF( LONG( V1 ) > LONG( cConsCode_MDX ) );
      nMDXLenth = StringToNumber( SUBST( V1, LONG( cConsCode_MDX )+1, LONG( V1 )-LONG( cConsCode_MDX ) ) );
  ENDIF;

##################################################################################################
#281
ELSEIF( SUBST( V1, 1, LONG( cConsCode_ExpandAbove ) ) @= cConsCode_ExpandAbove );

   nTempExpandAbove = StringToNumber( SUBST( V1, LONG( cConsCode_ExpandAbove )+1, LONG( V1 )-LONG( cConsCode_ExpandAbove ) ) );
   IF( nTempExpandAbove = 1 );
       SubsetExpandAboveSet( sCurrentTargetDimensionName, cTargetView, nTempExpandAbove );
   ENDIF;

##################################################################################################
#384: Row Zero Suppress
ELSEIF( SUBST( V1, 1, LONG( cConsCode_SuppressRow ) ) @= cConsCode_SuppressRow );

    nTempRowSuppress = StringToNumber( SUBST( V1, LONG( cConsCode_SuppressRow )+1, LONG( V1 )-LONG( cConsCode_SuppressRow ) ) );
    IF( nTempRowSuppress = 1 );
        ViewRowSuppressZeroesSet( cTargetCube, cTargetView, nTempRowSuppress );
    ENDIF;

##################################################################################################
#385: Column Zero Suppress
ELSEIF( SUBST( V1, 1, LONG( cConsCode_SuppressCol ) ) @= cConsCode_SuppressCol );

    nTempColSuppress = StringToNumber( SUBST( V1, LONG( cConsCode_SuppressCol )+1, LONG( V1 )-LONG( cConsCode_SuppressCol ) ) );
    IF( nTempColSuppress = 1 );
        ViewColumnSuppressZeroesSet( cTargetCube, cTargetView, nTempColSuppress );
    ENDIF;

##################################################################################################

ELSE;

    #ElementCount Validation
    IF( nElementFlag = 1 );
        IF( nCurrentElementIndex <= 0 );

            nCurrentElementIndex = nCurrentElementIndex + 1 ;
            IF( DIMIX( sCurrentTargetDimensionName, V1 ) > 0 );
                nValidElementIndex = nValidElementIndex + 1;
                SubsetElementInsert( sCurrentTargetDimensionName, cTargetView, V1, nValidElementIndex );    
            ELSE;
                nCloneErrorFlag = 1;
                IF( SCAN( sCurrentDimensionName, sErrorSourceDimensionStr ) = 0 );
                    sErrorSourceDimensionStr = sErrorSourceDimensionStr | sCurrentDimensionName | sDelimiter ;
                ENDIF;       
            ENDIF;

        ELSEIF( nCurrentElementIndex < nElementCount );
            nCurrentElementIndex = nCurrentElementIndex + 1 ;
            IF( DIMIX( sCurrentTargetDimensionName, V1 ) > 0 );
                 nValidElementIndex = nValidElementIndex + 1 ;
                SubsetElementInsert( sCurrentTargetDimensionName, cTargetView, V1, nValidElementIndex );      
            ELSE;
                nCloneErrorFlag = 1;
                IF( SCAN( sCurrentDimensionName, sErrorSourceDimensionStr ) = 0 );
                    sErrorSourceDimensionStr = sErrorSourceDimensionStr | sCurrentDimensionName | sDelimiter ;
                ENDIF;        
            ENDIF;
        ELSEIF( nCurrentElementIndex >= nElementCount );

            #Reset Subset Element by MDX
            nTEMPTARGETSUBSETELEMCOUNT = SubsetGetSize (sCurrentTargetDimensionName, cTargetView ) ;
            IF( nTEMPTARGETSUBSETELEMCOUNT = 0 );
####
                #Create Temple Subset
                sTEMPDIMSUBSET = cTargetView | '_TEMPSUBSET' ;
                IF( SubsetExists( sCurrentTargetDimensionName, sTEMPDIMSUBSET ) <> 0  );
                    SubsetDestroy( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
                ENDIF;
                sTempMDX = '{TM1SUBSETALL( [' | sCurrentTargetDimensionName | '] )}' ;
                SubsetCreateByMDX( sTEMPDIMSUBSET, sTempMDX, sCurrentTargetDimensionName );
                nElements = SubsetGetSize( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
                IF( nElements > 0 );
                    sLastElement = SubsetGetElementName( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nElements );
                    SubsetElementDelete( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nElements );
                    SubsetElementInsert( sCurrentTargetDimensionName, sTEMPDIMSUBSET, sLastElement, nElements );

                    nTEMPSUBSETELEMINDEX = 1;
                    WHILE( nTEMPSUBSETELEMINDEX <= nElements );
                        sTEMPSUBSETELEMNAME =  SubsetGetElementName( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nTEMPSUBSETELEMINDEX );
                        SubsetElementInsert(sCurrentTargetDimensionName, cTargetView, sTEMPSUBSETELEMNAME, nTEMPSUBSETELEMINDEX);
                        nTEMPSUBSETELEMINDEX = nTEMPSUBSETELEMINDEX + 1 ;
                    END;

                ENDIF;

                SubsetDestroy( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
####
            ENDIF;

            nElementFlag = 0 ;
        ENDIF;
    ENDIF;

    #Title Element Validation
    IF( nCurrentTitleElementIndex < nTitleElementCount );
        nCurrentTitleElementIndex = nCurrentTitleElementIndex + 1;
        sTempTitleDimension = Expand( '%sTitleDimension' | NumberToStringEx( nCurrentTitleElementIndex, '00', '', '' ) | '%' );
        nTempTitleElementIndex = StringToNumber( SUBST( V1, 1, SCAN( ',', V1 ) - 1 ) ) ;
        ViewTitleElementSet( cTargetCube, cTargetView, sTempTitleDimension, nTempTitleElementIndex );
    ENDIF;

    #MDX
    IF( nMDXLenth > 0 );
        
        sTempMDX = V1 ;

        sTempMDX = '{' | sTempMDX | '}' ;
        
        ############################################
        #CONVERT MDX
        # From  zArchived_**_<>  TO   <TOBECONVERT>
        #From ** TO <TOBECONVERT>    (TABDIM( cSourceCube, nTempIndex ) )
        #From <TOBECONVERT> TO zArchived_**_<>

        ###########

        sTempConvertFrom01=sCurrentTargetDimensionName;sTempConvertTo01=cReplaceStr;
        sTempConvertFrom02=sCurrentDimensionName;sTempConvertTo02=cReplaceStr;
        sTempConvertFrom03=cReplaceStr;sTempConvertTo03=sCurrentTargetDimensionName;

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

        IF( nElementCount  = 0 );

            #Create Temple Subset
            sTEMPDIMSUBSET = cTargetView | '_TEMPSUBSET' ;
            IF( SubsetExists( sCurrentTargetDimensionName, sTEMPDIMSUBSET ) <> 0  );
                SubsetDestroy( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
            ENDIF;
            SubsetCreateByMDX( sTEMPDIMSUBSET, sTempMDX, sCurrentTargetDimensionName );
            nElements = SubsetGetSize( sCurrentTargetDimensionName, sTEMPDIMSUBSET );
            IF( nElements > 0 );
                sLastElement = SubsetGetElementName( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nElements );
                SubsetElementDelete( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nElements );
                SubsetElementInsert( sCurrentTargetDimensionName, sTEMPDIMSUBSET, sLastElement, nElements );

                nTEMPSUBSETELEMINDEX = 1;
                WHILE( nTEMPSUBSETELEMINDEX <= nElements );
                    sTEMPSUBSETELEMNAME =  SubsetGetElementName( sCurrentTargetDimensionName, sTEMPDIMSUBSET, nTEMPSUBSETELEMINDEX );
                    SubsetElementInsert(sCurrentTargetDimensionName, cTargetView, sTEMPSUBSETELEMNAME, nTEMPSUBSETELEMINDEX);
                    nTEMPSUBSETELEMINDEX = nTEMPSUBSETELEMINDEX + 1 ;
                END;

            ENDIF;

            SubsetDestroy( sCurrentTargetDimensionName, sTEMPDIMSUBSET );

            nMDXLenth = 0 ;
        ENDIF;

    ENDIF;

ENDIF;




##############################################################################################################
### END Data script
575,54
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


##########################################
#Update Subsets in View 

IF( nCloneErrorFlag = 999999 );
    ExecuteProcess(
        'Sys.Archive.View.Update.After Clone',
        'pDoProcessLogging', pDoProcessLogging,
        'pSourceCube', pSourceCube,
        'pArchiveID', pArchiveID,
        'pSourceView', pSourceView,
        'pErrorDimensionList', sErrorSourceDimensionStr
    );
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
