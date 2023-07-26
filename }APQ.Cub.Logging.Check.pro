601,100
602,"}APQ.Cub.Logging.Check"
562,"SUBSET"
586,"}Cubes"
585,"}Cubes"
564,
565,"y`gqwyBuCN`gKkSZ;RFQOoD2waka@=[9o;KvCuxN7r5jS^d?4M2kp1QHlV8:;6S3=_d6C9tQaLKxvN6?t\UXzfY2>StKMX:kmcs9wT3yhbOANJa>eV\YXtWpPf4?MoU>jtIpUO;sx9n7uEfMf\y:umZL\hbZfl8[qya0^S59ZRKA\@lbrSB>HUEp@T05XiUVtv;H2E?H"
559,0
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,2
Select	*
From 	[];
567,","
588,"."
589,
568,""""
570,
571,All
569,0
592,0
599,1000
560,3
pDoProcessLogging
pCube
pSetLogging
561,3
2
2
2
590,3
pDoProcessLogging,"1"
pCube,""
pSetLogging,"1"
637,3
pDoProcessLogging,"Record in process log"
pCube,"Specific cube (blank=ALL). Also accepts wildcards for starts, ends and contains matches"
pSetLogging,"1 to turn logging on 0 to disable logging"
577,1
vCub
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
572,91
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

######################
### Purpose:
### Cycle through all cubes and make sure that cube logging is switched on to make sure no user inputed transactions are lost

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pCube:' | IF( pCube @= '', 'ALL', pCube ) |' & '| 'pSetLogging:' | pSetLogging;
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

### Inits - declare constants
cCubParam   = '}APQ Settings';
cCubTgt     = '}CubeProperties';
cDimSrc     = '}APQ Cubes';
cMatchType  = '';
pDebug      = '0';
nErr        = 0;
sErr        = '';
# If no data entry for cube in }CubeProperties then CubeSetLogChanges is ineffective and only starts working after either YES or NO is entered in }CubeProperties.
pMethod     = 'CellSet';

### Test parameters
nErr        = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

If( pCube @= '' % pCube @= 'ALL' );
    pCube       = 'ALL';
    cMatchType  = 'ALL';
ElseIf( CubeExists( pCube ) = 1 );
    cMatchType  = 'EXACT';
ElseIf( Scan( '*', pCube ) = 0 & CubeExists( pCube ) = 0 );
    nErr        = nErr + 1;
    sErr        = 'Invalid target cube.';
ElseIf( Scan( '*', pCube ) = 1 & SubSt( pCube, Long(pCube), 1 ) @= '*' );
    pCube       = SubSt( pCube, 2, Long( pCube ) - 2 );
    cMatchType  = 'CONTAINS';
ElseIf( Scan( '*', pCube ) = 1 & SubSt( pCube, Long(pCube), 1 ) @<> '*' );
    pCube       = SubSt( pCube, 2, Long( pCube ) - 1 );
    cMatchType  = 'ENDS';
ElseIf( SubSt( pCube, Long( pCube ), 1 ) @= '*' );
    pCube       = SubSt( pCube, 1, Long( pCube ) - 1 );
    cMatchType  = 'STARTS';
EndIf;

If(  pSetLogging @<> '0' &  pSetLogging @<> '1' );
    nErr        = nErr + 1;
    sErr        = sErr | 'Invalid logging switch. ';
ElseIf( pSetLogging @= '1' );
    sLogging    = 'YES';
Else;
    sLogging    = 'NO';
EndIf;

### Assign data source
IF( nErr = 0 );
    DataSourceType = 'SUBSET';
    DataSourceNameForServer = cDimSrc;
    DatasourceDimensionSubset = 'ALL';
Else;
    DataSourceType = 'NULL';
    ItemReject( sErr );
EndIF;

######################
### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,89
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

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
    nDataRecordCount = nDataRecordCount + 1;
EndIF;

######################
### Data script

# Skip if cube not loaded
IF( CubeExists( vCub ) = 0 );
    If( pDebug @>= '1' );
        LogOutput( 'INFO', 'Skipping 1 ' | vCub );
    EndIf;
    ItemSkip;
EndIF;

# Skip if match not found
If( cMatchType  @= 'ALL' );
    # no match needed just proceed
Else;
    If( cMatchType @= 'EXACT' );
        If( vCub @<> pCube );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', 'Skipping 2 ' | vCub );
            EndIf;
            ItemSkip;
        EndIf;
    ElseIf( cMatchType @= 'STARTS' );
        If( Scan( Upper( pCube ), Upper( vCub ) ) <> 1 );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', 'Skipping 3 ' | vCub );
            EndIf;
            ItemSkip;
        EndIf;
    ElseIf( cMatchType @= 'CONTAINS' );
        If( Scan( Upper( pCube ), Upper( vCub ) ) = 0 );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', 'Skipping 4 ' | vCub );
            EndIf;
            ItemSkip;
        EndIf;
    ElseIf( cMatchType @= 'ENDS' );
        If( Scan( Upper( pCube ), Upper( vCub ) ) <> Long( vCub ) - Long( pCube ) + 1 );
            # no match
            If( pDebug @>= '1' );
                LogOutput( 'INFO', 'Skipping 5 ' | vCub );
            EndIf;
            ItemSkip;
        EndIf;
    EndIf;    
EndIf;

# For stats cubes ALWAYS have logging off. Otherwise respect pSetLogging param
IF( SubSt( vCub, 1, 6 ) @= '}Stats' );
    If( pMethod @= 'CellSet' );
        CubeSetLogChanges( vCub, 0 );
    Else;
        CellPutS( 'NO', cCubTgt, vCub, 'Logging' );
    EndIf;
Else;
    If( pDebug @>= '1' );
        LogOutput( 'INFO', Expand('Setting Logging=%pSetLogging% for vCub') );
    EndIf;
    If( pMethod @= 'CellSet' );
        CubeSetLogChanges( vCub, StringToNumber( pSetLogging ));
    Else;
        CellPutS( sLogging, cCubTgt, vCub, 'Logging' );
    EndIf;
EndIF;

######################
### END Metadata
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
