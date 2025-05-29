   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('MYDOORS.CLW'),ONCE
   INCLUDE('STABSEC.INC'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
Access               ITEMIZE,PRE
Grant                  EQUATE
Delete                 EQUATE
Deny                   EQUATE
                     END!ITEMIZE

   MAP
     MODULE('USEREDIT_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('USEREDIT001.CLW')
SSEC::Main             PROCEDURE   !
     END
     MODULE('USEREDIT003.CLW')
SSEC::Logon            PROCEDURE(<LONG p_Override>,*Security p_Security,BYTE p_ChangePassword,BYTE p_MaskUserName,BYTE p_Backdoor,STRING p_BackdoorUsername,BYTE p_AutoFillUsername,BYTE p_AuditLogon,BYTE p_AuditBackdoor,BYTE p_AuditLogonFailures,BYTE p_MaxLogonTries)   !
     END
   END

SecurityAccess       LONG
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
SSEC::User           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('dbo."_User"'),PRE(SUser_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SUser_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SUser_:LastName,SUser_:FirstName),NOCASE,OPT !                    
GroupNameKey             KEY(SUser_:GroupFlag,SUser_:LastName,SUser_:FirstName),NOCASE,OPT !                    
LevelNdx                 KEY(SUser_:Level),DUP,NOCASE,OPT  !                    
Record                   RECORD,PRE()
No                          LONG                           !User Number         
GroupFlag                   BYTE                           !Is this a group?    
LastName                    STRING(25)                     !Last Name           
FirstName                   STRING(15)                     !First Name (optional)
Password                    STRING(20)                     !Password            
Level                       SHORT                          !User Level (if not using Doors)
PasswordSize                BYTE                           !Size of Password Field (0=8).  Don't change this value if you don't fully understand the implications.
PasswordMaxAge              SHORT                          !How many days until password change is required (0=Never)
PasswordDate                LONG                           !When was the current password chosen?
PasswordTime                LONG                           !When was the current password chosen?
LogonDate                   LONG                           !Last successful logon date
LogonTime                   LONG                           !Last successful logon time
Failures                    SHORT                          !Failure count since last successful logon
Locked                      BYTE                           !Is this user locked out?
                         END
                     END                       

SSEC::UserInGroup    FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_UserInGroup'),PRE(SUIG_),BINDABLE,CREATE,THREAD !                    
UserKey                  KEY(SUIG_:UserNo,SUIG_:UGrpNo),NOCASE,OPT,PRIMARY !                    
UGrpKey                  KEY(SUIG_:UGrpNo,SUIG_:UserNo),NOCASE,OPT !                    
Record                   RECORD,PRE()
UserNo                      LONG                           !                    
UGrpNo                      LONG                           !                    
                         END
                     END                       

SSEC::Door           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Door'),PRE(SDoor_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SDoor_:No),NOCASE,OPT,PRIMARY !                    
EquateKey                KEY(SDoor_:Equate),NOCASE,OPT     !                    
DGrpDescKey              KEY(SDoor_:DGrpNo,SDoor_:Description),NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          SHORT                          !Door Number         
DGrpNo                      LONG                           !Door Group #        
Equate                      STRING(30)                     !Equate for MYDOORS.CLW
Description                 STRING(60)                     !Description         
Freeze                      BYTE                           !                    
                         END
                     END                       

SSEC::DoorGroup      FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_DoorGroup'),PRE(SDGrp_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SDGrp_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SDGrp_:Name),NOCASE,OPT       !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
Name                        STRING(30)                     !                    
Freeze                      BYTE                           !                    
                         END
                     END                       

SSEC::Access         FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Access'),PRE(SAcc_),BINDABLE,CREATE,THREAD !                    
UserDoorKey              KEY(SAcc_:UserNo,SAcc_:DoorNo),NOCASE,OPT,PRIMARY !                    
DoorUserKey              KEY(SAcc_:DoorNo,SAcc_:UserNo),NOCASE,OPT !                    
Record                   RECORD,PRE()
UserNo                      SHORT                          !User Number         
DoorNo                      SHORT                          !Door Number         
DenyFlag                    BYTE                           !Is this "Deny Access to User"?
                         END
                     END                       

SSEC::Program        FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Program'),PRE(SProg_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SProg_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SProg_:Name),NOCASE,OPT       !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
Name                        STRING(8)                      !                    
                         END
                     END                       

SSEC::Procedure      FILE,DRIVER('MSSQL'),NAME('_Procedure'),PRE(SProc_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SProc_:No),NOCASE,OPT,PRIMARY !                    
ProgKey                  KEY(SProc_:ProgNo,SProc_:Name),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
ProgNo                      LONG                           !                    
Name                        STRING(30)                     !                    
GeneralDoorNo               LONG                           !                    
GeneralOverride             BYTE                           !                    
InsertDoorNo                LONG                           !                    
InsertOverride              BYTE                           !                    
ChangeDoorNo                LONG                           !                    
ChangeOverride              BYTE                           !                    
DeleteDoorNo                LONG                           !                    
DeleteOverride              BYTE                           !                    
ViewDoorNo                  LONG                           !                    
ViewOverride                BYTE                           !                    
                         END
                     END                       

SSEC::File           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_File'),PRE(SFile_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SFile_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SFile_:Name),NOCASE,OPT       !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
Name                        STRING(30)                     !                    
                         END
                     END                       

SSEC::Field          FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Field'),PRE(SField_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SField_:No),NOCASE,OPT,PRIMARY !                    
FileKey                  KEY(SField_:FileNo,SField_:Name),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
FileNo                      LONG                           !                    
Name                        STRING(30)                     !                    
                         END
                     END                       

SSEC::PwdLog         FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_PwdLog'),PRE(SPwdLog_),BINDABLE,CREATE,THREAD !Password Log        
NoKey                    KEY(SPwdLog_:No),NOCASE,OPT,PRIMARY !                    
UserKey                  KEY(SPwdLog_:UserNo,-SPwdLog_:Date,-SPwdLog_:No),NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !PwdLog Number       
UserNo                      LONG                           !User Number         
Password                    STRING(20)                     !Password            
Date                        LONG                           !When was the password chosen?
Time                        LONG                           !When was the password chosen?
                         END
                     END                       

SSEC::Call           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Call'),PRE(SCall_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SCall_:No),NOCASE,OPT,PRIMARY !                    
DateKey                  KEY(SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
ProcKey                  KEY(SCall_:ProcNo,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
ProcReqKey               KEY(SCall_:ProcNo,SCall_:Request,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
UserKey                  KEY(SCall_:UserNo,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
FileKey                  KEY(SCall_:FileNo,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Description                 STRING(100)                    !                    
No                          LONG                           !                    
ProcNo                      LONG                           !                    
Request                     LONG                           !                    
UserNo                      LONG                           !                    
Date                        LONG                           !                    
Time                        LONG                           !                    
FileNo                      LONG                           !                    
PrimaryKey                  LONG                           !                    
AccessDenied                BYTE                           !                    
RequestCancelled            BYTE                           !                    
                         END
                     END                       

SSEC::Edit           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Edit'),PRE(SEdit_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SEdit_:No),NOCASE,OPT,PRIMARY !                    
CallKey                  KEY(SEdit_:CallNo),DUP,NOCASE,OPT !                    
FieldKey                 KEY(SEdit_:FieldNo),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
CallNo                      LONG                           !                    
FieldNo                     LONG                           !                    
OldValue                    STRING(30)                     !                    
NewValue                    STRING(30)                     !                    
                         END
                     END                       

SSEC::UserGroup      FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('dbo."_User"'),PRE(SUGrp_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SUGrp_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SUGrp_:LastName,SUGrp_:FirstName),NOCASE,OPT !                    
GroupNameKey             KEY(SUGrp_:GroupFlag,SUGrp_:LastName,SUGrp_:FirstName),NOCASE,OPT !                    
LevelNdx                 KEY(SUGrp_:Level),DUP,NOCASE,OPT  !                    
Record                   RECORD,PRE()
No                          LONG                           !User Number         
GroupFlag                   BYTE                           !Is this a group?    
LastName                    STRING(25)                     !Last Name           
FirstName                   STRING(15)                     !First Name (optional)
Password                    STRING(20)                     !Password            
Level                       SHORT                          !User Level (if not using Doors)
PasswordSize                BYTE                           !Size of Password Field (0=8).  Don't change this value if you don't fully understand the implications.
PasswordMaxAge              SHORT                          !How many days until password change is required (0=Never)
PasswordDate                LONG                           !When was the current password chosen?
PasswordTime                LONG                           !When was the current password chosen?
LogonDate                   LONG                           !Last successful logon date
LogonTime                   LONG                           !Last successful logon time
Failures                    SHORT                          !Failure count since last successful logon
Locked                      BYTE                           !Is this user locked out?
                         END
                     END                       

!endregion

!----- SuperSecurity Equates -----!
SSEC::DefaultMaxPwdAge          EQUATE(0)
SSEC::SupportPasswordExpiration EQUATE(0)
SSEC::AutoLogonFromNetwork      EQUATE(0)
!----- SuperSecurity Class -----!
Security             CLASS(SSEC::SecurityClass),MODULE('USER$SEC.CLW'),LINK('USER$SEC.CLW',_ABCLinkMode_)
MaxLogonFailures       SHORT
!--- Public Methods
AddCall                PROCEDURE(STRING ProgName, STRING ProcName, <LONG Request>, <STRING File>, <LONG PrimaryKey>, <STRING Description>, <BYTE AccessDenied>),LONG,PROC
CheckAccess            PROCEDURE(SHORT Door, <BYTE Override>, <STRING AccDenMsg>, <BYTE UseGlobMsg>),BYTE,DERIVED
CheckDoorUsed          FUNCTION,BYTE
CheckRuntimeAccess     PROCEDURE(STRING Prog, STRING Proc, <LONG Request>,<BYTE p_NoMessage>,<*BYTE Viewing>),BYTE
CheckUsersExist        PROCEDURE(<BYTE GroupFlag>),BYTE
CheckUserGroupsExist   PROCEDURE,BYTE
CompareEdit            PROCEDURE(LONG CallNo, STRING FileName, STRING FieldName, *? OldValue, *? NewValue)
FreeCache              PROCEDURE,DERIVED
GetCallRequest         PROCEDURE,STRING
GetCallUsername        PROCEDURE,STRING
GetFieldName           PROCEDURE(LONG p_N),STRING
GetFileName            PROCEDURE(LONG p_N),STRING
GetProcName            PROCEDURE(LONG p_N),STRING
GetProgName            PROCEDURE(LONG p_N),STRING
HaltNow                PROCEDURE(<STRING p_Message>),VIRTUAL
Init                   PROCEDURE
Kill                   PROCEDURE
LoadQs                 PROCEDURE
Logon                  PROCEDURE(<LONG p_Override>),LONG,PROC
PasswordSize           PROCEDURE(<BYTE p_Force>),BYTE
PrepareLogonOpenFiles  PROCEDURE,VIRTUAL  !EXTINCT
PrepareFilenames       PROCEDURE,VIRTUAL
Purge                  PROCEDURE(LONG Date,<BYTE Stream>)
PutCall                PROCEDURE(LONG CallNo, LONG Response, <LONG PrimaryKey>, <STRING Description>)
ResetOptions           PROCEDURE
RestoreUser            PROCEDURE(<BYTE GroupFlag>)
RestoreUserGroup       PROCEDURE
SaveUser               PROCEDURE(<BYTE GroupFlag>)
SaveUserGroup          PROCEDURE
UpdateRuntime          PROCEDURE(STRING Prog, STRING Proc, <BYTE UpdateForm>, <BYTE WatchShift>),DERIVED
Set_UserNo             PROCEDURE(LONG p_Value,BYTE p_Sync=1),DERIVED
!--- Protected Methods -----!
FetchUser              PROCEDURE(LONG UserNo),BYTE,DERIVED,PROTECTED
UpdateProcedure:Runtime PROCEDURE(BYTE UpdateForm),DERIVED,PROTECTED
!--- Private Methods
AddProcQ               PROCEDURE(<BYTE NoSort>),PRIVATE
AddProgQ               PROCEDURE(<BYTE NoSort>),PRIVATE
AddFieldQ              PROCEDURE(<BYTE NoSort>),PRIVATE
AddFileQ               PROCEDURE(<BYTE NoSort>),PRIVATE
GetFieldNo             PROCEDURE(LONG FileNo, STRING FieldName),LONG,PRIVATE
GetFileNo              PROCEDURE(STRING FileName),LONG,PRIVATE
GetProcNo              PROCEDURE(LONG ProgNo, STRING ProcName),LONG,PRIVATE
GetProgNo              PROCEDURE(STRING ProgName),LONG,PRIVATE
LoadFieldQ             PROCEDURE,PRIVATE
LoadFileQ              PROCEDURE,PRIVATE
LoadProcQ              PROCEDURE,PRIVATE
LoadProgQ              PROCEDURE,PRIVATE
                     END!CLASS
SSEC::ViewRecord     BYTE,THREAD
Access:SSEC::User    &FileManager,THREAD                   ! FileManager for SSEC::User
Relate:SSEC::User    &RelationManager,THREAD               ! RelationManager for SSEC::User
Access:SSEC::UserInGroup &FileManager,THREAD               ! FileManager for SSEC::UserInGroup
Relate:SSEC::UserInGroup &RelationManager,THREAD           ! RelationManager for SSEC::UserInGroup
Access:SSEC::Door    &FileManager,THREAD                   ! FileManager for SSEC::Door
Relate:SSEC::Door    &RelationManager,THREAD               ! RelationManager for SSEC::Door
Access:SSEC::DoorGroup &FileManager,THREAD                 ! FileManager for SSEC::DoorGroup
Relate:SSEC::DoorGroup &RelationManager,THREAD             ! RelationManager for SSEC::DoorGroup
Access:SSEC::Access  &FileManager,THREAD                   ! FileManager for SSEC::Access
Relate:SSEC::Access  &RelationManager,THREAD               ! RelationManager for SSEC::Access
Access:SSEC::Program &FileManager,THREAD                   ! FileManager for SSEC::Program
Relate:SSEC::Program &RelationManager,THREAD               ! RelationManager for SSEC::Program
Access:SSEC::Procedure &FileManager,THREAD                 ! FileManager for SSEC::Procedure
Relate:SSEC::Procedure &RelationManager,THREAD             ! RelationManager for SSEC::Procedure
Access:SSEC::File    &FileManager,THREAD                   ! FileManager for SSEC::File
Relate:SSEC::File    &RelationManager,THREAD               ! RelationManager for SSEC::File
Access:SSEC::Field   &FileManager,THREAD                   ! FileManager for SSEC::Field
Relate:SSEC::Field   &RelationManager,THREAD               ! RelationManager for SSEC::Field
Access:SSEC::PwdLog  &FileManager,THREAD                   ! FileManager for SSEC::PwdLog
Relate:SSEC::PwdLog  &RelationManager,THREAD               ! RelationManager for SSEC::PwdLog
Access:SSEC::Call    &FileManager,THREAD                   ! FileManager for SSEC::Call
Relate:SSEC::Call    &RelationManager,THREAD               ! RelationManager for SSEC::Call
Access:SSEC::Edit    &FileManager,THREAD                   ! FileManager for SSEC::Edit
Relate:SSEC::Edit    &RelationManager,THREAD               ! RelationManager for SSEC::Edit
Access:SSEC::UserGroup &FileManager,THREAD                 ! FileManager for SSEC::UserGroup
Relate:SSEC::UserGroup &RelationManager,THREAD             ! RelationManager for SSEC::UserGroup

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\useredit.INI', NVD_INI)                   ! Configure INIManager to use INI file
  DctInit
  Security.Init
  SecurityAccess = 32000  !Change to YOUR door
  SSEC::Main
  INIMgr.Update
  Security.Kill
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

