

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL023.INC'),ONCE        !Local module procedure declarations
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! ABM Emplea file
!!! </summary>
Browse_Emplea PROCEDURE 

CurrentTab           STRING(80)                            !
FACTIVOS             BYTE                                  !
BRW1::View:Browse    VIEW(Emplea)
                       PROJECT(EPD:Servic_sue)
                       PROJECT(EPD:Legajo_sue)
                       PROJECT(EPD:nombre_sue)
                       PROJECT(EPD:activo_sue)
                       PROJECT(EPD:Nrotar1_sue)
                       PROJECT(EPD:Nrotar2_sue)
                       PROJECT(EPD:Nrotar3_sue)
                       PROJECT(EPD:Tipo_sue)
                       PROJECT(EPD:Sector_Sue)
                       PROJECT(EPD:Seccion_sue)
                       PROJECT(EPD:domici_sue)
                       PROJECT(EPD:locali_sue)
                       PROJECT(EPD:sexo_sue)
                       PROJECT(EPD:cuil_sue)
                       PROJECT(EPD:fenaci_sue)
                       PROJECT(EPD:nobrso_sue)
                       PROJECT(EPD:cobrso_sue)
                       PROJECT(EPD:cobro_sue)
                       PROJECT(EPD:Conven_sue)
                       PROJECT(EPD:RCod1_Sue)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EPD:Servic_sue         LIKE(EPD:Servic_sue)           !List box control field - type derived from field
