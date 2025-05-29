

   MEMBER('useredit.clw')                                  ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('USEREDIT003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SSEC::Logon PROCEDURE (<LONG p_Override>,*Security p_Security,BYTE p_ChangePassword,BYTE p_MaskUserName,BYTE p_Backdoor,STRING p_BackdoorUsername,BYTE p_AutoFillUsername,BYTE p_AuditLogon,BYTE p_AuditBackdoor,BYTE p_AuditLogonFailures,BYTE p_MaxLogonTries)

                     MAP
ST::FindUser           PROCEDURE(STRING p_Name),BYTE
ST::Quote              PROCEDURE(STRING S),STRING
                     END!MAP
L::UserName          STRING(50)                            !
L::Password          STRING(50)                            !
FilesOpened          BYTE                                  !
L::Tries             BYTE(0)
L::PasswordStage     BYTE(0)              !Used for changing password during logon
L::OK                BYTE(False)
Window               WINDOW('Logon'),AT(,,164,90),FONT('MS Sans Serif',8),DOUBLE,ALRT(CtrlH),CENTER,GRAY,SYSTEM
                       IMAGE('ssec.ico'),AT(6,13,25,25),USE(?Image)
                       PROMPT('Username:'),AT(28,10),USE(?UsernamePrompt)
                       ENTRY(@s50),AT(68,10,90,10),USE(L::UserName),CAP,REQ
                       PROMPT('Password:'),AT(28,23),USE(?PasswordPrompt)
                       ENTRY(@s50),AT(68,23,90,10),USE(L::Password),UPR,PASSWORD
                       PROMPT('For the Username, you can enter "Clerk", "Manager", or "BOXSOFT" (the backdoor)' & |
  '.  None of these requires a password.'),AT(6,39,152,28),USE(?Prompt3),FONT(,,COLOR:Red, |
  FONT:bold)
                       BUTTON('&Password'),AT(6,70,48,14),USE(?PasswordButton)
                       BUTTON('&OK'),AT(58,70,48,14),USE(?OkButton),DEFAULT,REQ
                       BUTTON('Cancel'),AT(110,70,48,14),USE(?CancelButton)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
!--------------------------------------
ST::PasswordButtonAccepted ROUTINE
  IF p_ChangePassword
    IF p_Backdoor
      DO ST::CheckBackdoor
      IF L::OK THEN EXIT.
    END!IF
    DO ST::CheckEntry
    IF L::OK
      DO ST::PrepareForNewPassword
    ELSE
      BEEP
    END!IF
  END!IF
!--------------------------------------
ST::PrepareForNewPassword ROUTINE
  DISABLE(?UsernamePrompt, ?L::UserName)
  DISABLE(?PasswordButton)
  HIDE(?PasswordButton)
  ERASE(?L::Password)
  MESSAGE(p_Security.Translate('SSEC::ChangePassword:EnterNewPassword'),  |
          p_Security.Translate('SSEC::ChangePassword:Title'),             |
          ICON:Asterisk)
  !---
  !SELECT(?L::Password)  !The disabled ?PasswordButton prevents SELECT(?L::Password).
  POST(EVENT:User)       !Also see ThisWindow.TakeEvent.
  !---
  L::PasswordStage = 1
!--------------------------------------
ST::OkButtonAccepted ROUTINE
  IF p_ChangePassword
    EXECUTE L::PasswordStage
      BEGIN
        COMPILE('***---***', SSEC::MinPasswordLength)
          IF LEN(CLIP(L::Password)) < p_Security.MinPasswordLength
            MESSAGE(p_Security.Translate('SSEC::ChangePassword:TooShort1')   |
                  & p_Security.MinPasswordLength                           |
                  & p_Security.Translate('SSEC::ChangePassword:TooShort2'),  |
                    p_Security.Translate('SSEC::ChangePassword:Title'),      |
                    ICON:Exclamation)
            SELECT(?L::Password)
            EXIT
          END!IF
        ***---***
        !---
        SUser_:PasswordSize = LEN(CLIP(L::Password))
        SUser_:Password     = p_Security.EncryptPassword(UPPER(L::Password), SUser_:PasswordSize)
        MESSAGE(p_Security.Translate('SSEC::ChangePassword:EnterVerification'),  |
                p_Security.Translate('SSEC::ChangePassword:Title'),              |
                ICON:Asterisk)
        ERASE(?L::Password)
        SELECT(?L::Password)
        L::PasswordStage = 2
        EXIT
      END!BEGIN
      !---
      BEGIN
        IF UPPER(L::Password) = p_Security.EncryptPassword(SUser_:Password, SUser_:PasswordSize)
          COMPILE('***---***', SSEC::SupportPasswordExpiration)
            IF ~p_Security.PasswordUnique(UPPER(L::Password[1 : SIZE(SUser_:Password)]))
              MESSAGE(p_Security.Translate('SSEC::ChangePassword:NotUnique'),  |
                      p_Security.Translate('SSEC::ChangePassword:Title'),      |
                      ICON:Asterisk)
              DO ST::PrepareForNewPassword
              EXIT
            END!IF
          ***---***
          SUser_:PasswordDate = TODAY()
          SUser_:PasswordTime = CLOCK()
          DO ST::UpdateUserRecord
          COMPILE('***---***', SSEC::SupportPasswordExpiration)
            p_Security.LogPassword()
          ***---***
          MESSAGE(p_Security.Translate('SSEC::ChangePassword:Changed'),  |
                  p_Security.Translate('SSEC::ChangePassword:Title'),    |
                  ICON:Asterisk)
        ELSE
          MESSAGE(p_Security.Translate('SSEC::ChangePassword:NotChanged'),  |
                  p_Security.Translate('SSEC::ChangePassword:Title'),       |
                  ICON:Asterisk)
        END!IF
        ThisWindow.SetResponse(RequestCompleted)
      END!BEGIN
    END!EXECUTE
  END!IF
  !---
  IF p_Backdoor
    DO ST::CheckBackdoor
    IF L::OK
      IF p_AutoFillUsername
        PUTINI('SuperSecurity', p_Security.Get_AutoFillProgram())
      END!IF
      EXIT
    END!IF
  END!IF
  !---
  DO ST::CheckEntry
  IF L::OK
    IF p_AutoFillUsername
      PUTINI('SuperSecurity', p_Security.Get_AutoFillProgram(), L::UserName)
    END!IF
    !--- Do this if NOT supporting password expiry
    OMIT('***---***', SSEC::SupportPasswordExpiration)
      ThisWindow.SetResponse(RequestCompleted)
    ***---***
    !--- Or do this if supporting password expiry
    COMPILE('***---***', SSEC::SupportPasswordExpiration)
      IF p_Security.PasswordExpired()
        MESSAGE(p_Security.Translate('SSEC::ChangePassword:Expired'),  |
                p_Security.Translate('SSEC::ChangePassword:Title'),    |
                ICON:Asterisk)
        DO ST::PrepareForNewPassword
      ELSE
        ThisWindow.SetResponse(RequestCompleted)
      END!IF
    ***---***
  ELSE
    BEEP
  END!IF
!--------------------------------------
ST::CheckBackdoor ROUTINE
  IF UPPER(L::UserName) = UPPER(p_BackdoorUsername)
    p_Security.Set_UserNo(-1)
    p_Security.Set_UserName(p_Security.Translate('SSEC::BackdoorDisplayName'))
    L::OK = True
    IF p_AuditLogon AND p_AuditBackdoor
      p_Security.AddCall('Security', 'Logon',,, p_Security.Get_UserNo(), p_Security.Get_UserName())
    END!IF
    ThisWindow.SetResponse(RequestCompleted)
  END!IF
!--------------------------------------
ST::CheckEntry ROUTINE
  IF ~ST::FindUser(L::UserName)
    DO ST::CheckTries
    SELECT(?L::UserName)
    EXIT
  ELSIF SUser_:Locked
    MESSAGE(p_Security.Translate('SSEC::Message:AccountLocked'),  |
            p_Security.Translate('SSEC::Message:Title'),          |
            ICON:Exclamation)
    p_Security.HaltNow
  END!IF
  IF UPPER(L::Password) <> p_Security.EncryptPassword(SUser_:Password, p_Security.PasswordSize())
    SUser_:Failures += 1
    IF p_Security.MaxLogonFailures <> 0  |
    AND SUser_:Failures > p_Security.MaxLogonFailures
      SUser_:Failures = 0
      SUser_:Locked   = True
    END!IF
    DO ST::UpdateUserRecord
    IF SUser_:Locked
      MESSAGE(p_Security.Translate('SSEC::Message:MaxFailures'),  |
              p_Security.Translate('SSEC::Message:Title'),        |
              ICON:Exclamation)
      p_Security.HaltNow
    END!IF
    !---
    DO ST::CheckTries
    SELECT(?L::Password)
    EXIT
  END!IF
  DO ST::LogonSuccess
!--------------------------------------
ST::LogonSuccess ROUTINE
  p_Security.Set_UserNo(SUser_:No)
  p_Security.Set_UserName(LEFT(CLIP(CLIP(SUser_:FirstName) &' '& SUser_:LastName)))
  L::OK = True
  !---
  SUser_:LogonDate = TODAY()
  SUser_:LogonTime = CLOCK()
  SUser_:Failures  = 0
  IF ~SUser_:PasswordDate
    SUser_:PasswordDate = SUser_:LogonDate
    SUser_:PasswordTime = SUser_:LogonTime
  END!IF
  DO ST::UpdateUserRecord
  !---
  IF p_AuditLogon
    p_Security.AddCall('Security', 'Logon',, 'SSEC::User', p_Security.Get_UserNo(), p_Security.Get_UserName())
  END!IF
!--------------------------------------
ST::CheckTries ROUTINE
  IF ~p_MaxLogonTries THEN EXIT.
  L::Tries += 1
  IF L::Tries >= p_MaxLogonTries
    MESSAGE(p_Security.Translate('SSEC::Message:AccessDenied'),  |
            p_Security.Translate('SSEC::Message:Title'),         |
            ICON:Exclamation)
    IF p_AuditLogonFailures
      p_Security.Set_UserNo(0)
      p_Security.AddCall('Security', 'Logon',,,, L::UserName, True)
    END!IF
    ThisWindow.SetResponse(RequestCancelled)
  END!IF
!--------------------------------------
ST::UpdateUserRecord ROUTINE
  IF Access:SSEC::User.Update()
    p_Security.HaltNow('Cannot update User file!  Program halted.')
  END!IF

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::Logon')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Image
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddItem(?CancelButton,RequestCancelled)             ! Add the cancel control to the window manager
  Relate:SSEC::User.SetOpenRelated()
  Relate:SSEC::User.Open                                   ! File SSEC::User used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
    COMPILE('***---***', SSEC::AutoLogonFromNetwork)
  L::UserName = p_Security.GetNetUsername()
  IF L::UserName
    MESSAGE(L::UserName)
    IF ST::FindUser(L::UserName)
      DO ST::LogonSuccess
      SELF.Response = RequestCompleted
      RETURN LEVEL:Notify
    ELSE
      CLEAR(L::UserName)
    END!IF
  END!IF
    ***---***
  SELF.Open(Window)                                        ! Open window
  IF p_Security.Override <> SSEC::Override:Never AND p_Override
    Window{PROP:Text} = p_Security.Translate('SSEC::Override:Title')
  END!IF
  ?L::Password{PROP:Text} = '@S'& p_Security.PasswordSize(TRUE)
  IF p_MaskUserName THEN ?L::UserName{PROP:Password} = True.
  IF ~p_ChangePassword THEN HIDE(?PasswordButton).
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::Logon',Window)                       ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSEC::User.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::Logon',Window)                    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?L::UserName
      IF p_ChangePassword
        IF L::UserName
          ENABLE(?PasswordButton)
        ELSE
          DISABLE(?PasswordButton)
        END!IF
      END!IF
    OF ?PasswordButton
      DO ST::PasswordButtonAccepted
    OF ?OkButton
      DO ST::OkButtonAccepted
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  IF EVENT() = EVENT:User
    SELECT(?L::Password)
    RETURN LEVEL:Notify
  END!IF
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = CtrlH
        ?L::UserName{PROP:Password} = True
      END!IF
    OF EVENT:OpenWindow
      IF p_AutoFillUsername
        L::UserName = GETINI('SuperSecurity', p_Security.Get_AutoFillProgram())
        IF L::UserName
          DISPLAY(?L::UserName)
          POST(EVENT:Accepted, ?L::UserName)
          SELECT(?L::Password)
        END!IF
      END!IF
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!==============================================================================
ST::FindUser PROCEDURE(STRING p_Name) !,BYTE
L::RetVal            BYTE,AUTO
L::Manage:UserView   ViewManager
L::UserView          VIEW(SSEC::User).
  CODE
  L::Manage:UserView.Init(L::UserView, Relate:SSEC::User)
  L::Manage:UserView.AddSortOrder
  L::Manage:UserView.SetFilter(                                             |
      'UPPER(LEFT(CLIP(SUser_:FirstName) & '' '' & SUser_:LastName)) = '''  |
      & ST::Quote(UPPER(CLIP(p_Name))) & ''' AND SUser_:GroupFlag=0')
  L::Manage:UserView.Reset
  L::RetVal = CHOOSE(~L::Manage:UserView.Next())
  IF L::RetVal                                                  !MH 10/19/03 SQL
    REGET(L::UserView, POSITION(L::UserView))                   !MH 10/19/03 SQL
  END!IF                                                        !MH 10/19/03 SQL
  L::Manage:UserView.Close
  L::Manage:UserView.Kill
  IF L::RetVal                                                  !MH 12/18/03 SQL
    WATCH(SSEC::User)                                           !MH 12/18/03 SQL
    L::RetVal = CHOOSE(~Access:SSEC::User.Fetch(SUser_:NoKey))  !MH 12/18/03 SQL
  END!IF                                                        !MH 12/18/03 SQL
  RETURN L::RetVal
!==============================================================================
ST::Quote PROCEDURE(STRING S) !,STRING
C STRING(1),AUTO
R STRING(100),AUTO
  CODE
  R = S
  C = '''';  DO ST::Replace
  C = '<<';  DO ST::Replace
  RETURN CLIP(R)
!--------------------------------------
ST::Replace ROUTINE
  DATA
B BYTE(1)
P BYTE,AUTO
  CODE
  LOOP
    P = INSTRING(C, R, 1, B)
    IF P
      R = R[1 : P] & C & R[P+1 : SIZE(R)]
    END!IF
    B = P + 2
  WHILE P
!==============================================================================
