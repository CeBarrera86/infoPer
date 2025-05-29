

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL009.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
upPersonalSedes PROCEDURE 

ActionMessage        CSTRING(40)                           !
BRW2::View:Browse    VIEW(SEDEINI)
                       PROJECT(SEI:SEI_Reloj)
                       PROJECT(SEI:SEI_RutaRegis)
                       PROJECT(SEI:SEI_NombreRegis)
                       PROJECT(SEI:SEI_LeerReloj)
                       PROJECT(SEI:SEI_Modificar_Datos)
                       PROJECT(SEI:SEI_Sacar_Partes)
                       PROJECT(SEI:SEI_Armar_Partes)
                       PROJECT(SEI:SEI_Sede)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
SEI:SEI_Reloj          LIKE(SEI:SEI_Reloj)            !List box control field - type derived from field
SEI:SEI_RutaRegis      LIKE(SEI:SEI_RutaRegis)        !List box control field - type derived from field
SEI:SEI_NombreRegis    LIKE(SEI:SEI_NombreRegis)      !List box control field - type derived from field
SEI:SEI_LeerReloj      LIKE(SEI:SEI_LeerReloj)        !List box control field - type derived from field
SEI:SEI_Modificar_Datos LIKE(SEI:SEI_Modificar_Datos) !List box control field - type derived from field
SEI:SEI_Sacar_Partes   LIKE(SEI:SEI_Sacar_Partes)     !List box control field - type derived from field
SEI:SEI_Armar_Partes   LIKE(SEI:SEI_Armar_Partes)     !List box control field - type derived from field
SEI:SEI_Sede           LIKE(SEI:SEI_Sede)             !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::SED:Record  LIKE(SED:RECORD),THREAD
Window               WINDOW('Sede del Reloj'),AT(0,0,423,98),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,TILED, |
  ICON(ICON:Application),MAX,MDI,HLP('~upPersonalSedes'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       SHEET,AT(9,2,406,80),USE(?CurrentTab),JOIN,COLOR(COLOR:BTNFACE),BELOW
                         TAB('General'),USE(?Tab:9)
                           PROMPT('Codigo:'),AT(13,8),USE(?Prompt:SED:SED_Codigo),TRN
                           ENTRY(@n-7),AT(71,8,32,12),USE(SED:SED_Codigo),RIGHT,COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                           PROMPT('Descripcion:'),AT(13,22),USE(?Prompt:SED:SED_Descripcion),TRN
                           ENTRY(@s50),AT(71,22,137,12),USE(SED:SED_Descripcion),UPR,COLOR(COLOR:WINDOW)
                           PROMPT('Reloj:'),AT(13,36),USE(?Prompt:SED:SED_Reloj),TRN
                           ENTRY(@n-7),AT(71,36,32,12),USE(SED:SED_Reloj),COLOR(COLOR:WINDOW)
                         END
                         TAB('SEDEINI'),USE(?Tab2)
                           LIST,AT(19,10,388,45),USE(?List),FORMAT('28C(2)|M~Reloj~@n03@80L(2)|M~PATH archivo~@s50' & |
  '@80L(2)|M~Nombre archivo~@s50@50C(2)|M~LeerReloj~@s1@50C(2)|M~Modif.datos~@s1@50C(2)' & |
  '|M~Sacar_Partes~@s1@50C(2)|M~Armar_Partes~@s1@'),FROM(Queue:Browse),IMM,MSG('Browsing Records')
                           BUTTON('&Agregar'),AT(173,55,42,12),USE(?Insert)
                           BUTTON('&Modificar'),AT(215,55,42,12),USE(?Change)
                           BUTTON('&Borrar'),AT(257,55,42,12),USE(?Delete)
                         END
                       END
                       BUTTON('&OK'),AT(129,84,55,14),USE(?OK),LEFT,ICON('wizOk.ico'),DEFAULT
                       BUTTON('&Cancel'),AT(186,84,55,14),USE(?Cancel),LEFT,ICON('wizCncl.ico')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW2::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List
EditInPlace::SEI:SEI_Reloj EditEntryClass                  ! Edit-in-place class for field SEI:SEI_Reloj
EditInPlace::SEI:SEI_RutaRegis EditEntryClass              ! Edit-in-place class for field SEI:SEI_RutaRegis
EditInPlace::SEI:SEI_NombreRegis EditEntryClass            ! Edit-in-place class for field SEI:SEI_NombreRegis
EditInPlace::SEI:SEI_LeerReloj EditEntryClass              ! Edit-in-place class for field SEI:SEI_LeerReloj
EditInPlace::SEI:SEI_Modificar_Datos EditEntryClass        ! Edit-in-place class for field SEI:SEI_Modificar_Datos
EditInPlace::SEI:SEI_Sacar_Partes EditEntryClass           ! Edit-in-place class for field SEI:SEI_Sacar_Partes
EditInPlace::SEI:SEI_Armar_Partes EditEntryClass           ! Edit-in-place class for field SEI:SEI_Armar_Partes
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record will be Added'
  OF ChangeRecord
    ActionMessage = 'Record will be Changed'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('upPersonalSedes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt:SED:SED_Codigo
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SEI:SEI_Reloj',SEI:SEI_Reloj)                      ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_RutaRegis',SEI:SEI_RutaRegis)              ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_NombreRegis',SEI:SEI_NombreRegis)          ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_LeerReloj',SEI:SEI_LeerReloj)              ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_Modificar_Datos',SEI:SEI_Modificar_Datos)  ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_Sacar_Partes',SEI:SEI_Sacar_Partes)        ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_Armar_Partes',SEI:SEI_Armar_Partes)        ! Added by: BrowseBox(ABC)
  BIND('SEI:SEI_Sede',SEI:SEI_Sede)                        ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(SED:Record,History::SED:Record)
  SELF.AddHistoryField(?SED:SED_Codigo,1)
  SELF.AddHistoryField(?SED:SED_Descripcion,2)
  SELF.AddHistoryField(?SED:SED_Reloj,3)
  SELF.AddUpdateFile(Access:SEDE_RELOJ)
  Relate:SEDEINI.Open                                      ! File SEDEINI used by this procedure, so make sure it's RelationManager is open
  Relate:SEDE_RELOJ.Open                                   ! File SEDE_RELOJ used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SEDE_RELOJ
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
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:SEDEINI,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW2.Q &= Queue:Browse
  BRW2.AddSortOrder(,SEI:PK_SEDEINI)                       ! Add the sort order for SEI:PK_SEDEINI for sort order 1
  BRW2.AddRange(SEI:SEI_Sede,Relate:SEDEINI,Relate:SEDE_RELOJ) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,SEI:SEI_Sede,,BRW2)            ! Initialize the browse locator using  using key: SEI:PK_SEDEINI , SEI:SEI_Sede
  BRW2.AddField(SEI:SEI_Reloj,BRW2.Q.SEI:SEI_Reloj)        ! Field SEI:SEI_Reloj is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_RutaRegis,BRW2.Q.SEI:SEI_RutaRegis) ! Field SEI:SEI_RutaRegis is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_NombreRegis,BRW2.Q.SEI:SEI_NombreRegis) ! Field SEI:SEI_NombreRegis is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_LeerReloj,BRW2.Q.SEI:SEI_LeerReloj) ! Field SEI:SEI_LeerReloj is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_Modificar_Datos,BRW2.Q.SEI:SEI_Modificar_Datos) ! Field SEI:SEI_Modificar_Datos is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_Sacar_Partes,BRW2.Q.SEI:SEI_Sacar_Partes) ! Field SEI:SEI_Sacar_Partes is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_Armar_Partes,BRW2.Q.SEI:SEI_Armar_Partes) ! Field SEI:SEI_Armar_Partes is a hot field or requires assignment from browse
  BRW2.AddField(SEI:SEI_Sede,BRW2.Q.SEI:SEI_Sede)          ! Field SEI:SEI_Sede is a hot field or requires assignment from browse
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SEDEINI.Close
    Relate:SEDE_RELOJ.Close
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
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?CurrentTab, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?CurrentTab
  SELF.SetStrategy(?SED:SED_Codigo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?SED:SED_Codigo
  SELF.SetStrategy(?Prompt:SED:SED_Codigo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:SED:SED_Codigo
  SELF.SetStrategy(?SED:SED_Descripcion, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?SED:SED_Descripcion
  SELF.SetStrategy(?Prompt:SED:SED_Descripcion, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:SED:SED_Descripcion
  SELF.SetStrategy(?SED:SED_Reloj, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?SED:SED_Reloj
  SELF.SetStrategy(?Prompt:SED:SED_Reloj, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:SED:SED_Reloj
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK


BRW2.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW2::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(EditInPlace::SEI:SEI_Reloj,1)
  SELF.AddEditControl(EditInPlace::SEI:SEI_RutaRegis,2)
  SELF.AddEditControl(EditInPlace::SEI:SEI_NombreRegis,3)
  SELF.AddEditControl(EditInPlace::SEI:SEI_LeerReloj,4)
  SELF.AddEditControl(EditInPlace::SEI:SEI_Modificar_Datos,5)
  SELF.AddEditControl(EditInPlace::SEI:SEI_Sacar_Partes,6)
  SELF.AddEditControl(EditInPlace::SEI:SEI_Armar_Partes,7)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW2.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  SEI:SEI_Sede = SED:SED_Codigo
  SEI:SEI_Reloj = SED:SED_Reloj
  RETURN ReturnValue

