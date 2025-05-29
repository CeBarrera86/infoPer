

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
BrowseEMPLEADOS PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_LEGAJO)
                       PROJECT(EPL:EMP_NOMBRE)
                       PROJECT(EPL:EMP_DIRECCION)
                       PROJECT(EPL:EMP_DESCUENTA_FACTURA)
                       PROJECT(EPL:EMP_ACTIVO)
                       PROJECT(EPL:EMP_MENSUAL)
                       PROJECT(EPL:EMP_FECANTIG)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !List box control field - type derived from field
EPL:EMP_LEGAJO_NormalFG LONG                          !Normal forground color
EPL:EMP_LEGAJO_NormalBG LONG                          !Normal background color
EPL:EMP_LEGAJO_SelectedFG LONG                        !Selected forground color
EPL:EMP_LEGAJO_SelectedBG LONG                        !Selected background color
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_NOMBRE_NormalFG LONG                          !Normal forground color
EPL:EMP_NOMBRE_NormalBG LONG                          !Normal background color
EPL:EMP_NOMBRE_SelectedFG LONG                        !Selected forground color
EPL:EMP_NOMBRE_SelectedBG LONG                        !Selected background color
EPL:EMP_DIRECCION      LIKE(EPL:EMP_DIRECCION)        !List box control field - type derived from field
EPL:EMP_DIRECCION_NormalFG LONG                       !Normal forground color
EPL:EMP_DIRECCION_NormalBG LONG                       !Normal background color
EPL:EMP_DIRECCION_SelectedFG LONG                     !Selected forground color
EPL:EMP_DIRECCION_SelectedBG LONG                     !Selected background color
EPL:EMP_DESCUENTA_FACTURA LIKE(EPL:EMP_DESCUENTA_FACTURA) !List box control field - type derived from field
EPL:EMP_DESCUENTA_FACTURA_NormalFG LONG               !Normal forground color
EPL:EMP_DESCUENTA_FACTURA_NormalBG LONG               !Normal background color
EPL:EMP_DESCUENTA_FACTURA_SelectedFG LONG             !Selected forground color
EPL:EMP_DESCUENTA_FACTURA_SelectedBG LONG             !Selected background color
EPL:EMP_ACTIVO         LIKE(EPL:EMP_ACTIVO)           !List box control field - type derived from field
EPL:EMP_ACTIVO_NormalFG LONG                          !Normal forground color
EPL:EMP_ACTIVO_NormalBG LONG                          !Normal background color
EPL:EMP_ACTIVO_SelectedFG LONG                        !Selected forground color
EPL:EMP_ACTIVO_SelectedBG LONG                        !Selected background color
EPL:EMP_MENSUAL        LIKE(EPL:EMP_MENSUAL)          !List box control field - type derived from field
EPL:EMP_MENSUAL_NormalFG LONG                         !Normal forground color
EPL:EMP_MENSUAL_NormalBG LONG                         !Normal background color
EPL:EMP_MENSUAL_SelectedFG LONG                       !Selected forground color
EPL:EMP_MENSUAL_SelectedBG LONG                       !Selected background color
EPL:EMP_FECANTIG       LIKE(EPL:EMP_FECANTIG)         !List box control field - type derived from field
EPL:EMP_FECANTIG_NormalFG LONG                        !Normal forground color
EPL:EMP_FECANTIG_NormalBG LONG                        !Normal background color
EPL:EMP_FECANTIG_SelectedFG LONG                      !Selected forground color
EPL:EMP_FECANTIG_SelectedBG LONG                      !Selected background color
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Empleados'),AT(,,447,285),FONT('Microsoft Sans Serif',10,COLOR:Navy,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseEMPLEADOS'),SYSTEM
                       LIST,AT(9,22,431,246),USE(?Browse:1),HVSCROLL,COLOR(00CECED0h),FORMAT('39C(2)|M*~Legajo' & |
  '~C(0)@n_7@127L(2)|M*~Nombre~C(0)@s31@105L(2)|M*~Direccion~C(0)@s25@59C|M*~Desc.Fact.' & |
  '~@s1@35L(16)|M*~Activo~L(8)@s1@10C|M*~M~@s1@40L(10)|M*~Fecha Antig~L(5)@D06b@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing Records')
                       BUTTON('&Insertar'),AT(238,248,45,14),USE(?Insert:2),HIDE,SKIP
                       BUTTON('&Cambiar'),AT(288,248,45,14),USE(?Change:2),DEFAULT,HIDE,SKIP
                       BUTTON('&Borrar'),AT(337,248,45,14),USE(?Delete:2),HIDE,SKIP
                       SHEET,AT(4,4,442,272),USE(?CurrentTab)
                         TAB('Legajo'),USE(?Tab:2)
                         END
                         TAB('Nombre'),USE(?Tab:3)
                         END
                         TAB('Direccion'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Seleccionar EMPLEADO'),AT(198,2,104,14),USE(?Select),LEFT,ICON('waselect.ico')
                       BUTTON('Cerrar'),AT(352,2,44,14),USE(?Close),LEFT,ICON('waclose.ico')
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
EditInPlace::EPL:EMP_DESCUENTA_FACTURA CLASS(EditDropListClass) ! Edit-in-place class for field EPL:EMP_DESCUENTA_FACTURA
CreateControl          PROCEDURE(),DERIVED
                     END

EditInPlace::EPL:EMP_MENSUAL EditEntryClass                ! Edit-in-place class for field EPL:EMP_MENSUAL
EditInPlace::EPL:EMP_FECANTIG EditEntryClass               ! Edit-in-place class for field EPL:EMP_FECANTIG
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
  GlobalErrors.SetProcedureName('BrowseEMPLEADOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:EMPLEADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  ?Browse:1{Prop:LineHeight} = 12
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,EPL:EMP_NOMBRE,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.AddSortOrder(,EPL:PK_Direccion)                     ! Add the sort order for EPL:PK_Direccion for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,EPL:EMP_DIRECCION,,BRW1)       ! Initialize the browse locator using  using key: EPL:PK_Direccion , EPL:EMP_DIRECCION
  BRW1.AddSortOrder(,EPL:PK_EMPLEADOS)                     ! Add the sort order for EPL:PK_EMPLEADOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,EPL:EMP_LEGAJO,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_EMPLEADOS , EPL:EMP_LEGAJO
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DIRECCION,BRW1.Q.EPL:EMP_DIRECCION) ! Field EPL:EMP_DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_DESCUENTA_FACTURA,BRW1.Q.EPL:EMP_DESCUENTA_FACTURA) ! Field EPL:EMP_DESCUENTA_FACTURA is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_ACTIVO,BRW1.Q.EPL:EMP_ACTIVO)      ! Field EPL:EMP_ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_MENSUAL,BRW1.Q.EPL:EMP_MENSUAL)    ! Field EPL:EMP_MENSUAL is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_FECANTIG,BRW1.Q.EPL:EMP_FECANTIG)  ! Field EPL:EMP_FECANTIG is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! EPL:EMP_LEGAJO Disable
  SELF.AddEditControl(,6) ! EPL:EMP_NOMBRE Disable
  SELF.AddEditControl(,11) ! EPL:EMP_DIRECCION Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_DESCUENTA_FACTURA,16)
  SELF.AddEditControl(,21) ! EPL:EMP_ACTIVO Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_MENSUAL,26)
  SELF.AddEditControl(EditInPlace::EPL:EMP_FECANTIG,31)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (EPL:EMP_ACTIVO  = 'N')
    SELF.Q.EPL:EMP_LEGAJO_NormalFG = 6908265               ! Set conditional color values for EPL:EMP_LEGAJO
    SELF.Q.EPL:EMP_LEGAJO_NormalBG = -1
    SELF.Q.EPL:EMP_LEGAJO_SelectedFG = -1
    SELF.Q.EPL:EMP_LEGAJO_SelectedBG = 6908265
    SELF.Q.EPL:EMP_NOMBRE_NormalFG = 6908265               ! Set conditional color values for EPL:EMP_NOMBRE
    SELF.Q.EPL:EMP_NOMBRE_NormalBG = -1
    SELF.Q.EPL:EMP_NOMBRE_SelectedFG = -1
    SELF.Q.EPL:EMP_NOMBRE_SelectedBG = 6908265
    SELF.Q.EPL:EMP_DIRECCION_NormalFG = 6908265            ! Set conditional color values for EPL:EMP_DIRECCION
    SELF.Q.EPL:EMP_DIRECCION_NormalBG = -1
    SELF.Q.EPL:EMP_DIRECCION_SelectedFG = -1
    SELF.Q.EPL:EMP_DIRECCION_SelectedBG = 6908265
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalFG = 6908265    ! Set conditional color values for EPL:EMP_DESCUENTA_FACTURA
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalBG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedFG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedBG = 6908265
    SELF.Q.EPL:EMP_ACTIVO_NormalFG = 6908265               ! Set conditional color values for EPL:EMP_ACTIVO
    SELF.Q.EPL:EMP_ACTIVO_NormalBG = -1
    SELF.Q.EPL:EMP_ACTIVO_SelectedFG = -1
    SELF.Q.EPL:EMP_ACTIVO_SelectedBG = 6908265
    SELF.Q.EPL:EMP_MENSUAL_NormalFG = 6908265              ! Set conditional color values for EPL:EMP_MENSUAL
    SELF.Q.EPL:EMP_MENSUAL_NormalBG = -1
    SELF.Q.EPL:EMP_MENSUAL_SelectedFG = -1
    SELF.Q.EPL:EMP_MENSUAL_SelectedBG = 6908265
    SELF.Q.EPL:EMP_FECANTIG_NormalFG = 6908265             ! Set conditional color values for EPL:EMP_FECANTIG
    SELF.Q.EPL:EMP_FECANTIG_NormalBG = -1
    SELF.Q.EPL:EMP_FECANTIG_SelectedFG = -1
    SELF.Q.EPL:EMP_FECANTIG_SelectedBG = 6908265
  ELSE
    SELF.Q.EPL:EMP_LEGAJO_NormalFG = -1                    ! Set color values for EPL:EMP_LEGAJO
    SELF.Q.EPL:EMP_LEGAJO_NormalBG = -1
    SELF.Q.EPL:EMP_LEGAJO_SelectedFG = -1
    SELF.Q.EPL:EMP_LEGAJO_SelectedBG = -1
    SELF.Q.EPL:EMP_NOMBRE_NormalFG = -1                    ! Set color values for EPL:EMP_NOMBRE
    SELF.Q.EPL:EMP_NOMBRE_NormalBG = -1
    SELF.Q.EPL:EMP_NOMBRE_SelectedFG = -1
    SELF.Q.EPL:EMP_NOMBRE_SelectedBG = -1
    SELF.Q.EPL:EMP_DIRECCION_NormalFG = -1                 ! Set color values for EPL:EMP_DIRECCION
    SELF.Q.EPL:EMP_DIRECCION_NormalBG = -1
    SELF.Q.EPL:EMP_DIRECCION_SelectedFG = -1
    SELF.Q.EPL:EMP_DIRECCION_SelectedBG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalFG = -1         ! Set color values for EPL:EMP_DESCUENTA_FACTURA
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_NormalBG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedFG = -1
    SELF.Q.EPL:EMP_DESCUENTA_FACTURA_SelectedBG = -1
    SELF.Q.EPL:EMP_ACTIVO_NormalFG = -1                    ! Set color values for EPL:EMP_ACTIVO
    SELF.Q.EPL:EMP_ACTIVO_NormalBG = -1
    SELF.Q.EPL:EMP_ACTIVO_SelectedFG = -1
    SELF.Q.EPL:EMP_ACTIVO_SelectedBG = -1
    SELF.Q.EPL:EMP_MENSUAL_NormalFG = -1                   ! Set color values for EPL:EMP_MENSUAL
    SELF.Q.EPL:EMP_MENSUAL_NormalBG = -1
    SELF.Q.EPL:EMP_MENSUAL_SelectedFG = -1
    SELF.Q.EPL:EMP_MENSUAL_SelectedBG = -1
    SELF.Q.EPL:EMP_FECANTIG_NormalFG = -1                  ! Set color values for EPL:EMP_FECANTIG
    SELF.Q.EPL:EMP_FECANTIG_NormalBG = -1
    SELF.Q.EPL:EMP_FECANTIG_SelectedFG = -1
    SELF.Q.EPL:EMP_FECANTIG_SelectedBG = -1
  END


EditInPlace::EPL:EMP_DESCUENTA_FACTURA.CreateControl PROCEDURE

  CODE
  PARENT.CreateControl
  SELF.FEQ{PROP:From} = 'Si|#S|No|#N'


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

