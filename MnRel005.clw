

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL005.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL011.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
PersonalUbicacionPersonal PROCEDURE 

nsede                SHORT(1),NAME('"SRL_Sede"')           !
BRW5::View:Browse    VIEW(SEDE_RELOJ_EMP)
                       PROJECT(SED2:SRL_Sede)
                       PROJECT(SED2:SRL_Lugar)
                       PROJECT(SED2:SRL_Legajo)
                       JOIN(EPD:Key1_sue,SED2:SRL_Legajo)
                         PROJECT(EPD:Cod1_SUE)
                         PROJECT(EPD:nombre_sue)
                         PROJECT(EPD:RCod1_Sue)
                       END
                       JOIN(LUG:PK_LUGAR,SED2:SRL_Lugar)
                         PROJECT(LUG:LUG_Descripcion)
                         PROJECT(LUG:LUG_Codigo)
                       END
                       JOIN(SED:PK_SEDE_RELOJ,SED2:SRL_Sede)
                         PROJECT(SED:SED_Descripcion)
                         PROJECT(SED:SED_Codigo)
                       END
                     END
Queue:5              QUEUE                            !Queue declaration for browse/combo box using ?Browse:5
SED2:SRL_Sede          LIKE(SED2:SRL_Sede)            !List box control field - type derived from field
SED:SED_Descripcion    LIKE(SED:SED_Descripcion)      !List box control field - type derived from field
SED2:SRL_Lugar         LIKE(SED2:SRL_Lugar)           !List box control field - type derived from field
LUG:LUG_Descripcion    LIKE(LUG:LUG_Descripcion)      !List box control field - type derived from field
EPD:Cod1_SUE           STRING(SIZE(EPD:Cod1_SUE))     !List box control field - STRING defined to hold GROUP's contents
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
SED2:SRL_Legajo        LIKE(SED2:SRL_Legajo)          !Primary key field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Related join file key field - type derived from field
LUG:LUG_Codigo         LIKE(LUG:LUG_Codigo)           !Related join file key field - type derived from field
SED:SED_Codigo         LIKE(SED:SED_Codigo)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW(' Asignacion de Legajos - Lugares'),AT(0,0,435,228),FONT('MS Sans Serif',8,,FONT:regular), |
  DOUBLE,TILED,ICON(ICON:Application),MAX,MDI,HLP('~PersonalUbicacionPersonal'),SYSTEM,WALLPAPER('wizBck02.gif'),IMM
                       BUTTON('E&xportar / Imprimir'),AT(169,209,125,14),USE(?EvoExportar),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  LEFT,ICON('export.ico'),FLAT,SKIP
                       SHEET,AT(9,15,422,198),USE(?CurrentTab),JOIN,COLOR(COLOR:BTNFACE),BELOW
                         TAB('Sede Reloj'),USE(?Tab:6)
                           SPIN(@n_2),AT(18,184,27,14),USE(nsede),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:White)
                         END
                       END
                       LIST,AT(13,19,413,160),USE(?Browse:5),VSCROLL,COLOR(COLOR:WINDOW),FORMAT('[17R(2)|M@n_3' & |
  '@78L(2)|M@s20@](101)|M~Sede~[17R(2)|M@n_3@122L(2)|M@s30@]|M~Lugar~19R(1)|M~Leg~L@n_4' & |
  '@78L(1)|M~Nombre~@s30@'),FROM(Queue:5),IMM
                       BUTTON('&Insertar'),AT(238,181,61,14),USE(?Insert:6),LEFT,ICON('wizIns.ico'),SKIP
                       BUTTON('&Cambiar'),AT(301,181,61,14),USE(?Change:6),LEFT,ICON('wizEdit.ico'),SKIP
                       BUTTON('&Borrar'),AT(364,181,61,14),USE(?Delete:6),LEFT,ICON('wizDel.ico'),SKIP
                       BUTTON('&Toolbox'),AT(37,35,45,14),USE(?Toolbox:4),LEFT,HIDE
                       BUTTON('&Select'),AT(309,209,56,14),USE(?Select:3),LEFT,ICON('wizOk.ico'),SKIP
                       BUTTON('&Cerrar'),AT(367,209,56,14),USE(?Close),LEFT,ICON('wizCncl.ico'),SKIP
                     END

BRW5::LastSortOrder       BYTE
BRW5::SortHeader  CLASS(SortHeaderClassType) !Declare SortHeader Class
QueueResorted          PROCEDURE(STRING pString),VIRTUAL
ValidField             PROCEDURE(STRING pColumnName),BYTE,VIRTUAL
                  END
Loc::QHlist2 QUEUE,PRE(QHL2)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar2 QUEUE,PRE(Q2)
FieldPar                 CSTRING(800)
                         END
