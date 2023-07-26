601,100
602,"}APQ.Cub.Picklist.Copy.UserSettings"
562,"VIEW"
586,"}APQ Picklist Dimension"
585,"}APQ Picklist Dimension"
564,"apliqo_reader"
565,"anizn@VdyKLvQMV@UvOlxD=LU2HHe99^F7wf6Y^LzFYIfxP^7>C_L]Gj>Ha_ImB3uNXn\CQGfuKDUL2dWdPTw5C?XM53Tqyy<Zh3nns]2r>udOiIEjpK>0qX^1_i6@m?FIRSos<FHpKC9Pt20y>URAAb0VTqlpbrpCYbg`3\d6r@c_MzN9wU\uVXmscmJ|q`AuRcyNbe"
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
566,1
Select	* From 	[myTable]
567,","
588,"."
589,
568,""""
570,Default
571,All
569,0
592,0
599,1000
560,8
pDoProcessLogging
pDebug
pSourceUser
pTargetType
pTarget
pDelimiter
pOverwrite
pCube
561,8
2
2
2
2
2
2
2
2
590,8
pDoProcessLogging,"1"
pDebug,"0"
pSourceUser,""
pTargetType,"Group List"
pTarget,""
pDelimiter,"+"
pOverwrite,"0"
pCube,"}APQ Picklist Dimension"
637,8
pDoProcessLogging,"Record in process log"
pDebug,"Write debug log file?"
pSourceUser,"Source user (blank - Default User from }APQ Settings)"
pTargetType,"User, User List, Group or Group List (blank - User)"
pTarget,"Mandatory, separated by delimiter"
pDelimiter,"Delimiter (blank standard bedrock delim)"
pOverwrite,"Overwrite existing settings if not blank (0 - don't overwrite, 1 - overwrite)"
pCube,"Cube to copy (blank - both }APQ Picklist Dimension and }APQ Picklist General)"
577,4
vUser
vDimension
vMeasure
vValue
578,4
2
2
2
2
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
VarType=32ColType=827
603,0
572,244
##############################################################################################################
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
### PURPOSE:
### A 1 - 3 line description of what this process does goes here!
### 
### DATA SOURCE: }APQ Picklist Dimension, }APQ Picklist General
### 
### INTENDED USAGE: Copy user settings to single user, list of users, groups or list of groups
### 
##############################################################################################################
### CHANGE HISTORY:
### MODIFICATION DATE 	CHANGED BY 	COMMENT
### 2017-08-03 		Developer Name 	Creation of Process
### 
##############################################################################################################

##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
sProcLogParams = 'pSourceUser:' | pSourceUser |' & '| 'pTargetType:' | pTargetType |' & '| 'pTarget:' | pTarget |' & '| 'pDelimiter:' | pDelimiter |' & '| 'pOverwrite:' | pOverwrite |' & '| 'pCube:' | pCube;
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

######################
### Inits - declare constants

cCubSrc         = pCube;
cCubTgt         = pCube;
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
nDebug          = StringToNumber( pDebug );
sDelim          = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
nErr            = 0;
sErr            = '';

cAPQClients     = '}APQ Clients';
cCubPkDim       = '}APQ Picklist Dimension';
cCubPkGeneral   = '}APQ Picklist General';
sTargetTypeStr  = 'User, User List, Group or Group List';

IF ( pDelimiter @='' );
  sDelimiter    = sDelim;
ELSE;
  sDelimiter    = pDelimiter;
EndIF;

nAPQClientsSZ   = DIMSIZ( cAPQClients );
nClientsSZ      = DIMSIZ( '}Clients' );
nGroupsSZ       = DIMSIZ( '}Groups' );

######################
### Debug

IF( pDebug @>= '1' );
  AsciiOutput( sDebugFile, 'Process: ' | sThisProcName );
  AsciiOutput( sDebugFile, 'Parameters: ' | sProcLogParams );
  AsciiOutput( sDebugFile, 'Commenced: ' | sTimeStamp );
EndIF;

######################
### Test parameters

IF( UPPER(pTargetType) @='USER' & DIMIX(cAPQClients, pTarget ) <> 0 );
  sTarget = DimensionElementPrincipalName( cAPQClients, pTarget);
ELSEIF( UPPER(pTargetType) @='USER LIST' );
  sTarget = TRIM(pTarget);
ELSEIF( UPPER(pTargetType) @='GROUP' % UPPER(pTargetType) @='GROUP LIST' );
  sTarget = '';
  i = nClientsSZ;
  WHILE ( i>0 );
    sClient = DIMNM( '}Clients', i);
    j = nGroupsSZ;
    WHILE ( j>0 );
      sGroup = DIMNM( '}Groups', j);
      IF ( SCAN( sDelimiter | UPPER(sGroup) | sDelimiter , sDelimiter | UPPER(TRIM(pTarget)) | sDelimiter )>0 );
        IF ( CellGetS( '}ClientGroups', sClient, sGroup) @= sGroup & DIMIX(cAPQClients, sClient)<>0 );
          sTarget = sTarget | sClient | sDelimiter;
        EndIF;
      EndIF;
      j=j-1;
    END;
    i=i-1;
  END;

  sTarget = SUBST(sTarget, 1, LONG(sTarget) - LONG(sDelimiter) );

ELSE;
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid ' | 'pTargetType: ' | pTarget;
EndIF;


IF( pSourceUser @<>'' & DIMIX('}APQ Clients', pSourceUser ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid pSourceUser:' | pSourceUser;
ELSEIF( pSourceUser @<>'' );
  sSourceUser = DimensionElementPrincipalName( cAPQClients, pSourceUser );
ELSE;
  sSourceUser = CellGetS ( cCubParam, 'Default User', 'String' );
EndIF;

IF( SCAN( pTargetType, sTargetTypeStr) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid pTargetType:' | pTargetType;
EndIF;

nErr = IF( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2, 1, 0 );

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
  IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, sErr );
  EndIF;
  DataSourceType = 'NULL';
  ItemReject( sErr );
EndIF;

######################
### Process logic

IF( pDebug @>= '1' );
    AsciiOutput( sDebugFile, 'sTarget=' | sTarget );
EndIF;

IF( pCube @= '' );
    ExecuteProcess( sThisProcName ,
		'pDoProcessLogging', pDoProcessLogging, 
		'pDebug', pDebug,
		'pSourceUser', pSourceUser,
		'pTargetType', pTargetType,
		'pTarget', pTarget,
		'pDelimiter', sDelimiter,
		'pOverwrite', pOverwrite,
		'pCube', cCubPkDim
    );
    ExecuteProcess( sThisProcName ,
		'pDoProcessLogging', pDoProcessLogging, 
		'pDebug', pDebug,
		'pSourceUser', pSourceUser,
		'pTargetType', pTargetType,
		'pTarget', pTarget,
		'pDelimiter', sDelimiter,
		'pOverwrite', pOverwrite,
		'pCube', cCubPkGeneral
    );
    
    DataSourceType = 'NULL';

ELSE;

    ######################
    ### If required perform zero out on the target cube using Bedrock process
    
    IF( pOverwrite @= '1' );
        sProc   = '}bedrock.cube.data.clear';
        sFilter = cAPQClients | sDelimEleStart | sTarget;
        
        ExecuteProcess(	sProc, 'pLogOutput', nDebug,
            'pCube', cCubTgt, 'pView', cViewClr, 'pFilter', sFilter,
            'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
            'pTemp', 1,
            'pCubeLogging', 0
        );
    EndIF;
    
    ######################
    ### Create the view to assign as data source for the process
    
    sProc   = '}bedrock.cube.view.create';
    sFilter = cAPQClients | sDelimEleStart | sSourceUser;
    # Adjust parameters for skipping of blanks / consols / rule calcs as required
    bSuppressNull   = 1;
    bSuppressC      = 1;
    bSuppressRule   = 1;
    ExecuteProcess( sProc,
        'pLogOutput', nDebug,
        'pCube', cCubSrc, 'pView', cViewSrc, 'pFilter', sFilter,
        'pSuppressZero', bSuppressNull, 'pSuppressConsol', bSuppressC, 'pSuppressRules', bSuppressRule,
        'pDimDelim', sDelimDim, 'pEleStartDelim', sDelimEleStart, 'pEleDelim', sDelimEle,
        'pTemp', 1
    );
    
    ######################
    ### If required switch transaction logging off (this should be done AFTER the escape/reject if parameters fail validation and BEFORE the zero out commences)
    
    CubeSetLogChanges( cCubTgt, 0 );
    
    ######################
    ### Assign data source
    
    DataSourceType          = 'VIEW';
    DataSourceNameForServer = cCubSrc;
    DatasourceCubeView      = cViewSrc;

EndIF;

######################
### END Prolog
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,52
##################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

######################
### Logging - common script

IF( pDoProcessLogging @= '1' );
  nDataRecordCount = nDataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Data.log';

######################
### Data script

IF( UPPER(pTargetType) @='USER' );
  IF ( CellIsUpdateable(cCubTgt, sTarget, vDimension, vMeasure ) =1 );
    CellPutS ( vValue, cCubTgt, sTarget, vDimension, vMeasure );
  EndIF;
ELSE;

  i = nAPQClientsSZ;
  WHILE ( i > 0);
    sEl = DIMNM ( cAPQClients, i);
    IF ( SCAN( sDelimiter | UPPER(sEl) | sDelimiter , sDelimiter | UPPER(sTarget) | sDelimiter ) >0 );
      IF ( CellIsUpdateable(cCubTgt, sEl, vDimension, vMeasure ) =1 );

        IF ( VALUE_IS_STRING=1 );
          CellPutS ( vValue, cCubTgt, sEl, vDimension, vMeasure );
        ELSE;
          CellPutN ( NValue, cCubTgt, sEl, vDimension, vMeasure );
        EndIF;
      EndIF;

    EndIF;
    i = i-1;
  END;

EndIF;


######################
### END Data
575,40
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

######################
### Reenable data transaction logging to the target cube

IF ( cCubSrc @<> '' );
   CubeSetLogChanges( cCubTgt, 1 );
EndIF;

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
