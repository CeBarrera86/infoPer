

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER020.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER021.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
TSuministro PROCEDURE (filtrar)

Progress:Thermometer BYTE                                  !
LOC:TITULO           STRING(50)                            !
Process:View         VIEW(EMPLEADOS)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1052,6000,9708),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(1000,479,6000,542),USE(?unnamed:8)
                         STRING(@s50),AT(0,20,6000,220),USE(LOC:TITULO),FONT(,12,,FONT:bold),CENTER
                         BOX,AT(0,281,6000,229),USE(?unnamed:4),COLOR(COLOR:Black),FILL(COLOR:Silver)
                         STRING('Legajo'),AT(52,313,500,167),USE(?unnamed),TRN
                         STRING('Nombre'),AT(1552,313,552,167),USE(?unnamed:2),TRN
                         STRING('Cliente'),AT(2865,313,521,167),USE(?unnamed:3),TRN
                         STRING('Suministro'),AT(3385,313,750,167),USE(?unnamed:5),TRN
                         STRING('Titular del Servicio'),AT(4406,313,1094,167),USE(?String12),TRN
                       END
detail                 DETAIL,AT(,,6000,167),USE(?detail),FONT(,9,,,CHARSET:ANSI)
                         STRING(@n04b),AT(52,-21,385,167),USE(TUM:Col01),FONT(,9,,,CHARSET:ANSI),RIGHT(1)
                         STRING(@n_7b),AT(2792,-21,656,167),USE(TUM:Col03),FONT('Arial',9),RIGHT(1)
                         STRING(@s31),AT(521,-21,2323,167),USE(TUM:Col02),FONT(,9,,,CHARSET:ANSI)
                         STRING(@n_03B),AT(3479,-21,354,167),USE(TUM:Col04),FONT(,9,,,CHARSET:ANSI),RIGHT(1)
                         STRING(@s25),AT(4083,-21,1854,167),USE(TUM:Col05),FONT(,9,,,CHARSET:ANSI)
                       END
                       FOOTER,AT(979,10792,6000,219),USE(?unnamed:7)
                         STRING(@pPagina <<<#p),AT(5250,31,698,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ReportMemoryRecords     BYTE(0)                            ! Used to do the first Next call
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Next                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

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
  GlobalErrors.SetProcedureName('TSuministro')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  !    message(str)
  
      setcursor(cursor:wait)
      TMPUsosMultiples{PROP:SQL} = 'CALL Interfaz..CORPICO_TARIFAS_EMPLEADOS(' & format(filtrar,@n1) & ')'
      setcursor(cursor:arrow)
  
      iF ERRORCODE()
           message(fileerrorcode()& '|' & fileerror() & '|' & errorcode())
           ThisWindow.kill
      END
  
      IF FILTRAR = 0 THEN LOC:TITULO='TARIFAS EMPLEADOS'.
      IF FILTRAR = 1 THEN LOC:TITULO='TARIFAS EMPLEADOS SIN DEBITO ACTIVO'.
  
  
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ThisReport.Init(Process:View, Relate:EMPLEADOS, ?Progress:PctText, Progress:Thermometer, 0)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
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
    Relate:EMPLEADOS.Close
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    IF ReportMemoryRecords=0 THEN
       ReportMemoryRecords+=1
       RETURN Level:Benign
    ELSE
       SELF.Response = RequestCompleted
       POST(EVENT:CloseWindow)
       RETURN Level:Notify
    END
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      loop
          next(TMPUsosMultiples)
          if errorcode() then break.
          print(rpt:detail)
      end
  ReturnValue = PARENT.TakeCloseEvent()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
   CLEAR(TUM:Record)
  PRINT(RPT:detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the EMPLEADOS file
!!! </summary>
ABMEmpleadosLicencia PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:legajo           STRING(20)                            !
BRW1::View:Browse    VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_LEGAJO)
                       PROJECT(EPL:EMP_NOMBRE)
                       PROJECT(EPL:EMP_DIRECCION)
                       PROJECT(EPL:EMP_FECANTIG)
                       PROJECT(EPL:EMP_CONVENIO)
                       PROJECT(EPL:EMP_SECTOR)
                       PROJECT(EPL:EMP_VACACION)
                       PROJECT(EPL:EMP_PROVISION)
                       PROJECT(EPL:EMP_LIQUIDACION)
                       PROJECT(EPL:EMP_CCOSTO)
                       PROJECT(EPL:EMP_LIC_CON_GOCE)
                       PROJECT(EPL:EMP_HORAEXTRA)
                       PROJECT(EPL:EMP_COD_REEMBOLSO)
                       PROJECT(EPL:EMP_OBSERVACION)
                       PROJECT(EPL:EMP_ACTIVO)
                       JOIN(CON:PK_CONVENIO,EPL:EMP_CONVENIO)
                         PROJECT(CON:CONV_CONVENIO)
                       END
                       JOIN(SEC:PK_SECTOR,EPL:EMP_SECTOR)
                         PROJECT(SEC:SEC_SECTOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_DIRECCION      LIKE(EPL:EMP_DIRECCION)        !List box control field - type derived from field
EPL:EMP_FECANTIG       LIKE(EPL:EMP_FECANTIG)         !List box control field - type derived from field
EPL:EMP_CONVENIO       LIKE(EPL:EMP_CONVENIO)         !List box control field - type derived from field
CON:CONV_CONVENIO      LIKE(CON:CONV_CONVENIO)        !List box control field - type derived from field
SEC:SEC_SECTOR         LIKE(SEC:SEC_SECTOR)           !List box control field - type derived from field
EPL:EMP_SECTOR         LIKE(EPL:EMP_SECTOR)           !List box control field - type derived from field
EPL:EMP_VACACION       LIKE(EPL:EMP_VACACION)         !List box control field - type derived from field
EPL:EMP_PROVISION      LIKE(EPL:EMP_PROVISION)        !List box control field - type derived from field
EPL:EMP_LIQUIDACION    LIKE(EPL:EMP_LIQUIDACION)      !List box control field - type derived from field
EPL:EMP_CCOSTO         LIKE(EPL:EMP_CCOSTO)           !List box control field - type derived from field
EPL:EMP_LIC_CON_GOCE   LIKE(EPL:EMP_LIC_CON_GOCE)     !List box control field - type derived from field
EPL:EMP_HORAEXTRA      LIKE(EPL:EMP_HORAEXTRA)        !List box control field - type derived from field
EPL:EMP_COD_REEMBOLSO  LIKE(EPL:EMP_COD_REEMBOLSO)    !List box control field - type derived from field
EPL:EMP_OBSERVACION    LIKE(EPL:EMP_OBSERVACION)      !List box control field - type derived from field
EPL:EMP_ACTIVO         LIKE(EPL:EMP_ACTIVO)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Empleados - Licencias'),AT(,,637,351),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ABMEmpleadosLicencia'), |
  SYSTEM
                       LIST,AT(14,30,611,310),USE(?Browse:1),FONT(,10,,FONT:bold),HVSCROLL,FORMAT('37C|M~Legaj' & |
  'o~@n_7@179L(4)|M~Empleado~C(2)@s31@141L(4)|M~Dirección~C(2)@s25@60C(2)|M~Antiguedad~' & |
  'C(0)@D06@0R(4)|M~Convenio~C(0)@n-7@84L(4)|M~Convenio~C(0)@s21@150L(2)|M~Sector~C(0)@' & |
  's50@0R(2)|M~Sector~C(0)@n-7@50R(2)|M~9930~R(12)@n_12.2@50R(2)|M~9931~R(12)@n_25.2@55' & |
  'C(2)|M~Liquidación~C(0)@s9@32C(2)|M~C.C~C(1)@n_7@25C(2)|M~4800~C(0)@s1@45C|M~HORAEXT' & |
  '~@s3@32C|M~COD REEMBOLSO~@n_7@200L|M~OBSERVACION~C(0)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he EMPLEADOS file')
                       BUTTON('&View'),AT(152,259,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       SHEET,AT(5,4,631,346),USE(?CurrentTab),FONT(,10,,FONT:bold)
                         TAB('Buscar por Apellido:'),USE(?Tab:2)
                           BUTTON('&Select'),AT(283,259),USE(?Select),HIDE
                         END
                       END
                       STRING(@s31),AT(152,4,181),USE(EPL:EMP_NOMBRE),FONT(,10,COLOR:Red,FONT:bold)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
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
  GlobalErrors.SetProcedureName('ABMEmpleadosLicencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON:CONV_CONVENIO',CON:CONV_CONVENIO)              ! Added by: BrowseBox(ABC)
  BIND('SEC:SEC_SECTOR',SEC:SEC_SECTOR)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:EMPLEADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?EPL:EMP_NOMBRE,EPL:EMP_NOMBRE,,BRW1) ! Initialize the browse locator using ?EPL:EMP_NOMBRE using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.SetFilter('(EPL:EMP_ACTIVO = ''S'')')               ! Apply filter expression to browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DIRECCION,BRW1.Q.EPL:EMP_DIRECCION) ! Field EPL:EMP_DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_FECANTIG,BRW1.Q.EPL:EMP_FECANTIG)  ! Field EPL:EMP_FECANTIG is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_CONVENIO,BRW1.Q.EPL:EMP_CONVENIO)  ! Field EPL:EMP_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(CON:CONV_CONVENIO,BRW1.Q.CON:CONV_CONVENIO) ! Field CON:CONV_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SEC:SEC_SECTOR,BRW1.Q.SEC:SEC_SECTOR)      ! Field SEC:SEC_SECTOR is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_SECTOR,BRW1.Q.EPL:EMP_SECTOR)      ! Field EPL:EMP_SECTOR is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_VACACION,BRW1.Q.EPL:EMP_VACACION)  ! Field EPL:EMP_VACACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_PROVISION,BRW1.Q.EPL:EMP_PROVISION) ! Field EPL:EMP_PROVISION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LIQUIDACION,BRW1.Q.EPL:EMP_LIQUIDACION) ! Field EPL:EMP_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_CCOSTO,BRW1.Q.EPL:EMP_CCOSTO)      ! Field EPL:EMP_CCOSTO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LIC_CON_GOCE,BRW1.Q.EPL:EMP_LIC_CON_GOCE) ! Field EPL:EMP_LIC_CON_GOCE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_HORAEXTRA,BRW1.Q.EPL:EMP_HORAEXTRA) ! Field EPL:EMP_HORAEXTRA is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_COD_REEMBOLSO,BRW1.Q.EPL:EMP_COD_REEMBOLSO) ! Field EPL:EMP_COD_REEMBOLSO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_OBSERVACION,BRW1.Q.EPL:EMP_OBSERVACION) ! Field EPL:EMP_OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_ACTIVO,BRW1.Q.EPL:EMP_ACTIVO)      ! Field EPL:EMP_ACTIVO is a hot field or requires assignment from browse
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
    Relate:EMPLEADOS.Close
  END
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form EMPLEADOS
!!! </summary>
UpdateEMPLEADOS PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::EPL:Record  LIKE(EPL:RECORD),THREAD
QuickWindow          WINDOW('Empleado - Licencia'),AT(,,276,166),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('UpdateEMPLEADOS'),SYSTEM
                       SHEET,AT(4,4,270,136),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           PROMPT('Legajo:'),AT(15,33),USE(?EPL:EMP_LEGAJO:Prompt),FONT(,10),TRN
                           ENTRY(@n_7),AT(85,33,40,12),USE(EPL:EMP_LEGAJO),FONT(,10),RIGHT(1),FLAT
                           PROMPT('Empleado:'),AT(15,50),USE(?EPL:EMP_NOMBRE:Prompt),FONT(,10),TRN
                           ENTRY(@s31),AT(85,50,175,12),USE(EPL:EMP_NOMBRE),FONT(,10),FLAT
                           PROMPT('Dirección:'),AT(15,66),USE(?EPL:EMP_DIRECCION:Prompt),FONT(,10),TRN
                           ENTRY(@s25),AT(85,66,175,12),USE(EPL:EMP_DIRECCION),FONT(,10),FLAT
                           PROMPT('Antiguedad:'),AT(17,82),USE(?EPL:EMP_FECANTIG:Prompt),FONT(,10),TRN
                           ENTRY(@D06),AT(85,82,52,12),USE(EPL:EMP_FECANTIG),FONT(,10),FLAT
                           PROMPT('Convenio:'),AT(17,98),USE(?EPL:EMP_CONVENIO:Prompt),FONT(,10),TRN
                           ENTRY(@n-7),AT(85,98,40,12),USE(EPL:EMP_CONVENIO),FONT(,10),RIGHT(1),FLAT
                           PROMPT('Sector:'),AT(17,115),USE(?EPL:EMP_SECTOR:Prompt),FONT(,10),TRN
                           ENTRY(@n-7),AT(85,115,40,12),USE(EPL:EMP_SECTOR),FONT(,10),RIGHT(1),FLAT
                         END
                       END
                       BUTTON('&Aceptar'),AT(157,146,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(215,146,53,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdateEMPLEADOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPL:EMP_LEGAJO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(EPL:Record,History::EPL:Record)
  SELF.AddHistoryField(?EPL:EMP_LEGAJO,1)
  SELF.AddHistoryField(?EPL:EMP_NOMBRE,2)
  SELF.AddHistoryField(?EPL:EMP_DIRECCION,3)
  SELF.AddHistoryField(?EPL:EMP_FECANTIG,13)
  SELF.AddHistoryField(?EPL:EMP_CONVENIO,15)
  SELF.AddHistoryField(?EPL:EMP_SECTOR,16)
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
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?EPL:EMP_LEGAJO{PROP:ReadOnly} = True
    ?EPL:EMP_NOMBRE{PROP:ReadOnly} = True
    ?EPL:EMP_DIRECCION{PROP:ReadOnly} = True
    ?EPL:EMP_FECANTIG{PROP:ReadOnly} = True
    ?EPL:EMP_CONVENIO{PROP:ReadOnly} = True
    ?EPL:EMP_SECTOR{PROP:ReadOnly} = True
  END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
AltasMasivasLicencias PROCEDURE 

Loc:anio             LONG                                  !
Loc:cta              LONG                                  !
Loc:dias             LONG                                  !
Loc:antiguedad       LONG                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Alta Masiva - Licencias'),AT(,,176,118),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('AltasMasivasLicencias'), |
  SYSTEM
                       GROUP,AT(7,7,162,78),USE(?GROUP1),BOXED
                         STRING('Año'),AT(16,16),USE(?STRING1),FONT(,10,,FONT:bold)
                         ENTRY(@n04),AT(16,31,60),USE(Loc:anio),FONT(,12,COLOR:Red,FONT:bold),CENTER,FLAT
                         ENTRY(@s20),AT(16,56,140),USE(CTA:CTA_DETALLE),FONT(,12,COLOR:Red,FONT:bold),DISABLE,FLAT
                         PROMPT('Cta. Unibiz'),AT(84,16),USE(?CTA:CTA_ID_UNIBIZ:Prompt),FONT(,10,,FONT:bold)
                         ENTRY(@n_7B),AT(84,31,52,16),USE(CTA:CTA_ID_UNIBIZ),FONT(,10,COLOR:Red,FONT:bold),DISABLE, |
  FLAT
                         BUTTON,AT(142,31,15,15),USE(?CallLookup)
                         ENTRY(@n-14),AT(8,81,60,10),USE(LIC:LIC_CTA),RIGHT(1),HIDE
                       END
                       BUTTON('&Generar'),AT(20,95,,14),USE(?Ok),FONT(,10),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancelar'),AT(92,95,,14),USE(?Cancel),FONT(,10),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
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
  GlobalErrors.SetProcedureName('AltasMasivasLicencias')
  Loc:anio = YEAR(TODAY())
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING1
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
  Relate:CTA_CONTABLE.Open                                 ! File CTA_CONTABLE used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:PARAMETRO_LICENCIA.Open                           ! File PARAMETRO_LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
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
    Relate:CTA_CONTABLE.Close
    Relate:LICENCIA.Close
    Relate:PARAMETRO_LICENCIA.Close
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
    LicenciaCtaContable
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
    OF ?Ok
      IF  CTA:CTA_ID_UNIBIZ = 0 THEN
      	MESSAGE('ELIJA LA CUENTA DE LA LICENCIA, NO PUEDE SER VACÍA', 'Cuenta vacía',ICON:Asterisk,BUTTON:OK,1)
      	SELECT(?CTA:CTA_ID_UNIBIZ)
      	CYCLE.
      CLEAR(LIC:Record)
      LIC:LIC_ANIO = Loc:anio
      SET(LIC:PK_LICENCIA,LIC:PK_LICENCIA)
      LOOP 
      	!IF Access:LICENCIA.Next() <> Level:Benign OR LIC:LIC_ANIO <> Loc:anio THEN BREAK.
          next(LICENCIA)
          if errorcode() then break.
      	IF LIC:LIC_ANIO = Loc:anio THEN
      		MESSAGE('ERROR: HAY LICENCIAS GENERADAS PARA ESE AÑO')
      		SELECT(?Loc:anio)
      		CYCLE
      	END	
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CTA:CTA_ID_UNIBIZ
      IF CTA:CTA_ID_UNIBIZ OR ?CTA:CTA_ID_UNIBIZ{PROP:Req}
        CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
        IF Access:CTA_CONTABLE.TryFetch(CTA:PK_CTA_CONTABLE)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
            Loc:cta = CTA:CTA_ID_UNIBIZ
          ELSE
            CLEAR(Loc:cta)
            SELECT(?CTA:CTA_ID_UNIBIZ)
            CYCLE
          END
        ELSE
          Loc:cta = CTA:CTA_ID_UNIBIZ
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
        Loc:cta = CTA:CTA_ID_UNIBIZ
      END
      ThisWindow.Reset(1)
    OF ?Ok
      ThisWindow.Update()
      	!CALCULO DE LICENCIAS AUTOMATICAS
      	OPEN(EMPLEADOS)
      	IF ERRORCODE() THEN
      		MESSAGE('ATENCION: FALLO AL ABRIR LA TABLA ')
      		MESSAGE(FILEERROR()) 
      	ELSE
      		i# = 0
      		CLEAR(EPL:RECORD)
      		SET(EPL:PK_EMPLEADOS,EPL:PK_EMPLEADOS)
      		LOOP !RECORRE LA TABLA EMPLEADOS
      			NEXT(EMPLEADOS)
      			IF ERRORCODE() THEN BREAK.
      			!EMPLEADOS ACTIVOS Y QUE NO SEAN PASANTES
      			IF EPL:EMP_ACTIVO = 'S' AND EPL:EMP_CONVENIO <> 12 AND YEAR(EPL:EMP_FECANTIG) <= Loc:anio AND EPL:EMP_LIC_CON_GOCE = 'S' THEN 
      				CLEAR(PRML:Record)
      				PRML:PRML_CONVENIO = EPL:EMP_CONVENIO			
      				Loc:antiguedad = YEAR(TODAY()) - YEAR(EPL:EMP_FECANTIG)
      				SET(PRML:PK_PARAMETRO_LICENCIA,PRML:PK_PARAMETRO_LICENCIA)
      				!SEGUN EL CONVENIO Y LOS AÑOS DE ANTIGUEDAD CALCULA LOS DIAS DE LICENCIA
      				LOOP 
      					!IF ACCESS:PARAMETRO_LICENCIA.Next() <> Level:Benign OR PRML:PRML_CONVENIO <> EPL:EMP_CONVENIO THEN BREAK.
      					next(PARAMETRO_LICENCIA)
      					if errorcode() then break.
      					IF 	(Loc:antiguedad > PRML:PRML_ANTD OR Loc:antiguedad = PRML:PRML_ANTD) AND (Loc:antiguedad < PRML:PRML_ANTH OR Loc:antiguedad = PRML:PRML_ANTH) AND PRML:PRML_CONVENIO = EPL:EMP_CONVENIO THEN
      						!MESSAGE('EEMPLEADO ' & EPL:EMP_NOMBRE & ' ANTIGUEDAD ' & Loc:antiguedad & ' INGRESO ' & EPL:EMP_FECANTIG & ' DIAS ' & PRML:PRML_DIAS)
      						DIAS# = PRML:PRML_DIAS		
      						PAGAN# = PRML:PRML_PAGAN
      					END	!LICENCIA
      				END	! PARAMETRO_LICENCIA
      				!PREPARA LOS DATOS PARA GRABAR EN LA TABLA LICENCIAS
      				CLEAR(LIC:RECORD)
      				LIC:LIC_ANIO = Loc:anio
      				SET(LIC:PK_LICENCIA,LIC:PK_LICENCIA)
      				LIC:LIC_LEGAJO=EPL:EMP_LEGAJO
      				LIC:LIC_DIAS = DIAS#
      				LIC:LIC_COBRO = 'N'
      				LIC:LIC_DEPOSITADA = 'N'
      				LIC:LIC_FECHA_UPDATE_DATE = TODAY()
      				LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
      				LIC:LIC_PAGAN = PAGAN#
      				LIC:LIC_CTA = Loc:cta
      				LIC:LIC_USER = clip(Glo:Usuario2)
      				ADD(LICENCIA)
      				IF ERRORCODE() THEN
      					MESSAGE('ERROR: LICENCIA DUPLICADA ' & Loc:anio & ' Nº LEGAJO: ' & EPL:EMP_LEGAJO  , 'Error en Licencias',ICON:Exclamation,BUTTON:OK,1)
      					BREAK
      				END
      				i# = i# + 1
      			END ! EMPLEADO ACTIVO	
      		END ! EMPLEADOS
      	END !IF	
      	MESSAGE('CANTIDAD DE LICENCIAS GENERADAS: ' & i#, 'Licencias Generadas',ICON:Asterisk,BUTTON:OK,1)
      	CLOSE(EMPLEADOS)
       	CLOSE(PARAMETRO_LICENCIA)
          CLOSE(LICENCIA)
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
ABMLicencias PROCEDURE 

Loc:convenio         SHORT                                 !
SECTORS              STRING(50)                            !
CONVENIOS            STRING(20)                            !
Loc:anio             LONG                                  !
Habiles              SHORT                                 !
Corridos             SHORT                                 !
FechaInicial         DATE                                  !
FechaFinal           DATE                                  !
Loc:UltimoDia        DATE                                  !
Loc:ingreso          DATE                                  !
Loc:LicenciaActual   STRING('N')                           !
Loc:Mes              SHORT                                 !
Loc:antiguedad       DECIMAL(7,2)                          !
Loc:dias             SHORT                                 !
Loc:dias_pagan       SHORT                                 !
BRW4::View:Browse    VIEW(LICENCIA)
                       PROJECT(LIC:LIC_LEGAJO)
                       PROJECT(LIC:LIC_ANIO)
                       PROJECT(LIC:LIC_DIAS)
                       PROJECT(LIC:LIC_PAGAN)
                       PROJECT(LIC:LIC_COBRO)
                       PROJECT(LIC:LIC_DEPOSITADA)
                       PROJECT(LIC:LIC_DEPOSITO_DATE)
                       PROJECT(LIC:LIC_CTA)
                       PROJECT(LIC:LIC_OBSERVACION)
                       PROJECT(LIC:LIC_FECHA_UPDATE_DATE)
                       PROJECT(LIC:LIC_FECHA_UPDATE_TIME)
                       PROJECT(LIC:LIC_USER)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !List box control field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !List box control field - type derived from field
LIC:LIC_DIAS           LIKE(LIC:LIC_DIAS)             !List box control field - type derived from field
LIC:LIC_PAGAN          LIKE(LIC:LIC_PAGAN)            !List box control field - type derived from field
LIC:LIC_COBRO          LIKE(LIC:LIC_COBRO)            !List box control field - type derived from field
LIC:LIC_DEPOSITADA     LIKE(LIC:LIC_DEPOSITADA)       !List box control field - type derived from field
LIC:LIC_DEPOSITO_DATE  LIKE(LIC:LIC_DEPOSITO_DATE)    !List box control field - type derived from field
LIC:LIC_CTA            LIKE(LIC:LIC_CTA)              !List box control field - type derived from field
LIC:LIC_OBSERVACION    LIKE(LIC:LIC_OBSERVACION)      !List box control field - type derived from field
LIC:LIC_FECHA_UPDATE_DATE LIKE(LIC:LIC_FECHA_UPDATE_DATE) !List box control field - type derived from field
LIC:LIC_FECHA_UPDATE_TIME LIKE(LIC:LIC_FECHA_UPDATE_TIME) !List box control field - type derived from field
LIC:LIC_USER           LIKE(LIC:LIC_USER)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('ABM - Licencias'),AT(,,333,365),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ABM_Licencias'),SYSTEM
                       GROUP,AT(7,6,317,175),USE(?GROUP1),FONT(,10,,FONT:bold),BOXED
                         ENTRY(@n_7B),AT(191,18,60,30),USE(EPL:EMP_LEGAJO),FONT(,12,COLOR:Red,FONT:bold),CENTER(1), |
  FLAT
                         BUTTON,AT(257,18,45,32),USE(?CallLookup:2),FONT(,,,FONT:regular),ICON('clients.ico'),LAYOUT(0)
                         PROMPT('Ingrese el Número de Legajo:'),AT(27,30),USE(?EPL:EMP_LEGAJO:Prompt),FONT(,12,,FONT:bold)
                         PROMPT('Nombre:'),AT(27,64),USE(?EPL:EMP_NOMBRE:Prompt),FONT(,10,,FONT:bold)
                         ENTRY(@s31),AT(27,80,203,12),USE(EPL:EMP_NOMBRE),FONT(,10,,FONT:bold),FLAT,READONLY,SKIP
                         PROMPT('Antiguedad:'),AT(243,64),USE(?EPL:EMP_FECANTIG:Prompt),FONT(,10,,FONT:bold)
                         ENTRY(@D06b),AT(243,80,60,12),USE(EPL:EMP_FECANTIG),FONT(,10,,FONT:bold),CENTER,FLAT,READONLY, |
  SKIP
                         ENTRY(@s25),AT(29,114,140,12),USE(EPL:EMP_DIRECCION),FONT(,10,,FONT:bold),FLAT,READONLY,SKIP
                         PROMPT('Dirección:'),AT(29,98),USE(?EPL:EMP_DIRECCION:Prompt),FONT(,10,,FONT:bold)
                         PROMPT('Convenio:'),AT(183,98),USE(?EPL:EMP_CONVENIO:Prompt),FONT(,10,,FONT:bold)
                         ENTRY(@s21),AT(183,114,120,12),USE(CON:CONV_CONVENIO),FONT(,10,,FONT:bold),FLAT,READONLY,SKIP
                         PROMPT('Sector:'),AT(29,136),USE(?EPL:EMP_SECTOR:Prompt),FONT(,10,,FONT:bold)
                         ENTRY(@s50),AT(29,152,275,12),USE(SEC:SEC_SECTOR),FONT(,10,,FONT:bold),FLAT,MASK,READONLY, |
  SKIP
                       END
                       GROUP('LICENCIAS'),AT(7,188,317,172),USE(?GROUP2),FONT(,10,COLOR:Black,FONT:bold),BOXED
                         LIST,AT(16,205,295,120),USE(?List),FONT(,,COLOR:Black),HVSCROLL,FLAT,FORMAT('0L(2)|M~LI' & |
  'C LEGAJO~L(0)@n-7@35C|M~AÑO~@n_7@25C(2)|M~DÍAS~C(0)@n3@36C(2)|M~PAGAN~C(0)@n3@36C(2)' & |
  '|M~COBRO~C(0)@s1@0C(2)|M~DEPOSITADA~C(0)@s1@53C(2)|M~DEPOSITO~C(0)@d17@30C(2)|M~CTA~' & |
  'C(1)100L(2)|M~OBSERVACION~C(0)@s100@0C(2)|M~LIC FECHA UPDATE DATE~C(0)@d17@0C(2)|M~L' & |
  'IC FECHA UPDATE TIME~C(0)@t7@0C(2)|M~LIC USER~C(0)@s20@'),FROM(Queue:Browse),IMM,SCROLL, |
  SKIP
                         BUTTON('&Agregar'),AT(63,332,80,20),USE(?Insert),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('WAINSERT.ICO')
                         BUTTON('&Modificar'),AT(147,332,80,20),USE(?Change),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('WACHANGE.ICO')
                         BUTTON('&Borrar'),AT(231,332,80,20),USE(?Delete),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('WADELETE.ICO')
                       END
                       ENTRY(@n-7),AT(8,336,60,10),USE(EPL:EMP_CONVENIO),RIGHT(1),HIDE
                       ENTRY(@n-7),AT(9,351,60,10),USE(EPL:EMP_SECTOR),FONT(,10,,FONT:bold),RIGHT(1),FLAT,HIDE
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4::EIPManager     CLASS(BrowseEIPManager)               ! Browse EIP Manager for Browse using ?List
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

EditInPlace::LIC:LIC_LEGAJO EditEntryClass                 ! Edit-in-place class for field LIC:LIC_LEGAJO
EditInPlace::LIC:LIC_ANIO CLASS(EditEntryClass)            ! Edit-in-place class for field LIC:LIC_ANIO
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED
                     END

EditInPlace::LIC:LIC_DIAS CLASS(EditEntryClass)            ! Edit-in-place class for field LIC:LIC_DIAS
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED
                     END

EditInPlace::LIC:LIC_PAGAN CLASS(EditEntryClass)           ! Edit-in-place class for field LIC:LIC_PAGAN
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_DEPOSITADA CLASS(EditCheckClass)      ! Edit-in-place class for field LIC:LIC_DEPOSITADA
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_DEPOSITO_DATE EditEntryClass          ! Edit-in-place class for field LIC:LIC_DEPOSITO_DATE
EditInPlace::LIC:LIC_CTA CLASS(EditEntryClass)             ! Edit-in-place class for field LIC:LIC_CTA
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_OBSERVACION EditEntryClass            ! Edit-in-place class for field LIC:LIC_OBSERVACION
EditInPlace::LIC:LIC_FECHA_UPDATE_DATE EditEntryClass      ! Edit-in-place class for field LIC:LIC_FECHA_UPDATE_DATE
EditInPlace::LIC:LIC_FECHA_UPDATE_TIME EditEntryClass      ! Edit-in-place class for field LIC:LIC_FECHA_UPDATE_TIME
EditInPlace::LIC:LIC_USER EditEntryClass                   ! Edit-in-place class for field LIC:LIC_USER

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
LICENCIA_ACTUAL     ROUTINE
!EVALUA SI LA LICENCIA ES DE ESTE AÑO	
	LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
	LIC:LIC_ANIO = YEAR(TODAY())	
	GET(LICENCIA,LIC:PK_LICENCIA)
	IF NOT ERRORCODE()
		Loc:LicenciaActual = 'S'
	ELSE
		Loc:LicenciaActual = 'N'
	END	
	
DIAS_HABILES        ROUTINE
!CALCULA LA CANTIDAD DE DIAS HABILES CONDISERANDO Y DESCONTANDO LOS FERIADOS	
!CALCULA LOS DIAS CORRIDOS	
	Habiles = 0
	!FechaFinal= DATE(12,31,YEAR(TODAY())) 
	!FechaInicial = DATE(MONTH(EPL:EMP_FECANTIG),DAY(EPL:EMP_FECANTIG),YEAR(EPL:EMP_FECANTIG))
	!loop dia# = FechaInicial to FechaFinal
	loop dia# = Loc:ingreso to Loc:UltimoDia
	 if (Dia# % 7) = 0 then cycle. ! porque es domingo
	 if (Dia# % 7) = 6 then cycle. ! porque es sabado
	 !
	 ! busco si es feriado
	 !
	 clear(FERIADOS:record)
	 FER:DIAFERIADO_DATE = dia#
	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
	 !
	 Habiles += 1
	end!loop
	Corridos = Loc:UltimoDia - Loc:ingreso
DIAS_LICENCIA_ACTUAL        ROUTINE
!CALCULA LA CANTIDAD DE DIAS DE LA LICENCIA ACTUAL	
	!EMPLEADO ACTIVO Y NO PASANTE
	IF EPL:EMP_ACTIVO = 'S' AND EPL:EMP_CONVENIO <> 12 THEN   
		Loc:UltimoDia = DATE(12,31,LIC:LIC_ANIO)
		Loc:ingreso = DATE(MONTH(EPL:EMP_FECANTIG),DAY(EPL:EMP_FECANTIG),YEAR(EPL:EMP_FECANTIG))
		Loc:Mes = (Loc:UltimoDia - Loc:ingreso)/30
		Loc:antiguedad = Loc:Mes/12
		!LE CORRESPONDE LA LICENCIA DE TODO EL AÑO
		IF Loc:antiguedad >= 0.5
			!PARAMETRO DE LICENCIA NOS INDICA LA CANTIDAD DE DIAS QUE LE CORRESPONDE SEGUN CONVENIO
			CLEAR(PRML:Record)
			PRML:PRML_CONVENIO = EPL:EMP_CONVENIO			
			SET(PRML:PK_PARAMETRO_LICENCIA,PRML:PK_PARAMETRO_LICENCIA)
			!SEGUN EL CONVENIO Y LOS AÑOS DE ANTIGUEDAD CALCULA LOS DIAS DE LICENCIA
			LOOP 
			!Until ACCESS:PARAMETRO_LICENCIA.Next() OR PRML:PRML_CONVENIO <> EPL:EMP_CONVENIO
				NEXT(PARAMETRO_LICENCIA)
				IF ERRORCODE() THEN BREAK.
				!if Access:PARAMETRO_LICENCIA.Next() <> Level:Benign OR IF PRML:PRML_CONVENIO <> EPL:EMP_CONVENIO then break.
				!IF 	Loc:antiguedad >= PRML:PRML_ANTD AND Loc:antiguedad <= PRML:PRML_ANTH AND PRML:PRML_CONVENIO = EPL:EMP_CONVENIO THEN
				IF 	(Loc:antiguedad > PRML:PRML_ANTD OR Loc:antiguedad = PRML:PRML_ANTD) AND (Loc:antiguedad < PRML:PRML_ANTH OR Loc:antiguedad = PRML:PRML_ANTH) AND PRML:PRML_CONVENIO = EPL:EMP_CONVENIO THEN
					Loc:dias = PRML:PRML_DIAS	
					Loc:dias_pagan = PRML:PRML_PAGAN
				END	!LICENCIA
			END	! PARAMETRO_LICENCIA
		ELSE
 			!CALCULA DIAS HABILES Y CORRIDOS
			DO DIAS_HABILES
			!CADA 20 LE CORRESPONDE 1
			Loc:dias = HABILES/20
			Loc:dias_pagan = HABILES/20
			!REDONDEO Y SE SUMA UNO 
			IF HABILES % 20 > 5 THEN
				Loc:dias = Loc:dias + 1
				Loc:dias_pagan = Loc:dias_pagan + 1
			END	
		END
	END ! EMPLEADO ACTIVO	

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABMLicencias')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPL:EMP_LEGAJO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LIC:LIC_LEGAJO',LIC:LIC_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_ANIO',LIC:LIC_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_DIAS',LIC:LIC_DIAS)                        ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_COBRO',LIC:LIC_COBRO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:FERIADOS.Open                                     ! File FERIADOS used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:PARAMETRO_LICENCIA.Open                           ! File PARAMETRO_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:SECTOR.Open                                       ! File SECTOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW4.Q &= Queue:Browse
  BRW4.RetainRow = 0
  BRW4.AddSortOrder(,LIC:PK_LICENCIA)                      ! Add the sort order for LIC:PK_LICENCIA for sort order 1
  BRW4.AddRange(LIC:LIC_LEGAJO,EPL:EMP_LEGAJO)             ! Add single value range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,LIC:LIC_ANIO,,BRW4)            ! Initialize the browse locator using  using key: LIC:PK_LICENCIA , LIC:LIC_ANIO
  BRW4.AddField(LIC:LIC_LEGAJO,BRW4.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_ANIO,BRW4.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_DIAS,BRW4.Q.LIC:LIC_DIAS)          ! Field LIC:LIC_DIAS is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_PAGAN,BRW4.Q.LIC:LIC_PAGAN)        ! Field LIC:LIC_PAGAN is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_COBRO,BRW4.Q.LIC:LIC_COBRO)        ! Field LIC:LIC_COBRO is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_DEPOSITADA,BRW4.Q.LIC:LIC_DEPOSITADA) ! Field LIC:LIC_DEPOSITADA is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_DEPOSITO_DATE,BRW4.Q.LIC:LIC_DEPOSITO_DATE) ! Field LIC:LIC_DEPOSITO_DATE is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_CTA,BRW4.Q.LIC:LIC_CTA)            ! Field LIC:LIC_CTA is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_OBSERVACION,BRW4.Q.LIC:LIC_OBSERVACION) ! Field LIC:LIC_OBSERVACION is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_FECHA_UPDATE_DATE,BRW4.Q.LIC:LIC_FECHA_UPDATE_DATE) ! Field LIC:LIC_FECHA_UPDATE_DATE is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_FECHA_UPDATE_TIME,BRW4.Q.LIC:LIC_FECHA_UPDATE_TIME) ! Field LIC:LIC_FECHA_UPDATE_TIME is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_USER,BRW4.Q.LIC:LIC_USER)          ! Field LIC:LIC_USER is a hot field or requires assignment from browse
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:DETALLE_LICENCIA.Close
    Relate:EMPLEADOS.Close
    Relate:FERIADOS.Close
    Relate:LICENCIA.Close
    Relate:PARAMETRO_LICENCIA.Close
    Relate:SECTOR.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  !COMPLETA O REFRESCA LOS CAMPOS LUEGO DE ELEGIR UN LEGAJO
  	IF EPL:EMP_LEGAJO <> 0 THEN	
  		!COMPROBAMOS SI EL EMPLEADO EXISTE SINO BLANQUEAMOS LOS CAMPOS
  		GET(EMPLEADOS,EPL:PK_EMPLEADOS)
  		IF NOT ERRORCODE() THEN
  			!LOS EMPLEADOS APTOS PARA LICENCIAS DEBEN SER ACITVOS Y NO PASANTES
  			IF (EPL:EMP_ACTIVO = 'S' AND EPL:EMP_CONVENIO <> 12 )
  				LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
  				CON:CONV_ID = EPL:EMP_CONVENIO
  				GET(CONVENIO,CON:PK_CONVENIO)
  				IF NOT errorcode()
  					DISPLAY(?CON:CONV_CONVENIO)
  				END    
  				SEC:SEC_ID = EPL:EMP_SECTOR
  				GET(SECTOR,SEC:PK_SECTOR)
  				IF NOT errorcode()
  					DISPLAY(?SEC:SEC_SECTOR)	
  				END 	
  			ELSE
  				!LIMPIO LOS CAMPOS Y RESETEO LAS TABLAS UTILIZADAS Y MUESTRO MENSAJE
  				!CLEAR(EPL:EMP_LEGAJO,1)
  				CLEAR(EMPLEADOS:RECORD)
  				GET(EMPLEADOS,0)
  				CLEAR(SECTOR:RECORD)
  				GET(SECTOR,0)
  				CLEAR(CONVENIO:RECORD)
  				GET(CONVENIO,0)
  				CLEAR(LICENCIA:RECORD)
  				GET(LICENCIA,0)
  				DISPLAY
  				SELECT(?EPL:EMP_LEGAJO)
  				MESSAGE('ERROR: Nº LEGAJO NO APTO PARA LICENCIA', 'Nº Legajo no apto',ICON:Exclamation,BUTTON:OK,1)
  			END
  		ELSE
  			CLEAR(EMPLEADOS:RECORD)
  			GET(EMPLEADOS,0)
  			CLEAR(SECTOR:RECORD)
  			GET(SECTOR,0)
  			CLEAR(CONVENIO:RECORD)
  			GET(CONVENIO,0)
  			CLEAR(LICENCIA:RECORD)
  			GET(LICENCIA,0)
  			DISPLAY
  			SELECT(?EPL:EMP_LEGAJO)
  		END	
  	END	


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    ABMEmpleadosLicencia
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
    OF ?Insert
      !NO PERMITE INSERTAR UNA LICENCIA HASTA QUE NO SELECCIONE UN LEGAJO
      IF EPL:EMP_LEGAJO = 0 THEN
      	CYCLE.
    OF ?Change
      !NO PUEDE MODIFICAR SI TIENE LICENCIAS EMITIDAS
      	ERROR# = 0
      	CLEAR(DLIC:Record)
      	DLIC:DLIC_LEGAJO = LIC:LIC_LEGAJO
      	DLIC:DLIC_ANIO = LIC:LIC_ANIO
      	SET(DLIC:PK_DETALLE_LICENCIA,DLIC:PK_DETALLE_LICENCIA)
      	LOOP 
      		!IF ACCESS:DETALLE_LICENCIA.Next() <> Level:Benign THEN BREAK.
      		next(DETALLE_LICENCIA)
          	if errorcode() then break.
      		IF DLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO AND DLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO THEN
      			MESSAGE('ERROR: NO ES POSIBLE MODIFICAR CONTIENE LICENCIAS OTORGADAS ', 'Modificación denegada ',ICON:Exclamation,BUTTON:OK,1)
      			ERROR# = 1
      		END
      	END
      	IF ERROR# = 1 THEN
      		CYCLE.
      	
    OF ?Delete
      !VERIFICAR SI TIENE DETALLE DE LICENCIA
      	ERROR# = 0
      	CLEAR(DLIC:Record)
      	DLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
      	DLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO
      	SET(DLIC:PK_DETALLE_LICENCIA,DLIC:PK_DETALLE_LICENCIA)
      	LOOP 
      		!if ACCESS:DETALLE_LICENCIA.Next() <> Level:Benign then break.
      	    next(DETALLE_LICENCIA)
          	if errorcode() then break.
      		if DLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJo AND DLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO then
      			ERROR# = 1
      		end	
      	END
      !VERIFICAR SI LA LICENCIA FUE PAGADA
      	CLEAR(LIC:Record)
      	LIC:LIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
      	LIC:LIC_ANIO = BRW4.Q.LIC:LIC_ANIO
      	GET(LICENCIA,LIC:PK_LICENCIA)
      	IF LIC:LIC_COBRO = 'S' THEN
      		MESSAGE('ERROR: NO ES POSIBLE BORRAR UNA LICENCIA COBRADA  ', 'Borrado Denegado',ICON:Exclamation,BUTTON:OK,1)		
      		CYCLE.
       !NO SE PUEDE BORRAR SI TIENE LICENCIAS EMITIDAS
      	IF ERROR# = 1 THEN
      		MESSAGE('ERROR: NO ES POSIBLE BORRAR (CONTIENE LICENCIAS EMITIDAS)  ', 'Borrado Denegado',ICON:Exclamation,BUTTON:OK,1)
      		CYCLE.
      	
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EPL:EMP_LEGAJO
      IF EPL:EMP_LEGAJO OR ?EPL:EMP_LEGAJO{PROP:Req}
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        IF Access:EMPLEADOS.TryFetch(EPL:PK_EMPLEADOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
            CON:CONV_ID = EPL:EMP_CONVENIO
            SEC:SEC_ID = EPL:EMP_SECTOR
            LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
          ELSE
            CLEAR(CON:CONV_ID)
            CLEAR(SEC:SEC_ID)
            CLEAR(LIC:LIC_LEGAJO)
            SELECT(?EPL:EMP_LEGAJO)
            CYCLE
          END
        ELSE
          CON:CONV_ID = EPL:EMP_CONVENIO
          SEC:SEC_ID = EPL:EMP_SECTOR
          LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
        END
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update()
      !MUESTRA LA LISTA DE EMPLEADOS
      clear(EPL:EMP_LEGAJO,1)
      post(event:accepted,?EPL:EMP_LEGAJO)
      EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        CON:CONV_ID = EPL:EMP_CONVENIO
        SEC:SEC_ID = EPL:EMP_SECTOR
        LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
      END
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


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW4::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(EditInPlace::LIC:LIC_LEGAJO,1)
  SELF.AddEditControl(EditInPlace::LIC:LIC_ANIO,2)
  SELF.AddEditControl(EditInPlace::LIC:LIC_DIAS,3)
  SELF.AddEditControl(EditInPlace::LIC:LIC_PAGAN,4)
  SELF.AddEditControl(,5) ! LIC:LIC_COBRO Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_DEPOSITADA,6)
  SELF.AddEditControl(EditInPlace::LIC:LIC_DEPOSITO_DATE,7)
  SELF.AddEditControl(EditInPlace::LIC:LIC_CTA,8)
  SELF.AddEditControl(EditInPlace::LIC:LIC_OBSERVACION,9)
  SELF.AddEditControl(EditInPlace::LIC:LIC_FECHA_UPDATE_DATE,10)
  SELF.AddEditControl(EditInPlace::LIC:LIC_FECHA_UPDATE_TIME,11)
  SELF.AddEditControl(EditInPlace::LIC:LIC_USER,12)
  SELF.DeleteAction = EIPAction:Prompted
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  SELF.EIP.Insert = EIPAction:Append
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW4.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  LIC:LIC_COBRO = 'N'
  LIC:LIC_ANIO = YEAR(TODAY())
  LIC:LIC_DEPOSITADA = 'N'
  LIC:LIC_FECHA_UPDATE_DATE = today()
  LIC:LIC_FECHA_UPDATE_TIME = clock()
  LIC:LIC_USER = Glo:Usuario2
  RETURN ReturnValue


