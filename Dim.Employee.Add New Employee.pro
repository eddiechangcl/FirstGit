601,100
602,"Dim.Employee.Add New Employee"
562,"NULL"
586,
585,
564,
565,"vA6J_X:R]5lh]?mxF=R_7PaEfV<`d`0^WCg_IWjHk6mb1WxfQl>?Q94V@l29deD0H=3YyUA4:jEhW2T=FPzOVzuT;`2l3kkMxTnc4W1_?OTvprwn[9SIZx;mz8E83CbA7y5GgaSGOhB3<J0V[Six5>ymAXHgRHPX21>vpHgwRaSpB>Mk0<GIC7JrS@76c7ag`bDfSJgo"
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
560,4
pEmployee
pDateOnBoard
pRegion
pMentor
561,4
2
2
2
2
590,4
pEmployee,""
pDateOnBoard,""
pRegion,""
pMentor,""
637,4
pEmployee,"Employee Name?"
pDateOnBoard,"On Board Date? (yyyy-mm-dd)"
pRegion,"Region? (TW/CN?)"
pMentor,"Mentor? (Optional)"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,12
#****Begin: Generated Statements***
#****End: Generated Statements****


cDimEmployee  = 'Employee';
cCub          = 'EDU Employee Profile';

If ( DimIx( cDimEmployee, pEmployee ) = 0 );
    DimensionElementInsert( cDimEmployee, '', pEmployee, 'N' );
Endif;


573,2
#****Begin: Generated Statements***
#****End: Generated Statements****
574,2
#****Begin: Generated Statements***
#****End: Generated Statements****
575,26
#****Begin: Generated Statements***
#****End: Generated Statements****


If ( pDateOnBoard @<> '' );
    CellPutS( pDateOnBoard, cCub, pEmployee, 'On Board Date' );
Endif;

If ( pRegion @<> '' );
    CellPutS( pRegion, cCub, pEmployee, 'Region' );
Endif;

If ( pMentor @<> '' );
    CellPutS( pRegion, cCub, pEmployee, 'Mentor' );  
Endif;

# Copy From Other User
ExecuteProcess('Cub.EDU Training Plan.Copy Task From Other Employee',
  'pEmployeeSrc', 'Young Yang',
  'pEmployeeTgt', 'Template' );
  
  
# Udpate Date Infor
ExecuteProcess( 'Cub.Employee Training Plan.Date Infor Update',
  'pEmployee', pEmployee );

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
