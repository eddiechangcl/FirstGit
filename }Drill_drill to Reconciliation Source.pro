601,100
602,"}Drill_drill to Reconciliation Source"
562,"VIEW"
586,"}APQ Reconciliation Check"
585,"}APQ Reconciliation Check"
564,
565,"l:J=OzVkvPsxaEo0H2^IWlsph;OXG=QQNGY8R]lq278>U1PMeheBav_Wo2:;yKkxFo^@Vc<rqgojq_<1AcjIaaENYCe;TTl8b]1GZQNQ8A9]M2pn\>6sozsq[HSQ9;W@3F92yHKAefoic1Q=@DbjiRYI6WUSz;A\_swKJ8`b0[l4]GVdLw>SzFwAYI7?rOGRdkcuVgh>"
559,1
928,1
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
570,Drill
571,
569,0
592,0
599,1000
560,3
pCube
pReconItem
pReconValue
561,3
2
2
2
590,3
pCube,"}APQ Reconciliation Check"
pReconItem,"Comparisons"
pReconValue,"Value"
637,3
pCube,"Source cube"
pReconItem,"Item"
pReconValue,"Measure"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,66
cView = '}z_Reconciliation_Drill_Source';
cSub = cView;

cReconCube = '}APQ Reconciliation Check';
cDimReconItem = '}APQ Reconciliation Item';
cDimReconMeasure = '}APQ Reconciliation Check Measure';

cDimDelim = cellgets('}APQ Settings', 'pDimDelim', 'String');
cEleStartDelim = cellgets('}APQ Settings', 'pEleStartDelim', 'String');

cPath = cellgets('}APQ Settings', 'Location: Debugging', 'String');
cDbgFile = cPath | '\' | GetProcessName() | '.txt';


sCubSrc = AttrS(cDimReconItem, pReconItem, 'Cube');
If( DimIx('}Cubes', sCubSrc)=1 % sCubSrc @= '');
  ProcessQuit;
EndIf;

# create view
If( ViewExists(sCubSrc, cView)=0);
  ViewCreate(sCubSrc, cView);
EndIf;

# Assign the dimensions to Title, Rows, Columns
i = 1;
sDim = TabDim(sCubSrc, i);
While( sDim @<>'' );

  sViewLocation = CellGetS('}APQ Reconciliation Setup Detail', pReconItem, sDim, 'Drill View Location');
  sSubset = CellGetS('}APQ Reconciliation Setup Detail', pReconItem, sDim, 'Drill Subset');
  
  ExecuteProcess('}bedrock.hier.sub.clone',
   'pLogOutput', 0,
   'pSrcDim', sDim,
   'pSrcHier', '',
   'pSrcSub', sSubset,
   'pTgtDim', sDim,
   'pTgtHier', '',
   'pTgtSub', cSub,
   'pTemp', 0
  );
  
  sEleDefa = CellGetS('}APQ Reconciliation Setup Detail', pReconItem, sDim, 'Element Used');
  If( SubsetElementExists(sDim, cSub, sEleDefa)=0);
    SubsetElementInsert(sDim, cSub, sEleDefa, 1);
  EndIf;
  
  ViewSubsetAssign( sCubSrc, cView, sDim, cSub );

  If( sViewLocation @= 'Row' );
    ViewRowDimensionSet(sCubSrc, cView, sDim, 1);
  ElseIf(sViewLocation @= 'Column' );
    ViewColumnDimensionSet(sCubSrc, cView, sDim, 1);
  Else;
    ViewTitleDimensionSet(sCubSrc, cView, sDim);
  EndIf;

  i = i + 1;
  sDim = TabDim(sCubSrc, i);
End;


ViewRowSuppressZeroesSet(sCubSrc, cView, 1);
ViewColumnSuppressZeroesSet(sCubSrc, cView, 1);

573,1

574,1

575,8
If(1=0);
#****Begin: Generated Statements***
ReturnViewHandle('}APQ Reconciliation Check','Drill');
#****End: Generated Statements****
EndIf;

RETURNVIEWHANDLE(sCubSrc, cView);

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
