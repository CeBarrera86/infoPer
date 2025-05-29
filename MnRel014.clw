

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL014.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
ABM_Emplea PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(EMPLEADOS)
                       PROJECT(EMP:EMP_Legajo)
                       PROJECT(EMP:EMP_Servicio)
                       PROJECT(EMP:EMP_Sector)
                       PROJECT(EMP:EMP_Seccion)
                       PROJECT(EMP:EMP_Nombre)
                       PROJECT(EMP:EMP_Activo)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EMP:EMP_Legajo         LIKE(EMP:EMP_Legajo)           !List box control field - type derived from field
EMP:EMP_Servicio       LIKE(EMP:EMP_Servicio)         !List box control field - type derived from field
EMP:EMP_Sector         LIKE(EMP:EMP_Sector)           !List box control field - type derived from field
EMP:EMP_Seccion        LIKE(EMP:EMP_Seccion)          !List box control field - type derived from field
EMP:EMP_Nombre         LIKE(EMP:EMP_Nombre)           !List box control field - type derived from field
EMP:EMP_Activo         LIKE(EMP:EMP_Activo)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('EMPLEADOS'),AT(,,358,261),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER,GRAY, |
  IMM,MDI,HLP('ABM_Emplea'),SYSTEM
                       LIST,AT(8,30,342,170),USE(?Browse:1),HVSCROLL,FORMAT('34R(2)|M~Legajo~C(0)@n-7@31R(2)|M' & |
  '~Servicio~C(0)@n-7@37R(2)|M~Sector~C(0)@n-7@35R(2)|M~Seccion~C(0)@n-7@143L(2)|M~Nomb' & |
  're~@s50@4L(2)|M~Activo~@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the EMPLEADOS file')
                       BUTTON('&Seleccionar'),AT(67,210,67,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(138,210,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insertar'),AT(191,210,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insertar u' & |
  'n Registro'),TIP('Insertar un Registro')
                       BUTTON('&Cambiar'),AT(244,210,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Modificar un Registro'),TIP('Modificar un Registro')
                       BUTTON('&Borrar'),AT(297,210,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Borrar un Registro'), |
  TIP('Borrar un Registro')
                       SHEET,AT(4,4,350,232),USE(?CurrentTab)
                         TAB('&1) EMPLEADOS'),USE(?Tab:2)
                         END
                         TAB('&2) Servicio_Sector_Seccion'),USE(?Tab:3)
                         END
                         TAB('&3) Servicio_Legajo'),USE(?Tab:4)
                         END
                         TAB('&4) Nombre'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Cerrar'),AT(246,240,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Cerrar'), |
  TIP('Cerrar')
                       BUTTON('&Help'),AT(299,240,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('ABM_Emplea')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('EMP:EMP_Legajo',EMP:EMP_Legajo)                    ! Added by: BrowseBox(ABC)
  BIND('EMP:EMP_Servicio',EMP:EMP_Servicio)                ! Added by: BrowseBox(ABC)
  BIND('EMP:EMP_Sector',EMP:EMP_Sector)                    ! Added by: BrowseBox(ABC)
  BIND('EMP:EMP_Seccion',EMP:EMP_Seccion)                  ! Added by: BrowseBox(ABC)
  BIND('EMP:EMP_Nombre',EMP:EMP_Nombre)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:EMPLEADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 2
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 3
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 4
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 5
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 6
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 7
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 8
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 9
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 10
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 11
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 12
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 13
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 14
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 15
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 16
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 17
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 18
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 19
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 20
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 21
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 22
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 23
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 24
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 25
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 26
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 27
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 28
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 29
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 30
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 31
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 32
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 33
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 34
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 35
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 36
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 37
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 38
  BRW1.AddSortOrder(,EMP:PK_EMPLEADOS)                     ! Add the sort order for EMP:PK_EMPLEADOS for sort order 39
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 39
  BRW1::Sort0:Locator.Init(,EMP:EMP_Servicio,,BRW1)        ! Initialize the browse locator using  using key: EMP:PK_EMPLEADOS , EMP:EMP_Servicio
  BRW1.AddField(EMP:EMP_Legajo,BRW1.Q.EMP:EMP_Legajo)      ! Field EMP:EMP_Legajo is a hot field or requires assignment from browse
  BRW1.AddField(EMP:EMP_Servicio,BRW1.Q.EMP:EMP_Servicio)  ! Field EMP:EMP_Servicio is a hot field or requires assignment from browse
  BRW1.AddField(EMP:EMP_Sector,BRW1.Q.EMP:EMP_Sector)      ! Field EMP:EMP_Sector is a hot field or requires assignment from browse
  BRW1.AddField(EMP:EMP_Seccion,BRW1.Q.EMP:EMP_Seccion)    ! Field EMP:EMP_Seccion is a hot field or requires assignment from browse
  BRW1.AddField(EMP:EMP_Nombre,BRW1.Q.EMP:EMP_Nombre)      ! Field EMP:EMP_Nombre is a hot field or requires assignment from browse
  BRW1.AddField(EMP:EMP_Activo,BRW1.Q.EMP:EMP_Activo)      ! Field EMP:EMP_Activo is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
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


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UP_Emplea
    ReturnValue = GlobalResponse
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSIF CHOICE(?CurrentTab) = 10
    RETURN SELF.SetSort(9,Force)
  ELSIF CHOICE(?CurrentTab) = 11
    RETURN SELF.SetSort(10,Force)
  ELSIF CHOICE(?CurrentTab) = 12
    RETURN SELF.SetSort(11,Force)
  ELSIF CHOICE(?CurrentTab) = 13
    RETURN SELF.SetSort(12,Force)
  ELSIF CHOICE(?CurrentTab) = 14
    RETURN SELF.SetSort(13,Force)
  ELSIF CHOICE(?CurrentTab) = 15
    RETURN SELF.SetSort(14,Force)
  ELSIF CHOICE(?CurrentTab) = 16
    RETURN SELF.SetSort(15,Force)
  ELSIF CHOICE(?CurrentTab) = 17
    RETURN SELF.SetSort(16,Force)
  ELSIF CHOICE(?CurrentTab) = 18
    RETURN SELF.SetSort(17,Force)
  ELSIF CHOICE(?CurrentTab) = 19
    RETURN SELF.SetSort(18,Force)
  ELSIF CHOICE(?CurrentTab) = 20
    RETURN SELF.SetSort(19,Force)
  ELSIF CHOICE(?CurrentTab) = 21
    RETURN SELF.SetSort(20,Force)
  ELSIF CHOICE(?CurrentTab) = 22
    RETURN SELF.SetSort(21,Force)
  ELSIF CHOICE(?CurrentTab) = 23
    RETURN SELF.SetSort(22,Force)
  ELSIF CHOICE(?CurrentTab) = 24
    RETURN SELF.SetSort(23,Force)
  ELSIF CHOICE(?CurrentTab) = 25
    RETURN SELF.SetSort(24,Force)
  ELSIF CHOICE(?CurrentTab) = 26
    RETURN SELF.SetSort(25,Force)
  ELSIF CHOICE(?CurrentTab) = 27
    RETURN SELF.SetSort(26,Force)
  ELSIF CHOICE(?CurrentTab) = 28
    RETURN SELF.SetSort(27,Force)
  ELSIF CHOICE(?CurrentTab) = 29
    RETURN SELF.SetSort(28,Force)
  ELSIF CHOICE(?CurrentTab) = 30
    RETURN SELF.SetSort(29,Force)
  ELSIF CHOICE(?CurrentTab) = 31
    RETURN SELF.SetSort(30,Force)
  ELSIF CHOICE(?CurrentTab) = 32
    RETURN SELF.SetSort(31,Force)
  ELSIF CHOICE(?CurrentTab) = 33
    RETURN SELF.SetSort(32,Force)
  ELSIF CHOICE(?CurrentTab) = 34
    RETURN SELF.SetSort(33,Force)
  ELSIF CHOICE(?CurrentTab) = 35
    RETURN SELF.SetSort(34,Force)
  ELSIF CHOICE(?CurrentTab) = 36
    RETURN SELF.SetSort(35,Force)
  ELSIF CHOICE(?CurrentTab) = 37
    RETURN SELF.SetSort(36,Force)
  ELSIF CHOICE(?CurrentTab) = 38
    RETURN SELF.SetSort(37,Force)
  ELSIF CHOICE(?CurrentTab) = 39
    RETURN SELF.SetSort(38,Force)
  ELSE
    RETURN SELF.SetSort(39,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

