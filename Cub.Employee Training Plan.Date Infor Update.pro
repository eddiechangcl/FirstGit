601,100
602,"Cub.Employee Training Plan.Date Infor Update"
562,"NULL"
586,
585,
564,
565,"r;dsa]3JB96w:j=W_baS>uxr@Dd29CDMz5f@XwnvjZ1MbbxZ:Z[JWt<rz_15=PVlTqX\`2tATu7Z[RD@NzT3x34?>o>cAh24OgRGywRwRjL<A^?nZ1DmE>8MaE?@2bxd?Cu3Xa`pBK^2e1xeb_Y;VO7kU9`p@qZ6G6>RFY[QpSkuW>aTvwmPaS6k`OjA\pe\YIAo]NWR"
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
569,0
592,0
599,1000
560,1
pEmployee
561,1
2
590,1
pEmployee,"Suzie Ho"
637,1
pEmployee,"Employee"
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


cCub         = 'EDU Training Plan';
cCubProfile = 'EDU Employee Profile';
cCubCalendar = 'Public Holiday Reference';
cCubTime     = 'Sys Time Attribute';
cDimEmployee = 'Employee';
cDimTDay     = 'Training Day';
cDimMeasure  = 'M Employee Training Plan';


cDimMeasure  = 'Date by Employee';


sEmployee    = pEmployee;
sStart       = CellGetS( cCubProfile, sEmployee, 'On Board Date' );
sRegion      = CellGetS( cCubProfile, sEmployee, 'Region' );

# Must have On Board Date
If ( sStart @= '' );
    ProcessBreak;
Endif;

# This is TI update Test

nDay = 1;
sDate = sStart;
While ( nDay <= 60 );
    # Get Next Day
    If ( nDay > 1 );
        sDate = CellGetS( cCubTime, sDate, 'T+1', 'yyyy-mm-dd' );
        sYear = Subst( sDate, 1, 4 );
        sDay  = Subst( sDate, 6, 5 );
        # Next Day should be public working day
        While ( CellGetN( cCubCalendar, sYear, sDay, sRegion, 'Working Day' ) = 0 );
            sDate = CellGetS( cCubTime, sDate, 'T+1', 'yyyy-mm-dd' );
            sYear = Subst( sDate, 1, 4 );
            sDay  = Subst( sDate, 6, 5 );
        End;
    Endif;
    sTDay = 'D' | NumberToStringEx( nDay, '00', '', '' );
    CellPutS( sDate, cCub, sTDay, sEmployee, 'Task Input', 'Date By Employee' );
    nDay = nDay + 1;
End;



573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
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
