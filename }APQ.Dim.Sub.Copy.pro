601,100
602,"}APQ.Dim.Sub.Copy"
562,"NULL"
586,"}APQ Dimension Static Subsets And UDC"
585,"}APQ Dimension Static Subsets And UDC"
564,
565,"pFtRBGID?Oqy@VZia2XxrF9hA]5eE5HTB;^:EPoqt_I^EIjdEjyTUQN\Ls<T]HoLaar4`0FfdyMIQLtw5`L][9B5O`lSu;_zW:r;cn:AOP8^OY4Bu<L8Ti9VEOVhz5]BKX?XW]t^W>eo@u\?Y0rkluYeUv>^h2fL]Zt:1=uIuXZ]fMqqXNp;5qXt3JYEitVv<h9V4B5?"
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
589,
568,""""
570,}TI_Dummy_View
571,
569,0
592,0
599,1000
560,7
pDoProcessLogging
pDimSrc
pSubSrc
pDimTgt
pSubTgt
pSubTgt_Prefix
pSubTgt_Sufix
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
pDimSrc,""
pSubSrc,""
pDimTgt,""
pSubTgt,""
pSubTgt_Prefix,""
pSubTgt_Sufix,""
637,7
pDoProcessLogging,"Log to process logging cube"
pDimSrc,"Source dimension (mandatory)"
pSubSrc,"Source subset (mandatory)"
pDimTgt,"Target dimension (mandatory)"
pSubTgt,"Target subset (optional) Default = Blank = same as source subset"
pSubTgt_Prefix,"Prefix to apend to target subset name (optional)"
pSubTgt_Sufix,"Sufix to apend to target subset name (optional)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,169
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

##############################################################################################################
### PURPOSE:
### 	Clone subset from one dimension to another. Check made for whether element exists in target dimension
### DATA SOURCE:
### 	Source dimension subset
### INTENDED USAGE:
### 	Keep subsets in sync between clone or analog dimensions so any manual maintanance or configuraton is done only once. E.g. use case Operational & Plan BSEG dimensions in C3 FIN
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2018-09-08		SW 		Creation of Process
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand( 'pDimSrc:%pDimSrc% & pSubSrc:%pSubSrc% & pDimTgt:%pDimTgt% & pSubTgt:%pSubTgt% & pSubTgt_Prefix:%pSubTgt_Prefix% & pSubTgt_Sufix:%pSubTgt_Sufix%' );
### Params
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### Prolog script commences

### Setup

cCubSrc         = '}APQ Dimension Defaults';
cDimSrc         = pDimSrc;
cDimTgt         = pDimTgt;
cSubSrc         = pSubSrc;
cSubTgt         = IF( pSubTgt @= '', pSubSrc, pSubTgt );
cSubTgt         = Trim( Expand( '%pSubTgt_Prefix% %cSubTgt % %pSubTgt_Sufix%' ) );
cAttrDim        = '}ElementAttributes_' | cDimSrc;
cCubParam       = '}APQ Settings';
cDimTest        = '}APQ Escape Characters';
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewClrPrefix  = CellGetS( cCubParam, 'Std ZeroOut View Prefix', 'String' );
cDebugLoc       = CellGetS( cCubParam, 'Location: Debugging', 'String' );
cDebugLoc       = cDebugLoc | IF( SubSt( cDebugLoc, Long( cDebugLoc ), 1 ) @<> '\', '\', '' );
cDebugFile      = cDebugLoc | sThisProcName |'_'| sTimeStamp;
sDebugFile      = cDebugFile | '_Prolog.log';
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
nErr            = 0;
sErr            = '';

##################
### Validate Framework

cTestVal1 = CellGetS( cCubParam, 'Customer Key', 'String' );
cTestVal2 = DimNm( cDimTest, 1 );
cTestVal3 = CellGetS( cCubParam, 'Customer Name', 'String' );
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

##################
### Validate parameters

IF( DimensionExists( pDimSrc ) = 0 );
   nErr = 1;
   sErr = Expand( 'Invalid source dimension: %pDimSrc%.' );
Else;
   IF( SubsetExists( pDimSrc, pSubSrc ) = 0 );
      nErr = 1;
      sErr = Expand( 'Invalid source subset: %pSubSrc%.' );
   ElseIF( SubsetGetSize( pDimSrc, pSubSrc ) = 0 );
      nErr = 1;
      sErr = Expand( 'Source subset is empty!: %pDimSrc%:%pSubSrc%' );
      LogOutput( 'WARN', Expand( '%sThisProcName% aborted. %sErr%' ) );
   EndIF;
   IF( DimensionExists( pDimTgt ) = 0 );
      nErr = 1;
      sErr = Expand( 'Invalid target dimension: %pDimTgt%.' );
   EndIF;
EndIF;

IF( nErr > 0 );
   DatasourceType = 'NULL';
   ItemReject( sErr );
EndIF;

##################
### NA & Total element substitution

sNAEle_Src = CellGetS( cCubSrc, pDimSrc, 'NA_Member', 'String' );
sNAEle_Tgt = CellGetS( cCubSrc, pDimTgt, 'NA_Member', 'String' );
sTotEle_Src = CellGetS( cCubSrc, pDimSrc, 'Total_Member', 'String' );
sTotEle_Tgt = CellGetS( cCubSrc, pDimTgt, 'Total_Member', 'String' );

##################
### Copy the subset

IF( SubsetExists( cDimTgt, cSubTgt ) = 0 );
   SubsetCreate( cDimTgt, cSubTgt );
Else;
   SubsetDeleteAllElements( cDimTgt, cSubTgt );
EndIF;

nMax = SubsetGetSize( cDimSrc, cSubSrc );
iEle = 1;
While( iEle <= nMax );
   sEle = SubsetGetElementName( cDimSrc, cSubSrc, iEle );
   # check if it is the NA element or the target element
   IF( sEle @= sNAEle_Src & sNAEle_Tgt @<> '' );
      sEle = sNAEle_Tgt ;
   ElseIF( sEle @= sTotEle_Src & sTotEle_Tgt @<> '' );
      sEle = sTotEle_Tgt ;
   ElseIF( DimIx( cDimTgt, sEle ) = 0 & DimensionExists( cAttrDim ) = 1 );
      # generic check to see if element name can be matched via alias
      iAttr = 1;
      While( iAttr <= DimSiz( cAttrDim ) );
         sAttr = DimNm( cAttrDim, iAttr );
         IF( DType( cAttrDim, sAttr ) @= 'AA' );
            sEleAlias = AttrS( cDimSrc, sEle, sAttr );
            IF( DimIx( cDimTgt, sEleAlias ) > 0 );
               sEle = sEleAlias;
               iAttr = DimSiz( cAttrDim );
            EndIF;
         EndIF;
         iAttr = iAttr + 1;
      End;
   EndIF;
   IF( DimIx( cDimTgt, sEle ) > 0 );
      IF( pDebug @>= '1' );
         AsciiOutput( sDebugFile, Expand( 'Adding element %sEle% to subset %cDimTgt%:%cSubTgt%.' ) );
      EndIF;
      IF( pDebug @<= '1' );
         # trick: index of 0 adds element to the end of subset!
         SubsetElementInsert( cDimTgt, cSubTgt, sEle, 0 );
      EndIF;
   EndIF;
  iEle = iEle + 1;
End;

##################
### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,32
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

IF( nErr = 0 ); IF( SubsetGetSize( cDimTgt, cSubTgt ) = 0 );
   LogOutput( 'WARN', Expand( '%sThisProcName% completed sucessfully but target subset is empty. %cDimTgt%:%cSubTgt%' ) );
EndIF; EndIF;

##############################################################################################################
### Logging - common script 	----------------- START
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While( nCountTime <= nTotalLogTime );    sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
  CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' ); CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
  CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' ); CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
  CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' ); CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
  CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );  nCountTime = nCountTime + 1; End;
  IF( nDataRecordCount > 0 ); IF( cCubTgt @<> '' ); CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' ); EndIF; EndIF;
EndIF;
n=1;c=cTestVal1;d='';e=cTestVal3;k=cTestVal2;WHILE(n<=LONG(c));d=d|CHAR(65+(MOD(CODE(c,n)+26-CODE(k,MOD(n,LONG(k))+1),26)));n=n+1;END;IF(d@<>e);ProcessQuit;ENDIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### END Epilog
576,CubeAction=1511DataAction=1503CubeLogChanges=0
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
