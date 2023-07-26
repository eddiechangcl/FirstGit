601,100
602,"}APQ.Dim.StagingDataSource.Add"
562,"NULL"
586,"}Cubes"
585,"}Cubes"
564,
565,"h0E\ykD\a:`PKD8F0v;F96ItKmF_>pE\N3BXJ]_x01Z1Fjr7Uuj`oy9GAD6VZjtc6:>Y1dA5CS\fJtcRAl?BrB\p<@`otWhHlHAXX<\HGgyVu5vJ36K1Y3=EfLz1i:0^\rXOn>a\dKXp_P:LdGs>rcUKw6bMl6Nu]kjGHwP]Gy^NrGvHLyo_u@PFqM=U?BwOoPh`WAbp"
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
560,7
pDoProcessLogging
pID
pCaption
pSourceType
pSourceName
pTargetCube
pSourceDuplicate
561,7
2
2
2
2
2
2
2
590,7
pDoProcessLogging,"1"
pID,""
pCaption,""
pSourceType,"CSV"
pSourceName,""
pTargetCube,""
pSourceDuplicate,""
637,7
pDoProcessLogging,"Record in process log"
pID,"Required: Data source ID (must be unique)"
pCaption,"Optional: Caption"
pSourceType,"Required: Data source type (CSV, ODBC, Cube, Process)"
pSourceName,"Optional: Name of data source (e.g. file name if CSV). Can be configured later"
pTargetCube,"Optional: Target cube. Can be configured later"
pSourceDuplicate,"Optional: Data source to duplicate from. (If selected then pSourceType & pTargetCube ignored and matched to the source element)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,173
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
### 2020-08-12 		    SW 	            Creation of Process
##############################################################################################################
#Region @DOC
# Description:
#   This process is for use in a GUI to facilitate creation of new sources for the data staging module without needing to manually edit the
#   **}APQ Staging Data Source** dimension. 
# 
# Data Source:
#   None (manual parameter entry)
#
# Use Case:
#   Create new sources for data staging module. 
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName(); 
### Params
sProcLogParams = Expand('pID:%pID% & pCaption:%pCaption% & pSourceType:%pSourceType% & pSourceName:%pSourceName% & pTargetCube:%pTargetCube% & pSourceDuplicate:%pSourceDuplicate%');
### Params
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQ Processes',sThisProcName)=0);DimensionElementInsertDirect('}APQ Processes','',sThisProcName,'N');DimensionElementComponentAddDirect('}APQ Processes','Total APQ Processes',sThisProcName,1);EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');nCountTime=nCountTime+1;End;
  If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Initialize Logging
##############################################################################################################
#EndRegion - Header
##############################################################################################################

