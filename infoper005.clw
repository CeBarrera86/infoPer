

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER005.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER019.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
ImpDetalle PROCEDURE 

str                  STRING(100)                           !
loc:publicar         BYTE                                  !
loc:liquidar         BYTE                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('  Impresión de  Lista Comprobantes a Descontar'),AT(,,219,93),FONT('MS Sans Serif', |
  12,COLOR:Purple,FONT:bold),GRAY
                       PANEL,AT(6,7,207,50),USE(?Panel1)
                       OPTION,AT(15,8,89,27),USE(glo:empresa),BOXED
                         RADIO(' S.Eléctrico'),AT(20,16,41,6),USE(?glo:empresa:Radio1),FONT(,10,,,CHARSET:ANSI),VALUE('1')
                         RADIO(' Telefonía'),AT(64,16,38,7),USE(?glo:empresa:Radio2),FONT(,10,,,CHARSET:ANSI),VALUE('2')
                         RADIO(' Televisión'),AT(38,26,38,7),USE(?glo:empresa:Radio3),FONT(,10,,,CHARSET:ANSI),VALUE('3')
                       END
                       STRING('Año:'),AT(11,40),USE(?String1)
                       BUTTON('OK'),AT(7,67,35,17),USE(?OkButton),DEFAULT
                       SPIN(@n04),AT(31,40,26,10),USE(glo:Ano),FONT(,12,,,CHARSET:ANSI),CENTER,RANGE(2000,3000),STEP(1)
                       BUTTON('Cancelar'),AT(51,67,36,17),USE(?CancelButton),FONT(,10,,,CHARSET:ANSI)
                       STRING('generados previamente en la opción de'),AT(98,71,115,7),USE(?String3:2),FONT(,8,COLOR:Blue, |
  ,CHARSET:ANSI),SCROLL
                       STRING('Mantenimiento de Lista de Comprobantes'),AT(98,80,115,7),USE(?String3:3),FONT(,8,COLOR:Blue, |
  ,CHARSET:ANSI),SCROLL
                       STRING('Periodo:'),AT(63,40),USE(?String2)
                       SPIN(@n02),AT(93,40,16,10),USE(glo:periodo),FONT(,12,,,CHARSET:ANSI),RANGE(1,12),STEP(1)
                       GROUP,AT(118,9,92,26),USE(?Group1),BOXED
                       END
                       STRING('Los datos aqui procesados son los que han sido'),AT(98,63,115,7),USE(?String3),FONT(, |
  8,COLOR:Blue,,CHARSET:ANSI),SCROLL
                       CHECK(' Exportar Datos Recaudacion'),AT(123,16,84,7),USE(loc:publicar),FONT(,8,,,CHARSET:ANSI), |
  VALUE('1','0')
                       PROMPT('Fecha Rendición:'),AT(131,25),USE(?glo:fecha:Prompt),FONT(,8,,,CHARSET:ANSI)
                       ENTRY(@d17b),AT(173,24,34,8),USE(glo:fecha),FONT(,10,,,CHARSET:ANSI),CENTER
                       CHECK(' Exportar Datos para Liq.Sueldos'),AT(123,40,86,7),USE(loc:liquidar),FONT(,8,,,CHARSET:ANSI), |
  VALUE('1','0')
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
  GlobalErrors.SetProcedureName('ImpDetalle')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
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
    OF ?OkButton
      ThisWindow.Update()
        if glo:empresa <> 0 and not (loc:publicar and glo:fecha < date(1,1,2000)) then
          if loc:publicar then
             if glo:empresa = 1 then
                glo:nom_txdeb='\\gea_pico\datacorpico\rec_eps\dsueldos_ELE.txt'
             elsif glo:empresa = 2 then
                glo:nom_txdeb='\\gea_pico\datacorpico\rec_eps\dsueldos_TEL.txt'
             else
                glo:nom_txdeb='\\gea_pico\datacorpico\rec_eps\dsueldos_STV.txt'
             end
             ArmarDatosRecaudacion
             message('Datos para Recaudación han sido exportados.', ' PROCESO FINALIZADO')
          end
          if loc:liquidar then
             ArmarDatosLiquidacion
             message('Datos para Liq.deSueldos han sido exportados', ' PROCESO FINALIZADO')
          end
          ImprimirDetalleComprobantes
       !   post(event:closeWindow)
        end
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

