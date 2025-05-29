

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL017.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL021.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Ver_Emplea PROCEDURE 

BRW1::View:Browse    VIEW(Emplea)
                       PROJECT(EPD:Servic_sue)
                       PROJECT(EPD:Legajo_sue)
                       PROJECT(EPD:Nrotar1_sue)
                       PROJECT(EPD:Nrotar2_sue)
                       PROJECT(EPD:Nrotar3_sue)
                       PROJECT(EPD:nombre_sue)
                       PROJECT(EPD:activo_sue)
                       PROJECT(EPD:Tipodoc_sue)
                       PROJECT(EPD:RCod1_Sue)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
EPD:Servic_sue         LIKE(EPD:Servic_sue)           !List box control field - type derived from field
EPD:Legajo_sue         LIKE(EPD:Legajo_sue)           !List box control field - type derived from field
EPD:Nrotar1_sue        LIKE(EPD:Nrotar1_sue)          !List box control field - type derived from field
EPD:Nrotar2_sue        LIKE(EPD:Nrotar2_sue)          !List box control field - type derived from field
EPD:Nrotar3_sue        LIKE(EPD:Nrotar3_sue)          !List box control field - type derived from field
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
EPD:activo_sue         LIKE(EPD:activo_sue)           !List box control field - type derived from field
EPD:Tipodoc_sue        LIKE(EPD:Tipodoc_sue)          !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
BrowseWindow         WINDOW('Empleados'),AT(0,0,282,129),GRAY,MDI,SYSTEM
                       PANEL,AT(3,2,274,107),USE(?Panel1),BEVEL(-2,2)
                       STRING(@s30),AT(117,6),USE(EPD:nombre_sue),FONT(,,,FONT:regular,CHARSET:ANSI)
                       LIST,AT(6,18,268,87),USE(?List),HVSCROLL,FORMAT('9C(2)~S~L@n01@25C(2)|M~Legajo~@n03@25C' & |
  '(2)~Tarj 1~@n05b@25C(2)~Tarj 2~@N05b@25C(2)|M~Tarj 3~@N05b@120L(2)|M~Nombre~@s30@25L' & |
  '(2)|M~Activo~@s1@8L(2)|M~Tipodoc~@s2@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  VCR
                       BUTTON('&Insert'),AT(29,111,40,12),USE(?Insert),LEFT,ICON('D:\DesCla61\Personal\icos\WIZINS.ICO')
                       BUTTON('&Change'),AT(74,111,45,12),USE(?Change),LEFT,ICON('D:\DesCla61\Personal\icos\WIZEDIT.ICO')
                       BUTTON('&Delete'),AT(124,111,44,12),USE(?Delete),LEFT,ICON('D:\DesCla61\Personal\icos\W' & |
  'IZMARK.ICO')
                       BUTTON('&Select'),AT(173,111,40,12),USE(?Select),LEFT,ICON('D:\DesCla61\Personal\icos\W' & |
  'IZDITTO.ICO')
                       BUTTON('Close'),AT(221,111,40,12),USE(?Close),LEFT,ICON('D:\DesCla61\Personal\icos\WIZFIND.ICO')
                       BUTTON,AT(6,111,14,12),USE(?View),ICON(ICON:Zoom),DEFAULT
                     END

BRW1::LastSortOrder       BYTE
BRW1::SortHeader  CLASS(SortHeaderClassType) !Declare SortHeader Class
QueueResorted          PROCEDURE(STRING pString),VIRTUAL
                  END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator

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
  GlobalErrors.SetProcedureName('Ver_Emplea')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?List,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:Emplea,SELF) ! Initialize the browse manager
  SELF.Open(BrowseWindow)                                  ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,EPD:key4_sue)                         ! Add the sort order for EPD:key4_sue for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?EPD:nombre_sue,EPD:nombre_sue,1,BRW1) ! Initialize the browse locator using ?EPD:nombre_sue using key: EPD:key4_sue , EPD:nombre_sue
  BRW1.SetFilter('(upper(EPD:activo_sue) = ''S'')')        ! Apply filter expression to browse
  BRW1.AddField(EPD:Servic_sue,BRW1.Q.EPD:Servic_sue)      ! Field EPD:Servic_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Legajo_sue,BRW1.Q.EPD:Legajo_sue)      ! Field EPD:Legajo_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Nrotar1_sue,BRW1.Q.EPD:Nrotar1_sue)    ! Field EPD:Nrotar1_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Nrotar2_sue,BRW1.Q.EPD:Nrotar2_sue)    ! Field EPD:Nrotar2_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Nrotar3_sue,BRW1.Q.EPD:Nrotar3_sue)    ! Field EPD:Nrotar3_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:nombre_sue,BRW1.Q.EPD:nombre_sue)      ! Field EPD:nombre_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:activo_sue,BRW1.Q.EPD:activo_sue)      ! Field EPD:activo_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Tipodoc_sue,BRW1.Q.EPD:Tipodoc_sue)    ! Field EPD:Tipodoc_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:RCod1_Sue,BRW1.Q.EPD:RCod1_Sue)        ! Field EPD:RCod1_Sue is a hot field or requires assignment from browse
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.Init(Queue:Browse,?List,'','',BRW1::View:Browse)
  BRW1::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Emplea.Close
  !Kill the Sort Header
  BRW1::SortHeader.Kill()
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
    Up_Ver
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.SetAlerts()


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
  !Take Sort Headers Events
  IF BRW1::SortHeader.TakeEvents()
     RETURN Level:Notify
  END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END
  SELF.ViewControl = ?View                                 ! Setup the control used to initiate view only mode


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder<>NewOrder THEN
     BRW1::SortHeader.ClearSort()
  END
  BRW1::LastSortOrder=NewOrder
  RETURN ReturnValue

BRW1::SortHeader.QueueResorted       PROCEDURE(STRING pString)
  CODE
    IF pString = ''
       BRW1.RestoreSort()
       BRW1.ResetSort(True)
    ELSE
       BRW1.ReplaceSort(pString,BRW1::Sort0:Locator)
       BRW1.SetLocatorFromSort()
    END
