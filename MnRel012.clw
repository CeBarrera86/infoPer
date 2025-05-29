

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL012.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
upPersonalTarjetas PROCEDURE 

ActionMessage        CSTRING(40)                           !
FDCB5::View:FileDropCombo VIEW(Emplea)
                       PROJECT(EPD:nombre_sue)
                       PROJECT(EPD:RCod1_Sue)
                     END
FDCB6::View:FileDropCombo VIEW(SEDE_RELOJ)
                       PROJECT(SED:SED_Descripcion)
                       PROJECT(SED:SED_Codigo)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?EPD:nombre_sue
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !Queue declaration for browse/combo box using ?SED:SED_Descripcion
SED:SED_Descripcion    LIKE(SED:SED_Descripcion)      !List box control field - type derived from field
SED:SED_Codigo         LIKE(SED:SED_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::TAR:Record  LIKE(TAR:RECORD),THREAD
Window               WINDOW('Asignación Código Tarjeta'),AT(0,0,317,93),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  TILED,ICON(ICON:Application),MAX,MDI,HLP('~upPersonalTarjetas'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       PROMPT('Legajo:'),AT(59,4),USE(?Prompt:TAR:TAR_Legajo),TRN
                       ENTRY(@n4),AT(89,4,32,12),USE(TAR:TAR_Legajo),COLOR(COLOR:WINDOW),READONLY,SKIP
                       COMBO(@s30),AT(125,4,171,12),USE(EPD:nombre_sue),DROP(5),FORMAT('120L(2)|M~nombre sue~@s30@'), |
  FROM(Queue:FileDropCombo),IMM
                       PROMPT('Reloj:'),AT(64,20),USE(?Prompt:TAR:TAR_Reloj),TRN
                       ENTRY(@n4),AT(89,20,32,12),USE(TAR:TAR_Reloj),COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                       COMBO(@s20),AT(125,20,171,12),USE(SED:SED_Descripcion),DROP(5),FORMAT('200L(2)|M~SED De' & |
  'scripcion~@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Codigo:'),AT(58,37),USE(?Prompt:TAR:TAR_Codigo),TRN
                       ENTRY(@n-7),AT(89,36,32,12),USE(TAR:TAR_Codigo),FONT(,10,,FONT:bold,CHARSET:ANSI),RIGHT,COLOR(COLOR:WINDOW), |
  REQ
                       PROMPT('Observaciones:'),AT(34,53),USE(?TAR:TAR_Observaciones:Prompt),TRN
                       ENTRY(@s50),AT(89,51,205,12),USE(TAR:TAR_Observaciones),CAP
                       BUTTON('&OK'),AT(191,70,55,14),USE(?OK),LEFT,ICON('wizOk.ico'),DEFAULT
                       BUTTON('&Cancel'),AT(248,70,55,14),USE(?Cancel),LEFT,ICON('wizCncl.ico')
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

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('upPersonalTarjetas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt:TAR:TAR_Legajo
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(TAR:Record,History::TAR:Record)
  SELF.AddHistoryField(?TAR:TAR_Legajo,1)
  SELF.AddHistoryField(?TAR:TAR_Reloj,2)
  SELF.AddHistoryField(?TAR:TAR_Codigo,3)
  SELF.AddHistoryField(?TAR:TAR_Observaciones,4)
  SELF.AddUpdateFile(Access:TARJETA)
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  Relate:SEDE_RELOJ.Open                                   ! File SEDE_RELOJ used by this procedure, so make sure it's RelationManager is open
  Relate:TARJETA.Open                                      ! File TARJETA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TARJETA
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
  FDCB5.Init(EPD:nombre_sue,?EPD:nombre_sue,Queue:FileDropCombo.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo,Relate:Emplea,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo
  FDCB5.AddSortOrder()
  FDCB5.SetFilter('upper(EPD:activo_sue) = ''S''')
  FDCB5.AddField(EPD:nombre_sue,FDCB5.Q.EPD:nombre_sue) !List box control field - type derived from field
  FDCB5.AddField(EPD:RCod1_Sue,FDCB5.Q.EPD:RCod1_Sue) !Primary key field - type derived from field
  FDCB5.AddUpdateField(EPD:RCod1_Sue,TAR:TAR_Legajo)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB6.Init(SED:SED_Descripcion,?SED:SED_Descripcion,Queue:FileDropCombo:1.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo:1,Relate:SEDE_RELOJ,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo:1
  FDCB6.AddSortOrder(SED:IX_Descripcion)
  FDCB6.AddField(SED:SED_Descripcion,FDCB6.Q.SED:SED_Descripcion) !List box control field - type derived from field
  FDCB6.AddField(SED:SED_Codigo,FDCB6.Q.SED:SED_Codigo) !Primary key field - type derived from field
  FDCB6.AddUpdateField(SED:SED_Codigo,TAR:TAR_Reloj)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Emplea.Close
    Relate:SEDE_RELOJ.Close
    Relate:TARJETA.Close
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
    OF ?TAR:TAR_Legajo
      IF Access:TARJETA.TryValidateField(1)                ! Attempt to validate TAR:TAR_Legajo in TARJETA
        SELECT(?TAR:TAR_Legajo)
        Window{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?TAR:TAR_Legajo
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?TAR:TAR_Legajo{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
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
  SELF.SetStrategy(?TAR:TAR_Legajo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?TAR:TAR_Legajo
  SELF.SetStrategy(?Prompt:TAR:TAR_Legajo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:TAR:TAR_Legajo
  SELF.SetStrategy(?TAR:TAR_Reloj, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?TAR:TAR_Reloj
  SELF.SetStrategy(?Prompt:TAR:TAR_Reloj, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:TAR:TAR_Reloj
  SELF.SetStrategy(?TAR:TAR_Codigo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?TAR:TAR_Codigo
  SELF.SetStrategy(?Prompt:TAR:TAR_Codigo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:TAR:TAR_Codigo
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK

