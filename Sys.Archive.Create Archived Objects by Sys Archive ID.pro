601,100
602,"Sys.Archive.Create Archived Objects by Sys Archive ID"
562,"VIEW"
586,"Sys Archive Profile"
585,"Sys Archive Profile"
564,
565,"e;25LzXBgkyfiv;c9@OVGcaAR6=aEqd6@6hB;9Pypw9AD|CqR5f^EJMaX`7G8Nd1YHpM<WE4c`9Ehs:m1SZC9Mn8YcELFfORgRE)_VgAU@hK2cvaZsP5MIQGRYCpzZhngFY7Z0><u<jHNtEG4O56O1Y?z9a9aqt`z&{W`F;]1;0LU`B7fk[ku32tIN2BfNK:<G@j@8je;25LtXBgkyfiv;c9@OVGcaAR6=aEqdfM6hB;9Pypw9ADlHqR5f^EJMaX`kO8ND3YHpm<WE4c`yJhc?m1SZC9Mn8YcUDFfORgREys_VgAU@hK2CidZsP5MIQGRYC0QXhngK95Z0><u<jANteK4O5;O1Y?z9a9aqt`zFrW`6=]1;0|X`B7fk[k522tIN2BFCK:<G@j@8j"
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
570,zTemp
571,
569,0
592,0
599,1000
560,2
pDoProcessLogging
pArchiveID
561,2
2
2
590,2
pDoProcessLogging,"1"
pArchiveID,"20170603_001"
637,2
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
pArchiveID,"Archive ID:"
577,4
vArchiveID
vCube
vMeasure
vValue
578,4
2
2
2
1
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
VarType=33ColType=827
603,0
572,219
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


#######################################################################################
#
# CONSTANT
#
#######################################################################################

cCubeSource = 'Sys Archive Profile' ;

cDimArchiveID = 'Sys Archive ID' ;
cDimCube = '}Cubes' ;
cDimMeasure = 'M Sys Archive Profile' ;

cElemArchiveID = pArchiveID ;
cMDimensionCount = 'Dimension Count' ;
cMArchiveFlag = 'Archive Flag' ;

cArchivePrefix = 'zArchived_' ;

cProcessCloneDim = 'Bedrock.Dim.Clone' ;
cParamName1='pSourceDim';
cParamName2='pTargetDim';
cParamName3='pAttr';
cParamName4='pUnwind';
cParamName5='pDebug';

nParamValue3=1;
nParamValue4=1;
nParamValue5=0;

#######################################################################################
#
# VALIDATION
#
#######################################################################################

#Validate both Empty and Invalid
sValidation001 = cElemArchiveID; sDimValidation001 = cDimArchiveID; sEmptyError001 = 'Sys Archive ID cannot be empty.'; sInvalidError001 = 'Invalid ArchiveID: ' | cElemArchiveID;
nValidations = 1;