BRW4::EIPManager.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  !CONTROL VER SI SE TRABA MUCHO EL EIP PONER EL CONTROL DE TODO ACA
  
  RETURN ReturnValue


EditInPlace::LIC:LIC_ANIO.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Text} = '@N04'
  SELF.REQ = True


EditInPlace::LIC:LIC_ANIO.TakeEvent PROCEDURE(UNSIGNED Event)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  CASE ReturnValue 
  OF EditAction:None OROF EditAction:Cancel 	
  ELSE 
  	UPDATE(Self.Feq) 
  	LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
  	LIC:LIC_ANIO= BRW4.Q.LIC:LIC_ANIO
  	!EVITA CARGAR UNA LICENCIA DUPLICADA	
  	IF	NOT DUPLICATE(LICENCIA) 
  		IF LIC:LIC_ANIO >= YEAR(EPL:EMP_FECANTIG) THEN
  			!CALCULA LA CANTIDAD DE DIAS QUE LE CORRESPONDEN PARA ESE AÑO
  			DO DIAS_LICENCIA_ACTUAL 
  			!INICIALIZA LOS VALORES DEL EIP
  			BRW4.Q.LIC:LIC_DIAS = Loc:dias !ESTE TOMA VALOR EN DIAS_LICENCIA_ACTUAL
  			BRW4.Q.LIC:LIC_PAGAN = Loc:dias_pagan
  			BRW4.Q.LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  			BRW4.Q.LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  			BRW4.Q.LIC:LIC_USER = Glo:Usuario2
  		ELSE
  			MESSAGE('ERROR: NO PUEDE INGRESAR UNA LICENCIA ANTERIOR A SU FECHA DE INGRESO - (CAMBIELA O ESC PARA CANCELAR) ', 'Licencia inválida',ICON:Exclamation,BUTTON:OK,1)
  			RETURN EditAction:None
  		END			
  	ELSE
  		MESSAGE('ERROR: LICENCIA DUPLICADA - (CAMBIELA O ESC PARA CANCELAR) ', 'Licencia Existente',ICON:Exclamation,BUTTON:OK,1)
  		ReturnValue = EditAction:NONE  
  		Return ReturnValue 
  	END	
  END 
  RETURN ReturnValue


EditInPlace::LIC:LIC_DIAS.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Center} = True
  SELF.FEQ{PROP:Text} = '@N_2'
  SELF.REQ = True


EditInPlace::LIC:LIC_DIAS.TakeEvent PROCEDURE(UNSIGNED Event)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  !PERMITE CAMBIAR LA CANTIDAD DE DIAS (VER SI NO LO TENGO QUE RESTRINGIR)
  CASE ReturnValue 
  OF EditAction:None OROF EditAction:Cancel 	
  ELSE
  	ERROR# = 0
  	!PUEDO MODIFICAR LOS DIAS SI NO SE EMITIERON LICENCIAS
  	CLEAR(DLIC:Record)
  	DLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
  	DLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO
  	SET(DLIC:PK_DETALLE_LICENCIA,DLIC:PK_DETALLE_LICENCIA)
  	LOOP
  		NEXT(DETALLE_LICENCIA)
  		if errorcode() then break.
  		IF DLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO AND DLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO THEN
  			ERROR# = 1
  		END	
  	END
  	IF ERROR# = 0 THEN
  		UPDATE(Self.Feq) 
  		LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
  		LIC:LIC_ANIO= BRW4.Q.LIC:LIC_ANIO
  		IF BRW4.Q.LIC:LIC_DIAS <> LIC:LIC_DIAS THEN
  			BRW4.Q.LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  			BRW4.Q.LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  			BRW4.Q.LIC:LIC_USER = Glo:Usuario2
  		END	
  	ELSE
  		MESSAGE('ERROR: NO PUEDE MODIFICAR LA CANTIDAD DE DIAS - TIENE LICENCIAS EMITIDAS) ', 'Cambio de días denegados',ICON:Exclamation,BUTTON:OK,1)
  		RETURN EditAction:None
  	END	
  END 
  RETURN ReturnValue


EditInPlace::LIC:LIC_PAGAN.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Center} = True
  SELF.FEQ{PROP:Text} = '@N_2'


EditInPlace::LIC:LIC_DEPOSITADA.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_DEPOSITADA.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'N'


EditInPlace::LIC:LIC_CTA.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Text} = '@n_7B'
  SELF.REQ = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
SolicitudLicencia PROCEDURE 

SOLICITUD_VALIDA     STRING('S')                           !
CtrlOblgatorio       SHORT                                 !
SetObligatorio       BYTE                                  !
Obligatorio          BYTE                                  !
DESANULAR_OK         STRING(20)                            !
loc:str              STRING(4000)                          !
Convenios            SHORT                                 !
Tipo_Dias            STRING(1)                             !
Semana               SHORT                                 !
DiasRestan           SHORT                                 !
Uso_Dias_Viaje       STRING('X')                           !
Loc:dias_restan      SHORT                                 !
Loc:Semana           SHORT                                 !
Dias_Fraccionados    SHORT                                 !
Adelanto_Licencia    STRING('N')                           !
Licencia_cobro       STRING('N')                           !
Adelanto_Sueldo      STRING('N')                           !
DiasTomados          SHORT(0)                              !
Dias_Tomados         SHORT(0)                              !
Dias_Pagan           SHORT(0)                              !
Dias_Restan          SHORT(0)                              !
Tiene_Dias_Viaje     STRING('X')                           !
BRW4::View:Browse    VIEW(LICENCIA)
                       PROJECT(LIC:LIC_LEGAJO)
                       PROJECT(LIC:LIC_ANIO)
                       PROJECT(LIC:LIC_DIAS)
                       PROJECT(LIC:LIC_COBRO)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !List box control field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !List box control field - type derived from field
LIC:LIC_DIAS           LIKE(LIC:LIC_DIAS)             !List box control field - type derived from field
DiasTomados            LIKE(DiasTomados)              !List box control field - type derived from local data
DiasRestan             LIKE(DiasRestan)               !List box control field - type derived from local data
LIC:LIC_COBRO          LIKE(LIC:LIC_COBRO)            !List box control field - type derived from field
Obligatorio            LIKE(Obligatorio)              !List box control field - type derived from local data
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(DETALLE_LICENCIA)
                       PROJECT(DLIC:DLIC_LEGAJO)
                       PROJECT(DLIC:DLIC_ANIO)
                       PROJECT(DLIC:DLIC_INICIO_DATE)
                       PROJECT(DLIC:DLIC_FIN_DATE)
                       PROJECT(DLIC:DLIC_TOMA)
                       PROJECT(DLIC:DLIC_COBRAR)
                       PROJECT(DLIC:DLIC_ASUELDO)
                       PROJECT(DLIC:DLIC_VIAJE)
                       PROJECT(DLIC:DLIC_ESTADO)
                       PROJECT(DLIC:DLIC_INICIO_TIME)
                       PROJECT(DLIC:DLIC_FIN_TIME)
                       PROJECT(DLIC:DLIC_INICIO)
                       PROJECT(DLIC:DLIC_FIN)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
