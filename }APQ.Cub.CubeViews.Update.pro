601,100
602,"}APQ.Cub.CubeViews.Update"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"ng6;3LOm?S1Y1Qa\FqJ\;1C^vHy0RiCwKHJT`b6^2XTfUlO0PuQR7i3xHK^fOXL0y?V9q02OunluYqIqdC`xVj`;Nh?<B^1o2nCO\;^2i>JjW[ki9bTotUoa\dOz[kXk87y;gDEIxJw=<6Buc]evp3n9sQf@REg8<s3VhJoPNFHnN5k0^@626RDzpvRjXNiI5^<zu[BF"
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
570,
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
pDoProcessLogging,"Record in process log"
577,1
vCube
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
572,80
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.00
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

### Purpose:	Process to update cube }APQ Cube Views 

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pDoProcessLogging:%pDoProcessLogging%');
### Params
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total Years', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### Prolog script commences

### Inits - declare constants
cDimSrc      = '}Cubes';
cDimSrc2     = '}APQ Cubes';
cDimTgt         = '}APQ Cube Views';
cDimTgt2        = '}APQ Views';
cEscapedCharacterDim = '}APQ Escape Characters';

cCubTgt         = '}APQ Cube Views';
cSettingCube    = '}APQ Settings';

cTotal          = 'Total APQ Cubes';
cTotal2         = 'Total APQ Views';

