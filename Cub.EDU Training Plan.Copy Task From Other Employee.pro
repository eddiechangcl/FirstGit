601,100
602,"Cub.EDU Training Plan.Copy Task From Other Employee"
562,"NULL"
586,
585,
564,
565,"i_QifsVZlaanJQhpZ5ZFO\>Q7w=K7L>Y\1Kli99kY]D<Cf1gGRCpgED8saE4ifKFt5g_LEH\\@AUztAXlI2QiNp:bm]^KYjNbC1uHeQhalJd`wv;Z8d<l3iShmxb?fHIeu\wwhxN?Q1fZ3_tT2X^ifBcdIlu@VIeCy>7SG^@sYRH5F58GIDUKK^Z\cx[CG5gyx6Exig<"
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
571,
569,0
592,0
599,1000
560,2
pEmployeeSrc
pEmployeeTgt
561,2
2
2
590,2
pEmployeeSrc,""
pEmployeeTgt,""
637,2
pEmployeeSrc,"Employee Copy From?"
pEmployeeTgt,"Employee Copy To?"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,50
#****Begin: Generated Statements***
#****End: Generated Statements****

cEmployeeSrc   = pEmployeeSrc;
cEmployeeTgt   = pEmployeeTgt;

cCub           = 'EDU Training Plan';
cDimEmployee   = 'Employee';
cDimMeasure    = 'M Employee Training Plan';

sDelimDim      = '&';
sDelimEleStart = '¦';
sDelimEle      = '+';
sDelimMapping  = '->';

sFilter        = '';
sFilter        = sFilter | cDimEmployee | sDelimEleStart | cEmployeeSrc;
sFilter        = sFilter | sDelimDim | cDimMeasure | sDelimEleStart | 'Need Due Day' | sDelimEle | 'Days' | sDelimEle | 'Previous Task';

sMapping       = '';
sMapping       = sMapping | cDimEmployee | sDelimEleStart | cEmployeeSrc | sDelimMapping | cEmployeeTgt;



ExecuteProcess('}bedrock.cube.data.copy',
  'pLogOutput',0,
  'pStrictErrorHandling',0,
  'pCube', cCub,
  'pSrcView','',
  'pTgtView','',
  'pFilter', sFilter,
  'pFilterParallel','',
  'pParallelThreads',0,
  'pEleMapping', sMapping,
  'pMappingDelim', sDelimMapping,
  'pDimDelim', sDelimDim,
  'pEleStartDelim', sDelimEleStart,
  'pEleDelim', sDelimEle,
  'pFactor',1,
  'pSuppressConsol',1,
  'pSuppressRules',1,
  'pCumulate',0,
  'pZeroTarget',1,
  'pZeroSource',0,
  'pTemp',1,
  'pCubeLogging',0,
  'pSandbox','',
  'pFile',0,
  'pSubN',0,
  'pThreadMode',0);
573,2
#****Begin: Generated Statements***
#****End: Generated Statements****
574,2
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
