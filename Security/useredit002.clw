

   MEMBER('useredit.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('USEREDIT002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('USEREDIT001.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Update the SSEC::User File
!!! </summary>
SSEC::UpdateUser PROCEDURE 

CurrentTab           STRING(80)                            !
LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
RecordChanged        BYTE,AUTO                             !
L::AccessState       BYTE                                  !
L::GroupAccessState  BYTE                                  !
BRW7::View:Browse    VIEW(SSEC::UserInGroup)
                       PROJECT(SUIG_:UserNo)
                       PROJECT(SUIG_:UGrpNo)
                       JOIN(SUGrp_:NoKey,SUIG_:UGrpNo)
                         PROJECT(SUGrp_:LastName)
                         PROJECT(SUGrp_:No)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?GroupList
SUGrp_:LastName        LIKE(SUGrp_:LastName)          !List box control field - type derived from field
SUIG_:UserNo           LIKE(SUIG_:UserNo)             !Primary key field - type derived from field
SUIG_:UGrpNo           LIKE(SUIG_:UGrpNo)             !Primary key field - type derived from field
SUGrp_:No              LIKE(SUGrp_:No)                !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(SSEC::DoorGroup)
                       PROJECT(SDGrp_:Name)
                       PROJECT(SDGrp_:No)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?AreaList
SDGrp_:Name            LIKE(SDGrp_:Name)              !List box control field - type derived from field
SDGrp_:No              LIKE(SDGrp_:No)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(SSEC::Door)
                       PROJECT(SDoor_:Description)
                       PROJECT(SDoor_:No)
                       PROJECT(SDoor_:DGrpNo)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?DoorList
L::AccessState         LIKE(L::AccessState)           !List box control field - type derived from local data
L::AccessState_Icon    LONG                           !Entry's icon ID
L::GroupAccessState    LIKE(L::GroupAccessState)      !List box control field - type derived from local data
L::GroupAccessState_Icon LONG                         !Entry's icon ID
SDoor_:Description     LIKE(SDoor_:Description)       !List box control field - type derived from field
SDoor_:No              LIKE(SDoor_:No)                !Primary key field - type derived from field
SDoor_:DGrpNo          LIKE(SDoor_:DGrpNo)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::SUser_:Record LIKE(SUser_:RECORD),THREAD
QuickWindow          WINDOW('Update the SSEC::User File'),AT(,,350,199),FONT('MS Sans Serif',8),RESIZE,ICON('SSEC_USR.ICO'), |
  GRAY,IMM,MAX,MDI,HLP('UpdateUser'),SYSTEM
                       PANEL,AT(4,5,169,173),USE(?Panel1)
                       PROMPT('Last Na&me:'),AT(9,10),USE(?SUser_:LastName:Prompt)
                       ENTRY(@s25),AT(53,10,115,10),USE(SUser_:LastName),CAP,MSG('Last Name'),REQ
                       PROMPT('Fir&st Name:'),AT(9,24),USE(?SUser_:FirstName:Prompt)
                       ENTRY(@s15),AT(53,24,115,10),USE(SUser_:FirstName),CAP,MSG('First Name')
                       PROMPT('&Password:'),AT(9,38),USE(?SUser_:Password:Prompt)
                       ENTRY(@s20),AT(53,38,115,10),USE(SUser_:Password),UPR,MSG('Password')
                       PROMPT('Password Max Age (days):'),AT(9,52),USE(?SUser_:PasswordMaxAge:Prompt)
                       ENTRY(@n4b),AT(136,52,32,10),USE(SUser_:PasswordMaxAge),RIGHT(1),MSG('How many days unt' & |
  'il password change (0=Never)'),TIP('How many days until password change (0=Never)')
                       STRING('Failures since last good logon:'),AT(9,66),USE(?String3)
                       STRING(@n4),AT(145,66,23,10),USE(SUser_:Failures),FONT(,,,FONT:bold),RIGHT(2)
                       STRING('Last Good Logon:'),AT(9,78),USE(?String3:2)
                       STRING(@d17b),AT(74,78,52,10),USE(SUser_:LogonDate),FONT(,,,FONT:bold),RIGHT(2)
                       STRING(@t7b),AT(125,78,43,10),USE(SUser_:LogonTime),FONT(,,,FONT:bold),RIGHT(2)
                       STRING('Last Pwd Change:'),AT(9,90),USE(?String3:3)
                       STRING(@d17b),AT(74,90,52,10),USE(SUser_:PasswordDate),FONT(,,,FONT:bold),RIGHT(2)
                       STRING(@t7b),AT(125,90,43,10),USE(SUser_:PasswordTime),FONT(,,,FONT:bold),RIGHT(2)
                       LIST,AT(9,103,159,53),USE(?GroupList),VSCROLL,FORMAT('100L(2)|M~Groups~@s25@'),FROM(Queue:Browse:2), |
  IMM,MSG('Browsing Records')
                       BUTTON('&Insert'),AT(64,159,50,14),USE(?Insert)
                       BUTTON('Dele&te'),AT(118,159,50,14),USE(?Delete)
                       CHECK('Locked'),AT(9,162),USE(SUser_:Locked),FONT(,,,FONT:bold),MSG('Is this user locked out?'), |
  TIP('Is this user locked out?')
                       PANEL,AT(177,5,170,173),USE(?Panel2)
                       LIST,AT(183,11,158,60),USE(?AreaList),VSCROLL,FORMAT('120L(2)|M~Areas~@s30@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records')
                       LIST,AT(183,77,158,60),USE(?DoorList),VSCROLL,FORMAT('17L(17)|MI~Ind~C(0)@n3@17L(17)|MI' & |
  '~Grp~C(0)@n3@240L(2)|M~Door~@s60@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records')
                       BUTTON('&Grant'),AT(183,141,50,14),USE(?Grant),LEFT,ICON('SSEC_GRN.ICO')
                       BUTTON('&Clear'),AT(237,141,50,14),USE(?Clear)
                       BUTTON('&Deny'),AT(291,141,50,14),USE(?Deny),LEFT,ICON('SSEC_DEN.ICO')
                       BUTTON('Grant &All'),AT(183,159,50,14),USE(?GrantAll)
                       BUTTON('Clea&r All'),AT(237,159,50,14),USE(?ClearAll)
                       BUTTON('De&ny All'),AT(291,159,50,14),USE(?DenyAll)
                       STRING('Use [Clear] to prevent access normally.'),AT(4,180,185),USE(?String1)
                       STRING('Use [Deny] to prevent access, regardless of user''s groups.'),AT(4,189,185),USE(?String1:2)
                       BUTTON('&OK'),AT(189,182,50,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(243,182,50,14),USE(?Cancel)
                       BUTTON('Help'),AT(297,182,50,14),USE(?Help),STD(STD:Help)
                     END
SSEC::Viewing        BYTE(0)

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW7                 CLASS(BrowseClass)                    ! Browse using ?GroupList
Q                      &Queue:Browse:2                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW7::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW5                 CLASS(BrowseClass)                    ! Browse using ?AreaList
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW6                 CLASS(BrowseClass)                    ! Browse using ?DoorList
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW6::Sort0:StepClass StepStringClass                      ! Default Step Manager
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  IF ~Security.CheckUserGroupsExist()
    DISABLE(?Insert)
  END!IF
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Adding a User'
  OF ChangeRecord
    ActionMessage = 'Changing a User'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('SSEC::UpdateUser')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('L::AccessState',L::AccessState)                    ! Added by: BrowseBox(ABC)
  BIND('L::GroupAccessState',L::GroupAccessState)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(SUser_:Record,History::SUser_:Record)
  SELF.AddHistoryField(?SUser_:LastName,3)
  SELF.AddHistoryField(?SUser_:FirstName,4)
  SELF.AddHistoryField(?SUser_:Password,5)
  SELF.AddHistoryField(?SUser_:PasswordMaxAge,8)
  SELF.AddHistoryField(?SUser_:Failures,13)
  SELF.AddHistoryField(?SUser_:LogonDate,11)
  SELF.AddHistoryField(?SUser_:LogonTime,12)
  SELF.AddHistoryField(?SUser_:PasswordDate,9)
  SELF.AddHistoryField(?SUser_:PasswordTime,10)
  SELF.AddHistoryField(?SUser_:Locked,14)
  SELF.AddUpdateFile(Access:SSEC::User)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SSEC::Access.SetOpenRelated()
  Relate:SSEC::Access.Open                                 ! File SSEC::Access used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SSEC::User
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  IF SELF.Request = InsertRecord OR SELF.Request = ChangeRecord
    Security.SaveUser
  END!IF
  IF SELF.OriginalRequest = ChangeRecord
    SUser_:Password = Security.EncryptPassword(SUser_:Password, Security.PasswordSize())
  END!IF
  BRW7.Init(?GroupList,Queue:Browse:2.ViewPosition,BRW7::View:Browse,Queue:Browse:2,Relate:SSEC::UserInGroup,SELF) ! Initialize the browse manager
  BRW5.Init(?AreaList,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:SSEC::DoorGroup,SELF) ! Initialize the browse manager
  BRW6.Init(?DoorList,Queue:Browse:1.ViewPosition,BRW6::View:Browse,Queue:Browse:1,Relate:SSEC::Door,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  Resizer.Init(AppStrategy:Spread,Resize:SetMinSize,Resize:SetMaxSize) ! Controls will spread out as the window gets bigger
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW7.Q &= Queue:Browse:2
  BRW7::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon SUIG_:UserNo for sort order 1
  BRW7.AddSortOrder(BRW7::Sort0:StepClass,SUIG_:UserKey)   ! Add the sort order for SUIG_:UserKey for sort order 1
  BRW7.AddRange(SUIG_:UserNo,Relate:SSEC::UserInGroup,Relate:SSEC::User) ! Add file relationship range limit for sort order 1
  BRW7.AddField(SUGrp_:LastName,BRW7.Q.SUGrp_:LastName)    ! Field SUGrp_:LastName is a hot field or requires assignment from browse
  BRW7.AddField(SUIG_:UserNo,BRW7.Q.SUIG_:UserNo)          ! Field SUIG_:UserNo is a hot field or requires assignment from browse
  BRW7.AddField(SUIG_:UGrpNo,BRW7.Q.SUIG_:UGrpNo)          ! Field SUIG_:UGrpNo is a hot field or requires assignment from browse
  BRW7.AddField(SUGrp_:No,BRW7.Q.SUGrp_:No)                ! Field SUGrp_:No is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon SDGrp_:Name for sort order 1
  BRW5.AddSortOrder(BRW5::Sort0:StepClass,SDGrp_:NameKey)  ! Add the sort order for SDGrp_:NameKey for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,SDGrp_:Name,1,BRW5)            ! Initialize the browse locator using  using key: SDGrp_:NameKey , SDGrp_:Name
  BRW5.AddField(SDGrp_:Name,BRW5.Q.SDGrp_:Name)            ! Field SDGrp_:Name is a hot field or requires assignment from browse
  BRW5.AddField(SDGrp_:No,BRW5.Q.SDGrp_:No)                ! Field SDGrp_:No is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse:1
  BRW6::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon SDoor_:Description for sort order 1
  BRW6.AddSortOrder(BRW6::Sort0:StepClass,SDoor_:DGrpDescKey) ! Add the sort order for SDoor_:DGrpDescKey for sort order 1
  BRW6.AddRange(SDoor_:DGrpNo,Relate:SSEC::Door,Relate:SSEC::DoorGroup) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,SDoor_:Description,1,BRW6)     ! Initialize the browse locator using  using key: SDoor_:DGrpDescKey , SDoor_:Description
  ?DoorList{PROP:IconList,1} = '~SSEC_BLK.ICO'
  ?DoorList{PROP:IconList,2} = '~SSEC_DEN.ICO'
  ?DoorList{PROP:IconList,3} = '~SSEC_GR2.ICO'
  ?DoorList{PROP:IconList,4} = '~SSEC_GRN.ICO'
  BRW6.AddField(L::AccessState,BRW6.Q.L::AccessState)      ! Field L::AccessState is a hot field or requires assignment from browse
  BRW6.AddField(L::GroupAccessState,BRW6.Q.L::GroupAccessState) ! Field L::GroupAccessState is a hot field or requires assignment from browse
  BRW6.AddField(SDoor_:Description,BRW6.Q.SDoor_:Description) ! Field SDoor_:Description is a hot field or requires assignment from browse
  BRW6.AddField(SDoor_:No,BRW6.Q.SDoor_:No)                ! Field SDoor_:No is a hot field or requires assignment from browse
  BRW6.AddField(SDoor_:DGrpNo,BRW6.Q.SDoor_:DGrpNo)        ! Field SDoor_:DGrpNo is a hot field or requires assignment from browse
  INIMgr.Fetch('SSEC::UpdateUser',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW7.AskProcedure = 1
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    IF SELF.Response = RequestCancelled  |
    AND (SELF.OriginalRequest = InsertRecord OR SELF.OriginalRequest = ChangeRecord)
      Security.RestoreUser
    END!IF
    Relate:SSEC::Access.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::UpdateUser',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SSEC::UpdateUIG:User
    ReturnValue = GlobalResponse
  END
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Grant
      ThisWindow.Update()
      SSEC::GrantAccess()
      ThisWindow.Reset
      BRW6.ResetSort(1)
    OF ?Clear
      ThisWindow.Update()
      SSEC::DeleteAccess()
      ThisWindow.Reset
      BRW6.ResetSort(1)
    OF ?Deny
      ThisWindow.Update()
      SSEC::DenyAccess()
      ThisWindow.Reset
      BRW6.ResetSort(1)
    OF ?GrantAll
      ThisWindow.Update()
      SSEC::BulkAccess(Access:Grant)
      BRW6.ResetSort(1)
    OF ?ClearAll
      ThisWindow.Update()
      SSEC::BulkAccess(Access:Delete)
      BRW6.ResetSort(1)
    OF ?DenyAll
      ThisWindow.Update()
      SSEC::BulkAccess(Access:Deny)
      BRW6.ResetSort(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    SUser_:PasswordSize = LEN(CLIP(SUser_:Password))
    SUser_:Password     = Security.EncryptPassword(UPPER(SUser_:Password), SUser_:PasswordSize)
  ReturnValue = PARENT.TakeCompleted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW7.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.DeleteControl=?Delete
  END


BRW6.SetQueueRecord PROCEDURE

  CODE
  L::AccessState = SSEC::AccessState()
  L::GroupAccessState = SSEC::GroupAccessState()
  PARENT.SetQueueRecord
  
  IF (L::AccessState=1)
    SELF.Q.L::AccessState_Icon = 4                         ! Set icon from icon list
  ELSIF (L::AccessState=2)
    SELF.Q.L::AccessState_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.L::AccessState_Icon = 1                         ! Set icon from icon list
  END
  IF (L::GroupAccessState=1 AND L::AccessState<>2)
    SELF.Q.L::GroupAccessState_Icon = 4                    ! Set icon from icon list
  ELSIF (L::GroupAccessState=1 AND L::AccessState=2)
    SELF.Q.L::GroupAccessState_Icon = 3                    ! Set icon from icon list
  ELSE
    SELF.Q.L::GroupAccessState_Icon = 1                    ! Set icon from icon list
  END

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SSEC::User File
!!! </summary>
SSEC::SelectGroup PROCEDURE 

CurrentTab           STRING(80)                            !
LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
L::GroupFlag         BYTE(1)                               !
BRW1::View:Browse    VIEW(SSEC::UserGroup)
                       PROJECT(SUGrp_:LastName)
                       PROJECT(SUGrp_:No)
                       PROJECT(SUGrp_:GroupFlag)
                       PROJECT(SUGrp_:FirstName)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUGrp_:LastName        LIKE(SUGrp_:LastName)          !List box control field - type derived from field
SUGrp_:No              LIKE(SUGrp_:No)                !Browse hot field - type derived from field
SUGrp_:GroupFlag       LIKE(SUGrp_:GroupFlag)         !Browse key field - type derived from field
SUGrp_:FirstName       LIKE(SUGrp_:FirstName)         !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select Group'),AT(,,151,151),FONT('MS Sans Serif',8),RESIZE,ICON('SSEC_GRP.ICO'),GRAY, |
  IMM,MAX,MDI,HLP('SSEC::BrowseUser'),SYSTEM
                       LIST,AT(4,7,143,124),USE(?Browse:1),VSCROLL,FORMAT('100L(2)|M~Groups~@s25@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing Records')
                       BUTTON('&Select'),AT(4,135,45,12),USE(?Select)
                       BUTTON('Cancel'),AT(53,135,45,12),USE(?Close)
                       BUTTON('Help'),AT(102,135,45,12),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::SelectGroup')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SSEC::UserGroup.Open                              ! File SSEC::UserGroup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SSEC::UserGroup,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon SUGrp_:LastName for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,SUGrp_:GroupNameKey) ! Add the sort order for SUGrp_:GroupNameKey for sort order 1
  BRW1.AddRange(SUGrp_:GroupFlag,L::GroupFlag)             ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SUGrp_:LastName,1,BRW1)        ! Initialize the browse locator using  using key: SUGrp_:GroupNameKey , SUGrp_:LastName
  BRW1.AddField(SUGrp_:LastName,BRW1.Q.SUGrp_:LastName)    ! Field SUGrp_:LastName is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:No,BRW1.Q.SUGrp_:No)                ! Field SUGrp_:No is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:GroupFlag,BRW1.Q.SUGrp_:GroupFlag)  ! Field SUGrp_:GroupFlag is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:FirstName,BRW1.Q.SUGrp_:FirstName)  ! Field SUGrp_:FirstName is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SSEC::SelectGroup',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSEC::UserGroup.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::SelectGroup',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Select, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Select
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::UpdateUIG:User PROCEDURE                             ! Declare Procedure

  CODE
  Relate:SSEC::UserInGroup.Open
  Access:SSEC::UserInGroup.UseFile
  CASE GlobalRequest
  OF InsertRecord
    GlobalRequest = SelectRecord
    SSEC::SelectGroup
    IF GlobalResponse = RequestCompleted
      SUIG_:UserNo = SUser_:No
      SUIG_:UGrpNo = SUGrp_:No
      IF Access:SSEC::UserInGroup.TryInsert()
        MESSAGE('This User is already a member of the Group!','Warning!',ICON:Asterisk)
      END!IF
    END!IF
  OF DeleteRecord
    IF MESSAGE('Do you want to remove this user from this group?','Remove User From Group?',ICON:Question,BUTTON:Ok+BUTTON:Cancel,BUTTON:Cancel)=BUTTON:Ok
      Relate:SSEC::UserInGroup.Delete(0)
      GlobalResponse = RequestCompleted
    END!IF
  END!CASE
  Relate:SSEC::UserInGroup.Close
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::GroupAccessState PROCEDURE                           ! Declare Procedure
L::Manage:GroupView  ViewManager
L::GroupView         VIEW(SSEC::UserInGroup)
                       PROJECT(SUIG_:UserNo)
                       PROJECT(SUIG_:UGrpNo)
                       JOIN(SAcc_:UserDoorKey, SUIG_:UGrpNo)
                         PROJECT(SAcc_:UserNo)
                         PROJECT(SAcc_:DoorNo)
                         PROJECT(SAcc_:DenyFlag)
                       END!JOIN
                     END!VIEW
