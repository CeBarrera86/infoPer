

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL030.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL029.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
Informes_HorasDev PROCEDURE 

LOC:FDESDE           LONG                                  !
LOC:FHASTA           LONG                                  !
loc:general          BYTE                                  !
FDCB4::View:FileDropCombo VIEW(LUGAR)
                       PROJECT(LUG:LUG_Descripcion)
                       PROJECT(LUG:LUG_Codigo)
                     END
FDCB5::View:FileDropCombo VIEW(Emplea)
                       PROJECT(EPD:nombre_sue)
                       PROJECT(EPD:RCod1_Sue)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?LUG:LUG_Descripcion
LUG:LUG_Descripcion    LIKE(LUG:LUG_Descripcion)      !List box control field - type derived from field
LUG:LUG_Codigo         LIKE(LUG:LUG_Codigo)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo:1 QUEUE                           !Queue declaration for browse/combo box using ?EPD:nombre_sue
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW(' INFORME HORAS DEVOLUCIÓN'),AT(,,202,143),FONT('MS Sans Serif',10,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,HLP('Informes_HorasDev'),SYSTEM
                       STRING('LUGAR:'),AT(12,8),USE(?String2)
                       COMBO(@s20),AT(11,18,139,12),USE(LUG:LUG_Descripcion),FONT(,,COLOR:Blue,FONT:bold,CHARSET:ANSI), |
  COLOR(00DFDBBDh),DROP(5),FORMAT('200L(2)|M~LUG Descripcion~@s50@'),FROM(Queue:FileDropCombo), |
  IMM
                       STRING(@n_3B),AT(159,19),USE(LUG:LUG_Codigo),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI)
                       STRING('EMPLEADO:'),AT(12,36),USE(?String2:2)
                       COMBO(@s20),AT(11,46,139,12),USE(EPD:nombre_sue),COLOR(00A5DCFAh),DROP(5),FORMAT('120L(2)|M~' & |
  'nombre sue~@s30@'),FROM(Queue:FileDropCombo:1),IMM
                       STRING(@n04b),AT(159,47),USE(EPD:RCod1_Sue),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI)
                       PROMPT('DESDE:'),AT(13,82),USE(?LOC:FDESDE:Prompt)
                       ENTRY(@d05b),AT(42,80,43,10),USE(LOC:FDESDE),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI),CENTER(1), |
  COLOR(0080FFFFh)
                       BUTTON('...'),AT(88,79,12,12),USE(?Calendar)
                       PROMPT('HASTA:'),AT(13,102),USE(?LOC:FHASTA:Prompt)
                       ENTRY(@d05b),AT(42,100,43,10),USE(LOC:FHASTA),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI), |
  CENTER(1),COLOR(0080FFFFh)
                       BUTTON('...'),AT(88,99,12,12),USE(?Calendar:2)
                       BUTTON('&Aceptar'),AT(121,78,64,14),USE(?Ok),FONT(,12,,FONT:bold,CHARSET:ANSI),LEFT,ICON('WAOK.ICO')
                       BUTTON('&Cancelar'),AT(121,97,64,14),USE(?Cancel),FONT(,12,,FONT:bold,CHARSET:ANSI),LEFT,ICON('WACANCEL.ICO')
                       PROMPT('DATOS ACTUALIZADOS AL DIA:'),AT(13,120),USE(?glo:fecha:Prompt)
                       ENTRY(@d06b),AT(121,118,49,10),USE(glo:fecha),FONT(,12,,FONT:bold,CHARSET:ANSI),CENTER,COLOR(0080FF80h)
                       BUTTON('...'),AT(173,117,12,12),USE(?Calendar:4)
                       BUTTON('...'),AT(202,128,12,12),USE(?Calendar:3)
                       CHECK(' Habilitar Impresión General'),AT(12,64),USE(loc:general),VALUE('1','0')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

FDCB5                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

Calendar6            CalendarClass
Calendar7            CalendarClass
Calendar8            CalendarClass

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
  GlobalErrors.SetProcedureName('Informes_HorasDev')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LUG:LUG_Codigo',LUG:LUG_Codigo)                    ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  LOC:FHASTA=today()
  LOC:FDESDE=LOC:FHASTA - 1
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  Relate:LUGAR.SetOpenRelated()
  Relate:LUGAR.Open                                        ! File LUGAR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB4.Init(LUG:LUG_Descripcion,?LUG:LUG_Descripcion,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:LUGAR,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(LUG:PK_LUGAR)
  FDCB4.AddField(LUG:LUG_Descripcion,FDCB4.Q.LUG:LUG_Descripcion) !List box control field - type derived from field
  FDCB4.AddField(LUG:LUG_Codigo,FDCB4.Q.LUG:LUG_Codigo) !Browse hot field - type derived from field
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  FDCB5.Init(EPD:nombre_sue,?EPD:nombre_sue,Queue:FileDropCombo:1.ViewPosition,FDCB5::View:FileDropCombo,Queue:FileDropCombo:1,Relate:Emplea,ThisWindow,GlobalErrors,0,1,0)
  FDCB5.Q &= Queue:FileDropCombo:1
  FDCB5.AddSortOrder(EPD:Key1_sue)
  FDCB5.SetFilter('EPD:activo_sue = ''S''')
  FDCB5.AddField(EPD:nombre_sue,FDCB5.Q.EPD:nombre_sue) !List box control field - type derived from field
  FDCB5.AddField(EPD:RCod1_Sue,FDCB5.Q.EPD:RCod1_Sue) !Primary key field - type derived from field
  ThisWindow.AddItem(FDCB5.WindowComponent)
  FDCB5.DefaultFill = 0
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
      IF NOT LOC:GENERAL AND |
         ((LUG:LUG_Codigo = 0 AND EPD:RCod1_Sue = 0) OR (LOC:FDESDE > LOC:FHASTA) OR ((LOC:FDESDE - LOC:FHASTA) = 0)) THEN
            MESSAGE('VERIFIQUE PARAMETROS', ' MENSAJE EL OPERADOR')
            CYCLE
      END
      IF GLO:FECHA > LOC:FHASTA  THEN
         MESSAGE('FECHA DE ACTUALIZACION INCORRECTA',' MENSAJE EL OPERADOR')
         CYCLE
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar6.SelectOnClose = True
      Calendar6.Ask('Seleccione Fecha',LOC:FDESDE)
      IF Calendar6.Response = RequestCompleted THEN
      LOC:FDESDE=Calendar6.SelectedDate
      DISPLAY(?LOC:FDESDE)
      END
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar7.SelectOnClose = True
      Calendar7.Ask('Seleccione Fecha',LOC:FHASTA)
      IF Calendar7.Response = RequestCompleted THEN
      LOC:FHASTA=Calendar7.SelectedDate
      DISPLAY(?LOC:FHASTA)
      END
    OF ?Ok
      ThisWindow.Update()
      HorasDevPRT(LUG:LUG_Codigo,EPD:RCod1_Sue,LOC:FDESDE,LOC:FHASTA, LOC:GENERAL)
      ThisWindow.Reset
    OF ?Calendar:4
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',glo:fecha)
      IF Calendar8.Response = RequestCompleted THEN
      glo:fecha=Calendar8.SelectedDate
      DISPLAY(?glo:fecha)
      END
      ThisWindow.Reset(True)
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

