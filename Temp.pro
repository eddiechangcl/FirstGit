601,100
602,"Temp"
562,"CHARACTERDELIMITED"
586,"C:\DBs\c000_standard_dev\source\Date.csv"
585,"C:\DBs\c000_standard_dev\source\Date.csv"
564,
565,"mVofnVdlqE[<KavPWp3BbytL8idGipJFktwtDV\sIuBxV>y?I3CVeLhwABB?ecIEP^`[wR\b@cY;ZfNbhz^XWOG7Nb41<NVqOFjK3=a9rDoMJL5hP>rD<]i``:V;=\yQ`kx^>Q`y`Xgh]Onjl>Mv6N:J<<3Y0ZOhS^H\k3wxMvZKMLqxSHj[ny:5CHf=K1e\WdtYC=Cc"
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
569,1
592,0
599,1000
560,0
561,0
590,0
637,0
577,4
vDateV
vDate
vMonth
vYear
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
572,7
#****Begin: Generated Statements***
#****End: Generated Statements****



cDim = 'Date';

573,15
#****Begin: Generated Statements***
#****End: Generated Statements****




If (vYear @= '2031');
  ItemSkip;
Endif;


If (Dimix (cDim, vDate) = 0);
    DimensionElementInsert(cDim, '', vDate, 'N');
    DimensionElementComponentAdd(cDim, vMonth, vDate, 1);
Endif;
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
