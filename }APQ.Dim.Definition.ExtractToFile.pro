601,100
602,"}APQ.Dim.Definition.ExtractToFile"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"tWndbpg?gka=V9W`uuD6aCkz\WzKWrM4M7nBTVz\D:rZ\ACg@i:s7YkWilU:`@fQr:J9_>xZhoEwUkQt3cs:?w;F[SusRfdIq3^AIz9M:W[1rx1?h5s>u?sd]ir[Ka2yDKimstu?KV7qBaYMDbKEh\6r;X@hGy9lAr]kBcZudg8OkdIgDH[a4LTRDsN?1AAUw5b0U^1W"
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
pDim
pEle
pExportPath
pExportFile
pTemplateType
pDebug
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
pDim,""
pEle,""
pExportPath,""
pExportFile,""
pTemplateType,"ByParentChild"
pDebug,"0"
637,7
pDoProcessLogging,"Record in process log"
pDim,"REQUIRED: Dimension hierarchy to export (can specify specific hierarchy with dim:hier)"
pEle,"OPTIONAL: To export only a rollup and all descendants enter the name of the element (default=blank for entire dimension)"
pExportPath,"OPTIONAL: Export folder for the file (if blank defaults to the directory defined for Exports)"
pExportFile,"OPTIONAL: File name for the file (if blank, the file will be ""DimensionName.csv"")"
pTemplateType,"OPTIONAL: ByParentChild for original template or ByRollup for new template (if blank, the default type will be ""ByParentChild"")"
pDebug,"Debug 0=false 1=true"
577,1
vElement
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
572,522
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

### Purpose:	Process to export the dimension in a csv file. The format is the one used by }APQ.Dim.Definition.Load.Dimension

######################
### Logging - common script
sThisProcName = GetProcessName();
### Params
sProcLogParams = Expand('pDim:%pDim% & pExportPath:%pExportPath% & pExportFile:%pExportFile% & pTemplateType:%pTemplateType% & pDebug:%pDebug%');
### Params
IF( pDoProcessLogging @= '1' );
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' );
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  nTotalLogTime = 2; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; While ( nCountTime <= nTotalLogTime );
  sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' );
  CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' ); CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' );
  CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' ); CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' );
  CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF;
######################
### Prolog script

### Inits - declare constants

If( Scan( ':', pDim ) = 0 );
    bIsAltHier  = 0;
    sHier       = pDim;
Else;
    bIsAltHier  = 1;
    sHier       = Trim( SubSt( pDim, Scan( ':', pDim ) + 1, Long( pDim ) ) );
EndIf;
cCubParam       = '}APQ Settings';
sAttrDim        = '}ElementAttributes_' | If( bIsAltHier = 0, pDim, SubSt( pDim, 1, Scan( ':', pDim ) - 1 ) );
sAttrCube       = sAttrDim;
cCubSrc         = sAttrDim;
sTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
sTimeStampPrint = TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') );
sRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cViewSrcPrefix  = CellGetS( cCubParam, 'Std Datasource View Prefix', 'String' );
cViewSrc        = cViewSrcPrefix | sThisProcName |'_'| sTimeStamp |'_'| sRandomInt;
cSubSrc         = cViewSrc;
nAttrDimExists  = 0;
pDebug          = '0';
nDebug          = StringToNumber( pDebug );
sDebugFile      = '';
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cBedrockTmp     = 1;
nMaxAttr        = 50;
nMaxLvl         = 30;
nErr            = 0;
sErr            = '';

### Check and manage the process parameters

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

# Check pDim is valid dimension
If( DimensionExists( pDim ) = 0 );
  nErr = nErr+1;
  sErr = 'The dimension or hierarchy "'| pDim |'" is not a valid dimension name';
  DataSourceType = 'NULL';
  ItemReject( sErr );
Else;
    # Check pEle is valid element of pDim
    If( DimIx( pDim, pEle ) = 0 );
        pEle    = '';
    Else;
        pEle    = DimensionElementPrincipalName( pDim, pEle );
    EndIf;
Endif;

# Validate export path
If( Trim( pExportPath ) @= '' );
  pExportPath = CellGetS( cCubParam, 'Location: Export', 'String' );
EndIf;
If( SubSt( pExportPath, Long( pExportPath ), 1 ) @= '\' );
  pExportPath = SubSt( pExportPath, 1, Long( pExportPath ) - 1 );
EndIf;
If( FileExists( pExportPath ) = 0 );
  nErrors = 1;
  sMessage = 'Invalid export path specified. Folder does not exist.';
  If( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;

# Validate export file. If an alternate hierarchy then we need to replace ":" in the dimension name with a valid file system character
If( pExportFile @= '' );
  If( bIsAltHier = 0 );
    pExportFile = pDim | '.csv';
  Else;
    pExportFile = SubSt( pDim, 1, Scan( ':', pDim ) - 1 ) |'_'| sHier | '.csv';
  EndIf;
Else;
  If( Scan( '.', pExportFile ) = 0 );
    # No file extension specified
    pExportFile = pExportFile | '.csv';
  EndIf;
EndIf;

If( SubSt( pExportPath, Long( pExportPath ), 1 ) @<> '\' );
  pExportPath = pExportPath | '\';
EndIf;
sFile = pExportPath | pExportFile;

# Validate template type
If( pTemplateType @= 'ByRollup' );
    nNewTemplate = 1;
Else;
    nNewTemplate = 0;
EndIf;

IF( DimensionExists( sAttrDim ) = 1);
  nAttrDimExists = 1;
ENDIF;

### Set Quote & Delimiter characters
DatasourceASCIIQuoteCharacter   = CellGetS( cCubParam, 'DatasourceASCIIQuoteCharacter', 'String' ); 
sQuote                          = DatasourceASCIIQuoteCharacter; 
DatasourceASCIIQuoteCharacter   = '';
DatasourceASCIIDelimiter        = CellGetS( cCubParam, 'DatasourceASCIIDelimiter', 'String' ); 
sDelim                          = DatasourceASCIIDelimiter;

##############################################################################################################
#Region - Original source template (ByParentChild)
If( nNewTemplate < 1 );
    ### Define the datasource
    DataSourceType                  = 'SUBSET';
    DatasourceNameForServer         = pDim;
    If( pEle                        @= '' );
        DatasourceDimensionSubset   = 'ALL';
    Else;
        sMDX                        = Expand('{Hierarchize( {TM1DrillDownMember( {[%pDim%].[%pDim%].[%pEle%]}, ALL, RECURSIVE )} )}');
        If( SubsetExists( pDim, cSubSrc ) = 1 );
            SubsetMDXSet( pDim, cSubSrc, sMDX );
        Else;
            SubsetCreatebyMDX( cSubSrc, sMDX, pDim, 1 );
        EndIf;
        DatasourceDimensionSubset   = cSubSrc;
    EndIf;
    
    ### Filler parents
    ### the load process allows for 8 parents per row but we export always 1 parent at a time so make a filler of 7 empty parents (plus one empty for the "comment" which is allowed in the template)
    sFillerParents = '';
    nParents = 7;
    nParCtr = 1;
    While( nParCtr <= nParents );
       sFillerParents = sFillerParents | sQuote | sQuote | sDelim;
       nParCtr = nParCtr + 1;
    End;
    sFillerParents = sFillerParents | sQuote | sQuote | sDelim;
#EndRegion - Original source template (ByParentChild)
##############################################################################################################
ElseIf( nNewTemplate = 1 );
##############################################################################################################
#Region - New source template (ByRollup)
    ### Define the datasource
    DataSourceType                  = 'NULL';
    sSource                         = Expand('[%pDim%].') | If( pEle @= '', 'Members', Expand('[%pEle%].Descendants') );

    # Make sure attribute dimension exists
    IF( nAttrDimExists = 0 );
      AttrInsert( pDim, '', 'Caption', 'S' );
    ENDIF;

    ##############################################################################################################
    #Region - Scan Attributes and create header record
    sAttr1      = DimNm( sAttrDim, 1 ); If( sAttr1  @<> '' ); sAttrType1  = DType( sAttrDim, sAttr1 );  sAttrHead1  = '[' | SubSt( sAttrType1,  2, 1 ) | '] ' | sAttr1; EndIf;
    sAttr2      = DimNm( sAttrDim, 2 ); If( sAttr2  @<> '' ); sAttrType2  = DType( sAttrDim, sAttr2 );  sAttrHead2  = '[' | SubSt( sAttrType2,  2, 2 ) | '] ' | sAttr2; EndIf;
    sAttr3      = DimNm( sAttrDim, 3 ); If( sAttr3  @<> '' ); sAttrType3  = DType( sAttrDim, sAttr3 );  sAttrHead3  = '[' | SubSt( sAttrType3,  2, 3 ) | '] ' | sAttr3; EndIf;
    sAttr4      = DimNm( sAttrDim, 4 ); If( sAttr4  @<> '' ); sAttrType4  = DType( sAttrDim, sAttr4 );  sAttrHead4  = '[' | SubSt( sAttrType4,  2, 4 ) | '] ' | sAttr4; EndIf;
    sAttr5      = DimNm( sAttrDim, 5 ); If( sAttr5  @<> '' ); sAttrType5  = DType( sAttrDim, sAttr5 );  sAttrHead5  = '[' | SubSt( sAttrType5,  2, 5 ) | '] ' | sAttr5; EndIf;
    sAttr6      = DimNm( sAttrDim, 6 ); If( sAttr6  @<> '' ); sAttrType6  = DType( sAttrDim, sAttr6 );  sAttrHead6  = '[' | SubSt( sAttrType6,  2, 6 ) | '] ' | sAttr6; EndIf;
    sAttr7      = DimNm( sAttrDim, 7 ); If( sAttr7  @<> '' ); sAttrType7  = DType( sAttrDim, sAttr7 );  sAttrHead7  = '[' | SubSt( sAttrType7,  2, 7 ) | '] ' | sAttr7; EndIf;
    sAttr8      = DimNm( sAttrDim, 8 ); If( sAttr8  @<> '' ); sAttrType8  = DType( sAttrDim, sAttr8 );  sAttrHead8  = '[' | SubSt( sAttrType8,  2, 8 ) | '] ' | sAttr8; EndIf;
    sAttr9      = DimNm( sAttrDim, 9 ); If( sAttr9  @<> '' ); sAttrType9  = DType( sAttrDim, sAttr9 );  sAttrHead9  = '[' | SubSt( sAttrType9,  2, 9 ) | '] ' | sAttr9; EndIf;
    sAttr10     = DimNm( sAttrDim, 10 );If( sAttr10 @<> '' ); sAttrType10 = DType( sAttrDim, sAttr10 ); sAttrHead10 = '[' | SubSt( sAttrType10, 2, 1 ) | '] ' | sAttr10; EndIf;
    sAttr11     = DimNm( sAttrDim, 11 );If( sAttr11 @<> '' ); sAttrType11 = DType( sAttrDim, sAttr11 ); sAttrHead11 = '[' | SubSt( sAttrType11, 2, 1 ) | '] ' | sAttr11; EndIf;
    sAttr12     = DimNm( sAttrDim, 12 );If( sAttr12 @<> '' ); sAttrType12 = DType( sAttrDim, sAttr12 ); sAttrHead12 = '[' | SubSt( sAttrType12, 2, 1 ) | '] ' | sAttr12; EndIf;
    sAttr13     = DimNm( sAttrDim, 13 );If( sAttr13 @<> '' ); sAttrType13 = DType( sAttrDim, sAttr13 ); sAttrHead13 = '[' | SubSt( sAttrType13, 2, 1 ) | '] ' | sAttr13; EndIf;
    sAttr14     = DimNm( sAttrDim, 14 );If( sAttr14 @<> '' ); sAttrType14 = DType( sAttrDim, sAttr14 ); sAttrHead14 = '[' | SubSt( sAttrType14, 2, 1 ) | '] ' | sAttr14; EndIf;
    sAttr15     = DimNm( sAttrDim, 15 );If( sAttr15 @<> '' ); sAttrType15 = DType( sAttrDim, sAttr15 ); sAttrHead15 = '[' | SubSt( sAttrType15, 2, 1 ) | '] ' | sAttr15; EndIf;
    sAttr16     = DimNm( sAttrDim, 16 );If( sAttr16 @<> '' ); sAttrType16 = DType( sAttrDim, sAttr16 ); sAttrHead16 = '[' | SubSt( sAttrType16, 2, 1 ) | '] ' | sAttr16; EndIf;
    sAttr17     = DimNm( sAttrDim, 17 );If( sAttr17 @<> '' ); sAttrType17 = DType( sAttrDim, sAttr17 ); sAttrHead17 = '[' | SubSt( sAttrType17, 2, 1 ) | '] ' | sAttr17; EndIf;
    sAttr18     = DimNm( sAttrDim, 18 );If( sAttr18 @<> '' ); sAttrType18 = DType( sAttrDim, sAttr18 ); sAttrHead18 = '[' | SubSt( sAttrType18, 2, 1 ) | '] ' | sAttr18; EndIf;
    sAttr19     = DimNm( sAttrDim, 19 );If( sAttr19 @<> '' ); sAttrType19 = DType( sAttrDim, sAttr19 ); sAttrHead19 = '[' | SubSt( sAttrType19, 2, 1 ) | '] ' | sAttr19; EndIf;
    sAttr20     = DimNm( sAttrDim, 20 );If( sAttr20 @<> '' ); sAttrType20 = DType( sAttrDim, sAttr20 ); sAttrHead20 = '[' | SubSt( sAttrType20, 2, 1 ) | '] ' | sAttr20; EndIf;
    sAttr21     = DimNm( sAttrDim, 21 );If( sAttr21 @<> '' ); sAttrType21 = DType( sAttrDim, sAttr21 ); sAttrHead21 = '[' | SubSt( sAttrType21, 2, 1 ) | '] ' | sAttr21; EndIf;
    sAttr22     = DimNm( sAttrDim, 22 );If( sAttr22 @<> '' ); sAttrType22 = DType( sAttrDim, sAttr22 ); sAttrHead22 = '[' | SubSt( sAttrType22, 2, 1 ) | '] ' | sAttr22; EndIf;
    sAttr23     = DimNm( sAttrDim, 23 );If( sAttr23 @<> '' ); sAttrType23 = DType( sAttrDim, sAttr23 ); sAttrHead23 = '[' | SubSt( sAttrType23, 2, 1 ) | '] ' | sAttr23; EndIf;
    sAttr24     = DimNm( sAttrDim, 24 );If( sAttr24 @<> '' ); sAttrType24 = DType( sAttrDim, sAttr24 ); sAttrHead24 = '[' | SubSt( sAttrType24, 2, 1 ) | '] ' | sAttr24; EndIf;
    sAttr25     = DimNm( sAttrDim, 25 );If( sAttr25 @<> '' ); sAttrType25 = DType( sAttrDim, sAttr25 ); sAttrHead25 = '[' | SubSt( sAttrType25, 2, 1 ) | '] ' | sAttr25; EndIf;
    sAttr26     = DimNm( sAttrDim, 26 );If( sAttr26 @<> '' ); sAttrType26 = DType( sAttrDim, sAttr26 ); sAttrHead26 = '[' | SubSt( sAttrType26, 2, 1 ) | '] ' | sAttr26; EndIf;
    sAttr27     = DimNm( sAttrDim, 27 );If( sAttr27 @<> '' ); sAttrType27 = DType( sAttrDim, sAttr27 ); sAttrHead27 = '[' | SubSt( sAttrType27, 2, 1 ) | '] ' | sAttr27; EndIf;
    sAttr28     = DimNm( sAttrDim, 28 );If( sAttr28 @<> '' ); sAttrType28 = DType( sAttrDim, sAttr28 ); sAttrHead28 = '[' | SubSt( sAttrType28, 2, 1 ) | '] ' | sAttr28; EndIf;
    sAttr29     = DimNm( sAttrDim, 29 );If( sAttr29 @<> '' ); sAttrType29 = DType( sAttrDim, sAttr29 ); sAttrHead29 = '[' | SubSt( sAttrType29, 2, 1 ) | '] ' | sAttr29; EndIf;
    sAttr30     = DimNm( sAttrDim, 30 );If( sAttr30 @<> '' ); sAttrType30 = DType( sAttrDim, sAttr30 ); sAttrHead30 = '[' | SubSt( sAttrType30, 2, 1 ) | '] ' | sAttr30; EndIf;
    sAttr31     = DimNm( sAttrDim, 31 );If( sAttr31 @<> '' ); sAttrType31 = DType( sAttrDim, sAttr31 ); sAttrHead31 = '[' | SubSt( sAttrType31, 2, 1 ) | '] ' | sAttr31; EndIf;
    sAttr32     = DimNm( sAttrDim, 32 );If( sAttr32 @<> '' ); sAttrType32 = DType( sAttrDim, sAttr32 ); sAttrHead32 = '[' | SubSt( sAttrType32, 2, 1 ) | '] ' | sAttr32; EndIf;
    sAttr33     = DimNm( sAttrDim, 33 );If( sAttr33 @<> '' ); sAttrType33 = DType( sAttrDim, sAttr33 ); sAttrHead33 = '[' | SubSt( sAttrType33, 2, 1 ) | '] ' | sAttr33; EndIf;
    sAttr34     = DimNm( sAttrDim, 34 );If( sAttr34 @<> '' ); sAttrType34 = DType( sAttrDim, sAttr34 ); sAttrHead34 = '[' | SubSt( sAttrType34, 2, 1 ) | '] ' | sAttr34; EndIf;
    sAttr35     = DimNm( sAttrDim, 35 );If( sAttr35 @<> '' ); sAttrType35 = DType( sAttrDim, sAttr35 ); sAttrHead35 = '[' | SubSt( sAttrType35, 2, 1 ) | '] ' | sAttr35; EndIf;
    sAttr36     = DimNm( sAttrDim, 36 );If( sAttr36 @<> '' ); sAttrType36 = DType( sAttrDim, sAttr36 ); sAttrHead36 = '[' | SubSt( sAttrType36, 2, 1 ) | '] ' | sAttr36; EndIf;
    sAttr37     = DimNm( sAttrDim, 37 );If( sAttr37 @<> '' ); sAttrType37 = DType( sAttrDim, sAttr37 ); sAttrHead37 = '[' | SubSt( sAttrType37, 2, 1 ) | '] ' | sAttr37; EndIf;
    sAttr38     = DimNm( sAttrDim, 38 );If( sAttr38 @<> '' ); sAttrType38 = DType( sAttrDim, sAttr38 ); sAttrHead38 = '[' | SubSt( sAttrType38, 2, 1 ) | '] ' | sAttr38; EndIf;
    sAttr39     = DimNm( sAttrDim, 39 );If( sAttr39 @<> '' ); sAttrType39 = DType( sAttrDim, sAttr39 ); sAttrHead39 = '[' | SubSt( sAttrType39, 2, 1 ) | '] ' | sAttr39; EndIf;
    sAttr40     = DimNm( sAttrDim, 40 );If( sAttr40 @<> '' ); sAttrType40 = DType( sAttrDim, sAttr40 ); sAttrHead40 = '[' | SubSt( sAttrType40, 2, 1 ) | '] ' | sAttr40; EndIf;
    sAttr41     = DimNm( sAttrDim, 41 );If( sAttr41 @<> '' ); sAttrType41 = DType( sAttrDim, sAttr41 ); sAttrHead41 = '[' | SubSt( sAttrType41, 2, 1 ) | '] ' | sAttr41; EndIf;
    sAttr42     = DimNm( sAttrDim, 42 );If( sAttr42 @<> '' ); sAttrType42 = DType( sAttrDim, sAttr42 ); sAttrHead42 = '[' | SubSt( sAttrType42, 2, 1 ) | '] ' | sAttr42; EndIf;
    sAttr43     = DimNm( sAttrDim, 43 );If( sAttr43 @<> '' ); sAttrType43 = DType( sAttrDim, sAttr43 ); sAttrHead43 = '[' | SubSt( sAttrType43, 2, 1 ) | '] ' | sAttr43; EndIf;
    sAttr44     = DimNm( sAttrDim, 44 );If( sAttr44 @<> '' ); sAttrType44 = DType( sAttrDim, sAttr44 ); sAttrHead44 = '[' | SubSt( sAttrType44, 2, 1 ) | '] ' | sAttr44; EndIf;
    sAttr45     = DimNm( sAttrDim, 45 );If( sAttr45 @<> '' ); sAttrType45 = DType( sAttrDim, sAttr45 ); sAttrHead45 = '[' | SubSt( sAttrType45, 2, 1 ) | '] ' | sAttr45; EndIf;
    sAttr46     = DimNm( sAttrDim, 46 );If( sAttr46 @<> '' ); sAttrType46 = DType( sAttrDim, sAttr46 ); sAttrHead46 = '[' | SubSt( sAttrType46, 2, 1 ) | '] ' | sAttr46; EndIf;
    sAttr47     = DimNm( sAttrDim, 47 );If( sAttr47 @<> '' ); sAttrType47 = DType( sAttrDim, sAttr47 ); sAttrHead47 = '[' | SubSt( sAttrType47, 2, 1 ) | '] ' | sAttr47; EndIf;
    sAttr48     = DimNm( sAttrDim, 48 );If( sAttr48 @<> '' ); sAttrType48 = DType( sAttrDim, sAttr48 ); sAttrHead48 = '[' | SubSt( sAttrType48, 2, 1 ) | '] ' | sAttr48; EndIf;
    sAttr49     = DimNm( sAttrDim, 49 );If( sAttr49 @<> '' ); sAttrType49 = DType( sAttrDim, sAttr49 ); sAttrHead49 = '[' | SubSt( sAttrType49, 2, 1 ) | '] ' | sAttr49; EndIf;
    sAttr50     = DimNm( sAttrDim, 50 );If( sAttr50 @<> '' ); sAttrType50 = DType( sAttrDim, sAttr50 ); sAttrHead50 = '[' | SubSt( sAttrType50, 2, 1 ) | '] ' | sAttr50; EndIf;
    
    # Create header record
    sHeader1    = Expand('%sQuote%RowID%sQuote%%sDelim%');
    sHeader2    = Expand('%sQuote%Total Rows%sQuote%%sDelim%%sQuote%Timestamp:%sQuote%%sDelim%%sQuote%%sTimeStampPrint%%sQuote%%sDelim%%sQuote%%sQuote%%sDelim%%sQuote%User:%sQuote%%sDelim%%sQuote%%sProcessRunBy%%sQuote%%sDelim%%sQuote%%sQuote%%sDelim%%sQuote%Source:%sQuote%%sDelim%%sQuote%%sSource%%sQuote%%sDelim%');
    nCtr        = 1;
    While( nCtr <= nMaxLvl );
        sCtr    = NumberToString( nCtr );
        sHeader1= Expand('%sHeader1%%sQuote%vL%sCtr%%sQuote%%sDelim%');
        If( nCtr >= 9 );
            sHeader2= Expand('%sHeader2%%sQuote%%sQuote%%sDelim%');
        EndIf;
        nCtr    = nCtr + 1;
    End;
    sHeader1     = Expand('%sHeader1%%sQuote%vType%sQuote%%sDelim%%sQuote%vWeight%sQuote%%sDelim%');
    sHeader2     = Expand('%sHeader2%%sQuote%%sQuote%%sDelim%%sQuote%%sQuote%%sDelim%');
    nCtr        = 1;
    While( nCtr <= nMaxAttr );
        sCtr    = NumberToString( nCtr );
        sVal    = Expand( '%' | Expand('sAttr%sCtr%') | '%' );
        sHeader1= Expand('%sHeader1%%sQuote%vA%sCtr%%sQuote%%sDelim%');
        If( sVal @<> '' );
            sVal    = Expand( '%' | Expand('sAttrHead%sCtr%') | '%' );
            sHeader2 = Expand('%sHeader2%%sQuote%%sVal%%sQuote%%sDelim%');
        Else;
            nCtr    = nMaxAttr;
        EndIf;
        nCtr    = nCtr + 1;
    End;
    
    # Write header to file
    AsciiOutput( sFile, sHeader1 );
    AsciiOutput( sFile, sHeader2 );
    #EndRegion - Scan Attributes and create header record
    ##############################################################################################################

    ##############################################################################################################
    #Region - Loop elements and export
    
    vL1         = ''; vL2 = ''; vL3 = ''; vL4= ''; vL5= ''; vL6= ''; vL7= ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
    cL1         = ''; cL2 = ''; cL3 = ''; cL4= ''; cL5= ''; cL6= ''; cL7= ''; cL8 = ''; cL9 = ''; cL10 = ''; cL11 = ''; cL12 = ''; cL13 = ''; cL14 = ''; cL15 = ''; cL16 = ''; cL17 = ''; cL18 = ''; cL19 = ''; cL20 = ''; cL21 = ''; cL22 = ''; cL23 = ''; cL24 = ''; cL25 = ''; cL26 = ''; cL27 = ''; cL28 = ''; cL29 = ''; cL30 = '';
    
    # Get Root elements for dimension. We will loop all root elements in index order
    sSubRoot    = cSubSrc | '_Root';
    If( DimIx( pDim, pEle ) = 0 );
        sMDXRoot= Expand('{Filter( {TM1SubsetAll([%pDim%].[%pDim%])}, [%pDim%].[%pDim%].CurrentMember.Parent.Name = "" )}');
    Else;
        sMDXRoot= Expand('{[%pDim%].[%pDim%].[%pEle%]}');
    EndIf;
    If( SubsetExists( pDim, sSubRoot ) = 1 );
        SubsetMDXSet( pDim, sSubRoot, sMDXRoot );
    Else;
        SubsetCreatebyMDX( sSubRoot, sMDXRoot, pDim, 1 );
    EndIf;
    nMaxRoot    = SubsetGetSize( pDim, sSubRoot );
    nCtrRoot    = 1;
    nCtrRow     = 1;
    While( nCtrRoot <= nMaxRoot );
        # For each root element we will create a subset of element plus all descendants
        sRoot   = SubsetGetElementName( pDim, sSubRoot, nCtrRoot );
        # Check level of root element
        If( ElLev( pDim, sRoot ) + 1 > nMaxLvl );
            sMsg= Expand('%sThisProcName%: Cant export descendants from root %sRoot% in dimension %pDim%. Rollup is too deep. Max %nMaxLvl% levels allowed.');
            LogOutput( 'ERROR', sMsg );
        Else;
            sSubEle = cSubSrc | '_Eles';
            sMDXEle = Expand('{Hierarchize( {TM1DrillDownMember( {[%pDim%].[%pDim%].[%sRoot%]}, ALL, RECURSIVE )} )}');
            If( SubsetExists( pDim, sSubEle ) = 1 );
                SubsetMDXSet( pDim, sSubEle, sMDXEle );
            Else;
                SubsetCreatebyMDX( sSubEle, sMDXEle, pDim, 1 );
            EndIf;
            nCtrEle = 1;
            nMaxEle = SubsetGetSize( pDim, sSubEle );
            While( nCtrEle <= nMaxEle );
                # Initialize record with element name and type
                sRow    = NumberToString( nCtrRow );
                sEle    = SubsetGetElementName( pDim, sSubEle, nCtrEle );
                sElType = DType( pDim, sEle );
                nElLev  = ElLev( pDim, sEle );
                
                # Read attribute values
                If( sAttr1  @<> '' ); If( sAttrType1  @= 'AN' ); sAttrVal1  = NumberToString( AttrN( pDim, sEle, sAttr1 ) );  Else; sAttrVal1  = AttrS( pDim, sEle, sAttr1 );  EndIf; EndIf;
                If( sAttr2  @<> '' ); If( sAttrType2  @= 'AN' ); sAttrVal2  = NumberToString( AttrN( pDim, sEle, sAttr2 ) );  Else; sAttrVal2  = AttrS( pDim, sEle, sAttr2 );  EndIf; EndIf;
                If( sAttr3  @<> '' ); If( sAttrType3  @= 'AN' ); sAttrVal3  = NumberToString( AttrN( pDim, sEle, sAttr3 ) );  Else; sAttrVal3  = AttrS( pDim, sEle, sAttr3 );  EndIf; EndIf;
                If( sAttr4  @<> '' ); If( sAttrType4  @= 'AN' ); sAttrVal4  = NumberToString( AttrN( pDim, sEle, sAttr4 ) );  Else; sAttrVal4  = AttrS( pDim, sEle, sAttr4 );  EndIf; EndIf;
                If( sAttr5  @<> '' ); If( sAttrType5  @= 'AN' ); sAttrVal5  = NumberToString( AttrN( pDim, sEle, sAttr5 ) );  Else; sAttrVal5  = AttrS( pDim, sEle, sAttr5 );  EndIf; EndIf;
                If( sAttr6  @<> '' ); If( sAttrType6  @= 'AN' ); sAttrVal6  = NumberToString( AttrN( pDim, sEle, sAttr6 ) );  Else; sAttrVal6  = AttrS( pDim, sEle, sAttr6 );  EndIf; EndIf;
                If( sAttr7  @<> '' ); If( sAttrType7  @= 'AN' ); sAttrVal7  = NumberToString( AttrN( pDim, sEle, sAttr7 ) );  Else; sAttrVal7  = AttrS( pDim, sEle, sAttr7 );  EndIf; EndIf;
                If( sAttr8  @<> '' ); If( sAttrType8  @= 'AN' ); sAttrVal8  = NumberToString( AttrN( pDim, sEle, sAttr8 ) );  Else; sAttrVal8  = AttrS( pDim, sEle, sAttr8 );  EndIf; EndIf;
                If( sAttr9  @<> '' ); If( sAttrType9  @= 'AN' ); sAttrVal9  = NumberToString( AttrN( pDim, sEle, sAttr9 ) );  Else; sAttrVal9  = AttrS( pDim, sEle, sAttr9 );  EndIf; EndIf;
                If( sAttr10 @<> '' ); If( sAttrType10 @= 'AN' ); sAttrVal10 = NumberToString( AttrN( pDim, sEle, sAttr10 ) ); Else; sAttrVal10 = AttrS( pDim, sEle, sAttr10 ); EndIf; EndIf;
                If( sAttr11 @<> '' ); If( sAttrType11 @= 'AN' ); sAttrVal11 = NumberToString( AttrN( pDim, sEle, sAttr11 ) ); Else; sAttrVal11 = AttrS( pDim, sEle, sAttr11 ); EndIf; EndIf;
                If( sAttr12 @<> '' ); If( sAttrType12 @= 'AN' ); sAttrVal12 = NumberToString( AttrN( pDim, sEle, sAttr12 ) ); Else; sAttrVal12 = AttrS( pDim, sEle, sAttr12 ); EndIf; EndIf;
                If( sAttr13 @<> '' ); If( sAttrType13 @= 'AN' ); sAttrVal13 = NumberToString( AttrN( pDim, sEle, sAttr13 ) ); Else; sAttrVal13 = AttrS( pDim, sEle, sAttr13 ); EndIf; EndIf;
                If( sAttr14 @<> '' ); If( sAttrType14 @= 'AN' ); sAttrVal14 = NumberToString( AttrN( pDim, sEle, sAttr14 ) ); Else; sAttrVal14 = AttrS( pDim, sEle, sAttr14 ); EndIf; EndIf;
                If( sAttr15 @<> '' ); If( sAttrType15 @= 'AN' ); sAttrVal15 = NumberToString( AttrN( pDim, sEle, sAttr15 ) ); Else; sAttrVal15 = AttrS( pDim, sEle, sAttr15 ); EndIf; EndIf;
                If( sAttr16 @<> '' ); If( sAttrType16 @= 'AN' ); sAttrVal16 = NumberToString( AttrN( pDim, sEle, sAttr16 ) ); Else; sAttrVal16 = AttrS( pDim, sEle, sAttr16 ); EndIf; EndIf;
                If( sAttr17 @<> '' ); If( sAttrType17 @= 'AN' ); sAttrVal17 = NumberToString( AttrN( pDim, sEle, sAttr17 ) ); Else; sAttrVal17 = AttrS( pDim, sEle, sAttr17 ); EndIf; EndIf;
                If( sAttr18 @<> '' ); If( sAttrType18 @= 'AN' ); sAttrVal18 = NumberToString( AttrN( pDim, sEle, sAttr18 ) ); Else; sAttrVal18 = AttrS( pDim, sEle, sAttr18 ); EndIf; EndIf;
                If( sAttr19 @<> '' ); If( sAttrType19 @= 'AN' ); sAttrVal19 = NumberToString( AttrN( pDim, sEle, sAttr19 ) ); Else; sAttrVal19 = AttrS( pDim, sEle, sAttr19 ); EndIf; EndIf;
                If( sAttr20 @<> '' ); If( sAttrType20 @= 'AN' ); sAttrVal20 = NumberToString( AttrN( pDim, sEle, sAttr20 ) ); Else; sAttrVal20 = AttrS( pDim, sEle, sAttr20 ); EndIf; EndIf;
                If( sAttr21 @<> '' ); If( sAttrType21 @= 'AN' ); sAttrVal21 = NumberToString( AttrN( pDim, sEle, sAttr21 ) ); Else; sAttrVal21 = AttrS( pDim, sEle, sAttr21 ); EndIf; EndIf;
                If( sAttr22 @<> '' ); If( sAttrType22 @= 'AN' ); sAttrVal22 = NumberToString( AttrN( pDim, sEle, sAttr22 ) ); Else; sAttrVal22 = AttrS( pDim, sEle, sAttr22 ); EndIf; EndIf;
                If( sAttr23 @<> '' ); If( sAttrType23 @= 'AN' ); sAttrVal23 = NumberToString( AttrN( pDim, sEle, sAttr23 ) ); Else; sAttrVal23 = AttrS( pDim, sEle, sAttr23 ); EndIf; EndIf;
                If( sAttr24 @<> '' ); If( sAttrType24 @= 'AN' ); sAttrVal24 = NumberToString( AttrN( pDim, sEle, sAttr24 ) ); Else; sAttrVal24 = AttrS( pDim, sEle, sAttr24 ); EndIf; EndIf;
                If( sAttr25 @<> '' ); If( sAttrType25 @= 'AN' ); sAttrVal25 = NumberToString( AttrN( pDim, sEle, sAttr25 ) ); Else; sAttrVal25 = AttrS( pDim, sEle, sAttr25 ); EndIf; EndIf;
                If( sAttr26 @<> '' ); If( sAttrType26 @= 'AN' ); sAttrVal26 = NumberToString( AttrN( pDim, sEle, sAttr26 ) ); Else; sAttrVal26 = AttrS( pDim, sEle, sAttr26 ); EndIf; EndIf;
                If( sAttr27 @<> '' ); If( sAttrType27 @= 'AN' ); sAttrVal27 = NumberToString( AttrN( pDim, sEle, sAttr27 ) ); Else; sAttrVal27 = AttrS( pDim, sEle, sAttr27 ); EndIf; EndIf;
                If( sAttr28 @<> '' ); If( sAttrType28 @= 'AN' ); sAttrVal28 = NumberToString( AttrN( pDim, sEle, sAttr28 ) ); Else; sAttrVal28 = AttrS( pDim, sEle, sAttr28 ); EndIf; EndIf;
                If( sAttr29 @<> '' ); If( sAttrType29 @= 'AN' ); sAttrVal29 = NumberToString( AttrN( pDim, sEle, sAttr29 ) ); Else; sAttrVal29 = AttrS( pDim, sEle, sAttr29 ); EndIf; EndIf;
                If( sAttr30 @<> '' ); If( sAttrType30 @= 'AN' ); sAttrVal30 = NumberToString( AttrN( pDim, sEle, sAttr30 ) ); Else; sAttrVal30 = AttrS( pDim, sEle, sAttr30 ); EndIf; EndIf;
                If( sAttr31 @<> '' ); If( sAttrType31 @= 'AN' ); sAttrVal31 = NumberToString( AttrN( pDim, sEle, sAttr31 ) ); Else; sAttrVal31 = AttrS( pDim, sEle, sAttr31 ); EndIf; EndIf;
                If( sAttr32 @<> '' ); If( sAttrType32 @= 'AN' ); sAttrVal32 = NumberToString( AttrN( pDim, sEle, sAttr32 ) ); Else; sAttrVal32 = AttrS( pDim, sEle, sAttr32 ); EndIf; EndIf;
                If( sAttr33 @<> '' ); If( sAttrType33 @= 'AN' ); sAttrVal33 = NumberToString( AttrN( pDim, sEle, sAttr33 ) ); Else; sAttrVal33 = AttrS( pDim, sEle, sAttr33 ); EndIf; EndIf;
                If( sAttr34 @<> '' ); If( sAttrType34 @= 'AN' ); sAttrVal34 = NumberToString( AttrN( pDim, sEle, sAttr34 ) ); Else; sAttrVal34 = AttrS( pDim, sEle, sAttr34 ); EndIf; EndIf;
                If( sAttr35 @<> '' ); If( sAttrType35 @= 'AN' ); sAttrVal35 = NumberToString( AttrN( pDim, sEle, sAttr35 ) ); Else; sAttrVal35 = AttrS( pDim, sEle, sAttr35 ); EndIf; EndIf;
                If( sAttr36 @<> '' ); If( sAttrType36 @= 'AN' ); sAttrVal36 = NumberToString( AttrN( pDim, sEle, sAttr36 ) ); Else; sAttrVal36 = AttrS( pDim, sEle, sAttr36 ); EndIf; EndIf;
                If( sAttr37 @<> '' ); If( sAttrType37 @= 'AN' ); sAttrVal37 = NumberToString( AttrN( pDim, sEle, sAttr37 ) ); Else; sAttrVal37 = AttrS( pDim, sEle, sAttr37 ); EndIf; EndIf;
                If( sAttr38 @<> '' ); If( sAttrType38 @= 'AN' ); sAttrVal38 = NumberToString( AttrN( pDim, sEle, sAttr38 ) ); Else; sAttrVal38 = AttrS( pDim, sEle, sAttr38 ); EndIf; EndIf;
                If( sAttr39 @<> '' ); If( sAttrType39 @= 'AN' ); sAttrVal39 = NumberToString( AttrN( pDim, sEle, sAttr39 ) ); Else; sAttrVal39 = AttrS( pDim, sEle, sAttr39 ); EndIf; EndIf;
                If( sAttr40 @<> '' ); If( sAttrType40 @= 'AN' ); sAttrVal40 = NumberToString( AttrN( pDim, sEle, sAttr40 ) ); Else; sAttrVal40 = AttrS( pDim, sEle, sAttr40 ); EndIf; EndIf;
                If( sAttr41 @<> '' ); If( sAttrType41 @= 'AN' ); sAttrVal41 = NumberToString( AttrN( pDim, sEle, sAttr41 ) ); Else; sAttrVal41 = AttrS( pDim, sEle, sAttr41 ); EndIf; EndIf;
                If( sAttr42 @<> '' ); If( sAttrType42 @= 'AN' ); sAttrVal42 = NumberToString( AttrN( pDim, sEle, sAttr42 ) ); Else; sAttrVal42 = AttrS( pDim, sEle, sAttr42 ); EndIf; EndIf;
                If( sAttr43 @<> '' ); If( sAttrType43 @= 'AN' ); sAttrVal43 = NumberToString( AttrN( pDim, sEle, sAttr43 ) ); Else; sAttrVal43 = AttrS( pDim, sEle, sAttr43 ); EndIf; EndIf;
                If( sAttr44 @<> '' ); If( sAttrType44 @= 'AN' ); sAttrVal44 = NumberToString( AttrN( pDim, sEle, sAttr44 ) ); Else; sAttrVal44 = AttrS( pDim, sEle, sAttr44 ); EndIf; EndIf;
                If( sAttr45 @<> '' ); If( sAttrType45 @= 'AN' ); sAttrVal45 = NumberToString( AttrN( pDim, sEle, sAttr45 ) ); Else; sAttrVal45 = AttrS( pDim, sEle, sAttr45 ); EndIf; EndIf;
                If( sAttr46 @<> '' ); If( sAttrType46 @= 'AN' ); sAttrVal46 = NumberToString( AttrN( pDim, sEle, sAttr46 ) ); Else; sAttrVal46 = AttrS( pDim, sEle, sAttr46 ); EndIf; EndIf;
                If( sAttr47 @<> '' ); If( sAttrType47 @= 'AN' ); sAttrVal47 = NumberToString( AttrN( pDim, sEle, sAttr47 ) ); Else; sAttrVal47 = AttrS( pDim, sEle, sAttr47 ); EndIf; EndIf;
                If( sAttr48 @<> '' ); If( sAttrType48 @= 'AN' ); sAttrVal48 = NumberToString( AttrN( pDim, sEle, sAttr48 ) ); Else; sAttrVal48 = AttrS( pDim, sEle, sAttr48 ); EndIf; EndIf;
                If( sAttr49 @<> '' ); If( sAttrType49 @= 'AN' ); sAttrVal49 = NumberToString( AttrN( pDim, sEle, sAttr49 ) ); Else; sAttrVal49 = AttrS( pDim, sEle, sAttr49 ); EndIf; EndIf;
                If( sAttr50 @<> '' ); If( sAttrType50 @= 'AN' ); sAttrVal50 = NumberToString( AttrN( pDim, sEle, sAttr50 ) ); Else; sAttrVal50 = AttrS( pDim, sEle, sAttr50 ); EndIf; EndIf;
            
                # Determine attribute values portion of record output string
                sAttrVals   = '';
                nCtr        = 1;
                While( nCtr <= 50 );
                    sCtr = NumberToString( nCtr );
                    sVal = Expand( '%' | Expand('sAttr%sCtr%') | '%' );
                    If( sVal @<> '' );
                        sVal = Expand( '%' | Expand('sAttrVal%sCtr%') | '%' );
                        sAttrVals = Expand('%sAttrVals%%sQuote%%sVal%%sQuote%%sDelim%');
                    Else;
                        nCtr = 50;
                    EndIf;
                    nCtr = nCtr + 1;
                End;
            
                If( vL1 @= '' % ElIsAnc( pDim, vL1, sEle ) = 0 );
                    sElWht  = '0';
                    vL1     = sEle; vL2 = ''; vL3 = ''; vL4 = ''; vL5 = ''; vL6 = ''; vL7 = ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%vL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL29, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL29, sEle ) );
                    vL30    = sEle;
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%vL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL28, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL28, sEle ) );
                    vL29    = sEle; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%vL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL27, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL27, sEle ) );
                    vL28    = sEle; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%vL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL26, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL26, sEle ) );
                    vL27    = sEle; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%vL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL25, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL25, sEle ) );
                    vL26    = sEle; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%vL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL24, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL24, sEle ) );
                    vL25    = sEle; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%vL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL23, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL23, sEle ) );
                    vL24    = sEle; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%vL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL22, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL22, sEle ) );
                    vL23    = sEle; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%vL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL21, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL21, sEle ) );
                    vL22    = sEle; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%vL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL20, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL20, sEle ) );
                    vL21    = sEle; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%vL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL19, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL19, sEle ) );
                    vL20    = sEle; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%vL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL18, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL18, sEle ) );
                    vL19    = sEle; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%vL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL17, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL17, sEle ) );
                    vL18    = sEle; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%vL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL16, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL16, sEle ) );
                    vL17    = sEle; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%vL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL15, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL15, sEle ) );
                    vL16    = sEle; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%vL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL14, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL14, sEle ) );
                    vL15    = sEle; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%vL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL13, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL13, sEle ) );
                    vL14    = sEle; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%vL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL12, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL12, sEle ) );
                    vL13    = sEle; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%vL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL11, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL11, sEle ) );
                    vL12    = sEle; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%vL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL10, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL10, sEle ) );
                    vL11    = sEle; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%vL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL9, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL9, sEle ) );
                    vL10    = sEle; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%vL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL8, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL8, sEle ) );
                    vL9     = sEle; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%vL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL7, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL7, sEle ) );
                    vL8     = sEle; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%vL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL6, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL6, sEle ) );
                    vL7     = sEle; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%vL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL5, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL5, sEle ) );
                    vL6     = sEle; vL7 = ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%vL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL4, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL4, sEle ) );
                    vL5     = sEle; vL6 = ''; vL7 = ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%vL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf(ElIsPar( pDim, vL3, sEle ) = 1 );
                    sElWht = NumberToString( ElWeight( pDim, vL3, sEle ) );
                    vL4     = sEle; vL5 = ''; vL6 = ''; vL7 = ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%vL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL2, sEle ) = 1 );
                    sElWht = NumberToString( ElWeight( pDim, vL2, sEle ) );
                    vL3     = sEle; vL4 = ''; vL5 = ''; vL6 = ''; vL7 = ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%cL2%%sQuote%%sDelim%%sQuote%%vL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                ElseIf( ElIsPar( pDim, vL1, sEle ) = 1 );
                    sElWht  = NumberToString( ElWeight( pDim, vL1, sEle ) );
                    vL2     = sEle; vL3 = ''; vL4 = ''; vL5 = ''; vL6 = ''; vL7 = ''; vL8 = ''; vL9 = ''; vL10 = ''; vL11 = ''; vL12 = ''; vL13 = ''; vL14 = ''; vL15 = ''; vL16 = ''; vL17 = ''; vL18 = ''; vL19 = ''; vL20 = ''; vL21 = ''; vL22 = ''; vL23 = ''; vL24 = ''; vL25 = ''; vL26 = ''; vL27 = ''; vL28 = ''; vL29 = ''; vL30 = '';
                    sRecord = Expand('%sQuote%%sRow%%sQuote%%sDelim%%sQuote%%cL1%%sQuote%%sDelim%%sQuote%%vL2%%sQuote%%sDelim%%sQuote%%cL3%%sQuote%%sDelim%%sQuote%%cL4%%sQuote%%sDelim%%sQuote%%cL5%%sQuote%%sDelim%%sQuote%%cL6%%sQuote%%sDelim%%sQuote%%cL7%%sQuote%%sDelim%%sQuote%%cL8%%sQuote%%sDelim%%sQuote%%cL9%%sQuote%%sDelim%%sQuote%%cL10%%sQuote%%sDelim%%sQuote%%cL11%%sQuote%%sDelim%%sQuote%%cL12%%sQuote%%sDelim%%sQuote%%cL13%%sQuote%%sDelim%%sQuote%%cL14%%sQuote%%sDelim%%sQuote%%cL15%%sQuote%%sDelim%%sQuote%%cL16%%sQuote%%sDelim%%sQuote%%cL17%%sQuote%%sDelim%%sQuote%%cL18%%sQuote%%sDelim%%sQuote%%cL19%%sQuote%%sDelim%%sQuote%%cL20%%sQuote%%sDelim%%sQuote%%cL21%%sQuote%%sDelim%%sQuote%%cL22%%sQuote%%sDelim%%sQuote%%cL23%%sQuote%%sDelim%%sQuote%%cL24%%sQuote%%sDelim%%sQuote%%cL25%%sQuote%%sDelim%%sQuote%%cL26%%sQuote%%sDelim%%sQuote%%cL27%%sQuote%%sDelim%%sQuote%%cL28%%sQuote%%sDelim%%sQuote%%cL29%%sQuote%%sDelim%%sQuote%%cL30%%sQuote%%sDelim%%sQuote%%sElType%%sQuote%%sDelim%%sQuote%%sElWht%%sQuote%%sDelim%%sAttrVals%');
                EndIf;
                
                # Output the element record
                AsciiOutput( sFile, sRecord );
                # Increment loop counters
                nCtrEle = nCtrEle + 1; nCtrRow = nCtrRow + 1;
            # Inner loop through descendants of root element
            End;
        # test that depth of root element doesn't exceed nMaxLvl
        EndIf;
        nCtrRoot = nCtrRoot + 1;
    # Outer loop through root elements
    End;
    #EndRegion - Loop elements and export
    ##############################################################################################################
