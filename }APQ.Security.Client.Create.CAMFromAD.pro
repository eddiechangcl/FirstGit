601,100
602,"}APQ.Security.Client.Create.CAMFromAD"
562,"CHARACTERDELIMITED"
586,"C:\TM1Models\Apliqode_Dev\SourceData\AD_Users.csv"
585,"C:\TM1Models\Apliqode_Dev\SourceData\AD_Users.csv"
564,
565,"vxjpky7[mLiYPrTK2n>nMAz]=oyBE]rF}ub4Usfd[su4=KKkPtSw<yk4<2d:jSKRKz]7Aef1nM6720SXNdP?lW?d]<>@ODu:VtuofBPu@hcP@k|79BTTzkZ1=[tNV9Ac:jvi75Lh??C0fTOHk3>DZ`r3IR=rl]vkS?^wUr5CsL?=xi57voGv=zQe]BC<enana\T\@oNuvxjpky7[mLiYPrTK2n>nMAt]=oyBE]rFsub4Usfd[su4=;BkPtSw<yk4<Bc8jS;RKz]gJef1nMF;20TXNdP?lW?d]<NIODu:Vtu?jBPu@hcP@k|D8BTTzkZ1=[tNVbLc:Juy55Lh??CPeTOHh3>4^`r3IR=rl]vkS?>pUr5MsL?=xj57voGv=JQe]BC<e~eNn\T\@oNu"
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
569,2
592,0
599,1000
560,6
pDoProcessLogging
pDebug
pType
pValue
pDomain
pUniqueID
561,6
2
2
2
2
2
2
590,6
pDoProcessLogging,"1"
pDebug,"0"
pType,"User"
pValue,""
pDomain,""
pUniqueID,"0"
637,6
pDoProcessLogging,"Optional: Record in process log"
pDebug,"Optional: Write debug log file?"
pType,"Required: Search User or add all from Group? (User/Group)"
pValue,"Required: UserID or Group Name"
pDomain,"Optional: Define AD Domain to search under (only if pType = User)"
pUniqueID,"Optional: Also create UniqueID property for user for compatibility with windows authentication (If =1 then pDomain must be supplied)"
577,3
vSamAccountName
vName
vObjectGUID
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,194
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
#Region @DOC
### PURPOSE:
###     Create CAMID elements in }Clients dimension based on Active Directory search with Windows Powershell
###     In a large corporate environment you may need to supply a domain to search for a user. If this is the case then pDomain should be 
###     in the form domain.ADcontroller e.g. EMEA.BigCorp.com
###     For smaller corporates you can just supply the name of the AD (mainly for use in creating uniqueID) e.g. Cubewise
#EndRegion @DOC
##############################################################################################################

