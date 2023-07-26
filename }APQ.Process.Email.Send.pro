601,100
602,"}APQ.Process.Email.Send"
562,"NULL"
586,
585,
564,
565,"k<vsHyAtReca4CloYNlXQtiYDyQ:N;>V]XK_9lz8taUEol0x1_UIWfADfRc^N`z;tpHg^2\gTy5xA;73y?u98b<f?[u3_7rI[GVo`PKb:>RTgjdsAmIL[Ri\6LU4v7i0CpDFN^Ytgqq:A006xnGPDo><YES[4saZoJTDmwkXW8QmLwCfDE2Jmvk5;YuPNh`2<3ABZjzq"
559,0
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,2
Select	*
From 	[].[];
567,","
588,"."
589,","
568,""""
570,
571,All
569,0
592,0
599,1000
560,7
pDoProcessLogging
pTo
pFrom
pSubject
pBody
pAttach
pDebug
561,7
2
2
2
2
2
2
2
590,7
pDoProcessLogging,"1"
pTo,""
pFrom,""
pSubject,""
pBody,""
pAttach,""
pDebug,"0"
637,7
pDoProcessLogging,"Log to the process logging cube"
pTo,"List of email recipients (comma separated)"
pFrom,"From address"
pSubject,"Email subject line (if contains a space then enclosing quotes automatically added)"
pBody,"Email body text (if contains a space then enclosing quotes automatically added)"
pAttach,"Path and file name(s) of binary files (comma separated if multiple. Iif path or file name contains a space then enclosing quotes automatically added)"
pDebug,"Debug 0=false 1=true"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,355
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Purpose:
### To send an email via powershell command line interface
### email command (Send-MailMessage), server, port, user and pasword, usage of SSL are configured in }APQ Settings
### to, from & subject must be supplied.  Body & attachments are optional.
### 
##############################################################################################################
### Logging - common script 	-----------------  START
sThisProcName = GetProcessName();
### Params
# As body could be quite long and attachment is binary file omit these params
sProcLogParams = 'pTo:' | pTo |' & '| 'pFrom:' | pFrom |' & '| 'pSubject:' | pSubject |' & '| 'pDebug:' | pDebug;
### Params
IF( pDoProcessLogging @= '1' ); IF( sProcLogParams @<> '' ); LogOutput( 'INFO', sThisProcName | ' run with parameters ' | sProcLogParams ); EndIF;
  cCubTgt = ''; sProcLogCube = '}APQ Process Execution Log'; sCubLogCube = '}APQ Cube Last Updated by Process'; nProcessStartTime = Now(); nProcessFinishTime = 0; nMetaDataRecordCount = 0; nDataRecordCount = 0;
  NumericGlobalVariable( 'PrologMinorErrorCount' );  PrologMinorErrorCount = 0; NumericGlobalVariable( 'MetadataMinorErrorCount' );  MetadataMinorErrorCount = 0; NumericGlobalVariable( 'DataMinorErrorCount' );  DataMinorErrorCount = 0; NumericGlobalVariable( 'ProcessReturnCode' );  ProcessReturnCode = 0;
  sProcessErrorLogFile = ''; sProcessRunBy = TM1User(); IF( DimIx( '}Clients', sProcessRunBy ) > 0 ); sProcessRunBy = IF( AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) @= '', sProcessRunBy, AttrS( '}Clients', sProcessRunBy, '}TM1_DefaultDisplayValue' ) ); EndIF;
  sLogYear = TimSt( nProcessStartTime, '\Y' ); sLogDay = TimSt( nProcessStartTime, '\m-\d' ); sLogMinute = TimSt( nProcessStartTime, '\h:\i' ); sLogSecond = TimSt( nProcessStartTime, '\s' ); IF( DimIx( '}APQ Processes', sThisProcName ) = 0 ); ExecuteProcess( '}APQ.Dim.ControlDimensionCopies.Update', 'pDoProcessLogging', pDoProcessLogging, 'pClear', '0' ); EndIF;
  nProcessExecutionIndex = CellGetN( sProcLogCube, 'Total APQ Time Year', 'Total Year', 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1; nProcessExecutionIntraDayIndex = CellGetN( sProcLogCube, sLogYear, sLogDay, 'Total Day', 'Total Minute', sThisProcName, 'nProcessStartedFlag' ) + 1;
  sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While ( nCountTime <= nTotalLogTime ); sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessStartTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessStartedFlag' );
  CellPutN( nProcessExecutionIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIndex' ); CellPutN( nProcessExecutionIntraDayIndex, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessExecutionIntraDayIndex' );
  CellPutS( sProcessRunBy, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sRunBy' ); CellPutS( sProcLogParams, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sParams' ); nCountTime = nCountTime + 1; End;
EndIF; IF( CellGetN( '}APQ Process Parallelization Control', sThisProcName, 'Disabled' ) <> 0 ); ProcessQuit; EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### Prolog script commences

### Inits - declare constants

cCubInfo        = '}APQ Settings';
cDebugDir       = CellGetS( cCubInfo, 'Location: Debugging', 'String' );
cDebugDir       = cDebugDir | IF( SubSt( cDebugDir, Long( cDebugDir ) , 1 ) @= '\', '', '\' );
cTimeStamp      = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugFile      = cDebugDir | GetProcessName() | '.' | cTimeStamp | '.Debug';
cBatchPath      = CellGetS( cCubInfo, 'Location: Scripts', 'String' );
cEmailExe       = CellGetS( cCubInfo, 'Location: Blat', 'String' );
cUsePowerShell  = CellGetS( cCubInfo, 'smtp Use PowerShell', 'String' );
cEmailSvr       = CellGetS( cCubInfo, 'smtp server:port', 'String' );
cEmailUsr       = CellGetS( cCubInfo, 'smtp User', 'String' );
cEmailPwd       = CellGetS( cCubInfo, 'smtp Pwd', 'String' );

### POWERSHELL: We need to separate SMTP server address from port
cSMTPServer     = SUBST( cEmailSvr, 1, SCAN(':', cEmailSvr) - 1 );
cSMTPPort       = SUBST( cEmailSvr, SCAN(':', cEmailSvr) + 1, Long(cEmailSvr) );

### POWERSHELL: We need to determine whether to use SSL or not
cUseSSL         = UPPER( CellGetS( cCubInfo, 'smtp Use SSL', 'String') );
If( cUseSSL @<> 'Y');
 cUseSSL        = 'N';
EndIf;

### POWERSHELL: We will set default port settings if they are not defined based on Use SSL parameter
If( cSMTPPort @= '' );
  cSMTPPort     = If( cUseSSL @= 'Y', '587', '25' );
  LogOutput( 'INFO', Expand( 'SMTP Port is not specified in }APQ Settings, defaulting to %cSMTPPort% ()' ) );
Endif;

### POWERSHELL: Allowed delimiter for output parameter strings after tokenization of recipient and attachment lists
cMailDelim      = ',';
### POWERSHELL: Recognized delimiters for input parameters pTo and pAttach
cDelimiters     = ',;';

bAnon           = 0;
nRet            = 0;
nErr            = 0;
sErr            = '';

# Take default email address from }APQ Settings if parameters not provided.
If( Trim(pTo) @= '' );
  pFrom = CellGetS('}APQ Settings', 'Email: To', 'String');
EndIf;

If( Trim(pFrom) @= '' );
  pFrom = CellGetS('}APQ Settings', 'Email: From', 'String');
EndIf;


### Initialise Debug ###

If( pDebug @>= '1' );
  DatasourceASCIIQuoteCharacter = '';

  # Set debug file name
  sDebugFile = cDebugFile | '.Prolog.txt';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, CellGetS('}APQ Settings', 'Date Time format','String') ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: ' );
  AsciiOutput( sDebugFile, 'pTo: ' | pTo);
  AsciiOutput( sDebugFile, 'pFrom: ' | pFrom );
  AsciiOutput( sDebugFile, 'pSubject: ' | pSubject );
  AsciiOutput( sDebugFile, 'pBody: ' | pBody );
  AsciiOutput( sDebugFile, 'pAttach: ' | pAttach );
  AsciiOutput( sDebugFile, '' );

EndIf;

### BLAT: Test settings
IF(cUsePowerShell @<> 'Y');
  ### Test e-mail program
  IF( FileExists( cEmailExe ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Email program not found: ' | cEmailExe;
  Else;
    IF( Scan( ' ', cEmailExe ) > 0 );
      cEmailExe = '"' | cEmailExe | '"';
    EndIF;
  EndIF;
  IF( Scan( '.',  cEmailSvr ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid IP address for email server: ' | cEmailSvr;
  EndIF;

  IF( nErr > 0 );
    If( pDebug @>= '1' );
      AsciiOutput( sDebugFile, '' );
      AsciiOutput( sDebugFile, sErr );
    EndIf;
    ItemReject( sErr );
  EndIF;

  # Anon email access may be allowed, we don't need to validate user and pwd but check whether to add to cmd string
  IF( cEmailUsr @= '' );
    bAnon = 1;
  EndIF;

  ### Test parameters
  ### To, From & Subject or Body are required

  IF( Scan( '@',  pTo ) = 0 );
    nErr = nErr + 1;
    sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid To parameter: ' | pTo;
  EndIF;
Else;
  ### POWERSHELL: Test settings, parse mail Recipient List and Attachment List

  ### Process Recipient List - transform list of mail addresses to PS accepted format
  ### Accepted input format is: name1@server ([,|;] nameN@server)* Example: name1@serve1; name2@server
  ### Generated output format is: name1@server(,nameN@server)* Example: 'name1@server','name2@server'

  ### Insert apostrophe when token starts
  nApostropheInsert = 1;
  ### Token counters init
  nToken = 0;
  sToken = '';
  ### Input list of recipients
  sRecipients = pTo;
  ### Output list of recipients in PS format
  sMailRecipients = '';
  ### Char counter
  nIndex = 1;
  ### Length of input string to tokenize
  nLen = Long( sRecipients );
  ### Insert apostrophe when token starts
  nApostropheInsert = 1;
  ### Check there is AT sign in the token
  nAtSignFound = 0;

  ### Scan the string of addresses and tokenize based on allowed mail address separators (,;) while ignoring whitespaces
  ### Check e-mail address correctness by checking AT sign presence in each token
  ### Replace allowed mail address separators by standard separator (,)
  ### Add apostrophes so that every token is enclosed
  While ( nIndex <= nLen );
    sChar = SubSt( sRecipients, nIndex, 1 );
    ### Ignore whitespace always
    If( sChar @<> ' ' );
      ### Token beginning
      If( nApostropheInsert = 1 );
        sMailRecipients = sMailRecipients | '''';
        nApostropheInsert = 0;
        nToken = nToken + 1;
        sToken = sChar;
      Endif;
      ### Token ending by delimiters or end of string
      If( SCAN( sChar, cDelimiters ) <> 0 % nIndex = nLen );
        ### When inside token: Append apostrophe and delimiter
        ### When end of string: Append last character read and apostrophe
        sMailRecipients = sMailRecipients | ( If( nIndex <> nLen, '''' | cMailDelim, sChar | '''' ) );
        ### Token finished, check for AT sign presence
        If ( nAtSignFound = 0 );
          nErr = nErr + 1;
          sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Error in recipient e-mail address (token number ' | NumberToString(nToken) | '), parsed e-mail address ' | sToken;
        EndIF;
        nApostropheInsert = 1;
        nAtSignFound = 0;
      Else;
        sMailRecipients = sMailRecipients | sChar;
        ### Replace nAtSignFound flag only if we find AT sign, otherwise keep what is in the flag now
        nAtSignFound = MAX( nAtSignFound, SCAN( '@', sChar ) );
        sToken = sToken | sChar;
      Endif;
    Endif;
    nIndex = nIndex + 1;  
  End;

  ### Process Attachment List - transform list of mail attachments to PS accepted format
  ### Accepted input format is: file1 ([,|;] fileN)* Example: file1; file2
  ### Generated output format is: 'file1'(, 'fileN')* Example: 'file1','file2'

  ### Scan the string of attachments and tokenize based on allowed separators (,;) while ignoring whitespaces.
  ### Replace allowed separators by standard separator (,)
  ### Add apostrophes so that every token is enclosed.
  ### Check that attachment exists on the filesystem.
  sMailAttachments = '';
  sAttachments = pAttach;
  nIndex = 1;
  nLen = Long( sAttachments );
  sToken = '';
  nToken = 0;

  ### Insert apostrophe when token starts
  nApostropheInsert = 1;

  While ( nIndex <= nLen );
    sChar = SubSt( sAttachments, nIndex, 1 );
    ### Ignore whitespace only when we are between tokens
    If( sChar @<> ' ' % nApostropheInsert =0 );
      ### Token beginning
      If( nApostropheInsert = 1 );
        sMailAttachments = sMailAttachments | '''';
        nApostropheInsert = 0;
        nToken = nToken + 1;
      Endif;
      ### Token ending by delimiters or end of string
      If( SCAN( sChar, cDelimiters ) <> 0 % nIndex = nLen );
        ### When inside token: Append apostrophe and delimiter
        ### When end of string: Append last character read and apostrophe
        sMailAttachments = sMailAttachments | ( If( nIndex <> nLen, '''' | cMailDelim, sChar | '''' ) );
        nApostropheInsert = 1;
        sToken = sToken | If( nIndex = nLen, sChar, '');
        If( FileExists ( sToken ) = 0 );
          nErr = nErr + 1;
          sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Attachment not found (token number ' | NumberToString(nToken) | '), parsed attachment path ' | sToken;
        Endif;
        sToken = '';
      Else;
        sMailAttachments = sMailAttachments | sChar;
        sToken = sToken | sChar;
      Endif;
    Endif;
    nIndex = nIndex + 1;  
  End;
EndIF;


### COMMON: tests
IF( Scan( '@',  pFrom ) = 0 );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Invalid From parameter: ' | pFrom;
EndIF;

IF( pSubject @= '' & pBody @= '' );
  nErr = nErr + 1;
  sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Message must have at least either Subject or Body.';
EndIF;

IF( nErr > 0 );
  If( pDebug @>= '1' );
    AsciiOutput( sDebugFile, '' );
    AsciiOutput( sDebugFile, sErr );
  EndIf;
  ItemReject( sErr );
EndIF;

IF(cUsePowerShell @<> 'Y');
  ### BLAT: Prepare command line
  ### Build the command line string - BLAT
  sCommand = cEmailExe | ' -server ' | cEmailSvr;
  IF( bAnon = 0 );
  sCommand = sCommand | ' -u ' | cEmailUsr | ' -pw ' | cEmailPwd;
  EndIF;
  sCommand = sCommand | ' -to "' |  pTo | '" -f ' | pFrom;
  IF( pSubject @<> '' );
    IF( Scan( ' ', pSubject ) > 0 );
      pSubject = '"' | pSubject | '"';
    EndIF;
    sCommand = sCommand | ' -s ' |  pSubject ;
  EndIF;
  IF( pBody @<> '' );
    IF( Scan( ' ', pBody ) > 0 );
      pBody = '"' | pBody | '"';
    EndIF;
    sCommand = sCommand | ' -body ' |  pBody ;
  EndIF;
  IF( pAttach @<> '' );
    IF( Scan( ',', pAttach ) = 0 );
      sAttachment1 = pAttach;
    Else;
      sAttachment1 = SubSt( pAttach, 1, Scan( ',', pAttach ) - 1 );
    EndIF;
    IF( FileExists ( sAttachment1 ) = 0 );
      nErr = nErr + 1;
      sErr = sErr | IF( sErr @= '', '', ' & ' ) | 'Attachment not found: ' | sAttachment1;
      If( pDebug @>= '1' );
        AsciiOutput( sDebugFile, '' );
        AsciiOutput( sDebugFile, sErr );
      EndIf;
    Else;
      IF( Scan( ' ', pAttach ) > 0 );
        pAttach = '"' | pAttach | '"';
      EndIF;
       sCommand = sCommand | ' -attach ' |  pAttach;
    EndIF;
  EndIF;
  sCommand = sCommand | ' -html';
Else;
  ### POWERSHELL: Prepare command line
  sCommand = Expand('$securepass = ConvertTo-SecureString -AsPlainText -String ''%cEmailPwd%'' -Force;');
  sCommand = Expand('%sCommand% Send-MailMessage');
  sCommand = Expand('%sCommand% -From "%pFrom%" -Subject "%pSubject%" -Body "%pBody%"');
  sCommand = Expand('%sCommand% -To "%sMailRecipients%"');
  sCommand = Expand('%sCommand% -SmtpServer "%cSMTPServer%"');
  sCommand = Expand('%sCommand% -Port %cSMTPPort%');
  sCommand = Expand('%sCommand% -Credential (New-Object System.Management.Automation.PSCredential(''%cEmailUsr%'',$securepass))');
  sCommand = sCommand | If (sMailAttachments @<> '', ' -Attachments ' | sMailAttachments, '');
  sCommand = sCommand | If (cUseSSL @= 'Y', ' -UseSsl', '');
  sCommand = Expand('%sCommand% -DeliveryNotificationOption never');
  sCommand = Expand('powershell %sCommand%');
EndIF;

### Send the email

If( pDebug @>= '1' );
  sMessage = 'Command line to be called:';
  AsciiOutput( sDebugFile, sMessage );
  AsciiOutput( sDebugFile, sCommand );
EndIf;

ExecuteCommand( sCommand, 1 );

### Closing Debug

If( pDebug @>= '1' );
  sMessage = 'Email sent.';
  AsciiOutput( sDebugFile, '' );
  AsciiOutput( sDebugFile, sMessage );
EndIf;

### END Prolog
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,27
##############################################################################################################################
# CUBEWISE APLIQODE FRAMEWORK VERSION 3.05
# Copyright Apliqo AG, a Cubewise Company. All rights reserved.
# This software and related documentation are provided under a license agreement containing restrictions on use and disclosure 
# and are protected by intellectual property laws. Except as expressly permitted in your license agreement or allowed by law, 
# you may not use, copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, publish, 
# or display any part, in any form, or by any means.
##############################################################################################################################

#****Begin: Generated Statements***
#****End: Generated Statements****

##############################################################################################################
### Logging - common script 	----------------- START
IF( pDoProcessLogging @= '1' );
  nProcessFinishTime = Now(); sProcessErrorLogFile = GetProcessErrorFileName; sYear01 = sLogYear; sYear02 = sLogYear; sDay01 = sLogDay; sDay02 = 'D000'; sMinute01 = sLogMinute; sMinute02 = 'Total Day Entry'; sSecond01 = sLogSecond; sSecond02= 'Last Entry'; nCountTime = 1; nTotalLogTime = 2; 
  While( nCountTime <= nTotalLogTime );    sLoggingYear = Expand( '%sYear' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingDay = Expand( '%sDay' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingMinute = Expand( '%sMinute' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' ); sLoggingSecond = Expand( '%sSecond' | NumberToStringEx( nCountTime, '00', '', '' ) | '%' );
  CellPutN( nProcessFinishTime, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessFinishTime' ); CellPutN( 1, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessCompletedFlag' );
  CellPutN( nMetaDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataRecordCount' ); CellPutN( nDataRecordCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataRecordCount' );
  CellPutN( PrologMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nPrologMinorErrorCount' ); CellPutN( MetadataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nMetaDataMinorErrorCount' );
  CellPutN( DataMinorErrorCount, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nDataMinorErrorCount' ); CellPutN( ProcessReturnCode, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'nProcessReturnCode' );
  CellPutS( sProcessErrorLogFile, sProcLogCube, sLoggingYear, sLoggingDay, sLoggingMinute, sLoggingSecond, sThisProcName, 'sProcessErrorLogFile' );  nCountTime = nCountTime + 1; End;
  IF( nDataRecordCount > 0 ); IF( cCubTgt @<> '' ); CellPutN( nProcessFinishTime, sCubLogCube, cCubTgt, 'nLastTimeUpdate' ); CellPutS( sThisProcName, sCubLogCube, cCubTgt, 'sProcess' ); CellPutS( sProcessRunBy, sCubLogCube, cCubTgt, 'sProcessRunBy' ); EndIF; EndIF;
EndIF;
### Logging - common script 	-----------------  END
##############################################################################################################
### END Epilog
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
