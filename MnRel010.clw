

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL010.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
upPersonalLugar PROCEDURE 

ActionMessage        CSTRING(40)                           !
FDCB2::View:FileDropCombo VIEW(SEDE_RELOJ)
                       PROJECT(SED:SED_Descripcion)
                       PROJECT(SED:SED_Codigo)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?SED:SED_Descripcion
SED:SED_Descripcion    LIKE(SED:SED_Descripcion)      !List box control field - type derived from field
SED:SED_Codigo         LIKE(SED:SED_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::LUG:Record  LIKE(LUG:RECORD),THREAD
Window               WINDOW('Lugar del Personal'),AT(0,0,215,142),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  TILED,ICON(ICON:Application),MAX,MDI,HLP('~upPersonalLugar'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       SHEET,AT(6,3,201,120),USE(?CurrentTab),JOIN,COLOR(COLOR:BTNFACE),BELOW
                         TAB('General'),USE(?Tab:9)
                           PROMPT('Codigo:'),AT(36,11),USE(?Prompt:LUG:LUG_Codigo),TRN
                           ENTRY(@n-7),AT(66,11,32,12),USE(LUG:LUG_Codigo),COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                           PROMPT('Descripcion:'),AT(20,26),USE(?Prompt:LUG:LUG_Descripcion),TRN
                           ENTRY(@s50),AT(66,26,137,12),USE(LUG:LUG_Descripcion),CAP,COLOR(COLOR:WINDOW)
                           PROMPT('Hora Entrada:'),AT(16,40),USE(?Prompt:LUG:LUG_Hora_Entrada_TIME),TRN
                           ENTRY(@t7),AT(66,40,41,12),USE(LUG:LUG_Hora_Entrada_TIME),COLOR(COLOR:WINDOW)
                           PROMPT('Hora Salida:'),AT(20,54),USE(?Prompt:LUG:LUG_Hora_Salida_TIME),TRN
                           ENTRY(@t7),AT(66,54,41,12),USE(LUG:LUG_Hora_Salida_TIME),COLOR(COLOR:WINDOW)
                           PROMPT('Sede:'),AT(40,69),USE(?LUG:LUG_Sede:Prompt)
                           ENTRY(@n-7),AT(66,68,41,12),USE(LUG:LUG_Sede),RIGHT(1),COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                           COMBO(@s15),AT(108,68,93,12),USE(SED:SED_Descripcion),COLOR(COLOR:WINDOW),DROP(5),FORMAT('200L(2)|M~' & |
  'Descripcion~@s15@'),FROM(Queue:FileDropCombo),IMM
                           PROMPT('eMail:'),AT(42,86),USE(?LUG:LUG_EMAIL:Prompt)
                           ENTRY(@s30),AT(66,84,135,12),USE(LUG:LUG_EMAIL),COLOR(COLOR:White)
                         END
                       END
                       BUTTON('&OK'),AT(95,115,55,14),USE(?OK),LEFT,ICON('wizOk.ico'),DEFAULT
                       BUTTON('&Cancel'),AT(151,115,55,14),USE(?Cancel),LEFT,ICON('wizCncl.ico')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
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
  GlobalErrors.SetProcedureName('upPersonalLugar')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt:LUG:LUG_Codigo
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(LUG:Record,History::LUG:Record)
  SELF.AddHistoryField(?LUG:LUG_Codigo,1)
  SELF.AddHistoryField(?LUG:LUG_Descripcion,2)
  SELF.AddHistoryField(?LUG:LUG_Hora_Entrada_TIME,6)
  SELF.AddHistoryField(?LUG:LUG_Hora_Salida_TIME,10)
  SELF.AddHistoryField(?LUG:LUG_Sede,11)
  SELF.AddHistoryField(?LUG:LUG_EMAIL,12)
  SELF.AddUpdateFile(Access:LUGAR)
  Relate:LUGAR.SetOpenRelated()
  Relate:LUGAR.Open                                        ! File LUGAR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:LUGAR
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
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB2.Init(SED:SED_Descripcion,?SED:SED_Descripcion,Queue:FileDropCombo.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo,Relate:SEDE_RELOJ,ThisWindow,GlobalErrors,0,1,0)
  FDCB2.Q &= Queue:FileDropCombo
  FDCB2.AddSortOrder(SED:IX_Descripcion)
  FDCB2.AddField(SED:SED_Descripcion,FDCB2.Q.SED:SED_Descripcion) !List box control field - type derived from field
  FDCB2.AddField(SED:SED_Codigo,FDCB2.Q.SED:SED_Codigo) !Primary key field - type derived from field
  FDCB2.AddUpdateField(SED:SED_Codigo,LUG:LUG_Sede)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LUGAR.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  LUG:LUG_Hora_Entrada_DATE = today()
  LUG:LUG_Hora_Salida_DATE = today()
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
  SELF.SetStrategy(?LUG:LUG_Codigo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?LUG:LUG_Codigo
  SELF.SetStrategy(?Prompt:LUG:LUG_Codigo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:LUG:LUG_Codigo
  SELF.SetStrategy(?LUG:LUG_Descripcion, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?LUG:LUG_Descripcion
  SELF.SetStrategy(?Prompt:LUG:LUG_Descripcion, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:LUG:LUG_Descripcion
  SELF.SetStrategy(?LUG:LUG_Hora_Entrada_TIME, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?LUG:LUG_Hora_Entrada_TIME
  SELF.SetStrategy(?Prompt:LUG:LUG_Hora_Entrada_TIME, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:LUG:LUG_Hora_Entrada_TIME
  SELF.SetStrategy(?LUG:LUG_Hora_Salida_TIME, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?LUG:LUG_Hora_Salida_TIME
  SELF.SetStrategy(?Prompt:LUG:LUG_Hora_Salida_TIME, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:LUG:LUG_Hora_Salida_TIME
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK

