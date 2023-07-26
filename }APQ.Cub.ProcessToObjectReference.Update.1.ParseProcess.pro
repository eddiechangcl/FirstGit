601,100
602,"}APQ.Cub.ProcessToObjectReference.Update.1.ParseProcess"
562,"CHARACTERDELIMITED"
586,".\_New_Process_Template.pro"
585,".\_New_Process_Template.pro"
564,
565,"gFLpPceaZprf7fUNph[eqF@AUA?vOfgxB45V[TYzYPuCxTJYZt<iv[C^zz?7\?XAxOZ_LzR\F=n00p4WXD]FEmGsYVI^cUXWy[pRI1`Y>r>_wZEzfFzLGW:<Cg<8l9^x9`_KjeyNfJqFlzm>6Eks;[K1fq[blUX5aVrBZ^iot2ijKp\G[LhJ[w38J]NeC?puIc7xmaPK"
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
560,2
pProcessFile
pDoProcessLogging
561,2
2
2
590,2
pProcessFile,""
pDoProcessLogging,"1.000000"
637,2
pProcessFile,"Process File:"
pDoProcessLogging,"Record in process log"
577,1
vDefinition
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
572,83
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


### Purpose:	Analyse the pro file and get the cube, dimension, & process relationships & map into the }APQ Process to Object Reference cube

##############################################################################################################
### Logging - common script
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pProcessFile:' | pProcessFile;
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
### Prolog script

### Inits - declare constants
cCubeProcessMappingCube     = '}APQ Process to Object Reference';
cDimProcessMappingCube      = '}APQ Process to Object Reference';
cProcProcessMappingCube     = '}APQ Process to Object Reference';
cCubTgt                     = cCubeProcessMappingCube;
cParamCube                  = '}APQ Settings';
cCubeDim                    = '}Cubes'; cCubeDim2 = '}APQ Cubes';
cDimDim                     = '}Dimensions'; cDimDim2 = '}APQ Dimensions';
cProcDim                    = '}Processes'; cProcDim2 = '}APQ Processes';
cFile                       = pProcessFile;
cDirectMeasure              = 'Direct Used';
cIndirectMeasure            = 'Indirect Used';
cMeasure                    = 'Is Used';