cDataFolder     = CellGetS( cSettingCube, 'Location: Data Dir', 'String' );
cDataFolder     = cDataFolder | If(SubSt(cDataFolder, Long(cDataFolder), 1) @<> '\', '\', '');
cAPQFolder      = CellGetS( cSettingCube, 'Location: Framework', 'String' );
cAPQFolder      = If( cAPQFolder @= '', cDataFolder, cAPQFolder );
cAPQFolder      = cAPQFolder | If(SubSt(cAPQFolder, Long(cAPQFolder), 1) @<> '\', '\', '');
cServerName     = CellGetS( cSettingCube, 'TM1 Server Name', 'String' );
cAdminHost      = CellGetS( cSettingCube, 'TM1 Admin Host', 'String' );
cTM1WebURL      = CellGetS( cSettingCube, 'TM1Web URL', 'String' );
cTM1WebURL      = cTM1WebURL | If (SubSt( cTM1WebURL, Long(cTM1WebURL), 1) @<> '/', '/', '' );
cUseCAM         = CellGetS( cSettingCube, 'Use CAM', 'String' );
sCAM            = If( cUseCAM @= 'Y', 'CAM', '' );
cTM1Version     = CellGetS( cSettingCube, 'TM1 Version', 'String' );
nTM1Version     = CellGetN( cSettingCube, 'TM1 Version', 'Numeric' );
cTestVal1       = CellGetS( cSettingCube, 'Customer Key', 'String' );
cTestVal2       = DimNm( cEscapedCharacterDim, 1 );
cTestVal3       = CellGetS( cSettingCube, 'Customer Name', 'String' );

cAliasName      = 'Caption_Default';
cCubeName       = 'Cube Name';
cViewName       = 'View Name';
cViewURLAPI     = 'TM1Web URL';

bSkipControlObj = 0;

### Set data source

DataSourceType              = 'SUBSET';
DataSourceNameForServer     = cDimSrc;
DataSourceDimensionSubset   = 'ALL';

### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,105
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.00
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### data script

# Skip control cubes
If( SubSt( vCube, 1, 1 ) @= '}' & SubSt( vCube, 1, 4 ) @<> '}APQ' & bSkipControlObj = 1 );
  ItemSkip;
EndIf;

sDimViews = '}Views_' | vCube;
If( DimensionExists( sDimViews ) = 1 ); If( DimSiz( sDimViews ) >= 1 );
    CellPutS( vCube, cCubTgt, vCube, cCubeName );
    AttrPutS( vCube, cDimTgt, vCube, cCubeName );
    nViews = DimSiz( sDimViews );
    iView = 1;
    While( iView <= nViews );
        sView = DimNm( sDimViews, iView );
        sCubeView = vCube | '\' | sView;
        IF( DimIx( cDimTgt, sCubeView ) = 0 );
            DimensionElementInsertDirect( cDimTgt, '', sCubeView, 'N' );
        EndIF;
        IF( DimIx( cDimTgt2, sView ) = 0 );
            DimensionElementInsertDirect( cDimTgt2, '', sView, 'N' );
        EndIF;
        CellPutS( vCube, cCubTgt, sCubeView, cCubeName );
        CellPutS( sView, cCubTgt, sCubeView, cViewName );
        AttrPutS( vCube, cDimTgt, sCubeView, cCubeName );
        AttrPutS( sView, cDimTgt, sCubeView, cViewName );
        AttrPutS( vCube |':'| sView, cDimTgt, sCubeView, cAliasName );
        sVal = 'Views/' | vCube |'/'| sView;
        AttrPutS( sVal, cDimTgt, sCubeView, 'Entry Reference' );
        CellPutS( sVal, cCubTgt, sCubeView, 'Entry Reference' );
        
        # For TM1Web URL generation replace the special characters with the escape codes
        # Cube Name
        sOriginalWord = vCube;
        sEscapedWord = sOriginalWord;
        nWordLength = Long(sEscapedWord);
        nWordCount = 1;
        While( nWordCount <= nWordLength );
            nASCII = Code(sEscapedWord, nWordCount);
            sASCII = NumberToString(nASCII);
            nCurrentAdditionalCharacters = 0;
            If( DimIx(cEscapedCharacterDim, sASCII) <> 0 );
                sEscapedCode = AttrS(cEscapedCharacterDim, sASCII, 'Escape Code');
                nCurrentAdditionalCharacters = Long(sEscapedCode);
                sEscapedWord  = Subst (sEscapedWord, 1, nWordCount - 1) | sEscapedCode |Subst (sEscapedWord , nWordCount + 1, nWordLength - nWordCount );
                nWordLength = Long(sEscapedWord);
            Endif;
            nWordCount = nWordCount + nCurrentAdditionalCharacters + 1;
        End;
        sEscapedCubeName = sEscapedWord;
        # View Name
        sOriginalWord = sView;
        sEscapedWord = sOriginalWord;
        nWordLength = Long(sEscapedWord);
        nWordCount = 1;
        While( nWordCount <= nWordLength );
            nASCII = Code(sEscapedWord, nWordCount);
            sASCII = NumberToString(nASCII);
            nCurrentAdditionalCharacters = 0;
            If( DimIx(cEscapedCharacterDim, sASCII) <> 0 );
                sEscapedCode = AttrS(cEscapedCharacterDim, sASCII, 'Escape Code');
                nCurrentAdditionalCharacters = Long(sEscapedCode);
                sEscapedWord  = Subst (sEscapedWord, 1, nWordCount - 1) | sEscapedCode | Subst (sEscapedWord , nWordCount + 1, nWordLength - nWordCount );
                nWordLength = Long(sEscapedWord);
            Endif;
            nWordCount = nWordCount + nCurrentAdditionalCharacters + 1;
        End;
        sEscapedViewName = sEscapedWord;
        sTM1WebURL = Expand( '%cTM1WebURL%UrlApi.jsp#Action=Open&Type=CubeViewer&Cube=%sEscapedCubeName%&View=%sEscapedViewName%&TM1Server=%cServerName%&AdminHost=%cAdminHost%&AccessType=Public' );
        CellPutS(sTM1WebURL, cCubTgt, sCubeView, cViewURLAPI);
        AttrPutS(sTM1WebURL, cDimTgt, sCubeView, cViewURLAPI);
        IF( sEscapedViewName @= 'Default' );
            CellPutS( vCube |':'| sEscapedViewName, cCubTgt, vCube, cViewName );
            AttrPutS( vCube |':'| sEscapedViewName, cDimTgt, vCube, cViewName );
            CellPutS( sTM1WebURL, cCubTgt, vCube, cViewURLAPI );
            AttrPutS( sTM1WebURL, cDimTgt, vCube, cViewURLAPI );
        EndIF;
        
        iView = iView + 1;
    End;
    
EndIf; EndIf;
    
######################
### END data
575,45
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.00
# Copyright 2016-2018, Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

### Special properties
nMax = DimSiz( cDimSrc );
nCtr = 1;
WHILE( nCtr <= nMax );
  sCub = DimNm( cDimSrc, nCtr );
  IF( DimIx( cDimSrc2, sCub ) > 0 );
    IF( DimIx( cDimTgt, sCub ) = 0 );
      AttrPutS( 'FALSE', cDimSrc2, sCub, 'HASPUBLICVIEWS' );
    ElseIF( CellGetN( cDimTgt, sCub, 'Count' ) = 0 );
      AttrPutS( 'FALSE', cDimSrc2, sCub, 'HASPUBLICVIEWS' );
    Else;
      AttrPutS( 'TRUE', cDimSrc2, sCub, 'HASPUBLICVIEWS' );
    EndIF;
  EndIF;
  nCtr = nCtr + 1;
END;

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
