

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER024.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the EMPLEADOS file
!!! </summary>
ABMEmpleadosAusencia PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:legajo           STRING(20)                            !
BRW1::View:Browse    VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_LEGAJO)
                       PROJECT(EPL:EMP_NOMBRE)
                       PROJECT(EPL:EMP_DNI)
                       PROJECT(EPL:EMP_DIRECCION)
                       PROJECT(EPL:EMP_NRO_TEL)
                       PROJECT(EPL:EMP_NRO_CEL)
                       PROJECT(EPL:EMP_FECANTIG)
                       PROJECT(EPL:EMP_ACTIVO)
                       PROJECT(EPL:EMP_CONVENIO)
                       PROJECT(EPL:EMP_SECTOR)
                       JOIN(CON:PK_CONVENIO,EPL:EMP_CONVENIO)
                         PROJECT(CON:CONV_CONVENIO)
                       END
                       JOIN(SEC:PK_SECTOR,EPL:EMP_SECTOR)
                         PROJECT(SEC:SEC_SECTOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_DNI            LIKE(EPL:EMP_DNI)              !List box control field - type derived from field
EPL:EMP_DIRECCION      LIKE(EPL:EMP_DIRECCION)        !List box control field - type derived from field
EPL:EMP_NRO_TEL        LIKE(EPL:EMP_NRO_TEL)          !List box control field - type derived from field
EPL:EMP_NRO_CEL        LIKE(EPL:EMP_NRO_CEL)          !List box control field - type derived from field
EPL:EMP_FECANTIG       LIKE(EPL:EMP_FECANTIG)         !List box control field - type derived from field
CON:CONV_CONVENIO      LIKE(CON:CONV_CONVENIO)        !List box control field - type derived from field
SEC:SEC_SECTOR         LIKE(SEC:SEC_SECTOR)           !List box control field - type derived from field
EPL:EMP_ACTIVO         LIKE(EPL:EMP_ACTIVO)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Empleados'),AT(,,637,351),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ABMEmpleadosLicencia'),SYSTEM
                       LIST,AT(14,30,611,310),USE(?Browse:1),FONT(,10,,FONT:bold),HVSCROLL,FORMAT('35R(2)|~Leg' & |
  'ajo~C(0)@N_5@170L(2)|M~Empleado~C(0)@s31@60R(1)|~DNI~C(0)@s10@140L(2)|M~Dirección~C(' & |
  '0)@s25@65R(2)|~Teléfono~C(0)@S15@65R(2)|~Celular~C(0)@s15@55R(2)|~Antiguedad~C(0)@D0' & |
  '6B@85L(2)|~Convenio~C(0)@s21@80L(2)|~Sector~C(0)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he EMPLEADOS file')
                       BUTTON('&View'),AT(152,259,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       SHEET,AT(5,4,631,346),USE(?CurrentTab),FONT(,10,,FONT:bold)
                         TAB('Buscar por Apellido:'),USE(?Tab:2)
                           BUTTON('&Select'),AT(283,259),USE(?Select),HIDE
                         END
                       END
                       STRING(@s31),AT(121,6,100,10),USE(EPL:EMP_NOMBRE),FONT(,10,COLOR:Red,FONT:bold)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
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
  GlobalErrors.SetProcedureName('ABMEmpleadosAusencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON:CONV_CONVENIO',CON:CONV_CONVENIO)              ! Added by: BrowseBox(ABC)
  BIND('SEC:SEC_SECTOR',SEC:SEC_SECTOR)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:EMPLEADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?EPL:EMP_NOMBRE,EPL:EMP_NOMBRE,,BRW1) ! Initialize the browse locator using ?EPL:EMP_NOMBRE using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.SetFilter('(EPL:EMP_ACTIVO = ''S'')')               ! Apply filter expression to browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DNI,BRW1.Q.EPL:EMP_DNI)            ! Field EPL:EMP_DNI is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DIRECCION,BRW1.Q.EPL:EMP_DIRECCION) ! Field EPL:EMP_DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NRO_TEL,BRW1.Q.EPL:EMP_NRO_TEL)    ! Field EPL:EMP_NRO_TEL is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NRO_CEL,BRW1.Q.EPL:EMP_NRO_CEL)    ! Field EPL:EMP_NRO_CEL is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_FECANTIG,BRW1.Q.EPL:EMP_FECANTIG)  ! Field EPL:EMP_FECANTIG is a hot field or requires assignment from browse
  BRW1.AddField(CON:CONV_CONVENIO,BRW1.Q.CON:CONV_CONVENIO) ! Field CON:CONV_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SEC:SEC_SECTOR,BRW1.Q.SEC:SEC_SECTOR)      ! Field SEC:SEC_SECTOR is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_ACTIVO,BRW1.Q.EPL:EMP_ACTIVO)      ! Field EPL:EMP_ACTIVO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMPLEADOS.Close
  END
  GlobalErrors.SetProcedureName
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
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
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form DETALLE_AUSENCIA
!!! </summary>
FormSolicitudAusencia PROCEDURE 

