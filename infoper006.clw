

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER006.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
ImprimirDetalleComprobantes PROCEDURE 

Progress:Thermometer BYTE                                  !
Loc:total            DECIMAL(7,2)                          !
loc:Total1           DECIMAL(7,2)                          !
Loc:Fecha            DATE                                  !
loc:titulo           STRING(40)                            !
Process:View         VIEW(Empleado_Comprobante)
                       PROJECT(Ecp:Cliente)
                       PROJECT(Ecp:Empleado)
                       PROJECT(Ecp:Importe)
                       PROJECT(Ecp:Legajo)
                       PROJECT(Ecp:Numero)
                       PROJECT(Ecp:Suministro)
                       PROJECT(Ecp:Tipo)
                       PROJECT(Ecp:anio)
                       PROJECT(Ecp:codempresa)
                       PROJECT(Ecp:periodo)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(21,30,173,243),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,,,CHARSET:ANSI),MM
                       HEADER,AT(21,10,173,20),USE(?unnamed:3)
                         STRING('Detalle de Importes a Descontar en Haberes'),AT(2,6,89,6),USE(?unnamed:4),FONT(,12, |
  ,FONT:bold),CENTER
                         STRING(@s30),AT(98,6,66,5),USE(loc:titulo),FONT(,12,,FONT:bold,CHARSET:ANSI)
                         STRING(@d17),AT(147,2),USE(Loc:Fecha),FONT(,,,FONT:bold),TRN
                         STRING('/'),AT(116,2),USE(?String13),TRN
                         STRING(@n04),AT(118,2),USE(glo:Ano),FONT(,,,FONT:bold),TRN
                         STRING('Periodo:'),AT(98,2),USE(?String14),TRN
                         STRING(@n02),AT(111,2),USE(glo:periodo),FONT(,,,FONT:bold),TRN
                         STRING('Fecha:'),AT(132,2),USE(?String18),TRN
                         BOX,AT(0,12,165,6),USE(?PageCount:2),COLOR(COLOR:Black),FILL(00CECED0h)
                         STRING('Legajo'),AT(3,13,10,5),USE(?unnamed:6),FONT(,8,,,CHARSET:ANSI),TRN
                         STRING('Empleado'),AT(29,13,18,5),USE(?unnamed),FONT(,8,,,CHARSET:ANSI),TRN
                         STRING('Tipo 1 - 14 --> Factura   --   Tipo 3 - 16 --> Nota de Crédito'),AT(81,13),USE(?String27), |
  FONT(,8,,,CHARSET:ANSI),TRN
                       END
break1                 BREAK(Ecp:Legajo),USE(?unnamed:9)
                         HEADER,AT(,,,4),USE(?unnamed:11)
                           STRING(@n04),AT(2,0),USE(Ecp:Legajo),RIGHT(1),TRN
                           STRING(@s31),AT(13,0,58,4),USE(Ecp:Empleado),TRN
                           STRING('Cliente'),AT(73,1,10,5),USE(?unnamed:2),FONT(,6,,,CHARSET:ANSI),CENTER,TRN
                           BOX,AT(70,0,95,4),USE(?Box2),COLOR(COLOR:Black)
                           STRING('Suministro'),AT(86,1,18,5),USE(?unnamed:10),FONT(,6,,,CHARSET:ANSI),CENTER,TRN
                           STRING('Tipo'),AT(107,1,7,5),USE(?String22),FONT(,6,,,CHARSET:ANSI),CENTER,TRN
                           STRING('Comprobante'),AT(117,1,20,5),USE(?String23),FONT(,6,,,CHARSET:ANSI),CENTER,TRN
                           STRING('Importe'),AT(147,1,13,5),USE(?unnamed:5),FONT(,6,,,CHARSET:ANSI),CENTER,TRN
                         END
detail2                  DETAIL,AT(,,,2),USE(?unnamed:12)
                           STRING(@n_7),AT(70,-1,14,5),USE(Ecp:Cliente),RIGHT(1),TRN
                           STRING(@n_6),AT(89,-1),USE(Ecp:Suministro),RIGHT(1),TRN
                           STRING(@n3),AT(107,-1,7,5),USE(Ecp:Tipo),RIGHT(1),TRN
                           STRING(@s10),AT(119,-1,20,5),USE(Ecp:Numero),TRN
                           STRING(@n-13`2),AT(141,-1,23,5),USE(Ecp:Importe),RIGHT(1),TRN
                         END
                         FOOTER,AT(,,,3),USE(?unnamed:13)
                           LINE,AT(72,0,93,0),USE(?Line1:2),COLOR(COLOR:Black)
                           STRING('Total:'),AT(133,0),USE(?String24),FONT(,,,FONT:bold),TRN
                           STRING(@n-13`2),AT(142,0),USE(Ecp:Importe,,?Ecp:Importe:2),FONT(,,,FONT:bold),RIGHT,SUM(loc:Total1), |
  RESET(break1),TRN
                         END
                       END
                       FOOTER,AT(20,274,173,5)
                         STRING(@n-13`2),AT(144,0,21,4),USE(Ecp:Importe,,?Ecp:Importe:3),FONT(,,,FONT:bold),RIGHT,SUM(Loc:total), |
  TRN
                         STRING(@pPagina: <<<#p),AT(6,0,19,4),USE(?PageCount),FONT('Arial',8,,FONT:bold),PAGENO
                         STRING('Total:'),AT(134,0),USE(?String26),FONT(,,,FONT:bold),TRN
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
ApplyFilter            PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('ImprimirDetalleComprobantes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:Mensual',Glo:Mensual)                          ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Empleado_Comprobante.Open                         ! File Empleado_Comprobante used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Empleado_Comprobante, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ecp:Legajo)
  ThisReport.AddSortOrder(Ecp:PK_Empleado_Comprobante)
  ThisReport.AddRange(Ecp:codempresa,glo:empresa)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Empleado_Comprobante.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = 100
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Empleado_Comprobante.Close
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
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
      !     message(glo:mensual )
           Loc:Fecha = today()
           if glo:EMPRESA = 1 then loc:titulo = 'SERVICIO ELECTRICO'.
           if glo:EMPRESA = 2 then loc:titulo = 'TELEFONIA-INTERNET'.
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


ThisReport.ApplyFilter PROCEDURE

  CODE
         GET(SELF.Order.RangeList.List,1)
         SELF.Order.RangeList.List.Right = glo:Ano ! Ecp:anio
         GET(SELF.Order.RangeList.List,2)
         SELF.Order.RangeList.List.Right = glo:periodo ! Ecp:periodo
  PARENT.ApplyFilter


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail2)
  RETURN ReturnValue

