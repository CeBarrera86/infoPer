

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
BrowseDEBITO_EMPLEADOS PROCEDURE 

CurrentTab           STRING(80)                            !
nregistros           LONG                                  !
BRW1::View:Browse    VIEW(DEBITO_EMPLEADOS)
                       PROJECT(DEB:DEB_LEGAJO)
                       PROJECT(DEB:DEB_CLIENTE)
                       PROJECT(DEB:DEB_SUMINISTRO)
                       PROJECT(DEB:DEB_EMPRESA)
                       PROJECT(DEB:DEB_SERVICIO)
                       JOIN(EPL:PK_EMPLEADOS,DEB:DEB_LEGAJO)
                         PROJECT(EPL:EMP_NOMBRE)
                         PROJECT(EPL:EMP_DESCUENTA_FACTURA)
                         PROJECT(EPL:EMP_LEGAJO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
DEB:DEB_LEGAJO         LIKE(DEB:DEB_LEGAJO)           !List box control field - type derived from field
DEB:DEB_LEGAJO_NormalFG LONG                          !Normal forground color
DEB:DEB_LEGAJO_NormalBG LONG                          !Normal background color
DEB:DEB_LEGAJO_SelectedFG LONG                        !Selected forground color
DEB:DEB_LEGAJO_SelectedBG LONG                        !Selected background color
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_NOMBRE_NormalFG LONG                          !Normal forground color
EPL:EMP_NOMBRE_NormalBG LONG                          !Normal background color
EPL:EMP_NOMBRE_SelectedFG LONG                        !Selected forground color
EPL:EMP_NOMBRE_SelectedBG LONG                        !Selected background color
EPL:EMP_DESCUENTA_FACTURA LIKE(EPL:EMP_DESCUENTA_FACTURA) !List box control field - type derived from field
EPL:EMP_DESCUENTA_FACTURA_NormalFG LONG               !Normal forground color
EPL:EMP_DESCUENTA_FACTURA_NormalBG LONG               !Normal background color
EPL:EMP_DESCUENTA_FACTURA_SelectedFG LONG             !Selected forground color
EPL:EMP_DESCUENTA_FACTURA_SelectedBG LONG             !Selected background color
DEB:DEB_CLIENTE        LIKE(DEB:DEB_CLIENTE)          !List box control field - type derived from field
DEB:DEB_CLIENTE_NormalFG LONG                         !Normal forground color
DEB:DEB_CLIENTE_NormalBG LONG                         !Normal background color
DEB:DEB_CLIENTE_SelectedFG LONG                       !Selected forground color
DEB:DEB_CLIENTE_SelectedBG LONG                       !Selected background color
DEB:DEB_SUMINISTRO     LIKE(DEB:DEB_SUMINISTRO)       !List box control field - type derived from field
DEB:DEB_SUMINISTRO_NormalFG LONG                      !Normal forground color
DEB:DEB_SUMINISTRO_NormalBG LONG                      !Normal background color
DEB:DEB_SUMINISTRO_SelectedFG LONG                    !Selected forground color
DEB:DEB_SUMINISTRO_SelectedBG LONG                    !Selected background color
DEB:DEB_EMPRESA        LIKE(DEB:DEB_EMPRESA)          !Primary key field - type derived from field
DEB:DEB_SERVICIO       LIKE(DEB:DEB_SERVICIO)         !Primary key field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW(' Debitos Empleados de Cooperativa'),AT(,,295,293),FONT('Microsoft Sans Serif',10,COLOR:Black, |
  FONT:bold),RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseDEBITO_EMPLEADOS'),SYSTEM
                       OPTION,AT(42,1,190,25),USE(glo:servicio),BOXED
                         RADIO(' Eléctrico'),AT(58,10),USE(?loc:servicio:Radio1),VALUE('1')
                         RADIO(' Telefonía'),AT(114,10),USE(?loc:servicio:Radio2),VALUE('2')
                         RADIO(' Televisión'),AT(171,10),USE(?loc:servicio:Radio3),VALUE('3')
                       END
                       LIST,AT(8,53,277,212),USE(?Browse:1),VSCROLL,COLOR(00CECED0h),FORMAT('34C(2)|M*~Legajo~' & |
  'C(0)@n_4@130L(2)|M*~Nombre~C(0)@s31@20C|M*~Desc~@s1@44R(2)|M*~Cliente~C(0)@n_7@58C(2' & |
  ')|M*~Suministro~C(0)@n_6@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records')
                       BUTTON('&Insertar'),AT(141,268,45,14),USE(?Insert:2),LEFT,ICON('wainsert.ico')
                       BUTTON('&Cambiar'),AT(189,268,49,14),USE(?Change:2),LEFT,ICON('wachange.ico'),DEFAULT
                       BUTTON('&Borrar'),AT(240,268,45,14),USE(?Delete:2),LEFT,ICON('wadelete.ico')
                       SHEET,AT(4,15,285,274),USE(?CurrentTab)
                         TAB(' '),USE(?Tab:2)
                           STRING(@n_6B),AT(15,40),USE(DEB:DEB_LEGAJO),FONT(,,,FONT:regular,CHARSET:ANSI)
                           STRING(' clickear en los titulos de las columnas para ordenar '),AT(47,40),USE(?String2),FONT(, |
  ,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Silver)
                           STRING(@p<<<# registrosp),AT(50,276),USE(nregistros)
                         END
                       END
                       BUTTON('Cerrar'),AT(241,6,44,14),USE(?Close),LEFT,ICON('exit.ico')
                     END

BRW1::LastSortOrder       BYTE
BRW1::SortHeader  CLASS(SortHeaderClassType) !Declare SortHeader Class
QueueResorted          PROCEDURE(STRING pString),VIRTUAL
                  END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('BrowseDEBITO_EMPLEADOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:servicio:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:servicio',glo:servicio)                        ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:DEBITO_EMPLEADOS.Open                             ! File DEBITO_EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DEBITO_EMPLEADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  ?Browse:1{Prop:LineHeight} = 10
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,DEB:PK_DEBITO_EMPLEADOS)              ! Add the sort order for DEB:PK_DEBITO_EMPLEADOS for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?DEB:DEB_LEGAJO,DEB:DEB_LEGAJO,,BRW1) ! Initialize the browse locator using ?DEB:DEB_LEGAJO using key: DEB:PK_DEBITO_EMPLEADOS , DEB:DEB_LEGAJO
  BRW1.SetFilter('(DEB:DEB_SERVICIO = glo:servicio)')      ! Apply filter expression to browse
  BRW1.AddResetField(glo:servicio)                         ! Apply the reset field
  BRW1.AddField(DEB:DEB_LEGAJO,BRW1.Q.DEB:DEB_LEGAJO)      ! Field DEB:DEB_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DESCUENTA_FACTURA,BRW1.Q.EPL:EMP_DESCUENTA_FACTURA) ! Field EPL:EMP_DESCUENTA_FACTURA is a hot field or requires assignment from browse
  BRW1.AddField(DEB:DEB_CLIENTE,BRW1.Q.DEB:DEB_CLIENTE)    ! Field DEB:DEB_CLIENTE is a hot field or requires assignment from browse
  BRW1.AddField(DEB:DEB_SUMINISTRO,BRW1.Q.DEB:DEB_SUMINISTRO) ! Field DEB:DEB_SUMINISTRO is a hot field or requires assignment from browse
  BRW1.AddField(DEB:DEB_EMPRESA,BRW1.Q.DEB:DEB_EMPRESA)    ! Field DEB:DEB_EMPRESA is a hot field or requires assignment from browse
  BRW1.AddField(DEB:DEB_SERVICIO,BRW1.Q.DEB:DEB_SERVICIO)  ! Field DEB:DEB_SERVICIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateDEBITO_EMPLEADOS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.Init(Queue:Browse:1,?Browse:1,'','',BRW1::View:Browse,DEB:PK_DEBITO_EMPLEADOS)
  BRW1::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DEBITO_EMPLEADOS.Close
  !Kill the Sort Header
  BRW1::SortHeader.Kill()
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
    UpdateDEBITO_EMPLEADOS
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.SetAlerts()


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
  !Take Sort Headers Events
  IF BRW1::SortHeader.TakeEvents()
     RETURN Level:Notify
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW1.ResetFromView PROCEDURE