L::RetVal            BYTE(False)

  CODE
  PUSHBIND(1)
  Relate:SSEC::UserInGroup.Open
  L::Manage:GroupView.Init(L::GroupView, Relate:SSEC::UserInGroup)
  L::Manage:GroupView.AddSortOrder
  L::Manage:GroupView.SetFilter('SUIG_:UserNo='& SUser_:No &' AND SAcc_:DoorNo='& SDoor_:No &' AND ~SAcc_:DenyFlag')
  SET(SSEC::UserInGroup)
  L::Manage:GroupView.Reset
  IF ~L::Manage:GroupView.Next()
    L::RetVal = True
  END!IF
  L::Manage:GroupView.Close
  L::Manage:GroupView.Kill
  Relate:SSEC::UserInGroup.Close
  POPBIND
  RETURN L::RetVal
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SSEC::User File
!!! </summary>
SSEC::BrowseUser PROCEDURE 

CurrentTab           STRING(80)                            !
LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
L::GroupFlag         BYTE                                  !
BRW1::View:Browse    VIEW(SSEC::User)
                       PROJECT(SUser_:LastName)
                       PROJECT(SUser_:FirstName)
                       PROJECT(SUser_:No)
                       PROJECT(SUser_:GroupFlag)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUser_:LastName        LIKE(SUser_:LastName)          !List box control field - type derived from field
