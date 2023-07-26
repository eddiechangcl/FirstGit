601,100
602,"Sys.Archive.}Cubes.Update Attributes"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"l7A4inRdAirCzCiQPRvyEuGV7L_?E;9|S26v8p[9gfdQx,Ov79xDI[hSfmEr6AMja`UDTsJUzA`yN9fT_FSfAVdZA=uSgn?jeq7`59iK6lB9XY\2UqZFlguctJG7|DUqW3EBmcU=dkdMBiUTJ=4 ?UPWecZFToUpaz?b^wxFhle0nuBUp7bUzjV_CP=IEN_tEco9bW^zl7A4inRdAirCzCiQPRvyEuGV7L_?E;9|U26v8p[9gfdQxlGv79xDI[hSfM=u6A]ha`UtVsJUzA@NieT_FSfAVdZA=eZgn?jeq7`89iK6lB9XYLoTqZFlguctJG7LC\qWcArecU=dkdMCiUDJ=405UPWecZFToUpazOo^wxAhle0nxBUp7bUzzV_CP=IE>VDGco9bW^zl7A4inRdAirCoCiQPRvyEuGV7L_?E;9<X26v8p[9gfdQx\Hv79xDI[hSfMQq6Amka`U4XsJUzAPtNI`T_FSfAVdZA=uPgn?jeq7`09iK6lB9XYLjYqZFlguctJG7<d]qWc@BkcU=dkdMOiU4J=40>UPWecZFToUpazb^w8Jhle0>rBUp7bUzjS_CP=IEnZDOco9bW^z"
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
571,All
569,0
592,0
599,1000
560,1
pDoProcessLogging
561,1
2
590,1
pDoProcessLogging,"1"
637,1
pDoProcessLogging,"Log to the process logging cube (0 = False, 1 = True)"
577,1
vElem
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
572,119
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
cDim = '}Cubes' ;

cAttr_DimensionCount = 'DIMENSION COUNT' ;

cPickListSubset = 'PICKLIST_FOR_ARCHIVE' ;
cPickListCubesToArchive = 'PICKLIST_CUBES_FOR_ARCHIVE' ;

################################
#Create Source Subset

sMDX = '{TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | cDim | '] )}, 0)}' ;

ExecuteProcess('Bedrock.Dim.Sub.Create.ByMDX',
'pDimension', cDim ,
'pSubset',sSourceView ,
'pMDXExpr', sMDX,
'pConvertToStatic',1,
'pDebug',0
);

#################################
#Create Subset for cubes list to Archive

sMDX1 = '{ {TM1FILTERBYPATTERN( {TM1SUBSETALL( [' | cDim | '] )}, "}*")}, {TM1FILTERBYPATTERN( {TM1SUBSETALL( [' | cDim | '] )}, "zArchived_*")} }' ;
sMDX = '{EXCEPT( {TM1SUBSETALL( [' | cDim | '] )}, ' | sMDX1 | ' )}';

If (SubsetExists( cDim, cPickListCubesToArchive ) <> 0);
    SubsetDestroy( cDim, cPickListCubesToArchive );
Endif;
SubsetCreatebyMDX( cPickListCubesToArchive, sMDX, cDim );

################################
#Data Source Setup

DataSourceType = 'SUBSET' ;
DataSourceDimensionSubset = sSourceView ;
DataSourceNameForServer = cDim ;
DataSourceNameForClient = cDim ;

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
#IF( pDoProcessLogging @= '1' ); nMetadataRecordCount = nMetadataRecordCount + 1; EndIF;
#sDebugFile = cDebugFile | '_Metadata.log';

##############################################################################################################
### Metadata script
574,74
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



###########################
#Validation

#Skip Control object

IF( SUBST( vElem, 1, 1 ) @= '}' );
    ITEMSKIP ;
ENDIF ;

IF( vElem @= 'Bedrock Test' );
    ITEMSKIP ;
ENDIF ;

###########################
#Calculate Dimension Count of Cube

nTempIndex = 1;
nMAX = 50;
nBREAK = 999999999 ;

nDimensionCount = 0 ;

WHILE( nTempIndex <= nMAX );
    sTempDim = TABDIM( vElem, nTempIndex ) ;
    IF( DimensionExists( sTempDim ) <> 0 );
        nDimensionCount = nDimensionCount + 1 ;

       #Create PickList For Archive subsets
       #sTempMDX = '{ HIERARCHIZE( {TM1SUBSETALL( [' | sTempDim | '] )} ) }' ;
       sTempMDX = '{TM1FILTERBYLEVEL( {TM1SUBSETALL( [' | sTempDim | '] )}, 0)}' ;
       

       ExecuteProcess('Bedrock.Dim.Sub.Create.ByMDX',
       'pDimension', sTempDim ,
       'pSubset',cPickListSubset ,
       'pMDXExpr', sTempMDX,
       'pConvertToStatic',0,
       'pDebug',0
       );

    ELSE ;
        nTempIndex = nBREAK ;
    ENDIF ;
    nTempIndex = nTempIndex + 1 ;
END;

###########################
#Update Attribute - "DIMENSION COUNT"

ATTRPUTN( nDimensionCount, cDim, vElem, cAttr_DimensionCount ) ;





##############################################################################################################
### END Data script
575,52
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

ExecuteProcess('}bedrock.hier.sub.delete',
   'pLogOutput', 0,
   'pDim', cDim,
   'pHier', cDim,
   'pSub', sSourceView,
   'pDelim', '&',
   'pMode', 0
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