##############################################################################################################
#Region - Initialize Logging
sThisProcName = GetProcessName(); sProcLogParams = '';
If( pDoProcessLogging @= '1' );
  cCubTgt='';sProcLogCube='}APQProcessExecutionLog';sCubLogCube='}APQCubeLastUpdatedbyProcess';nProcessStartTime=Now();nProcessFinishTime=0;nMetaDataRecordCount=0;nDataRecordCount=0;
  NumericGlobalVariable('PrologMinorErrorCount');PrologMinorErrorCount=0;NumericGlobalVariable('MetadataMinorErrorCount');MetadataMinorErrorCount=0;NumericGlobalVariable('DataMinorErrorCount');DataMinorErrorCount=0;NumericGlobalVariable('ProcessReturnCode');ProcessReturnCode=0;
  sProcessErrorLogFile='';sProcessRunBy=TM1User();If(DimIx('}Clients',sProcessRunBy)>0);sProcessRunBy=If(AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue')@='',sProcessRunBy,AttrS('}Clients',sProcessRunBy,'}TM1_DefaultDisplayValue'));EndIf;
  sLogYear=TimSt(nProcessStartTime,'\Y');sLogDay=TimSt(nProcessStartTime,'\m-\d');sLogMinute=TimSt(nProcessStartTime,'\h:\i');sLogSecond=TimSt(nProcessStartTime,'\s');If(DimIx('}APQProcesses',sThisProcName)=0);ExecuteProcess('}APQ.Dim.ControlDimensionCopies.Update','pDoProcessLogging',pDoProcessLogging,'pClear','0');EndIf;
  nProcessExecutionIndex=CellGetN(sProcLogCube,'TotalYears','TotalYear','TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;nProcessExecutionIntraDayIndex=CellGetN(sProcLogCube,sLogYear,sLogDay,'TotalDay','TotalMinute',sThisProcName,'nProcessStartedFlag')+1;
  sYear01=sLogYear;sYear02=sLogYear;sDay01=sLogDay;sDay02='D000';sMinute01=sLogMinute;sMinute02='TotalDayEntry';sSecond01=sLogSecond;sSecond02='LastEntry';nCountTime=1;nTotalLogTime=2;
  If(sProcLogParams@='');n=2;While(n<DimSiz('}APQProcessParameters')&DimIx('}APQProcesses',sThisProcName)<>0);sParam=CellGetS('}APQProcessParametersInfo',sThisProcName,DimNm('}APQProcessParameters',n),'Parameter');
  If(sParam@<>'');sProcLogParams=sProcLogParams|Expand('%sParam%:%'|Expand('%sParam%')|'%')|' & ';Else;n=DimSiz('}APQProcessParameters');EndIf;n=n+1;End;If(sProcLogParams@<>'');sProcLogParams=Subst(sProcLogParams,1,Long(sProcLogParams)-2);EndIf;EndIf;
  While(nCountTime<=nTotalLogTime);sLoggingYear=Expand('%sYear'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingDay=Expand('%sDay'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingMinute=Expand('%sMinute'|NumberToStringEx(nCountTime,'00','','')|'%');sLoggingSecond=Expand('%sSecond'|NumberToStringEx(nCountTime,'00','','')|'%');
  CellPutN(nProcessStartTime,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartTime');CellPutN(1,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessStartedFlag');
  CellPutN(nProcessExecutionIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIndex');CellPutN(nProcessExecutionIntraDayIndex,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'nProcessExecutionIntraDayIndex');
  CellPutS(sProcessRunBy,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sRunBy');nCountTime=nCountTime+1;If(sProcLogParams@<>'');CellPutS(sProcLogParams,sProcLogCube,sLoggingYear,sLoggingDay,sLoggingMinute,sLoggingSecond,sThisProcName,'sParams');EndIf;End;
  If(sProcLogParams@<>'');LogOutput('INFO', Expand('%sThisProcName% run with parameters %sProcLogParams%'));EndIf;
EndIf;If(CellGetN('}APQProcessParallelizationControl',sThisProcName,'Disabled')<>0);ProcessQuit;EndIf;
#EndRegion - Initialize Logging
##############################################################################################################
#EndRegion Header
##############################################################################################################

##############################################################################################################
#Region - Declare constants
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
sDelimList      = CellGetS( cCubParam, 'pDelim', 'String' );
sDelimDim       = CellGetS( cCubParam, 'pDimDelim', 'String' );
sDelimEleStart  = CellGetS( cCubParam, 'pEleStartDelim', 'String' );
sDelimEle       = CellGetS( cCubParam, 'pEleDelim', 'String' );
cDimTgt         = '}Clients';
cAliasNm        = '}TM1_DefaultDisplayValue';
cBedrockTmp     = 1;
nErr            = 0;
sErr            = '';

cUseCAM         = CellGetS( cCubParam, 'Use CAM', 'String' );
cNamespace      = CellGetS( cCubParam, 'Namespace', 'String' );
cADRSAT         = CellGetS( cCubParam, 'RSAT Installed', 'String' );
cType           = 'u';

cSrcFolder      = CellGetS( cCubParam, 'Location: Source Data', 'String' );
cSrcFile        = cSrcFolder | If( SubSt( cSrcFolder, Long(cSrcFolder), 1 ) @= '\', '', '\' ) | 'AD_Users.csv';

DatasourceASCIIDelimiter        = ',';
DatasourceASCIIQuoteCharacter   = '"';
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

#Is CAM enabled?
IF( cUseCAM @<> 'Y' );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'No CAM Authentication!';
EndIf;

#Is framework licensed?
If( CellGetN( cCubParam, 'Customer Name', 'Numeric' ) + CellGetN( cCubParam, 'Customer Key', 'Numeric' ) < 2 );
    nErr = nErr +1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Customer key not found!';
EndIf;

#Is pType populated?
IF( pType @<> 'User' & pType @<> 'Group' );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Invalid pType value:' | pType; 
EndIF;

#Is pName populated?
IF( pValue @= '' );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'Missing value in pValue'; 
EndIF;

#Is CAM Namespace populated?
IF( cNamespace @= '' );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @<> '', ' & ', '' ) | 'CAM Namespace value is not set!';
EndIF;

#Create UniqueID?
IF( pUniqueID @<> '1' % pDomain @= '' );
    pUniqueID = '0';
EndIF;

######################
### If parameters fail validation then set data source to NULL and either proceed to Epilog or quit process

IF( nErr > 0 );
    IF( pDebug @>= '1' );
        AsciiOutput( sDebugFile, sErr );
    EndIF;
    DataSourceType = 'NULL';
    ItemReject( sErr );
    ProcessQuit;
EndIF;

#Does alias exist?
If( DimIx( '}ElementAttributes_' | cDimTgt, cAliasNm ) = 0 );
    AttrInsert( cDimTgt, '', cAliasNm, 'A' );
EndIf;

#EndRegion - Test parameters
##############################################################################################################


##############################################################################################################
#Region - Define data source
### Create the view to assign as data source for the process

######################
### Generate source file

# Add WindowsFeature RSAT to connect to AD from PowerShell
IF( cADRSAT @<> 'Y');
  sSCRIPTAdd    = 'powershell -command "Add-WindowsFeature RSAT-AD-PowerShell"';
  ExecuteCommand( sSCRIPTAdd , 1 );
  CellPutS( 'Y', cCubParam, 'RSAT Installed', 'String' );
ENDIF;


IF( pType       @= 'User' );
  IF ( Scan( '.', pDomain ) = 0 );
    sCommand    = Expand('powershell -command "Get-ADUser ''%pValue%'' -Properties * | Select SamAccountName, Name, Objectguid | Export-csv -path ''%cSrcFile%''"');
  ELSE;
    sCommand    = Expand('powershell -command "Get-ADUser %pValue% -Server ''%pDomain%'' -Properties * | Select SamAccountName, Name, Objectguid | Export-csv -path ''%cSrcFile%''"');
  ENDIF;
ELSEIF (pType   @= 'Group');
    sCommand    = Expand('powershell -command "Get-ADGroupMember -Identity ''%pValue'' | Select SamAccountName, Name, Objectguid | Export-csv -path ''%cSrcFile%''"');
ENDIF;
ExecuteCommand( sCommand , 1);
######################

######################
### Assign data source
DataSourceType                 = 'CHARACTERDELIMITED';
DataSourceNameForServer        = cSrcFile;

#EndRegion - Define data source
##############################################################################################################

##############################################################################################################
### END Prolog
573,31
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
   nMetadataRecordCount = nMetadataRecordCount + 1;
EndIF;

sDebugFile = cDebugFile | '_Metadata.log';

######################
### Metadata script

# create userID based on the objectguid field in AD and the CAM Namespace
sID         = SubSt(vObjectguid, 7,2) | SubSt(vObjectguid, 5,2) | SubSt(vObjectguid, 3,2) | SubSt(vObjectguid, 1,2) | SubSt(vObjectguid, 12,2) | SubSt(vObjectguid, 10,2) | SubSt(vObjectguid, 17,2) | SubSt(vObjectguid, 15,2) | SubSt(vObjectguid, 20,4) | SubSt(vObjectguid, 25,12) ;
sCAMID      = Expand ('CAMID("%cNamespace%:%cType%:%sID%")');
AddClient(  sCAMID );

######################
### END Metadata
574,41
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

# derive userID and update friendly display name
sID         = SubSt(vObjectguid, 7, 2) | SubSt(vObjectguid, 5, 2) | SubSt(vObjectguid, 3, 2) | SubSt(vObjectguid, 1, 2) | SubSt(vObjectguid, 12, 2) | SubSt(vObjectguid, 10, 2) | SubSt(vObjectguid, 17, 2) | SubSt(vObjectguid, 15,2) | SubSt(vObjectguid, 20, 4) | SubSt(vObjectguid, 25, 12) ;
sCAMID      = Expand ('CAMID("%cNamespace%:%cType%:%sID%")');
sAliasVal   = cNamespace |'/'| vName;

AttrPutS( sAliasVal, cDimTgt, sCAMID, cAliasNm );

# derive UniqueID and apply
If( pUniqueID @= '1' );
    sUniqID = vSamAccountName |'@'| pDomain;
    If( CellIsUpdateable( '}ClientProperties', sCAMID, 'UniqueID' ) = 1 );
        CellPuts( sUniqID, '}ClientProperties', sCAMID, 'UniqueID' );
    EndIf;
EndIf;

######################
### END Data
575,33
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
