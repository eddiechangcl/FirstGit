601,100
602,"Cub.Sales Analysis.Copy to Next Cycle"
562,"VIEW"
586,"Sales Analysis"
585,"Sales Analysis"
564,
565,"da7VaCtxD@hU:_yY8FjgsgY8sTa6h5Ov`slWN7pLdXywm[@AFT?RTlP4X<zOFz]LSCljubZOlrIHhZT=Y2;WTZq]w:>3dHHnl`0grg3cjB19PF^dKwEtrN9OeClg4<jdK@nkBv>PFmCg3Ro?iv`@qcTdj46fcVTK4;YhC<_RK10iRHH1l^v[RCQ87cWQFe^KcmIFzR=0"
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
570,2. Rule for Stock
571,
569,0
592,0
599,1000
560,3
pYearFrom
pYearTo
pCustomer
561,3
2
2
2
590,3
pYearFrom,"2017"
pYearTo,"2018"
pCustomer,"W Hotels"
637,3
pYearFrom,"Year From"
pYearTo,"Year To"
pCustomer,"Choose Customer (Blank for all)"
577,10
vVersion
vCurrency
vLocation
vCustomer
vSKU
vMReference
vMSales
vYear
vPeriod
vValue
578,10
2
2
2
2
2
2
2
2
2
1
579,10
1
2
6
5
7
9
8
3
4
10
580,10
0
0
0
0
0
0
0
0
0
0
581,10
0
0
0
0
0
0
0
0
0
0
582,10
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
603,0
572,109
#****Begin: Generated Statements***
#****End: Generated Statements****

#Declare constants
cYearFrom = pYearFrom;
cYearTo = pYearTo;
cCustomer = pCustomer;
# all customers if null
IF (pCustomer @= '');
  cCustomer = 'All Customers';
Endif;

cCube = 'Sales Analysis';

cMeasureFrom = 'Stock Closing Units';
cMeasureTo = 'Stock Opening Units';


cMReference = 'Base Period';
cPeriodFrom = 'Dec';
cPeriodTo = 'Jan';

#cVersion = 'Forecast';

#Define views and subset
cProcess = GetProcessName();
cTime = TimSt(Now, '\Y\m\d\h\i\s');
cView = '{TI.' | cProcess | ' ' | cTime | '.' | Numbertostring( INT(Rand()*1000)) ;

cViewSrc = cView | '.Src';
cViewTgt = cView | '.Tgt';

nErr = 0;

#Define debug path and file name
cDebugPath = 'C:\DBs_EDU\cw_water_ori\';
cDebugFile = cDebugPath | 'Prolog Error.debug';

# Param validation
IF (dimix ('Year', cYearFrom) =0);
   SMsg1 = 'Invaild Year' | cYearFrom;
   nErr = 1;
Endif;

IF (dimix ('Year', cYearTo) =0);
   SMsg2 = 'Invaild Year' | cYearTo;
   nErr = 1;
Endif;


IF (nerr = 1);
  sMsg = sMsg1 | sMsg2 ;
  ASCIIOutput(cDebugFile, sMsg);
  ProcessBreak;
Endif;

  
# Creat source view
sFilter = 'Year ¦' | cYearFrom;

sFilter = sFilter | '&Period ¦' | cPeriodFrom;
sFilter = sFilter | '&Customer ¦' | cCustomer;
sFilter = sFilter | '&M Sales ¦' | cMeasureFrom;
sFilter = sFilter | '&M Reference ¦' | cMReference;

ExecuteProcess('}bedrock.cube.view.create',
   'pLogOutput', 0,
   'pCube', cCube,
   'pView', cViewSrc,
   'pFilter', sFilter,
   'pSuppressZero', 1,
   'pSuppressConsol', 1,
   'pSuppressRules', 0,
   'pDimDelim', '&',
   'pEleStartDelim', '¦',
   'pEleDelim', '+',
   'pTemp', 1,
   'pSubN', 0
  );

##Clear Targrt view
sFilter = 'Year ¦' | cYearTo;
sFilter = sFilter | '&Period ¦' | cPeriodTo;
sFilter = sFilter | '&Customer ¦' | cCustomer;
sFilter = sFilter | '&M Sales ¦' | cMeasureTo;
sFilter = sFilter | '&M Reference ¦' | cMReference;

ExecuteProcess('}bedrock.cube.data.clear',
   'pLogOutput', 0,
   'pCube', cCube,
   'pView', cViewTgt,
   'pFilter', sFilter,
   'pFilterParallel', '',
   'pParallelThreads', 0,
   'pDimDelim', '&',
   'pEleStartDelim', '¦',
   'pEleDelim', '+',
   'pCubeLogging', 0,
   'pTemp', 1,
   'pSandbox', ''
  );

DataSourceType = 'VIEW';
DataSourceNameForServer = cCube;
DatasourceCubeView = cViewSrc;
ViewExtractSkipCalcsSet(cCube, cViewSrc, 1);
ViewExtractSkipRuleValuesSet(cCube, cViewSrc, 0);
ViewExtractSkipZeroesSet(cCube, cViewSrc, 1);

573,2
#****Begin: Generated Statements***
#****End: Generated Statements****
574,16
#****Begin: Generated Statements***
#****End: Generated Statements****


IF (vMSales @= 'Stock Opening Units'); 
    CellIncrementN(vValue, cCube, vVersion, vCurrency, cYearTo, cPeriodTo, vCustomer, vLocation, vSKU, cMeasureTo, cMReference);
Endif;

IF (vMSales @= 'Purchase Units'); 
    CellIncrementN(vValue, cCube, vVersion, vCurrency, cYearTo, cPeriodTo, vCustomer, vLocation, vSKU, cMeasureTo, cMReference);
Endif;

IF (vMSales @= 'Sales Units'); 
    CellIncrementN(-vValue, cCube, vVersion, vCurrency, cYearTo, cPeriodTo, vCustomer, vLocation, vSKU, cMeasureTo, cMReference);
Endif;

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
