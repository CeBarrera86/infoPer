

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL011.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
upPersonalUbicacionPersonal PROCEDURE 

ActionMessage        CSTRING(40)                           !
FDCB5::View:FileDropCombo VIEW(SEDE_RELOJ)
                       PROJECT(SED:SED_Descripcion)
                       PROJECT(SED:SED_Codigo)
                     END
FDCB6::View:FileDropCombo VIEW(LUGAR)
                       PROJECT(LUG:LUG_Descripcion)
                       PROJECT(LUG:LUG_Codigo)
                     END
FDCB7::View:FileDropCombo VIEW(Emplea)
                       PROJECT(EPD:nombre_sue)
                       PROJECT(EPD:RCod1_Sue)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?SED:SED_Descripcion
SED:SED_Descripcion    LIKE(SED:SED_Descripcion)      !List box control field - type derived from field
SED:SED_Codigo         LIKE(SED:SED_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !Queue declaration for browse/combo box using ?LUG:LUG_Descripcion
LUG:LUG_Descripcion    LIKE(LUG:LUG_Descripcion)      !List box control field - type derived from field
LUG:LUG_Codigo         LIKE(LUG:LUG_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:2 QUEUE                           !Queue declaration for browse/combo box using ?EPD:nombre_sue
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::SED2:Record LIKE(SED2:RECORD),THREAD
Window               WINDOW('Asignacion - Legajo-Lugar'),AT(0,0,261,64),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  TILED,ICON(ICON:Application),MAX,MDI,HLP('~upPersonalUbicacionPersonal'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       PROMPT('Sede:'),AT(5,4),USE(?Prompt:SED2:SRL_Sede),TRN
                       ENTRY(@n-7),AT(48,4,32,12),USE(SED2:SRL_Sede),COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                       COMBO(@s30),AT(83,4,174,12),USE(SED:SED_Descripcion),DROP(5),FORMAT('200L(2)|M~SED Desc' & |
  'ripcion~@s50@'),FROM(Queue:FileDropCombo),IMM
                       PROMPT('Lugar:'),AT(5,20),USE(?Prompt:SED2:SRL_Lugar),TRN
                       ENTRY(@n-7),AT(48,20,32,12),USE(SED2:SRL_Lugar),COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                       COMBO(@s30),AT(83,20,174,12),USE(LUG:LUG_Descripcion),DROP(5),FORMAT('200L(2)|M~LUG Des' & |
  'cripcion~@s50@'),FROM(Queue:FileDropCombo:1),IMM
                       PROMPT('Legajo:'),AT(5,36),USE(?Prompt:SED2:SRL_Legajo),TRN
                       ENTRY(@n4),AT(48,36,32,12),USE(EPD:RCod1_Sue),COLOR(COLOR:WINDOW),READONLY,REQ,SKIP
                       COMBO(@s30),AT(83,36,174,12),USE(EPD:nombre_sue),DROP(5),FORMAT('120L(2)|M~nombre sue~@s30@'), |
  FROM(Queue:FileDropCombo:2),IMM
                       BUTTON('&OK'),AT(144,50,55,14),USE(?OK),LEFT,ICON('wizOk.ico'),DEFAULT
                       BUTTON('&Cancel'),AT(200,50,55,14),USE(?Cancel),LEFT,ICON('wizCncl.ico')
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

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:2         !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('upPersonalUbicacionPersonal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt:SED2:SRL_Sede
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(SED2:Record,History::SED2:Record)
  SELF.AddHistoryField(?SED2:SRL_Sede,1)
  SELF.AddHistoryField(?SED2:SRL_Lugar,2)
  SELF.AddUpdateFile(Access:SEDE_RELOJ_EMP)
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  Relate:LUGAR.SetOpenRelated()
  Relate:LUGAR.Open                                        ! File LUGAR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SEDE_RELOJ_EMP
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
  !aca
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB5.Init(SED:SED_Descripcion,?SED:SED_Descripcion,Queue:FileDropCombo.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo,Relate:SEDE_RELOJ,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo
  FDCB5.AddSortOrder(SED:IX_Descripcion)
  FDCB5.AddField(SED:SED_Descripcion,FDCB5.Q.SED:SED_Descripcion) !List box control field - type derived from field
  FDCB5.AddField(SED:SED_Codigo,FDCB5.Q.SED:SED_Codigo) !Primary key field - type derived from field
  FDCB5.AddUpdateField(SED:SED_Codigo,SED2:SRL_Sede)
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
  FDCB6.Init(LUG:LUG_Descripcion,?LUG:LUG_Descripcion,Queue:FileDropCombo:1.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo:1,Relate:LUGAR,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo:1
  FDCB6.AddSortOrder(LUG:IX_Descripcion)
  FDCB6.AddField(LUG:LUG_Descripcion,FDCB6.Q.LUG:LUG_Descripcion) !List box control field - type derived from field
  FDCB6.AddField(LUG:LUG_Codigo,FDCB6.Q.LUG:LUG_Codigo) !Primary key field - type derived from field
  FDCB6.AddUpdateField(LUG:LUG_Codigo,SED2:SRL_Lugar)
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  FDCB7.Init(EPD:nombre_sue,?EPD:nombre_sue,Queue:FileDropCombo:2.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:2,Relate:Emplea,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:2
  FDCB7.AddSortOrder()
  FDCB7.SetFilter('upper(EPD:activo_sue) = ''S''')
  FDCB7.AddField(EPD:nombre_sue,FDCB7.Q.EPD:nombre_sue) !List box control field - type derived from field
  FDCB7.AddField(EPD:RCod1_Sue,FDCB7.Q.EPD:RCod1_Sue) !Primary key field - type derived from field
  FDCB7.AddUpdateField(EPD:RCod1_Sue,SED2:SRL_Legajo)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
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
    Relate:LUGAR.Close
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
    OF ?SED2:SRL_Sede
      IF Access:SEDE_RELOJ_EMP.TryValidateField(1)         ! Attempt to validate SED2:SRL_Sede in SEDE_RELOJ_EMP
        SELECT(?SED2:SRL_Sede)
        Window{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SED2:SRL_Sede
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SED2:SRL_Sede{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SED2:SRL_Lugar
      IF Access:SEDE_RELOJ_EMP.TryValidateField(2)         ! Attempt to validate SED2:SRL_Lugar in SEDE_RELOJ_EMP
        SELECT(?SED2:SRL_Lugar)
        Window{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SED2:SRL_Lugar
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SED2:SRL_Lugar{PROP:FontColor} = FieldColorQueue.OldColor
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
  SELF.SetStrategy(?SED2:SRL_Sede, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?SED2:SRL_Sede
  SELF.SetStrategy(?Prompt:SED2:SRL_Sede, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:SED2:SRL_Sede
  SELF.SetStrategy(?SED2:SRL_Lugar, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:LockHeight) ! Override strategy for ?SED2:SRL_Lugar
  SELF.SetStrategy(?Prompt:SED2:SRL_Lugar, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:SED2:SRL_Lugar
  SELF.SetStrategy(?Prompt:SED2:SRL_Legajo, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Prompt:SED2:SRL_Legajo
  SELF.SetStrategy(?Cancel, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Cancel
  SELF.SetStrategy(?OK, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?OK

