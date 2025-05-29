

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL004.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL010.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
PersonalLugar PROCEDURE 

BRW5::View:Browse    VIEW(LUGAR)
                       PROJECT(LUG:LUG_Codigo)
                       PROJECT(LUG:LUG_Descripcion)
                       PROJECT(LUG:LUG_Hora_Entrada_TIME)
                       PROJECT(LUG:LUG_Hora_Salida_TIME)
                       PROJECT(LUG:LUG_EMAIL)
                     END
Queue:5              QUEUE                            !Queue declaration for browse/combo box using ?Browse:5
LUG:LUG_Codigo         LIKE(LUG:LUG_Codigo)           !List box control field - type derived from field
LUG:LUG_Descripcion    LIKE(LUG:LUG_Descripcion)      !List box control field - type derived from field
LUG:LUG_Hora_Entrada_TIME LIKE(LUG:LUG_Hora_Entrada_TIME) !List box control field - type derived from field
LUG:LUG_Hora_Salida_TIME LIKE(LUG:LUG_Hora_Salida_TIME) !List box control field - type derived from field
LUG:LUG_EMAIL          LIKE(LUG:LUG_EMAIL)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Lugar del Personal'),AT(0,0,321,252),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  TILED,ICON(ICON:Application),MAX,MDI,HLP('~PersonalLugar'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       SHEET,AT(9,4,305,230),USE(?CurrentTab),JOIN,COLOR(COLOR:BTNFACE),BELOW
                         TAB('Sede'),USE(?Tab:6)
                           STRING(@n_3b),AT(21,7),USE(LUG:LUG_Codigo)
                         END
                         TAB('Descripcion'),USE(?Tab:9)
                           STRING(@s50),AT(47,8),USE(LUG:LUG_Descripcion)
                         END
                       END
                       LIST,AT(13,20,295,183),USE(?Browse:5),HVSCROLL,COLOR(COLOR:WINDOW),FORMAT('29R(2)|M~Cod' & |
  'igo~L(1)@n-7@143L(2)|M~Descripcion~L(1)@s50@47L(2)|M~Hora Entrada~L(1)@t7@47L(2)|M~H' & |
  'ora Salida~L(1)@t7@120L(2)|M~direccion EMAIL~L(1)@s30@'),FROM(Queue:5),IMM
                       BUTTON('&Insertar'),AT(120,204,61,14),USE(?Insert:6),LEFT,ICON('wizIns.ico')
                       BUTTON('&Cambiar'),AT(183,204,61,14),USE(?Change:6),LEFT,ICON('wizEdit.ico')
                       BUTTON('&Borrar'),AT(246,204,61,14),USE(?Delete:6),LEFT,ICON('wizDel.ico')
                       BUTTON('&Toolbox'),AT(251,7,45,14),USE(?Toolbox:4),LEFT,HIDE
                       BUTTON('&Select'),AT(191,236,56,14),USE(?Select:3),LEFT,ICON('wizOk.ico')
                       BUTTON('&Cerrar'),AT(249,236,56,14),USE(?Close),LEFT,ICON('wizCncl.ico')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW5                 CLASS(BrowseClass)                    ! Browse using ?Browse:5
Q                      &Queue:5                       !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW5::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW5::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('PersonalLugar')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LUG:LUG_Codigo
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LUG:LUG_Codigo',LUG:LUG_Codigo)                    ! Added by: BrowseBox(ABC)
  BIND('LUG:LUG_Descripcion',LUG:LUG_Descripcion)          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LUGAR.SetOpenRelated()
  Relate:LUGAR.Open                                        ! File LUGAR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW5.Init(?Browse:5,Queue:5.ViewPosition,BRW5::View:Browse,Queue:5,Relate:LUGAR,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  ?Browse:5{Prop:LineHeight} = 10
  Do DefineListboxStyle
  BRW5.Q &= Queue:5
  BRW5::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon LUG:LUG_Descripcion for sort order 1
  BRW5.AddSortOrder(BRW5::Sort1:StepClass,LUG:IX_Descripcion) ! Add the sort order for LUG:IX_Descripcion for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?LUG:LUG_Descripcion,LUG:LUG_Descripcion,,BRW5) ! Initialize the browse locator using ?LUG:LUG_Descripcion using key: LUG:IX_Descripcion , LUG:LUG_Descripcion
  BRW5::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon LUG:LUG_Codigo for sort order 2
  BRW5.AddSortOrder(BRW5::Sort0:StepClass,LUG:PK_LUGAR)    ! Add the sort order for LUG:PK_LUGAR for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?LUG:LUG_Codigo,LUG:LUG_Codigo,,BRW5) ! Initialize the browse locator using ?LUG:LUG_Codigo using key: LUG:PK_LUGAR , LUG:LUG_Codigo
  BRW5.AddField(LUG:LUG_Codigo,BRW5.Q.LUG:LUG_Codigo)      ! Field LUG:LUG_Codigo is a hot field or requires assignment from browse
  BRW5.AddField(LUG:LUG_Descripcion,BRW5.Q.LUG:LUG_Descripcion) ! Field LUG:LUG_Descripcion is a hot field or requires assignment from browse
  BRW5.AddField(LUG:LUG_Hora_Entrada_TIME,BRW5.Q.LUG:LUG_Hora_Entrada_TIME) ! Field LUG:LUG_Hora_Entrada_TIME is a hot field or requires assignment from browse
  BRW5.AddField(LUG:LUG_Hora_Salida_TIME,BRW5.Q.LUG:LUG_Hora_Salida_TIME) ! Field LUG:LUG_Hora_Salida_TIME is a hot field or requires assignment from browse
  BRW5.AddField(LUG:LUG_EMAIL,BRW5.Q.LUG:LUG_EMAIL)        ! Field LUG:LUG_EMAIL is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.AskProcedure = 1
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
    Relate:LUGAR.Close
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
    upPersonalLugar
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


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:3
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:6
    SELF.ChangeControl=?Change:6
    SELF.DeleteControl=?Delete:6
  END
  SELF.ToolControl = ?Toolbox:4


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?CurrentTab, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?CurrentTab
  SELF.SetStrategy(?Browse:5, Resize:FixLeft+Resize:FixTop, Resize:ConstantRight+Resize:ConstantBottom) ! Override strategy for ?Browse:5
  SELF.SetStrategy(?Select:3, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Select:3
  SELF.SetStrategy(?Change:6, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Change:6
  SELF.SetStrategy(?Delete:6, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Delete:6
  SELF.SetStrategy(?Insert:6, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Insert:6
  SELF.SetStrategy(?Close, Resize:FixRight+Resize:FixBottom, Resize:LockSize) ! Override strategy for ?Close
  SELF.RemoveControl(?Toolbox:4)                           ! Remove ?Toolbox:4 from the resizer, it will not be moved or sized