SUser_:FirstName       LIKE(SUser_:FirstName)         !List box control field - type derived from field
SUser_:No              LIKE(SUser_:No)                !Primary key field - type derived from field
SUser_:GroupFlag       LIKE(SUser_:GroupFlag)         !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Users'),AT(,,152,166),FONT('MS Sans Serif',8),RESIZE,ICON('SSEC_USR.ICO'),GRAY,IMM, |
  MAX,MDI,HLP('SSEC::BrowseUser'),SYSTEM
                       LIST,AT(4,7,143,124),USE(?Browse:1),VSCROLL,FORMAT('71L(2)|M~Last Name~@s25@64L(2)|M~Fi' & |
  'rst Name~@s15@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records')
                       BUTTON('&Insert'),AT(4,135,45,12),USE(?Insert:2)
                       BUTTON('&Change'),AT(53,135,45,12),USE(?Change:2),DEFAULT
                       BUTTON('&Delete'),AT(102,135,45,12),USE(?Delete:2)
                       BUTTON('Cl&ose'),AT(53,151,45,12),USE(?Close)
                       BUTTON('Help'),AT(102,151,45,12),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::BrowseUser')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SSEC::User.SetOpenRelated()
  Relate:SSEC::User.Open                                   ! File SSEC::User used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SSEC::User,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon SUser_:LastName for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,SUser_:GroupNameKey) ! Add the sort order for SUser_:GroupNameKey for sort order 1
  BRW1.AddRange(SUser_:GroupFlag,L::GroupFlag)             ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SUser_:LastName,1,BRW1)        ! Initialize the browse locator using  using key: SUser_:GroupNameKey , SUser_:LastName
  BRW1.AddField(SUser_:LastName,BRW1.Q.SUser_:LastName)    ! Field SUser_:LastName is a hot field or requires assignment from browse
  BRW1.AddField(SUser_:FirstName,BRW1.Q.SUser_:FirstName)  ! Field SUser_:FirstName is a hot field or requires assignment from browse
  BRW1.AddField(SUser_:No,BRW1.Q.SUser_:No)                ! Field SUser_:No is a hot field or requires assignment from browse
  BRW1.AddField(SUser_:GroupFlag,BRW1.Q.SUser_:GroupFlag)  ! Field SUser_:GroupFlag is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SSEC::BrowseUser',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    INIMgr.Update('SSEC::BrowseUser',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SSEC::UpdateUser
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Insert:2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert:2
  SELF.SetStrategy(?Change:2, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change:2
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the SSEC::User File
!!! </summary>
SSEC::PrintGroupByAccess PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(SSEC::DoorGroup)
                       PROJECT(SDGrp_:Name)
                       PROJECT(SDGrp_:No)
                       JOIN(SDoor_:DGrpDescKey,SDGrp_:No)
                         PROJECT(SDoor_:Description)
                         PROJECT(SDoor_:No)
                         JOIN(SAcc_:DoorUserKey,SDoor_:No)
                           PROJECT(SAcc_:UserNo)
                           JOIN(SUser_:NoKey,SAcc_:UserNo)
                             PROJECT(SUser_:LastName)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Report Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1350,6500,7400),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(1000,750,6500,550)
                         STRING(@pPage <<<#p),AT(5900,0,600,167),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                         STRING('User Groups by Access'),AT(1400,0,3700,167),FONT(,,,FONT:bold),CENTER
                         STRING('User Group'),AT(4500,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Door Group'),AT(0,333,800,167),USE(?String9),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Door'),AT(1900,333,400,167),USE(?String9:2),FONT(,,,FONT:italic+FONT:underline),TRN
                       END
break2                 BREAK(SDGrp_:No)
                         HEADER,AT(0,0)
                           STRING(@s30),AT(0,0),USE(SDGrp_:Name),FONT(,,,FONT:bold)
                         END
break1                   BREAK(SDoor_:No)
                           HEADER,AT(0,0)
                             STRING(@s60),AT(1900,0),USE(SDoor_:Description),FONT(,,,FONT:bold)
                           END
detail                     DETAIL,USE(?detail)
                             STRING(@s25),AT(4500,0,2000,167),USE(SUser_:LastName)
                           END
                         END
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::PrintGroupByAccess')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  Relate:SSEC::DoorGroup.SetOpenRelated()
  Relate:SSEC::DoorGroup.Open                              ! File SSEC::DoorGroup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::PrintGroupByAccess',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:SSEC::DoorGroup, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SDGrp_:Name)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(SDGrp_:NameKey)
  ThisReport.AppendOrder('SUser_:LastName,SUser_:FirstName')
  ThisReport.SetFilter('SUser_:GroupFlag')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SSEC::DoorGroup.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSEC::DoorGroup.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::PrintGroupByAccess',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the SSEC::User File
!!! </summary>
SSEC::PrintGroupByName PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(SSEC::User)
                       PROJECT(SUser_:FirstName)
                       PROJECT(SUser_:LastName)
                       PROJECT(SUser_:Level)
                     END
ProgressWindow       WINDOW('Report Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1350,6500,7400),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(1000,750,6500,550)
                         STRING(@pPage <<<#p),AT(5900,0,600,167),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                         STRING('Groups by Name'),AT(1400,0,3700,167),FONT(,,,FONT:bold),CENTER
                         STRING('Group'),AT(2000,333,500,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Level'),AT(4100,333,400,167),FONT(,,,FONT:italic+FONT:underline),TRN
                       END
detail                 DETAIL,USE(?detail)
                         STRING(@s25),AT(2000,0),USE(SUser_:LastName)
                         STRING(@s5),AT(4083,0),USE(SUser_:Level)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::PrintGroupByName')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  Relate:SSEC::User.SetOpenRelated()
  Relate:SSEC::User.Open                                   ! File SSEC::User used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::PrintGroupByName',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:SSEC::User, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SUser_:LastName)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(SUser_:NameKey)
  ThisReport.SetFilter('SUser_:GroupFlag')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SSEC::User.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
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
    INIMgr.Update('SSEC::PrintGroupByName',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the SSEC::User File
!!! </summary>
SSEC::PrintUserByAccess PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(SSEC::DoorGroup)
                       PROJECT(SDGrp_:Name)
                       PROJECT(SDGrp_:No)
                       JOIN(SDoor_:DGrpDescKey,SDGrp_:No)
                         PROJECT(SDoor_:Description)
                         PROJECT(SDoor_:No)
                         JOIN(SAcc_:DoorUserKey,SDoor_:No)
                           PROJECT(SAcc_:UserNo)
                           JOIN(SUser_:NoKey,SAcc_:UserNo)
                             PROJECT(SUser_:FirstName)
                             PROJECT(SUser_:LastName)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Report Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1350,6500,7400),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(1000,750,6500,550)
                         STRING(@pPage <<<#p),AT(5900,0,600,167),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                         STRING('Users by Access'),AT(1400,0,3700,167),FONT(,,,FONT:bold),CENTER
                         STRING('Last Name'),AT(3100,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Door Group'),AT(0,333,800,167),USE(?String9),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('First Name'),AT(5200,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Door'),AT(1400,333,400,167),USE(?String9:2),FONT(,,,FONT:italic+FONT:underline),TRN
                       END
break2                 BREAK(SDGrp_:No)
                         HEADER,AT(0,0)
                           STRING(@s30),AT(0,0),USE(SDGrp_:Name),FONT(,,,FONT:bold)
                         END
break1                   BREAK(SDoor_:No)
                           HEADER,AT(0,0)
                             STRING(@s60),AT(1400,0),USE(SDoor_:Description),FONT(,,,FONT:bold)
                           END
detail                     DETAIL,USE(?detail)
                             STRING(@s25),AT(3100,0,2000,167),USE(SUser_:LastName)
                             STRING(@s15),AT(5200,0,1200,167),USE(SUser_:FirstName)
                           END
                         END
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::PrintUserByAccess')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  Relate:SSEC::DoorGroup.SetOpenRelated()
  Relate:SSEC::DoorGroup.Open                              ! File SSEC::DoorGroup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::PrintUserByAccess',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:SSEC::DoorGroup, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SDGrp_:Name)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(SDGrp_:NameKey)
  ThisReport.AppendOrder('SUser_:LastName,SUser_:FirstName')
  ThisReport.SetFilter('~SUser_:GroupFlag')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SSEC::DoorGroup.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSEC::DoorGroup.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::PrintUserByAccess',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the SSEC::User File
!!! </summary>
SSEC::PrintUserByGroup PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(SSEC::UserGroup)
                       PROJECT(SUGrp_:FirstName)
                       PROJECT(SUGrp_:LastName)
                       PROJECT(SUGrp_:Level)
                       PROJECT(SUGrp_:No)
                       JOIN(SUIG_:UGrpKey,SUGrp_:No)
                         PROJECT(SUIG_:UserNo)
                         JOIN(SUser_:NoKey,SUIG_:UserNo)
                           PROJECT(SUser_:FirstName)
                           PROJECT(SUser_:LastName)
                           PROJECT(SUser_:Level)
                         END
                       END
                     END
ProgressWindow       WINDOW('Report Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1350,6500,7400),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(1000,750,6500,550)
                         STRING(@pPage <<<#p),AT(5900,0,600,167),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                         STRING('Group'),AT(0,333,500,167),USE(?String9),FONT(,,,FONT:italic+FONT:underline)
                         STRING('Users by Group'),AT(1400,0,3700,167),FONT(,,,FONT:bold),CENTER
                         STRING('Last Name'),AT(2500,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('First Name'),AT(4600,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Level'),AT(6000,333,400,167),FONT(,,,FONT:italic+FONT:underline),TRN
                       END
break1                 BREAK(SUGrp_:No)
                         HEADER,AT(0,0)
                           STRING(@s25),AT(0,0),USE(SUGrp_:LastName),FONT(,,,FONT:bold)
                           STRING(@s5),AT(6000,0),USE(SUGrp_:Level),FONT(,,,FONT:bold)
                         END
detail                   DETAIL,USE(?detail)
                           STRING(@s25),AT(2500,0),USE(SUser_:LastName)
                           STRING(@s15),AT(4600,0),USE(SUser_:FirstName)
                           STRING(@s5),AT(6000,0),USE(SUser_:Level)
                         END
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::PrintUserByGroup')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  Relate:SSEC::UserGroup.Open                              ! File SSEC::UserGroup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::PrintUserByGroup',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:SSEC::UserGroup, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SUGrp_:LastName)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(SUGrp_:NameKey)
  ThisReport.SetFilter('SUGrp_:GroupFlag')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SSEC::UserGroup.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSEC::UserGroup.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::PrintUserByGroup',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the SSEC::User File
!!! </summary>
SSEC::PrintUserByName PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(SSEC::User)
                       PROJECT(SUser_:FirstName)
                       PROJECT(SUser_:LastName)
                       PROJECT(SUser_:Level)
                     END
ProgressWindow       WINDOW('Report Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1350,6500,7400),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(1000,750,6500,550)
                         STRING(@pPage <<<#p),AT(5900,0,600,167),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                         STRING('Users by Name'),AT(1400,0,3700,167),FONT(,,,FONT:bold),CENTER
                         STRING('Last Name'),AT(1300,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('First Name'),AT(3400,333,800,167),FONT(,,,FONT:italic+FONT:underline),TRN
                         STRING('Level'),AT(4700,333,400,167),FONT(,,,FONT:italic+FONT:underline),TRN
                       END
detail                 DETAIL,USE(?detail)
                         STRING(@s25),AT(1300,0),USE(SUser_:LastName)
                         STRING(@s15),AT(3400,0),USE(SUser_:FirstName)
                         STRING(@s5),AT(4700,0),USE(SUser_:Level)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::PrintUserByName')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  Relate:SSEC::User.SetOpenRelated()
  Relate:SSEC::User.Open                                   ! File SSEC::User used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::PrintUserByName',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:SSEC::User, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SUser_:LastName)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(SUser_:NameKey)
  ThisReport.SetFilter('~SUser_:GroupFlag')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SSEC::User.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
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
    INIMgr.Update('SSEC::PrintUserByName',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SSEC::UserEdit PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Window               WINDOW('User Editor'),AT(,,107,144),FONT('MS Sans Serif',8),DOUBLE,CENTER,GRAY,MDI,SYSTEM
                       BUTTON('&Users'),AT(6,6,46,12),USE(?UserButton),LEFT,ICON('SSEC_USR.ICO')
                       BUTTON('&Groups'),AT(56,6,46,12),USE(?GroupButton),LEFT,ICON('SSEC_GRP.ICO')
                       BUTTON('Print Users by &Name'),AT(6,30,96,12),USE(?PrintUserByName),LEFT,ICON(ICON:Print)
                       BUTTON('Print Users by &Group'),AT(6,46,96,12),USE(?PrintUserByGroup),LEFT,ICON(ICON:Print)
                       BUTTON('Print Users by &Access'),AT(6,62,96,12),USE(?PrintUserByAccess),LEFT,ICON(ICON:Print)
                       BUTTON('Print Groups by N&ame'),AT(6,86,96,12),USE(?PrintGroupByName),LEFT,ICON(ICON:Print)
                       BUTTON('Print Groups by A&ccess'),AT(6,102,96,12),USE(?PrintGroupByAccess),LEFT,ICON(ICON:Print)
                       BUTTON('Cl&ose'),AT(6,126,96,12),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SSEC::UserEdit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?UserButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF NOT Security.CheckAccess(SecurityAccess,,,0)
    RETURN Level:Fatal
  END!IF
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::UserEdit',Window)                    ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('SSEC::UserEdit',Window)                 ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?UserButton
      ThisWindow.Update()
      SSEC::BrowseUser()
      ThisWindow.Reset
    OF ?GroupButton
      ThisWindow.Update()
      SSEC::BrowseUserGroup()
      ThisWindow.Reset
    OF ?PrintUserByName
      ThisWindow.Update()
      SSEC::PrintUserByName()
      ThisWindow.Reset
    OF ?PrintUserByGroup
      ThisWindow.Update()
      SSEC::PrintUserByGroup()
      ThisWindow.Reset
    OF ?PrintUserByAccess
      ThisWindow.Update()
      SSEC::PrintUserByAccess()
      ThisWindow.Reset
    OF ?PrintGroupByName
      ThisWindow.Update()
      SSEC::PrintGroupByName()
      ThisWindow.Reset
    OF ?PrintGroupByAccess
      ThisWindow.Update()
      SSEC::PrintGroupByAccess()
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