EPD:Legajo_sue         LIKE(EPD:Legajo_sue)           !List box control field - type derived from field
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
EPD:activo_sue         LIKE(EPD:activo_sue)           !List box control field - type derived from field
EPD:Nrotar1_sue        LIKE(EPD:Nrotar1_sue)          !List box control field - type derived from field
EPD:Nrotar2_sue        LIKE(EPD:Nrotar2_sue)          !List box control field - type derived from field
EPD:Nrotar3_sue        LIKE(EPD:Nrotar3_sue)          !List box control field - type derived from field
EPD:Tipo_sue           LIKE(EPD:Tipo_sue)             !List box control field - type derived from field
EPD:Sector_Sue         LIKE(EPD:Sector_Sue)           !List box control field - type derived from field
EPD:Seccion_sue        LIKE(EPD:Seccion_sue)          !List box control field - type derived from field
EPD:domici_sue         LIKE(EPD:domici_sue)           !List box control field - type derived from field
EPD:locali_sue         LIKE(EPD:locali_sue)           !List box control field - type derived from field
EPD:sexo_sue           LIKE(EPD:sexo_sue)             !List box control field - type derived from field
EPD:cuil_sue           LIKE(EPD:cuil_sue)             !List box control field - type derived from field
EPD:fenaci_sue         LIKE(EPD:fenaci_sue)           !List box control field - type derived from field
EPD:nobrso_sue         LIKE(EPD:nobrso_sue)           !List box control field - type derived from field
EPD:cobrso_sue         LIKE(EPD:cobrso_sue)           !List box control field - type derived from field
EPD:cobro_sue          LIKE(EPD:cobro_sue)            !List box control field - type derived from field
EPD:Conven_sue         LIKE(EPD:Conven_sue)           !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('  DATOS EMPLEA.DAT'),AT(,,358,198),FONT('MS Sans Serif',10,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Main'),SYSTEM
                       LIST,AT(8,30,342,146),USE(?Browse:1),HVSCROLL,FORMAT('22C(2)|M~Serv~C(0)@n01@31C(2)|M~L' & |
  'egajo~C(0)@n03@120L(2)|M~Nombre~C(0)@s30@11C(2)|M~A~C(0)@s1@35C(2)|M~Nrotar 1~C(0)@n' & |
  '05@35C(2)|M~Nrotar 2~C(0)@N05@35C(2)|M~Nrotar 3~C(0)@N05@36C(2)|M~Tipo~C(0)@n01@44C(' & |
  '2)|M~Sector~C(0)@n02@48C(2)|M~Seccion~C(0)@n01@100C(2)|M~Domicilio~@s25@80C(2)|M~Loc' & |
  'alidad~C(0)@s20@21C(2)|M~Sexo~C(0)@s1@60C(2)|M~Cuil~C(0)@n011@40C(2)|M~FecNac~C(0)@s' & |
  '06@44C(2)|M~nobrso~@n08@29C(2)|M~cobrso~C(0)@n02@23C(2)|M~cobro~C(0)@n01@4C(2)|M~Con' & |
  'ven~C(0)@n01@'),FROM(Queue:Browse:1),IMM
                       CHECK(' Filtrar ACTIVOS'),AT(42,182),USE(FACTIVOS),VALUE('1','0')
                       BUTTON('E&xportar / Imprimir'),AT(157,181,88,14),USE(?EvoExportar),FONT(,,,FONT:bold,CHARSET:ANSI), |
  LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('x LEGAJO'),USE(?Tab:2)
                           STRING(@n04),AT(12,18),USE(EPD:RCod1_Sue),FONT(,,COLOR:Blue,,CHARSET:ANSI)
                         END
                         TAB('x COD.T1'),USE(?Tab:3)
                           STRING(@n05),AT(46,18),USE(EPD:Nrotar1_sue),FONT(,,COLOR:Blue,,CHARSET:ANSI)
                         END
                         TAB('x COD.T2'),USE(?Tab:4)
                           STRING(@N05),AT(80,18),USE(EPD:Nrotar2_sue),FONT(,,COLOR:Blue,,CHARSET:ANSI)
                         END
                         TAB('x COD.T3'),USE(?Tab:5)
                           STRING(@N05),AT(114,18),USE(EPD:Nrotar3_sue),FONT(,,COLOR:Blue,,CHARSET:ANSI)
                         END
                         TAB('x NOMBRE'),USE(?Tab:6)
                           STRING(@s30),AT(67,18),USE(EPD:nombre_sue),FONT(,,COLOR:Blue,,CHARSET:ANSI)
                         END
                       END
                       BUTTON('&Cerrar'),AT(294,181,60,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT
                     END

Loc::QHlist4 QUEUE,PRE(QHL4)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar4 QUEUE,PRE(Q4)
FieldPar                 CSTRING(800)
                         END
QPar24 QUEUE,PRE(Qp24)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado4          STRING(100)
Loc::Titulo4          STRING(100)
SavPath4          STRING(2000)
Evo::Group4  GROUP,PRE()
Evo::Procedure4          STRING(100)
Evo::App4          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort0:StepClass StepRealClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepRealClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepRealClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepRealClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
BRW1::Sort4:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 5
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_4  SHORT
Gol_woI_4 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_4),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_4),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_4),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_4),TRN
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
PrintExBrowse4 ROUTINE

 OPEN(Gol_woI_4)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_4 = BRW1.FileLoaded
 IF Not  EC::LoadI_4
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_4)
 SETCURSOR()
  Evo::App4          = 'MnRel'
  Evo::Procedure4          = GlobalErrors.GetProcedureName()& 4
 
  FREE(QPar4)
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,'
  ADD(QPar4)  !!1
  Q4:FieldPar  = ';'
  ADD(QPar4)  !!2
  Q4:FieldPar  = 'Spanish'
  ADD(QPar4)  !!3
  Q4:FieldPar  = ''
  ADD(QPar4)  !!4
  Q4:FieldPar  = true
  ADD(QPar4)  !!5
  Q4:FieldPar  = ''
  ADD(QPar4)  !!6
  Q4:FieldPar  = true
  ADD(QPar4)  !!7
 !!!! Exportaciones
  Q4:FieldPar  = 'HTML|'
   Q4:FieldPar  = CLIP( Q4:FieldPar)&'EXCEL|'
   Q4:FieldPar  = CLIP( Q4:FieldPar)&'WORD|'
  Q4:FieldPar  = CLIP( Q4:FieldPar)&'ASCII|'
   Q4:FieldPar  = CLIP( Q4:FieldPar)&'XML|'
   Q4:FieldPar  = CLIP( Q4:FieldPar)&'PRT|'
  ADD(QPar4)  !!8
  Q4:FieldPar  = 'All'
  ADD(QPar4)   !.9.
  Q4:FieldPar  = ' 0'
  ADD(QPar4)   !.10
  Q4:FieldPar  = 0
  ADD(QPar4)   !.11
  Q4:FieldPar  = '1'
  ADD(QPar4)   !.12
 
  Q4:FieldPar  = ''
  ADD(QPar4)   !.13
 
  Q4:FieldPar  = ''
  ADD(QPar4)   !.14
 
  Q4:FieldPar  = ''
  ADD(QPar4)   !.15
 
   Q4:FieldPar  = '16'
  ADD(QPar4)   !.16
 
   Q4:FieldPar  = 1
  ADD(QPar4)   !.17
   Q4:FieldPar  = 2
  ADD(QPar4)   !.18
   Q4:FieldPar  = '2'
  ADD(QPar4)   !.19
   Q4:FieldPar  = 12
  ADD(QPar4)   !.20
 
   Q4:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar4)   !.21
 
   Q4:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar4)   !.22
 
   CLEAR(Q4:FieldPar)
  ADD(QPar4)   ! 23 Caracteres Encoding para xml
 
  Q4:FieldPar  = '0'
  ADD(QPar4)   ! 24 Use Open Office
 
  Q4:FieldPar  = '13021968'
  ADD(QPar4)
 
  FREE(QPar24)
       Qp24:F2N  = 'Serv'
  Qp24:F2P  = '@n01'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Legajo'
  Qp24:F2P  = '@n03'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Nombre'
  Qp24:F2P  = '@s30'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'A'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Nrotar 1'
  Qp24:F2P  = '@n05'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Nrotar 2'
  Qp24:F2P  = '@N05'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Nrotar 3'
  Qp24:F2P  = '@N05'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Tipo'
  Qp24:F2P  = '@n01'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Sector'
  Qp24:F2P  = '@n02'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Seccion'
  Qp24:F2P  = '@n01'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Domicilio'
  Qp24:F2P  = '@s25'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Localidad'
  Qp24:F2P  = '@s20'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Sexo'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Cuil'
  Qp24:F2P  = '@n011'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'FecNac'
  Qp24:F2P  = '@n06'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'nobrso'
  Qp24:F2P  = '@n08'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'cobrso'
  Qp24:F2P  = '@n02'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'cobro'
  Qp24:F2P  = '@n01'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'Conven'
  Qp24:F2P  = '@n01'
  Qp24:F2T  = '0'
  ADD(QPar24)
  SysRec# = false
  FREE(Loc::QHlist4)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar24,SysRec#)
         QHL4:Id      = SysRec#
         QHL4:Nombre  = Qp24:F2N
         QHL4:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL4:Pict    = Qp24:F2P
         QHL4:Tot    = Qp24:F2T
         ADD(Loc::QHlist4)
      Else
        break
     END
  END
  Loc::Titulo4 ='EMPLEADOS'
 
 SavPath4 = PATH()
  Exportar(Loc::QHlist4,BRW1.Q,QPar4,0,Loc::Titulo4,Evo::Group4)
 IF Not EC::LoadI_4 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath4)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Browse_Emplea')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('factivos',factivos)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Emplea,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon EPD:Nrotar1_sue for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,EPD:KeyT1_Sue)   ! Add the sort order for EPD:KeyT1_Sue for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?EPD:Nrotar1_sue,EPD:Nrotar1_sue,1,BRW1) ! Initialize the browse locator using ?EPD:Nrotar1_sue using key: EPD:KeyT1_Sue , EPD:Nrotar1_sue
  BRW1.SetFilter('(factivos = 0 or (factivos = 1 and upper(EPD:activo_sue) = ''S''))') ! Apply filter expression to browse
  BRW1.AddResetField(FACTIVOS)                             ! Apply the reset field
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon EPD:Nrotar2_sue for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,EPD:KeyT2_Sue)   ! Add the sort order for EPD:KeyT2_Sue for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?EPD:Nrotar2_sue,EPD:Nrotar2_sue,1,BRW1) ! Initialize the browse locator using ?EPD:Nrotar2_sue using key: EPD:KeyT2_Sue , EPD:Nrotar2_sue
  BRW1.SetFilter('(factivos = 0 or (factivos = 1 and upper(EPD:activo_sue) = ''S''))') ! Apply filter expression to browse
  BRW1.AddResetField(FACTIVOS)                             ! Apply the reset field
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon EPD:Nrotar3_sue for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,EPD:KeyT3_Sue)   ! Add the sort order for EPD:KeyT3_Sue for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(?EPD:Nrotar3_sue,EPD:Nrotar3_sue,1,BRW1) ! Initialize the browse locator using ?EPD:Nrotar3_sue using key: EPD:KeyT3_Sue , EPD:Nrotar3_sue
  BRW1.SetFilter('(factivos = 0 or (factivos = 1 and upper(EPD:activo_sue) = ''S''))') ! Apply filter expression to browse
  BRW1.AddResetField(FACTIVOS)                             ! Apply the reset field
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon EPD:nombre_sue for sort order 4
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,EPD:key4_sue)    ! Add the sort order for EPD:key4_sue for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(?EPD:nombre_sue,EPD:nombre_sue,1,BRW1) ! Initialize the browse locator using ?EPD:nombre_sue using key: EPD:key4_sue , EPD:nombre_sue
  BRW1.SetFilter('(factivos = 0 or (factivos = 1 and upper(EPD:activo_sue) = ''S''))') ! Apply filter expression to browse
  BRW1.AddResetField(FACTIVOS)                             ! Apply the reset field
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon EPD:RCod1_Sue for sort order 5
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,EPD:Key1_sue)    ! Add the sort order for EPD:Key1_sue for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(?EPD:RCod1_Sue,EPD:RCod1_Sue,1,BRW1) ! Initialize the browse locator using ?EPD:RCod1_Sue using key: EPD:Key1_sue , EPD:RCod1_Sue
  BRW1.SetFilter('(factivos = 0 or (factivos = 1 and upper(EPD:activo_sue) = ''S''))') ! Apply filter expression to browse
  BRW1.AddResetField(FACTIVOS)                             ! Apply the reset field
  BRW1.AddField(EPD:Servic_sue,BRW1.Q.EPD:Servic_sue)      ! Field EPD:Servic_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Legajo_sue,BRW1.Q.EPD:Legajo_sue)      ! Field EPD:Legajo_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:nombre_sue,BRW1.Q.EPD:nombre_sue)      ! Field EPD:nombre_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:activo_sue,BRW1.Q.EPD:activo_sue)      ! Field EPD:activo_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Nrotar1_sue,BRW1.Q.EPD:Nrotar1_sue)    ! Field EPD:Nrotar1_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Nrotar2_sue,BRW1.Q.EPD:Nrotar2_sue)    ! Field EPD:Nrotar2_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Nrotar3_sue,BRW1.Q.EPD:Nrotar3_sue)    ! Field EPD:Nrotar3_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Tipo_sue,BRW1.Q.EPD:Tipo_sue)          ! Field EPD:Tipo_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Sector_Sue,BRW1.Q.EPD:Sector_Sue)      ! Field EPD:Sector_Sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Seccion_sue,BRW1.Q.EPD:Seccion_sue)    ! Field EPD:Seccion_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:domici_sue,BRW1.Q.EPD:domici_sue)      ! Field EPD:domici_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:locali_sue,BRW1.Q.EPD:locali_sue)      ! Field EPD:locali_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:sexo_sue,BRW1.Q.EPD:sexo_sue)          ! Field EPD:sexo_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:cuil_sue,BRW1.Q.EPD:cuil_sue)          ! Field EPD:cuil_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:fenaci_sue,BRW1.Q.EPD:fenaci_sue)      ! Field EPD:fenaci_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:nobrso_sue,BRW1.Q.EPD:nobrso_sue)      ! Field EPD:nobrso_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:cobrso_sue,BRW1.Q.EPD:cobrso_sue)      ! Field EPD:cobrso_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:cobro_sue,BRW1.Q.EPD:cobro_sue)        ! Field EPD:cobro_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:Conven_sue,BRW1.Q.EPD:Conven_sue)      ! Field EPD:Conven_sue is a hot field or requires assignment from browse
  BRW1.AddField(EPD:RCod1_Sue,BRW1.Q.EPD:RCod1_Sue)        ! Field EPD:RCod1_Sue is a hot field or requires assignment from browse
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
    Relate:Emplea.Close
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse4
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


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
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

