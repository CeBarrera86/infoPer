

   MEMBER('useredit.clw')                                  ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('USEREDIT001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('USEREDIT002.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::FetchAccess    PROCEDURE                             ! Declare Procedure
L::RetVal            BYTE,AUTO

  CODE
  Relate:SSEC::Access.Open
  Access:SSEC::Access.UseFile
  SAcc_:UserNo = SUser_:No
  SAcc_:DoorNo = SDoor_:No
  L::RetVal = Access:SSEC::Access.TryFetch(SAcc_:UserDoorKey)
  Relate:SSEC::Access.Close
  RETURN L::RetVal
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::DeleteAccess   PROCEDURE                             ! Declare Procedure

  CODE
  Relate:SSEC::Access.Open
  Access:SSEC::Access.UseFile
  IF ~SSEC::FetchAccess()
    Relate:SSEC::Access.Delete(0)
  END!IF
  Relate:SSEC::Access.Close
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::GrantAccess    PROCEDURE                             ! Declare Procedure

  CODE
  Relate:SSEC::Access.Open
  Access:SSEC::Access.UseFile
  IF ~SSEC::FetchAccess()
    IF SAcc_:DenyFlag
      CLEAR(SAcc_:DenyFlag)
      Access:SSEC::Access.Update
    END!IF
  ELSE
    Access:SSEC::Access.PrimeRecord
    SAcc_:UserNo = SUser_:No
    SAcc_:DoorNo = SDoor_:No
    Access:SSEC::Access.Insert
  END!IF
  Relate:SSEC::Access.Close
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SSEC::User File
!!! </summary>
SSEC::SelectUser PROCEDURE 

CurrentTab           STRING(80)                            !
LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
L::GroupFlag         BYTE                                  !
L::UserName          STRING(40)                            !
BRW1::View:Browse    VIEW(SSEC::UserGroup)
                       PROJECT(SUGrp_:No)
                       PROJECT(SUGrp_:LastName)
                       PROJECT(SUGrp_:FirstName)
                       PROJECT(SUGrp_:GroupFlag)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
L::UserName            LIKE(L::UserName)              !List box control field - type derived from local data
SUGrp_:No              LIKE(SUGrp_:No)                !Browse hot field - type derived from field
SUGrp_:LastName        LIKE(SUGrp_:LastName)          !Browse hot field - type derived from field
SUGrp_:FirstName       LIKE(SUGrp_:FirstName)         !Browse hot field - type derived from field
SUGrp_:GroupFlag       LIKE(SUGrp_:GroupFlag)         !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select User'),AT(,,151,151),FONT('MS Sans Serif',8),RESIZE,ICON('SSEC_USR.ICO'),GRAY, |
  IMM,MAX,MDI,HLP('SSEC::BrowseUser'),SYSTEM
                       LIST,AT(4,7,143,124),USE(?Browse:1),VSCROLL,FORMAT('160L(2)|M~Users~@s40@'),FROM(Queue:Browse:1), |
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
SetQueueRecord         PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('SSEC::SelectUser')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('L::UserName',L::UserName)                          ! Added by: BrowseBox(ABC)
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
  BRW1.AddField(L::UserName,BRW1.Q.L::UserName)            ! Field L::UserName is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:No,BRW1.Q.SUGrp_:No)                ! Field SUGrp_:No is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:LastName,BRW1.Q.SUGrp_:LastName)    ! Field SUGrp_:LastName is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:FirstName,BRW1.Q.SUGrp_:FirstName)  ! Field SUGrp_:FirstName is a hot field or requires assignment from browse
  BRW1.AddField(SUGrp_:GroupFlag,BRW1.Q.SUGrp_:GroupFlag)  ! Field SUGrp_:GroupFlag is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SSEC::SelectUser',QuickWindow)             ! Restore window settings from non-volatile store
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
    INIMgr.Update('SSEC::SelectUser',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.SetQueueRecord PROCEDURE

  CODE
  L::UserName = CLIP(SUGrp_:LastName) & ', ' & SUGrp_:FirstName
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Select, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Select
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::UpdateUIG:Group PROCEDURE                            ! Declare Procedure

  CODE
  Relate:SSEC::UserInGroup.Open
  Access:SSEC::UserInGroup.UseFile
  CASE GlobalRequest
  OF InsertRecord
    GlobalRequest = SelectRecord
    SSEC::SelectUser
    IF GlobalResponse = RequestCompleted
      SUIG_:UserNo = SUGrp_:No     !These two assignments are switched, so that we
      SUIG_:UGrpNo = SUser_:No     !could use the UserGroup alias to represent users.
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
SSEC::AccessState    PROCEDURE                             ! Declare Procedure

  CODE
  IF ~SSEC::FetchAccess()
    RETURN CHOOSE(~SAcc_:DenyFlag, 1, 2)
  ELSE
    RETURN 0
  END!IF
!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
SSEC::BulkAccess PROCEDURE (p_Task)

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(SSEC::Door)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('SSEC::BulkAccess')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SSEC::Access.SetOpenRelated()
  Relate:SSEC::Access.Open                                 ! File SSEC::Access used by this procedure, so make sure it's RelationManager is open
  Access:SSEC::DoorGroup.UseFile                           ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::BulkAccess',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SSEC::Door, ?Progress:PctText, Progress:Thermometer, 10)
  ThisProcess.AddSortOrder(SDoor_:DGrpDescKey)
  ThisProcess.AddRange(SDoor_:DGrpNo,Relate:SSEC::Door,Relate:SSEC::DoorGroup)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SSEC::Door,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SSEC::Access.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::BulkAccess',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  CASE p_Task
    OF Access:Grant;  SSEC::GrantAccess
    OF Access:Delete; SSEC::DeleteAccess
    OF Access:Deny;   SSEC::DenyAccess
  END!CASE
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
SSEC::DenyAccess     PROCEDURE                             ! Declare Procedure

  CODE
  Relate:SSEC::Access.Open
  Access:SSEC::Access.UseFile
  IF ~SSEC::FetchAccess()
    IF ~SAcc_:DenyFlag
      SAcc_:DenyFlag = True
      Relate:SSEC::Access.Update
    END!IF
  ELSE
    Access:SSEC::Access.PrimeRecord
    SAcc_:UserNo = SUser_:No
    SAcc_:DoorNo = SDoor_:No
    SAcc_:DenyFlag = True
    Access:SSEC::Access.Insert
  END!IF
  Relate:SSEC::Access.Close
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SSEC::User File
!!! </summary>
SSEC::BrowseUserGroup PROCEDURE 

CurrentTab           STRING(80)                            !
LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
L::GroupFlag         BYTE(1)                               !
BRW1::View:Browse    VIEW(SSEC::User)
                       PROJECT(SUser_:LastName)
                       PROJECT(SUser_:No)
                       PROJECT(SUser_:GroupFlag)
                       PROJECT(SUser_:FirstName)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUser_:LastName        LIKE(SUser_:LastName)          !List box control field - type derived from field
SUser_:No              LIKE(SUser_:No)                !Primary key field - type derived from field
SUser_:GroupFlag       LIKE(SUser_:GroupFlag)         !Browse key field - type derived from field
SUser_:FirstName       LIKE(SUser_:FirstName)         !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Groups of Users'),AT(,,151,166),FONT('MS Sans Serif',8),RESIZE,ICON('SSEC_GRP.ICO'), |
  GRAY,IMM,MAX,MDI,HLP('SSEC::BrowseUser'),SYSTEM
                       LIST,AT(4,7,143,124),USE(?Browse:1),VSCROLL,FORMAT('89L(2)|M~Group~@s25@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing Records')
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
  GlobalErrors.SetProcedureName('SSEC::BrowseUserGroup')
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
  BRW1.AddField(SUser_:No,BRW1.Q.SUser_:No)                ! Field SUser_:No is a hot field or requires assignment from browse
  BRW1.AddField(SUser_:GroupFlag,BRW1.Q.SUser_:GroupFlag)  ! Field SUser_:GroupFlag is a hot field or requires assignment from browse
  BRW1.AddField(SUser_:FirstName,BRW1.Q.SUser_:FirstName)  ! Field SUser_:FirstName is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SSEC::BrowseUserGroup',QuickWindow)        ! Restore window settings from non-volatile store
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
    INIMgr.Update('SSEC::BrowseUserGroup',QuickWindow)     ! Save window data to non-volatile store
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
    SSEC::UpdateUserGroup
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
!!! Generated from procedure template - Frame
!!! </summary>
SSEC::Main PROCEDURE 

LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
CurrentTab           STRING(80)                            !
AppFrame             APPLICATION('User Editor'),AT(,,344,190),FONT('MS Sans Serif',8),RESIZE,MAXIMIZE,ICON('SSEC.ICO'), |
  MAX,STATUS(-1,80,120,45),SYSTEM,IMM
                       MENUBAR
                         MENU('&File'),USE(?FileMenu)
                           MENU('&Print'),USE(?FilePrint)
                             ITEM('Users by &Name'),USE(?FilePrintUsersbyName)
                             ITEM('Users by &Group'),USE(?FilePrintUsersbyGroup)
                             ITEM('Users by &Access'),USE(?FilePrintUsersbyAccess)
                             ITEM,SEPARATOR
                             ITEM('Groups by N&ame'),USE(?FilePrintGroupsbyName)
                             ITEM('Groups by A&ccess'),USE(?FilePrintGroupsbyAccess)
                           END
                           ITEM('P&rint Setup...'),USE(?PrintSetup),MSG('Setup Printer'),STD(STD:PrintSetup)
                           ITEM,SEPARATOR
                           ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Edit'),USE(?EditMenu)
                           ITEM('Cu&t'),USE(?Cut),MSG('Remove item to Windows Clipboard'),STD(STD:Cut)
                           ITEM('&Copy'),USE(?Copy),MSG('Copy item to Windows Clipboard'),STD(STD:Copy)
                           ITEM('&Paste'),USE(?Paste),MSG('Paste contents of Windows Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Browse'),USE(?Browse)
                           ITEM('&Users...<09H>Ctrl+U'),USE(?BrowseUsers),KEY(CtrlU)
                           ITEM('&Groups...<09H>Ctrl+G'),USE(?BrowseGroups),KEY(CtrlG)
                         END
                         MENU('&Window'),MSG('Create and Arrange windows'),STD(STD:WindowList)
                           ITEM('T&ile'),USE(?Tile),MSG('Make all open windows visible'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Stack all open windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Align all window icons'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),MSG('Windows Help')
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('How to use Windows Help'),STD(STD:HelpOnHelp)
                         END
                       END
                       TOOLBAR,AT(0,0,344,16)
                         BUTTON('Users'),AT(1,1,50,14),USE(?UsersButton),LEFT,ICON('SSEC_USR.ICO')
                         BUTTON('Groups'),AT(51,1,50,14),USE(?GroupsButton),LEFT,ICON('SSEC_GRP.ICO')
                       END
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
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::FilePrint ROUTINE                                    ! Code for menu items on ?FilePrint
  CASE ACCEPTED()
  OF ?FilePrintUsersbyName
    START(SSEC::PrintUserByName, 25000)
  OF ?FilePrintUsersbyGroup
    START(SSEC::PrintUserByGroup, 25000)
  OF ?FilePrintUsersbyAccess
    START(SSEC::PrintUserByAccess, 25000)
  OF ?FilePrintGroupsbyName
    START(SSEC::PrintGroupByName, 25000)
  OF ?FilePrintGroupsbyAccess
    START(SSEC::PrintGroupByAccess, 25000)
  END
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::Browse ROUTINE                                       ! Code for menu items on ?Browse
  CASE ACCEPTED()
  OF ?BrowseUsers
    START(SSEC::BrowseUser, 25000)
  OF ?BrowseGroups
    SSEC::BrowseUserGroup()
  END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  Security.LoadQs
  IF NOT Security.Logon()
    RETURN Level:Fatal
  END!IF
  GlobalErrors.SetProcedureName('SSEC::Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SSEC::Main',AppFrame)                      ! Restore window settings from non-volatile store
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('SSEC::Main',AppFrame)                   ! Save window data to non-volatile store
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
    ELSE
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::FilePrint                                   ! Process menu items on ?FilePrint menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::Browse                                      ! Process menu items on ?Browse menu
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?UsersButton
      START(SSEC::BrowseUser, 25000)
    OF ?GroupsButton
      START(SSEC::BrowseUserGroup, 25000)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Update the SSEC::User File
!!! </summary>
SSEC::UpdateUserGroup PROCEDURE 

CurrentTab           STRING(80)                            !
LocalRequest         LONG                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
RecordChanged        BYTE,AUTO                             !
L::AccessState       BYTE                                  !
L::UserName          STRING(40)                            !
BRW7::View:Browse    VIEW(SSEC::UserInGroup)
                       PROJECT(SUIG_:UserNo)
                       PROJECT(SUIG_:UGrpNo)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?GroupList
L::UserName            LIKE(L::UserName)              !List box control field - type derived from local data
SUIG_:UserNo           LIKE(SUIG_:UserNo)             !Browse hot field - type derived from field
SUIG_:UGrpNo           LIKE(SUIG_:UGrpNo)             !Primary key field - type derived from field
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
SDoor_:Description     LIKE(SDoor_:Description)       !List box control field - type derived from field
SDoor_:No              LIKE(SDoor_:No)                !Primary key field - type derived from field
SDoor_:DGrpNo          LIKE(SDoor_:DGrpNo)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::SUser_:Record LIKE(SUser_:RECORD),THREAD
QuickWindow          WINDOW('Update the SSEC::User File'),AT(,,329,193),FONT('MS Sans Serif',8),RESIZE,ICON('SSEC_USR.ICO'), |
  GRAY,IMM,MAX,MDI,HLP('UpdateUser'),SYSTEM
                       PANEL,AT(4,5,159,169),USE(?Panel1)
                       PROMPT('Gro&up:'),AT(9,10),USE(?SUser_:LastName:Prompt)
                       ENTRY(@s25),AT(36,10,121,10),USE(SUser_:LastName),CAP,MSG('Last Name'),REQ
                       LIST,AT(9,26,149,128),USE(?GroupList),VSCROLL,FORMAT('160L(2)|M~Group Members~@s40@'),FROM(Queue:Browse:2), |
  IMM,MSG('Browsing Records')
                       BUTTON('&Insert'),AT(70,157,42,12),USE(?Insert)
                       BUTTON('Dele&te'),AT(116,157,42,12),USE(?Delete)
                       PANEL,AT(167,5,159,169),USE(?Panel2)
                       LIST,AT(173,11,147,60),USE(?AreaList),VSCROLL,FORMAT('120L(2)|M~Areas~@s30@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records')
                       LIST,AT(173,77,147,60),USE(?DoorList),VSCROLL,FORMAT('17L(17)|MI~Acc~C(0)@n3@240L(2)|M~' & |
  'Door~@s60@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records')
                       BUTTON('&Grant'),AT(226,141,45,12),USE(?Grant),LEFT,ICON('SSEC_GRN.ICO')
                       BUTTON('&Clear'),AT(275,141,45,12),USE(?Clear)
                       BUTTON('Grant &All'),AT(226,157,45,12),USE(?GrantAll)
                       BUTTON('Clea&r All'),AT(275,157,45,12),USE(?ClearAll)
                       BUTTON('&OK'),AT(183,178,45,12),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(232,178,45,12),USE(?Cancel)
                       BUTTON('Help'),AT(281,178,45,12),USE(?Help),STD(STD:Help)
                     END
SSEC::Viewing        BYTE(0)

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW7                 CLASS(BrowseClass)                    ! Browse using ?GroupList
Q                      &Queue:Browse:2                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
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
  IF ~Security.CheckUsersExist()
    DISABLE(?Insert)
  END!IF
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Adding a Group'
  OF ChangeRecord
    ActionMessage = 'Changing a Group'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('SSEC::UpdateUserGroup')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('L::UserName',L::UserName)                          ! Added by: BrowseBox(ABC)
  BIND('L::AccessState',L::AccessState)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(SUser_:Record,History::SUser_:Record)
  SELF.AddHistoryField(?SUser_:LastName,3)
  SELF.AddUpdateFile(Access:SSEC::User)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SSEC::Access.SetOpenRelated()
  Relate:SSEC::Access.Open                                 ! File SSEC::Access used by this procedure, so make sure it's RelationManager is open
  Access:SSEC::UserGroup.UseFile                           ! File referenced in 'Other Files' so need to inform it's FileManager
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
    Security.SaveUserGroup
  END!IF
  BRW7.Init(?GroupList,Queue:Browse:2.ViewPosition,BRW7::View:Browse,Queue:Browse:2,Relate:SSEC::UserInGroup,SELF) ! Initialize the browse manager
  BRW5.Init(?AreaList,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:SSEC::DoorGroup,SELF) ! Initialize the browse manager
  BRW6.Init(?DoorList,Queue:Browse:1.ViewPosition,BRW6::View:Browse,Queue:Browse:1,Relate:SSEC::Door,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  Resizer.Init(AppStrategy:Spread,Resize:SetMinSize)       ! Controls will spread out as the window gets bigger
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW7.Q &= Queue:Browse:2
  BRW7::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon SUIG_:UGrpNo for sort order 1
  BRW7.AddSortOrder(BRW7::Sort0:StepClass,SUIG_:UGrpKey)   ! Add the sort order for SUIG_:UGrpKey for sort order 1
  BRW7.AddRange(SUIG_:UGrpNo,SUser_:No)                    ! Add single value range limit for sort order 1
  BRW7.AddField(L::UserName,BRW7.Q.L::UserName)            ! Field L::UserName is a hot field or requires assignment from browse
  BRW7.AddField(SUIG_:UserNo,BRW7.Q.SUIG_:UserNo)          ! Field SUIG_:UserNo is a hot field or requires assignment from browse
  BRW7.AddField(SUIG_:UGrpNo,BRW7.Q.SUIG_:UGrpNo)          ! Field SUIG_:UGrpNo is a hot field or requires assignment from browse
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
  ?DoorList{PROP:IconList,3} = '~SSEC_GRN.ICO'
  BRW6.AddField(L::AccessState,BRW6.Q.L::AccessState)      ! Field L::AccessState is a hot field or requires assignment from browse
  BRW6.AddField(SDoor_:Description,BRW6.Q.SDoor_:Description) ! Field SDoor_:Description is a hot field or requires assignment from browse
  BRW6.AddField(SDoor_:No,BRW6.Q.SDoor_:No)                ! Field SDoor_:No is a hot field or requires assignment from browse
  BRW6.AddField(SDoor_:DGrpNo,BRW6.Q.SDoor_:DGrpNo)        ! Field SDoor_:DGrpNo is a hot field or requires assignment from browse
  INIMgr.Fetch('SSEC::UpdateUserGroup',QuickWindow)        ! Restore window settings from non-volatile store
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
      Security.RestoreUserGroup
    END!IF
    Relate:SSEC::Access.Close
  END
  IF SELF.Opened
    INIMgr.Update('SSEC::UpdateUserGroup',QuickWindow)     ! Save window data to non-volatile store
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
    SSEC::UpdateUIG:Group
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
      SSEC::GrantAccess 
      BRW6.ResetSort(1)
    OF ?Clear
      ThisWindow.Update()
      SSEC::DeleteAccess()
      ThisWindow.Reset
      SSEC::DeleteAccess
      BRW6.ResetSort(1)
    OF ?GrantAll
      ThisWindow.Update()
      SSEC::BulkAccess(Access:Grant)
      BRW6.ResetSort(1)
    OF ?ClearAll
      ThisWindow.Update()
      SSEC::BulkAccess(Access:Delete)
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


BRW7.SetQueueRecord PROCEDURE

  CODE
  SUGrp_:No = SUIG_:UserNo
  IF Access:SSEC::UserGroup.TryFetch(SUGrp_:NoKey)
    CLEAR(SSEC::UserGroup)
  END!IF
  L::UserName = CLIP(SUGrp_:LastName) & ', ' & SUGrp_:FirstName
  PARENT.SetQueueRecord
  


BRW6.SetQueueRecord PROCEDURE

  CODE
  L::AccessState = SSEC::AccessState()
  PARENT.SetQueueRecord
  
  IF (L::AccessState=1)
    SELF.Q.L::AccessState_Icon = 3                         ! Set icon from icon list
  ELSIF (L::AccessState=2)
    SELF.Q.L::AccessState_Icon = 2                         ! Set icon from icon list
  ELSE
    SELF.Q.L::AccessState_Icon = 1                         ! Set icon from icon list
  END

