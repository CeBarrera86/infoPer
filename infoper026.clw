

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER026.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
MotivoAnulacion PROCEDURE 

LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Motivo de Anulación'),AT(,,135,45),FONT('Times New Roman',14,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,HLP('MotivoAnulacion'),SYSTEM
                       BUTTON('&OK'),AT(52,28,38,12),USE(?Ok),FONT(,12),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(92,28,38,12),USE(?Cancel),FONT(,12),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       TEXT,AT(30,6,100,20),USE(GLO:Obs_Anulacion),FONT(,12)
                       PROMPT('Motivo:'),AT(5,5,22,8),USE(?PROMPT1),FONT(,12,,FONT:bold)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
  GlobalErrors.SetProcedureName('MotivoAnulacion')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ok
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  GLO:Obs_Anulacion = ''
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
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
      IF GLO:Obs_Anulacion = '' THEN CYCLE.
    OF ?Cancel
      GLO:Obs_Anulacion = ''
    END
  ReturnValue = PARENT.TakeAccepted()
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
!!! Window
!!! </summary>
LicenciasEspeciales PROCEDURE 

Loc:convenio         STRING(20)                            !
Loc:convID           BYTE                                  !
Loc:radio            STRING(1)                             !
BRW5::View:Browse    VIEW(REGIMEN_LICENCIAS_ESPECIALES)
                       PROJECT(RLE:RLE_DIAS)
                       PROJECT(RLE:RLE_CONDICION)
                       PROJECT(RLE:RLE_DESCRIPCION)
                       PROJECT(RLE:RLE_CONVENIO)
                       PROJECT(RLE:RLE_ID)
                       PROJECT(RLE:RLE_MOTIVO)
                       JOIN(CON:PK_CONVENIO,RLE:RLE_CONVENIO)
                         PROJECT(CON:CONV_CONVENIO)
                         PROJECT(CON:CONV_ID)
                       END
                       JOIN(MAU:PK_MAU_CODIGO,RLE:RLE_MOTIVO)
                         PROJECT(MAU:MAU_DESCRIPCION)
                         PROJECT(MAU:MAU_CODIGO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
CON:CONV_CONVENIO      LIKE(CON:CONV_CONVENIO)        !List box control field - type derived from field
MAU:MAU_DESCRIPCION    LIKE(MAU:MAU_DESCRIPCION)      !List box control field - type derived from field
RLE:RLE_DIAS           LIKE(RLE:RLE_DIAS)             !List box control field - type derived from field
RLE:RLE_CONDICION      LIKE(RLE:RLE_CONDICION)        !List box control field - type derived from field
RLE:RLE_DESCRIPCION    LIKE(RLE:RLE_DESCRIPCION)      !List box control field - type derived from field
RLE:RLE_CONVENIO       LIKE(RLE:RLE_CONVENIO)         !Browse hot field - type derived from field
RLE:RLE_ID             LIKE(RLE:RLE_ID)               !Primary key field - type derived from field
CON:CONV_ID            LIKE(CON:CONV_ID)              !Related join file key field - type derived from field
MAU:MAU_CODIGO         LIKE(MAU:MAU_CODIGO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB2::View:FileDropCombo VIEW(CONVENIO)
                       PROJECT(CON:CONV_CONVENIO)
                       PROJECT(CON:CONV_ID)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CON:CONV_CONVENIO
CON:CONV_CONVENIO      LIKE(CON:CONV_CONVENIO)        !List box control field - type derived from field
CON:CONV_ID            LIKE(CON:CONV_ID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Solicitud Licencia'),AT(,,600,300),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('SolicitudLicencia'),SYSTEM
                       GROUP('Licencias Especiales'),AT(5,25,590,250),USE(?GROUP2:2),FONT(,,COLOR:Black,FONT:bold, |
  CHARSET:DEFAULT),BOXED
                         LIST,AT(10,40,580,230),USE(?List:2),FONT(,10),HVSCROLL,FLAT,FORMAT('75L(1)|~CONVENIO~C(' & |
  '0)@s21@110L(1)|~DESCRIPCION~C(0)@s25@30C|~DIAS~@n_3@60L(1)|~CONDICION~C(0)@s10@1380L' & |
  '(1)|M~DESCRIPCION~C(0)@s255@'),FROM(Queue:Browse:1),IMM,SCROLL
                       END
                       BUTTON('&Agregar'),AT(377,280,70,15),USE(?Insert),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wainsert.ico'), |
  FLAT,LAYOUT(0)
                       BUTTON('&Modificar'),AT(452,280,70,15),USE(?Change),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wachange.ico'), |
  FLAT,LAYOUT(0)
                       BUTTON('&Borrar'),AT(525,280,70,15),USE(?Delete),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wadelete.ico'), |
  FLAT,LAYOUT(0)
                       OPTION,AT(5,2,104,22),USE(Loc:radio),FONT(,,,,CHARSET:ANSI),BOXED
                         RADIO('Todos'),AT(15,10),USE(?OPTION1:RADIO1),VALUE('T')
                         RADIO('Convenio'),AT(58,10),USE(?OPTION1:RADIO2),VALUE('C')
                       END
                       COMBO(@s21),AT(114,6,90,17),USE(CON:CONV_CONVENIO),FONT(,10),DROP(5),FORMAT('84L(1)|@s21@'), |
  FROM(Queue:FileDropCombo),IMM
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
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
  GlobalErrors.SetProcedureName('LicenciasEspeciales')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('RLE:RLE_CONVENIO',RLE:RLE_CONVENIO)                ! Added by: BrowseBox(ABC)
  BIND('Loc:convID',Loc:convID)                            ! Added by: BrowseBox(ABC)
  BIND('Loc:radio',Loc:radio)                              ! Added by: BrowseBox(ABC)
  BIND('CON:CONV_CONVENIO',CON:CONV_CONVENIO)              ! Added by: BrowseBox(ABC)
  BIND('MAU:MAU_DESCRIPCION',MAU:MAU_DESCRIPCION)          ! Added by: BrowseBox(ABC)
  BIND('RLE:RLE_DIAS',RLE:RLE_DIAS)                        ! Added by: BrowseBox(ABC)
  BIND('RLE:RLE_CONDICION',RLE:RLE_CONDICION)              ! Added by: BrowseBox(ABC)
  BIND('RLE:RLE_DESCRIPCION',RLE:RLE_DESCRIPCION)          ! Added by: BrowseBox(ABC)
  BIND('RLE:RLE_ID',RLE:RLE_ID)                            ! Added by: BrowseBox(ABC)
  BIND('CON:CONV_ID',CON:CONV_ID)                          ! Added by: BrowseBox(ABC)
  BIND('MAU:MAU_CODIGO',MAU:MAU_CODIGO)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:REGIMEN_LICENCIAS_ESPECIALES.Open                 ! File REGIMEN_LICENCIAS_ESPECIALES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW5.Init(?List:2,Queue:Browse:1.ViewPosition,BRW5::View:Browse,Queue:Browse:1,Relate:REGIMEN_LICENCIAS_ESPECIALES,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.Q &= Queue:Browse:1
  BRW5.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW5.RetainRow = 0
  BRW5.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW5.AppendOrder('+CON:CONV_ID,+MAU:MAU_CODIGO')         ! Append an additional sort order
  BRW5.SetFilter('(RLE:RLE_CONVENIO = Loc:convID OR Loc:radio = ''T'')') ! Apply filter expression to browse
  BRW5.AddField(CON:CONV_CONVENIO,BRW5.Q.CON:CONV_CONVENIO) ! Field CON:CONV_CONVENIO is a hot field or requires assignment from browse
  BRW5.AddField(MAU:MAU_DESCRIPCION,BRW5.Q.MAU:MAU_DESCRIPCION) ! Field MAU:MAU_DESCRIPCION is a hot field or requires assignment from browse
  BRW5.AddField(RLE:RLE_DIAS,BRW5.Q.RLE:RLE_DIAS)          ! Field RLE:RLE_DIAS is a hot field or requires assignment from browse
  BRW5.AddField(RLE:RLE_CONDICION,BRW5.Q.RLE:RLE_CONDICION) ! Field RLE:RLE_CONDICION is a hot field or requires assignment from browse
  BRW5.AddField(RLE:RLE_DESCRIPCION,BRW5.Q.RLE:RLE_DESCRIPCION) ! Field RLE:RLE_DESCRIPCION is a hot field or requires assignment from browse
  BRW5.AddField(RLE:RLE_CONVENIO,BRW5.Q.RLE:RLE_CONVENIO)  ! Field RLE:RLE_CONVENIO is a hot field or requires assignment from browse
  BRW5.AddField(RLE:RLE_ID,BRW5.Q.RLE:RLE_ID)              ! Field RLE:RLE_ID is a hot field or requires assignment from browse
  BRW5.AddField(CON:CONV_ID,BRW5.Q.CON:CONV_ID)            ! Field CON:CONV_ID is a hot field or requires assignment from browse
  BRW5.AddField(MAU:MAU_CODIGO,BRW5.Q.MAU:MAU_CODIGO)      ! Field MAU:MAU_CODIGO is a hot field or requires assignment from browse
  IF Loc:radio = 'T'
     DISABLE(?CON:CONV_CONVENIO)
  END
  IF Loc:radio <> 'T'
     ENABLE(?CON:CONV_CONVENIO)
  END
  IF Loc:radio = 'C'
     ENABLE(?CON:CONV_CONVENIO)
  END
  IF Loc:radio <> 'C'
     DISABLE(?CON:CONV_CONVENIO)
  END
  BRW5.AskProcedure = 1                                    ! Will call: RegimenLicenciasEspeciales
  FDCB2.Init(CON:CONV_CONVENIO,?CON:CONV_CONVENIO,Queue:FileDropCombo.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo,Relate:CONVENIO,ThisWindow,GlobalErrors,0,1,0)
  FDCB2.Q &= Queue:FileDropCombo
  FDCB2.AddSortOrder(CON:PK_CONVENIO)
  FDCB2.AddField(CON:CONV_CONVENIO,FDCB2.Q.CON:CONV_CONVENIO) !List box control field - type derived from field
  FDCB2.AddField(CON:CONV_ID,FDCB2.Q.CON:CONV_ID) !Primary key field - type derived from field
  FDCB2.AddUpdateField(CON:CONV_CONVENIO,Loc:convenio)
  FDCB2.AddUpdateField(CON:CONV_ID,Loc:convID)
  ThisWindow.AddItem(FDCB2.WindowComponent)
  FDCB2.DefaultFill = 0
  CON:CONV_CONVENIO = ''
  Loc:radio = 'T'
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:REGIMEN_LICENCIAS_ESPECIALES.Close
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
    RegimenLicenciasEspeciales
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
    CASE ACCEPTED()
    OF ?CON:CONV_CONVENIO
      IF Loc:radio = 'C' THEN
          BRW5.SetFilter('RLE:RLE_CONVENIO = Loc:convID')
          
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:radio
      IF Loc:radio = 'T'
         DISABLE(?CON:CONV_CONVENIO)
      END
      IF Loc:radio <> 'T'
         ENABLE(?CON:CONV_CONVENIO)
      END
      IF Loc:radio = 'C'
         ENABLE(?CON:CONV_CONVENIO)
      END
      IF Loc:radio <> 'C'
         DISABLE(?CON:CONV_CONVENIO)
      END
      ThisWindow.Reset()
    OF ?CON:CONV_CONVENIO
      ThisWindow.Reset(1)
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?OPTION1:RADIO1
    CASE EVENT()
    OF EVENT:Selecting
      CON:CONV_CONVENIO = ''
      BRW5.SetFilter('')
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?OPTION1:RADIO1
    CASE EVENT()
    OF EVENT:Selecting
      ThisWindow.Reset(1)
    END
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


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END

!!! <summary>
!!! Generated from procedure template - Window
!!! Form REGIMEN_LICENCIAS_ESPECIALES
!!! </summary>
RegimenLicenciasEspeciales PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:convenio         STRING(20)                            !
Loc:motivo           STRING(20)                            !
ActionMessage        CSTRING(40)                           !
FDCB8::View:FileDropCombo VIEW(CONVENIO)
                       PROJECT(CON:CONV_CONVENIO)
                       PROJECT(CON:CONV_ID)
                     END
FDCB9::View:FileDropCombo VIEW(MOTIVO_AUSENCIA)
                       PROJECT(MAU:MAU_DESCRIPCION)
                       PROJECT(MAU:MAU_CODIGO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CON:CONV_CONVENIO
CON:CONV_CONVENIO      LIKE(CON:CONV_CONVENIO)        !List box control field - type derived from field
CON:CONV_ID            LIKE(CON:CONV_ID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !Queue declaration for browse/combo box using ?MAU:MAU_DESCRIPCION
MAU:MAU_DESCRIPCION    LIKE(MAU:MAU_DESCRIPCION)      !List box control field - type derived from field
MAU:MAU_CODIGO         LIKE(MAU:MAU_CODIGO)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::RLE:Record  LIKE(RLE:RECORD),THREAD
QuickWindow          WINDOW('Régimen Licencias Especiales'),AT(,,240,189),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('FormSolicitudLicencia1'),SYSTEM
                       SHEET,AT(5,5,230,162),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           PROMPT('CONVENIO:'),AT(11,26),USE(?RLE:RLE_CONVENIO:Prompt),FONT(,10),TRN
                           PROMPT('MOTIVO:'),AT(11,42),USE(?RLE:RLE_MOTIVO:Prompt),FONT(,10),TRN
                           PROMPT('DÍAS:'),AT(11,58),USE(?RLE:RLE_DIAS:Prompt),FONT(,10),TRN
                           ENTRY(@n_3),AT(79,59,25,11),USE(RLE:RLE_DIAS),FONT(,10),CENTER
                           PROMPT('CONDICIÓN:'),AT(11,74),USE(?RLE:RLE_CONDICION:Prompt),FONT(,10),TRN
                           PROMPT('DESCRIPCIÓN:'),AT(11,90),USE(?RLE:RLE_DESCRIPCION:Prompt),FONT(,10),TRN
                           TEXT,AT(79,91,150,70),USE(RLE:RLE_DESCRIPCION),FONT(,10)
                           COMBO(@s21),AT(79,27,95,11),USE(CON:CONV_CONVENIO),FONT(,10),DROP(5),FORMAT('84L(1)|@s21@'), |
  FROM(Queue:FileDropCombo),IMM,READONLY
                           COMBO(@s25),AT(79,43,95,11),USE(MAU:MAU_DESCRIPCION),DROP(5),FORMAT('100L(1)|M@s25@'),FROM(Queue:FileDropCombo:1), |
  IMM,READONLY
                           COMBO(@s20),AT(79,75,59,11),USE(RLE:RLE_CONDICION,,?RLE:RLE_CONDICION:2),DROP(2),FROM('HÁBILES|CORRIDOS'), |
  READONLY
                         END
                       END
                       BUTTON('&OK'),AT(131,170,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(184,170,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

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
    ActionMessage = 'Régimen Licencias Especiales'
  OF InsertRecord
    ActionMessage = 'Se agregará nueva Licencia Especial'
  OF ChangeRecord
    ActionMessage = 'La Licencia Especial será modificada'
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('RegimenLicenciasEspeciales')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RLE:RLE_CONVENIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(RLE:Record,History::RLE:Record)
  SELF.AddHistoryField(?RLE:RLE_DIAS,4)
  SELF.AddHistoryField(?RLE:RLE_DESCRIPCION,6)
  SELF.AddHistoryField(?RLE:RLE_CONDICION:2,5)
  SELF.AddUpdateFile(Access:REGIMEN_LICENCIAS_ESPECIALES)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:MOTIVO_AUSENCIA.Open                              ! File MOTIVO_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:REGIMEN_LICENCIAS_ESPECIALES.Open                 ! File REGIMEN_LICENCIAS_ESPECIALES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:REGIMEN_LICENCIAS_ESPECIALES
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
    ?RLE:RLE_DIAS{PROP:ReadOnly} = True
    DISABLE(?CON:CONV_CONVENIO)
    DISABLE(?MAU:MAU_DESCRIPCION)
    DISABLE(?RLE:RLE_CONDICION:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB8.Init(CON:CONV_CONVENIO,?CON:CONV_CONVENIO,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:CONVENIO,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CON:PK_CONVENIO)
  FDCB8.AddField(CON:CONV_CONVENIO,FDCB8.Q.CON:CONV_CONVENIO) !List box control field - type derived from field
  FDCB8.AddField(CON:CONV_ID,FDCB8.Q.CON:CONV_ID) !Primary key field - type derived from field
  FDCB8.AddUpdateField(CON:CONV_CONVENIO,Loc:convenio)
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  FDCB9.Init(MAU:MAU_DESCRIPCION,?MAU:MAU_DESCRIPCION,Queue:FileDropCombo:1.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo:1,Relate:MOTIVO_AUSENCIA,ThisWindow,GlobalErrors,0,1,0)
  FDCB9.Q &= Queue:FileDropCombo:1
  FDCB9.AddSortOrder(MAU:PK_MAU_CODIGO)
  FDCB9.AddField(MAU:MAU_DESCRIPCION,FDCB9.Q.MAU:MAU_DESCRIPCION) !List box control field - type derived from field
  FDCB9.AddField(MAU:MAU_CODIGO,FDCB9.Q.MAU:MAU_CODIGO) !Primary key field - type derived from field
  FDCB9.AddUpdateField(MAU:MAU_DESCRIPCION,Loc:motivo)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:MOTIVO_AUSENCIA.Close
    Relate:REGIMEN_LICENCIAS_ESPECIALES.Close
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
    CASE ACCEPTED()
    OF ?CON:CONV_CONVENIO
      RLE:RLE_CONVENIO = CON:CONV_ID
    OF ?MAU:MAU_DESCRIPCION
      RLE:RLE_MOTIVO = MAU:MAU_CODIGO
    OF ?OK
      IF SELF.Request = InsertRecord OR SELF.Request = ChangeRecord THEN
          RLE:RLE_DESCRIPCION = UPPER(RLE:RLE_DESCRIPCION)
      END
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

