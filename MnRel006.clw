

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL006.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL020.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL022.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
PersonalTarjetas PROCEDURE 

loc:legajo           SHORT,NAME('"SRL_Legajo"')            !
BRW5::View:Browse    VIEW(TARJETA)
                       PROJECT(TAR:TAR_Legajo)
                       PROJECT(TAR:TAR_Reloj)
                       PROJECT(TAR:TAR_Codigo)
                       JOIN(EPD:Key1_sue,TAR:TAR_Legajo)
                         PROJECT(EPD:nombre_sue)
                         PROJECT(EPD:RCod1_Sue)
                       END
                     END
Queue:5              QUEUE                            !Queue declaration for browse/combo box using ?Browse:5
TAR:TAR_Legajo         LIKE(TAR:TAR_Legajo)           !List box control field - type derived from field
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
TAR:TAR_Reloj          LIKE(TAR:TAR_Reloj)            !List box control field - type derived from field
TAR:TAR_Codigo         LIKE(TAR:TAR_Codigo)           !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB2::View:FileDropCombo VIEW(EMPLEA2)
                       PROJECT(EMP2:nombre_sue)
                       PROJECT(EMP2:RCod1_Sue)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?EMP2:nombre_sue
EMP2:nombre_sue        LIKE(EMP2:nombre_sue)          !List box control field - type derived from field
EMP2:RCod1_Sue         LIKE(EMP2:RCod1_Sue)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Asignación de Tarjetas a Legajos'),AT(0,0,343,214),FONT('MS Sans Serif',8,,FONT:regular), |
  DOUBLE,TILED,ICON(ICON:Application),MAX,MDI,HLP('~PersonalTarjetas'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       SHEET,AT(9,0,334,195),USE(?CurrentTab),JOIN,COLOR(COLOR:BTNFACE),BELOW
                         TAB,USE(?Tab:6)
                           ENTRY(@n_4b),AT(65,146,37,11),USE(loc:legajo),FONT(,10,,FONT:bold,CHARSET:ANSI),COLOR(COLOR:White)
                           PROMPT('Nombre:'),AT(129,148),USE(?Prompt:TAR:PK_TARJETA:TAR:TAR_Legajo:2),TRN
                           BUTTON('Sincronizar Codigos Tarjetas-Huellas'),AT(153,185,89,25),USE(?Btn_Sincronizar:2),FONT(, |
  ,COLOR:Purple,,CHARSET:ANSI),LEFT,ICON('C:\Clarion6\ICONS\FINGER.ICO'),TIP('Exporta lo' & |
  's numeros de tarjetas(huellas) al sistemaCOBOL')
                           COMBO(@s30),AT(164,145,161,14),USE(EMP2:nombre_sue),COLOR(COLOR:White),DROP(5),FORMAT('120L(2)|M~' & |
  'nombre sue~@s30@'),FROM(Queue:FileDropCombo),IMM
                           PROMPT(' Legajo:'),AT(35,147),USE(?Prompt:TAR:PK_TARJETA:TAR:TAR_Legajo),TRN
                         END
                       END
                       BUTTON('Sincronizar Datos Empleados'),AT(52,185,89,25),USE(?Btn_Sincronizar),FONT(,,COLOR:Teal, |
  ,CHARSET:ANSI),LEFT,ICON('C:\Clarion6\Iconos_xp\Crystal\exec.ico'),TIP('Actualiza Lis' & |
  'ta de Empleados para impresion partes ')
                       LIST,AT(13,4,326,137),USE(?Browse:5),VSCROLL,COLOR(COLOR:WINDOW),FORMAT('29C(2)|M~Legaj' & |
  'o~L(1)@n04@123L(2)|M~Nombre~L(1)@s30@29C(2)|M~Reloj~C(1)@n02@40L(2)|M~CodigoT~L(1)@n_4@'), |
  FROM(Queue:5),IMM
                       BUTTON('&Insertar'),AT(60,164,61,14),USE(?Insert:6),LEFT,ICON('wizIns.ico')
                       BUTTON('&Cambiar'),AT(124,164,61,14),USE(?Change:6),LEFT,ICON('wizEdit.ico')
                       BUTTON('&Borrar'),AT(186,164,61,14),USE(?Delete:6),LEFT,ICON('wizDel.ico')
                       BUTTON('&Toolbox'),AT(86,25,45,14),USE(?Toolbox:4),LEFT,HIDE
                       BUTTON('&Select'),AT(11,199,19,14),USE(?Select:3),LEFT,ICON('wizOk.ico')
                       BUTTON('&Cerrar'),AT(273,195,56,14),USE(?Close),LEFT,ICON('wizCncl.ico')
                     END

BRW5::LastSortOrder       BYTE
BRW5::SortHeader  CLASS(SortHeaderClassType) !Declare SortHeader Class
QueueResorted          PROCEDURE(STRING pString),VIRTUAL
                  END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW5                 CLASS(BrowseClass)                    ! Browse using ?Browse:5
Q                      &Queue:5                       !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
                     END

BRW5::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW5::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW5::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW5::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW5::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('PersonalTarjetas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:legajo
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TAR:TAR_Legajo',TAR:TAR_Legajo)                    ! Added by: BrowseBox(ABC)
  BIND('TAR:TAR_Reloj',TAR:TAR_Reloj)                      ! Added by: BrowseBox(ABC)
  BIND('TAR:TAR_Codigo',TAR:TAR_Codigo)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMPLEA2.Open                                      ! File EMPLEA2 used by this procedure, so make sure it's RelationManager is open
  Relate:TARJETA.Open                                      ! File TARJETA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW5.Init(?Browse:5,Queue:5.ViewPosition,BRW5::View:Browse,Queue:5,Relate:TARJETA,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  ?Browse:5{Prop:LineHeight} = 10
  Do DefineListboxStyle
  BRW5.Q &= Queue:5
  BRW5::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon TAR:TAR_Legajo for sort order 1
  BRW5.AddSortOrder(BRW5::Sort1:StepClass,TAR:FK_TARJETA_EMPLEADOS) ! Add the sort order for TAR:FK_TARJETA_EMPLEADOS for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(,TAR:TAR_Legajo,,BRW5)          ! Initialize the browse locator using  using key: TAR:FK_TARJETA_EMPLEADOS , TAR:TAR_Legajo
  BRW5::Sort2:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon TAR:TAR_Reloj for sort order 2
  BRW5.AddSortOrder(BRW5::Sort2:StepClass,TAR:IX_Reloj)    ! Add the sort order for TAR:IX_Reloj for sort order 2
  BRW5.AddLocator(BRW5::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort2:Locator.Init(,TAR:TAR_Reloj,,BRW5)           ! Initialize the browse locator using  using key: TAR:IX_Reloj , TAR:TAR_Reloj
  BRW5::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon TAR:TAR_Legajo for sort order 3
  BRW5.AddSortOrder(BRW5::Sort0:StepClass,TAR:PK_TARJETA)  ! Add the sort order for TAR:PK_TARJETA for sort order 3
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW5::Sort0:Locator.Init(?loc:legajo,TAR:TAR_Legajo,,BRW5) ! Initialize the browse locator using ?loc:legajo using key: TAR:PK_TARJETA , TAR:TAR_Legajo
  BRW5.AddResetField(loc:legajo)                           ! Apply the reset field
  BRW5.AddField(TAR:TAR_Legajo,BRW5.Q.TAR:TAR_Legajo)      ! Field TAR:TAR_Legajo is a hot field or requires assignment from browse
  BRW5.AddField(EPD:nombre_sue,BRW5.Q.EPD:nombre_sue)      ! Field EPD:nombre_sue is a hot field or requires assignment from browse
  BRW5.AddField(TAR:TAR_Reloj,BRW5.Q.TAR:TAR_Reloj)        ! Field TAR:TAR_Reloj is a hot field or requires assignment from browse
  BRW5.AddField(TAR:TAR_Codigo,BRW5.Q.TAR:TAR_Codigo)      ! Field TAR:TAR_Codigo is a hot field or requires assignment from browse
  BRW5.AddField(EPD:RCod1_Sue,BRW5.Q.EPD:RCod1_Sue)        ! Field EPD:RCod1_Sue is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.AskProcedure = 1
  FDCB2.Init(EMP2:nombre_sue,?EMP2:nombre_sue,Queue:FileDropCombo.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo,Relate:EMPLEA2,ThisWindow,GlobalErrors,0,0,0)
  FDCB2.Q &= Queue:FileDropCombo
  FDCB2.AddSortOrder()
  FDCB2.SetFilter('upper(EMP2:activo_sue) = ''S''')
  FDCB2.AddField(EMP2:nombre_sue,FDCB2.Q.EMP2:nombre_sue) !List box control field - type derived from field
  FDCB2.AddField(EMP2:RCod1_Sue,FDCB2.Q.EMP2:RCod1_Sue) !Browse hot field - type derived from field
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW5::SortHeader.Init(Queue:5,?Browse:5,'','',BRW5::View:Browse,TAR:PK_TARJETA)
  BRW5::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMPLEA2.Close
    Relate:TARJETA.Close
  !Kill the Sort Header
  BRW5::SortHeader.Kill()
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
    upPersonalTarjetas
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW5::SortHeader.SetAlerts()


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
    OF ?Btn_Sincronizar:2
      ThisWindow.Update()
      START(Exportar_Datos_Tarjetas, 25000)
      ThisWindow.Reset
    OF ?EMP2:nombre_sue
      CHANGE(?LOC:LEGAJO,EMP2:RCod1_Sue)
      POST(EVENT:ACCEPTED,?LOC:LEGAJO)
    OF ?Btn_Sincronizar
      ThisWindow.Update()
      START(Pasar_Datos_Emplea, 25000)
      ThisWindow.Reset
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
  !Take Sort Headers Events
  IF BRW5::SortHeader.TakeEvents()
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


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:3
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:6
    SELF.ChangeControl=?Change:6
    SELF.DeleteControl=?Delete:6
  END
  SELF.ToolControl = ?Toolbox:4


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW5::LastSortOrder<>NewOrder THEN
     BRW5::SortHeader.ClearSort()
  END
  BRW5::LastSortOrder=NewOrder
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?CurrentTab, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?CurrentTab
  SELF.SetStrategy(?Browse:5, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Browse:5
  SELF.SetStrategy(?Select:3, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Select:3
  SELF.SetStrategy(?Prompt:TAR:PK_TARJETA:TAR:TAR_Legajo, Resize:FixLeft+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Prompt:TAR:PK_TARJETA:TAR:TAR_Legajo
  SELF.SetStrategy(?Change:6, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change:6
  SELF.SetStrategy(?Delete:6, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete:6
  SELF.SetStrategy(?Insert:6, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert:6
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.RemoveControl(?Toolbox:4)                           ! Remove ?Toolbox:4 from the resizer, it will not be moved or sized

BRW5::SortHeader.QueueResorted       PROCEDURE(STRING pString)
  CODE
    IF pString = ''
       BRW5.RestoreSort()
       BRW5.ResetSort(True)
    ELSE
       IF CHOICE(?CurrentTab) = 2
          BRW5.ReplaceSort(pString,BRW5::Sort1:Locator)
          BRW5.SetLocatorFromSort()
       ELSIF CHOICE(?CurrentTab) = 3
          BRW5.ReplaceSort(pString,BRW5::Sort2:Locator)
          BRW5.SetLocatorFromSort()
       ELSE
          BRW5.ReplaceSort(pString,BRW5::Sort0:Locator)
          BRW5.SetLocatorFromSort()
       END
    END
