

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL032.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
Transferir_HDLegajo PROCEDURE (PSERV,PLEGA)

LOC:SERVANT          STRING(@n01)                          !
LOC:SERVIC           STRING(@n01)                          !
LOC:LEGAJO           STRING(@n03)                          !
loc:registros        SHORT                                 !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW(' TRANSFERIR DESDE SERVICIO ANTERIOR'),AT(,,222,32),FONT('MS Sans Serif',10,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,HLP('Transferir_HDLegajo'),SYSTEM
                       STRING('SERV-LEG ACTUAL:'),AT(14,5,69,10),USE(?String4)
                       STRING(@n01),AT(80,5),USE(LOC:SERVIC),FONT(,,COLOR:Blue,,CHARSET:ANSI),RIGHT
                       STRING(@n03),AT(92,5),USE(LOC:LEGAJO),FONT(,,COLOR:Blue,,CHARSET:ANSI)
                       ENTRY(@n01),AT(91,16,11,10),USE(LOC:SERVANT),FONT(,,COLOR:Red,,CHARSET:ANSI),CENTER
                       BUTTON('&Aceptar'),AT(114,8,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),DISABLE,FLAT
                       BUTTON('&Cancelar'),AT(167,8,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT
                       STRING('SERVICIO ANTERIOR:'),AT(14,17),USE(?String1)
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
  GlobalErrors.SetProcedureName('Transferir_HDLegajo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String4
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  LOC:SERVIC=PSERV
  LOC:LEGAJO=PLEGA
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  Relate:HORADEV.Open                                      ! File HORADEV used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
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
    Relate:Emplea.Close
    Relate:HORADEV.Close
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
    OF ?LOC:SERVANT
      EPD:Servic_sue=LOC:SERVANT
      EPD:Legajo_sue=LOC:LEGAJO
      GET(EMPLEA,EPD:Key1_sue)
      IF ERRORCODE() OR EPD:activo_sue = 'S' THEN
         MESSAGE('SERV-LEGAJO ANTERIOR NO EXISTE O ESTA ACTIVO', ' MENSAJE AL OPERADOR')
         DISABLE(?OK)
         SELECT(?LOC:SERVANT)
      ELSE
         ENABLE(?OK)
      END
    OF ?Ok
      ThisWindow.Update()
      LOC:REGISTROS = 0
      clear(HSD:Record)
      HSD:SERVICIO = LOC:SERVANT
      HSD:LEGAJO   = LOC:LEGAJO
      SET(HSD:PK_HORADEV,HSD:PK_HORADEV)
      LOOP
        NEXT(HORADEV)
        IF ERRORCODE() OR NOT (HSD:SERVICIO = LOC:SERVANT AND HSD:LEGAJO = LOC:LEGAJO) THEN BREAK.
        HSD:SERVICIO = LOC:SERVIC
        PUT(HORADEV)
        IF NOT ERRORCODE() THEN
           LOC:REGISTROS += 1
        END
      END
      
      
      MESSAGE(FORMAT(loc:registros,@n_6) & ' registros transferidos')
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

