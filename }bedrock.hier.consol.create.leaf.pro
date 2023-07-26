601,100
602,"}bedrock.hier.consol.create.leaf"
562,"SUBSET"
586,"}Dimensions"
585,"}Dimensions"
564,
565,"yU4EAWaMoLIqMDU9G?5>Qq6iaaG[R`P<:lOWkp=Y;f?pZfDmBVcyFF0Y^FsZxnyvCnb=7wCVz>k^f=H0RPLLMeBDZB\ux7<`Q7>W>eXV4[XhP1MA6v5^nEFu`c>c@1fFAGxrYa;Wa=QpDo:YJP7JSh8MCh5zce7s:lu]L:EOk<eh\;;@b;wk?BYphcr5NWFd60l:?1AD"
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
560,5
pLogOutput
pDim
pHier
pConsol
pMemberConsol
561,5
1
2
2
2
2
590,5
pLogOutput,0
pDim,""
pHier,""
pConsol,""
pMemberConsol,""
637,5
pLogOutput,"Optional: write parameters and action summary to server message log (Boolean True = 1)"
pDim,"Required: Dimension"
pHier,"Optional: Hierarchy (will default to dimension name if blank)"
pConsol,"Consolidation Name"
pMemberConsol,"The element is a member of the consolidation."
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
572,124

#****Begin: Generated Statements***
#****End: Generated Statements****

### Start Prolog ###

################################################################################################# 
##~~Join the bedrock TM1 community on GitHub https://github.com/cubewise-code/bedrock Ver 4.0~~##
################################################################################################# 

### Global Variables
StringGlobalVariable('sProcessReturnCode');
NumericGlobalVariable('nProcessReturnCode');
nProcessReturnCode= 0;

### Constants ###
cThisProcName   = GetProcessName();
cUserName       = TM1User();
cTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
cRandomInt      = NumberToString( INT( RAND( ) * 1000 ));
cTempSub        = cThisProcName |'_'| cTimeStamp |'_'| cRandomInt;
cMsgErrorLevel  = 'ERROR';
cMsgErrorContent= 'User:%cUserName% Process:%cThisProcName% ErrorMsg:%sMessage%';
cLogInfo        = 'Process:%cThisProcName% run with parameters pDim:%pDim%, pHier:%pHier%, pConsol:%pConsol%, pMemberConsol:%pMemberConsol%.' ;  

## LogOutput parameters
IF( pLogoutput = 1 );
    LogOutput('INFO', Expand( cLogInfo ) );   
ENDIF;

### Validate Parameters ###
nErrors = 0;

IF( Trim( pDim ) @= '' );
  ## No dimension nominated.
  nErrors = 1;
  sMessage = 'No dimension specified.';
  ItemReject( sMessage );
EndIf;

IF( SUBST( pDim, 1, 1 ) @= '}' );
  ## Nominated dimension is a system dimension.
  nErrors = 1;
  sMessage = 'Can not modify a system dimension with this Bedrock.';
  ItemReject( sMessage );
EndIf;

If( DimensionExists( pDim) = 0 );
  ## Dimension does not exist in the model.
  nErrors = 1;
  sMessage = 'The dimension does not exist in the model: ' | pDim;
  ItemReject( sMessage );
EndIf;

## Validate hierarchy
 
IF( Trim( pHier  ) @= '' );
  pHier = pDim;
EndIf;

IF( HierarchyExists(pDim, pHier ) = 0 % pHier @= 'Leaves');
  nErrors = 1;
  sMessage = 'Invalid dimension Hierarchy: ' | pDim |':'|pHier;
  ItemReject( sMessage );
EndIf;

## Validate consolidation Parameter

pConsol = Trim( pConsol );

## Validate Member Consolidation
pMemberConsol = Trim( pMemberConsol );
IF( pMemberConsol @<> '' );
  ## A member consolidation has been nominated.
  IF(  ElementIndex( pDim, pHier, pMemberConsol ) = 0 );
  ## The Member Consolidation does not exist in the dimension.
    nErrors = 1;
    sMessage = 'The Member Consolidation does not exist in the model: ' | pMemberConsol;
    ItemReject( sMessage );
  ENDIF;
ENDIF;

If( pConsol @= '');
  ## No consolidation nominated, us default name.
  pConsol = 'Total Leaf Elements';
  sMessage = 'No Consolidation point nominated, using default consolidation "Total Leaf Elements".';
EndIf;

If(pConsol @= pMemberConsol);
  nErrors = 1;
  sMessage = 'Consolidation is same as Member consolidation: ' | pConsol |':'|pMemberConsol;
  ItemReject( sMessage );
Endif;

### Check for errors in Validate Parameters ###

If( nErrors <> 0 );
  ProcessBreak;
EndIf;

### UNWIND CONSOLIDATION ###
IF( 
ElementIndex( pDim, pHier, pConsol ) > 0 );
  ExecuteProcess('}bedrock.hier.unwind.consolidation'
  , 'pDim', pDim
  ,'pHier',pHier
  , 'pConsol', pConsol
  , 'pRecursive', 0
  );

Else;
  HierarchyElementInsert( pDim,pHier, '', pConsol, 'C' );

ENDIF;


### Assign Datasource ###

DatasourceNameForServer = pDim|':'|pHier;
DataSourceDimensionSubset = 'All';


### End Prolog ###

573,39

#****Begin: Generated Statements***
#****End: Generated Statements****

################################################################################################# 
##~~Join the bedrock TM1 community on GitHub https://github.com/cubewise-code/bedrock Ver 4.0.0~~##
################################################################################################# 

### Start Metadata ###

### VALIDATE RECORD ###

sElType = ElementType( pDim, pHier, vElement );
IF(
sElType @<> 'N' );
  ## The element is not a 'N' element.
  ITEMSKIP;
ENDIF;

IF( 
pMemberConsol @<> '' );
  ## A member consolidation is been used.
  IF(
  ElementIsAncestor( pDim, pHier, pMemberConsol, vElement ) = 0 );
  ## The element is not a member of the nominated consolidation.
    ITEMSKIP;
  ENDIF;
ENDIF;  


### BUILD CONSOLIDATION ###


If( nErrors = 0 );
  HierarchyElementComponentAdd( pDim, PHier, pConsol, vElement, 1 );
EndIf;


### End Metadata ###
574,4

#****Begin: Generated Statements***
#****End: Generated Statements****

575,25

#****Begin: Generated Statements***
#****End: Generated Statements****

################################################################################################# 
##~~Join the bedrock TM1 community on GitHub https://github.com/cubewise-code/bedrock Ver 4.0.0~~##
################################################################################################# 

### If errors occurred terminate process with a major error status ###
If( nErrors > 0 );
    sMessage = 'the process incurred at least 1 major error and consequently aborted. Please see above lines in this file for more details.';
    nProcessReturnCode = 0;
    LogOutput( cMsgErrorLevel, Expand( cMsgErrorContent ) );
    sProcessReturnCode = Expand( '%sProcessReturnCode% Process:%cThisProcName% aborted. Check tm1server.log for details.' );
    ProcessError;
EndIf;

### Return Code
sProcessAction      = Expand( 'Process:%cThisProcName% successfully created an element in the hierarchy.......' );
sProcessReturnCode  = Expand( '%sProcessReturnCode% %sProcessAction%' );
nProcessReturnCode  = 1;
If( pLogoutput = 1 );
    LogOutput('INFO', Expand( sProcessAction ) );   
EndIf;

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
