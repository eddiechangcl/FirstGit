601,100
602,"Sys.Time.Attribute.Update"
562,"SUBSET"
586,
585,"Line Item"
564,
565,"xbcKl6ee]^l3Fhy?xwY;_^kIa3JGvka3OK1eAk55Kum9wV\byKouAE`x>lBJx0?;E34dqE=k]O=k5<hopn[:b1exsvcG>1BF4EZn8CVu2H37jUB8Ikl8>L7D[5NFK>946xstGysVQUoT5nJow8Bmd;=g3vlzRFjl3:j;BmjvN4czA@E8uXj6qiFMjHwi]uX=9\iE3G>G"
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
571,
569,0
592,0
599,1000
560,6
pDimension
pTimeAttr
pAttrDelim
pTimeAttrCreateFlag
pDoProcessLogging
pDebug
561,6
2
2
2
2
2
2
590,6
pDimension,"Date"
pTimeAttr,"yyyy M00 dd"
pAttrDelim,"&"
pTimeAttrCreateFlag,"0"
pDoProcessLogging,"1"
pDebug,"0"
637,6
pDimension,"REQUIRED: Target Time Dimension: e.g. Date, Year, Month, Year Month etc."
pTimeAttr,"OPTIONAL: Time Attribute to copy from Sys Time Attribute cube. EMPTY = All Attr from Target Dim"
pAttrDelim,"OPTIONAL: Delimiter for start of Dimension/Element set  (default value if blank = '&')"
pTimeAttrCreateFlag,"REQUIRED: Attribute Create Flag in Target Time Dimension. (0 = Do Not Create New Attribute; 1 = Create New Attribute)"
pDoProcessLogging,"REQUIRED: Process Logging (0 = No logging, 1 = Logging)"
pDebug,"Write debug log file?"
577,1
vEl
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
572,190
##############################################################################################################
### CWA Std. Model  version 3.5
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
### This software and related documentation are provided under a license agreement containing restrictions on use and disclosure
### and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law,
### you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish,
### or display any part, in any form, or by any means.
##############################################################################################################
# PURPOSE:
#    to update Time Dimension Attribute - from Sys Time Attribute to Target Time Dim
# 
# DATA SOURCE:
#    Sys Time Attribute Cube
#
# REMARK:
#    none
#
# CHANGE HISTORY:
#   DATE        CHANGED BY          COMMENT
#   2020-02-26  Lingo Wang          Initial Build
#   2020-10-05  Lingo Wang        Remove Planning Year Dim
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

#######################################################
### validation para ###
If (pDimension @= '');
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No dimension specified.';
Endif;

IF( DimensionExists( pDimension ) = 0 );
   nErr = nErr + 1;
   sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid dimension:' | pDimension; 
EndIF;

If (pTimeAttr @= '');
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No attribute specified';
Endif;

If (pAttrDelim @= '');
    pAttrDelim = '&';
Endif;


### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
   IF( pDebug @>= '1' );
      AsciiOutput( sDebugFile, sErr );
   EndIF;
   DataSourceType = 'NULL';
   ItemReject( sErr );
EndIF;


#######################################################
### Constants ###
cSourceCube = 'Sys Time Attribute';
cTimeDev = 'T';
cSourceDim = 'Date';
cTargetDim = pDimension;
cSourceAttrDim = 'M Sys Time Attribute';
cTargetAttrDim = '}ElementAttributes_' | cTargetDim ;
cTargetCube = '}ElementAttributes_' | cTargetDim ;
#DIMSIZ(dimension)

cView = '}TI_' | cProcessName | '_' | sRandomInt;
cSub = cView;


#######################################################
### Create Attributes if not Exist ###
If (pTimeAttrCreateFlag @= '1');
    sToBeAddAttr = pTimeAttr;
    While (sToBeAddAttr @<>'');
        nDelimiterIndex = Scan(pAttrDelim, sToBeAddAttr);
        If( nDelimiterIndex = 0 );
            sCurAttr = sToBeAddAttr;
            sToBeAddAttr = '';
        Else;
            sCurAttr = Trim( SubSt( sToBeAddAttr, 1, nDelimiterIndex - 1 ) );
            sToBeAddAttr = Trim( Subst( sToBeAddAttr, nDelimiterIndex + Long(pAttrDelim), Long( sToBeAddAttr ) ) );
        EndIf;
        
        # Check to see if attribute already exists.
        If( Dimix( cSourceAttrDim , sCurAttr ) = 0 );
            nErr = nErr + 1;
            sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid Attribute in Sys Time Attribute cube:' | sCurAttr; 
        Else;
            sCurAttrType = AttrS(cSourceAttrDim, sCurAttr, 'Attr Type');
            If( Dimix( cTargetAttrDim , sCurAttr ) = 0 );
                nLastAttr = DimSiz(cTargetAttrDim);
                sLastAttr = Dimnm (cTargetAttrDim, nLastAttr);
                AttrInsert( cTargetDim , sLastAttr , sCurAttr , sCurAttrType ) ;
            Endif;
        Endif;
    End;
