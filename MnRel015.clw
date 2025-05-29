

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL015.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
UP_Emplea PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::EMP:Record  LIKE(EMP:RECORD),THREAD
QuickWindow          WINDOW('Empleados'),AT(,,268,150),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER,GRAY, |
  IMM,MDI,HLP('UP_Emplea'),SYSTEM
                       SHEET,AT(4,4,259,118),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Legajo:'),AT(8,20),USE(?EMP:EMP_Legajo:Prompt),TRN
                           ENTRY(@n-7),AT(50,20,40,10),USE(EMP:EMP_Legajo),REQ
                           OPTION('Activo'),AT(136,21,56,48),USE(EMP:EMP_Activo),BOXED
                             RADIO('Si'),AT(146,31),USE(?EMP:EMP_Activo:Radio1),VALUE('S')
                             RADIO('No'),AT(146,43),USE(?EMP:EMP_Activo:Radio2),VALUE('N')
                             RADIO('Pasivo'),AT(146,55),USE(?EMP:EMP_Activo:Radio3),VALUE('P')
                           END
                           PROMPT('Servicio:'),AT(8,34),USE(?EMP:EMP_Servicio:Prompt),TRN
                           ENTRY(@n-7),AT(50,34,40,10),USE(EMP:EMP_Servicio)
                           PROMPT('Sector:'),AT(8,48),USE(?EMP:EMP_Sector:Prompt),TRN
                           ENTRY(@n-7),AT(50,48,40,10),USE(EMP:EMP_Sector)
                           PROMPT('Seccion:'),AT(8,62),USE(?EMP:EMP_Seccion:Prompt),TRN
                           ENTRY(@n-7),AT(50,62,40,10),USE(EMP:EMP_Seccion)
                           PROMPT('Nombre:'),AT(8,76),USE(?EMP:EMP_Nombre:Prompt),TRN
                           ENTRY(@s50),AT(50,76,204,10),USE(EMP:EMP_Nombre),REQ
                           PROMPT('Calle:'),AT(8,90),USE(?EMP:EMP_Calle:Prompt),TRN
                           ENTRY(@s20),AT(50,90,84,10),USE(EMP:EMP_Calle)
                           PROMPT('Numero:'),AT(8,104),USE(?EMP:EMP_Numero:Prompt),TRN
                           ENTRY(@n-7),AT(50,104,40,10),USE(EMP:EMP_Numero)
                           PROMPT('Tarjeta:'),AT(121,104),USE(?EMP:EMP_Tarjeta:Prompt)
                           ENTRY(@n-14),AT(156,104,40,10),USE(EMP:EMP_Tarjeta),RIGHT(1)
                         END
                       END
                       BUTTON('&OK'),AT(105,127,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(159,127,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(211,127,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
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
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('UP_Emplea')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EMP:EMP_Legajo:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(EMP:Record,History::EMP:Record)
  SELF.AddHistoryField(?EMP:EMP_Legajo,1)
  SELF.AddHistoryField(?EMP:EMP_Activo,59)
  SELF.AddHistoryField(?EMP:EMP_Servicio,2)
  SELF.AddHistoryField(?EMP:EMP_Sector,3)
  SELF.AddHistoryField(?EMP:EMP_Seccion,4)
  SELF.AddHistoryField(?EMP:EMP_Nombre,5)
  SELF.AddHistoryField(?EMP:EMP_Calle,6)
  SELF.AddHistoryField(?EMP:EMP_Numero,7)
  SELF.AddHistoryField(?EMP:EMP_Tarjeta,60)
  SELF.AddUpdateFile(Access:EMPLEADOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:EMPLEADOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?EMP:EMP_Legajo{PROP:ReadOnly} = True
    ?EMP:EMP_Servicio{PROP:ReadOnly} = True
    ?EMP:EMP_Sector{PROP:ReadOnly} = True
    ?EMP:EMP_Seccion{PROP:ReadOnly} = True
    ?EMP:EMP_Nombre{PROP:ReadOnly} = True
    ?EMP:EMP_Calle{PROP:ReadOnly} = True
    ?EMP:EMP_Numero{PROP:ReadOnly} = True
    ?EMP:EMP_Tarjeta{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
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