EndIf;
#EndRegion - New source template (ByRollup)
##############################################################################################################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,97
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

### Logging - common script

nDataRecordCount = nDataRecordCount + 1;

######################
### Data script

### Local variables
nEltId      = DIMIX( pDim, vElement );
sEltType    = DType( pDim, vElement );
nParents    = ElParN( pDim, vElement );

##############################################################################################################
#Region - Original source template (ByParentChild)
IF( nNewTemplate < 1 );
    ### Write the Header
    IF( nDataRecordCount=1);
    
      sStartHeader      = Expand( '%sQuote%Element%sQuote%%sDelim%%sQuote%Parent1%sQuote%%sDelim%%sQuote%Parent2%sQuote%%sDelim%%sQuote%Parent3%sQuote%%sDelim%%sQuote%Parent4%sQuote%%sDelim%%sQuote%Parent5%sQuote%%sDelim%%sQuote%Parent6%sQuote%%sDelim%%sQuote%Parent7%sQuote%%sDelim%%sQuote%Parent8%sQuote%%sDelim%%sQuote%Comment%sQuote%%sDelim%%sQuote%Weight%sQuote%%sDelim%%sQuote%Type%sQuote%' );
      sAttrListHeader   = sDelim;
      nParentMax        = 50;
    
      # Get the list of attribute for the header
      # Loop through the attribute dimension
      nAttrMax  = DIMSIZ( sAttrDim );
      nAttrCtr  = 1;
      sAttrList = '';
      WHILE( nAttrCtr   <= nAttrMax );
        sCurAttr        = DIMNM( sAttrDim, nAttrCtr );
        sCurAttrType    = DType( sAttrDim, sCurAttr );
        sAttrListHeader = Expand( '%sAttrListHeader%%sQuote%%sCurAttr%[%sCurAttrType%]%sQuote%%sDelim%' );
        nAttrCtr        = nAttrCtr + 1;
      END;
    
      #Complete the list with remaining Attribute
      WHILE( nAttrCtr   <=nParentMax );
        sAttrCtr        = NumberToString( nAttrCtr );
        sAttrListHeader = Expand( '%sAttrListHeader%%sQuote%Attribute%sAttrCtr%%sQuote%%sDelim%' );
        nAttrCtr        = nAttrCtr + 1;
      END;
    
      AsciiOutput( sFile, sStartHeader | sAttrListHeader );
    ENDIF;
    
    ### Loop through the attribute dimension
    nAttrMax        = DIMSIZ( sAttrDim );
    nAttrCtr        = 1;
    sAttrList       = sDelim;
    WHILE( nAttrCtr <= nAttrMax );
    
      sCurAttr      = DIMNM( sAttrDim, nAttrCtr );
      sCurAttrType  = DType( sAttrDim, sCurAttr );
      If( bIsAltHier= 0 );
          sCurAttrValue = sQuote | CellGetS( sAttrDim, vElement, sCurAttr ) | sQuote;
      Else;
          sCurAttrValue = sQuote | CellGetS( sAttrDim, sHier:vElement, sCurAttr ) | sQuote;
      EndIf;
      sAttrList     = sAttrList | sCurAttrValue | sDelim;
    
      nAttrCtr      = nAttrCtr + 1;
    END;
    
    ### If no parents, just print the element, if there is at least one parent, skip the line with the element only
    IF( nParents    = 0 );
      nCurParent    = 0;
    ELSE;
      nCurParent    = 1;
    ENDIF;
    
    WHILE( nCurParent <= nParents );
    
      sCurParent    = ELPAR(  pDim, vElement, nCurParent );
      sCurWeight    = NumberToString( ElWeight( pDim, sCurParent, vElement ) ); 
      AsciiOutput( sFile, Expand( '%sQuote%%vElement%%sQuote%%sDelim%%sQuote%%sCurParent%%sQuote%%sDelim%%sFillerParents%%sQuote%%sCurWeight%%sQuote%%sDelim%%sQuote%%sEltType%%sQuote%%sAttrList%' ) );
      
      #Print the attributes only once
      sAttrList     = '';
    
      nCurParent    = nCurParent + 1;
    END;
ENDIF;
#EndRegion - Original source template (ByParentChild)
##############################################################################################################
### END Data
	
575,27
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
