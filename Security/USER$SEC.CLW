  MEMBER('useredit.clw')
  INCLUDE('ABUTIL.TRN'),ONCE
  MAP
    MODULE('WINDOWS.DLL')
      GetAsyncKeyState(UNSIGNED),UNSIGNED,PASCAL,NAME('GetAsyncKeyState')
    END!MODULE
  END!MAP
!==============================================================================
  INCLUDE('STABSEC2.CLW','Data')
!==============================================================================
Security.Init PROCEDURE
  CODE
  PARENT.Init
  !SELF.LoadQs  !Now it's done just before Logon in Main
  SELF.SecurityType              = SSEC::Security:Doors
  SELF.RuntimeDoor               = 0
  SELF.RuntimeInvocation         = 0
  SELF.RuntimeHotkey             = 0
  SELF.RuntimeEvent              = 0
  SELF.ResetOptions
!==============================================================================
Security.ResetOptions PROCEDURE
  CODE
  SELF.Sync.Wait
  SELF.ChangePassword            = 0
  SELF.InteractiveLogon          = 1
  SELF.MaxLogonTries             = 3
  SELF.SupportPreviousLogon      = 1
  SELF.Override                  = SSEC::Override:Never
  SELF.OverrideDuration          = SSEC::OverrideDuration:OneTime
  SELF.AuditLogon                = 0
  SELF.AuditLogonFailures        = 0
  SELF.AuditBackdoor             = 0
  SELF.AutoFillUsername          = 0
  SELF.Set_AutoFillProgram       ( 'UserName:', 0)
  SELF.GlobalAccessDeniedBeep    = 1
  SELF.Backdoor                  = 1
  SELF.Set_BackdoorUsername      ( 'BOXSOFT', 0)
  SELF.Set_PasswordEncrypt       ( '!@#$%^&*', 0)
  SELF.InactivityPeriod          = 0
  SELF.Sync.Release
!==============================================================================
Security.PasswordSize PROCEDURE(<BYTE p_Force>) !,BYTE
ReturnValue BYTE,AUTO
  CODE
  ReturnValue = SIZE(SUser_:Password)
  IF NOT p_Force
    IF SUser_:PasswordSize
      IF ReturnValue > SUser_:PasswordSize
        ReturnValue = SUser_:PasswordSize
      END!IF
    ELSIF SUser_:Password  !If there is an encrypted value
      ReturnValue = 8      !Original Password Field Length
    ELSE                   !No value in password field
      ReturnValue = 0      !Zero Length
    END!IF
  END!IF
  RETURN ReturnValue
!==============================================================================
Security.UpdateProcedure:Runtime PROCEDURE(BYTE p_UpdateForm)
  CODE
!==============================================================================
Security.HaltNow PROCEDURE(<STRING p_Message>)
  CODE
  HALT(, CHOOSE(NOT p_Message, SELF.Translate('SSEC::Message:Halted'), p_Message))
!==============================================================================
Security.Set_UserNo PROCEDURE(LONG UserNo,BYTE p_Sync=1) !,DERIVED
  CODE
  PARENT.Set_UserNo(UserNo, p_Sync)
!==============================================================================
Security.PrepareFilenames PROCEDURE  !,VIRTUAL
  CODE
!==============================================================================
Security.CheckAccess PROCEDURE(SHORT p_Door, <BYTE p_Override>, <STRING p_AccDenMsg>, <BYTE p_GlobMsg>)
ep_Override          EQUATE(3)
ep_AccDenMsg         EQUATE(4)
ep_GlobMsg           EQUATE(5)

L::UserNo            LONG
L::UserName          STRING(50)
L::Override          LONG(False)
L::AccDenMsg         STRING(50)
L::RetVal            BYTE(False)
L::FilesOpened       BYTE(False)
L::Manage:GroupView:Door ViewManager
L::GroupView:Door    VIEW(SSEC::UserInGroup)
                       PROJECT(SUIG_:UserNo)
                       PROJECT(SUIG_:UGrpNo)
                       JOIN(SAcc_:UserDoorKey, SUIG_:UGrpNo)
                         PROJECT(SAcc_:UserNo)
                         PROJECT(SAcc_:DoorNo)
                         PROJECT(SAcc_:DenyFlag)
                       END!JOIN
                     END!VIEW
L::Manage:GroupView:Level ViewManager
L::GroupView:Level   VIEW(SSEC::UserInGroup)
                       PROJECT(SUIG_:UserNo)
                       PROJECT(SUIG_:UGrpNo)
                       JOIN(SUGrp_:NoKey, SUIG_:UGrpNo)
                         PROJECT(SUGrp_:No)
                         PROJECT(SUGrp_:Level)
                       END!JOIN
                     END!VIEW
  CODE
  DO ST::CheckDoorParm
  DO ST::CheckBackdoor
  DO ST::CheckLogonCompleted
  DO ST::CheckIt
  DO ST::LogonOverride
  DO ST::ProcedureReturn