QPar22 QUEUE,PRE(Qp22)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado2          STRING(100)
Loc::Titulo2          STRING(100)
SavPath2          STRING(2000)
Evo::Group2  GROUP,PRE()
Evo::Procedure2          STRING(100)
Evo::App2          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW5                 CLASS(BrowseClass)                    ! Browse using ?Browse:5
Q                      &Queue:5                       !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
                     END

BRW5::Sort0:StepClass StepLongClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_2  SHORT
Gol_woI_2 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_2),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_2),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_2),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_2),TRN
       END
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
PrintExBrowse2 ROUTINE

 OPEN(Gol_woI_2)
 DISPLAY()
 SETTARGET(Window)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_2 = BRW5.FileLoaded
 IF Not  EC::LoadI_2
     BRW5.FileLoaded=True
     CLEAR(BRW5.LastItems,1)
     BRW5.ResetFromFile()
 END
 CLOSE(Gol_woI_2)
 SETCURSOR()
  Evo::App2          = 'MnRel'
  Evo::Procedure2          = GlobalErrors.GetProcedureName()& 2
 
  FREE(QPar2)
  Q2:FieldPar  = '1,2,3,4,5,6,'
  ADD(QPar2)  !!1
  Q2:FieldPar  = ';'
  ADD(QPar2)  !!2
  Q2:FieldPar  = 'Spanish'
  ADD(QPar2)  !!3
  Q2:FieldPar  = ''
  ADD(QPar2)  !!4
  Q2:FieldPar  = true
  ADD(QPar2)  !!5
  Q2:FieldPar  = ''
  ADD(QPar2)  !!6
  Q2:FieldPar  = true
  ADD(QPar2)  !!7
 !!!! Exportaciones
  Q2:FieldPar  = 'HTML|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'EXCEL|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'WORD|'
  Q2:FieldPar  = CLIP( Q2:FieldPar)&'ASCII|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'XML|'
   Q2:FieldPar  = CLIP( Q2:FieldPar)&'PRT|'
  ADD(QPar2)  !!8
  Q2:FieldPar  = 'All'
  ADD(QPar2)   !.9.
  Q2:FieldPar  = ' 0'
  ADD(QPar2)   !.10
  Q2:FieldPar  = 0
  ADD(QPar2)   !.11
  Q2:FieldPar  = '1'
  ADD(QPar2)   !.12
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.13
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.14
 
  Q2:FieldPar  = ''
  ADD(QPar2)   !.15
 
   Q2:FieldPar  = '16'
  ADD(QPar2)   !.16
 
   Q2:FieldPar  = 1
  ADD(QPar2)   !.17
   Q2:FieldPar  = 2
  ADD(QPar2)   !.18
   Q2:FieldPar  = '2'
  ADD(QPar2)   !.19
   Q2:FieldPar  = 12
  ADD(QPar2)   !.20
 
   Q2:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar2)   !.21
 
   Q2:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar2)   !.22
 
   CLEAR(Q2:FieldPar)
  ADD(QPar2)   ! 23 Caracteres Encoding para xml
 
  Q2:FieldPar  = '0'
  ADD(QPar2)   ! 24 Use Open Office
 
  Q2:FieldPar  = '13021968'
  ADD(QPar2)
 
  FREE(QPar22)
  Qp22:F2N  = 'ECNOEXPORT'
  Qp22:F2P  = '@n_3'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'Sede'
  Qp22:F2P  = '@s20'
  Qp22:F2T  = '0'
  ADD(QPar22)
  Qp22:F2N  = 'ECNOEXPORT'
  Qp22:F2P  = '@n_3'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'Lugar'
  Qp22:F2P  = '@s30'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'Legajo'
  Qp22:F2P  = '@n_4'
  Qp22:F2T  = '0'
  ADD(QPar22)
       Qp22:F2N  = 'Nombre'
  Qp22:F2P  = '@s30'
  Qp22:F2T  = '0'
  ADD(QPar22)
  SysRec# = false
  FREE(Loc::QHlist2)
  LOOP
     SysRec# += 1
     IF ?Browse:5{PROPLIST:Exists,SysRec#} = 1
         GET(QPar22,SysRec#)
         QHL2:Id      = SysRec#
         QHL2:Nombre  = Qp22:F2N
         QHL2:Longitud= ?Browse:5{PropList:Width,SysRec#}  /2
         QHL2:Pict    = Qp22:F2P
         QHL2:Tot    = Qp22:F2T
         ADD(Loc::QHlist2)
      Else
        break
     END
  END
  Loc::Titulo2 ='LEGAJOS ASIGNADOS A LA SEDE RELOJ'
 
 SavPath2 = PATH()
  Exportar(Loc::QHlist2,BRW5.Q,QPar2,0,Loc::Titulo2,Evo::Group2)
 IF Not EC::LoadI_2 Then  BRW5.FileLoaded=false.
 SETPATH(SavPath2)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PersonalUbicacionPersonal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EvoExportar
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SED2:SRL_Sede',SED2:SRL_Sede)                      ! Added by: BrowseBox(ABC)
  BIND('SED:SED_Descripcion',SED:SED_Descripcion)          ! Added by: BrowseBox(ABC)
  BIND('SED2:SRL_Lugar',SED2:SRL_Lugar)                    ! Added by: BrowseBox(ABC)
  BIND('LUG:LUG_Descripcion',LUG:LUG_Descripcion)          ! Added by: BrowseBox(ABC)
  BIND('SED2:SRL_Legajo',SED2:SRL_Legajo)                  ! Added by: BrowseBox(ABC)
  BIND('LUG:LUG_Codigo',LUG:LUG_Codigo)                    ! Added by: BrowseBox(ABC)
  BIND('SED:SED_Codigo',SED:SED_Codigo)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SEDE_RELOJ_EMP.SetOpenRelated()
  Relate:SEDE_RELOJ_EMP.Open                               ! File SEDE_RELOJ_EMP used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW5.Init(?Browse:5,Queue:5.ViewPosition,BRW5::View:Browse,Queue:5,Relate:SEDE_RELOJ_EMP,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  ?Browse:5{Prop:LineHeight} = 10
  Do DefineListboxStyle
  BRW5.Q &= Queue:5
  BRW5::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon SED2:SRL_Sede for sort order 1
  BRW5.AddSortOrder(BRW5::Sort0:StepClass,SED2:PK_SEDE_RELOJ_EMP) ! Add the sort order for SED2:PK_SEDE_RELOJ_EMP for sort order 1
  BRW5.AddRange(SED2:SRL_Sede,nsede)                       ! Add single value range limit for sort order 1
  BRW5.AddResetField(nsede)                                ! Apply the reset field
  BRW5.AddField(SED2:SRL_Sede,BRW5.Q.SED2:SRL_Sede)        ! Field SED2:SRL_Sede is a hot field or requires assignment from browse
  BRW5.AddField(SED:SED_Descripcion,BRW5.Q.SED:SED_Descripcion) ! Field SED:SED_Descripcion is a hot field or requires assignment from browse
  BRW5.AddField(SED2:SRL_Lugar,BRW5.Q.SED2:SRL_Lugar)      ! Field SED2:SRL_Lugar is a hot field or requires assignment from browse
  BRW5.AddField(LUG:LUG_Descripcion,BRW5.Q.LUG:LUG_Descripcion) ! Field LUG:LUG_Descripcion is a hot field or requires assignment from browse
  BRW5.AddField(EPD:Cod1_SUE,BRW5.Q.EPD:Cod1_SUE)          ! Field EPD:Cod1_SUE is a hot field or requires assignment from browse
  BRW5.AddField(EPD:nombre_sue,BRW5.Q.EPD:nombre_sue)      ! Field EPD:nombre_sue is a hot field or requires assignment from browse
  BRW5.AddField(SED2:SRL_Legajo,BRW5.Q.SED2:SRL_Legajo)    ! Field SED2:SRL_Legajo is a hot field or requires assignment from browse
  BRW5.AddField(EPD:RCod1_Sue,BRW5.Q.EPD:RCod1_Sue)        ! Field EPD:RCod1_Sue is a hot field or requires assignment from browse
  BRW5.AddField(LUG:LUG_Codigo,BRW5.Q.LUG:LUG_Codigo)      ! Field LUG:LUG_Codigo is a hot field or requires assignment from browse
  BRW5.AddField(SED:SED_Codigo,BRW5.Q.SED:SED_Codigo)      ! Field SED:SED_Codigo is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.AskProcedure = 1
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW5::SortHeader.Init(Queue:5,?Browse:5,'','',BRW5::View:Browse,SED2:PK_SEDE_RELOJ_EMP)
  BRW5::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SEDE_RELOJ_EMP.Close
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
    upPersonalUbicacionPersonal
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW5::SortHeader.SetAlerts()


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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse2
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
       BRW5.ReplaceSort(pString)
    END


BRW5::SortHeader.ValidField             PROCEDURE(STRING pColumnName)
 CODE
    CASE(UPPER(pColumnName))
    OF 'SED:SED_DESCRIPCION'
       RETURN False
    OF 'SED2:SRL_LUGAR'
       RETURN False
    OF 'LUG:LUG_DESCRIPCION'
       RETURN False
    END
    RETURN PARENT.ValidField(pColumnName)