DLIC:DLIC_LEGAJO       LIKE(DLIC:DLIC_LEGAJO)         !List box control field - type derived from field
DLIC:DLIC_LEGAJO_NormalFG LONG                        !Normal forground color
DLIC:DLIC_LEGAJO_NormalBG LONG                        !Normal background color
DLIC:DLIC_LEGAJO_SelectedFG LONG                      !Selected forground color
DLIC:DLIC_LEGAJO_SelectedBG LONG                      !Selected background color
DLIC:DLIC_ANIO         LIKE(DLIC:DLIC_ANIO)           !List box control field - type derived from field
DLIC:DLIC_ANIO_NormalFG LONG                          !Normal forground color
DLIC:DLIC_ANIO_NormalBG LONG                          !Normal background color
DLIC:DLIC_ANIO_SelectedFG LONG                        !Selected forground color
DLIC:DLIC_ANIO_SelectedBG LONG                        !Selected background color
DLIC:DLIC_INICIO_DATE  LIKE(DLIC:DLIC_INICIO_DATE)    !List box control field - type derived from field
DLIC:DLIC_INICIO_DATE_NormalFG LONG                   !Normal forground color
DLIC:DLIC_INICIO_DATE_NormalBG LONG                   !Normal background color
DLIC:DLIC_INICIO_DATE_SelectedFG LONG                 !Selected forground color
DLIC:DLIC_INICIO_DATE_SelectedBG LONG                 !Selected background color
DLIC:DLIC_FIN_DATE     LIKE(DLIC:DLIC_FIN_DATE)       !List box control field - type derived from field
DLIC:DLIC_FIN_DATE_NormalFG LONG                      !Normal forground color
DLIC:DLIC_FIN_DATE_NormalBG LONG                      !Normal background color
DLIC:DLIC_FIN_DATE_SelectedFG LONG                    !Selected forground color
DLIC:DLIC_FIN_DATE_SelectedBG LONG                    !Selected background color
DLIC:DLIC_TOMA         LIKE(DLIC:DLIC_TOMA)           !List box control field - type derived from field
DLIC:DLIC_TOMA_NormalFG LONG                          !Normal forground color
DLIC:DLIC_TOMA_NormalBG LONG                          !Normal background color
DLIC:DLIC_TOMA_SelectedFG LONG                        !Selected forground color
DLIC:DLIC_TOMA_SelectedBG LONG                        !Selected background color
DLIC:DLIC_COBRAR       LIKE(DLIC:DLIC_COBRAR)         !List box control field - type derived from field
DLIC:DLIC_COBRAR_NormalFG LONG                        !Normal forground color
DLIC:DLIC_COBRAR_NormalBG LONG                        !Normal background color
DLIC:DLIC_COBRAR_SelectedFG LONG                      !Selected forground color
DLIC:DLIC_COBRAR_SelectedBG LONG                      !Selected background color
DLIC:DLIC_ASUELDO      LIKE(DLIC:DLIC_ASUELDO)        !List box control field - type derived from field
DLIC:DLIC_ASUELDO_NormalFG LONG                       !Normal forground color
DLIC:DLIC_ASUELDO_NormalBG LONG                       !Normal background color
DLIC:DLIC_ASUELDO_SelectedFG LONG                     !Selected forground color
DLIC:DLIC_ASUELDO_SelectedBG LONG                     !Selected background color
DLIC:DLIC_VIAJE        LIKE(DLIC:DLIC_VIAJE)          !List box control field - type derived from field
DLIC:DLIC_VIAJE_NormalFG LONG                         !Normal forground color
DLIC:DLIC_VIAJE_NormalBG LONG                         !Normal background color
DLIC:DLIC_VIAJE_SelectedFG LONG                       !Selected forground color
DLIC:DLIC_VIAJE_SelectedBG LONG                       !Selected background color
DLIC:DLIC_ESTADO       LIKE(DLIC:DLIC_ESTADO)         !List box control field - type derived from field
DLIC:DLIC_ESTADO_NormalFG LONG                        !Normal forground color
DLIC:DLIC_ESTADO_NormalBG LONG                        !Normal background color
DLIC:DLIC_ESTADO_SelectedFG LONG                      !Selected forground color
DLIC:DLIC_ESTADO_SelectedBG LONG                      !Selected background color
DLIC:DLIC_INICIO_TIME  LIKE(DLIC:DLIC_INICIO_TIME)    !List box control field - type derived from field
DLIC:DLIC_INICIO_TIME_NormalFG LONG                   !Normal forground color
DLIC:DLIC_INICIO_TIME_NormalBG LONG                   !Normal background color
DLIC:DLIC_INICIO_TIME_SelectedFG LONG                 !Selected forground color
DLIC:DLIC_INICIO_TIME_SelectedBG LONG                 !Selected background color
DLIC:DLIC_FIN_TIME     LIKE(DLIC:DLIC_FIN_TIME)       !List box control field - type derived from field
DLIC:DLIC_FIN_TIME_NormalFG LONG                      !Normal forground color
DLIC:DLIC_FIN_TIME_NormalBG LONG                      !Normal background color
DLIC:DLIC_FIN_TIME_SelectedFG LONG                    !Selected forground color
DLIC:DLIC_FIN_TIME_SelectedBG LONG                    !Selected background color
DLIC:DLIC_INICIO       LIKE(DLIC:DLIC_INICIO)         !Primary key field - type derived from field
DLIC:DLIC_FIN          LIKE(DLIC:DLIC_FIN)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Solicitud Licencia'),AT(,,360,380),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('SolicitudLicencia'),SYSTEM
                       GROUP,AT(5,5,350,100),USE(?GROUP1),FONT(,,,FONT:bold,CHARSET:DEFAULT),BOXED
                         ENTRY(@n_7B),AT(206,20,60,30),USE(EPL:EMP_LEGAJO),FONT(,16,COLOR:Red,FONT:bold),CENTER(1), |
  FLAT
                         PROMPT('Ingrese el Número de Legajo:'),AT(10,26),USE(?EPL:EMP_LEGAJO:Prompt),FONT(,14,,FONT:bold)
                         PROMPT('Nombre'),AT(10,61),USE(?EPL:EMP_NOMBRE:Prompt),FONT(,12,,FONT:bold)
                         ENTRY(@s31),AT(10,78,163,12),USE(EPL:EMP_NOMBRE),FONT(,12,,FONT:bold),FLAT,READONLY,SKIP
                         PROMPT('Antiguedad'),AT(280,61),USE(?EPL:EMP_FECANTIG:Prompt),FONT(,12,,FONT:bold)
                         ENTRY(@D06b),AT(280,78,70,12),USE(EPL:EMP_FECANTIG),FONT(,12,,FONT:bold),CENTER,FLAT,READONLY, |
  SKIP
                         BUTTON,AT(280,18,45,32),USE(?CallLookup),ICON('clients.ico')
                         ENTRY(@s12),AT(186,78,80,12),USE(CON:CONV_CONVENIO),FONT(,12),UPR,FLAT
                         PROMPT('Convenio'),AT(186,61),USE(?CON:CONV_CONVENIO:Prompt),FONT(,12)
                       END
                       GROUP('LICENCIAS VIGENTES'),AT(5,110,350,100),USE(?GROUP2),FONT(,8,COLOR:Black,FONT:bold,CHARSET:DEFAULT), |
  BOXED
                         LIST,AT(10,125,340,80),USE(?List),FONT(,10),VSCROLL,FLAT,FORMAT('0C(2)|M~LIC LEGAJO~C(0' & |
  ')@n-7@60C(2)|M~AÑO~C(0)@n_7@60C(2)|M~DIAS~C(0)@n3@60C(2)|M~TOMO~C(1)@n_7@60C(2)|M~RE' & |
  'STAN~C(1)@n02@40C(2)|M~COBRO~C(0)@s1@0C(2)|M~Ob~C(0)@n3@'),FROM(Queue:Browse),IMM,SCROLL
                       END
                       GROUP('DETALLE LICENCIA'),AT(5,215,350,140),USE(?GROUP2:2),FONT(,,COLOR:Black,FONT:bold,CHARSET:DEFAULT), |
  BOXED
                         LIST,AT(10,230,340,120),USE(?List:2),FONT(,10),VSCROLL,FLAT,FORMAT('0C(2)|M*~DLIC LEGAJ' & |
  'O~C(0)@n-7@0C(2)|M*~DLIC ANIO~C(0)@n-7@60C(2)|M*~INICIA~C(0)@d17@60C(2)|M*~FINALIZA~' & |
  'C(0)@d17@30C(2)|M*~DIAS~C(0)@n3@65C(2)|M*~ADEL. RETRIB~C(0)@s1@72C(2)|M*~ADEL SUELDO' & |
  '~C(0)@s1@0C(2)|M*~DIAS VIAJE~C(0)@s1@0C(2)|M*~DLIC ESTADO~C(0)@s1@0C(2)|M*~DLIC INIC' & |
  'IO TIME~C(0)@t7@0C(2)|M*~DLIC FIN TIME~C(0)@t7@'),FROM(Queue:Browse:1),IMM,SCROLL
                         BUTTON('&Borrar'),AT(36,268,72,15),USE(?Delete),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wadelete.ico'), |
  FLAT,LAYOUT(0)
                       END
                       BUTTON('&Agregar'),AT(5,360,72,15),USE(?Insert),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wainsert.ico'), |
  FLAT,LAYOUT(0)
                       BUTTON('&Modificar'),AT(81,360,72,15),USE(?Change),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wachange.ico'), |
  FLAT,LAYOUT(0)
                       BUTTON('Días de Viaje'),AT(186,360,72,15),USE(?BUTTON3),FONT(,10,COLOR:Green,FONT:bold),DISABLE, |
  FLAT
                       BUTTON('Anular'),AT(283,360,72,15),USE(?BUTTON1),FONT(,10,COLOR:Red,FONT:bold),FLAT
                       BUTTON('Validar'),AT(283,360,72,15),USE(?BUTTON2),FONT(,10,COLOR:Green,FONT:bold),FLAT,HIDE
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Open                   PROCEDURE(),DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
UpdateWindow           PROCEDURE(),DERIVED
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
CALCULAR_DIAS_TOMADOS   ROUTINE
	Dias_Tomados = 0
	Loc:dias_restan = 0
	
!DETALLE_LICENCIA
		CLEAR(ADLIC:Record)
		ADLIC:DLIC_LEGAJO = LIC:LIC_LEGAJO
		ADLIC:DLIC_ANIO = LIC:LIC_ANIO
		SET(ADLIC:PK_DETALLE_LICENCIA,ADLIC:PK_DETALLE_LICENCIA)
		LOOP 
		!Until ACCESS:DETALLE_LICENCIA.Next() OR DLIC:DLIC_ANIO <> BRW4.Q.LIC:LIC_ANIO OR DLIC:DLIC_LEGAJO <> BRW4.Q.LIC:LIC_LEGAJO
		NEXT(ADETALLE_LICENCIA)
		IF ERRORCODE() THEN BREAK.
			IF ADLIC:DLIC_ESTADO <> 'A' AND ADLIC:DLIC_ANIO = LIC:LIC_ANIO AND ADLIC:DLIC_LEGAJO = LIC:LIC_LEGAJO THEN				
				Dias_Tomados = Dias_Tomados + ADLIC:DLIC_TOMA
			END	
			
		END	
	Loc:dias_restan = LIC:LIC_DIAS - Dias_Tomados
HABILITA_DIAS_VIAJE ROUTINE
!SI TIENE DIAS DE VIAJE Y NO SE LOS TOMO HABILITA EL GROUP DE DIAS DE VIAJE	
!(TIENE EN CUENTA LOS DIAS Q TOMA Q DEBEN SER IGUAL O MAYOR A LA SEMANA O SER LOS ULTIMOS QUE TIENE PARA PODER TOMARSELO)
	IF Tiene_Dias_Viaje = 'S' THEN
		IF DLIC:DLIC_TOMA >= Loc:Semana OR (DLIC:DLIC_TOMA - DiasRestan) = 0  THEN
			ENABLE(?BUTTON3)
		ELSE
			DISABLE(?BUTTON3)
		END	
	ELSE
		DISABLE(?BUTTON3)
	END 
REVALIDAD_ADELANTO_LICENCIA ROUTINE
	!MESSAGE('REVALIDAADELANTO')
	CLEAR(LIC:Record)
	LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
	LIC:LIC_ANIO = DLIC:DLIC_ANIO 
	GET(LICENCIA,LIC:PK_LICENCIA)
	IF NOT ERRORCODE() THEN
		!MESSAGE('ERRORADELANTO')
		LIC:LIC_COBRO = 'P'
		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
		Access:LICENCIA.Update()
	END	
ANULAR_ADELANTO      ROUTINE
	LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
	LIC:LIC_ANIO = DLIC:DLIC_ANIO 
	GET(LICENCIA,LIC:PK_LICENCIA)
	IF NOT ERRORCODE() THEN
		LIC:LIC_COBRO = 'N'
		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
		Access:LICENCIA.Update()
	END	
DIAS_FRACCIONADOS   ROUTINE
!ENTREGA LA CANIDAD DE DIAS FRACCIONADOS TOMADOS
!DIAS FRACCIONADOS (DF) = DIAS MENOR A LA DEFINICION DE SEMANA DE SU CONVENIO	
	Dias_Fraccionados = 0
	CLEAR(ADLIC:Record)
	ADLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
	ADLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO
	SET(ADLIC:PK_DETALLE_LICENCIA,ADLIC:PK_DETALLE_LICENCIA)
	LOOP 
	!Until ACCESS:DETALLE_LICENCIA.Next() OR DLIC:DLIC_ANIO <> BRW4.Q.LIC:LIC_ANIO
		NEXT(ADETALLE_LICENCIA)
		IF ERRORCODE() THEN BREAK.
		IF ADLIC:DLIC_TOMA < Semana AND ADLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO AND ADLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO THEN
			Dias_Fraccionados = Dias_Fraccionados + ADLIC:DLIC_TOMA
		END	
	END		
CHEQUEAR_DESANULACION_VALORES_LICENCIA      ROUTINE
!ME ENTREGA LA CANTIDAD DE DIAS TOMADOS (CON ESTADO <> A)	
	Dias_Tomados = 0
	CLEAR(LIC:Record)
	LIC:LIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
	LIC:LIC_ANIO = BRW4.Q.LIC:LIC_ANIO
	GET(LICENCIA,LIC:PK_LICENCIA)
	IF NOT errorcode()
		CLEAR(ADLIC:Record)
		ADLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
		ADLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO
		SET(ADLIC:PK_DETALLE_LICENCIA,ADLIC:PK_DETALLE_LICENCIA)
		LOOP 
		!Until ACCESS:DETALLE_LICENCIA.Next() OR DLIC:DLIC_ANIO <> BRW4.Q.LIC:LIC_ANIO OR DLIC:DLIC_LEGAJO <> BRW4.Q.LIC:LIC_LEGAJO
		NEXT(ADETALLE_LICENCIA)
		IF ERRORCODE() THEN BREAK.
			IF ADLIC:DLIC_ESTADO <> 'A' AND ADLIC:DLIC_ANIO = BRW4.Q.LIC:LIC_ANIO AND ADLIC:DLIC_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO THEN
				Dias_Tomados = Dias_Tomados + ADLIC:DLIC_TOMA
			END	
		END	
	END
DESANULAR_VALORES_LICENCIA  ROUTINE
!CAMBIA EL ESTADO = O PERO ANTES CHEQUEA QUE AL REFLOTAR ESOS DIAS SEAN VALIDOS	
	!DO CHEQUEAR_DESANULACION_VALORES_LICENCIA
	CLEAR(DLIC:Record)
	DLIC:DLIC_LEGAJO = BRW5.Q.DLIC:DLIC_LEGAJO
	DLIC:DLIC_ANIO = BRW5.Q.DLIC:DLIC_ANIO
	DLIC:DLIC_INICIO_DATE = BRW5.Q.DLIC:DLIC_INICIO_DATE
	DLIC:DLIC_INICIO_TIME = BRW5.Q.DLIC:DLIC_INICIO_TIME
	DLIC:DLIC_FIN_DATE = BRW5.Q.DLIC:DLIC_FIN_DATE
	DLIC:DLIC_FIN_TIME = BRW5.Q.DLIC:DLIC_FIN_TIME
	GET(DETALLE_LICENCIA,DLIC:PK_DETALLE_LICENCIA)
	IF NOT errorcode()
		!CHEQUEAR SI ES POSIBLE VOLVER EL ESTADO SIN Q SUPERE LA CANTIDAD DE DIAS DE LICENCIA
		DO CHEQUEAR_DESANULACION_VALORES_LICENCIA
		IF (Dias_Tomados + BRW5.Q.DLIC:DLIC_TOMA) <= LIC:LIC_DIAS THEN
		!ACTUALIZA FECHA Y ESTADO DETALLE_LICENCIA
			IF DLIC:DLIC_COBRAR = 'P' AND LIC:LIC_COBRO = 'N' THEN
				DO REVALIDAD_ADELANTO_LICENCIA 
			END	
			DLIC:DLIC_FECHA_UPDATE_DATE = TODAY()
			DLIC:DLIC_FECHA_UPDATE_TIME = CLOCK()
			DLIC:DLIC_ESTADO = 'O'
			!PUT(DETALLE_LICENCIA)
			Access:DETALLE_LICENCIA.Update()
			IF NOT ERRORCODE() THEN
				MESSAGE('Se ha Validado una Licencia previamente Anulada ', 'Valida Licencia Previamente Anulada',ICON:Exclamation,BUTTON:OK,1)
				BRW5.ResetFromFile()
			END	
		ELSE
			MESSAGE('No se puede Anular la Licencia dejaria de tener consistencia. Verifique las Licencias otorgadas y verifique si la anulación es correcta ', 'Inconsistencia en la Anulación',ICON:Exclamation,BUTTON:OK,1)
		END	
	END
PREPARAR_PARAMETROS ROUTINE
!VALIDAR_SOLICITUD   ROUTINE
!EVALUA SI LA SOLICITUD DE LICENCIA ES VALIDA (LE QUEDAN DIAS POR TOMAR)
!VARIABLES DE CONTROL PARA PASAR AL FORMULARIO DE EMISION DE LICENCIA
	Licencia_cobro = LIC:LIC_COBRO
	Dias_Tomados = DiasTomados
	Adelanto_Licencia = 'N'
	Uso_Dias_Viaje = 'N'
!	Adelanto_Sueldo = 'N'
	Tiene_Dias_Viaje = 'N'
	Uso_Dias_Viaje = 'N'
	Convenios = 0
	Dias_Restan = DiasRestan
	
!EMPLEADOS - OBTENGO EL CONVENIO PARA DETERMINAR LA SEMANA (DIAS) Y TIPO DE DIAS (HABILES O CORRIDOS)
	CLEAR(EPL:Record)
	EPL:EMP_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
	GET(EMPLEADOS,EPL:PK_EMPLEADOS)
	IF NOT errorcode() THEN
!CONVENIO		
		CLEAR(CON:Record)
		CON:CONV_ID = EPL:EMP_CONVENIO
		GET(CONVENIO,CON:PK_CONVENIO)
		IF NOT ERRORCODE()  THEN 	
			!CASO NORMA ODDI
			IF EPL:EMP_LEGAJO <> 9140 THEN
				Semana = CON:CONV_SEMANAS
			ELSE
			 	Semana = 5
			END	
			IF EPL:EMP_LEGAJO <> 9140 THEN
				Tipo_Dias = CON:CONV_DIAS
			ELSE
				Tipo_Dias = 'H'
			END	
			Tiene_Dias_Viaje = CON:CONV_DVIAJE
			Convenios = EPL:EMP_CONVENIO
			IF CON:CONV_DVIAJE = 'S' AND LIC:LIC_DIAS_VIAJE = 'S' THEN
				Uso_Dias_Viaje = 'S'
			END				
		END	
	END	