##############################################################################################################
#Region - Declare constants
cDimTgt         = '}APQ Staging Data Source';
cCubTgt         = '}APQ Staging Control';
cDimParam       = '}APQ Staging Control Parameter';
cCubMap         = '}APQ Staging Dimension Mapping';
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cViewClr        = cViewClrPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubClr         = cViewClr;
cTestVal1       = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2       = DimNm( cDimTest, 1 );
cTestVal3       = CellGetS( cCubParam, 'Customer Name', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
pDebug          = '1';
nDebug          = StringToNumber( pDebug );
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

DatasourceASCIIDelimiter        = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' );
DatasourceASCIIQuoteCharacter   = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' );
#EndRegion - Declare constants
##############################################################################################################

######################
### Debug

IF( pDebug @>= '1' );
   AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
   AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
   AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

##############################################################################################################
#Region - Test parameters

#Is framework licensed?
If( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Customer key not found!';
EndIf;

If( pID @= '' );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No data source ID defined!';
ElseIf( DimIx( cDimTgt, pID ) > 0 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('Data source %pID% already exists!');
EndIf;

If( DimIx( cDimTgt, pSourceDuplicate ) > 0 );
    pSourceDuplicate = DimensionElementPrincipalName( cDimTgt, pSourceDuplicate );
    If( pSourceDuplicate @= 'NA Data Source' );
        pSourceDuplicate = '';
    EndIf;
EndIf;
If( DimIx( cDimTgt, pSourceDuplicate ) > 0 );
    pSourceType = AttrS( cDimTgt, pSourceDuplicate, 'Source Type' );
    pTargetCube = AttrS( cDimTgt, pSourceDuplicate, 'Target Cube' );
EndIf;

If( pSourceType @<> 'CSV' & pSourceType @<> 'ODBC' & pSourceType @<> 'Cube' & pSourceType @<> 'Process' );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('Invalid source type %pSourceType%!');
EndIf;

If( pTargetCube @<> '' & CubeExists( pTargetCube ) = 0 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | Expand('Invalid target cube %pTargetCube%!');
EndIf;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;

#EndRegion - Test parameters
##############################################################################################################

CubeSetLogChanges( cCubTgt, 1 );
CubeSetLogChanges( '}ElementAttributes_' | cDimTgt, 1 );

##############################################################################################################
#Region - Create element

DimensionElementInsert( cDimTgt, '', pSourceType, 'C' );
DimensionElementInsert( cDimTgt, '', pID, 'N' );
DimensionElementComponentAdd( cDimTgt, pSourceType, pID, 1 );

DataSourceType          = 'NULL';

#EndRegion -  Create element
##############################################################################################################

##############################################################################################################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,68
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

######################
### Epilog script

sDebugFile = cDebugFile | '_Epilog.log';

##############################################################################################################
#Region - Update attributes / Masterdata
If( nErr = 0 );
    AttrPutS( pSourceType, cDimTgt, pID, 'SourceType' );
    AttrPutS( pCaption, cDimTgt, pID, 'Caption' );
    CellPutS( pSourceName, cCubTgt, pID, 'NameSource', 'String' );
    CellPutS( pTargetCube, cCubTgt, pID, 'TargetCube', 'String' );
    If( DImIx( cDimTgt, pSourceDuplicate ) > 0 );
        iParam = 1;
        While( iParam <= DimSiz( cDimParam ) );
            sParam = DimNm( cDimParam, iParam );
            If( AttrS( cDimParam, sParam, 'User Entry' ) @= 'TRUE' & CellIsUpdateable( cCubTgt, pID, sParam, 'String' ) = 1 );
                CellPutS( CellGetS( cCubTgt, pSourceDuplicate, sParam, 'String' ), cCubTgt, pID, sParam, 'String' );
            EndIf;
            iParam = iParam + 1;
        End;
        ExecuteProcess( '}bedrock.cube.data.copy', 'pLogOutput', 0, 'pStrictErrorHandling', 0,
             'pCube', cCubMap, 'pSrcView', cViewSrc, 'pTgtView', cViewClr,
             'pFilter', cDimTgt|'¦'|pSourceDuplicate, 'pFilterParallel', '', 'pParallelThreads', 0,
             'pEleMapping', cDimTgt|'¦'|pSourceDuplicate|'->'|pID,
             'pMappingDelim', '->', 'pDimDelim', '&', 'pEleStartDelim', '¦', 'pEleDelim', '+',
             'pFactor', 1, 'pSuppressConsol', 1, 'pSuppressRules', 1, 'pCumulate', 0,
             'pZeroTarget', 0, 'pZeroSource', 0, 'pTemp', 1,
             'pCubeLogging', 0, 'pSandbox', '', 'pFile', 0,
             'pSubN', 0, 'pThreadMode', 0
        );
    EndIf;
    AttrPutS( pSourceType, cDimTgt, pID, 'SourceType' );
    AttrPutS( pCaption, cDimTgt, pID, 'Caption' );
    CellPutS( pSourceName, cCubTgt, pID, 'NameSource', 'String' );
    CellPutS( pTargetCube, cCubTgt, pID, 'TargetCube', 'String' );
EndIf;
#EndRegion -  Update attributes / Masterdata
##############################################################################################################

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
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
#EndRegion - Finalize Logging
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
