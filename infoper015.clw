

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER015.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER016.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Mant_Debitos PROCEDURE 

str                  STRING(100)                           !
loc:inicializar      BYTE                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('  Mantenimiento Lista de Comprobantes'),AT(,,223,103),FONT('Microsoft Sans Serif', |
  12,COLOR:Teal,FONT:bold),GRAY,IMM,MDI
                       PANEL,AT(6,7,102,89),USE(?Panel1)
                       OPTION,AT(10,11,94,36),USE(glo:empresa),BOXED
                         RADIO(' S.Eléctrico'),AT(13,20,44,10),USE(?glo:empresa:Radio1),FONT(,11),VALUE('1')
                         RADIO(' Telefonía'),AT(59,20,42,10),USE(?glo:empresa:Radio2),FONT(,11),VALUE('2')
                         RADIO(' Television'),AT(31,33,42,10),USE(?glo:empresa:Radio3),FONT(,11),VALUE('3')
                       END
                       STRING('Año:'),AT(34,57),USE(?String1)
                       BUTTON(' Confirmar Proceso'),AT(124,16,86,22),USE(?OkButton),DEFAULT
                       SPIN(@n04),AT(54,57,29,10),USE(glo:Ano),CENTER
                       SPIN(@n02),AT(54,74,29,10),USE(glo:periodo),CENTER,RANGE(1,12),STEP(1)
                       BUTTON('Cancelar'),AT(163,78,48,14),USE(?CancelButton),FONT(,8,,,CHARSET:ANSI)
                       CHECK('  Mensuales'),AT(123,63),USE(Glo:Mensual),FONT(,,,FONT:regular,CHARSET:ANSI),VALUE('S', |
  'N')
                       CHECK(' inicializar Lista desde Facturado'),AT(113,45,104,18),USE(loc:inicializar),FONT(,, |
  ,FONT:regular,CHARSET:ANSI),VALUE('1','0')
                       STRING('Periodo:'),AT(24,73),USE(?String2)
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
  GlobalErrors.SetProcedureName('Mant_Debitos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:Empleado_Comprobante.Open                         ! File Empleado_Comprobante used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
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
    Relate:Empleado_Comprobante.Close
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
    OF ?OkButton
      if not inrange(glo:empresa,1,3) then cycle.
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
        if loc:inicializar then
          CASE MESSAGE('Confirma la inicialización de la lista ?','Listado FACTURAS a Descontar',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
          OF BUTTON:Yes
          setcursor(cursor:wait)
          str = 'CALL BUSCAR_DEBITOS(' & clip(glo:Ano) & ',' & clip(glo:periodo) & ',' & format(glo:empresa,@n1) & ',' & '''' & glo:mensual & '''' & ')'
          EMPLEADO_COMPROBANTE{PROP:SQL} = clip(Str)
                             
          iF ERRORCODE() then  message(fileerrorcode()& '|' & fileerror() & '|' & errorcode()).
          setcursor(cursor:arrow)
          END
        end
        Mant_Debitos_Browse
        post(event:closeWindow)
    OF ?CancelButton
      ThisWindow.Update()
           post(event:CloseWindow)
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
    OF EVENT:OpenWindow
      glo:mensual = 'S'
      glo:Ano = deformat(year(today()),@n04)
      IF GLO:PERIODO = '' THEN glo:periodo = deformat(month(today()),@n02).
      display
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

