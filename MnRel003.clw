

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL003.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL009.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
PersonalSedes PROCEDURE 

BRW5::View:Browse    VIEW(SEDE_RELOJ)
                       PROJECT(SED:SED_Codigo)
                       PROJECT(SED:SED_Descripcion)
                       PROJECT(SED:SED_Reloj)
                     END
Queue:5              QUEUE                            !Queue declaration for browse/combo box using ?Browse:5
SED:SED_Codigo         LIKE(SED:SED_Codigo)           !List box control field - type derived from field
SED:SED_Descripcion    LIKE(SED:SED_Descripcion)      !List box control field - type derived from field
SED:SED_Reloj          LIKE(SED:SED_Reloj)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Sedes de los Relojes'),AT(0,0,305,212),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  TILED,ICON(ICON:Application),MAX,MDI,HLP('~PersonalSedes'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       SHEET,AT(9,4,293,194),USE(?CurrentTab),JOIN,COLOR(COLOR:BTNFACE),BELOW
                         TAB('Cod'),USE(?Tab:6)
                           STRING(@n_3b),AT(22,11),USE(SED:SED_Codigo)
                         END
                         TAB('Descripcion'),USE(?Tab:9)
                           STRING(@s50),AT(65,10),USE(SED:SED_Descripcion)
                         END
                       END
                       LIST,AT(13,22,281,143),USE(?Browse:5),VSCROLL,COLOR(COLOR:WINDOW),FORMAT('40L(2)|M~Codi' & |
  'go~L(1)@n-7@148L(2)|M~Descripcion~L(1)@s50@36L(2)|M~Reloj~L(1)@n-7@'),FROM(Queue:5),IMM
                       BUTTON('&Insertar'),AT(109,167,61,14),USE(?Insert:6),LEFT,ICON('wizIns.ico')
                       BUTTON('&Cambiar'),AT(172,167,61,14),USE(?Change:6),LEFT,ICON('wizEdit.ico')
                       BUTTON('&Borrar'),AT(235,167,61,14),USE(?Delete:6),LEFT,ICON('wizDel.ico')
                       BUTTON('&Toolbox'),AT(249,6,45,14),USE(?Toolbox:4),LEFT,HIDE
                       BUTTON('&Select'),AT(183,198,56,14),USE(?Select:3),LEFT,ICON('wizOk.ico')
                       BUTTON('&Cerrar'),AT(241,198,56,14),USE(?Close),LEFT,ICON('wizCncl.ico')
                     END

BRW5::LastSortOrder       BYTE
BRW5::SortHeader  CLASS(SortHeaderClassType) !Declare SortHeader Class
QueueResorted          PROCEDURE(STRING pString),VIRTUAL
ValidField             PROCEDURE(STRING pColumnName),BYTE,VIRTUAL
                  END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW5                 CLASS(BrowseClass)                    ! Browse using ?Browse:5
Q                      &Queue:5                       !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW5::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW5::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW5::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW5::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('PersonalSedes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SED:SED_Codigo
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SED:SED_Codigo',SED:SED_Codigo)                    ! Added by: BrowseBox(ABC)
  BIND('SED:SED_Descripcion',SED:SED_Descripcion)          ! Added by: BrowseBox(ABC)
  BIND('SED:SED_Reloj',SED:SED_Reloj)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SEDE_RELOJ.Open                                   ! File SEDE_RELOJ used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW5.Init(?Browse:5,Queue:5.ViewPosition,BRW5::View:Browse,Queue:5,Relate:SEDE_RELOJ,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  ?Browse:5{Prop:LineHeight} = 10
  Do DefineListboxStyle
  BRW5.Q &= Queue:5
  BRW5::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon SED:SED_Descripcion for sort order 1
  BRW5.AddSortOrder(BRW5::Sort1:StepClass,SED:IX_Descripcion) ! Add the sort order for SED:IX_Descripcion for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?SED:SED_Descripcion,SED:SED_Descripcion,,BRW5) ! Initialize the browse locator using ?SED:SED_Descripcion using key: SED:IX_Descripcion , SED:SED_Descripcion
  BRW5::Sort2:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon SED:SED_Reloj for sort order 2
  BRW5.AddSortOrder(BRW5::Sort2:StepClass,SED:KEY__WA_Sys_SED_Reloj_6B24EA82) ! Add the sort order for SED:KEY__WA_Sys_SED_Reloj_6B24EA82 for sort order 2
  BRW5.AddLocator(BRW5::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort2:Locator.Init(,SED:SED_Reloj,,BRW5)           ! Initialize the browse locator using  using key: SED:KEY__WA_Sys_SED_Reloj_6B24EA82 , SED:SED_Reloj
  BRW5::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon SED:SED_Codigo for sort order 3
  BRW5.AddSortOrder(BRW5::Sort0:StepClass,SED:PK_SEDE_RELOJ) ! Add the sort order for SED:PK_SEDE_RELOJ for sort order 3
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW5::Sort0:Locator.Init(?SED:SED_Codigo,SED:SED_Codigo,,BRW5) ! Initialize the browse locator using ?SED:SED_Codigo using key: SED:PK_SEDE_RELOJ , SED:SED_Codigo
  BRW5.AddField(SED:SED_Codigo,BRW5.Q.SED:SED_Codigo)      ! Field SED:SED_Codigo is a hot field or requires assignment from browse
  BRW5.AddField(SED:SED_Descripcion,BRW5.Q.SED:SED_Descripcion) ! Field SED:SED_Descripcion is a hot field or requires assignment from browse
  BRW5.AddField(SED:SED_Reloj,BRW5.Q.SED:SED_Reloj)        ! Field SED:SED_Reloj is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.AskProcedure = 1
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW5::SortHeader.Init(Queue:5,?Browse:5,'','',BRW5::View:Browse,SED:PK_SEDE_RELOJ)
  BRW5::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SEDE_RELOJ.Close
  !Kill the Sort Header
  BRW5::SortHeader.Kill()
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
    upPersonalSedes
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW5::SortHeader.SetAlerts()


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
  IF BRW5::SortHeader.TakeEvents()
     RETURN Level:Notify
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW5::LastSortOrder<>NewOrder THEN
     BRW5::SortHeader.ClearSort()
  END
  BRW5::LastSortOrder=NewOrder
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

BRW5::SortHeader.QueueResorted       PROCEDURE(STRING pString)
  CODE
    IF pString = ''
       BRW5.RestoreSort()
       BRW5.ResetSort(True)
    ELSE
       IF CHOICE(?CurrentTab) = 2
          BRW5.ReplaceSort(pString,BRW5::Sort1:Locator)
          BRW5.SetLocatorFromSort()
       ELSIF CHOICE(?CurrentTab) = 3
          BRW5.ReplaceSort(pString,BRW5::Sort2:Locator)
          BRW5.SetLocatorFromSort()
       ELSE
          BRW5.ReplaceSort(pString,BRW5::Sort0:Locator)
          BRW5.SetLocatorFromSort()
       END
    END


BRW5::SortHeader.ValidField             PROCEDURE(STRING pColumnName)
 CODE
    CASE(UPPER(pColumnName))
    OF 'SED:SED_RELOJ'
       RETURN False
    END
    RETURN PARENT.ValidField(pColumnName)