!--------------------------------------
ST::ProcedureReturn ROUTINE
  DO ST::CloseFiles
  RETURN L::RetVal
!--------------------------------------
ST::OpenFiles ROUTINE
  IF NOT L::FilesOpened
    PUSHBIND(1)
    IF SELF.SecurityType = SSEC::Security:Doors
      Relate:SSEC::Access.Open
      Relate:SSEC::UserInGroup.Open
      L::Manage:GroupView:Door.Init(L::GroupView:Door, Relate:SSEC::UserInGroup)
      L::Manage:GroupView:Door.AddSortOrder
      !Filter gets set in CheckDoor routine
    ELSE
      Relate:SSEC::User.Open
      L::Manage:GroupView:Level.Init(L::GroupView:Level, Relate:SSEC::UserInGroup)
      L::Manage:GroupView:Level.AddSortOrder
      !Filter gets set in CheckLevel routine
    END!IF
    L::FilesOpened = True
  END!IF
!--------------------------------------
ST::CloseFiles ROUTINE
  IF L::FilesOpened
    IF SELF.SecurityType = SSEC::Security:Doors
      Relate:SSEC::Access.Close
      L::Manage:GroupView:Door.Kill
      Relate:SSEC::UserInGroup.Close
    ELSE
      L::Manage:GroupView:Level.Kill
      Relate:SSEC::User.Close
    END!IF
    POPBIND
  END!IF
!--------------------------------------
ST::CheckDoorParm ROUTINE
  IF NOT p_Door
    L::RetVal = True
    DO ST::ProcedureReturn
  END!IF
!--------------------------------------
ST::CheckBackdoor ROUTINE
  IF (SELF.Backdoor AND SELF.Get_UserNo() = -1)  |
  OR SELF.FullAccess
    L::RetVal = True
    DO ST::ProcedureReturn
  END!IF
!--------------------------------------
ST::CheckLogonCompleted ROUTINE
  IF SELF.InteractiveLogon AND NOT SELF.Get_UserNo()
    SELF.Logon
    IF NOT SELF.Get_UserNo()
      L::RetVal = False
      DO ST::ProcedureReturn
    END!IF
  END!IF
!--------------------------------------
ST::CheckIt ROUTINE
  DO ST::MaintainCache
  IF SELF.SecurityType = SSEC::Security:Doors
    DO ST::CheckDoor
  ELSE
    DO ST::CheckLevel
  END!IF
  DO ST::OverrideMessage
!--------------------------------------
ST::MaintainCache ROUTINE
  IF SELF.CheckAccess:UserNo <> SELF.Get_UserNo()
    SELF.FreeCache
  END!IF
!--------------------------------------
ST::CheckDoor ROUTINE
  SELF.CheckAccess:DoorQ.Door = p_Door
  GET(SELF.CheckAccess:DoorQ, SELF.CheckAccess:DoorQ.Door)
  IF ERRORCODE()=0
    IF SELF.CheckAccess:DoorQ.Granted
      L::RetVal = SELF.CheckAccess:DoorQ.Granted
    END!IF
    EXIT
  END!IF
  !---
  DO ST::OpenFiles
  SAcc_:UserNo = SELF.Get_UserNo()
  SAcc_:DoorNo = p_Door
  IF Access:SSEC::Access.TryFetch(SAcc_:UserDoorKey) <> LEVEL:Benign
    L::Manage:GroupView:Door.SetFilter('SUIG_:UserNo='& SELF.Get_UserNo() &' AND SAcc_:DoorNo='& p_Door &' AND NOT SAcc_:DenyFlag')
    L::Manage:GroupView:Door.Reset
    IF L::Manage:GroupView:Door.Next() = LEVEL:Benign
      L::RetVal = 2  !Implicit Access Via Group
    END!IF
    L::Manage:GroupView:Door.Close
  ELSIF NOT SAcc_:DenyFlag
    L::RetVal = 1  !Explicit User Access
  END!IF
  !---
  SELF.CheckAccess:DoorQ.Door    = p_Door
  SELF.CheckAccess:DoorQ.Granted = L::RetVal
  ADD(SELF.CheckAccess:DoorQ, SELF.CheckAccess:DoorQ.Door)
  ASSERT(ERRORCODE()=0)
!--------------------------------------
ST::CheckLevel ROUTINE
  DATA
