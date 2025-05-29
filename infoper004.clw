

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER004.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
UpdateDEBITO_EMPLEADOS PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
FDCB6::View:FileDropCombo VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_NOMBRE)
                       PROJECT(EPL:EMP_LEGAJO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?EPL:EMP_NOMBRE
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::DEB:Record  LIKE(DEB:RECORD),THREAD
QuickWindow          WINDOW('Update the DEBITO_EMPLEADOS File'),AT(,,355,104),FONT('Microsoft Sans Serif',10,COLOR:Green, |
  FONT:bold),RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateDEBITO_EMPLEADOS'),SYSTEM
                       SHEET,AT(4,4,345,76),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Legajo:'),AT(38,28),USE(?DEB:DEB_LEGAJO:Prompt)
                           ENTRY(@n_10),AT(16,38,64,10),USE(DEB:DEB_LEGAJO),RIGHT(1)
                           COMBO(@s20),AT(84,38,145,10),USE(EPL:EMP_NOMBRE),DROP(5),FORMAT('124L(2)|M@s31@'),FROM(Queue:FileDropCombo), |
  IMM
                           PROMPT('Cliente:'),AT(256,28),USE(?DEB:DEB_CLIENTE:Prompt)
                           ENTRY(@n_7),AT(231,38,64,10),USE(DEB:DEB_CLIENTE),RIGHT(1)
                           PROMPT('Suministro:'),AT(304,28),USE(?DEB:DEB_SUMINISTRO:Prompt)
                           ENTRY(@n_6),AT(297,38,43,10),USE(DEB:DEB_SUMINISTRO),RIGHT(1)
                           GROUP('Titular Suministro'),AT(110,52,164,23),USE(?Group1),BOXED
                             STRING(@s35),AT(121,60,145,10),USE(CLI:CLI_TITULAR),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                           END
                         END
                       END
                       BUTTON('OK'),AT(246,88,44,14),USE(?OK),FONT(,,COLOR:Black),LEFT,ICON('waok.ico'),DEFAULT
                       BUTTON('Cancelar'),AT(294,88,51,14),USE(?Cancel),FONT(,,COLOR:Black),LEFT,ICON('wacancel.ico')
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
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

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
    ActionMessage = 'Ver'
  OF InsertRecord
    ActionMessage = 'Insertar'
  OF ChangeRecord
    ActionMessage = 'Modificar'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdateDEBITO_EMPLEADOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DEB:DEB_LEGAJO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(DEB:Record,History::DEB:Record)
  SELF.AddHistoryField(?DEB:DEB_LEGAJO,1)
  SELF.AddHistoryField(?DEB:DEB_CLIENTE,3)
  SELF.AddHistoryField(?DEB:DEB_SUMINISTRO,4)
  SELF.AddUpdateFile(Access:DEBITO_EMPLEADOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CLIENTE.Open                                      ! File CLIENTE used by this procedure, so make sure it's RelationManager is open
  Relate:DEBITO_EMPLEADOS.Open                             ! File DEBITO_EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DEBITO_EMPLEADOS
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
  SELF.Open(QuickWindow)                                   ! Open window
       if self.request = InsertRecord
            DEB:DEB_EMPRESA = 1
           ! display
       else
          cli:cli_empresa = DEB:DEB_EMPRESA
          cli:cli_id = DEB:DEB_CLIENTE
          get(cliente,CLI:PK_CLIENTE)
          if errorcode()
              message('No existe Cliente')
              select(?)
          end
          display(cli:cli_titular)
       end
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.AddItem(ToolbarForm)
  FDCB6.Init(EPL:EMP_NOMBRE,?EPL:EMP_NOMBRE,Queue:FileDropCombo.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo,Relate:EMPLEADOS,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo
  FDCB6.AddSortOrder(EPL:PK_Nombre)
  FDCB6.AddField(EPL:EMP_NOMBRE,FDCB6.Q.EPL:EMP_NOMBRE) !List box control field - type derived from field
  FDCB6.AddField(EPL:EMP_LEGAJO,FDCB6.Q.EPL:EMP_LEGAJO) !Primary key field - type derived from field
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.IncludeEmpty = TRUE
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CLIENTE.Close
    Relate:DEBITO_EMPLEADOS.Close
    Relate:EMPLEADOS.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  DEB:DEB_SERVICIO = GLO:SERVICIO
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
    OF ?DEB:DEB_CLIENTE
          if deb:deb_cliente <> 0
              cli:cli_empresa = DEB:DEB_EMPRESA
              cli:cli_id = DEB:DEB_CLIENTE
              set(CLI:PK_CLIENTE,CLI:PK_CLIENTE)
              get(cliente,CLI:PK_CLIENTE)
              if errorcode()
                  message('No existe Cliente')
                  select(?)
              end
              display(cli:cli_titular)
           end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DEB:DEB_LEGAJO
          
          EPL:EMP_LEGAJO = DEB:DEB_LEGAJO
          get(empleados,EPL:PK_EMPLEADOS)
          if errorcode()
              clear(deb:deb_legajo)
              select(?deb:deb_legajo)
          .
    OF ?EPL:EMP_NOMBRE
          display
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