FechaInicial         DATE                                  !
LOC:Variable         BYTE                                  !
ControlDV            STRING(1)                             !
DVOK1                STRING(1)                             !
DIAS_DUPLICADOS      STRING(1)                             !
DVOK2                STRING(1)                             !
FechaFinal           DATE                                  !
LICENCIA_VALIDA      STRING('''''Año {15}')                !
LOC:LEGAJO           SHORT                                 !
LOC:LICENCIA         SHORT                                 !
FECHA_VALIDA         STRING('S {19}')                      !
DIAS_FRACCIONADOS    SHORT                                 !
CurrentTab           STRING(80)                            !
Loc:Convenio         SHORT                                 !
Dias_Tomados         SHORT(0)                              !
Loc:Dias_Pagan       SHORT(0)                              !
Loc:dias_restan      SHORT                                 !
Loc:dias_toma_history SHORT                                !
ActionMessage        CSTRING(40)                           !
Habiles              SHORT                                 !
loc:DiasNoHabiles    SHORT                                 !
DIASVIAJE            SHORT                                 !
Corridos             SHORT                                 !
Loc:Tipo_Dias        STRING(1)                             !
Loc:Semana           SHORT                                 !
FDCB8::View:FileDropCombo VIEW(MOTIVO_AUSENCIA)
                       PROJECT(MAU:MAU_CODIGO)
                       PROJECT(MAU:MAU_DESCRIPCION)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?MAU:MAU_CODIGO
MAU:MAU_CODIGO         LIKE(MAU:MAU_CODIGO)           !List box control field - type derived from field
MAU:MAU_DESCRIPCION    LIKE(MAU:MAU_DESCRIPCION)      !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::DAU:Record  LIKE(DAU:RECORD),THREAD
QuickWindow          WINDOW('Solicitud de Ausencia'),AT(,,235,282),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('FormSolicitudAusencia'), |
  SYSTEM
                       SHEET,AT(5,5,225,255),USE(?CurrentTab),FONT(,10,,FONT:bold)
                         TAB,USE(?Tab:1)
                           PROMPT('Fecha'),AT(10,25),USE(?DAU:DAU_FECHA_DATE:Prompt)
                           ENTRY(@D06B),AT(51,25,55,12),USE(DAU:DAU_FECHA_DATE),FONT(,,,FONT:bold),CENTER,FLAT,READONLY, |
  REQ
                           PROMPT('Usuario'),AT(10,47),USE(?DAU:DAU_USUARIO:Prompt)
                           ENTRY(@s12),AT(51,47,70,12),USE(DAU:DAU_USUARIO),CENTER,FLAT,READONLY,REQ
                           GROUP,AT(125,20,100,40),USE(?GROUP1),FONT(,10,,FONT:bold),BOXED
                             PROMPT('Año'),AT(135,28,30),USE(?DAU:DAU_ANIO:Prompt),FONT(,12),CENTER,TRN
                             STRING(@N_4),AT(135,42,30),USE(DAU:DAU_ANIO),FONT(,12,COLOR:Red,FONT:bold),CENTER
                             PROMPT('Legajo'),AT(175,28,40),USE(?DAU:DAU_NROLEG:Prompt),FONT(,12),CENTER,TRN
                             STRING(@N_5B),AT(175,42,40),USE(DAU:DAU_NROLEG),FONT(,12,COLOR:Red),CENTER
                           END
                           GROUP,AT(49,63,138,74),USE(?GROUP2),BOXED
                             GROUP('Inicio'),AT(53,70,132,28),USE(?GROUP2:2),BOXED
                               PROMPT('Fecha'),AT(57,82,36),USE(?DAU:DAU_INICIO_DATE:Prompt),FONT(,12),CENTER,TRN
                               ENTRY(@d17),AT(97,82,67,12),USE(DAU:DAU_INICIO_DATE),FONT(,12),CENTER,FLAT,READONLY,REQ
                               BUTTON,AT(167,82,12,12),USE(?Calendar:2)
                             END
                             GROUP('Fin'),AT(53,102,132,28),USE(?GROUP2:3),FONT(,,,FONT:bold,CHARSET:DEFAULT),BOXED
                               PROMPT('Fecha'),AT(57,114,36),USE(?DAU:DAU_FIN_DATE:Prompt),FONT(,12),CENTER,TRN
                               ENTRY(@d17),AT(97,114,67,12),USE(DAU:DAU_FIN_DATE),FONT(,12),CENTER,FLAT
                               BUTTON,AT(167,114,12,12),USE(?Calendar:3)
                             END
                           END
                           GROUP,AT(10,140,215,29),USE(?GROUP3),BOXED
                             PROMPT('DÍAS'),AT(15,150,30),USE(?DAU:DAU_DIAS:Prompt),FONT(,12),CENTER,TRN
                             SPIN(@n_2),AT(49,150,30,14),USE(DAU:DAU_DIAS),FONT(,12,COLOR:Red),CENTER,RANGE(1,31),STEP(1), |
  READONLY
                             PROMPT('Condición'),AT(101,150,55),USE(?DAU:DAU_CONDICION:Prompt),FONT(,12),CENTER,TRN
                             COMBO(@s10),AT(160,150,60,14),USE(DAU:DAU_CONDICION),CENTER,DROP(2),FROM('Hábiles|Corridos'), |
  IMM,READONLY,REQ
                           END
                           GROUP,AT(10,172,215,76),USE(?GROUP4),FONT(,10,,FONT:bold),BOXED
                             PROMPT('Motivo'),AT(15,180,30),USE(?DAU:DAU_MOTIVO:Prompt)
                             COMBO(@s5),AT(48,180,45,12),USE(MAU:MAU_CODIGO),CENTER,DROP(15),FORMAT('20L(2)|~cód.~C(0)@S3@'), |
  FROM(Queue:FileDropCombo),IMM,READONLY,REQ
                             ENTRY(@s120),AT(99,180,121,12),USE(DAU:DAU_DESCRIPCION),READONLY,REQ
                             PROMPT('Observaciones'),AT(15,196,71),USE(?DAU:DAU_OBSERVACIONES:Prompt)
                             TEXT,AT(15,214,205,30),USE(DAU:DAU_OBSERVACIONES),FONT(,,,FONT:bold)
                           END
                         END
                       END
                       BUTTON('&Aceptar'),AT(50,263,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(130,263,55,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                     END
SSEC::Viewing        BYTE(0)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Open                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar4            CalendarClass
Calendar7            CalendarClass
FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  GLO:oneInstance_FormSolicitudAusencia_thread = 0

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
PREPARAR_DATOS      ROUTINE
    IF DAU:DAU_FIN_DATE = '' OR NULL(DAU:DAU_FIN_DATE) OR DAU:DAU_FIN_DATE = '00/00/0000' THEN
        SETNULL(DAU:DAU_FIN)
    END
    DAU:DAU_FECHA_UPDATE_DATE = TODAY()
    DAU:DAU_FECHA_UPDATE_TIME = CLOCK()
    DAU:DAU_USUARIO = Glo:Usuario2
DiasNoHabiles       ROUTINE
    loc:DiasNoHabiles = 0
    LOOP dia# = DAU:DAU_INICIO_DATE TO DAU:DAU_FIN_DATE BY 1
        CLEAR(FERIADOS:record)
        FER:DIAFERIADO_DATE = dia#
        FER:DIAFERIADO_TIME = 0
        !Buscar Feriados o Domingos o Sábados
        if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign OR (dia# % 7) = 0 OR ((dia# % 7) = 6 AND CON:CONV_ID <> 5)
            loc:DiasNoHabiles += 1
        END
    END !loop
    DAU:DAU_DIAS = DAU:DAU_FIN_DATE - DAU:DAU_INICIO_DATE + 1 - loc:DiasNoHabiles
ControlDias         ROUTINE
    IF DAU:DAU_INICIO_DATE <= DAU:DAU_FIN_DATE THEN
        IF DAU:DAU_INICIO_DATE < DAU:DAU_FIN_DATE THEN
            ENABLE(?DAU:DAU_CONDICION)
            IF DAU:DAU_CONDICION = 'Hábiles' THEN
                DO DiasNoHabiles
            ELSE
                DAU:DAU_DIAS = DAU:DAU_FIN_DATE - DAU:DAU_INICIO_DATE + 1
            END
        ELSE
            DAU:DAU_CONDICION = 'Hábiles'
            DISABLE(?DAU:DAU_CONDICION)
            DO DiasNoHabiles
        END
    ELSE
        DAU:DAU_FIN_DATE = ''
        DAU:DAU_CONDICION = 'Hábiles'
        DISABLE(?DAU:DAU_CONDICION)
        DAU:DAU_DIAS = 0
    END

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Agregar Ausencia'
  OF ChangeRecord
    ActionMessage = 'Modificar Ausencia'
  END
  QuickWindow{PROP:StatusText,0} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('FormSolicitudAusencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DAU:DAU_FECHA_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('MAU:MAU_DESCRIPCION',MAU:MAU_DESCRIPCION)          ! Added by: FileDropCombo(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(DAU:Record,History::DAU:Record)
  SELF.AddHistoryField(?DAU:DAU_FECHA_DATE,21)
  SELF.AddHistoryField(?DAU:DAU_USUARIO,27)
  SELF.AddHistoryField(?DAU:DAU_ANIO,3)
  SELF.AddHistoryField(?DAU:DAU_NROLEG,2)
  SELF.AddHistoryField(?DAU:DAU_INICIO_DATE,6)
  SELF.AddHistoryField(?DAU:DAU_FIN_DATE,12)
  SELF.AddHistoryField(?DAU:DAU_DIAS,8)
  SELF.AddHistoryField(?DAU:DAU_CONDICION,14)
  SELF.AddHistoryField(?DAU:DAU_DESCRIPCION,16)
  SELF.AddHistoryField(?DAU:DAU_OBSERVACIONES,17)
  SELF.AddUpdateFile(Access:DETALLE_AUSENCIA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:MOTIVO_AUSENCIA.Open                              ! File MOTIVO_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DETALLE_AUSENCIA
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?DAU:DAU_FECHA_DATE{PROP:ReadOnly} = True
    ?DAU:DAU_USUARIO{PROP:ReadOnly} = True
    ?DAU:DAU_INICIO_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar:2)
    ?DAU:DAU_FIN_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar:3)
    DISABLE(?DAU:DAU_CONDICION)
    DISABLE(?MAU:MAU_CODIGO)
    ?DAU:DAU_DESCRIPCION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB8.Init(MAU:MAU_CODIGO,?MAU:MAU_CODIGO,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:MOTIVO_AUSENCIA,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(MAU:PK_MAU_CODIGO)
  FDCB8.AddField(MAU:MAU_CODIGO,FDCB8.Q.MAU:MAU_CODIGO) !List box control field - type derived from field
  FDCB8.AddField(MAU:MAU_DESCRIPCION,FDCB8.Q.MAU:MAU_DESCRIPCION) !Browse hot field - type derived from field
  FDCB8.AddUpdateField(MAU:MAU_CODIGO,DAU:DAU_MOTIVO)
  FDCB8.AddUpdateField(MAU:MAU_DESCRIPCION,DAU:DAU_DESCRIPCION)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_AUSENCIA.Close
    Relate:MOTIVO_AUSENCIA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !Estado inicial de botones
  IF SELF.Request = InsertRecord THEN
      ENABLE(?DAU:DAU_DIAS)
      DISABLE(?DAU:DAU_CONDICION)
  END


ThisWindow.PrimeFields PROCEDURE

  CODE
  DAU:DAU_NROLEG = EPL:EMP_LEGAJO
  DAU:DAU_USUARIO = Glo:Usuario2
  DAU:DAU_FECHA_DATE = TODAY()
  DAU:DAU_FECHA_TIME = CLOCK()
  DAU:DAU_ANIO = YEAR(TODAY())
  DAU:DAU_INICIO_DATE = TODAY()
  DAU:DAU_INICIO_TIME = 8640001
  DAU:DAU_FIN_DATE = ''
  DAU:DAU_FIN_TIME = 8640001
  DAU:DAU_CONDICION = 'Corridos'
  DAU:DAU_DIAS = 0
  DAU:DAU_MOTIVO = ''
  DAU:DAU_OBSERVACIONES = ''
  DAU:DAU_ESTADO = 'P'
  PARENT.PrimeFields


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
    CASE ACCEPTED()
    OF ?OK
      ! Se chequea la validez de la fecha de inicio de AUSENCIA
      IF SELF.Request = InsertRecord AND DAU:DAU_INICIO_DATE < (TODAY()-6) AND GLO:UserAccess <> 1 THEN
          BEEP
          MESSAGE('La FECHA INICIO no debe ser MAYOR a 7 días desde HOY', 'Error en FECHAS', ICON:Exclamation, BUTTON:OK, 1)
          SELECT(?Calendar:2)
          CYCLE
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar4.SelectOnClose = True
      Calendar4.Ask('Seleccione Fecha Incio',DAU:DAU_INICIO_DATE)
      IF Calendar4.Response = RequestCompleted THEN
      DAU:DAU_INICIO_DATE=Calendar4.SelectedDate
      DISPLAY(?DAU:DAU_INICIO_DATE)
      END
      ThisWindow.Reset(True)
      IF DAU:DAU_FIN_DATE = '' THEN
          CYCLE
      ELSE
          DO ControlDias
          ThisWindow.Reset(1)
      END
    OF ?Calendar:3
      ThisWindow.Update()
      Calendar7.SelectOnClose = True
      Calendar7.Ask('Seleccione Fecha Fin',DAU:DAU_FIN_DATE)
      IF Calendar7.Response = RequestCompleted THEN
      DAU:DAU_FIN_DATE=Calendar7.SelectedDate
      DISPLAY(?DAU:DAU_FIN_DATE)
      END
      ThisWindow.Reset(True)
      DO ControlDias
      ThisWindow.Reset(1)
    OF ?DAU:DAU_CONDICION
      IF DAU:DAU_CONDICION = 'Hábiles' THEN
          Do DiasNoHabiles
      ELSE !Corridos
          DAU:DAU_DIAS = DAU:DAU_FIN_DATE - DAU:DAU_INICIO_DATE + 1
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      !SI VALIDA GRAVA EN LICENCIA LOS VALORES QUE DEBE MODIFICAR
      IF SELF.Request = InsertRecord OR (SELF.Request = ChangeRecord AND DAU:DAU_ESTADO <> 'A') THEN
          DO PREPARAR_DATOS
      ELSIF SELF.Request = ChangeRecord AND DAU:DAU_ESTADO = 'A' THEN
          DO PREPARAR_DATOS
          DAU:DAU_ESTADO = 'P'
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
  IF SELF.Request = InsertRecord OR SELF.Request = ChangeRecord THEN
      IF NULL(DAU:DAU_FIN) THEN
          DAU:DAU_DIAS = 0
          DAU:DAU_CONDICION = 'Corridos'
      END
  END
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
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?DAU:DAU_DIAS
      !Controla la condición de los días
      IF DAU:DAU_CONDICION = 'Hábiles' THEN
          DAU:DAU_FIN_DATE = DAU:DAU_INICIO_DATE + DAU:DAU_DIAS - 1 + loc:DiasNoHabiles
      ELSE !Corridos
          DAU:DAU_FIN_DATE = DAU:DAU_INICIO_DATE + DAU:DAU_DIAS - 1
      END
      DO ControlDias
      ThisWindow.Reset(1)
    END
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
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the EMPLEADOS file
!!! </summary>
Empleados PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_LEGAJO)
                       PROJECT(EPL:EMP_NOMBRE)
                       PROJECT(EPL:EMP_SECTOR)
                       PROJECT(EPL:EMP_DIRECCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_SECTOR         LIKE(EPL:EMP_SECTOR)           !Browse key field - type derived from field
EPL:EMP_DIRECCION      LIKE(EPL:EMP_DIRECCION)        !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Browse the EMPLEADOS file'),AT(,,214,295),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,HLP('Empleados'),SYSTEM
                       SHEET,AT(4,4,208,272),USE(?CurrentTab)
                         TAB,USE(?Tab:4)
                           LIST,AT(7,22,200,250),USE(?Browse:1),VSCROLL,FORMAT('25R(1)|~Legajo~C(0)@N5B@120L(1)|M~' & |
  'Nombre~C(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the EMPLEADOS file')
                         END
                       END
                       BUTTON('&Cerrar'),AT(168,278,42,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Select'),AT(120,279,44,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       STRING(@s31),AT(37,6,129),USE(EPL:EMP_NOMBRE),FONT(,,COLOR:Red)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
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
  GlobalErrors.SetProcedureName('Empleados')
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
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:EMPLEADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,EPL:FK_SECTOR)                        ! Add the sort order for EPL:FK_SECTOR for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,EPL:EMP_SECTOR,1,BRW1)         ! Initialize the browse locator using  using key: EPL:FK_SECTOR , EPL:EMP_SECTOR
  BRW1.AddSortOrder(,EPL:PK_EMPLEADOS)                     ! Add the sort order for EPL:PK_EMPLEADOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,EPL:EMP_LEGAJO,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_EMPLEADOS , EPL:EMP_LEGAJO
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,EPL:EMP_NOMBRE,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.AddSortOrder(,EPL:PK_Direccion)                     ! Add the sort order for EPL:PK_Direccion for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,EPL:EMP_DIRECCION,,BRW1)       ! Initialize the browse locator using  using key: EPL:PK_Direccion , EPL:EMP_DIRECCION
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(?EPL:EMP_NOMBRE,EPL:EMP_NOMBRE,,BRW1) ! Initialize the browse locator using ?EPL:EMP_NOMBRE using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_SECTOR,BRW1.Q.EPL:EMP_SECTOR)      ! Field EPL:EMP_SECTOR is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DIRECCION,BRW1.Q.EPL:EMP_DIRECCION) ! Field EPL:EMP_DIRECCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMPLEADOS.Close
  END
  GlobalErrors.SetProcedureName
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
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
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
wndBrightness PROCEDURE (imageexBitmapClass Src,ImageexBitmapClass Dst,Byte SetB,Byte SetC,Byte SetI)

LocalRequest         LONG                                  !
OriginalRequest      LONG                                  !
LocalResponse        LONG                                  !
FilesOpened          BYTE                                  !
WindowOpened         LONG                                  !
WindowInitialized    LONG                                  !
ForceRefresh         LONG                                  !
Loc:Brightness       SIGNED                                !
Loc:Contrast         SIGNED                                !
Loc:Intensity        SIGNED                                !
Loc:DoPreview        BYTE(1)                               !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Brillo, Contraste, Intensidad'),AT(,,251,79),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:ANSI),DOUBLE,CENTER,GRAY,SYSTEM
                       CHECK('& Vista Previa'),AT(18,32),USE(Loc:DoPreview)
                       BUTTON('&Reiniciar'),AT(16,48,65,20),USE(?Reset)
                       BUTTON('Aplicar'),AT(94,48,65,20),USE(?Ok),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('Cancelar'),AT(172,48,65,20),USE(?Button2),LEFT,ICON(ICON:Cross)
                       PROMPT('&Brillo:'),AT(12,11),USE(?Loc:Brightness:Prompt)
                       SPIN(@n-4),AT(33,8,32,16),USE(Loc:Brightness),RIGHT,RANGE(-255,255)
                       PROMPT('&Contraste:'),AT(81,11),USE(?Loc:Contrast:Prompt)
                       SPIN(@n-4),AT(116,8,33,16),USE(Loc:Contrast),RIGHT,RANGE(-255,255)
                       PROMPT('&Intensidad:'),AT(162,11),USE(?Loc:Intensity:Prompt)
                       SPIN(@n-4),AT(198,8,33,16),USE(Loc:Intensity),RIGHT,RANGE(-255,255)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
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
Machen              ROUTINE
   Src.AdjustBCI(Loc:Brightness, Loc:Contrast, Loc:Intensity, dst)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('wndBrightness')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:DoPreview
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  WinAlertMouseZoom()
  Do DefineListboxStyle
  SELF.SetAlerts()
  IF SetB <> 0 or SetC <> 0 or SetI <> 0 THEN
      Loc:DoPreview = 0
      Loc:Brightness = SetB
      Loc:Contrast = SetC
      Loc:Intensity = SetI
      post(EVENT:Accepted,?Loc:Brightness)
      post(EVENT:Accepted,?Loc:Contrast)
      post(EVENT:Accepted,?Loc:Intensity)
      post(EVENT:Accepted,?Ok)
  END
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
     if LocalResponse = RequestCompleted
        Do Machen
        Src.Assign(Dst)
     else
        Dst.Assign(Src)
     end
  
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
    OF ?Ok
      LocalResponse = RequestCompleted
       POST(EVENT:CloseWindow)
    OF ?Button2
      LocalResponse = RequestCancelled
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:DoPreview
         if Loc:DoPreview
            Do Machen
         end
      
    OF ?Reset
      ThisWindow.Update()
      Dst.Assign(Src)
      Loc:Brightness = 0
      Loc:Contrast = 0
      Loc:Intensity = 0
      Display()
    OF ?Loc:Brightness
         if Loc:DoPreview
            Do Machen
         end
      
    OF ?Loc:Contrast
         if Loc:DoPreview
            Do Machen
         end
      
    OF ?Loc:Intensity
      if Loc:DoPreview
          Do Machen
      end
      
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?Loc:Brightness
         if Loc:DoPreview
            Do Machen
         end
      
    OF ?Loc:Contrast
      if Loc:DoPreview
           Do Machen
      end
      
    OF ?Loc:Intensity
         if Loc:DoPreview
            Do Machen
         end
      
    END
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
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
wndScanning PROCEDURE 

Loc:empleado         STRING(30)                            !
Loc:Filename         STRING(255)                           !
LocalRequest         LONG                                  !
OriginalRequest      LONG                                  !
LocalResponse        LONG                                  !
FilesOpened          BYTE                                  !
WindowOpened         LONG                                  !
WindowInitialized    LONG                                  !
ForceRefresh         LONG                                  !
Loc:ShowUi           SIGNED                                !
loc:PixelType        SIGNED                                !
Loc:PdfFilename      STRING(255)                           !
Loc:TiffFilename     STRING(255)                           !
Loc:ShowProgress     SIGNED                                !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ImageQ      QUEUE, PRE()
Text            STRING(30)
Bitmap          &ImageExBitmapClass

            END
TheBitmap       ImageExBitmapClass
JpgSaver    ImageExJpegSaverClass
PdfSaver    ImageExPdfSaverClass
TiffSaver   ImageExTiffSaverClass
Window               WINDOW('Certificado'),AT(,,445,283),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,AUTO,GRAY, |
  SYSTEM
                       CHECK('&Show scanner UI'),AT(19,74),USE(Loc:ShowUi),RIGHT,HIDE
                       REGION,AT(140,28,300,250),USE(?Viewer)
                       BUTTON,AT(140,5,18,18),USE(?Acquire),ICON('scanner.ico'),DEFAULT
                       BUTTON('Crear &PDF'),AT(43,201),USE(?Pdf),HIDE
                       BUTTON('Create multi-page &TIFF'),AT(26,110),USE(?Tiff),HIDE
                       BUTTON('S&eleccionar Scanner'),AT(5,5,60,18),USE(?Select),FONT('Microsoft Sans Serif',8,,FONT:regular)
                       CHECK('Show &progress indicator'),AT(19,90),USE(Loc:ShowProgress),RIGHT,HIDE
                       OPTION('Pixel Type'),AT(7,154,127,28),USE(loc:PixelType),BOXED,HIDE
                         RADIO('B/W'),AT(15,166),USE(?loc:PixelType:Radio1),VALUE('0')
                         RADIO('Grayscale'),AT(47,166),USE(?loc:PixelType:Radio1:2),VALUE('1')
                         RADIO('RGB'),AT(95,166),USE(?loc:PixelType:Radio1:3),VALUE('2')
                       END
                       LIST,AT(5,28,130,250),USE(?List1),VSCROLL,FORMAT('80L(2)~Text~@s20@'),FROM(ImageQ)
                       BUTTON('&Generar'),AT(387,5,53,18),USE(?Close),FONT('Microsoft Sans Serif',10,,FONT:bold)
                       BUTTON,AT(272,5,18,18),USE(?RotLeft),ICON('rotleft.ico')
                       BUTTON,AT(294,5,18,18),USE(?RotRight),ICON('rotright.ico')
                       BUTTON,AT(184,5,18,18),USE(?ZoomFit),ICON('ZoomToFit.ico')
                       BUTTON,AT(206,5,18,18),USE(?ZoomIn),FONT('Microsoft Sans Serif',,,FONT:regular),ICON('zoomIn.ico')
                       BUTTON,AT(228,5,18,18),USE(?ZoomOut),ICON('zoomOut.ico')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Viewer               CLASS(ImageExViewerClass)
                     END
ImageExTwain1        CLASS(ImageExTwainClass)
OnAcquired              FUNCTION (ImageExBitmapClass bmp), BOOL, DERIVED
OnAcquireCancelled      PROCEDURE, DERIVED
OnSourceDisabled        PROCEDURE, DERIVED
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
PrepararDatos       ROUTINE
    !    ----- Nombre DB ----
    empleado" = clip(EPL:EMP_NOMBRE)
    val# = instring(',',empleado")
    nombre" = CLIP(LEFT(empleado"[val#+1:LEN(empleado")]))
    apellido" = CLIP(LEFT(empleado"[1:val#-1]))
    !    ----- Apellido ----
    val# = instring(' ',CLIP(LEFT(apellido")))
    IF val# <> 0 THEN
        ap" = apellido"[1:val#]
    ELSE
        ap" = apellido"
    END
    !    ----- Nombre -----
    val# = instring(' ',CLIP(LEFT(nombre")))
    IF val# <> 0 THEN
        nom" = nombre"[1:val#]
    ELSE
        nom" = nombre"
    END

    Loc:empleado = CLIP(ap") & '_' & CLIP(nom")

ThisWindow.Ask PROCEDURE

  CODE
  Viewer.Init(Window, ?Viewer)
  Viewer.SetBkColor(13882323)
  Viewer.Bitmap.SetStretchFilter(IMAGEEXSTRETCHFILTER:Linear)
  Viewer.Bitmap.SetDrawMode(IMAGEEXDRAWMODE:Opaque)
  Viewer.Bitmap.SetMasterAlpha(255)
  Viewer.SetZoomPercent(100)
  Viewer.SetAllowFocus(1)
  Viewer.SetScrollsVisible(1)
  Viewer.SetMouseMode(1*IEMM:PAN + 1*IEMM:ZoomWheel + 1 * IEMM:HOTSPOTS)
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('wndScanning')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:ShowUi
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
  Relate:CERTIFICADOS.Open                                 ! File CERTIFICADOS used by this procedure, so make sure it's RelationManager is open
  Relate:CONCEPTO_MEDICO.Open                              ! File CONCEPTO_MEDICO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Loc:PixelType = IETPT:RGB
  Loc:ShowProgress = TRUE
  ?List1{PROP:LINEHEIGHT}=12
  Do DefineListboxStyle
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CERTIFICADOS.Close
    Relate:CONCEPTO_MEDICO.Close
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
    OF ?Acquire
      ThisWindow.Update()
      ImageExTwain1.SetIndicators(loc:ShowProgress)
      ImageExTwain1.SetPixelType(Loc:PixelType)
      ImageExTwain1.Acquire(Loc:ShowUI)
      Select(?Viewer)
    OF ?Pdf
      ThisWindow.Update()
       PictureDialogResult# = ImageEx:PictureDialog(, Loc:PdfFilename, 'Portable Document Format (*.pdf)|*.pdf', FILE:SAVE+FILE:KEEPDIR)
      if PictureDialogResult#
          PdfSaver.Compression = IECA:JPEG
          PdfSaver.BeginCreate(Loc:PdfFilename)
          Loop i# = 1 to records(ImageQ)
              Get(ImageQ, i#)
              PdfSaver.AddPage(ImageQ.Bitmap)
          end
          PdfSaver.EndCreate()
      end
    OF ?Tiff
      ThisWindow.Update()
       PictureDialogResult# = ImageEx:PictureDialog(, Loc:TiffFilename, 'Portable Document Format (*.pdf)|*.pdf', FILE:SAVE+FILE:KEEPDIR)
         if PictureDialogResult#
            TiffSaver.Compression = IECA:JPEG
            Get(ImageQ, 1)
            if ~errorcode()
               ImageQ.Bitmap.SaveToFile(Loc:TiffFilename, TiffSaver)
      
               loop i# = 2 to Records(ImageQ)
                  Get(ImageQ, i#)
                  if ~errorcode()
                     TiffSaver.InsertIntoFile(Loc:TiffFilename, -1, ImageQ.Bitmap)
                  end
               end
            end
         end
    OF ?Select
      ThisWindow.Update()
      ImageExTwain1.SelectSource()
    OF ?Close
      ThisWindow.Update()
      Get(ImageQ, Choice(?List1))
      IF ~Errorcode()
          Viewer.Bitmap.Assign (ImageQ.Bitmap)
          Viewer.Bitmap.SaveToBlob(CME:CME_CERTIFICADOS,JpgSaver)
          Viewer.Bitmap.SaveToBlob(CER:CER_CERTIFICADOS,JpgSaver)
      END
    OF ?RotLeft
      ThisWindow.Update()
      Get(ImageQ, Choice(?List1))
      if ~Errorcode()
          Viewer.Bitmap.Rotate270(ImageQ.Bitmap)
          Viewer.Bitmap.Assign (ImageQ.Bitmap)
      end
      Select(?Viewer)
    OF ?RotRight
      ThisWindow.Update()
      Get(ImageQ, Choice(?List1))
      if ~Errorcode()
          Viewer.Bitmap.Rotate90(ImageQ.Bitmap)
          Viewer.Bitmap.Assign (ImageQ.Bitmap)
      end
      Select(?Viewer)
    OF ?ZoomFit
      ThisWindow.Update()
      Get(ImageQ, Choice(?List1))
      !if ~Errorcode()
          Viewer.ZoomToFit()
          Viewer.Bitmap.Assign(ImageQ.Bitmap)
      !end
      Select(?Viewer)
    OF ?ZoomIn
      ThisWindow.Update()
      Get(ImageQ, Choice(?List1))
      if ~Errorcode()
          Viewer.ZoomIn()
          Viewer.Bitmap.Assign(ImageQ.Bitmap)
      end
      Select(?Viewer)
    OF ?ZoomOut
      ThisWindow.Update()
      Get(ImageQ, Choice(?List1))
      if ~Errorcode()
          Viewer.ZoomOut()
          Viewer.Bitmap.Assign(ImageQ.Bitmap)
      end
      Select(?Viewer)
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?List1
      Get(ImageQ, Choice(?List1))
      if ~Errorcode()
          Viewer.Bitmap.Assign (ImageQ.Bitmap)
          Viewer.ZoomToFit()
      end
    END
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
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ImageExTwain1.OnAcquired FUNCTION(ImageExBitmapClass Bmp)
Result               BOOL
   CODE
   Clear(ImageQ)
   DO PrepararDatos
   ImageQ.Text = EPL:EMP_LEGAJO & '_' & Loc:empleado
   Loc:PdfFilename = CLIP(ImageQ.Text) & '_' & FORMAT(DAU:DAU_INICIO_DATE,@D06-) & '_' & FORMAT(DAU:DAU_FIN_DATE,@D06-)
   ImageQ.Bitmap &= new (ImageExBitmapClass)
   ImageQ.Bitmap.Assign(Bmp)
   Add(ImageQ)
   
   ?List1{PROP:SELECTED} = Records(ImageQ)
   Post(event:NewSelection, ?List1)
   Result = Parent.OnAcquired(Bmp)
   Return Result

ImageExTwain1.OnAcquireCancelled PROCEDURE()
   CODE
   Parent.OnAcquireCancelled()

ImageExTwain1.OnSourceDisabled PROCEDURE()
   CODE
   Parent.OnSourceDisabled()