ANULAR_VALORES_LICENCIA     ROUTINE
!CAMBIA EL ESTADO = A EL QUE HARA QUE LUEGO NO SE COMPUTEN ESOS DIAS TOMADOS	
	CLEAR(DLIC:Record)
	DLIC:DLIC_LEGAJO = BRW5.Q.DLIC:DLIC_LEGAJO
	DLIC:DLIC_ANIO = BRW5.Q.DLIC:DLIC_ANIO
	DLIC:DLIC_INICIO_DATE = BRW5.Q.DLIC:DLIC_INICIO_DATE
	DLIC:DLIC_INICIO_TIME = BRW5.Q.DLIC:DLIC_INICIO_TIME
	DLIC:DLIC_FIN_DATE = BRW5.Q.DLIC:DLIC_FIN_DATE
	DLIC:DLIC_FIN_TIME = BRW5.Q.DLIC:DLIC_FIN_TIME
	GET(DETALLE_LICENCIA,DLIC:PK_DETALLE_LICENCIA)
	IF NOT errorcode()
		!ACTUALIZA FECHA Y ESTADO DETALLE_LICENCIA
		IF DLIC:DLIC_COBRAR = 'P' AND LIC:LIC_COBRO = 'P' THEN
			DO ANULAR_ADELANTO
		END	
			DLIC:DLIC_FECHA_UPDATE_DATE = TODAY()
			DLIC:DLIC_FECHA_UPDATE_TIME = CLOCK()
			DLIC:DLIC_ESTADO = 'A'
			DLIC:DLIC_COBRAR = 'N'
			Access:DETALLE_LICENCIA.Update()
			IF NOT ERRORCODE() THEN
				MESSAGE('Se ha Anulado la Licencia ', 'Anula Licencia',ICON:Exclamation,BUTTON:OK,1)
				BRW5.ResetFromFile()
			END	
		!END	
	END


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SolicitudLicencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPL:EMP_LEGAJO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LIC:LIC_LEGAJO',LIC:LIC_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_ANIO',LIC:LIC_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_DIAS',LIC:LIC_DIAS)                        ! Added by: BrowseBox(ABC)
  BIND('DiasTomados',DiasTomados)                          ! Added by: BrowseBox(ABC)
  BIND('DiasRestan',DiasRestan)                            ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_COBRO',LIC:LIC_COBRO)                      ! Added by: BrowseBox(ABC)
  BIND('Obligatorio',Obligatorio)                          ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_LEGAJO',DLIC:DLIC_LEGAJO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ANIO',DLIC:DLIC_ANIO)                    ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_TOMA',DLIC:DLIC_TOMA)                    ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_COBRAR',DLIC:DLIC_COBRAR)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ASUELDO',DLIC:DLIC_ASUELDO)              ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_VIAJE',DLIC:DLIC_VIAJE)                  ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ESTADO',DLIC:DLIC_ESTADO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_INICIO',DLIC:DLIC_INICIO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_FIN',DLIC:DLIC_FIN)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:ADETALLE_LICENCIA.Open                            ! File ADETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:DIAS_VIAJE.Open                                   ! File DIAS_VIAJE used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:FERIADOS.Open                                     ! File FERIADOS used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:PARAMETRO_DIAS_VIAJE.Open                         ! File PARAMETRO_DIAS_VIAJE used by this procedure, so make sure it's RelationManager is open
  Relate:PARAMETRO_LICENCIA.Open                           ! File PARAMETRO_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  Relate:empch.Open                                        ! File empch used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:LICENCIA,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:1.ViewPosition,BRW5::View:Browse,Queue:Browse:1,Relate:DETALLE_LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW4.Q &= Queue:Browse
  BRW4.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW4.RetainRow = 0
  BRW4.AddSortOrder(,LIC:PK_LICENCIA)                      ! Add the sort order for LIC:PK_LICENCIA for sort order 1
  BRW4.AddRange(LIC:LIC_LEGAJO,EPL:EMP_LEGAJO)             ! Add single value range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,LIC:LIC_ANIO,,BRW4)            ! Initialize the browse locator using  using key: LIC:PK_LICENCIA , LIC:LIC_ANIO
  BRW4.AddField(LIC:LIC_LEGAJO,BRW4.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_ANIO,BRW4.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_DIAS,BRW4.Q.LIC:LIC_DIAS)          ! Field LIC:LIC_DIAS is a hot field or requires assignment from browse
  BRW4.AddField(DiasTomados,BRW4.Q.DiasTomados)            ! Field DiasTomados is a hot field or requires assignment from browse
  BRW4.AddField(DiasRestan,BRW4.Q.DiasRestan)              ! Field DiasRestan is a hot field or requires assignment from browse
  BRW4.AddField(LIC:LIC_COBRO,BRW4.Q.LIC:LIC_COBRO)        ! Field LIC:LIC_COBRO is a hot field or requires assignment from browse
  BRW4.AddField(Obligatorio,BRW4.Q.Obligatorio)            ! Field Obligatorio is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:1
  BRW5.RetainRow = 0
  BRW5.AddSortOrder(,DLIC:PK_DETALLE_LICENCIA)             ! Add the sort order for DLIC:PK_DETALLE_LICENCIA for sort order 1
  BRW5.AddRange(DLIC:DLIC_LEGAJO,Relate:DETALLE_LICENCIA,Relate:LICENCIA) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,DLIC:DLIC_ANIO,,BRW5)          ! Initialize the browse locator using  using key: DLIC:PK_DETALLE_LICENCIA , DLIC:DLIC_ANIO
  BRW5.AddField(DLIC:DLIC_LEGAJO,BRW5.Q.DLIC:DLIC_LEGAJO)  ! Field DLIC:DLIC_LEGAJO is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_ANIO,BRW5.Q.DLIC:DLIC_ANIO)      ! Field DLIC:DLIC_ANIO is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_INICIO_DATE,BRW5.Q.DLIC:DLIC_INICIO_DATE) ! Field DLIC:DLIC_INICIO_DATE is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_FIN_DATE,BRW5.Q.DLIC:DLIC_FIN_DATE) ! Field DLIC:DLIC_FIN_DATE is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_TOMA,BRW5.Q.DLIC:DLIC_TOMA)      ! Field DLIC:DLIC_TOMA is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_COBRAR,BRW5.Q.DLIC:DLIC_COBRAR)  ! Field DLIC:DLIC_COBRAR is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_ASUELDO,BRW5.Q.DLIC:DLIC_ASUELDO) ! Field DLIC:DLIC_ASUELDO is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_VIAJE,BRW5.Q.DLIC:DLIC_VIAJE)    ! Field DLIC:DLIC_VIAJE is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_ESTADO,BRW5.Q.DLIC:DLIC_ESTADO)  ! Field DLIC:DLIC_ESTADO is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_INICIO_TIME,BRW5.Q.DLIC:DLIC_INICIO_TIME) ! Field DLIC:DLIC_INICIO_TIME is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_FIN_TIME,BRW5.Q.DLIC:DLIC_FIN_TIME) ! Field DLIC:DLIC_FIN_TIME is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_INICIO,BRW5.Q.DLIC:DLIC_INICIO)  ! Field DLIC:DLIC_INICIO is a hot field or requires assignment from browse
  BRW5.AddField(DLIC:DLIC_FIN,BRW5.Q.DLIC:DLIC_FIN)        ! Field DLIC:DLIC_FIN is a hot field or requires assignment from browse
  BRW5.AskProcedure = 2                                    ! Will call: FormSolicitudLicencia(Licencia_cobro,Dias_Restan,Tipo_Dias,Semana,Convenios,Dias_Fraccionados,Dias_Tomados)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:ADETALLE_LICENCIA.Close
    Relate:CONVENIO.Close
    Relate:DETALLE_LICENCIA.Close
    Relate:DIAS_VIAJE.Close
    Relate:EMPLEADOS.Close
    Relate:FERIADOS.Close
    Relate:LICENCIA.Close
    Relate:PARAMETRO_DIAS_VIAJE.Close
    Relate:PARAMETRO_LICENCIA.Close
    Relate:TMPUsosMultiples.Close
    Relate:empch.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !MESSAGE('OPENW')
  HIDE(?Delete)
  DISABLE(?BUTTON3)
  DISABLE(?BUTTON1)
  DISABLE(?BUTTON2)


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  !MESSAGE('RESETW')
  !COMPLETA O REFRESCA LOS CAMPOS LUEGO DE ELEGIR UN LEGAJO
  	IF EPL:EMP_LEGAJO <> 0 THEN	
  		!COMPROBAMOS SI EL EMPLEADO EXISTE SINO BLANQUEAMOS LOS CAMPOS
  		GET(EMPLEADOS,EPL:PK_EMPLEADOS)
  		IF ERRORCODE() THEN
  			!LOS EMPLEADOS APTOS PARA LICENCIAS DEBEN SER ACITVOS Y NO PASANTES
  			CLEAR(EMPLEADOS:RECORD)
  			GET(EMPLEADOS,0)
  			CLEAR(SECTOR:RECORD)
  			GET(SECTOR,0)
  			CLEAR(CONVENIO:RECORD)
  			GET(CONVENIO,0)
  			CLEAR(LICENCIA:RECORD)
  			GET(LICENCIA,0)
  			DISPLAY
  			SELECT(?EPL:EMP_LEGAJO)
  			!DISABLE(?BUTTON3)
  			SetObligatorio = 0
  		ELSE
  			CON:CONV_ID = EPL:EMP_CONVENIO
  			GET(CONVENIO,CON:PK_CONVENIO)
  			IF NOT errorcode()
  				DISPLAY(?CON:CONV_CONVENIO)
  			END    
  			SetObligatorio = 0
  		END	
  	END	


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      ABMEmpleadosLicencia
      FormSolicitudLicencia(Licencia_cobro,Dias_Restan,Tipo_Dias,Semana,Convenios,Dias_Fraccionados,Dias_Tomados)
    END
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
    OF ?Delete
      		MESSAGE('No se puede borrar una Licencia - Puede Anularla', 'Borrar Licencia',ICON:Exclamation,BUTTON:OK,1)
      	CYCLE
    OF ?Insert
      !EVALUA SI LE QUEDAN DIAS PARA TOMARSE 
      IF DiasRestan = 0 THEN
      	MESSAGE('ATENCION: NO ES POSIBLE AGREGAR UNA SOLICITUD  - LICENCIA COMPLETA', 'Licencia Completa',ICON:Exclamation,BUTTON:OK,1)
      	CYCLE.
      !SIEMPRE SERA NECESARIO UN NUMERO DE LEGAJO PARA OPERAR	
      IF EPL:EMP_LEGAJO = 0  THEN
      	CYCLE.
      !CONTROLO EL CON CTRLOBLIGATORIO PARA QUE RESPONGA A LA LOGICA X LA MIGRACION (YA QUE HAY GENTE A SE HA TOMADO DIAS Y NO SE LE HA CARGADO EL DETALLE..SALVO L&F)
      IF Obligatorio = 0 THEN
      	MESSAGE('COMPLETE LICENCIA VIGENTE', 'Licencia vigente incompleta',ICON:Exclamation,BUTTON:OK,1)
      	CYCLE.	
      !INICIALIZA LAS VARIABLES PARA EL FORMULARIO DE EMISION DE LICENCIA	
      DO PREPARAR_PARAMETROS
      !CALCULA DIAS FRACCIONADOS (DF)
      DO DIAS_FRACCIONADOS
    OF ?Change
      !VALIDA PARA INICIALIZAR VARIABLES QUE NECESITA EN EL FORM DE EMISION DE LICENCIA
      !SI LA EMISION DE LICENCIA NO ESTA ANULADA 
      IF  DLIC:DLIC_ESTADO = 'A' THEN
      	MESSAGE('No se puede modificar una Licencia que esta anulada', 'Modificar Licencia')
      	CYCLE
      END	
      IF  DLIC:DLIC_COBRAR = 'S' THEN
      	MESSAGE('No se puede modificar una Licencia que ya esta paga', 'Modificar Licencia')
      	CYCLE
      END	
      
      !INICIALIZA LAS VARIABLES PARA EL FORMULARIO DE EMISION DE LICENCIA	
      DO PREPARAR_PARAMETROS
      !CALCULA DIAS FRACCIONADOS (DF)
      DO DIAS_FRACCIONADOS
      
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EPL:EMP_LEGAJO
      IF EPL:EMP_LEGAJO OR ?EPL:EMP_LEGAJO{PROP:Req}
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        IF Access:EMPLEADOS.TryFetch(EPL:PK_EMPLEADOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
            CON:CONV_ID = EPL:EMP_CONVENIO
            LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
          ELSE
            CLEAR(CON:CONV_ID)
            CLEAR(LIC:LIC_LEGAJO)
            SELECT(?EPL:EMP_LEGAJO)
            CYCLE
          END
        ELSE
          CON:CONV_ID = EPL:EMP_CONVENIO
          LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
        END
      END
      ThisWindow.Reset(1)
    OF ?CallLookup
      ThisWindow.Update()
      !CtrlOblgatorio = 0
      clear(EPL:EMP_LEGAJO,1)
      post(event:accepted,?EPL:EMP_LEGAJO)
      EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        CON:CONV_ID = EPL:EMP_CONVENIO
        LIC:LIC_LEGAJO = EPL:EMP_LEGAJO
      END
      ThisWindow.Reset(1)
    OF ?Change
      ThisWindow.Update()
      !--CODIGO DEL TAKE NEW RECORD
      !DO VERIFICAR_OBLIG
      !
      !
      !VERIFICAR_OBLIG     ROUTINE
      !	OBLIGADO = 0
      !	LOOP I = 1 TO RECORDS(Q)
      !		IF TIENE SALDO    (LIC-TOMO) > 0   Y OBLIGADO = 0 THEN
      !			Q.OBLIG = 1
      !			OBLIGADO = 1
      !		ELSE
      !			Q.OBLIG = 0
      !		END
      !	    put (q)
      !		
      !	END
      !
      !	if obligado = 0 
      !		enableg(insert)
      !	else 
      !		disable insert
    OF ?BUTTON3
      ThisWindow.Update()
       CLEAR(DV:Record)
       DV:DV_LEGAJO = BRW4.Q.LIC:LIC_LEGAJO
       DV:DV_LICENCIA = BRW4.Q.LIC:LIC_ANIO
       GET(DIAS_VIAJE,DV:PK_DIAS_VIAJE)
       IF NOT ERROR() THEN
      	!MESSAGE('CHANGE')
      	IF DLIC:DLIC_VIAJE ='C' OR DLIC:DLIC_VIAJE ='P' THEN
      		GlobalRequest = ChangeRecord
      		FormDiasdeViaje(DLIC:DLIC_LEGAJO,DLIC:DLIC_ANIO,DLIC:DLIC_INICIO_DATE,DLIC:DLIC_FIN_DATE)
      	ELSE 
      		GlobalRequest = ViewRecord
      		FormDiasdeViaje(DLIC:DLIC_LEGAJO,DLIC:DLIC_ANIO,DLIC:DLIC_INICIO_DATE,DLIC:DLIC_FIN_DATE)
      	END	
       ELSE
      	!MESSAGE('INSERT')
      	GlobalRequest = InsertRecord
      	FormDiasdeViaje(DLIC:DLIC_LEGAJO,DLIC:DLIC_ANIO,DLIC:DLIC_INICIO_DATE,DLIC:DLIC_FIN_DATE)	
       END	
      ThisWindow.Reset(1)
    OF ?BUTTON1
      ThisWindow.Update()
      !BOTON ANULAR LICENCIA
      IF DLIC:DLIC_VIAJE = '' OR DLIC:DLIC_VIAJE = 'N' THEN
      	DO ANULAR_VALORES_LICENCIA
      	!CtrlOblgatorio = 0
      	ThisWindow.Reset(1)
      ELSE 
      	MESSAGE('NO PUEDE ANULARSE - RESUELVA QUE VA A HACER CON LOS DIAS DE VIAJE')
      	CYCLE.
    OF ?BUTTON2
      ThisWindow.Update()
      !BOTON DESANULAR LICENCIA
      DO DESANULAR_VALORES_LICENCIA
      ThisWindow.Reset(1)
      !TODO VER DIAS DE VIAJE Y BARIABLE EN LICENCIA
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


BRW4.ResetFromView PROCEDURE

  CODE
  SETCURSOR(Cursor:Wait)
  Relate:LICENCIA.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
  END
  SELF.View{PROP:IPRequestCount} = 0
  PARENT.ResetFromView
  !MESSAGE('RESETFROMVIEW')
  SetObligatorio = 0
  CtrlOblgatorio = 0
  
  loop i# = 1 to records(brw4.q)
  	get(brw4.q,i#)
  	IF SetObligatorio = 0 AND (brw4.q.LIC:LIC_DIAS - brw4.q.DiasTomados) > 0  THEN
  		brw4.q.Obligatorio = 1
  		SetObligatorio = 1
  	ELSE
  		brw4.q.Obligatorio = 0
  	END
  	put(brw4.q)
  end
  	
  Relate:LICENCIA.SetQuickScan(0)
  SETCURSOR()


BRW4.SetQueueRecord PROCEDURE

  CODE
  !message('SETQUEVE')
  DO CALCULAR_DIAS_TOMADOS
  !MESSAGE('LUEGO')
  DiasRestan = Loc:dias_restan
  DiasTomados = Dias_Tomados
  
  
  PARENT.SetQueueRecord
  


BRW4.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
  !MESSAGE('NEWSELECTION')
  !DESHABILITA O HABILITA LOS BOTONES DE ANULAR SI NO HAY LICENCIAS EMITIDAS
  
  IF RECORDS(BRW5.Q) = 0 THEN
  	DISABLE(?BUTTON1)
  	DISABLE(?BUTTON2)
  	DISABLE(?BUTTON3)
  ELSE
  	ENABLE(?BUTTON1)
  	ENABLE(?BUTTON2)
  END


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW5.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !MESSAGE('RESETFROMFILE')
  !REFRESCA LOS CAMBIOS EIP DE LICENCIAS
  IF VCRRequest=VCR:None
  CASE Request
  OF ChangeRecord OROF InsertRecord
      IF Response = RequestCompleted
      !Hacer algún proceso
  		!BRW4.ResetfromBuffer() 
  		!ThisWindow.Reset(1)
  		!BRW4.ResetFromFile()
  		!POST(EVENT:ScrollBottom,?List)
  		ThisWindow.Reset(1)
      END
  END
  END!


BRW5.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (DLIC:DLIC_ESTADO = 'A')
    SELF.Q.DLIC:DLIC_LEGAJO_NormalFG = 255                 ! Set conditional color values for DLIC:DLIC_LEGAJO
    SELF.Q.DLIC:DLIC_LEGAJO_NormalBG = -1
    SELF.Q.DLIC:DLIC_LEGAJO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_LEGAJO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ANIO_NormalFG = 255                   ! Set conditional color values for DLIC:DLIC_ANIO
    SELF.Q.DLIC:DLIC_ANIO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ANIO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ANIO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_NormalFG = 255            ! Set conditional color values for DLIC:DLIC_INICIO_DATE
    SELF.Q.DLIC:DLIC_INICIO_DATE_NormalBG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_NormalFG = 255               ! Set conditional color values for DLIC:DLIC_FIN_DATE
    SELF.Q.DLIC:DLIC_FIN_DATE_NormalBG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_TOMA_NormalFG = 255                   ! Set conditional color values for DLIC:DLIC_TOMA
    SELF.Q.DLIC:DLIC_TOMA_NormalBG = -1
    SELF.Q.DLIC:DLIC_TOMA_SelectedFG = -1
    SELF.Q.DLIC:DLIC_TOMA_SelectedBG = -1
    SELF.Q.DLIC:DLIC_COBRAR_NormalFG = 255                 ! Set conditional color values for DLIC:DLIC_COBRAR
    SELF.Q.DLIC:DLIC_COBRAR_NormalBG = -1
    SELF.Q.DLIC:DLIC_COBRAR_SelectedFG = -1
    SELF.Q.DLIC:DLIC_COBRAR_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_NormalFG = 255                ! Set conditional color values for DLIC:DLIC_ASUELDO
    SELF.Q.DLIC:DLIC_ASUELDO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_VIAJE_NormalFG = 255                  ! Set conditional color values for DLIC:DLIC_VIAJE
    SELF.Q.DLIC:DLIC_VIAJE_NormalBG = -1
    SELF.Q.DLIC:DLIC_VIAJE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_VIAJE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ESTADO_NormalFG = 255                 ! Set conditional color values for DLIC:DLIC_ESTADO
    SELF.Q.DLIC:DLIC_ESTADO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ESTADO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ESTADO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_NormalFG = 255            ! Set conditional color values for DLIC:DLIC_INICIO_TIME
    SELF.Q.DLIC:DLIC_INICIO_TIME_NormalBG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_SelectedFG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_SelectedBG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_NormalFG = 255               ! Set conditional color values for DLIC:DLIC_FIN_TIME
    SELF.Q.DLIC:DLIC_FIN_TIME_NormalBG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_SelectedFG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_SelectedBG = -1
  ELSIF ((DLIC:DLIC_VIAJE = 'C' OR DLIC:DLIC_VIAJE = 'P' OR DLIC:DLIC_VIAJE = 'S') AND ADLIC:DLIC_ESTADO <> 'A')
    SELF.Q.DLIC:DLIC_LEGAJO_NormalFG = 49152               ! Set conditional color values for DLIC:DLIC_LEGAJO
    SELF.Q.DLIC:DLIC_LEGAJO_NormalBG = -1
    SELF.Q.DLIC:DLIC_LEGAJO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_LEGAJO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ANIO_NormalFG = 49152                 ! Set conditional color values for DLIC:DLIC_ANIO
    SELF.Q.DLIC:DLIC_ANIO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ANIO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ANIO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_NormalFG = 49152          ! Set conditional color values for DLIC:DLIC_INICIO_DATE
    SELF.Q.DLIC:DLIC_INICIO_DATE_NormalBG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_NormalFG = 49152             ! Set conditional color values for DLIC:DLIC_FIN_DATE
    SELF.Q.DLIC:DLIC_FIN_DATE_NormalBG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_TOMA_NormalFG = 49152                 ! Set conditional color values for DLIC:DLIC_TOMA
    SELF.Q.DLIC:DLIC_TOMA_NormalBG = -1
    SELF.Q.DLIC:DLIC_TOMA_SelectedFG = -1
    SELF.Q.DLIC:DLIC_TOMA_SelectedBG = -1
    SELF.Q.DLIC:DLIC_COBRAR_NormalFG = 49152               ! Set conditional color values for DLIC:DLIC_COBRAR
    SELF.Q.DLIC:DLIC_COBRAR_NormalBG = -1
    SELF.Q.DLIC:DLIC_COBRAR_SelectedFG = -1
    SELF.Q.DLIC:DLIC_COBRAR_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_NormalFG = 49152              ! Set conditional color values for DLIC:DLIC_ASUELDO
    SELF.Q.DLIC:DLIC_ASUELDO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_VIAJE_NormalFG = 49152                ! Set conditional color values for DLIC:DLIC_VIAJE
    SELF.Q.DLIC:DLIC_VIAJE_NormalBG = -1
    SELF.Q.DLIC:DLIC_VIAJE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_VIAJE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ESTADO_NormalFG = 49152               ! Set conditional color values for DLIC:DLIC_ESTADO
    SELF.Q.DLIC:DLIC_ESTADO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ESTADO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ESTADO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_NormalFG = 49152          ! Set conditional color values for DLIC:DLIC_INICIO_TIME
    SELF.Q.DLIC:DLIC_INICIO_TIME_NormalBG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_SelectedFG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_SelectedBG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_NormalFG = 49152             ! Set conditional color values for DLIC:DLIC_FIN_TIME
    SELF.Q.DLIC:DLIC_FIN_TIME_NormalBG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_SelectedFG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_SelectedBG = -1
  ELSE
    SELF.Q.DLIC:DLIC_LEGAJO_NormalFG = -1                  ! Set color values for DLIC:DLIC_LEGAJO
    SELF.Q.DLIC:DLIC_LEGAJO_NormalBG = -1
    SELF.Q.DLIC:DLIC_LEGAJO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_LEGAJO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ANIO_NormalFG = -1                    ! Set color values for DLIC:DLIC_ANIO
    SELF.Q.DLIC:DLIC_ANIO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ANIO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ANIO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_NormalFG = -1             ! Set color values for DLIC:DLIC_INICIO_DATE
    SELF.Q.DLIC:DLIC_INICIO_DATE_NormalBG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_INICIO_DATE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_NormalFG = -1                ! Set color values for DLIC:DLIC_FIN_DATE
    SELF.Q.DLIC:DLIC_FIN_DATE_NormalBG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_FIN_DATE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_TOMA_NormalFG = -1                    ! Set color values for DLIC:DLIC_TOMA
    SELF.Q.DLIC:DLIC_TOMA_NormalBG = -1
    SELF.Q.DLIC:DLIC_TOMA_SelectedFG = -1
    SELF.Q.DLIC:DLIC_TOMA_SelectedBG = -1
    SELF.Q.DLIC:DLIC_COBRAR_NormalFG = -1                  ! Set color values for DLIC:DLIC_COBRAR
    SELF.Q.DLIC:DLIC_COBRAR_NormalBG = -1
    SELF.Q.DLIC:DLIC_COBRAR_SelectedFG = -1
    SELF.Q.DLIC:DLIC_COBRAR_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_NormalFG = -1                 ! Set color values for DLIC:DLIC_ASUELDO
    SELF.Q.DLIC:DLIC_ASUELDO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ASUELDO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_VIAJE_NormalFG = -1                   ! Set color values for DLIC:DLIC_VIAJE
    SELF.Q.DLIC:DLIC_VIAJE_NormalBG = -1
    SELF.Q.DLIC:DLIC_VIAJE_SelectedFG = -1
    SELF.Q.DLIC:DLIC_VIAJE_SelectedBG = -1
    SELF.Q.DLIC:DLIC_ESTADO_NormalFG = -1                  ! Set color values for DLIC:DLIC_ESTADO
    SELF.Q.DLIC:DLIC_ESTADO_NormalBG = -1
    SELF.Q.DLIC:DLIC_ESTADO_SelectedFG = -1
    SELF.Q.DLIC:DLIC_ESTADO_SelectedBG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_NormalFG = -1             ! Set color values for DLIC:DLIC_INICIO_TIME
    SELF.Q.DLIC:DLIC_INICIO_TIME_NormalBG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_SelectedFG = -1
    SELF.Q.DLIC:DLIC_INICIO_TIME_SelectedBG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_NormalFG = -1                ! Set color values for DLIC:DLIC_FIN_TIME
    SELF.Q.DLIC:DLIC_FIN_TIME_NormalBG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_SelectedFG = -1
    SELF.Q.DLIC:DLIC_FIN_TIME_SelectedBG = -1
  END


BRW5.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
  !MESSAGE('NEWSELECTIONDL')
  !CONDICION QUE EVALUA LAS LICENCIAS EMITIDAS QUE SE PUEDEN ANULAR
  IF DLIC:DLIC_VIAJE = 'P' OR DLIC:DLIC_VIAJE = 'S' OR DLIC:DLIC_VIAJE = 'C' OR DLIC:DLIC_COBRAR = 'S' THEN
  	HIDE(?BUTTON1)
  	HIDE(?BUTTON2)
  ELSE	
  	IF DLIC:DLIC_ESTADO = 'A' THEN
  		!MOSTRAR EL BOTON DESANULAR Y ESCONDER EL ANULAR
  		HIDE(?BUTTON1)
  		UNHIDE(?BUTTON2)
  		!ENABLE(?BUTTON2)
  	ELSE
  		!MOSTRAR EL BOTON ANULAR Y ESCONDER EL DESANULAR
  		HIDE(?BUTTON2)
  		UNHIDE(?BUTTON1)
  		!ENABLE(?BUTTON1)
  	END	
  END	
  IF DLIC:DLIC_ESTADO <> 'A' AND EPL:EMP_CONVENIO = 1 AND RECORDS(BRW5.Q) > 0 THEN
  	DO PREPARAR_PARAMETROS
  	DO HABILITA_DIAS_VIAJE
  END	
  
  !IF LIC:LIC_DIAS_VIAJE = 'P' OR LIC:LIC_DIAS_VIAJE = 'S' OR LIC:LIC_DIAS_VIAJE = 'C' THEN
  !	?BUTTON3{PROP:FontColor} = COLOR:Green
  !ELSE
  !	?BUTTON3{PROP:FontColor} = COLOR:Navy
  !END
  
  !DESHABILITA EL BOTON DE BORRAR
  !DISABLE(?Delete)


BRW5.UpdateWindow PROCEDURE

  CODE
  PARENT.UpdateWindow
  !MESSAGE('UPDATE')
  !DESHABILITA EL BORRADO	
  HIDE(?Delete)
  DISABLE(?BUTTON3)
  !DISABLE(?BUTTON1)
  !DISABLE(?BUTTON2)
  !BRW5.DeleteControl = FALSE

!!! <summary>
!!! Generated from procedure template - Window
!!! Form DETALLE_LICENCIA
!!! </summary>
FormSolicitudLicencia PROCEDURE (string LCobro, short DRestan,string TDias,short Semana,short Convenio,short DFraccionados,short DTomados)

FechaInicial         DATE                                  !
ControlDV            STRING(1)                             !
DVOK1                STRING(1)                             !
DIAS_DUPLICADOS      STRING(1)                             !
DVOK2                STRING(1)                             !
FechaFinal           DATE                                  !
LICENCIA_VALIDA      STRING('''''@s1 {15}')                !
LOC:LEGAJO           SHORT                                 !
LOC:LICENCIA         SHORT                                 !
FECHA_VALIDA         STRING('S {19}')                      !
DIAS_FRACCIONADOS    SHORT                                 !
CurrentTab           STRING(80)                            !
Loc:Convenio         SHORT                                 !
Dias_Tomados         SHORT(0)                              !
Loc:Dias_Pagan       SHORT(0)                              !
Loc:dias_restan      SHORT                                 !
Loc:dias_toma_history SHORT                                !
ActionMessage        CSTRING(40)                           !
Habiles              SHORT                                 !
DIASVIAJE            SHORT                                 !
Corridos             SHORT                                 !
Loc:Tipo_Dias        STRING(1)                             !
Loc:Semana           SHORT                                 !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::DLIC:Record LIKE(DLIC:RECORD),THREAD
QuickWindow          WINDOW('Solicitud de Licencia'),AT(,,245,242),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('FormSolicitudLicencia'), |
  SYSTEM
                       SHEET,AT(4,4,235,208),USE(?CurrentTab),FONT(,10,,FONT:bold)
                         TAB,USE(?Tab:1)
                           PROMPT('Fecha:'),AT(18,38),USE(?DLIC:DLIC_FECHA_DATE:Prompt)
                           ENTRY(@d17),AT(19,52,63,14),USE(DLIC:DLIC_FECHA_DATE),CENTER,FLAT
                           BUTTON,AT(85,52,14,14),USE(?Calendar:3)
                           PROMPT('Inicia:'),AT(18,79),USE(?DLIC:DLIC_INICIO_DATE:Prompt),TRN
                           ENTRY(@d17),AT(19,92,63,14),USE(DLIC:DLIC_INICIO_DATE),CENTER,FLAT
                           BUTTON,AT(85,92,14,14),USE(?Calendar)
                           PROMPT('Finaliza:'),AT(143,79),USE(?DLIC:DLIC_FIN_DATE:Prompt),TRN
                           ENTRY(@d17),AT(143,92,63,14),USE(DLIC:DLIC_FIN_DATE),CENTER,FLAT
                           BUTTON,AT(211,92,14,14),USE(?Calendar:2)
                           PROMPT('Toma (días):'),AT(18,124),USE(?DLIC:DLIC_TOMA:Prompt),TRN
                           ENTRY(@n02),AT(199,121,27,14),USE(DLIC:DLIC_TOMA),FONT(,12,COLOR:Red),CENTER,FLAT
                           CHECK('DLIC VIAJE:'),AT(228,118,-44,8),USE(DLIC:DLIC_VIAJE),VALUE('S','N')
                           STRING(@n02),AT(161,159,57),USE(Loc:dias_restan),FONT(,15,COLOR:Navy,FONT:bold),CENTER
                           STRING('(Días disponibles)'),AT(161,180),USE(?STRING1),FONT(,8,COLOR:Navy,FONT:regular),CENTER
                           GROUP('Adelantos'),AT(19,143,120,55),USE(?GROUP2),FONT(,10,,FONT:bold),BOXED
                             CHECK('Retribución'),AT(31,156,70,14),USE(DLIC:DLIC_COBRAR),VALUE('S','N')
                             CHECK('Sueldo'),AT(31,174,70,14),USE(DLIC:DLIC_ASUELDO),VALUE('S','N')
                           END
                           GROUP,AT(116,28,112,44),USE(?GROUP3),FONT(,10,,FONT:bold),BOXED
                             STRING(@n_7),AT(162,52,55),USE(LIC:LIC_LEGAJO),FONT(,12,COLOR:Red),RIGHT
                             PROMPT('Legajo'),AT(185,41,35),USE(?DLIC:DLIC_LEGAJO:Prompt),TRN
                             STRING(@n04),AT(125,52,34),USE(LIC:LIC_ANIO),FONT(,12,COLOR:Red),LEFT
                             PROMPT('Licencia'),AT(125,41),USE(?DLIC:DLIC_ANIO:Prompt),TRN
                           END
                         END
                       END
                       BUTTON('&Aceptar'),AT(52,219,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(132,219,55,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       ENTRY(@s1),AT(163,2,60,10),USE(LIC:LIC_DIAS_VIAJE),HIDE
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
Open                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar4            CalendarClass
Calendar7            CalendarClass
Calendar9            CalendarClass
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
DATOS_AUSENCIAS     ROUTINE
    DAU:DAU_NROLEG = DLIC:DLIC_LEGAJO
    DAU:DAU_ANIO = YEAR(DLIC:DLIC_INICIO_DATE)
    DAU:DAU_INICIO_DATE = DLIC:DLIC_INICIO_DATE
    DAU:DAU_DIAS = DLIC:DLIC_TOMA
    DAU:DAU_FIN_DATE = DLIC:DLIC_FIN_DATE
    IF Loc:Tipo_Dias = 'H' THEN
        DAU:DAU_CONDICION = 'Hábiles'
    ELSE
        DAU:DAU_CONDICION = 'Corridos'
    END
    DAU:DAU_MOTIVO = 'VA'
    DAU:DAU_DESCRIPCION = 'Vacaciones'
    DAU:DAU_OBSERVACIONES = 'Licencia correspondiente al año ' & DLIC:DLIC_ANIO
    DAU:DAU_ESTADO = 'P'
    DAU:DAU_FECHA_DATE = DLIC:DLIC_FECHA_DATE
    DAU:DAU_FECHA_TIME = DLIC:DLIC_FECHA_TIME
    DAU:DAU_FECHA_UPDATE_DATE = TODAY()
    DAU:DAU_FECHA_UPDATE_TIME = CLOCK()
    DAU:DAU_USUARIO = Glo:Usuario2
HABILITA_COBRA_ADELANTO     ROUTINE
	!IF LCobro <> 'P' AND LIC:LIC_COBRO <> 'S' THEN
	IF LIC:LIC_COBRO <> 'S' THEN
		IF DLIC:DLIC_TOMA >= Loc:Semana OR Loc:dias_restan < Loc:Semana OR (Dias_Tomados + DLIC:DLIC_TOMA) >= Loc:Semana THEN
			ENABLE(?DLIC:DLIC_COBRAR)
			DLIC:DLIC_COBRAR = 'P'
		ELSE
			DISABLE(?DLIC:DLIC_COBRAR)
			DLIC:DLIC_COBRAR = 'N'
		END	
	ELSE
		DISABLE(?DLIC:DLIC_COBRAR)
		DLIC:DLIC_COBRAR = 'N'
	END	
	
!CHECKEA_INICIO_DIAS_DE_VIAJE        ROUTINE
!!CHEQUEA SI LA CORRELATIVIDAD DE FIN DE LICENCIA CON INICIO DE DIAS DE VIAJE	
!	HViaje# = 0
!	loop diav# = DLIC:DLIC_FIN_DATE to BRW8.Q.DV:DV_DESDE_DATE !DV:DV_DESDE_DATE
!	 if (diav# % 7) = 0 then cycle. ! porque es domingo
!	 if (diav# % 7) = 6 then cycle. ! porque es sabado
!	 !
!	 ! busco si es feriado
!	 !
!	 clear(FERIADOS:record)
!		FER:DIAFERIADO_DATE = diav#
!		FER:DIAFERIADO_TIME = 0
!	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
!	 !
!		HViaje# += 1
!	end!loop
!
!	IF HViaje#  <> 2 THEN
!		DVOK1 = 'N'
!	ELSE
!		DVOK1 = 'S'
!	END	
!DIAS_DE_VIAJE       ROUTINE
!!CALCULA LA CANTIDAD DE DIAS DE VIAJE A PARTIR DE LA FECHA INICIO Y FIN DE DIAS DE VIAJE E INICIALIZA LA VARIABLE DIASVIAJE	
!	DIASVIAJE = 0
!	FechaFinal= BRW8.Q.DV:DV_HASTA_DATE
!	FechaInicial = BRW8.Q.DV:DV_DESDE_DATE
!	!loop dia# = FechaInicial to FechaFinal
!	loop dia# = FechaInicial to FechaFinal
!	 if (Dia# % 7) = 0 then cycle. ! porque es domingo
!	 if (Dia# % 7) = 6 then cycle. ! porque es sabado
!	 !
!	 ! busco si es feriado
!	 !
!	 clear(FERIADOS:record)
!	 FER:DIAFERIADO_DATE = dia#
!	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
!	 !
!	 DIASVIAJE += 1
!	end!loop
VALIDA_FECHAS       ROUTINE
!CONTROLA QUE LAS FECHAS NO SEAN VACIAS Y QUE LA FECHA DE INICIO SEA MENOR QUE LA FECHA FIN	
	FECHA_VALIDA = 'S'
	IF DLIC:DLIC_FIN_DATE < DLIC:DLIC_INICIO_DATE AND DLIC:DLIC_FIN_DATE <> 0
   		BEEP	
   		MESSAGE('La Fecha Finaliza no puede ser menor que la Fecha Inicial ', ' Error en la fechas ',ICON:Exclamation,BUTTON:CANCEL,1)		
   		SELECT(?DLIC:DLIC_FIN_DATE)
   		FECHA_VALIDA = 'N'
	END   
!HABILITA_DIAS_VIAJE ROUTINE
!!SI TIENE DIAS DE VIAJE Y NO SE LOS TOMO HABILITA EL GROUP DE DIAS DE VIAJE	
!!(TIENE EN CUENTA LOS DIAS Q TOMA Q DEBEN SER IGUAL O MAYOR A LA SEMANA O SER LOS ULTIMOS QUE TIENE PARA PODER TOMARSELO)
!	IF DV = 'S' THEN
!		IF dias = 'N' AND (DLIC:DLIC_TOMA >= Loc:Semana OR DLIC:DLIC_TOMA - Loc:dias_restan = 0) THEN
!			ENABLE(?GROUP1)
!		ELSE
!			DISABLE(?GROUP1)
!		END	
!	ELSE
!		DISABLE(?GROUP1)
!	END 
CHECK_LICENCIA      ROUTINE
!CHECKEA LA LICENCIA TENIENDO EN CUENTA LOS ESTATUTOS O ARREGLOS GREMIALES	
	LICENCIA_VALIDA = 'S'
	IF DLIC:DLIC_LEGAJO = 9140 THEN
		Loc:Convenio = 0 ! PARA NORMA ODDI
	END	
	CASE Loc:Convenio
		OF 1 OROF 0 !LUZ Y FUERZA/NORMA ODDI
		IF DLIC:DLIC_TOMA < Loc:Semana AND  DIAS_FRACCIONADOS + DLIC:DLIC_TOMA > 10  AND Loc:dias_restan >= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados ha completado su limite de 10 días' , ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 2 !COMERCIO
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 3 !UOCRA	
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 4 !SIPOS
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 5 !SANIDAD	
			IF (DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan >= Loc:Semana)  OR (DLIC:DLIC_TOMA - Loc:dias_restan <> 0 AND Loc:dias_restan <= Loc:Semana) THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana & ' o la totalidad de los días para finalizar la licencia.', ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 6 !FORESITRA
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 7 !UTA	
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 8 !APUAYE
			IF DLIC:DLIC_TOMA < Loc:Semana AND  DIAS_FRACCIONADOS + DLIC:DLIC_TOMA > 10  AND Loc:dias_restan >= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados ha completado su limite de 10 días ', ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 9 !TV	
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 10 !FATPREN
			IF DLIC:DLIC_TOMA < Loc:Semana AND  DIAS_FRACCIONADOS + DLIC:DLIC_TOMA > 10  AND Loc:dias_restan >= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados ha completado su limite de 10 días ', ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
		OF 11 !EXCLUIDO DE CONVENIO 	
			IF DLIC:DLIC_TOMA % Loc:Semana <> 0 AND Loc:dias_restan <> DLIC:DLIC_TOMA AND Loc:dias_restan <= Loc:Semana THEN
				MESSAGE('No se puede tomar días fraccionados menores a: ' & Loc:Semana, ' Error dìas fraccionados ',ICON:Exclamation,BUTTON:CANCEL,1)		
				LICENCIA_VALIDA = 'N'
			END	
	END
	
DIAS_HABILES        ROUTINE
!INICIALIZA LAS VARIABLES DE DIAS HABILES Y CORRIDOS PARA PODER CALCULAR LOS DIAS QUE TOMA A PARTIR DE LA FECHA DE INICIO Y FIN
	Habiles = 0
	loop dia# = DLIC:DLIC_INICIO_DATE to DLIC:DLIC_FIN_DATE
	 if (Dia# % 7) = 0 then cycle. ! porque es domingo
	 if (Dia# % 7) = 6 and Loc:Convenio <> 5 then cycle. ! porque es sabado
	 !
	 ! busco si es feriado
	 !
	 clear(FERIADOS:record)
		FER:DIAFERIADO_DATE = dia#
		FER:DIAFERIADO_TIME = 0
	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
	 !
	 Habiles += 1
	end!loop
	Corridos = DLIC:DLIC_FIN_DATE - DLIC:DLIC_INICIO_DATE + 1	
CHECKEA_DIAS_DUPLICADOS     ROUTINE
!VERIFICA SI LOS DIAS QUE ESTA TOMANDO NO CONSTAN EN OTRA LICENCIA	
	DIAS_DUPLICADOS = 'N'
	CLEAR(ADLIC:Record)
	ADLIC:DLIC_LEGAJO = DLIC:DLIC_LEGAJO
	ADLIC:DLIC_ANIO = DLIC:DLIC_ANIO
	SET(ADLIC:PK_DETALLE_LICENCIA,ADLIC:PK_DETALLE_LICENCIA)
	LOOP 
	!Until ACCESS:ADETALLE_LICENCIA.Next() OR ADLIC:DLIC_ANIO <> DLIC:DLIC_ANIO OR ADLIC:DLIC_LEGAJO <> DLIC:DLIC_LEGAJO
		NEXT(ADETALLE_LICENCIA)
		IF ERRORCODE() THEN BREAK.
		IF globalRequest <> ChangeRecord and ADLIC:DLIC_INICIO_DATE <> DLIC:DLIC_INICIO_DATE AND ADLIC:DLIC_FIN_DATE <> DLIC:DLIC_FIN_DATE AND ADLIC:DLIC_ANIO = DLIC:DLIC_ANIO AND ADLIC:DLIC_LEGAJO = DLIC:DLIC_LEGAJO THEN
			LOOP dia# = DLIC:DLIC_INICIO_DATE TO DLIC:DLIC_FIN_DATE
				IF INRANGE(dia#,ADLIC:DLIC_INICIO_DATE,ADLIC:DLIC_FIN_DATE) and ADLIC:DLIC_ESTADO <> 'A' THEN
					!MESSAGE('LEGAJO ' & DLIC:DLIC_LEGAJO & ' LICENCIA ' & DLIC:DLIC_ANIO & ' INICIO ' & DLIC:DLIC_INICIO_DATE & ' FIN ' & DLIC:DLIC_FIN_DATE )
					DIAS_DUPLICADOS = 'S'
					BREAK
				END			
			END	
		END
	END	

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Agregar Licencia'
  OF ChangeRecord
    ActionMessage = 'Modificar Licencia'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('FormSolicitudLicencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DLIC:DLIC_FECHA_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(DLIC:Record,History::DLIC:Record)
  SELF.AddHistoryField(?DLIC:DLIC_FECHA_DATE,21)
  SELF.AddHistoryField(?DLIC:DLIC_INICIO_DATE,5)
  SELF.AddHistoryField(?DLIC:DLIC_FIN_DATE,9)
  SELF.AddHistoryField(?DLIC:DLIC_TOMA,11)
  SELF.AddHistoryField(?DLIC:DLIC_VIAJE,14)
  SELF.AddHistoryField(?DLIC:DLIC_COBRAR,13)
  SELF.AddHistoryField(?DLIC:DLIC_ASUELDO,12)
  SELF.AddUpdateFile(Access:DETALLE_LICENCIA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ADETALLE_LICENCIA.Open                            ! File ADETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:FERIADOS.Open                                     ! File FERIADOS used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DETALLE_LICENCIA
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
    ?DLIC:DLIC_FECHA_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar:3)
    ?DLIC:DLIC_INICIO_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    ?DLIC:DLIC_FIN_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar:2)
    ?DLIC:DLIC_TOMA{PROP:ReadOnly} = True
    ?LIC:LIC_DIAS_VIAJE{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF ?DLIC:DLIC_COBRAR{Prop:Checked}
    DLIC:DLIC_COBRAR = 'P'
  END
  IF NOT ?DLIC:DLIC_COBRAR{PROP:Checked}
    DLIC:DLIC_COBRAR = 'N'
  END
  IF ?DLIC:DLIC_ASUELDO{Prop:Checked}
    DLIC:DLIC_ASUELDO = 'P'
  END
  IF NOT ?DLIC:DLIC_ASUELDO{PROP:Checked}
    DLIC:DLIC_ASUELDO = 'N'
  END
  SELF.SetAlerts()
  !Adelanto_Licencia,Uso_Dias_Viaje,Tiene_Dias_Viaje,Dias_Restan,Tipo_Dias,Semana,Conv,DF,Dias_Tomados,Dias_Pagan,Adelanto_Sueldo
  !Adelanto_Licencia,Uso_Dias_Viaje,Tiene_Dias_Viaje,Dias_Restan,Tipo_Dias,Semana,Conv,DF,Dias_Tomados,Dias_Pagan,Adelanto_Sueldo,licencia_cobro
  !String cobro,     string dias,    string dv,short DR,string Tipo_Dias,short Semana,short Convenio,short df,short dt,short dias_pagan,string sueldo
  !(string,string,string,short,string,short,short,short,short,short,string,string)
  !(string,string,string,sh11ort,string,short,short,short,short,short,string)
  
  
  !INICIALIZO LAS VARIABLES QUE TRAIGO DE LA LICENCIA Y QUE VOY A NECESITAR UTILIZAR EN EL FORM DE EMSION
  Loc:dias_restan = DRestan
  Loc:dias_toma_history = DLIC:DLIC_TOMA
  Loc:Tipo_Dias = TDias
  Loc:Semana = Semana
  Loc:Convenio = Convenio
  DIAS_FRACCIONADOS = DFraccionados
  Dias_Tomados = DTomados
  !Loc:Dias_Pagan = dias_pagan	
  
  !Habilita o Deshablita el campo de adelanto de sueldo para controlar la logica
  IF SELF.Request = InsertRecord THEN
  	Loc:dias_toma_history = 0
  	IF LCobro = 'N' AND Loc:Convenio <> 3 THEN
  		ENABLE(?DLIC:DLIC_COBRAR)
  	ELSE
  		DISABLE(?DLIC:DLIC_COBRAR)
  	END	
  END	
  
  !IF SELF.Request = ChangeRecord THEN
  !	Loc:dias_toma_history = DLIC:DLIC_TOMA
  !	IF LCobro <> 'S' AND LIC:LIC_COBRO = DLIC:DLIC_COBRAR AND Loc:Convenio <> 3 THEN
  !		MESSAGE(Loc:Semana)
  !		IF DLIC:DLIC_TOMA >= Loc:Semana THEN
  !			ENABLE(?DLIC:DLIC_COBRAR)
  !		ELSE
  !			DISABLE(?DLIC:DLIC_COBRAR)
  !		END 	
  !	ELSE
  !		DISABLE(?DLIC:DLIC_COBRAR)
  !	END	
  !END	
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ADETALLE_LICENCIA.Close
    Relate:DETALLE_AUSENCIA.Close
    Relate:DETALLE_LICENCIA.Close
    Relate:FERIADOS.Close
    Relate:LICENCIA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !DESHABILITO --> SI EL ADELANTO DE SUELDO FUE PROCESADO sueldo = 'S' NO SE LO PERMITO MODIFICAR
  IF  DLIC:DLIC_ASUELDO = 'S' THEN
  	DISABLE(?DLIC:DLIC_ASUELDO)
  END	
  IF SELF.Request = ChangeRecord THEN
  	Loc:dias_toma_history = DLIC:DLIC_TOMA
  	IF LCobro <> 'S'  AND Loc:Convenio <> 3 THEN !AND LIC:LIC_COBRO = DLIC:DLIC_COBRAR
  		IF DLIC:DLIC_TOMA >= Loc:Semana THEN
  			ENABLE(?DLIC:DLIC_COBRAR)
  		ELSE
  			DISABLE(?DLIC:DLIC_COBRAR)
  		END 	
  	ELSE
  		DISABLE(?DLIC:DLIC_COBRAR)
  	END	
  END	


ThisWindow.PrimeFields PROCEDURE

  CODE
  DLIC:DLIC_LEGAJO = LIC:LIC_LEGAJO
  DLIC:DLIC_ANIO = LIC:LIC_ANIO
  DLIC:DLIC_FECHA_DATE = TODAY()
  DLIC:DLIC_FECHA_TIME = CLOCK()
  DLIC:DLIC_ESTADO = 'O'
  DLIC:DLIC_VIAJE = 'N'
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
    CASE ACCEPTED()
    OF ?DLIC:DLIC_INICIO_DATE
      DO VALIDA_FECHAS
      
      IF FECHA_VALIDA = 'N' THEN
      	CYCLE.
      DO DIAS_HABILES
      IF Loc:Tipo_Dias = 'H' THEN
      	DLIC:DLIC_TOMA = HABILES
      ELSE
      	DLIC:DLIC_TOMA = CORRIDOS
      END	
      DISPLAY(?DLIC:DLIC_TOMA)
      
      IF DLIC:DLIC_INICIO_DATE <> 0 AND DLIC:DLIC_FIN_DATE <> 0 THEN
      	DO HABILITA_COBRA_ADELANTO
      	DISPLAY(?DLIC:DLIC_COBRAR)
      END	
    OF ?DLIC:DLIC_FIN_DATE
      DO VALIDA_FECHAS
      IF FECHA_VALIDA = 'N' THEN
      	CYCLE.
      DO DIAS_HABILES
      IF Loc:Tipo_Dias = 'H' THEN
      	DLIC:DLIC_TOMA = HABILES
      ELSE
      	DLIC:DLIC_TOMA = CORRIDOS
      END	
      DISPLAY(?DLIC:DLIC_TOMA)
      
      IF DLIC:DLIC_INICIO_DATE <> 0 AND DLIC:DLIC_FIN_DATE <> 0 THEN
      	DO HABILITA_COBRA_ADELANTO
      	DISPLAY(?DLIC:DLIC_COBRAR)
      END	
    OF ?OK
      !SI NO VALIDA CYLE
      IF DLIC:DLIC_INICIO_DATE = 0
         MESSAGE('La Fecha de Inicio no puede ser vacía ', ' Error en la fechas ',ICON:Exclamation,BUTTON:CANCEL,1)		
         SELECT(?DLIC:DLIC_INICIO_DATE)
         CYCLE	
      END	
      IF  DLIC:DLIC_FIN_DATE = 0
         MESSAGE('La Fecha Finaliza no puede ser vacía', ' Error en la fechas ',ICON:Exclamation,BUTTON:CANCEL,1)		
         SELECT(?DLIC:DLIC_FIN_DATE)
         CYCLE	
      END	
      DO VALIDA_FECHAS
      IF FECHA_VALIDA = 'N' THEN
      	CYCLE.
      
      DLIC:DLIC_LEGAJO = LIC:LIC_LEGAJO
      DLIC:DLIC_ANIO = LIC:LIC_ANIO
      DLIC:DLIC_FECHA_UPDATE_DATE = TODAY()
      DLIC:DLIC_FECHA_UPDATE_TIME = CLOCK()
      DLIC:DLIC_USER = Glo:Usuario2
      DLIC:DLIC_FECHA_TIME = 0
      
      
      DO CHECK_LICENCIA
      ! SI EL CHEQUEO NO DA BIEN....CYBLE
      IF LICENCIA_VALIDA <> 'S'  THEN
      	CYCLE.
      !
      !CHECKEA SI ALGUNO DE LOS DIAS Q TOMA NO SON PARTE DE OTRA LICENCIA
      DO CHECKEA_DIAS_DUPLICADOS
      IF DIAS_DUPLICADOS = 'S'	
         MESSAGE('Alguno de los días pueden ser parte de otra Licencia ', ' Días duplicados ',ICON:Exclamation,BUTTON:CANCEL,1)		
         SELECT(?DLIC:DLIC_INICIO_DATE)
      
      	CYCLE.
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DLIC:DLIC_FECHA_DATE
      !FECHA DE SOLICITUD DE LICENCIA NO PUEDE SER VACIA
      	IF DLIC:DLIC_FECHA_DATE = 0
      	   BEEP	
      	   MESSAGE('Debe ingresar una Fecha de Solicitud de Licencia ', ' Falta Fecha de Solicitud ',ICON:Exclamation,BUTTON:CANCEL,1)		
      	   SELECT(?DLIC:DLIC_FECHA_DATE)
      	END  
    OF ?Calendar:3
      ThisWindow.Update()
      Calendar9.SelectOnClose = True
      Calendar9.Ask('Seleccione Fecha de Solicitud',DLIC:DLIC_FECHA_DATE)
      IF Calendar9.Response = RequestCompleted THEN
      DLIC:DLIC_FECHA_DATE=Calendar9.SelectedDate
      DISPLAY(?DLIC:DLIC_FECHA_DATE)
      END
      ThisWindow.Reset(True)
    OF ?Calendar
      ThisWindow.Update()
      Calendar4.SelectOnClose = True
      Calendar4.Ask('Seleccione Fecha Incio',DLIC:DLIC_INICIO_DATE)
      IF Calendar4.Response = RequestCompleted THEN
      DLIC:DLIC_INICIO_DATE=Calendar4.SelectedDate
      DISPLAY(?DLIC:DLIC_INICIO_DATE)
      END
      ThisWindow.Reset(True)
      DO VALIDA_FECHAS
      IF FECHA_VALIDA = 'N' THEN
      	CYCLE.
      DO DIAS_HABILES
      
      IF Loc:Tipo_Dias = 'H' THEN
      	DLIC:DLIC_TOMA = HABILES
      ELSE
      	DLIC:DLIC_TOMA = CORRIDOS
      END	
      DISPLAY(?DLIC:DLIC_TOMA)
      
      IF DLIC:DLIC_INICIO_DATE <> 0 AND DLIC:DLIC_FIN_DATE <> 0 THEN
      	DO HABILITA_COBRA_ADELANTO
      	DISPLAY(?DLIC:DLIC_COBRAR)
      END	
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar7.SelectOnClose = True
      Calendar7.Ask('Seleccione Fecha Finaliza',DLIC:DLIC_FIN_DATE)
      IF Calendar7.Response = RequestCompleted THEN
      DLIC:DLIC_FIN_DATE=Calendar7.SelectedDate
      DISPLAY(?DLIC:DLIC_FIN_DATE)
      END
      ThisWindow.Reset(True)
      DO VALIDA_FECHAS
      IF FECHA_VALIDA = 'N' THEN
      	CYCLE.
      DO DIAS_HABILES
      
      IF Loc:Tipo_Dias = 'H' THEN
      	DLIC:DLIC_TOMA = HABILES
      ELSE
      	DLIC:DLIC_TOMA = CORRIDOS
      END	
      DISPLAY(?DLIC:DLIC_TOMA)
      DISPLAY()
      
      IF DLIC:DLIC_INICIO_DATE <> 0 AND DLIC:DLIC_FIN_DATE <> 0 THEN
      	DO HABILITA_COBRA_ADELANTO
      	DISPLAY(?DLIC:DLIC_COBRAR)
      END	
      	
    OF ?DLIC:DLIC_TOMA
      ThisWindow.Reset(1)
      DISPLAY(?Loc:dias_restan)
      IF DLIC:DLIC_TOMA > Loc:dias_restan and DLIC:DLIC_TOMA <> Loc:dias_toma_history
         BEEP	
         MESSAGE('Los días que toma no pueden ser mayor de los días disponibles para tomar ', ' Error en la fechas ',ICON:Exclamation,BUTTON:CANCEL,1)		
         SELECT(?DLIC:DLIC_TOMA)
         CYCLE
      END   
      IF (Loc:Tipo_Dias = 'H' AND DLIC:DLIC_TOMA <> HABILES) OR (Loc:Tipo_Dias = 'C'  AND DLIC:DLIC_TOMA <> CORRIDOS) THEN
         BEEP	
         MESSAGE('Error: No coinciden las Fechas con los Días que toma ', ' Error en la fechas ',ICON:Exclamation,BUTTON:CANCEL,1)		
         SELECT(?DLIC:DLIC_TOMA)
         CYCLE	
      END 	
    OF ?DLIC:DLIC_COBRAR
      IF ?DLIC:DLIC_COBRAR{PROP:Checked}
        DLIC:DLIC_COBRAR = 'P'
      END
      IF NOT ?DLIC:DLIC_COBRAR{PROP:Checked}
        DLIC:DLIC_COBRAR = 'N'
      END
      ThisWindow.Reset()
    OF ?DLIC:DLIC_ASUELDO
      IF ?DLIC:DLIC_ASUELDO{PROP:Checked}
        DLIC:DLIC_ASUELDO = 'P'
      END
      IF NOT ?DLIC:DLIC_ASUELDO{PROP:Checked}
        DLIC:DLIC_ASUELDO = 'N'
      END
      ThisWindow.Reset()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      !SI VALIDA GRAVA EN LICENCIA LOS VALORES QUE DEBE MODIFICAR
      IF SELF.Request = ChangeRecord OR SELF.Request = InsertRecord
      	CLEAR(LIC:Record)
      	LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
      	LIC:LIC_ANIO = DLIC:DLIC_ANIO
      	GET(LICENCIA,LIC:PK_LICENCIA)
      	IF NOT errorcode()
      		IF LIC:LIC_COBRO <> 'S' THEN 
      			IF  DLIC:DLIC_COBRAR = 'P' THEN 
      				LIC:LIC_COBRO = 'P'
      			END		
      			LIC:LIC_FECHA_UPDATE_DATE = TODAY()
      			LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
      			LIC:LIC_USER = Glo:Usuario2
                  Access:LICENCIA.Update()
      		END			
          END
          DO DATOS_AUSENCIAS
          Access:DETALLE_AUSENCIA.Insert()
          IF NOT ERRORCODE() THEN
              MESSAGE('Se generó la AUSENCIA')
          ELSE
              MESSAGE('Error al generar la AUSENCIA')
          END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Form DIAS_VIAJE
!!! </summary>
FormDiasdeViaje PROCEDURE (short legajo,short licencia,date inicio,date fin)

Anular               STRING(1)                             !
Loc:legajo           SHORT                                 !
DVOK1                STRING(1)                             !
Loc:licencia         SHORT                                 !
DVOK1_Copy           STRING(1)                             !
DIASVIAJE            SHORT                                 !
FechaInicial         DATE                                  !
FechaFinal           DATE                                  !
DVEstado             STRING(1)                             !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::DV:Record   LIKE(DV:RECORD),THREAD
QuickWindow          WINDOW('Días de viaje - Licencia'),AT(,,204,174),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('FormDiasdeViaje'), |
  SYSTEM
                       SHEET,AT(4,4,196,139),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           ENTRY(@n-7),AT(72,5,40,10),USE(DV:DV_LEGAJO),HIDE
                           PROMPT('Desde'),AT(15,28),USE(?DV:DV_DESDE_DATE:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@d17),AT(15,42,63,14),USE(DV:DV_DESDE_DATE),FONT(,10,,FONT:bold),CENTER,FLAT
                           PROMPT('Hasta'),AT(109,28),USE(?DV:DV_HASTA_DATE:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@d17),AT(109,42,63,14),USE(DV:DV_HASTA_DATE),FONT(,10,,FONT:bold),CENTER,FLAT
                           PROMPT('Días'),AT(15,63),USE(?DV:DV_DIAS:Prompt),FONT(,10,,FONT:bold),TRN
                           PROMPT('Observación (Lugar/km)'),AT(15,98),USE(?DV:DV_OBSERVACION:Prompt),FONT(,10,,FONT:bold), |
  TRN
                           ENTRY(@s30),AT(15,114,173,14),USE(DV:DV_OBSERVACION),FONT(,10,,FONT:bold),FLAT
                           BUTTON,AT(81,42,14,14),USE(?Calendar),FONT(,10)
                           BUTTON,AT(175,42,14,14),USE(?Calendar:2),FONT(,10,,FONT:bold)
                           CHECK(' Confirmado'),AT(70,78,64,14),USE(DVEstado),FONT(,10,,FONT:bold),RIGHT,VALUE('C','P')
                           SPIN(@n3),AT(15,78,,14),USE(DV:DV_DIAS),FONT(,10,,FONT:bold),FLAT,RANGE(2,6),STEP(2),READONLY
                           STRING(@d17),AT(140,80),USE(DV:DV_DEPOSITADO_DATE),FONT(,10,COLOR:Red,FONT:bold),CENTER
                           PROMPT('Depositado'),AT(140,65),USE(?DV:DV_DIAS:Prompt:2),FONT(,10,,FONT:bold),TRN
                         END
                       END
                       BUTTON('&Aceptar'),AT(65,150,60,16),USE(?Ok),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(135,150,64,16),USE(?Cancel),FONT(,10,,FONT:regular),LEFT,ICON('WACANCEL.ICO'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
                       ENTRY(@n-7),AT(136,3,40,10),USE(DV:DV_LICENCIA),HIDE
                       CHECK(' Anular'),AT(8,152),USE(Anular),FONT(,10,COLOR:Red,FONT:bold),VALUE('S','N')
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
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar8            CalendarClass
Calendar9            CalendarClass
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
CHECKEA_INICIO_DIAS_DE_VIAJE        ROUTINE
!CHEQUEA SI LA CORRELATIVIDAD DE FIN DE LICENCIA CON INICIO DE DIAS DE VIAJE	
	HViaje# = 0
	loop diav# = fin to DV:DV_DESDE_DATE !DV:DV_DESDE_DATE
	 if (diav# % 7) = 0 then cycle. ! porque es domingo
	 if (diav# % 7) = 6 then cycle. ! porque es sabado
	 !
	 ! busco si es feriado
	 !
	 clear(FERIADOS:record)
		FER:DIAFERIADO_DATE = diav#
		FER:DIAFERIADO_TIME = 0
	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
	 !
		HViaje# += 1
	end!loop
	IF HViaje#  <= 2 THEN
		DVOK1 = 'N'
	ELSE
		DVOK1 = 'S'
	END	
DIAS_DE_VIAJE       ROUTINE
!CALCULA LA CANTIDAD DE DIAS DE VIAJE A PARTIR DE LA FECHA INICIO Y FIN DE DIAS DE VIAJE E INICIALIZA LA VARIABLE DIASVIAJE	
	DIASVIAJE = 0
	FechaFinal= DV:DV_HASTA_DATE
	FechaInicial = DV:DV_DESDE_DATE
	!loop dia# = FechaInicial to FechaFinal
	loop dia# = FechaInicial to FechaFinal
	 if (Dia# % 7) = 0 then cycle. ! porque es domingo
	 if (Dia# % 7) = 6 then cycle. ! porque es sabado
	 !
	 ! busco si es feriado
	 !
	 clear(FERIADOS:record)
	 FER:DIAFERIADO_DATE = dia#
	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
	 !
	 DIASVIAJE += 1
	end!loop

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Ver Días de Viaje'
  OF InsertRecord
    ActionMessage = 'Ingresa Días de Viaje'
  OF ChangeRecord
    ActionMessage = 'Modifica Días de Viaje'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('FormDiasdeViaje')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DV:DV_LEGAJO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(DV:Record,History::DV:Record)
  SELF.AddHistoryField(?DV:DV_LEGAJO,1)
  SELF.AddHistoryField(?DV:DV_DESDE_DATE,5)
  SELF.AddHistoryField(?DV:DV_HASTA_DATE,9)
  SELF.AddHistoryField(?DV:DV_OBSERVACION,12)
  SELF.AddHistoryField(?DV:DV_DIAS,11)
  SELF.AddHistoryField(?DV:DV_DEPOSITADO_DATE,19)
  SELF.AddHistoryField(?DV:DV_LICENCIA,2)
  SELF.AddUpdateFile(Access:DIAS_VIAJE)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:DIAS_VIAJE.Open                                   ! File DIAS_VIAJE used by this procedure, so make sure it's RelationManager is open
  Relate:FERIADOS.Open                                     ! File FERIADOS used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DIAS_VIAJE
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?Ok
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?DV:DV_LEGAJO{PROP:ReadOnly} = True
    ?DV:DV_DESDE_DATE{PROP:ReadOnly} = True
    ?DV:DV_HASTA_DATE{PROP:ReadOnly} = True
    ?DV:DV_OBSERVACION{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?Calendar:2)
    ?DV:DV_LICENCIA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  Anular = 'N'
  Loc:legajo = legajo
  Loc:licencia = licencia
  IF SELF.Request = ViewRecord THEN
  	DISABLE(?DVEstado)
  	DISABLE(?Anular)
  END	
  IF SELF.Request = ChangeRecord  THEN
  	IF DLIC:DLIC_VIAJE <> 'S' THEN
  		DVEstado = DLIC:DLIC_VIAJE
  	ELSE !NO PUEDE MODICAR O ANULAR DIAS DE VIAJE Q YA HAN SIDO PAGADOS
  		DISABLE(?DVEstado)
  		!DISABLE(?BUTTON2)
  		DISABLE(?Anular)
  	END	
  ELSIF SElf.Request = InsertRecord THEN
  	DISABLE(?Anular)
  END	
  
  	
  	
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_LICENCIA.Close
    Relate:DIAS_VIAJE.Close
    Relate:FERIADOS.Close
    Relate:LICENCIA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  DVEstado = 'P'
  DV:DV_DESDE_DATE = DLIC:DLIC_FIN_DATE + 1
  DV:DV_HASTA_DATE = DLIC:DLIC_FIN_DATE + 2
  DV:DV_DIAS = 2
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
    CASE ACCEPTED()
    OF ?Ok
      !CONTROLES
      DO CHECKEA_INICIO_DIAS_DE_VIAJE
      IF DVOK1 <> 'N' THEN
      	MESSAGE('Los dias de viaje deben ser hábiles correlativos al fin de la Licencia ', ' Error en Días de viaje ',ICON:Exclamation,BUTTON:CANCEL,1)		
      	CYCLE
      END	
       
      !2) CONTROLA QUE FECHA INICIO Y FIN DE DIAS DE VIAJE CORRESPONDA A LA CANTIDAD DE DIAS
      DO DIAS_DE_VIAJE
      IF DIASVIAJE <> DV:DV_DIAS THEN	
      	MESSAGE('La cantidad de dias de viaje no coinciden con las fechas ingresadas', ' Error en Días de viaje ',ICON:Exclamation,BUTTON:CANCEL,1)		
      	CYCLE
      END	
      IF Anular = 'S' THEN
      	CASE MESSAGE('Anular?','Anula',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
       
      	OF BUTTON:No                         !the window is System Modal,no copy ability
       		SELECT(?Anular)
      		CYCLE
       
      	OF BUTTON:Yes
      		SELF.Request = DeleteRecord	
      	END
      END	
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Seleccione Fecha Desde',DV:DV_DESDE_DATE)
      IF Calendar8.Response = RequestCompleted THEN
      DV:DV_DESDE_DATE=Calendar8.SelectedDate
      DISPLAY(?DV:DV_DESDE_DATE)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar9.SelectOnClose = True
      Calendar9.Ask('Seleccione Fecha Hasta',DV:DV_HASTA_DATE)
      IF Calendar9.Response = RequestCompleted THEN
      DV:DV_HASTA_DATE=Calendar9.SelectedDate
      DISPLAY(?DV:DV_HASTA_DATE)
      END
      ThisWindow.Reset(True)
    OF ?Ok
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      IF SELF.Request <> ViewRecord THEN	
      DLIC:DLIC_LEGAJO = Loc:legajo
      DLIC:DLIC_ANIO = Loc:licencia
      DLIC:DLIC_INICIO_DATE = inicio
      DLIC:DLIC_INICIO_TIME = 0
      DLIC:DLIC_FIN_DATE = fin
      DLIC:DLIC_FIN_TIME = 0
      GET(DETALLE_LICENCIA,DLIC:PK_DETALLE_LICENCIA)
      IF NOT errorcode()THEN
      	IF Anular = 'N' THEN	
      		DLIC:DLIC_VIAJE = DVEstado
      		DV:DV_FECHA_DATE = TODAY()
      		DV:DV_FECHA_TIME = 0
      		DV:DV_FECHA_UPDATE_DATE = TODAY()
      		DV:DV_FECHA_UPDATE_TIME = CLOCK()
      		DV:DV_USER = Glo:Usuario2	
      	ELSE !SI ESTA ANULANDO EL DIA DE VIAJE
      		DLIC:DLIC_VIAJE = 'N'
      	END	
      	PUT(DETALLE_LICENCIA)	
      	IF ERRORCODE() THEN
      		MESSAGE(ERRORCODE())
      		STOP()
      	ELSE
      		LIC:LIC_LEGAJO = Loc:legajo
      		LIC:LIC_ANIO = Loc:licencia
      		Access:LICENCIA.Fetch(LIC:PK_LICENCIA)
      		IF NOT ERROR()
      		   IF Anular = 'N' THEN
      				LIC:LIC_DIAS_VIAJE = DVEstado
      			ELSE
      				LIC:LIC_DIAS_VIAJE = 'N'
      			END	
      		   Access:LICENCIA.Update()
      			IF ERRORCODE() THEN
      				MESSAGE(ERRORCODE())
      				STOP()
      			END	
      		END
      	END	 
      END	
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PARAMETRO_DIAS_VIAJE file
!!! </summary>
KmDiasdeViaje PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(PARAMETRO_DIAS_VIAJE)
                       PROJECT(PRMV:PRMV_KMS)
                       PROJECT(PRMV:PRMV_DIAS)
                       PROJECT(PRMV:PRMV_GRAMIO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PRMV:PRMV_KMS          LIKE(PRMV:PRMV_KMS)            !List box control field - type derived from field
PRMV:PRMV_DIAS         LIKE(PRMV:PRMV_DIAS)           !List box control field - type derived from field
PRMV:PRMV_GRAMIO       LIKE(PRMV:PRMV_GRAMIO)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Dias de Viaje por Km'),AT(,,103,140),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('KmDiasdeViaje'),SYSTEM
                       LIST,AT(8,24,86,105),USE(?Browse:1),HVSCROLL,FLAT,FORMAT('36R(2)|M~KM~C(0)@n_7@40R(2)|M' & |
  '~DIAS~C(0)@n3@0R(2)|M~PRMV GRAMIO~C(0)@n-7@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he PARAMETRO_DIAS_VIAJE file')
                       BUTTON('&Select'),AT(8,144,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,96,132),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('KmDiasdeViaje')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PRMV:PRMV_KMS',PRMV:PRMV_KMS)                      ! Added by: BrowseBox(ABC)
  BIND('PRMV:PRMV_DIAS',PRMV:PRMV_DIAS)                    ! Added by: BrowseBox(ABC)
  BIND('PRMV:PRMV_GRAMIO',PRMV:PRMV_GRAMIO)                ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:PARAMETRO_DIAS_VIAJE.Open                         ! File PARAMETRO_DIAS_VIAJE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PARAMETRO_DIAS_VIAJE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PRMV:PK_PARAMETRO_DIAS_VIAJE)         ! Add the sort order for PRMV:PK_PARAMETRO_DIAS_VIAJE for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PRMV:PRMV_KMS,,BRW1)           ! Initialize the browse locator using  using key: PRMV:PK_PARAMETRO_DIAS_VIAJE , PRMV:PRMV_KMS
  BRW1.AddField(PRMV:PRMV_KMS,BRW1.Q.PRMV:PRMV_KMS)        ! Field PRMV:PRMV_KMS is a hot field or requires assignment from browse
  BRW1.AddField(PRMV:PRMV_DIAS,BRW1.Q.PRMV:PRMV_DIAS)      ! Field PRMV:PRMV_DIAS is a hot field or requires assignment from browse
  BRW1.AddField(PRMV:PRMV_GRAMIO,BRW1.Q.PRMV:PRMV_GRAMIO)  ! Field PRMV:PRMV_GRAMIO is a hot field or requires assignment from browse
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
    Relate:PARAMETRO_DIAS_VIAJE.Close
  END
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the DETALLE_LICENCIA File
!!! </summary>
AdelantoLicencia PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(DETALLE_LICENCIA)
                       PROJECT(DLIC:DLIC_ANIO)
                       PROJECT(DLIC:DLIC_ASUELDO)
                       PROJECT(DLIC:DLIC_COBRAR)
                       PROJECT(DLIC:DLIC_ESTADO)
                       PROJECT(DLIC:DLIC_FECHA_DATE)
                       PROJECT(DLIC:DLIC_FECHA_TIME)
                       PROJECT(DLIC:DLIC_FECHA_UPDATE_DATE)
                       PROJECT(DLIC:DLIC_FECHA_UPDATE_TIME)
                       PROJECT(DLIC:DLIC_FIN)
                       PROJECT(DLIC:DLIC_FIN_DATE)
                       PROJECT(DLIC:DLIC_FIN_TIME)
                       PROJECT(DLIC:DLIC_INICIO)
                       PROJECT(DLIC:DLIC_INICIO_DATE)
                       PROJECT(DLIC:DLIC_INICIO_TIME)
                       PROJECT(DLIC:DLIC_LEGAJO)
                       PROJECT(DLIC:DLIC_TOMA)
                       PROJECT(DLIC:DLIC_VIAJE)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Report DETALLE_LICENCIA'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('DETALLE_LICENCIA Report'),AT(250,1020,7750,10168),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE, |
  FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,7750,770),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report DETALLE_LICENCIA file'),AT(0,20,7750,220),USE(?ReportTitle),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,7750,430),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(775,350,0,430),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(1550,350,0,430),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(2325,350,0,430),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         LINE,AT(3100,350,0,430),USE(?HeaderLine:4),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,430),USE(?HeaderLine:5),COLOR(COLOR:Black)
                         LINE,AT(4650,350,0,430),USE(?HeaderLine:6),COLOR(COLOR:Black)
                         LINE,AT(5425,350,0,430),USE(?HeaderLine:7),COLOR(COLOR:Black)
                         LINE,AT(6200,350,0,430),USE(?HeaderLine:8),COLOR(COLOR:Black)
                         LINE,AT(6975,350,0,430),USE(?HeaderLine:9),COLOR(COLOR:Black)
                         STRING('DLIC LEGAJO'),AT(50,390,675,170),USE(?HeaderTitle:1),TRN
                         STRING('DLIC ANIO'),AT(825,390,675,170),USE(?HeaderTitle:2),TRN
                         STRING('DLIC INICIO DATE'),AT(1600,390,675,170),USE(?HeaderTitle:3),TRN
                         STRING('DLIC INICIO TIME'),AT(2375,390,675,170),USE(?HeaderTitle:4),TRN
                         STRING('DLIC FIN DATE'),AT(3150,390,675,170),USE(?HeaderTitle:5),TRN
                         STRING('DLIC FIN TIME'),AT(3925,390,675,170),USE(?HeaderTitle:6),TRN
                         STRING('DLIC TOMA'),AT(4700,390,675,170),USE(?HeaderTitle:7),TRN
                         STRING('DLIC ASUELDO'),AT(5475,390,675,170),USE(?HeaderTitle:8),TRN
                         STRING('DLIC COBRAR'),AT(6250,390,675,170),USE(?HeaderTitle:9),TRN
                         STRING('DLIC VIAJE'),AT(7025,390,675,170),USE(?HeaderTitle:10),TRN
                         STRING('DLIC FECHA UPDATE DATE'),AT(50,570,675,170),USE(?HeaderTitle:11),TRN
                         STRING('DLIC FECHA UPDATE TIME'),AT(825,570,675,170),USE(?HeaderTitle:12),TRN
                         STRING('DLIC FECHA DATE'),AT(1600,570,675,170),USE(?HeaderTitle:13),TRN
                         STRING('DLIC FECHA TIME'),AT(2375,570,675,170),USE(?HeaderTitle:14),TRN
                         STRING('DLIC ESTADO'),AT(3150,570,675,170),USE(?HeaderTitle:15),TRN
                       END
Detail                 DETAIL,AT(0,0,7750,500),USE(?Detail)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(775,0,0,500),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(1550,0,0,500),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(2325,0,0,500),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(3100,0,0,500),USE(?DetailLine:4),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,500),USE(?DetailLine:5),COLOR(COLOR:Black)
                         LINE,AT(4650,0,0,500),USE(?DetailLine:6),COLOR(COLOR:Black)
                         LINE,AT(5425,0,0,500),USE(?DetailLine:7),COLOR(COLOR:Black)
                         LINE,AT(6200,0,0,500),USE(?DetailLine:8),COLOR(COLOR:Black)
                         LINE,AT(6975,0,0,500),USE(?DetailLine:9),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,500),USE(?DetailLine:10),COLOR(COLOR:Black)
                         STRING(@n-7),AT(50,50,675,170),USE(DLIC:DLIC_LEGAJO),LEFT
                         STRING(@n-7),AT(825,50,675,170),USE(DLIC:DLIC_ANIO),LEFT
                         STRING(@d17),AT(1600,50,675,170),USE(DLIC:DLIC_INICIO_DATE),LEFT
                         STRING(@t7),AT(2375,50,675,170),USE(DLIC:DLIC_INICIO_TIME),LEFT
                         STRING(@d17),AT(3150,50,675,170),USE(DLIC:DLIC_FIN_DATE),LEFT
                         STRING(@t7),AT(3925,50,675,170),USE(DLIC:DLIC_FIN_TIME),LEFT
                         STRING(@n3),AT(4700,50,675,170),USE(DLIC:DLIC_TOMA),LEFT
                         CHECK('DLIC ASUELDO:'),AT(5475,50,675,170),USE(DLIC:DLIC_ASUELDO),VALUE('S','N')
                         CHECK('DLIC COBRAR:'),AT(6250,50,675,170),USE(DLIC:DLIC_COBRAR),VALUE('S','N')
                         STRING(@s1),AT(7025,50,675,170),USE(DLIC:DLIC_VIAJE),LEFT
                         STRING(@d17),AT(50,230,675,170),USE(DLIC:DLIC_FECHA_UPDATE_DATE),LEFT
                         STRING(@t7),AT(825,230,675,170),USE(DLIC:DLIC_FECHA_UPDATE_TIME),LEFT
                         STRING(@d17),AT(1600,230,675,170),USE(DLIC:DLIC_FECHA_DATE),LEFT
                         STRING(@t7),AT(2375,230,675,170),USE(DLIC:DLIC_FECHA_TIME),LEFT
                         STRING(@s1),AT(3150,230,675,170),USE(DLIC:DLIC_ESTADO),LEFT
                         LINE,AT(0,500,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
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
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
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
  GlobalErrors.SetProcedureName('AdelantoLicencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:DETALLE_LICENCIA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, DLIC:DLIC_LEGAJO)
  ThisReport.AddSortOrder(DLIC:PK_DETALLE_LICENCIA)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:DETALLE_LICENCIA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
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
    Relate:DETALLE_LICENCIA.Close
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