nCountValidation = 1;
While (nCountValidation <= nValidations);
     sValidation = Expand('%sValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sDimValidation = Expand('%sDimValidation' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sEmptyError = Expand('%sEmptyError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');
     sInvalidError = Expand('%sInvalidError' | NumberToStringEx(nCountValidation, '000', '', '') | '%');

    If (sValidation @= '');
        sError = sEmptyError;
        AsciiOutput(sDebugFile, sError);
        If (sErr @<> '');
            sErr = sErr | Char(10) | Char(13);
        Endif;
        sErr = sErr | sError;
        nError = 1;
    Else;
        If (DimIx(sDimValidation, sValidation) = 0);
             sError = sInvalidError;
            AsciiOutput(sDebugFile, sError);
            If (sErr @<> '');
                sErr = sErr | Char(10) | Char(13);
            Endif;
            sErr = sErr | sError;
            nError = 1;
        Endif;
    Endif;

     nCountValidation = nCountValidation + 1;
End;

If (nError <> 0);
    ProcessBreak();
Endif;

#######################################################################################
#
# CREATE DATA SOURCE
#
#######################################################################################

#Define Temporary Object Name, and Check if the view already exists
cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
While (ViewExists(cCubeSource, cTempName | '_Source') <> 0);
    cTempName = '}TI_' | cProcessName | NumberToString(Int(Rand() * 10000));
End;
cViewSource = cTempName | '_Source';
cSub = cTempName | '_Source';

If (ViewExists(cCubeSource, cViewSource) = 0);
    ViewCreate(cCubeSource, cViewSource);
Endif;

#ArchiveID
sDim = cDimArchiveID; sElement = cElemArchiveID;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#}Cubes
sDim = cDimCube;
sMDX = '{FILTER( {TM1SUBSETALL( [' | sDim | '] )}, [' | cCubeSource | '].([' | cDimArchiveID | '].[' | cElemArchiveID | '],[' | cDimMeasure | '].[' | cMArchiveFlag | ']) = "✓"  )}';
If (SubsetExists(sDim, cSub) <> 0);
    SubsetDestroy(sDim, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMDX, sDim);
nElements = SubsetGetSize(sDim, cSub);
sLastElement = SubsetGetElementName(sDim, cSub, nElements);
SubsetElementDelete(sDim, cSub, nElements);
SubsetElementInsert(sDim, cSub, sLastElement, nElements);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#M Sys Archive Profile
sDim = cDimMeasure; sElement = cMDimensionCount;
If (SubsetExists(sDim, cSub) = 0);
    SubsetCreate(sDim, cSub);
Endif;
SubsetDeleteAllElements(sDim, cSub);
SubsetElementInsert(sDim, cSub, sElement, 1);
ViewSubsetAssign(cCubeSource, cViewSource, sDim, cSub);

#######################################################################################
#
# ASSIGN DATA SOURCE
#
#######################################################################################

#nDim = CubeDimensionCountGet(cCubeSource);
nDim = 3 ;
nCount = 1;
While (nCount <= nDim);
    sDim = TabDim (cCubeSource, nCount);
    ViewRowDimensionSet(cCubeSource, cViewSource, sDim, nCount);
    nCount = nCount + 1;
End;

ViewExtractSkipCalcsSet(cCubeSource, cViewSource, 0);
ViewExtractSkipRuleValuesSet(cCubeSource, cViewSource, 0);
ViewExtractSkipZeroesSet(cCubeSource, cViewSource, 1);

DataSourceType = 'VIEW';
DatasourceNameForServer = cCubeSource;
DatasourceNameForClient = cCubeSource;
DatasourceCubeView = cViewSource;

573,380
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


######################################################################################################################################################################################
#
# SOURCE CUBE DIMENSION COUNT
#
######################################################################################################################################################################################

nCubeDimensionCount = vValue ;

######################################################################################################################################################################################
#
# SOURCE CUBE DIMENSION DETAILS
#
######################################################################################################################################################################################

sSourceDim001=TABDIM(vCube,1);sSourceDim002=TABDIM(vCube,2);sSourceDim003=TABDIM(vCube,3);sSourceDim004=TABDIM(vCube,4);sSourceDim005=TABDIM(vCube,5);
sSourceDim006=TABDIM(vCube,6);sSourceDim007=TABDIM(vCube,7);sSourceDim008=TABDIM(vCube,8);sSourceDim009=TABDIM(vCube,9);sSourceDim010=TABDIM(vCube,10);
sSourceDim011=TABDIM(vCube,11);sSourceDim012=TABDIM(vCube,12);sSourceDim013=TABDIM(vCube,13);sSourceDim014=TABDIM(vCube,14);sSourceDim015=TABDIM(vCube,15);
sSourceDim016=TABDIM(vCube,16);sSourceDim017=TABDIM(vCube,17);sSourceDim018=TABDIM(vCube,18);sSourceDim019=TABDIM(vCube,19);sSourceDim020=TABDIM(vCube,20);
sSourceDim021=TABDIM(vCube,21);sSourceDim022=TABDIM(vCube,22);sSourceDim023=TABDIM(vCube,23);sSourceDim024=TABDIM(vCube,24);sSourceDim025=TABDIM(vCube,25);
sSourceDim026=TABDIM(vCube,26);sSourceDim027=TABDIM(vCube,27);sSourceDim028=TABDIM(vCube,28);sSourceDim029=TABDIM(vCube,29);sSourceDim030=TABDIM(vCube,30);
sSourceDim031=TABDIM(vCube,31);sSourceDim032=TABDIM(vCube,32);sSourceDim033=TABDIM(vCube,33);sSourceDim034=TABDIM(vCube,34);sSourceDim035=TABDIM(vCube,35);
sSourceDim036=TABDIM(vCube,36);sSourceDim037=TABDIM(vCube,37);sSourceDim038=TABDIM(vCube,38);sSourceDim039=TABDIM(vCube,39);sSourceDim040=TABDIM(vCube,40);
sSourceDim041=TABDIM(vCube,41);sSourceDim042=TABDIM(vCube,42);sSourceDim043=TABDIM(vCube,43);sSourceDim044=TABDIM(vCube,44);sSourceDim045=TABDIM(vCube,45);
sSourceDim046=TABDIM(vCube,46);sSourceDim047=TABDIM(vCube,47);sSourceDim048=TABDIM(vCube,48);sSourceDim049=TABDIM(vCube,49);sSourceDim050=TABDIM(vCube,50);

######################################################################################################################################################################################
#
# TARGET CUBE NAME
#
######################################################################################################################################################################################

sTargetCube = cArchivePrefix | vCube | '_' | cElemArchiveID ;

######################################################################################################################################################################################
#
# TARGET CUBE DIMENSION DETAILS
#
######################################################################################################################################################################################

sTargetDim001=cArchivePrefix | sSourceDim001 | '_' | cElemArchiveID ;sTargetDim002=cArchivePrefix | sSourceDim002 | '_' | cElemArchiveID ;sTargetDim003=cArchivePrefix | sSourceDim003 | '_' | cElemArchiveID ;sTargetDim004=cArchivePrefix | sSourceDim004 | '_' | cElemArchiveID ;sTargetDim005=cArchivePrefix | sSourceDim005 | '_' | cElemArchiveID ;
sTargetDim006=cArchivePrefix | sSourceDim006 | '_' | cElemArchiveID ;sTargetDim007=cArchivePrefix | sSourceDim007 | '_' | cElemArchiveID ;sTargetDim008=cArchivePrefix | sSourceDim008 | '_' | cElemArchiveID ;sTargetDim009=cArchivePrefix | sSourceDim009 | '_' | cElemArchiveID ;sTargetDim010=cArchivePrefix | sSourceDim010 | '_' | cElemArchiveID ;
sTargetDim011=cArchivePrefix | sSourceDim011 | '_' | cElemArchiveID ;sTargetDim012=cArchivePrefix | sSourceDim012 | '_' | cElemArchiveID ;sTargetDim013=cArchivePrefix | sSourceDim013 | '_' | cElemArchiveID ;sTargetDim014=cArchivePrefix | sSourceDim014 | '_' | cElemArchiveID ;sTargetDim015=cArchivePrefix | sSourceDim015 | '_' | cElemArchiveID ;
sTargetDim016=cArchivePrefix | sSourceDim016 | '_' | cElemArchiveID ;sTargetDim017=cArchivePrefix | sSourceDim017 | '_' | cElemArchiveID ;sTargetDim018=cArchivePrefix | sSourceDim018 | '_' | cElemArchiveID ;sTargetDim019=cArchivePrefix | sSourceDim019 | '_' | cElemArchiveID ;sTargetDim020=cArchivePrefix | sSourceDim020 | '_' | cElemArchiveID ;
sTargetDim021=cArchivePrefix | sSourceDim021 | '_' | cElemArchiveID ;sTargetDim022=cArchivePrefix | sSourceDim022 | '_' | cElemArchiveID ;sTargetDim023=cArchivePrefix | sSourceDim023 | '_' | cElemArchiveID ;sTargetDim024=cArchivePrefix | sSourceDim024 | '_' | cElemArchiveID ;sTargetDim025=cArchivePrefix | sSourceDim025 | '_' | cElemArchiveID ;
sTargetDim026=cArchivePrefix | sSourceDim026 | '_' | cElemArchiveID ;sTargetDim027=cArchivePrefix | sSourceDim027 | '_' | cElemArchiveID ;sTargetDim028=cArchivePrefix | sSourceDim028 | '_' | cElemArchiveID ;sTargetDim029=cArchivePrefix | sSourceDim029 | '_' | cElemArchiveID ;sTargetDim030=cArchivePrefix | sSourceDim030 | '_' | cElemArchiveID ;
sTargetDim031=cArchivePrefix | sSourceDim031 | '_' | cElemArchiveID ;sTargetDim032=cArchivePrefix | sSourceDim032 | '_' | cElemArchiveID ;sTargetDim033=cArchivePrefix | sSourceDim033 | '_' | cElemArchiveID ;sTargetDim034=cArchivePrefix | sSourceDim034 | '_' | cElemArchiveID ;sTargetDim035=cArchivePrefix | sSourceDim035 | '_' | cElemArchiveID ;
sTargetDim036=cArchivePrefix | sSourceDim036 | '_' | cElemArchiveID ;sTargetDim037=cArchivePrefix | sSourceDim037 | '_' | cElemArchiveID ;sTargetDim038=cArchivePrefix | sSourceDim038 | '_' | cElemArchiveID ;sTargetDim039=cArchivePrefix | sSourceDim039 | '_' | cElemArchiveID ;sTargetDim040=cArchivePrefix | sSourceDim040 | '_' | cElemArchiveID ;
sTargetDim041=cArchivePrefix | sSourceDim041 | '_' | cElemArchiveID ;sTargetDim042=cArchivePrefix | sSourceDim042 | '_' | cElemArchiveID ;sTargetDim043=cArchivePrefix | sSourceDim043 | '_' | cElemArchiveID ;sTargetDim044=cArchivePrefix | sSourceDim044 | '_' | cElemArchiveID ;sTargetDim045=cArchivePrefix | sSourceDim045 | '_' | cElemArchiveID ;
sTargetDim046=cArchivePrefix | sSourceDim046 | '_' | cElemArchiveID ;sTargetDim047=cArchivePrefix | sSourceDim047 | '_' | cElemArchiveID ;sTargetDim048=cArchivePrefix | sSourceDim048 | '_' | cElemArchiveID ;sTargetDim049=cArchivePrefix | sSourceDim049 | '_' | cElemArchiveID ;sTargetDim050=cArchivePrefix | sSourceDim050 | '_' | cElemArchiveID ;


######################################################################################################################################################################################
#
# CREATE TARGET DIMENSIONS
#
######################################################################################################################################################################################

nTempIndex = 1 ;

WHILE( nTempIndex <= nCubeDimensionCount  );

    sTempTargetDim = Expand( '%sTargetDim' | NumberToStringEx( nTempIndex, '000', '', '' ) | '%' );
    sTempSourceDim = Expand( '%sSourceDim' | NumberToStringEx( nTempIndex, '000', '', '' ) | '%' );

    IF( DimensionExists( sTempTargetDim ) = 0 );
        ExecuteProcess(
            cProcessCloneDim,
            cParamName1, sTempSourceDim,
            cParamName2, sTempTargetDim,
            cParamName3, nParamValue3,
            cParamName4, nParamValue4,
            cParamName5, nParamValue5
        );
    ENDIF;
    
    nTempIndex = nTempIndex + 1 ;

END;

######################################################################################################################################################################################
#
# CREATE TARGET CUBES
#
######################################################################################################################################################################################

IF( CubeExists( sTargetCube ) = 0 );

    IF( nCubeDimensionCount = 1 );
    ELSEIF( nCubeDimensionCount = 2 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002);
    ELSEIF( nCubeDimensionCount = 3 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003);
    ELSEIF( nCubeDimensionCount = 4 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004);
    ELSEIF( nCubeDimensionCount = 5 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005);
    ELSEIF( nCubeDimensionCount = 6 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006);
    ELSEIF( nCubeDimensionCount = 7 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007);
    ELSEIF( nCubeDimensionCount = 8 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008);
    ELSEIF( nCubeDimensionCount = 9 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009);
    ELSEIF( nCubeDimensionCount = 10 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010);
    ELSEIF( nCubeDimensionCount = 11 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011);
    ELSEIF( nCubeDimensionCount = 12 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012);
    ELSEIF( nCubeDimensionCount = 13 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013);
    ELSEIF( nCubeDimensionCount = 14 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014);
    ELSEIF( nCubeDimensionCount = 15 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015);
    ELSEIF( nCubeDimensionCount = 16 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016);
    ELSEIF( nCubeDimensionCount = 17 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017);
    ELSEIF( nCubeDimensionCount = 18 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018);
    ELSEIF( nCubeDimensionCount = 19 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019);
    ELSEIF( nCubeDimensionCount = 20 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020);
    ELSEIF( nCubeDimensionCount = 21 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021);
    ELSEIF( nCubeDimensionCount = 22 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022);
    ELSEIF( nCubeDimensionCount = 23 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023);
    ELSEIF( nCubeDimensionCount = 24 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024);
    ELSEIF( nCubeDimensionCount = 25 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025);
    ELSEIF( nCubeDimensionCount = 26 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026);
    ELSEIF( nCubeDimensionCount = 27 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027);
    ELSEIF( nCubeDimensionCount = 28 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028);
    ELSEIF( nCubeDimensionCount = 29 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029);
    ELSEIF( nCubeDimensionCount = 30 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030);
    ELSEIF( nCubeDimensionCount = 31 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031);
    ELSEIF( nCubeDimensionCount = 32 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032);
    ELSEIF( nCubeDimensionCount = 33 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033);
    ELSEIF( nCubeDimensionCount = 34 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034);
    ELSEIF( nCubeDimensionCount = 35 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035);
    ELSEIF( nCubeDimensionCount = 36 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036);
    ELSEIF( nCubeDimensionCount = 37 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037);
    ELSEIF( nCubeDimensionCount = 38 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038);
    ELSEIF( nCubeDimensionCount = 39 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039);
    ELSEIF( nCubeDimensionCount = 40 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040);
    ELSEIF( nCubeDimensionCount = 41 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041);
    ELSEIF( nCubeDimensionCount = 42 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042);
    ELSEIF( nCubeDimensionCount = 43 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043);
    ELSEIF( nCubeDimensionCount = 44 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044);
    ELSEIF( nCubeDimensionCount = 45 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044,sTargetDim045);
    ELSEIF( nCubeDimensionCount = 46 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044,sTargetDim045,sTargetDim046);
    ELSEIF( nCubeDimensionCount = 47 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044,sTargetDim045,sTargetDim046,sTargetDim047);
    ELSEIF( nCubeDimensionCount = 48 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044,sTargetDim045,sTargetDim046,sTargetDim047,sTargetDim048);
    ELSEIF( nCubeDimensionCount = 49 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044,sTargetDim045,sTargetDim046,sTargetDim047,sTargetDim048,sTargetDim049);
    ELSEIF( nCubeDimensionCount = 50 );
        CubeCreate(sTargetCube,
                sTargetDim001,sTargetDim002,sTargetDim003,sTargetDim004,sTargetDim005,sTargetDim006,sTargetDim007,sTargetDim008,sTargetDim009,sTargetDim010,
                sTargetDim011,sTargetDim012,sTargetDim013,sTargetDim014,sTargetDim015,sTargetDim016,sTargetDim017,sTargetDim018,sTargetDim019,sTargetDim020,
                sTargetDim021,sTargetDim022,sTargetDim023,sTargetDim024,sTargetDim025,sTargetDim026,sTargetDim027,sTargetDim028,sTargetDim029,sTargetDim030,
                sTargetDim031,sTargetDim032,sTargetDim033,sTargetDim034,sTargetDim035,sTargetDim036,sTargetDim037,sTargetDim038,sTargetDim039,sTargetDim040,
                sTargetDim041,sTargetDim042,sTargetDim043,sTargetDim044,sTargetDim045,sTargetDim046,sTargetDim047,sTargetDim048,sTargetDim049,sTargetDim050);
    ENDIF;

ENDIF;









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
575,61
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

If (ViewExists( cCubeSource, cViewSource) <> 0);
    ViewDestroy( cCubeSource, cViewSource);
Endif;

nCount = 1;
While (nCount <= 3);
    sDim = TabDim ( cCubeSource, nCount);
    If (SubsetExists( sDim, cSub) <> 0);
        SubsetDestroy( sDim, cSub);
    Endif;
    nCount = nCount + 1;
End;


### Quit Process When Validation Failed
  If (nError <> 0);
      ProcessQuit();
  Endif;

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
