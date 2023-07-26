601,100
602,"Dimension Clone with attr"
562,"VIEW"
586,"}ElementAttributes_Period"
585,"}ElementAttributes_Period"
564,
565,"m1Vnr2iAmN=h]a_=P2MOpBn6eO7Yuij:a8ExGBiiPAa`<6dZUyBO1Q]214okutJzutH2OFmcvXQl3^h;e?IskT76ICdyA=r7G4]3iO1AN0[CDeBUbWNZu]5]AuWT1j[sCkqEQ<y7QJijSipDi6cEDA[=4u@0Lz8ygL^F5t9ag^QLiRGHgtZv>rB=t25Z>ZB:miyW[0c9"
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
560,3
pDimFrom
pDimTo
pNode
561,3
2
2
2
590,3
pDimFrom,"Period"
pDimTo,"Period1"
pNode,""
637,3
pDimFrom,"Dimension to be copied"
pDimTo,"New Dimension"
pNode,"Node?"
577,3
vDimFrom
vElementAttributes
vValue
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
572,67
#****Begin: Generated Statements***
#****End: Generated Statements****

# Declare constants
cDimFrom = pDimFrom;
cDimTo = pDimTo;
cNode = pNode;

cCubeFrom = '}ElementAttributes_' | cDimFrom;
cCubeTo = '}ElementAttributes_' | cDimTo;

cProcess = GetProcessName();
cTime = TimSt(Now, '\Y\m\d\h\i\s');

cSub = '{TI.' | cProcess | ' ' | cTime | '.' | Numbertostring( INT(Rand()*1000)) ;
cViewFrom = cSub;
cViewTo = cSub;

nErr = 0;

cDebugPath = 'C:\DBs_EDU\cw_water_ori\';
cDebugFile = cDebugPath | 'Prolog Error1.debug';

#Param validation
IF (DimensionExists(cDimFrom) = 0);
  nErr = 1;
  sErr = 'Source not found' |cDimFrom;
  ASCIIOutput(cDebugFile, sErr);
Endif;

IF (cDimFrom @= cDimTo);
  nErr = 1;
  sErr = 'Source target dimension the same';
  ASCIIOutput(cDebugFile, sErr);
Endif;

IF (nErr > 0);
  ProcessBreak;
Endif;

#Create view
While (viewExists (cCubeFrom, cViewFrom) >0);
  cViewFrom = 'TI.' | cProcess | ' ' | cTime | '.' | Numbertostring( INT(Rand()*1000)) ;
End;

IF (ViewExists(cCubeFrom, cViewFrom) = 1);
    ViewDestroy(cCubeFrom, cViewFrom);
Endif;

ViewCreate(cCubeFrom, cViewFrom);

#Define MDX with node
sMdx = '{Descendants (['|cDimFrom|'].['|cNode|'])}';

IF (SubsetExists(cDimFrom, cSub) > 0);
  SubsetDestroy(cDimFrom, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMdx, cDimFrom);
ViewSubsetAssign(cCubeFrom, cViewFrom, cDimFrom, cSub);

DataSourceType = 'VIEW';
DataSourceNameForServer = cCubeFrom;
DatasourceCubeView = cViewFrom;
ViewExtractSkipCalcsSet(cCubeFrom, cViewFrom, 1);
ViewExtractSkipRuleValuesSet(cCubeFrom, cViewFrom, 1);
ViewExtractSkipZeroesSet(cCubeFrom, cViewFrom, 1);

573,4
#****Begin: Generated Statements***
#****End: Generated Statements****


574,4
#****Begin: Generated Statements***
#****End: Generated Statements****

CellPutS(vValue, cCubeTo, vDimFrom, vElementAttributes);
575,10
#****Begin: Generated Statements***
#****End: Generated Statements****

If (ViewExists(cCubeFrom, cViewFrom) >0);
    ViewDestroy(cCubeFrom, cViewFrom);
Endif;

IF (SubsetExists(cDimFrom, cSub) > 0);
  SubsetDestroy(cDimFrom, cSub);
Endif;
576,
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