nregistros:Cnt       LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:DEBITO_EMPLEADOS.SetQuickScan(1)
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
    nregistros:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  nregistros = nregistros:Cnt
  PARENT.ResetFromView
  Relate:DEBITO_EMPLEADOS.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (glo:servicio = 1)
    SELF.Q.DEB:DEB_LEGAJO_NormalFG = -1                    ! Set conditional color values for DEB:DEB_LEGAJO
    SELF.Q.DEB:DEB_LEGAJO_NormalBG = 10813439
    SELF.Q.DEB:DEB_LEGAJO_SelectedFG = 10813439
    SELF.Q.DEB:DEB_LEGAJO_SelectedBG = 0
    SELF.Q.EPL:EMP_NOMBRE_NormalFG = -1                    ! Set conditional color values for EPL:EMP_NOMBRE
    SELF.Q.EPL:EMP_NOMBRE_NormalBG = 10813439
    SELF.Q.EPL:EMP_NOMBRE_SelectedFG = 10813439
    SELF.Q.EPL:EMP_NOMBRE_SelectedBG = 0
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalFG = -1         ! Set conditional color values for EPL:EMP_DESCUENTA_FACTURA
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalBG = 10813439
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedFG = 10813439
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedBG = 0
    SELF.Q.DEB:DEB_CLIENTE_NormalFG = -1                   ! Set conditional color values for DEB:DEB_CLIENTE
    SELF.Q.DEB:DEB_CLIENTE_NormalBG = 10813439
    SELF.Q.DEB:DEB_CLIENTE_SelectedFG = 10813439
    SELF.Q.DEB:DEB_CLIENTE_SelectedBG = 0
    SELF.Q.DEB:DEB_SUMINISTRO_NormalFG = -1                ! Set conditional color values for DEB:DEB_SUMINISTRO
    SELF.Q.DEB:DEB_SUMINISTRO_NormalBG = 10813439
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedFG = 10813439
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedBG = 0
  ELSIF (glo:servicio = 2)
    SELF.Q.DEB:DEB_LEGAJO_NormalFG = -1                    ! Set conditional color values for DEB:DEB_LEGAJO
    SELF.Q.DEB:DEB_LEGAJO_NormalBG = 12116679
    SELF.Q.DEB:DEB_LEGAJO_SelectedFG = 12116679
    SELF.Q.DEB:DEB_LEGAJO_SelectedBG = 0
    SELF.Q.EPL:EMP_NOMBRE_NormalFG = -1                    ! Set conditional color values for EPL:EMP_NOMBRE
    SELF.Q.EPL:EMP_NOMBRE_NormalBG = 12116679
    SELF.Q.EPL:EMP_NOMBRE_SelectedFG = 12116679
    SELF.Q.EPL:EMP_NOMBRE_SelectedBG = 0
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalFG = -1         ! Set conditional color values for EPL:EMP_DESCUENTA_FACTURA
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalBG = 12116679
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedFG = 12116679
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedBG = 0
    SELF.Q.DEB:DEB_CLIENTE_NormalFG = -1                   ! Set conditional color values for DEB:DEB_CLIENTE
    SELF.Q.DEB:DEB_CLIENTE_NormalBG = 12116679
    SELF.Q.DEB:DEB_CLIENTE_SelectedFG = 12116679
    SELF.Q.DEB:DEB_CLIENTE_SelectedBG = 0
    SELF.Q.DEB:DEB_SUMINISTRO_NormalFG = -1                ! Set conditional color values for DEB:DEB_SUMINISTRO
    SELF.Q.DEB:DEB_SUMINISTRO_NormalBG = 12116679
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedFG = 12116679
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedBG = 0
  ELSIF (glo:servicio = 3)
    SELF.Q.DEB:DEB_LEGAJO_NormalFG = -1                    ! Set conditional color values for DEB:DEB_LEGAJO
    SELF.Q.DEB:DEB_LEGAJO_NormalBG = 14465535
    SELF.Q.DEB:DEB_LEGAJO_SelectedFG = 14465535
    SELF.Q.DEB:DEB_LEGAJO_SelectedBG = 0
    SELF.Q.EPL:EMP_NOMBRE_NormalFG = -1                    ! Set conditional color values for EPL:EMP_NOMBRE
    SELF.Q.EPL:EMP_NOMBRE_NormalBG = 14465535
    SELF.Q.EPL:EMP_NOMBRE_SelectedFG = 14465535
    SELF.Q.EPL:EMP_NOMBRE_SelectedBG = 0
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalFG = -1         ! Set conditional color values for EPL:EMP_DESCUENTA_FACTURA
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalBG = 14465535
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedFG = 14465535
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedBG = 0
    SELF.Q.DEB:DEB_CLIENTE_NormalFG = -1                   ! Set conditional color values for DEB:DEB_CLIENTE
    SELF.Q.DEB:DEB_CLIENTE_NormalBG = 14465535
    SELF.Q.DEB:DEB_CLIENTE_SelectedFG = 14465535
    SELF.Q.DEB:DEB_CLIENTE_SelectedBG = 0
    SELF.Q.DEB:DEB_SUMINISTRO_NormalFG = -1                ! Set conditional color values for DEB:DEB_SUMINISTRO
    SELF.Q.DEB:DEB_SUMINISTRO_NormalBG = 14465535
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedFG = 14465535
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedBG = 0
  ELSE
    SELF.Q.DEB:DEB_LEGAJO_NormalFG = -1                    ! Set color values for DEB:DEB_LEGAJO
    SELF.Q.DEB:DEB_LEGAJO_NormalBG = -1
    SELF.Q.DEB:DEB_LEGAJO_SelectedFG = -1
    SELF.Q.DEB:DEB_LEGAJO_SelectedBG = -1
    SELF.Q.EPL:EMP_NOMBRE_NormalFG = -1                    ! Set color values for EPL:EMP_NOMBRE
    SELF.Q.EPL:EMP_NOMBRE_NormalBG = -1
    SELF.Q.EPL:EMP_NOMBRE_SelectedFG = -1
    SELF.Q.EPL:EMP_NOMBRE_SelectedBG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalFG = -1         ! Set color values for EPL:EMP_DESCUENTA_FACTURA
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalBG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedFG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedBG = -1
    SELF.Q.DEB:DEB_CLIENTE_NormalFG = -1                   ! Set color values for DEB:DEB_CLIENTE
    SELF.Q.DEB:DEB_CLIENTE_NormalBG = -1
    SELF.Q.DEB:DEB_CLIENTE_SelectedFG = -1
    SELF.Q.DEB:DEB_CLIENTE_SelectedBG = -1
    SELF.Q.DEB:DEB_SUMINISTRO_NormalFG = -1                ! Set color values for DEB:DEB_SUMINISTRO
    SELF.Q.DEB:DEB_SUMINISTRO_NormalBG = -1
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedFG = -1
    SELF.Q.DEB:DEB_SUMINISTRO_SelectedBG = -1
  END


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder<>NewOrder THEN
     BRW1::SortHeader.ClearSort()
  END
  BRW1::LastSortOrder=NewOrder
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

BRW1::SortHeader.QueueResorted       PROCEDURE(STRING pString)
  CODE
    IF pString = ''
       BRW1.RestoreSort()
       BRW1.ResetSort(True)
    ELSE
       BRW1.ReplaceSort(pString,BRW1::Sort0:Locator)
       BRW1.SetLocatorFromSort()
    END
