601,100
602,"}bedrock.security.clientgroupsetup"
562,"NULL"
586,
585,
564,
565,"q;ogvAvnf\w`TWlYsyr4uhpn7KP>Np0@1q=:f\ovZcPdI:0lFuex\ezv;>VAq_rTOu2{498kSKl=3U0_?V<n<nzmABZwMk?^7j49}YJ[ti_ACdSHSBlL8pqr^_ZCKSH2gHIs`N59[djoY=Z#_nM7=eZik^peYp\LjcxE82E50^`gxDcueenVFVBkm\sAj({borfU==6L"
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
560,6
pLogOutPut
pClients
pGroups
pPassword
pMaxPorts
pDelim
561,6
1
2
2
2
1
2
590,6
pLogOutPut,0
pClients,""
pGroups,""
pPassword,""
pMaxPorts,5
pDelim,"&"
637,6
pLogOutPut,"Optional: write parameters and action summary to server message log (Boolean True = 1)"
pClients,"Required: List of Clients Seperated by Delimiter"
pGroups,"Required: List of Groups Seperated by Delimiter"
pPassword,"Required: Initial Password"
pMaxPorts,"Optional: Maximum Ports"
pDelim,"Optional: Delimiter Character"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,57

#****Begin: Generated Statements***
#****End: Generated Statements****

################################################################################################# 
##~~Join the bedrock TM1 community on GitHub https://github.com/cubewise-code/bedrock Ver 4.0~~##
################################################################################################# 

# This process will create a client with full setup

##Global Variables
StringGlobalVariable('sProcessReturnCode');
NumericGlobalVariable('nProcessReturnCode');
nProcessReturnCode= 0;

### Call processes to add clients and assign client to groups ###


IF ( pLogOutPut >= 1);

ExecuteProcess( '}bedrock.security.client.create',
  'pLogOutPut', 1,
  'pClients', pClients,
  'pPassword', pPassword,
  'pDelim', pDelim
);

ExecuteProcess( '}bedrock.security.client.group.assign',
  
  'pClients', pClients,
  'pGroups', pGroups,
  'pDelim', pDelim,
  'pMode', 'Add',
  'pSecurityRefresh', 'No'
);

ELSE;

ExecuteProcess( '}bedrock.security.client.create',
  'pLogOutPut', 0,
  'pClients', pClients,
  'pPassword', pPassword,
  'pDelim', pDelim
);

ExecuteProcess( '}bedrock.security.client.group.assign',
  
  'pClients', pClients,
  'pGroups', pGroups,
  'pDelim', pDelim,
  'pMode', 'Add',
  'pSecurityRefresh', 'No'
);  

ENDIF;
  
### End Prolog ###
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,12

#****Begin: Generated Statements***
#****End: Generated Statements****

################################################################################################# 
##~~Join the bedrock TM1 community on GitHub https://github.com/cubewise-code/bedrock Ver 4.0~~##
################################################################################################# 

sProcessReturnCode = pClients|':'|pGroups;

### End Epilog ###

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
917,1
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
