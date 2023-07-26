601,100
602,"Dimension Clone"
562,"SUBSET"
586,"Period"
585,"Period"
564,
565,"i`Zo>b0XMaCTDy86Y\4U:MPS`^FJBrMQwANx[RH]A529:[3kMY0gMUeN7E5T`\;b]Y]p8OE;9aVNHsu;RU^e^nLieK_XGZ_qsr2GXm2VksTofc2jiAhh\AgoAntnDj>o[WeCTz<DMtM?Ts2>5XI98VdEVK1kX_p4`H1d0V9sdQ1XSj:?>]K[Bm:JHn^6\Ao1sEt`dD`U"
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
pNode,"Node to copy"
577,1
vEle
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
572,90
#****Begin: Generated Statements***
#****End: Generated Statements****

# Declare constants
cDimFrom = pDimFrom;
cDimTo = pDimTo;
cNode = pNode;

cProcess = GetProcessName();
cTime = TimSt(Now, '\Y\m\d\h\i\s');

cSub = '{TI.' | cProcess | ' ' | cTime | '.' | Numbertostring( INT(Rand()*1000)) ;


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

#Define MDX with node
sMdx = '{Descendants (['|cDimFrom|'].['|cNode|'])}';

IF (SubsetExists(cDimFrom, cSub) > 0);
  SubsetDestroy(cDimFrom, cSub);
Endif;
SubsetCreatebyMDX(cSub, sMdx, cDimFrom, 1);

DataSourceType = 'SUBSET';
DataSourceNameForServer = cDimFrom;
DatasourceDimensionSubset = cSub;

### Method 1 with node without bedrock
## check target dim existence
#IF (DimensionExists(cDimTo) = 0);
#  DimensionCreate(cDimTo);
#Else;
#  #node rewind first
#  IF (DimIx(cDimTo, cNode) > 0);
#    nChild = ElCompN(cDimto, cNode);
#    While (nChild > 0);
#      sChild = ElComp(cDimTo, cNode , nChild);
#      #Rewind all children
#      sChildv1 = sChild;
#      nChildv1 = ElCompN(cDimTo , sChildv1);
#      While (nChildv1 >0 );
#        sChildv2 = ElComp(cDimTo, sChildv1, nChildv1);
#        DimensionElementComponentDelete(cDimTo, sChildv1, sChildv2);
#        nChildv1 = nChildv1 -1;
#      End;
#      DimensionElementComponentDelete(cDimTo, cNode, sChildv1);
#      nChild = nChild - 1;
#    End;
#  Endif;
#Endif;


### Method 2 with node bedrock
# check target dim existence
IF (DimensionExists(cDimTo) = 0);
  DimensionCreate(cDimTo);
Else;
  IF (DimIx(cDimTo, cNode) > 0);
    #bedrock method
    ExecuteProcess('}bedrock.hier.unwind',
       'pLogOutput', 0,
       'pDim', cDimTo,
       'pHier', cDimTo,
       'pConsol', cNode,
       'pRecursive', 1,
       'pDelim', '&'
      );
  Endif;
Endif;
573,21
#****Begin: Generated Statements***
#****End: Generated Statements****

sType = Dtype (cDimFrom, vEle);

DimensionElementInsert (cDimTo, '', vEle, sType);

If (sType @= 'C');
  # start from 1, make sure the order is corrent
  nStart = 1;
  nChild = ElCompN(cDimFrom, vEle);
  While (nstart <= nChild );
    sChild = ElComp(cDimFrom, vELe, nStart);
    nWeight = ElWeight(cDimFrom, vEle, sChild);
    sType = DType(cDimFrom, sChild);
    # IF the child is C level
    DimensionElementInsert(cDimTo, '', sChild, sType);
    DimensionElementComponentAdd(cDimto, vEle, sChild, nWeight);
    nStart = nStart + 1;
  End;
Endif;
574,4
#****Begin: Generated Statements***
#****End: Generated Statements****


575,2
#****Begin: Generated Statements***
#****End: Generated Statements****
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