cDataDirectory              = CellGetS( cParamCube, 'Location: Data Dir', 'String' );
cDataDirectory              = cDataDirectory | If(SubSt(cDataDirectory, Long(cDataDirectory), 1) @<> '\', '\', '');
cAPQDirectory               = CellGetS( cParamCube, 'Location: Framework', 'String' );
cAPQDirectory               = If( cAPQDirectory @= '', cDataDirectory, cAPQDirectory ); 
cAPQDirectory               = cAPQDirectory | If(SubSt(cAPQDirectory, Long(cAPQDirectory), 1) @<> '\', '\', '');

### Define variables that will be using within this process
sCubeList                   = '';
sDimList                    = '';
sRealCubeList               = '';
sRealDimList                = '';
sProcList                   = '';
sRealProcList               = '';
If( Scan( Upper( cAPQDirectory ), Upper( cFile ) ) = 1 );
    sProcessName = If (Long(cFile) > Long(cAPQDirectory), SubSt(cFile, Long(cAPQDirectory) + 1, Long(cFile) - Long(cAPQDirectory)), cFile);
    sProcessName = SubSt(sProcessName, 1, Long(sProcessName) - 4);
Else;
    sProcessName = If (Long(cFile) > Long(cDataDirectory), SubSt(cFile, Long(cDataDirectory) + 1, Long(cFile) - Long(cDataDirectory)), cFile);
    sProcessName = SubSt(sProcessName, 1, Long(sProcessName) - 4);
EndIf;

### Change the data source based on the parameter passed in
DataSourceType                  = 'CHARACTERDELIMITED';
DatasourceNameForServer         = cFile;
DatasourceNameForClient         = cFile;
DatasourceASCIIDelimiter        = Char(176);
DatasourceASCIIQuoteCharacter   = '';
DatasourceASCIIDecimalSeparator = '.';
DatasourceASCIIThousandSeparator= ',';
DatasourceASCIIHeaderRecords    = 2;

### END Prolog
573,71
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

### Create an array with all the cube information, either hardcoded or variable

vDefinitionUpper = UPPER(vDefinition);

If( Scan( 'CELLPUT', vDefinitionUpper) > 0 % Scan( 'CELLINCREMENT', vDefinitionUpper) > 0 % Scan( 'CELLPUTPROPORTIONALSPREAD' , vDefinitionUpper) > 0);

    #To get the cube variable or name
    nCellPutFirstComma = Scan(',', vDefinition);
    sCellPutRemoved = Trim(SubSt(vDefinition, nCellPutFirstComma + 1, Long(vDefinition) - nCellPutFirstComma));
    sCubeToWrite = Trim(SubSt(sCellPutRemoved, 1, Scan(',', sCellPutRemoved)-1));

    If ( Scan( sCubeToWrite, sCubeList) = 0);
        If (sCubeList @<> '');
            sCubeList = sCubeList | ',';
        Endif;
        sCubeList = sCubeList | sCubeToWrite;
    Endif;

ElseIf( Scan( 'DIMENSIONELEMENTINSERT', vDefinitionUpper) > 0 % Scan( 'DIMENSIONELEMENTDELETE', vDefinitionUpper) > 0 % Scan( 'DIMENSIONELEMENTCOMPONENT', vDefinitionUpper) > 0 % Scan( 'ATTRPUT', vDefinitionUpper) > 0 % Scan ( 'DIMENSIONTOPELEMENTINSERT' , vDefinitionUpper ) > 0 );

    #To get the dimension variable or name
    If( Scan( 'ATTRPUT', vDefinitionUpper) = 0 );
        nDimChgFirstBracket = Scan( '(', vDefinition );
        sDimChgRemoved = Trim( SubSt( vDefinition, nDimChgFirstBracket + 1, Long( vDefinition ) - nDimChgFirstBracket ) );
    Else;
        nDimChgFirstComma = Scan( ',', vDefinition );
        sDimChgRemoved = Trim( SubSt( vDefinition, nDimChgFirstComma + 1, Long( vDefinition ) - nDimChgFirstComma ) );
    Endif;
    sDimToWrite = Trim( SubSt( sDimChgRemoved, 1, Scan( ',', sDimChgRemoved ) -1 ) );

    If( Scan( sDimToWrite, sDimList) = 0 );
        If( sDimList @<> '' );
            sDimList = sDimList | ',';
        Endif;
        sDimList = sDimList | sDimToWrite;
    Endif;

ElseIf( Scan( 'EXECUTEPROCESS', vDefinitionUpper) > 0 );

    #To get the process variable or name
    nProcChgFirstBracket = Scan( '(', vDefinition );
    sProcChgRemoved = Trim( SubSt( vDefinition, nProcChgFirstBracket + 1, Long( vDefinition ) - nProcChgFirstBracket ) );
    sProcToWrite = Trim( SubSt( sProcChgRemoved, 1, Scan( ',', sProcChgRemoved ) -1 ) );

    If( Scan( sProcToWrite, sProcList) = 0 );
        If( sProcList @<> '' );
            sProcList = sProcList | ',';
        Endif;
        sProcList = sProcList | sProcToWrite;
    Endif;

Else;

    ItemSkip;

Endif;


### END Metadata
574,141
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

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

###Change the value of the array created from Metadata to make sure all cubes are now the real cube names

#Extract the real cube name from the process
If (sCubeList @<> '');
     sCubeList2Extract = Trim(sCubeList) | ',';
     
     While (sCubeList2Extract @<> '');
          nCommaLocation = Scan(',', sCubeList2Extract);
          sCube = SubSt(sCubeList2Extract, 1, nCommaLocation - 1);

          If (SubSt(sCube, 1, 1) @= Char(39) &
               SubSt(sCube, Long(sCube), 1) @= Char(39));
               sCubeNameNoQuote = SubSt(sCube, 2, Long(sCube) - 2);
               If (DimIx(cCubeDim, sCubeNameNoQuote) <> 0);
                     If (sRealCubeList @<> '');
                          sRealCubeList = sRealCubeList | ',';
                     Endif;
                     sRealCubeList = sRealCubeList | sCubeNameNoQuote;
                     sCubeList = Delet(sCubeList, Scan(sCube, sCubeList), Long(sCube) - 1);
               Endif;
          Else;
               If (Scan(sCube, vDefinition) <> 0);
                    nEqual = Scan('=', vDefinition);
                    If (nEqual <> 0);
                         If (Trim(SubSt(vDefinition, 1, nEqual - 1)) @= sCube);
                             sCubeName = Trim(SubSt(vDefinition, nEqual + 1, Long(vDefinition) - nEqual - 1));
                             sCubeNameNoQuote = SubSt(sCubeName, 2, Long(sCubeName) - 2);
                             If (DimIx(cCubeDim, sCubeNameNoQuote) <> 0);
                                 If (sRealCubeList @<> '');
                                     sRealCubeList = sRealCubeList | ',';
                                 Endif;
                                 sRealCubeList = sRealCubeList | sCubeNameNoQuote;
                            Endif;
                         Endif;
                    Endif;
                 Endif;
             Endif;
             sCubeList2Extract = Trim(SubSt(sCubeList2Extract, nCommaLocation + 1, Long(sCubeList2Extract) - nCommaLocation));
        End;

Endif;

###Change the value of the array created from Metadata to make sure all dimensions are now the real dimension names

#Extract the real dim name from the process
If( sDimList @<> '' );
     sDimList2Extract = Trim( sDimList ) | ',';
     
     While( sDimList2Extract @<> '' );
          nCommaLocation = Scan( ',', sDimList2Extract );
          sDim = SubSt( sDimList2Extract, 1, nCommaLocation - 1 );

          If( SubSt( sDim, 1, 1 ) @= Char(39) & SubSt( sDim, Long( sDim ), 1) @= Char(39) );
               sDimNameNoQuote = SubSt( sDim, 2, Long( sDim ) - 2 );
               If( DimIx( cDimDim, sDimNameNoQuote ) <> 0 );
                     If( sRealDimList @<> '' );
                          sRealDimList = sRealDimList | ',';
                     Endif;
                     sRealDimList = sRealDimList | sDimNameNoQuote;
                     sDimList = Delet( sDimList, Scan( sDim, sDimList ), Long( sDim ) - 1 );
               Endif;
          Else;
               If( Scan( sDim, vDefinition ) <> 0 );
                    nEqual = Scan( '=', vDefinition );
                    If( nEqual <> 0 );
                         If( Trim (SubSt( vDefinition, 1, nEqual - 1 ) ) @= sDim );
                             sDimName = Trim( SubSt( vDefinition, nEqual + 1, Long( vDefinition ) - nEqual - 1 ) );
                             sDimNameNoQuote = SubSt( sDimName, 2, Long( sDimName ) - 2 );
                             If( DimIx( cDimDim, sDimNameNoQuote ) <> 0);
                                 If( sRealDimList @<> '' );
                                     sRealDimList = sRealDimList | ',';
                                 Endif;
                                 sRealDimList = sRealDimList | sDimNameNoQuote;
                            Endif;
                         Endif;
                    Endif;
                 Endif;
             Endif;
             sDimList2Extract = Trim( SubSt( sDimList2Extract, nCommaLocation + 1, Long( sDimList2Extract ) - nCommaLocation ) );
        End;

Endif;

###Change the value of the array created from Metadata to make sure all processes are now the real process names

#Extract the real dim name from the process
If( sProcList @<> '' );
     sProcList2Extract = Trim( sProcList ) | ',';
     
     While( sProcList2Extract @<> '' );
          nCommaLocation = Scan( ',', sProcList2Extract );
          sProc = SubSt( sProcList2Extract, 1, nCommaLocation - 1 );

          If( SubSt( sProc, 1, 1 ) @= Char(39) & SubSt( sProc, Long( sProc ), 1) @= Char(39) );
               sProcNameNoQuote = SubSt( sProc, 2, Long( sProc ) - 2 );
               If( DimIx( cProcDim, sProcNameNoQuote ) <> 0 );
                     If( sRealProcList @<> '' );
                          sRealProcList = sRealProcList | ',';
                     Endif;
                     sRealProcList = sRealProcList | sProcNameNoQuote;
                     sProcList = Delet( sProcList, Scan( sProc, sProcList ), Long( sProc ) - 1 );
               Endif;
          Else;
               If( Scan( sProc, vDefinition ) <> 0 );
                    nEqual = Scan( '=', vDefinition );
                    If( nEqual <> 0 );
                         If( Trim (SubSt( vDefinition, 1, nEqual - 1 ) ) @= sProc );
                             sProcName = Trim( SubSt( vDefinition, nEqual + 1, Long( vDefinition ) - nEqual - 1 ) );
                             sProcNameNoQuote = SubSt( sProcName, 2, Long( sProcName ) - 2 );
                             If( DimIx( cProcDim, sProcNameNoQuote ) <> 0);
                                 If( sRealProcList @<> '' );
                                     sRealProcList = sRealProcList | ',';
                                 Endif;
                                 sRealProcList = sRealProcList | sProcNameNoQuote;
                            Endif;
                         Endif;
                    Endif;
                 Endif;
             Endif;
             sProcList2Extract = Trim( SubSt( sProcList2Extract, nCommaLocation + 1, Long( sProcList2Extract ) - nCommaLocation ) );
        End;

Endif;

### END Data
575,85
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

### Loop through the cube array and dim array, writes the mapping to the cubes

sRealCubeList = sRealCubeList | ',';
sRealCubeList2 = sRealCubeList;
sRealDimList = sRealDimList | ',';
sRealDimList2 = sRealDimList;
sRealProcList = sRealProcList | ',';
sRealProcList2 = sRealProcList;

If( sRealCubeList @<> '' );
     sRealCubeList = Trim(sRealCubeList);
     While( sRealCubeList @<> '' );
         nCubeCommaLocation = Scan(',', sRealCubeList);
         sCube = SubSt(sRealCubeList, 1, nCubeCommaLocation - 1);
         If( DimIx( cCubeDim2, sCube ) > 0 );
              sSkipMap = AttrS( cCubeDim2, sCube, 'SKIPMAP' );
              If ( sSkipMap @<> 'TRUE' );
                  CellPutN( 1, cCubeProcessMappingCube, 'Cube', sCube, sProcessName, cMeasure );
              Endif;
         Endif;
         sRealCubeList = Trim(SubSt(sRealCubeList, nCubeCommaLocation + 1, Long(sRealCubeList) - nCubeCommaLocation));
     End;
Endif;

If( sRealDimList @<> '' );
     sRealDimList = Trim( sRealDimList );
     While( sRealDimList @<> '' );
         nDimCommaLocation = Scan( ',', sRealDimList );
         sDim = SubSt( sRealDimList, 1, nDimCommaLocation - 1 );
         If( Scan( ':', sDim ) > 0 );
             sDim = SubSt( sDim, 1, Scan( ':', sDim ) - 1 );
         EndIf;
         If( DimIx( cDimDim2, sDim )> 0 );
              sSkipMap = AttrS( cDimDim2, sDim, 'SKIPMAP' );
              If( sSkipMap @<> 'TRUE' );
                  CellPutN( 1, cDimProcessMappingCube, 'Dimension', sDim, sProcessName, cMeasure );
              Endif;
         Endif;
         sRealDimList = Trim( SubSt( sRealDimList, nDimCommaLocation + 1, Long( sRealDimList) - nDimCommaLocation ) );
     End;
Endif;

If( sRealProcList @<> '' );
     sRealProcList = Trim( sRealProcList );
     While( sRealProcList @<> '' );
         nProcCommaLocation = Scan( ',', sRealProcList );
         sProc = SubSt( sRealProcList, 1, nProcCommaLocation - 1 );
         If( DimIx( cProcDim2, sProc ) > 0 );
              sSkipMap = AttrS( cProcDim2, sProc, 'SKIPMAP' );
              If( sSkipMap @<> 'TRUE' );
                  CellPutN( 1, cProcProcessMappingCube, 'Process', sProc, sProcessName, cMeasure );
              Endif;
         Endif;
         sRealProcList = Trim( SubSt( sRealProcList, nProcCommaLocation + 1, Long( sRealProcList) - nProcCommaLocation ) );
     End;
Endif;

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