Endif;

#######################################################
### create the source view ###
sDim = cTargetDim ;
If (SubsetExists(sDim, cSub) <> 0);
     SubsetDestroy(sDim, cSub);
Endif;

sMDX = '{TM1SUBSETALL ([' | cTargetDim | '])}';

sProcess = '}bedrock.hier.sub.create.bymdx';
sParam1Name = 'pDim';
sParam1Value = sDim ;
sParam2Name = 'pHier';
sParam2Value = sDim ;
sParam3Name = 'pSub';
sParam3Value = cSub;
sParam4Name = 'pMDXExpr';
sParam4Value = sMDX;
nParam5Name = 'pConvertToStatic';
nParam5Value = 1;
nParam6Name = 'pTemp';
nParam6Value = 1;

ExecuteProcess(sProcess, sParam1Name, sParam1Value, sParam2Name, sParam2Value, sParam3Name, sParam3Value, sParam4Name, sParam4Value, nParam5Name, nParam5Value, nParam6Name, nParam6Value);


#######################################################
### Assign data source
cDimSrc = cTargetDim;
cSubSrc = cSub;

# ------ >  Dimension Subset
DatasourceType             = 'SUBSET';
DatasourceNameForServer    = cDimSrc;
DatasourceDimensionSubset  = cSubSrc;

##############################################################################################################
### END Prolog script


573,22
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




##############################################################################################################
### End Metadata


574,62
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


### Testing if Time Element exist in Date dimension
sElName = DimensionElementPrincipalName(cSourceDim, vEl);
If( Dimix( cSourceDim , sElName ) = 0 );
      Itemskip;
Endif;

### Get Attr from the Sys Time Attribute cube
sAttrValue = '';
nAttrValue = 0;
sToBeAddAttr = pTimeAttr;
While (sToBeAddAttr @<>'');
    nDelimiterIndex = Scan(pAttrDelim, sToBeAddAttr);
    If( nDelimiterIndex = 0 );
        sCurAttr = sToBeAddAttr;
        sToBeAddAttr = '';
    Else;
        sCurAttr = Trim( SubSt( sToBeAddAttr, 1, nDelimiterIndex - 1 ) );
        sToBeAddAttr = Trim( Subst( sToBeAddAttr, nDelimiterIndex + Long(pAttrDelim), Long( sToBeAddAttr ) ) );
    EndIf;
    
    # Check to see if attribute already exists.
    If( Dimix( cSourceAttrDim , sCurAttr ) = 0 );
        nErr = nErr + 1;
        sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid Attribute in Sys Time Attribute cube:' | sCurAttr; 
    Else;
        
        If( Dimix( cTargetAttrDim , sCurAttr ) > 0 );
            sCurAttrType = ElementType(cSourceAttrDim, cSourceAttrDim, sCurAttr);
            If (sCurAttrType @='S');
                sAttrValue = CellGetS (cSourceCube, sElName, cTimeDev, sCurAttr);
                AttrPutS(sAttrValue, cTargetDim, vEl, sCurAttr);
            Else;
                nAttrValue = CellGetN (cSourceCube, sElName, cTimeDev, sCurAttr);
                AttrPutN(nAttrValue, cTargetDim, vEl, sCurAttr);
            Endif;
        Endif;
    Endif;
End;




##############################################################################################################
### END Data script


575,40
##############################################################################################################
### CWA Std. Model  version 3.00
### Copyright © 2020, Cubewise (Hong Kong) Ltd. All rights reserved.
##############################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Debug
sDebugFile = cDebugFile | '_Epilog.log';

##############################################################################################################
### Epilog script


If (SubsetExists( cTargetDim , cSub) <> 0);
  SubsetDestroy( cTargetDim , cSub);
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