L::SavedUser USHORT,AUTO
  CODE
  IF SELF.CheckAccess:Level >= p_Door
    L::RetVal = True
    EXIT
  END!IF
  !---
  DO ST::OpenFiles
  L::SavedUser = Access:SSEC::User.SaveFile()
  SUser_:No = SELF.Get_UserNo()
  IF NOT Access:SSEC::User.TryFetch(SUser_:NoKey)
    SELF.CheckAccess:Level = SUser_:Level
    IF SUser_:Level >= p_Door
      L::RetVal = 1  !Explicit User Access
    ELSE
      L::Manage:GroupView:Level.SetFilter('SUIG_:UserNo='& SELF.Get_UserNo() &' AND SUGrp_:Level >= '& p_Door)
      L::Manage:GroupView:Level.Reset
      IF NOT L::Manage:GroupView:Level.Next()
        L::RetVal = 2  !Implicit Access Via Group
      END!IF
      L::Manage:GroupView:Level.Close
    END!IF
  END!IF
  Access:SSEC::User.RestoreFile(L::SavedUser)
!--------------------------------------
ST::LogonOverride ROUTINE
  IF SELF.Override <> SSEC::Override:Never
    IF NOT L::RetVal AND L::Override
      DO ST::SaveUserVars
      SELF.Logon(SSEC::Override:Always)
      IF SELF.OverrideDuration = SSEC::OverrideDuration:Permanent
        IF SELF.Backdoor AND SELF.Get_UserNo() = -1
          L::RetVal = True
        ELSIF SELF.Get_UserNo()
          DO ST::CheckIt
        ELSE
          DO ST::RestoreUserVars
        END!IF
      ELSE
        IF SELF.Backdoor AND SELF.Get_UserNo() = -1
          L::RetVal = True
        ELSIF SELF.Get_UserNo()
          DO ST::CheckIt
        END!IF
        DO ST::RestoreUserVars
      END!IF
    END!IF
  END!IF
!--------------------------------------
ST::SaveUserVars ROUTINE
  SELF.SyncWait
  L::UserNo   = SELF.Get_UserNo()
  L::UserName = SELF.Get_UserName()
  SELF.SyncRelease
!--------------------------------------
ST::RestoreUserVars ROUTINE
  SELF.SyncWait
  SELF.Set_UserNo  (L::UserNo  , False)
  SELF.Set_UserName(L::UserName, False)
  SELF.SyncRelease
!--------------------------------------
ST::OverrideMessage ROUTINE
  IF NOT L::RetVal
    CASE SELF.Override
    OF SSEC::Override:Never
      DO ST::NoOverride
    OF SSEC::Override:Always
      IF NOT L::Override AND (OMITTED(ep_Override) OR p_Override)
        DO ST::Override
      ELSE
        DO ST::NoOverride
      END!IF
    OF SSEC::Override:Sometimes
      IF NOT L::Override AND p_Override
        DO ST::Override
      ELSE
        DO ST::NoOverride
      END!IF
    END!CASE
  END!IF
!--------------------------------------
ST::NoOverride ROUTINE
  DO ST::Message
  IF L::AccDenMsg
    MESSAGE(L::AccDenMsg, SELF.Translate('SSEC::Message:Title'), ICON:Exclamation)
  END!IF
!--------------------------------------
ST::Override ROUTINE
  DO ST::Message
  IF NOT L::AccDenMsg
    L::AccDenMsg = SELF.Translate('SSEC::Message:AccessDenied')
  END!IF
  IF MESSAGE(SELF.Translate('SSEC::Override:Question'),          |
             L::AccDenMsg, ICON:Question, BUTTON:Yes+BUTTON:No)  |
      = BUTTON:Yes
    L::Override = True
  ELSE
    L::Override = False
  END!IF
!--------------------------------------
ST::Message ROUTINE
  IF SELF.NoAccDenMessages                !MH 08/24/05
    L::AccDenMsg = ''                     !MH 08/24/05
  ELSIF OMITTED(ep_GlobMsg) OR NOT OMITTED(ep_AccDenMsg)
    L::AccDenMsg = p_AccDenMsg
  ELSE
    CASE p_GlobMsg
      OF 0;             L::AccDenMsg = SELF.Translate('SSEC::Message:AccessDenied')
      OF InsertRecord;  L::AccDenMsg = SELF.Translate('SSEC::Message:InsertDenied')
      OF ChangeRecord;  L::AccDenMsg = SELF.Translate('SSEC::Message:ChangeDenied')
      OF DeleteRecord;  L::AccDenMsg = SELF.Translate('SSEC::Message:DeleteDenied')
      OF ViewRecord;    L::AccDenMsg = SELF.Translate('SSEC::Message:ViewDenied')
    END!CASE
  END!IF
  IF SELF.GlobalAccessDeniedBeep AND L::AccDenMsg THEN BEEP.
!==============================================================================
  INCLUDE('STABSEC2.CLW', 'Code')
!==============================================================================
