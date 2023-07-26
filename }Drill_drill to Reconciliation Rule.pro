601,100
602,"}Drill_drill to Reconciliation Rule"
562,"VIEW"
586,"}APQ Reconciliation Check"
585,"}APQ Reconciliation Check"
564,
565,"dqW4a[73iDYs2]6TfNCI_=N[pN\g?VzMbtBiWO<HR<mVnRz\b0TmlMsuaWwaXcM2<7tzX]o^Rn^QSqzYo9Jo_bwuv06@>]kNAJjmjct50>h^:SHG=bH[[b0FAnPNupV9s=E?TpdPH5BV[O=MZ@0eAnMP?Fc>[?Gtz?9ToshsB>@0OT]1NTSkpykc3kdMX0Vdnn^f1v]Y"
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
pCube,""
pReconItem,""
pReconValue,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,43
cView = '}z_Reconciliation_Drill_Rule';
cSub = cView;

cReconCube = '}APQ Reconciliation Check';
cDimReconItem = '}APQ Reconciliation Item';
cDimReconMeasure = '}APQ Reconciliation Check Measure';

if(ViewExists(cReconCube, cView)=1);
  ViewDestroy(cReconCube, cView);
EndIf;
ViewCreate(cReconCube, cView);

# Read rules
cR1=AttrS(cDimReconItem, pReconItem, 'Reference');
cR2=AttrS(cDimReconItem, pReconItem, 'Comparison');

# Create subsets/view: rules in rows, measures in columns
if(SubsetExists(cDimReconItem, cSub)=1);
  SubsetDeleteAllElements(cDimReconItem, cSub);
Else;
  SubsetCreate(cDimReconItem, cSub);
EndIf;
SubsetElementInsert(cDimReconItem, cSub, cR1, 1);
SubsetElementInsert(cDimReconItem, cSub, cR2, 2);

ViewSubsetAssign(cReconCube, cView, cDimReconItem, cSub);
ViewRowDimensionSet(cReconCube, cView, cDimReconItem, 1);
ViewRowSuppressZeroesSet(cReconCube, cView, 1);

if(SubsetExists(cDimReconMeasure, cSub)=1);
  SubsetDeleteAllElements(cDimReconMeasure, cSub);
Else;
  SubsetCreate(cDimReconMeasure, cSub);
EndIf;
SubsetElementInsert(cDimReconMeasure, cSub, 'Description', 1);
SubsetElementInsert(cDimReconMeasure, cSub, 'Live-Static Delta', 2);
SubsetElementInsert(cDimReconMeasure, cSub, 'Value', 3);
SubsetElementInsert(cDimReconMeasure, cSub, 'Static', 4);
SubsetElementInsert(cDimReconMeasure, cSub, 'Known Variance', 5);

ViewSubsetAssign(cReconCube, cView, cDimReconMeasure, cSub);
ViewColumnDimensionSet(cReconCube, cView, cDimReconMeasure, 1);

573,1

574,1

575,7
If(1=0);
#****Begin: Generated Statements***
ReturnViewHandle('}APQ Reconciliation Check','Drill');
#****End: Generated Statements****
EndIf;

RETURNVIEWHANDLE(cReconCube, cView);
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
