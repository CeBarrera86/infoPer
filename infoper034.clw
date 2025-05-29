

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER034.INC'),ONCE        !Local module procedure declarations
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the DETALLE_LICENCIA file
!!! </summary>
ProcesarAdelantoSueldo PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:titulo           STRING(4000)                          !
Loc:AdelantoSueldo   STRING(1)                             !
Loc:desde            DATE                                  !
Loc:hasta            DATE                                  !
BRW1::View:Browse    VIEW(DETALLE_LICENCIA)
                       PROJECT(DLIC:DLIC_LEGAJO)
                       PROJECT(DLIC:DLIC_ANIO)
                       PROJECT(DLIC:DLIC_INICIO_DATE)
                       PROJECT(DLIC:DLIC_INICIO_TIME)
                       PROJECT(DLIC:DLIC_FIN_DATE)
                       PROJECT(DLIC:DLIC_FIN_TIME)
                       PROJECT(DLIC:DLIC_TOMA)
                       PROJECT(DLIC:DLIC_ASUELDO)
                       PROJECT(DLIC:DLIC_FECHA_DATE)
                       PROJECT(DLIC:DLIC_COBRAR)
                       PROJECT(DLIC:DLIC_ESTADO)
                       PROJECT(DLIC:DLIC_INICIO)
                       PROJECT(DLIC:DLIC_FIN)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
DLIC:DLIC_LEGAJO       LIKE(DLIC:DLIC_LEGAJO)         !List box control field - type derived from field
DLIC:DLIC_ANIO         LIKE(DLIC:DLIC_ANIO)           !List box control field - type derived from field
DLIC:DLIC_INICIO_DATE  LIKE(DLIC:DLIC_INICIO_DATE)    !List box control field - type derived from field
DLIC:DLIC_INICIO_TIME  LIKE(DLIC:DLIC_INICIO_TIME)    !List box control field - type derived from field
DLIC:DLIC_FIN_DATE     LIKE(DLIC:DLIC_FIN_DATE)       !List box control field - type derived from field
DLIC:DLIC_FIN_TIME     LIKE(DLIC:DLIC_FIN_TIME)       !List box control field - type derived from field
DLIC:DLIC_TOMA         LIKE(DLIC:DLIC_TOMA)           !List box control field - type derived from field
DLIC:DLIC_ASUELDO      LIKE(DLIC:DLIC_ASUELDO)        !List box control field - type derived from field
DLIC:DLIC_FECHA_DATE   LIKE(DLIC:DLIC_FECHA_DATE)     !List box control field - type derived from field
DLIC:DLIC_COBRAR       LIKE(DLIC:DLIC_COBRAR)         !List box control field - type derived from field
DLIC:DLIC_ESTADO       LIKE(DLIC:DLIC_ESTADO)         !List box control field - type derived from field
DLIC:DLIC_INICIO       LIKE(DLIC:DLIC_INICIO)         !Primary key field - type derived from field
DLIC:DLIC_FIN          LIKE(DLIC:DLIC_FIN)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Adelanto de Sueldo'),AT(,,347,358),FONT('Microsoft Sans Serif',8,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ProcesarAdelantoSueldo'), |
  SYSTEM
                       LIST,AT(9,74,333,229),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('48R(2)|M~LEGAJO~C(' & |
  '0)@n_7@40C(2)|M~LICENCIA~C(0)@n04@60C(2)|M~INICIO~C(0)@d17@0R(2)|M~DLIC INICIO TIME~' & |
  'C(0)@t7@60C(2)|M~FIN~C(0)@d17@0R(2)|M~DLIC FIN TIME~C(0)@t7@0R(2)|M~DLIC TOMA~C(0)@n' & |
  '3@54C(2)|M~ADELANTO~L(2)@s1@40C(2)|M~FECHA~C(0)@d17@0L(2)|M~DLIC COBRAR~@s1@0L(2)|M~' & |
  'DLIC ESTADO~L(0)@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the DETALLE_LICENCIA file')
                       BUTTON('&Insert'),AT(68,180,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(111,180,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(152,180,42,12),USE(?Delete),HIDE
                       GROUP,AT(7,9,335,56),USE(?GROUP1),BOXED
                         ENTRY(@d17),AT(18,34,63,14),USE(Loc:desde),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         ENTRY(@d17),AT(111,34,63,14),USE(Loc:hasta),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         BUTTON,AT(85,34,14,14),USE(?Calendar)
                         BUTTON,AT(179,34,14,14),USE(?Calendar:2)
                         STRING('Desde:'),AT(18,20),USE(?STRING1),FONT(,10,COLOR:Navy,FONT:bold)
                         STRING('Hasta:'),AT(111,20,34,12),USE(?STRING1:2),FONT(,10,COLOR:Navy,FONT:bold)
                         OPTION,AT(201,13,82),USE(Loc:AdelantoSueldo),FONT(,10,COLOR:Navy,FONT:bold)
                           RADIO('Pendientes'),AT(210,18),USE(?OPTION1:RADIO1),VALUE('P')
                           RADIO('Ejecutados'),AT(210,32),USE(?OPTION1:RADIO2),VALUE('S')
                           RADIO('Todos'),AT(210,47),USE(?OPTION1:RADIO3),FONT(,,COLOR:Navy)
                         END
                         BUTTON('Filtrar'),AT(288,15,43,45),USE(?BUTTON1),FONT(,10,COLOR:Green,FONT:bold),FLAT
                       END
                       GROUP,AT(9,310,332,43),USE(?GROUP2),FONT(,10,,FONT:bold),BOXED
                         BUTTON('Salir'),AT(241,318,89,26),USE(?BUTTON3),FONT(,10,,FONT:bold),LEFT,ICON('SALIR.ICO'), |
  FLAT,STD(STD:Close)
                         BUTTON('E&xportar/Imprimir'),AT(21,318,124,26),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       END
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
EditInPlace::DLIC:DLIC_INICIO_TIME EditEntryClass          ! Edit-in-place class for field DLIC:DLIC_INICIO_TIME
EditInPlace::DLIC:DLIC_FIN_TIME EditEntryClass             ! Edit-in-place class for field DLIC:DLIC_FIN_TIME
EditInPlace::DLIC:DLIC_TOMA EditEntryClass                 ! Edit-in-place class for field DLIC:DLIC_TOMA
EditInPlace::DLIC:DLIC_ASUELDO CLASS(EditCheckClass)       ! Edit-in-place class for field DLIC:DLIC_ASUELDO
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::DLIC:DLIC_COBRAR EditEntryClass               ! Edit-in-place class for field DLIC:DLIC_COBRAR
EditInPlace::DLIC:DLIC_ESTADO EditEntryClass               ! Edit-in-place class for field DLIC:DLIC_ESTADO
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar2            CalendarClass
Calendar3            CalendarClass
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
  Evo::App4          = 'infoper'
  Evo::Procedure4          = GlobalErrors.GetProcedureName()& 4
 
  FREE(QPar4)
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,'
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
   Q4:FieldPar  = 14
  ADD(QPar4)   !.20
 
   Q4:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar4)   !.21
 
   Q4:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar4)   !.22
 
   CLEAR(Q4:FieldPar)
  ADD(QPar4)   ! 23 Caracteres Encoding para xml
 
  Q4:FieldPar  = '0'
  ADD(QPar4)   ! 24 Use Open Office
 
   Q4:FieldPar  = 'golmedo'
  ADD(QPar4) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 26 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 27 
  Q4:FieldPar  = '' 
  ADD(QPar4)   ! 28 
  Q4:FieldPar  = 'BEXPORT' 
  ADD(QPar4)   ! 29 infoper034.clw
 !!!!!
 
 
  FREE(QPar24)
       Qp24:F2N  = 'LEGAJO'
  Qp24:F2P  = '@n_7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LICENCIA'
  Qp24:F2P  = '@n04'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'INICIO'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@t7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'FIN'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@t7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'TOMA'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'ADELANTO'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'FECHA'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'ESTADO'
  Qp24:F2P  = '@s1'
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
  Loc::Titulo4 =Loc:titulo
 
 SavPath4 = PATH()
  Exportar(Loc::QHlist4,BRW1.Q,QPar4,0,Loc::Titulo4,Evo::Group4)
 IF Not EC::LoadI_4 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath4)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcesarAdelantoSueldo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:desde',Loc:desde)                              ! Added by: BrowseBox(ABC)
  BIND('Loc:hasta',Loc:hasta)                              ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ASUELDO',DLIC:DLIC_ASUELDO)              ! Added by: BrowseBox(ABC)
  BIND('Loc:AdelantoSueldo',Loc:AdelantoSueldo)            ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ESTADO',DLIC:DLIC_ESTADO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_LEGAJO',DLIC:DLIC_LEGAJO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ANIO',DLIC:DLIC_ANIO)                    ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_TOMA',DLIC:DLIC_TOMA)                    ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_COBRAR',DLIC:DLIC_COBRAR)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_INICIO',DLIC:DLIC_INICIO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_FIN',DLIC:DLIC_FIN)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DETALLE_LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,DLIC:PK_DETALLE_LICENCIA)             ! Add the sort order for DLIC:PK_DETALLE_LICENCIA for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,DLIC:DLIC_LEGAJO,,BRW1)        ! Initialize the browse locator using  using key: DLIC:PK_DETALLE_LICENCIA , DLIC:DLIC_LEGAJO
  BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and DLIC:DLIC_ASUELDO = Loc:AdelantoSueldo and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
  BRW1.AddField(DLIC:DLIC_LEGAJO,BRW1.Q.DLIC:DLIC_LEGAJO)  ! Field DLIC:DLIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ANIO,BRW1.Q.DLIC:DLIC_ANIO)      ! Field DLIC:DLIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_INICIO_DATE,BRW1.Q.DLIC:DLIC_INICIO_DATE) ! Field DLIC:DLIC_INICIO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_INICIO_TIME,BRW1.Q.DLIC:DLIC_INICIO_TIME) ! Field DLIC:DLIC_INICIO_TIME is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FIN_DATE,BRW1.Q.DLIC:DLIC_FIN_DATE) ! Field DLIC:DLIC_FIN_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FIN_TIME,BRW1.Q.DLIC:DLIC_FIN_TIME) ! Field DLIC:DLIC_FIN_TIME is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_TOMA,BRW1.Q.DLIC:DLIC_TOMA)      ! Field DLIC:DLIC_TOMA is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ASUELDO,BRW1.Q.DLIC:DLIC_ASUELDO) ! Field DLIC:DLIC_ASUELDO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FECHA_DATE,BRW1.Q.DLIC:DLIC_FECHA_DATE) ! Field DLIC:DLIC_FECHA_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_COBRAR,BRW1.Q.DLIC:DLIC_COBRAR)  ! Field DLIC:DLIC_COBRAR is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ESTADO,BRW1.Q.DLIC:DLIC_ESTADO)  ! Field DLIC:DLIC_ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_INICIO,BRW1.Q.DLIC:DLIC_INICIO)  ! Field DLIC:DLIC_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FIN,BRW1.Q.DLIC:DLIC_FIN)        ! Field DLIC:DLIC_FIN is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  Loc:desde = date(MONTH(today()),01,year(today()))
  Loc:hasta = today()
  
  Loc:AdelantoSueldo = 'P'
  
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_LICENCIA.Close
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
    CASE ACCEPTED()
    OF ?EvoExportar
      !MESSAGE('ADELANTOS DE SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17))
      Loc:titulo = 'ADELANTOS DE SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar2.SelectOnClose = True
      Calendar2.Ask('Seleccione Fecha Desde:',Loc:desde)
      IF Calendar2.Response = RequestCompleted THEN
      Loc:desde=Calendar2.SelectedDate
      DISPLAY(?Loc:desde)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar3.SelectOnClose = True
      Calendar3.Ask('Seleccione Fecha Hasta',Loc:hasta)
      IF Calendar3.Response = RequestCompleted THEN
      Loc:hasta=Calendar3.SelectedDate
      DISPLAY(?Loc:hasta)
      END
      ThisWindow.Reset(True)
    OF ?BUTTON1
      ThisWindow.Update()
      IF Loc:AdelantoSueldo <> 'T' THEN   
      	BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and DLIC:DLIC_ASUELDO = Loc:AdelantoSueldo and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      ELSE
      	BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_ASUELDO = ''S'' OR DLIC:DLIC_ASUELDO = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
         BRW1.ResetFromFile()
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! DLIC:DLIC_LEGAJO Disable
  SELF.AddEditControl(,2) ! DLIC:DLIC_ANIO Disable
  SELF.AddEditControl(,3) ! DLIC:DLIC_INICIO_DATE Disable
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_INICIO_TIME,4)
  SELF.AddEditControl(,5) ! DLIC:DLIC_FIN_DATE Disable
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_FIN_TIME,6)
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_TOMA,7)
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_ASUELDO,8)
  SELF.AddEditControl(,9) ! DLIC:DLIC_FECHA_DATE Disable
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_COBRAR,10)
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_ESTADO,11)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


EditInPlace::DLIC:DLIC_ASUELDO.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::DLIC:DLIC_ASUELDO.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'P'


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the DETALLE_LICENCIA file
!!! </summary>
ProcesarAdelantoRetribucionLicencia PROCEDURE 

Neto                 DECIMAL(7,2)                          !
Descuento            DECIMAL(7,2)                          !
Total                DECIMAL(7,2)                          !
CurrentTab           STRING(80)                            !
Loc:titulo           STRING(4000)                          !
Loc:AdelantoSueldo   STRING(1)                             !
Loc:desde            DATE                                  !
Loc:hasta            DATE                                  !
BRW1::View:Browse    VIEW(DETALLE_LICENCIA)
                       PROJECT(DLIC:DLIC_LEGAJO)
                       PROJECT(DLIC:DLIC_ANIO)
                       PROJECT(DLIC:DLIC_COBRAR)
                       PROJECT(DLIC:DLIC_FECHA_DATE)
                       PROJECT(DLIC:DLIC_ESTADO)
                       PROJECT(DLIC:DLIC_INICIO)
                       PROJECT(DLIC:DLIC_FIN)
                       JOIN(LIC:PK_LICENCIA,DLIC:DLIC_LEGAJO,DLIC:DLIC_ANIO)
                         PROJECT(LIC:LIC_PAGAN)
                         PROJECT(LIC:LIC_LEGAJO)
                         PROJECT(LIC:LIC_ANIO)
                         JOIN(EPL:PK_EMPLEADOS,LIC:LIC_LEGAJO)
                           PROJECT(EPL:EMP_NOMBRE)
                           PROJECT(EPL:EMP_VACACION)
                           PROJECT(EPL:EMP_LIQUIDACION)
                           PROJECT(EPL:EMP_LEGAJO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
DLIC:DLIC_LEGAJO       LIKE(DLIC:DLIC_LEGAJO)         !List box control field - type derived from field
DLIC:DLIC_ANIO         LIKE(DLIC:DLIC_ANIO)           !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
DLIC:DLIC_COBRAR       LIKE(DLIC:DLIC_COBRAR)         !List box control field - type derived from field
EPL:EMP_VACACION       LIKE(EPL:EMP_VACACION)         !List box control field - type derived from field
EPL:EMP_LIQUIDACION    LIKE(EPL:EMP_LIQUIDACION)      !List box control field - type derived from field
LIC:LIC_PAGAN          LIKE(LIC:LIC_PAGAN)            !List box control field - type derived from field
Neto                   LIKE(Neto)                     !List box control field - type derived from local data
Descuento              LIKE(Descuento)                !List box control field - type derived from local data
Total                  LIKE(Total)                    !List box control field - type derived from local data
DLIC:DLIC_FECHA_DATE   LIKE(DLIC:DLIC_FECHA_DATE)     !List box control field - type derived from field
DLIC:DLIC_ESTADO       LIKE(DLIC:DLIC_ESTADO)         !List box control field - type derived from field
DLIC:DLIC_INICIO       LIKE(DLIC:DLIC_INICIO)         !Primary key field - type derived from field
DLIC:DLIC_FIN          LIKE(DLIC:DLIC_FIN)            !Primary key field - type derived from field
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !Related join file key field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !Related join file key field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Adelanto de Retribución por Licencia'),AT(,,509,358),FONT('Microsoft Sans Serif',8, |
  COLOR:Black,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI, |
  HLP('ProcesarAdelantoSueldo'),SYSTEM
                       LIST,AT(9,78,495,229),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('40R(2)|M~LEGAJO~C(' & |
  '0)@n_7@45C(2)|M~LICENCIA~C(0)@n04@0L(2)|M~EMPLEADO~C(0)@s31@58C(2)|M~ADELANTO~@s1@45' & |
  'C(2)|M~9930~L(12)@n_12.2@45C(2)|M~LIQ~C(0)@s9@40C(2)|M~PAGAN~C(0)@n3@55C(2)|M~NETO~R' & |
  '(12)@n_12.2@50C(2)|M~19%~C(1)@n_12.2@52C(2)|M~TOTAL~L(12)@n_12.2@60C(2)|M~FECHA~C(0)' & |
  '@d17@0L(2)|M~DLIC ESTADO~L(0)@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the DETAL' & |
  'LE_LICENCIA file')
                       BUTTON('&Insert'),AT(68,180,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(111,180,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(152,180,42,12),USE(?Delete),HIDE
                       GROUP,AT(7,9,493,56),USE(?GROUP1),BOXED
                         ENTRY(@d17),AT(18,34,63,14),USE(Loc:desde),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         ENTRY(@d17),AT(111,34,63,14),USE(Loc:hasta),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         BUTTON,AT(85,34,14,14),USE(?Calendar)
                         BUTTON,AT(179,34,14,14),USE(?Calendar:2)
                         STRING('Desde:'),AT(18,20),USE(?STRING1),FONT(,10,COLOR:Navy,FONT:bold)
                         STRING('Hasta:'),AT(111,20,34,12),USE(?STRING1:2),FONT(,10,COLOR:Navy,FONT:bold)
                         OPTION,AT(209,13,217),USE(Loc:AdelantoSueldo),FONT(,10,COLOR:Navy,FONT:bold)
                           RADIO('Pendientes'),AT(220,28,69,15),USE(?OPTION1:RADIO1),VALUE('P')
                           RADIO('Ejecutados'),AT(293,28,69,15),USE(?OPTION1:RADIO2),VALUE('S')
                           RADIO('Todos'),AT(367,28,48,15),USE(?OPTION1:RADIO3),FONT(,,COLOR:Navy)
                         END
                         BUTTON('Filtrar'),AT(445,15,43,45),USE(?BUTTON1),FONT(,10,COLOR:Green,FONT:bold),FLAT
                       END
                       GROUP,AT(9,310,495,43),USE(?GROUP2),FONT(,10,,FONT:bold),BOXED
                         BUTTON('Salir'),AT(405,318,89,26),USE(?BUTTON3),FONT(,10,,FONT:bold),LEFT,ICON('SALIR.ICO'), |
  FLAT,STD(STD:Close)
                         BUTTON('E&xportar/Imprimir'),AT(21,318,124,26),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       END
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     CLASS(BrowseEIPManager)               ! Browse EIP Manager for Browse using ?Browse:1
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

EditInPlace::EPL:EMP_NOMBRE EditEntryClass                 ! Edit-in-place class for field EPL:EMP_NOMBRE
EditInPlace::DLIC:DLIC_COBRAR CLASS(EditCheckClass)        ! Edit-in-place class for field DLIC:DLIC_COBRAR
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::EPL:EMP_VACACION EditEntryClass               ! Edit-in-place class for field EPL:EMP_VACACION
EditInPlace::EPL:EMP_LIQUIDACION EditEntryClass            ! Edit-in-place class for field EPL:EMP_LIQUIDACION
EditInPlace::LIC:LIC_PAGAN EditEntryClass                  ! Edit-in-place class for field LIC:LIC_PAGAN
EditInPlace::Neto    EditEntryClass                        ! Edit-in-place class for field Neto
EditInPlace::Descuento EditEntryClass                      ! Edit-in-place class for field Descuento
EditInPlace::Total   EditEntryClass                        ! Edit-in-place class for field Total
EditInPlace::DLIC:DLIC_ESTADO EditEntryClass               ! Edit-in-place class for field DLIC:DLIC_ESTADO
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar2            CalendarClass
Calendar3            CalendarClass
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
  Evo::App4          = 'infoper'
  Evo::Procedure4          = GlobalErrors.GetProcedureName()& 4
 
  FREE(QPar4)
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
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
   Q4:FieldPar  = 14
  ADD(QPar4)   !.20
 
   Q4:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar4)   !.21
 
   Q4:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar4)   !.22
 
   CLEAR(Q4:FieldPar)
  ADD(QPar4)   ! 23 Caracteres Encoding para xml
 
  Q4:FieldPar  = '0'
  ADD(QPar4)   ! 24 Use Open Office
 
   Q4:FieldPar  = 'golmedo'
  ADD(QPar4) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 26 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 27 
  Q4:FieldPar  = '' 
  ADD(QPar4)   ! 28 
  Q4:FieldPar  = 'BEXPORT' 
  ADD(QPar4)   ! 29 infoper034.clw
 !!!!!
 
 
  FREE(QPar24)
       Qp24:F2N  = 'LEGAJO'
  Qp24:F2P  = '@n_7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LICENCIA'
  Qp24:F2P  = '@n04'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s31'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '9930'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LIQ'
  Qp24:F2P  = '@s9'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DIAS'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'NETO'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '19%'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'TOTAL'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s1'
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
  Loc::Titulo4 =Loc:titulo
 
 SavPath4 = PATH()
  Exportar(Loc::QHlist4,BRW1.Q,QPar4,0,Loc::Titulo4,Evo::Group4)
 IF Not EC::LoadI_4 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath4)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcesarAdelantoRetribucionLicencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:desde',Loc:desde)                              ! Added by: BrowseBox(ABC)
  BIND('Loc:hasta',Loc:hasta)                              ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_COBRAR',DLIC:DLIC_COBRAR)                ! Added by: BrowseBox(ABC)
  BIND('Loc:AdelantoSueldo',Loc:AdelantoSueldo)            ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ESTADO',DLIC:DLIC_ESTADO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_LEGAJO',DLIC:DLIC_LEGAJO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ANIO',DLIC:DLIC_ANIO)                    ! Added by: BrowseBox(ABC)
  BIND('Neto',Neto)                                        ! Added by: BrowseBox(ABC)
  BIND('Descuento',Descuento)                              ! Added by: BrowseBox(ABC)
  BIND('Total',Total)                                      ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_INICIO',DLIC:DLIC_INICIO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_FIN',DLIC:DLIC_FIN)                      ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_LEGAJO',LIC:LIC_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_ANIO',LIC:LIC_ANIO)                        ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DETALLE_LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,DLIC:PK_DETALLE_LICENCIA)             ! Add the sort order for DLIC:PK_DETALLE_LICENCIA for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,DLIC:DLIC_LEGAJO,,BRW1)        ! Initialize the browse locator using  using key: DLIC:PK_DETALLE_LICENCIA , DLIC:DLIC_LEGAJO
  BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and DLIC:DLIC_COBRAR= Loc:AdelantoSueldo and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
  BRW1.AddField(DLIC:DLIC_LEGAJO,BRW1.Q.DLIC:DLIC_LEGAJO)  ! Field DLIC:DLIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ANIO,BRW1.Q.DLIC:DLIC_ANIO)      ! Field DLIC:DLIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_COBRAR,BRW1.Q.DLIC:DLIC_COBRAR)  ! Field DLIC:DLIC_COBRAR is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_VACACION,BRW1.Q.EPL:EMP_VACACION)  ! Field EPL:EMP_VACACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LIQUIDACION,BRW1.Q.EPL:EMP_LIQUIDACION) ! Field EPL:EMP_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_PAGAN,BRW1.Q.LIC:LIC_PAGAN)        ! Field LIC:LIC_PAGAN is a hot field or requires assignment from browse
  BRW1.AddField(Neto,BRW1.Q.Neto)                          ! Field Neto is a hot field or requires assignment from browse
  BRW1.AddField(Descuento,BRW1.Q.Descuento)                ! Field Descuento is a hot field or requires assignment from browse
  BRW1.AddField(Total,BRW1.Q.Total)                        ! Field Total is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FECHA_DATE,BRW1.Q.DLIC:DLIC_FECHA_DATE) ! Field DLIC:DLIC_FECHA_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ESTADO,BRW1.Q.DLIC:DLIC_ESTADO)  ! Field DLIC:DLIC_ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_INICIO,BRW1.Q.DLIC:DLIC_INICIO)  ! Field DLIC:DLIC_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FIN,BRW1.Q.DLIC:DLIC_FIN)        ! Field DLIC:DLIC_FIN is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_LEGAJO,BRW1.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_ANIO,BRW1.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  Loc:desde = date(MONTH(today()),01,year(today()))
  Loc:hasta = today()
  
  Loc:AdelantoSueldo = 'P'
  
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_LICENCIA.Close
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
    CASE ACCEPTED()
    OF ?EvoExportar
      !MESSAGE('ADELANTOS DE SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17))
      Loc:titulo = 'ADELANTOS DE RETRIBUCIÓN POR LICENCIA - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar2.SelectOnClose = True
      Calendar2.Ask('Seleccione Fecha Desde:',Loc:desde)
      IF Calendar2.Response = RequestCompleted THEN
      Loc:desde=Calendar2.SelectedDate
      DISPLAY(?Loc:desde)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar3.SelectOnClose = True
      Calendar3.Ask('Seleccione Fecha Hasta',Loc:hasta)
      IF Calendar3.Response = RequestCompleted THEN
      Loc:hasta=Calendar3.SelectedDate
      DISPLAY(?Loc:hasta)
      END
      ThisWindow.Reset(True)
    OF ?BUTTON1
      ThisWindow.Update()
      IF Loc:AdelantoSueldo <> 'T' THEN   
      	BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and DLIC:DLIC_COBRAR = Loc:AdelantoSueldo and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      ELSE
      	BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_COBRAR = ''S'' OR DLIC:DLIC_COBRAR = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
         BRW1.ResetFromFile()
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! DLIC:DLIC_LEGAJO Disable
  SELF.AddEditControl(,2) ! DLIC:DLIC_ANIO Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_NOMBRE,3)
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_COBRAR,4)
  SELF.AddEditControl(EditInPlace::EPL:EMP_VACACION,5)
  SELF.AddEditControl(EditInPlace::EPL:EMP_LIQUIDACION,6)
  SELF.AddEditControl(EditInPlace::LIC:LIC_PAGAN,7)
  SELF.AddEditControl(EditInPlace::Neto,8)
  SELF.AddEditControl(EditInPlace::Descuento,9)
  SELF.AddEditControl(EditInPlace::Total,10)
  SELF.AddEditControl(,11) ! DLIC:DLIC_FECHA_DATE Disable
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_ESTADO,12)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  !MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  Total = EPL:EMP_VACACION * LIC:LIC_PAGAN
  Descuento = (Total * 19) /100
  Neto = Total - Descuento
  PARENT.SetQueueRecord
  


BRW1::EIPManager.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
  LIC:LIC_ANIO = DLIC:DLIC_ANIO
  GET(LICENCIA,LIC:PK_LICENCIA)
  IF NOT ERRORCODE() THEN
  	LIC:LIC_COBRO = DLIC:DLIC_COBRAR 
  	IF DLIC:DLIC_COBRAR = 'S' THEN
  		LIC:LIC_DEPOSITADA = 'S'
  		LIC:LIC_DEPOSITO_DATE = TODAY()
  		LIC:LIC_DEPOSITO_TIME = 0
  		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  	END	
  	IF 	DLIC:DLIC_COBRAR = 'P' THEN
  		LIC:LIC_DEPOSITADA = 'N'
  		SETNULL(LIC:LIC_DEPOSITO_DATE)
  		SETNULL(LIC:LIC_DEPOSITO_TIME)
  		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  	END		
  	Access:LICENCIA.Update()
  END	
  ReturnValue = PARENT.Kill()
  RETURN ReturnValue


EditInPlace::DLIC:DLIC_COBRAR.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::DLIC:DLIC_COBRAR.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'P'


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the DETALLE_LICENCIA file
!!! </summary>
ProcesarASueldoRetribucionLicencia_DiasdeViaje PROCEDURE 

Neto                 DECIMAL(7,2)                          !
Descuento            DECIMAL(7,2)                          !
Total                DECIMAL(7,2)                          !
CurrentTab           STRING(80)                            !
Loc:titulo           STRING(4000)                          !
Loc:Sueldo           STRING(1)                             !
Loc:DiaViaje         STRING(1)                             !
Loc:desde            DATE                                  !
Loc:depositara       DATE                                  !
Loc:hasta            DATE                                  !
BRW1::View:Browse    VIEW(LICENCIA)
                       PROJECT(LIC:LIC_LEGAJO)
                       PROJECT(LIC:LIC_ANIO)
                       PROJECT(LIC:LIC_PAGAN)
                       PROJECT(LIC:LIC_COBRO)
                       PROJECT(LIC:LIC_DIAS_VIAJE)
                       PROJECT(LIC:LIC_DEPOSITO_DATE)
                       JOIN(DV:PK_DIAS_VIAJE,LIC:LIC_LEGAJO,LIC:LIC_ANIO)
                         PROJECT(DV:DV_DIAS)
                         PROJECT(DV:DV_DEPOSITADO_DATE)
                         PROJECT(DV:DV_LEGAJO)
                         PROJECT(DV:DV_LICENCIA)
                       END
                       JOIN(EPL:PK_EMPLEADOS,LIC:LIC_LEGAJO)
                         PROJECT(EPL:EMP_NOMBRE)
                         PROJECT(EPL:EMP_VACACION)
                         PROJECT(EPL:EMP_LIQUIDACION)
                         PROJECT(EPL:EMP_LEGAJO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !List box control field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_VACACION       LIKE(EPL:EMP_VACACION)         !List box control field - type derived from field
EPL:EMP_LIQUIDACION    LIKE(EPL:EMP_LIQUIDACION)      !List box control field - type derived from field
LIC:LIC_PAGAN          LIKE(LIC:LIC_PAGAN)            !List box control field - type derived from field
LIC:LIC_COBRO          LIKE(LIC:LIC_COBRO)            !List box control field - type derived from field
DV:DV_DIAS             LIKE(DV:DV_DIAS)               !List box control field - type derived from field
LIC:LIC_DIAS_VIAJE     LIKE(LIC:LIC_DIAS_VIAJE)       !List box control field - type derived from field
Neto                   LIKE(Neto)                     !List box control field - type derived from local data
Descuento              LIKE(Descuento)                !List box control field - type derived from local data
Total                  LIKE(Total)                    !List box control field - type derived from local data
LIC:LIC_DEPOSITO_DATE  LIKE(LIC:LIC_DEPOSITO_DATE)    !List box control field - type derived from field
DV:DV_DEPOSITADO_DATE  LIKE(DV:DV_DEPOSITADO_DATE)    !List box control field - type derived from field
Loc:depositara         LIKE(Loc:depositara)           !Browse hot field - type derived from local data
DV:DV_LEGAJO           LIKE(DV:DV_LEGAJO)             !Related join file key field - type derived from field
DV:DV_LICENCIA         LIKE(DV:DV_LICENCIA)           !Related join file key field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Retribución por Licencia y Días de Viaje a Sueldo'),AT(,,578,369),FONT('Microsoft ' & |
  'Sans Serif',8,COLOR:Black,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'), |
  GRAY,IMM,MDI,HLP('ProcesarAdelantoSueldo'),SYSTEM
                       LIST,AT(9,78,563,220),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('40C(2)|M~LEGAJO~C(' & |
  '0)@n_7@45C(2)|M~LICENCIA~C(0)@n04@0L(2)|M~EMPLEADO~C(0)@s31@45C(2)|M~9930~L(12)@n_12' & |
  '.2@45C(2)|M~LIQ~C(0)@s9@40C(2)|M~DIAS~C(0)@n3@40C(2)|M~PAGAR~C(0)@s1@40C(2)|M~D VIAJ' & |
  'E~C(0)@n3@40C(2)|M~PAGAR~C(0)@s1@55C(2)|M~NETO~R(12)@n_12.2@50C(2)|M~19%~C(1)@n_12.2' & |
  '@52C(2)|M~TOTAL~L(12)@n_12.2@40C(2)|M~DEPOSITADA~C(0)@d17@40C(2)|M~DV DEPOSITADO DAT' & |
  'E~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the DETALLE_LICENCIA file')
                       BUTTON('&Insert'),AT(68,180,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(111,180,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(152,180,42,12),USE(?Delete),HIDE
                       GROUP,AT(7,9,566,56),USE(?GROUP1),BOXED
                         STRING('Depositada:'),AT(18,20),USE(?STRING1),FONT(,10,COLOR:Navy,FONT:bold)
                         OPTION,AT(209,13,297),USE(Loc:Sueldo),FONT(,10,COLOR:Navy,FONT:bold)
                           RADIO('Pendientes'),AT(226,28,69,15),USE(?OPTION1:RADIO1),VALUE('P')
                           RADIO('Ejecutados'),AT(375,28,69,15),USE(?OPTION1:RADIO2),VALUE('S')
                         END
                         BUTTON('Filtrar'),AT(520,15,43,45),USE(?BUTTON1),FONT(,10,COLOR:Green,FONT:bold),FLAT
                         ENTRY(@d17),AT(29,38,60,10),USE(Loc:depositara)
                       END
                       GROUP,AT(9,310,563,43),USE(?GROUP2),FONT(,10,,FONT:bold),BOXED
                         BUTTON('Salir'),AT(469,318,89,26),USE(?BUTTON3),FONT(,10,,FONT:bold),LEFT,ICON('SALIR.ICO'), |
  FLAT,STD(STD:Close)
                         BUTTON('E&xportar/Imprimir'),AT(21,318,124,26),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       END
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::EIPManager     CLASS(BrowseEIPManager)               ! Browse EIP Manager for Browse using ?Browse:1
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

EditInPlace::EPL:EMP_NOMBRE EditEntryClass                 ! Edit-in-place class for field EPL:EMP_NOMBRE
EditInPlace::LIC:LIC_COBRO CLASS(EditCheckClass)           ! Edit-in-place class for field LIC:LIC_COBRO
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_DIAS_VIAJE CLASS(EditCheckClass)      ! Edit-in-place class for field LIC:LIC_DIAS_VIAJE
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_DEPOSITO_DATE EditEntryClass          ! Edit-in-place class for field LIC:LIC_DEPOSITO_DATE
EditInPlace::DV:DV_DEPOSITADO_DATE EditEntryClass          ! Edit-in-place class for field DV:DV_DEPOSITADO_DATE
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
  Evo::App4          = 'infoper'
  Evo::Procedure4          = GlobalErrors.GetProcedureName()& 4
 
  FREE(QPar4)
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,'
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
   Q4:FieldPar  = 14
  ADD(QPar4)   !.20
 
   Q4:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar4)   !.21
 
   Q4:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar4)   !.22
 
   CLEAR(Q4:FieldPar)
  ADD(QPar4)   ! 23 Caracteres Encoding para xml
 
  Q4:FieldPar  = '0'
  ADD(QPar4)   ! 24 Use Open Office
 
   Q4:FieldPar  = 'golmedo'
  ADD(QPar4) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 26 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 27 
  Q4:FieldPar  = '' 
  ADD(QPar4)   ! 28 
  Q4:FieldPar  = 'BEXPORT' 
  ADD(QPar4)   ! 29 infoper034.clw
 !!!!!
 
 
  FREE(QPar24)
       Qp24:F2N  = 'LEGAJO'
  Qp24:F2P  = '@n_7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LICENCIA'
  Qp24:F2P  = '@n04'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s31'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '9930'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LIQ'
  Qp24:F2P  = '@s9'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DIAS'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'PAGAR'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'D VIAJE'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'PAGAR'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'NETO'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '19%'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'TOTAL'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LIC DEPOSITO DATE'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DV DEPOSITADO DATE'
  Qp24:F2P  = '@d17'
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
  Loc::Titulo4 =Loc:titulo
 
 SavPath4 = PATH()
  Exportar(Loc::QHlist4,BRW1.Q,QPar4,0,Loc::Titulo4,Evo::Group4)
 IF Not EC::LoadI_4 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath4)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcesarASueldoRetribucionLicencia_DiasdeViaje')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LIC:LIC_COBRO',LIC:LIC_COBRO)                      ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_LEGAJO',LIC:LIC_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_ANIO',LIC:LIC_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('DV:DV_DIAS',DV:DV_DIAS)                            ! Added by: BrowseBox(ABC)
  BIND('Neto',Neto)                                        ! Added by: BrowseBox(ABC)
  BIND('Descuento',Descuento)                              ! Added by: BrowseBox(ABC)
  BIND('Total',Total)                                      ! Added by: BrowseBox(ABC)
  BIND('Loc:depositara',Loc:depositara)                    ! Added by: BrowseBox(ABC)
  BIND('DV:DV_LEGAJO',DV:DV_LEGAJO)                        ! Added by: BrowseBox(ABC)
  BIND('DV:DV_LICENCIA',DV:DV_LICENCIA)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.SetFilter('(LIC:LIC_DIAS_VIAJE = ''C''  OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
  BRW1.AddField(LIC:LIC_LEGAJO,BRW1.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_ANIO,BRW1.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_VACACION,BRW1.Q.EPL:EMP_VACACION)  ! Field EPL:EMP_VACACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LIQUIDACION,BRW1.Q.EPL:EMP_LIQUIDACION) ! Field EPL:EMP_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_PAGAN,BRW1.Q.LIC:LIC_PAGAN)        ! Field LIC:LIC_PAGAN is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_COBRO,BRW1.Q.LIC:LIC_COBRO)        ! Field LIC:LIC_COBRO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_DIAS,BRW1.Q.DV:DV_DIAS)              ! Field DV:DV_DIAS is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_DIAS_VIAJE,BRW1.Q.LIC:LIC_DIAS_VIAJE) ! Field LIC:LIC_DIAS_VIAJE is a hot field or requires assignment from browse
  BRW1.AddField(Neto,BRW1.Q.Neto)                          ! Field Neto is a hot field or requires assignment from browse
  BRW1.AddField(Descuento,BRW1.Q.Descuento)                ! Field Descuento is a hot field or requires assignment from browse
  BRW1.AddField(Total,BRW1.Q.Total)                        ! Field Total is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_DEPOSITO_DATE,BRW1.Q.LIC:LIC_DEPOSITO_DATE) ! Field LIC:LIC_DEPOSITO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_DEPOSITADO_DATE,BRW1.Q.DV:DV_DEPOSITADO_DATE) ! Field DV:DV_DEPOSITADO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(Loc:depositara,BRW1.Q.Loc:depositara)      ! Field Loc:depositara is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_LEGAJO,BRW1.Q.DV:DV_LEGAJO)          ! Field DV:DV_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_LICENCIA,BRW1.Q.DV:DV_LICENCIA)      ! Field DV:DV_LICENCIA is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  Loc:DiaViaje = 'C'
  
  Loc:Sueldo = 'P'
  
  loop Fecha# = (Date(MONTH(TODAY())+1,1,YEAR(TODAY()))-1) TO (Date(MONTH(TODAY()),1,YEAR(TODAY()))) BY -1
   if (Fecha# % 7) = 0 then cycle. ! porque es domingo
   if (Fecha# % 7) = 6 then cycle. ! porque es sabado
   !
   ! busco si es feriado
   !
   clear(FERIADOS:record)
  	FER:DIAFERIADO_DATE = Fecha#
  	FER:DIAFERIADO_TIME = 0
   if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
   !
  	Loc:depositara = Fecha#
  	BREAK
  end!loop
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_LICENCIA.Close
    Relate:LICENCIA.Close
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
    CASE ACCEPTED()
    OF ?EvoExportar
      !MESSAGE('ADELANTOS DE SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17))
      !Loc:titulo = 'RETRIBUCIÓN POR LICENCIA Y DIAS DE VIAJE A SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BUTTON1
      ThisWindow.Update()
      
      IF Loc:Sueldo = 'P' THEN   
      	BRW1.SetFilter('(LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''C'' AND DV:DV_DEPOSITADO_DATE <<> Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE <<>  Loc:depositara))') ! Apply filter expression to browse
      END
      IF Loc:Sueldo = 'S' THEN
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE =  Loc:depositara))') ! Apply filter expression to browse
      	
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = ''S'' AND LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      	
      BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S''))') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S'') AND (LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      !BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_COBRAR = ''S'' OR DLIC:DLIC_COBRAR = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('( LIC:LIC_DEPOSITO_DATE = Loc:depositara and (LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
         BRW1.ResetFromFile()
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! LIC:LIC_LEGAJO Disable
  SELF.AddEditControl(,2) ! LIC:LIC_ANIO Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_NOMBRE,3)
  SELF.AddEditControl(,4) ! EPL:EMP_VACACION Disable
  SELF.AddEditControl(,5) ! EPL:EMP_LIQUIDACION Disable
  SELF.AddEditControl(,6) ! LIC:LIC_PAGAN Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_COBRO,7)
  SELF.AddEditControl(,8) ! DV:DV_DIAS Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_DIAS_VIAJE,9)
  SELF.AddEditControl(,10) ! Neto Disable
  SELF.AddEditControl(,11) ! Descuento Disable
  SELF.AddEditControl(,12) ! Total Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_DEPOSITO_DATE,13)
  SELF.AddEditControl(EditInPlace::DV:DV_DEPOSITADO_DATE,14)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  !MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  IF LIC:LIC_DIAS_VIAJE = 'C' OR LIC:LIC_DIAS_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  ELSE
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  
  END	
  PARENT.SetQueueRecord
  


BRW1::EIPManager.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !!MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  IF DLIC:DLIC_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  ELSE
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  
  END	
  
  !LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
  !LIC:LIC_ANIO = DLIC:DLIC_ANIO
  !GET(LICENCIA,LIC:PK_LICENCIA)
  !IF NOT ERRORCODE() THEN
  	!LIC:LIC_COBRO = DLIC:DLIC_COBRAR 
  	IF LIC:LIC_COBRO = 'S' THEN
  		LIC:LIC_DEPOSITADA = 'S'
  		LIC:LIC_DEPOSITO_DATE = Loc:depositara
  		LIC:LIC_DEPOSITO_TIME = 0
  		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  	END	
  	IF 	LIC:LIC_COBRO = 'P' THEN
  		LIC:LIC_DEPOSITADA = 'N'
  		SETNULL(LIC:LIC_DEPOSITO_DATE)
  		SETNULL(LIC:LIC_DEPOSITO_TIME)
  		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  	END		
  	IF LIC:LIC_DIAS_VIAJE = 'C' THEN
  		DV:DV_LEGAJO = LIC:LIC_LEGAJO
  		DV:DV_LICENCIA = LIC:LIC_ANIO
  		GET(DIAS_VIAJE,DV:PK_DIAS_VIAJE)
  		IF NOT ERRORCODE() THEN
  			LIC:LIC_DIAS_VIAJE = 'S'
  			SETNULL(DV:DV_DEPOSITADO_DATE)
  			SETNULL(DV:DV_DEPOSITADO_TIME)
  			DV:DV_FECHA_UPDATE_DATE = TODAY()
  			DV:DV_FECHA_UPDATE_TIME = CLOCK()
  			Access:DIAS_VIAJE.Update()
  		END		
  	END	
  	IF LIC:LIC_DIAS_VIAJE = 'S' THEN
  		DV:DV_LEGAJO = LIC:LIC_LEGAJO
  		DV:DV_LICENCIA = LIC:LIC_ANIO
  		GET(DIAS_VIAJE,DV:PK_DIAS_VIAJE)
  		IF NOT ERRORCODE() THEN
  			LIC:LIC_DIAS_VIAJE = 'S'
  			DV:DV_DEPOSITADO_DATE = Loc:depositara
  			DV:DV_DEPOSITADO_TIME = 0
  			DV:DV_FECHA_UPDATE_DATE = TODAY()
  			DV:DV_FECHA_UPDATE_TIME = CLOCK()
  			Access:DIAS_VIAJE.Update()
  		END		
  	END	
  	Access:DIAS_VIAJE.Update()
  	Access:LICENCIA.Update()
  !END	
  
  ReturnValue = PARENT.Kill()
  RETURN ReturnValue


EditInPlace::LIC:LIC_COBRO.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_COBRO.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
   IF Queue:Browse:1.LIC:LIC_COBRO = 'N' THEN
      SELF.FEQ{PROP:Disable}=TRUE
  ELSE
      SELF.FEQ{PROP:Disable}=FALSE
  END   
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'P'
  SELF.REQ = True


EditInPlace::LIC:LIC_DIAS_VIAJE.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_DIAS_VIAJE.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'C'


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the DETALLE_LICENCIA file
!!! </summary>
_ProcesarASueldoRetribucionLicencia_DiasdeViaje PROCEDURE 

Neto                 DECIMAL(7,2)                          !
Descuento            DECIMAL(7,2)                          !
Total                DECIMAL(7,2)                          !
CurrentTab           STRING(80)                            !
Loc:titulo           STRING(4000)                          !
Loc:Sueldo           STRING(1)                             !
Loc:desde            DATE                                  !
Loc:hasta            DATE                                  !
BRW1::View:Browse    VIEW(DETALLE_LICENCIA)
                       PROJECT(DLIC:DLIC_LEGAJO)
                       PROJECT(DLIC:DLIC_ANIO)
                       PROJECT(DLIC:DLIC_VIAJE)
                       PROJECT(DLIC:DLIC_FECHA_DATE)
                       PROJECT(DLIC:DLIC_ESTADO)
                       PROJECT(DLIC:DLIC_INICIO_DATE)
                       PROJECT(DLIC:DLIC_FIN_DATE)
                       PROJECT(DLIC:DLIC_INICIO)
                       PROJECT(DLIC:DLIC_FIN)
                       JOIN(LIC:PK_LICENCIA,DLIC:DLIC_LEGAJO,DLIC:DLIC_ANIO)
                         PROJECT(LIC:LIC_PAGAN)
                         PROJECT(LIC:LIC_COBRO)
                         PROJECT(LIC:LIC_LEGAJO)
                         PROJECT(LIC:LIC_ANIO)
                         JOIN(EPL:PK_EMPLEADOS,LIC:LIC_LEGAJO)
                           PROJECT(EPL:EMP_NOMBRE)
                           PROJECT(EPL:EMP_VACACION)
                           PROJECT(EPL:EMP_LIQUIDACION)
                           PROJECT(EPL:EMP_LEGAJO)
                         END
                         JOIN(DV:PK_DIAS_VIAJE,LIC:LIC_LEGAJO,LIC:LIC_ANIO)
                           PROJECT(DV:DV_DIAS)
                           PROJECT(DV:DV_LEGAJO)
                           PROJECT(DV:DV_LICENCIA)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
DLIC:DLIC_LEGAJO       LIKE(DLIC:DLIC_LEGAJO)         !List box control field - type derived from field
DLIC:DLIC_ANIO         LIKE(DLIC:DLIC_ANIO)           !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_VACACION       LIKE(EPL:EMP_VACACION)         !List box control field - type derived from field
EPL:EMP_LIQUIDACION    LIKE(EPL:EMP_LIQUIDACION)      !List box control field - type derived from field
LIC:LIC_PAGAN          LIKE(LIC:LIC_PAGAN)            !List box control field - type derived from field
LIC:LIC_COBRO          LIKE(LIC:LIC_COBRO)            !List box control field - type derived from field
DV:DV_DIAS             LIKE(DV:DV_DIAS)               !List box control field - type derived from field
DLIC:DLIC_VIAJE        LIKE(DLIC:DLIC_VIAJE)          !List box control field - type derived from field
Neto                   LIKE(Neto)                     !List box control field - type derived from local data
Descuento              LIKE(Descuento)                !List box control field - type derived from local data
Total                  LIKE(Total)                    !List box control field - type derived from local data
DLIC:DLIC_FECHA_DATE   LIKE(DLIC:DLIC_FECHA_DATE)     !List box control field - type derived from field
DLIC:DLIC_ESTADO       LIKE(DLIC:DLIC_ESTADO)         !List box control field - type derived from field
DLIC:DLIC_INICIO_DATE  LIKE(DLIC:DLIC_INICIO_DATE)    !List box control field - type derived from field
DLIC:DLIC_FIN_DATE     LIKE(DLIC:DLIC_FIN_DATE)       !List box control field - type derived from field
DLIC:DLIC_INICIO       LIKE(DLIC:DLIC_INICIO)         !Primary key field - type derived from field
DLIC:DLIC_FIN          LIKE(DLIC:DLIC_FIN)            !Primary key field - type derived from field
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !Related join file key field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !Related join file key field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
DV:DV_LEGAJO           LIKE(DV:DV_LEGAJO)             !Related join file key field - type derived from field
DV:DV_LICENCIA         LIKE(DV:DV_LICENCIA)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(LICENCIA)
                       PROJECT(LIC:LIC_LEGAJO)
                       PROJECT(LIC:LIC_ANIO)
                       PROJECT(LIC:LIC_PAGAN)
                       PROJECT(LIC:LIC_COBRO)
                       PROJECT(LIC:LIC_DIAS_VIAJE)
                       JOIN(DV:PK_DIAS_VIAJE,LIC:LIC_LEGAJO,LIC:LIC_ANIO)
                         PROJECT(DV:DV_DIAS)
                         PROJECT(DV:DV_LEGAJO)
                         PROJECT(DV:DV_LICENCIA)
                       END
                       JOIN(EPL:PK_EMPLEADOS,LIC:LIC_LEGAJO)
                         PROJECT(EPL:EMP_NOMBRE)
                         PROJECT(EPL:EMP_VACACION)
                         PROJECT(EPL:EMP_LIQUIDACION)
                         PROJECT(EPL:EMP_LEGAJO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List:2
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !List box control field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
EPL:EMP_VACACION       LIKE(EPL:EMP_VACACION)         !List box control field - type derived from field
EPL:EMP_LIQUIDACION    LIKE(EPL:EMP_LIQUIDACION)      !List box control field - type derived from field
LIC:LIC_PAGAN          LIKE(LIC:LIC_PAGAN)            !List box control field - type derived from field
LIC:LIC_COBRO          LIKE(LIC:LIC_COBRO)            !List box control field - type derived from field
DV:DV_DIAS             LIKE(DV:DV_DIAS)               !List box control field - type derived from field
LIC:LIC_DIAS_VIAJE     LIKE(LIC:LIC_DIAS_VIAJE)       !List box control field - type derived from field
Neto                   LIKE(Neto)                     !List box control field - type derived from local data
Descuento              LIKE(Descuento)                !List box control field - type derived from local data
Total                  LIKE(Total)                    !List box control field - type derived from local data
DV:DV_LEGAJO           LIKE(DV:DV_LEGAJO)             !Related join file key field - type derived from field
DV:DV_LICENCIA         LIKE(DV:DV_LICENCIA)           !Related join file key field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Retribución por Licencia y Días de Viaje a Sueldo'),AT(,,578,453),FONT('Microsoft ' & |
  'Sans Serif',8,COLOR:Black,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'), |
  GRAY,IMM,MDI,HLP('ProcesarAdelantoSueldo'),SYSTEM
                       LIST,AT(9,78,563,114),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('40R(2)|M~LEGAJO~C(' & |
  '0)@n_7@45C(2)|M~LICENCIA~C(0)@n04@0L(2)|M~EMPLEADO~C(0)@s31@45C(2)|M~9930~L(12)@n_12' & |
  '.2@45C(2)|M~LIQ~C(0)@s9@40C(2)|M~DIAS~C(0)@n3@40C(2)|M~PAGAR~C(0)@s1@40C(2)|M~D VIAJ' & |
  'E~C(0)@n3@40C(2)|M~PAGAR~C(0)@s1@55C(2)|M~NETO~R(12)@n_12.2@50C(2)|M~19%~C(1)@n_12.2' & |
  '@52C(2)|M~TOTAL~L(12)@n_12.2@60C(2)|M~FECHA~C(0)@d17@0L(2)|M~DLIC ESTADO~L(0)@s1@40L' & |
  '(2)|M~DLIC INICIO DATE~L(0)@d17@40L(2)|M~DLIC FIN DATE~L(0)@d17@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the DETALLE_LICENCIA file')
                       BUTTON('&Insert'),AT(68,180,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(111,180,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(152,180,42,12),USE(?Delete),HIDE
                       GROUP,AT(7,9,566,56),USE(?GROUP1),BOXED
                         ENTRY(@d17),AT(18,34,63,14),USE(Loc:desde),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         ENTRY(@d17),AT(111,34,63,14),USE(Loc:hasta),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         BUTTON,AT(85,34,14,14),USE(?Calendar)
                         BUTTON,AT(179,34,14,14),USE(?Calendar:2)
                         STRING('Desde:'),AT(18,20),USE(?STRING1),FONT(,10,COLOR:Navy,FONT:bold)
                         STRING('Hasta:'),AT(111,20,34,12),USE(?STRING1:2),FONT(,10,COLOR:Navy,FONT:bold)
                         OPTION,AT(209,13,297),USE(Loc:Sueldo),FONT(,10,COLOR:Navy,FONT:bold)
                           RADIO('Pendientes'),AT(226,28,69,15),USE(?OPTION1:RADIO1),VALUE('P')
                           RADIO('Ejecutados'),AT(329,28,69,15),USE(?OPTION1:RADIO2),VALUE('S')
                           RADIO('Todos'),AT(439,28,48,15),USE(?OPTION1:RADIO3),FONT(,,COLOR:Navy)
                         END
                         BUTTON('Filtrar'),AT(520,15,43,45),USE(?BUTTON1),FONT(,10,COLOR:Green,FONT:bold),FLAT
                       END
                       GROUP,AT(9,310,563,43),USE(?GROUP2),FONT(,10,,FONT:bold),BOXED
                         BUTTON('Salir'),AT(469,318,89,26),USE(?BUTTON3),FONT(,10,,FONT:bold),LEFT,ICON('SALIR.ICO'), |
  FLAT,STD(STD:Close)
                         BUTTON('E&xportar/Imprimir'),AT(21,318,124,26),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       END
                       LIST,AT(8,204,583,114),USE(?List:2),FONT(,10),FLAT,FORMAT('40C(2)|M~LEGAJO~C(0)@n_7@40C' & |
  '(2)|M~LICENCIA~C(0)@n_7@0L(2)|M~EMP_NOMBRE~C(0)@s31@45L(2)|M~9930~D(12)@n_12.2@45C(2' & |
  ')|M~LIQ~C(0)@s9@40C(2)|M~DIAS~C(0)@n3@40C(2)|M~PAGAR~C(0)@s1@40C(2)|M~D.VIAJE~C(0)@n' & |
  '3@40C(2)|M~PAGAR~C(0)@s1@52C(2)|M~NETO~D(12)@n_12.2@50C(2)|M~19%~D(12)@n_7@52C(2)|M~' & |
  'TOTAL~D(12)@n_12.2@'),FROM(Queue:Browse),IMM
                       BUTTON('&Insert'),AT(66,246,42,12),USE(?Insert:2)
                       BUTTON('&Change'),AT(108,246,42,12),USE(?Change:2)
                       BUTTON('&Delete'),AT(150,246,42,12),USE(?Delete:2)
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::EIPManager     CLASS(BrowseEIPManager)               ! Browse EIP Manager for Browse using ?Browse:1
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

EditInPlace::EPL:EMP_NOMBRE EditEntryClass                 ! Edit-in-place class for field EPL:EMP_NOMBRE
EditInPlace::DLIC:DLIC_VIAJE CLASS(EditCheckClass)         ! Edit-in-place class for field DLIC:DLIC_VIAJE
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::DLIC:DLIC_ESTADO EditEntryClass               ! Edit-in-place class for field DLIC:DLIC_ESTADO
EditInPlace::DLIC:DLIC_INICIO_DATE EditEntryClass          ! Edit-in-place class for field DLIC:DLIC_INICIO_DATE
EditInPlace::DLIC:DLIC_FIN_DATE EditEntryClass             ! Edit-in-place class for field DLIC:DLIC_FIN_DATE
BRW8::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List:2
EditInPlace::EPL:EMP_NOMBRE EditEntryClass                 ! Edit-in-place class for field EPL:EMP_NOMBRE
EditInPlace::LIC:LIC_COBRO CLASS(EditCheckClass)           ! Edit-in-place class for field LIC:LIC_COBRO
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_DIAS_VIAJE CLASS(EditCheckClass)      ! Edit-in-place class for field LIC:LIC_DIAS_VIAJE
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar2            CalendarClass
Calendar3            CalendarClass
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
  Evo::App4          = 'infoper'
  Evo::Procedure4          = GlobalErrors.GetProcedureName()& 4
 
  FREE(QPar4)
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,'
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
   Q4:FieldPar  = 14
  ADD(QPar4)   !.20
 
   Q4:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar4)   !.21
 
   Q4:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar4)   !.22
 
   CLEAR(Q4:FieldPar)
  ADD(QPar4)   ! 23 Caracteres Encoding para xml
 
  Q4:FieldPar  = '0'
  ADD(QPar4)   ! 24 Use Open Office
 
   Q4:FieldPar  = 'golmedo'
  ADD(QPar4) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 26 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 27 
  Q4:FieldPar  = '' 
  ADD(QPar4)   ! 28 
  Q4:FieldPar  = 'BEXPORT' 
  ADD(QPar4)   ! 29 infoper034.clw
 !!!!!
 
 
  FREE(QPar24)
       Qp24:F2N  = 'LEGAJO'
  Qp24:F2P  = '@n_7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LICENCIA'
  Qp24:F2P  = '@n04'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s31'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '9930'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LIQ'
  Qp24:F2P  = '@s9'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DIAS'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'PAGAR'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'D VIAJE'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DLIC VIAJE'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'NETO'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '19%'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'TOTAL'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DLIC INICIO DATE'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DLIC FIN DATE'
  Qp24:F2P  = '@d17'
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
  Loc::Titulo4 =Loc:titulo
 
 SavPath4 = PATH()
  Exportar(Loc::QHlist4,BRW1.Q,QPar4,0,Loc::Titulo4,Evo::Group4)
 IF Not EC::LoadI_4 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath4)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('_ProcesarASueldoRetribucionLicencia_DiasdeViaje')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:desde',Loc:desde)                              ! Added by: BrowseBox(ABC)
  BIND('Loc:hasta',Loc:hasta)                              ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ESTADO',DLIC:DLIC_ESTADO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_VIAJE',DLIC:DLIC_VIAJE)                  ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_COBRO',LIC:LIC_COBRO)                      ! Added by: BrowseBox(ABC)
  BIND('Loc:Sueldo',Loc:Sueldo)                            ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_LEGAJO',DLIC:DLIC_LEGAJO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_ANIO',DLIC:DLIC_ANIO)                    ! Added by: BrowseBox(ABC)
  BIND('DV:DV_DIAS',DV:DV_DIAS)                            ! Added by: BrowseBox(ABC)
  BIND('Neto',Neto)                                        ! Added by: BrowseBox(ABC)
  BIND('Descuento',Descuento)                              ! Added by: BrowseBox(ABC)
  BIND('Total',Total)                                      ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_INICIO',DLIC:DLIC_INICIO)                ! Added by: BrowseBox(ABC)
  BIND('DLIC:DLIC_FIN',DLIC:DLIC_FIN)                      ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_LEGAJO',LIC:LIC_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_ANIO',LIC:LIC_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('DV:DV_LEGAJO',DV:DV_LEGAJO)                        ! Added by: BrowseBox(ABC)
  BIND('DV:DV_LICENCIA',DV:DV_LICENCIA)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_LICENCIA.Open                             ! File DETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DETALLE_LICENCIA,SELF) ! Initialize the browse manager
  BRW8.Init(?List:2,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,DLIC:PK_DETALLE_LICENCIA)             ! Add the sort order for DLIC:PK_DETALLE_LICENCIA for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,DLIC:DLIC_LEGAJO,,BRW1)        ! Initialize the browse locator using  using key: DLIC:PK_DETALLE_LICENCIA , DLIC:DLIC_LEGAJO
  BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta  and DLIC:DLIC_ESTADO <<> ''A'' and (DLIC:DLIC_VIAJE = ''C'' OR LIC:LIC_COBRO = Loc:Sueldo))') ! Apply filter expression to browse
  BRW1.AddField(DLIC:DLIC_LEGAJO,BRW1.Q.DLIC:DLIC_LEGAJO)  ! Field DLIC:DLIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ANIO,BRW1.Q.DLIC:DLIC_ANIO)      ! Field DLIC:DLIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_VACACION,BRW1.Q.EPL:EMP_VACACION)  ! Field EPL:EMP_VACACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LIQUIDACION,BRW1.Q.EPL:EMP_LIQUIDACION) ! Field EPL:EMP_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_PAGAN,BRW1.Q.LIC:LIC_PAGAN)        ! Field LIC:LIC_PAGAN is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_COBRO,BRW1.Q.LIC:LIC_COBRO)        ! Field LIC:LIC_COBRO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_DIAS,BRW1.Q.DV:DV_DIAS)              ! Field DV:DV_DIAS is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_VIAJE,BRW1.Q.DLIC:DLIC_VIAJE)    ! Field DLIC:DLIC_VIAJE is a hot field or requires assignment from browse
  BRW1.AddField(Neto,BRW1.Q.Neto)                          ! Field Neto is a hot field or requires assignment from browse
  BRW1.AddField(Descuento,BRW1.Q.Descuento)                ! Field Descuento is a hot field or requires assignment from browse
  BRW1.AddField(Total,BRW1.Q.Total)                        ! Field Total is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FECHA_DATE,BRW1.Q.DLIC:DLIC_FECHA_DATE) ! Field DLIC:DLIC_FECHA_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_ESTADO,BRW1.Q.DLIC:DLIC_ESTADO)  ! Field DLIC:DLIC_ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_INICIO_DATE,BRW1.Q.DLIC:DLIC_INICIO_DATE) ! Field DLIC:DLIC_INICIO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FIN_DATE,BRW1.Q.DLIC:DLIC_FIN_DATE) ! Field DLIC:DLIC_FIN_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_INICIO,BRW1.Q.DLIC:DLIC_INICIO)  ! Field DLIC:DLIC_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(DLIC:DLIC_FIN,BRW1.Q.DLIC:DLIC_FIN)        ! Field DLIC:DLIC_FIN is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_LEGAJO,BRW1.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_ANIO,BRW1.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_LEGAJO,BRW1.Q.DV:DV_LEGAJO)          ! Field DV:DV_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_LICENCIA,BRW1.Q.DV:DV_LICENCIA)      ! Field DV:DV_LICENCIA is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse
  BRW8.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW8.RetainRow = 0
  BRW8.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW8.SetFilter('(LIC:LIC_COBRO = ''P'' OR LIC:LIC_DIAS_VIAJE = ''P'')') ! Apply filter expression to browse
  BRW8.AddField(LIC:LIC_LEGAJO,BRW8.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW8.AddField(LIC:LIC_ANIO,BRW8.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW8.AddField(EPL:EMP_NOMBRE,BRW8.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW8.AddField(EPL:EMP_VACACION,BRW8.Q.EPL:EMP_VACACION)  ! Field EPL:EMP_VACACION is a hot field or requires assignment from browse
  BRW8.AddField(EPL:EMP_LIQUIDACION,BRW8.Q.EPL:EMP_LIQUIDACION) ! Field EPL:EMP_LIQUIDACION is a hot field or requires assignment from browse
  BRW8.AddField(LIC:LIC_PAGAN,BRW8.Q.LIC:LIC_PAGAN)        ! Field LIC:LIC_PAGAN is a hot field or requires assignment from browse
  BRW8.AddField(LIC:LIC_COBRO,BRW8.Q.LIC:LIC_COBRO)        ! Field LIC:LIC_COBRO is a hot field or requires assignment from browse
  BRW8.AddField(DV:DV_DIAS,BRW8.Q.DV:DV_DIAS)              ! Field DV:DV_DIAS is a hot field or requires assignment from browse
  BRW8.AddField(LIC:LIC_DIAS_VIAJE,BRW8.Q.LIC:LIC_DIAS_VIAJE) ! Field LIC:LIC_DIAS_VIAJE is a hot field or requires assignment from browse
  BRW8.AddField(Neto,BRW8.Q.Neto)                          ! Field Neto is a hot field or requires assignment from browse
  BRW8.AddField(Descuento,BRW8.Q.Descuento)                ! Field Descuento is a hot field or requires assignment from browse
  BRW8.AddField(Total,BRW8.Q.Total)                        ! Field Total is a hot field or requires assignment from browse
  BRW8.AddField(DV:DV_LEGAJO,BRW8.Q.DV:DV_LEGAJO)          ! Field DV:DV_LEGAJO is a hot field or requires assignment from browse
  BRW8.AddField(DV:DV_LICENCIA,BRW8.Q.DV:DV_LICENCIA)      ! Field DV:DV_LICENCIA is a hot field or requires assignment from browse
  BRW8.AddField(EPL:EMP_LEGAJO,BRW8.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  Loc:desde = date(MONTH(today()),01,year(today()))
  Loc:hasta = today()
  
  Loc:Sueldo = 'P'
  
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_LICENCIA.Close
    Relate:LICENCIA.Close
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
    CASE ACCEPTED()
    OF ?EvoExportar
      !MESSAGE('ADELANTOS DE SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17))
      Loc:titulo = 'RETRIBUCIÓN POR LICENCIA Y DIAS DE VIAJE A SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar2.SelectOnClose = True
      Calendar2.Ask('Seleccione Fecha Desde:',Loc:desde)
      IF Calendar2.Response = RequestCompleted THEN
      Loc:desde=Calendar2.SelectedDate
      DISPLAY(?Loc:desde)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar3.SelectOnClose = True
      Calendar3.Ask('Seleccione Fecha Hasta',Loc:hasta)
      IF Calendar3.Response = RequestCompleted THEN
      Loc:hasta=Calendar3.SelectedDate
      DISPLAY(?Loc:hasta)
      END
      ThisWindow.Reset(True)
    OF ?BUTTON1
      ThisWindow.Update()
      IF Loc:Sueldo <> 'T' THEN   
      	!BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and DLIC:DLIC_COBRAR = Loc:AdelantoSueldo and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      	BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta  and DLIC:DLIC_ESTADO <<> ''A'' and (DLIC:DLIC_VIAJE = ''C'' OR LIC:LIC_COBRO = Loc:Sueldo))') ! Apply filter expression to browse
      ELSE
      	!BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_COBRAR = ''S'' OR DLIC:DLIC_COBRAR = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      	BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta  and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
         BRW1.ResetFromFile()
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! DLIC:DLIC_LEGAJO Disable
  SELF.AddEditControl(,2) ! DLIC:DLIC_ANIO Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_NOMBRE,3)
  SELF.AddEditControl(,4) ! EPL:EMP_VACACION Disable
  SELF.AddEditControl(,5) ! EPL:EMP_LIQUIDACION Disable
  SELF.AddEditControl(,6) ! LIC:LIC_PAGAN Disable
  SELF.AddEditControl(,7) ! LIC:LIC_COBRO Disable
  SELF.AddEditControl(,8) ! DV:DV_DIAS Disable
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_VIAJE,9)
  SELF.AddEditControl(,10) ! Neto Disable
  SELF.AddEditControl(,11) ! Descuento Disable
  SELF.AddEditControl(,12) ! Total Disable
  SELF.AddEditControl(,13) ! DLIC:DLIC_FECHA_DATE Disable
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_ESTADO,14)
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_INICIO_DATE,15)
  SELF.AddEditControl(EditInPlace::DLIC:DLIC_FIN_DATE,16)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  !MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  IF DLIC:DLIC_VIAJE = 'C' OR DLIC:DLIC_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  ELSE
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  
  END	
  PARENT.SetQueueRecord
  


BRW8.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW8::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! LIC:LIC_LEGAJO Disable
  SELF.AddEditControl(,2) ! LIC:LIC_ANIO Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_NOMBRE,3)
  SELF.AddEditControl(,4) ! EPL:EMP_VACACION Disable
  SELF.AddEditControl(,5) ! EPL:EMP_LIQUIDACION Disable
  SELF.AddEditControl(,6) ! LIC:LIC_PAGAN Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_COBRO,7)
  SELF.AddEditControl(,8) ! DV:DV_DIAS Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_DIAS_VIAJE,9)
  SELF.AddEditControl(,10) ! Neto Disable
  SELF.AddEditControl(,11) ! Descuento Disable
  SELF.AddEditControl(,12) ! Total Disable
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW8.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  IF LIC:LIC_DIAS_VIAJE = 'C' OR LIC:LIC_DIAS_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  ELSE
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  
  END	
  


BRW1::EIPManager.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  IF DLIC:DLIC_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  ELSE
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  
  END	
  
  LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
  LIC:LIC_ANIO = DLIC:DLIC_ANIO
  GET(LICENCIA,LIC:PK_LICENCIA)
  IF NOT ERRORCODE() THEN
  	!LIC:LIC_COBRO = DLIC:DLIC_COBRAR 
  	IF LIC:LIC_COBRO = 'S' THEN
  		LIC:LIC_DEPOSITADA = 'S'
  		LIC:LIC_DEPOSITO_DATE = TODAY()
  		LIC:LIC_DEPOSITO_TIME = 0
  		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  	END	
  	IF 	LIC:LIC_COBRO = 'P' THEN
  		LIC:LIC_DEPOSITADA = 'N'
  		SETNULL(LIC:LIC_DEPOSITO_DATE)
  		SETNULL(LIC:LIC_DEPOSITO_TIME)
  		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  	END		
  	Access:LICENCIA.Update()
  END	
  
  ReturnValue = PARENT.Kill()
  RETURN ReturnValue


EditInPlace::DLIC:DLIC_VIAJE.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::DLIC:DLIC_VIAJE.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
   IF Queue:Browse:1.DLIC:DLIC_VIAJE = 'N' THEN
      SELF.FEQ{PROP:Disable}=TRUE
  ELSE
      SELF.FEQ{PROP:Disable}=FALSE
  END   
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'C'
  SELF.REQ = True


EditInPlace::LIC:LIC_COBRO.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_COBRO.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'P'
  SELF.REQ = True


EditInPlace::LIC:LIC_DIAS_VIAJE.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_DIAS_VIAJE.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  ! IF   Queue:Browse: = 'N' THEN
  !    SELF.FEQ{PROP:Disable}=TRUE
  !ELSE
  !    SELF.FEQ{PROP:Disable}=FALSE
  !END   
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'P'
  SELF.REQ = True


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LICENCIA file
!!! </summary>
Procesar_RetribucionesASueldo PROCEDURE 

CurrentTab           STRING(80)                            !
Neto                 DECIMAL(7,2)                          !
Descuento            DECIMAL(7,2)                          !
Total                DECIMAL(7,2)                          !
Loc:titulo           STRING(4000)                          !
Loc:Sueldo           STRING(1)                             !
Loc:depo             DATE                                  !
Loc:DiaViaje         STRING(1)                             !
Loc:depositara       STRING(10)                            !
BRW1::View:Browse    VIEW(LICENCIA)
                       PROJECT(LIC:LIC_LEGAJO)
                       PROJECT(LIC:LIC_ANIO)
                       PROJECT(LIC:LIC_PAGAN)
                       PROJECT(LIC:LIC_COBRO)
                       PROJECT(LIC:LIC_DIAS_VIAJE)
                       PROJECT(LIC:LIC_DEPOSITO_DATE)
                       JOIN(DV:PK_DIAS_VIAJE,LIC:LIC_LEGAJO,LIC:LIC_ANIO)
                         PROJECT(DV:DV_DIAS)
                         PROJECT(DV:DV_DEPOSITADO_DATE)
                         PROJECT(DV:DV_LEGAJO)
                         PROJECT(DV:DV_LICENCIA)
                       END
                       JOIN(EPL:PK_EMPLEADOS,LIC:LIC_LEGAJO)
                         PROJECT(EPL:EMP_VACACION)
                         PROJECT(EPL:EMP_LIQUIDACION)
                         PROJECT(EPL:EMP_NOMBRE)
                         PROJECT(EPL:EMP_LEGAJO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LIC:LIC_LEGAJO         LIKE(LIC:LIC_LEGAJO)           !List box control field - type derived from field
LIC:LIC_ANIO           LIKE(LIC:LIC_ANIO)             !List box control field - type derived from field
EPL:EMP_VACACION       LIKE(EPL:EMP_VACACION)         !List box control field - type derived from field
EPL:EMP_LIQUIDACION    LIKE(EPL:EMP_LIQUIDACION)      !List box control field - type derived from field
LIC:LIC_PAGAN          LIKE(LIC:LIC_PAGAN)            !List box control field - type derived from field
LIC:LIC_COBRO          LIKE(LIC:LIC_COBRO)            !List box control field - type derived from field
DV:DV_DIAS             LIKE(DV:DV_DIAS)               !List box control field - type derived from field
LIC:LIC_DIAS_VIAJE     LIKE(LIC:LIC_DIAS_VIAJE)       !List box control field - type derived from field
Neto                   LIKE(Neto)                     !List box control field - type derived from local data
Descuento              LIKE(Descuento)                !List box control field - type derived from local data
Total                  LIKE(Total)                    !List box control field - type derived from local data
LIC:LIC_DEPOSITO_DATE  LIKE(LIC:LIC_DEPOSITO_DATE)    !List box control field - type derived from field
DV:DV_DEPOSITADO_DATE  LIKE(DV:DV_DEPOSITADO_DATE)    !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
Loc:depositara         LIKE(Loc:depositara)           !Browse hot field - type derived from local data
DV:DV_LEGAJO           LIKE(DV:DV_LEGAJO)             !Related join file key field - type derived from field
DV:DV_LICENCIA         LIKE(DV:DV_LICENCIA)           !Related join file key field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Retribución por Licencia y Días de Viaje a Sueldo'),AT(,,595,380),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM, |
  MDI,HLP('Procesar_RetribucionesASueldo'),SYSTEM
                       LIST,AT(8,78,578,230),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('40C(2)|M~LEGAJO~C(' & |
  '0)@n_7@45C(2)|M~LICENCIA~C(0)@n04@42R(2)|M~9930~D(12)@n_12.2@42C(2)|M~LIQ~C(0)@s9@32' & |
  'C(2)|M~DIAS~C(0)@n3@38C(2)|M~PAGAR~@s1@40C(2)|M~D. VIAJE~C(0)@n3@38C(2)|M~PAGAR~C(0)' & |
  '@s1@50C(2)|M~NETO~L(12)@n_12.2@40C(2)|M~19%~L(12)@n_7@52C(2)|M~TOTAL~L(12)@n_12.2@45' & |
  'C(2)|M~DEP. LIC~C(0)@d17@45C(6)|M~DEP DV~C(0)@d17@0R(2)|M~EMP_NOMBRE~C(0)@s31@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the LICENCIA file')
                       BUTTON('&Insert'),AT(216,109,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(258,109,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(300,109,42,12),USE(?Delete),HIDE
                       GROUP,AT(7,6,580,62),USE(?GROUP1),BOXED
                         OPTION,AT(150,13,326),USE(Loc:Sueldo),FONT(,10,COLOR:Navy,FONT:bold,CHARSET:DEFAULT)
                           RADIO('Pendientes'),AT(348,27,69,15),USE(?OPTION1:RADIO1),VALUE('P')
                           RADIO('Ejecutados'),AT(176,27,69,15),USE(?OPTION1:RADIO2),VALUE('S')
                         END
                         ENTRY(@d17),AT(34,33,,21),USE(Loc:depo),FONT(,12,COLOR:Red,FONT:bold),CENTER,DISABLE,FLAT
                         STRING('Depositado'),AT(34,18),USE(?STRING1),FONT(,10,COLOR:Navy,FONT:bold),DISABLE
                         BUTTON('Filtrar'),AT(530,14,43,45),USE(?BUTTON1:2),FONT(,10,COLOR:Green,FONT:bold)
                       END
                       GROUP,AT(7,320,580,50),USE(?GROUP2),FONT(,,COLOR:Black,FONT:bold,CHARSET:DEFAULT),BOXED
                         BUTTON('Salir'),AT(476,336,89,21),USE(?BUTTON3),FONT(,10,,FONT:bold),LEFT,ICON('SALIR.ICO'), |
  FLAT,STD(STD:Close)
                         BUTTON('E&xportar/Imprimir'),AT(46,336,105,21),USE(?EvoExportar),FONT(,10),LEFT,ICON('export.ico'), |
  FLAT
                       END
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     CLASS(BrowseEIPManager)               ! Browse EIP Manager for Browse using ?Browse:1
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

EditInPlace::LIC:LIC_COBRO CLASS(EditCheckClass)           ! Edit-in-place class for field LIC:LIC_COBRO
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::LIC:LIC_DIAS_VIAJE CLASS(EditCheckClass)      ! Edit-in-place class for field LIC:LIC_DIAS_VIAJE
GetDynamicLabel        PROCEDURE(*? UseVar),STRING,DERIVED
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::EPL:EMP_NOMBRE EditEntryClass                 ! Edit-in-place class for field EPL:EMP_NOMBRE
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
  Evo::App4          = 'infoper'
  Evo::Procedure4          = GlobalErrors.GetProcedureName()& 4
 
  FREE(QPar4)
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,'
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
 
   Q4:FieldPar  = 'golmedo'
  ADD(QPar4) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 26 
  Q4:FieldPar  = ''
  ADD(QPar4)   ! 27 
  Q4:FieldPar  = '' 
  ADD(QPar4)   ! 28 
  Q4:FieldPar  = 'BEXPORT' 
  ADD(QPar4)   ! 29 infoper034.clw
 !!!!!
 
 
  FREE(QPar24)
       Qp24:F2N  = 'LEGAJO'
  Qp24:F2P  = '@n_7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LICENCIA'
  Qp24:F2P  = '@n04'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '9930'
  Qp24:F2P  = '@n-25.4'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'LIQUIDACION'
  Qp24:F2P  = '@s9'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DIAS'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'D. VIAJE'
  Qp24:F2P  = '@n3'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s1'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'NETO'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = '19%'
  Qp24:F2P  = '@n_7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'TOTAL'
  Qp24:F2P  = '@n_12.2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DEPOSITO LIC'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DEPOSITO DV'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
  Qp24:F2N  = 'ECNOEXPORT'
  Qp24:F2P  = '@s31'
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
  Loc::Titulo4 =0{prop:text}
 
 SavPath4 = PATH()
  Exportar(Loc::QHlist4,BRW1.Q,QPar4,0,Loc::Titulo4,Evo::Group4)
 IF Not EC::LoadI_4 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath4)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Procesar_RetribucionesASueldo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LIC:LIC_LEGAJO',LIC:LIC_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_ANIO',LIC:LIC_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('LIC:LIC_COBRO',LIC:LIC_COBRO)                      ! Added by: BrowseBox(ABC)
  BIND('DV:DV_DIAS',DV:DV_DIAS)                            ! Added by: BrowseBox(ABC)
  BIND('Neto',Neto)                                        ! Added by: BrowseBox(ABC)
  BIND('Descuento',Descuento)                              ! Added by: BrowseBox(ABC)
  BIND('Total',Total)                                      ! Added by: BrowseBox(ABC)
  BIND('Loc:depositara',Loc:depositara)                    ! Added by: BrowseBox(ABC)
  BIND('DV:DV_LEGAJO',DV:DV_LEGAJO)                        ! Added by: BrowseBox(ABC)
  BIND('DV:DV_LICENCIA',DV:DV_LICENCIA)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LICENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LIC:PK_LICENCIA)                      ! Add the sort order for LIC:PK_LICENCIA for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,LIC:LIC_LEGAJO,,BRW1)          ! Initialize the browse locator using  using key: LIC:PK_LICENCIA , LIC:LIC_LEGAJO
  BRW1.AddField(LIC:LIC_LEGAJO,BRW1.Q.LIC:LIC_LEGAJO)      ! Field LIC:LIC_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_ANIO,BRW1.Q.LIC:LIC_ANIO)          ! Field LIC:LIC_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_VACACION,BRW1.Q.EPL:EMP_VACACION)  ! Field EPL:EMP_VACACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LIQUIDACION,BRW1.Q.EPL:EMP_LIQUIDACION) ! Field EPL:EMP_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_PAGAN,BRW1.Q.LIC:LIC_PAGAN)        ! Field LIC:LIC_PAGAN is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_COBRO,BRW1.Q.LIC:LIC_COBRO)        ! Field LIC:LIC_COBRO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_DIAS,BRW1.Q.DV:DV_DIAS)              ! Field DV:DV_DIAS is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_DIAS_VIAJE,BRW1.Q.LIC:LIC_DIAS_VIAJE) ! Field LIC:LIC_DIAS_VIAJE is a hot field or requires assignment from browse
  BRW1.AddField(Neto,BRW1.Q.Neto)                          ! Field Neto is a hot field or requires assignment from browse
  BRW1.AddField(Descuento,BRW1.Q.Descuento)                ! Field Descuento is a hot field or requires assignment from browse
  BRW1.AddField(Total,BRW1.Q.Total)                        ! Field Total is a hot field or requires assignment from browse
  BRW1.AddField(LIC:LIC_DEPOSITO_DATE,BRW1.Q.LIC:LIC_DEPOSITO_DATE) ! Field LIC:LIC_DEPOSITO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_DEPOSITADO_DATE,BRW1.Q.DV:DV_DEPOSITADO_DATE) ! Field DV:DV_DEPOSITADO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(Loc:depositara,BRW1.Q.Loc:depositara)      ! Field Loc:depositara is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_LEGAJO,BRW1.Q.DV:DV_LEGAJO)          ! Field DV:DV_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(DV:DV_LICENCIA,BRW1.Q.DV:DV_LICENCIA)      ! Field DV:DV_LICENCIA is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:Sueldo = 'P'
     DISABLE(?Loc:depo)
     DISABLE(?STRING1)
  END
  IF Loc:Sueldo = 'S'
     ENABLE(?Loc:depo)
     ENABLE(?STRING1)
  END
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  Loc:DiaViaje = 'C'
  
  Loc:Sueldo = 'P'
  
  
  loop Fecha# = (Date(MONTH(TODAY())+1,1,YEAR(TODAY()))-1) TO (Date(MONTH(TODAY()),1,YEAR(TODAY()))) BY -1
   if (Fecha# % 7) = 0 then cycle. ! porque es domingo
   if (Fecha# % 7) = 6 then cycle. ! porque es sabado
   !
   ! busco si es feriado
   !
   clear(FERIADOS:record)
  	FER:DIAFERIADO_DATE = Fecha#
  	FER:DIAFERIADO_TIME = 0
   if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
   !
  	Loc:depo = Fecha#
  	BREAK
  end!loop
  
  
  post(event:accepted,?BUTTON1:2)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LICENCIA.Close
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
    CASE ACCEPTED()
    OF ?EvoExportar
      !MESSAGE('ADELANTOS DE SUELDO - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17))
      Loc:titulo = 'RETRIBUCIÓN POR LICENCIA Y DIAS DE VIAJE A SUELDO - FECHA: ' & format(Loc:depositara,@d17) 
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:Sueldo
      IF Loc:Sueldo = 'P'
         DISABLE(?Loc:depo)
         DISABLE(?STRING1)
      END
      IF Loc:Sueldo = 'S'
         ENABLE(?Loc:depo)
         ENABLE(?STRING1)
      END
      ThisWindow.Reset()
    OF ?OPTION1:RADIO1
      BRW1.ResetFromBuffer()
      BRW1.ResetFromView()
      IF Loc:Sueldo = 'P' THEN   
      	BRW1.SetFilter('(LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''C'' AND DV:DV_DEPOSITADO_DATE <<> Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE <<>  Loc:depositara))') ! Apply filter expression to browse
      END
      IF Loc:Sueldo = 'S' THEN
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE =  Loc:depositara))') ! Apply filter expression to browse
      	
      	BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = ''S'' AND LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      	
      !BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S''))') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S'') AND (LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      !BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_COBRAR = ''S'' OR DLIC:DLIC_COBRAR = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('( LIC:LIC_DEPOSITO_DATE = Loc:depositara and (LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
      BRW1.ResetFromFile()
      post(event:accepted,?BUTTON1:2)
    OF ?OPTION1:RADIO2
      loop Fecha# = (Date(MONTH(TODAY())+1,1,YEAR(TODAY()))-1) TO (Date(MONTH(TODAY()),1,YEAR(TODAY()))) BY -1
       if (Fecha# % 7) = 0 then cycle. ! porque es domingo
       if (Fecha# % 7) = 6 then cycle. ! porque es sabado
       !
       ! busco si es feriado
       !
       clear(FERIADOS:record)
      	FER:DIAFERIADO_DATE = Fecha#
      	FER:DIAFERIADO_TIME = 0
       if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
       !
      	Loc:depo = Fecha#
      	BREAK
      end!loop
      
      
      Loc:depositara = Loc:depo
      IF Loc:Sueldo = 'P' THEN   
      	BRW1.SetFilter('(LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''C'' AND DV:DV_DEPOSITADO_DATE <<> Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE <<>  Loc:depositara))') ! Apply filter expression to browse
      END
      IF Loc:Sueldo = 'S' THEN
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE =  Loc:depositara))') ! Apply filter expression to browse
      	
      	BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = ''S'' AND LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      	
      !BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S''))') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S'') AND (LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      !BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_COBRAR = ''S'' OR DLIC:DLIC_COBRAR = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('( LIC:LIC_DEPOSITO_DATE = Loc:depositara and (LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
         BRW1.ResetFromFile()
      
      post(event:accepted,?BUTTON1:2)
    OF ?BUTTON1:2
      ThisWindow.Update()
      Loc:depositara = Loc:depo
      IF Loc:Sueldo = 'P' THEN   
      	BRW1.SetFilter('(LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''C'' AND DV:DV_DEPOSITADO_DATE <<> Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE <<>  Loc:depositara))') ! Apply filter expression to browse
      END
      IF Loc:Sueldo = 'S' THEN
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = Loc:Sueldo AND LIC:LIC_DEPOSITO_DATE =  Loc:depositara))') ! Apply filter expression to browse
      	
      	BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' AND DV:DV_DEPOSITADO_DATE = Loc:depositara) OR (LIC:LIC_COBRO = ''S'' AND LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      	
      !BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S''))') ! Apply filter expression to browse
      	!BRW1.SetFilter('((LIC:LIC_DIAS_VIAJE = ''S'' OR LIC:LIC_COBRO = ''S'') AND (LIC:LIC_DEPOSITO_DATE = Loc:depositara))') ! Apply filter expression to browse
      !BRW1.SetFilter('(DLIC:DLIC_FECHA_DATE >= Loc:desde and DLIC:DLIC_FECHA_DATE <<= Loc:hasta and (DLIC:DLIC_COBRAR = ''S'' OR DLIC:DLIC_COBRAR = ''P'') and DLIC:DLIC_ESTADO <<> ''A'')') ! Apply filter expression to browse
      	!BRW1.SetFilter('( LIC:LIC_DEPOSITO_DATE = Loc:depositara and (LIC:LIC_DIAS_VIAJE = ''C'' OR LIC:LIC_COBRO = ''P'')') ! Apply filter expression to browse
      END	
         BRW1.ApplyFilter()
         BRW1.ResetFromFile()
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! LIC:LIC_LEGAJO Disable
  SELF.AddEditControl(,2) ! LIC:LIC_ANIO Disable
  SELF.AddEditControl(,3) ! EPL:EMP_VACACION Disable
  SELF.AddEditControl(,4) ! EPL:EMP_LIQUIDACION Disable
  SELF.AddEditControl(,5) ! LIC:LIC_PAGAN Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_COBRO,6)
  SELF.AddEditControl(,7) ! DV:DV_DIAS Disable
  SELF.AddEditControl(EditInPlace::LIC:LIC_DIAS_VIAJE,8)
  SELF.AddEditControl(,9) ! Neto Disable
  SELF.AddEditControl(,10) ! Descuento Disable
  SELF.AddEditControl(,11) ! Total Disable
  SELF.AddEditControl(,12) ! LIC:LIC_DEPOSITO_DATE Disable
  SELF.AddEditControl(,13) ! DV:DV_DEPOSITADO_DATE Disable
  SELF.AddEditControl(EditInPlace::EPL:EMP_NOMBRE,14)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  !MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  IF LIC:LIC_COBRO = 'S' AND LIC:LIC_DIAS_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  END
  IF LIC:LIC_COBRO = 'S' AND (LIC:LIC_DIAS_VIAJE = 'P' OR  LIC:LIC_DIAS_VIAJE = 'C' ) THEN
  	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) 
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  END
  IF (LIC:LIC_COBRO = 'N' OR LIC:LIC_COBRO = 'P') AND LIC:LIC_DIAS_VIAJE = 'S' THEN
  	Total = (EPL:EMP_VACACION * DV:DV_DIAS)
  	Descuento = (Total * 19) /100
  	Neto = Total - Descuento
  END
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW1::EIPManager.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  !!!MESSAGE('DLIC:DLIC_LEGAJO ' & DLIC:DLIC_LEGAJO & ' DLIC:DLIC_ANIO ' & DLIC:DLIC_ANIO)
  !IF DLIC:DLIC_VIAJE = 'S' THEN
  !	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN) + (EPL:EMP_VACACION * DV:DV_DIAS)
  !	Descuento = (Total * 19) /100
  !	Neto = Total - Descuento
  !ELSE
  !	Total = (EPL:EMP_VACACION * LIC:LIC_PAGAN)
  !	Descuento = (Total * 19) /100
  !	Neto = Total - Descuento
  !
  !END	
  !
  !!LIC:LIC_LEGAJO = DLIC:DLIC_LEGAJO
  !!LIC:LIC_ANIO = DLIC:DLIC_ANIO
  !!GET(LICENCIA,LIC:PK_LICENCIA)
  !!IF NOT ERRORCODE() THEN
  !	!LIC:LIC_COBRO = DLIC:DLIC_COBRAR 
  !	IF LIC:LIC_COBRO = 'S' THEN
  !		LIC:LIC_DEPOSITADA = 'S'
  !		LIC:LIC_DEPOSITO_DATE = Loc:depositara
  !		LIC:LIC_DEPOSITO_TIME = 0
  !		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  !		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  !	END	
  !	IF 	LIC:LIC_COBRO = 'P' THEN
  !		LIC:LIC_DEPOSITADA = 'N'
  !		SETNULL(LIC:LIC_DEPOSITO_DATE)
  !		SETNULL(LIC:LIC_DEPOSITO_TIME)
  !		LIC:LIC_FECHA_UPDATE_DATE = TODAY()
  !		LIC:LIC_FECHA_UPDATE_TIME = CLOCK()
  !	END		
  !	IF LIC:LIC_DIAS_VIAJE = 'C' THEN
  !		DV:DV_LEGAJO = LIC:LIC_LEGAJO
  !		DV:DV_LICENCIA = LIC:LIC_ANIO
  !		GET(DIAS_VIAJE,DV:PK_DIAS_VIAJE)
  !		IF NOT ERRORCODE() THEN
  !			LIC:LIC_DIAS_VIAJE = 'S'
  !			SETNULL(DV:DV_DEPOSITADO_DATE)
  !			SETNULL(DV:DV_DEPOSITADO_TIME)
  !			DV:DV_FECHA_UPDATE_DATE = TODAY()
  !			DV:DV_FECHA_UPDATE_TIME = CLOCK()
  !			Access:DIAS_VIAJE.Update()
  !		END		
  !	END	
  !	IF LIC:LIC_DIAS_VIAJE = 'S' THEN
  !		DV:DV_LEGAJO = LIC:LIC_LEGAJO
  !		DV:DV_LICENCIA = LIC:LIC_ANIO
  !		GET(DIAS_VIAJE,DV:PK_DIAS_VIAJE)
  !		IF NOT ERRORCODE() THEN
  !			LIC:LIC_DIAS_VIAJE = 'S'
  !			DV:DV_DEPOSITADO_DATE = Loc:depositara
  !			DV:DV_DEPOSITADO_TIME = 0
  !			DV:DV_FECHA_UPDATE_DATE = TODAY()
  !			DV:DV_FECHA_UPDATE_TIME = CLOCK()
  !			Access:DIAS_VIAJE.Update()
  !		END		
  !	END	
  !	Access:DIAS_VIAJE.Update()
  !	Access:LICENCIA.Update()
  !!END	
  RETURN ReturnValue


EditInPlace::LIC:LIC_COBRO.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_COBRO.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
   IF Queue:Browse:1.LIC:LIC_COBRO = 'N' THEN
      SELF.FEQ{PROP:Disable}=TRUE
  ELSE
      SELF.FEQ{PROP:Disable}=FALSE
  END   
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'P'


EditInPlace::LIC:LIC_DIAS_VIAJE.GetDynamicLabel PROCEDURE(*? UseVar)

ReturnValue          ANY

  CODE
  IF UseVar = 'S'
     RETURN ''
  ELSE
     RETURN ''
  END
  ReturnValue = PARENT.GetDynamicLabel(UseVar)
  RETURN ReturnValue


EditInPlace::LIC:LIC_DIAS_VIAJE.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
   IF Queue:Browse:1.LIC:LIC_DIAS_VIAJE = 'N' OR Queue:Browse:1.LIC:LIC_DIAS_VIAJE = 'P'  THEN
      SELF.FEQ{PROP:Disable}=TRUE
  ELSE
      SELF.FEQ{PROP:Disable}=FALSE
  END   
  SELF.FEQ{PROP:TrueValue} = 'S'
  SELF.FEQ{PROP:FalseValue} = 'C'


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PROVISION file
!!! </summary>
Provision PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(PROVISION)
                       PROJECT(PROV:PROV_ID)
                       PROJECT(PROV:PROV_MES)
                       PROJECT(PROV:PROV_ANIO)
                       PROJECT(PROV:PROV_LICENCIA)
                       PROJECT(PROV:PROV_FECHA_UPDATE_DATE)
                       PROJECT(PROV:PROV_FECHA_UPDATE_TIME)
                       JOIN(CTA:PK_CTA_CONTABLE,PROV:PROV_LICENCIA)
                         PROJECT(CTA:CTA_DETALLE)
                         PROJECT(CTA:CTA_ID_UNIBIZ)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PROV:PROV_ID           LIKE(PROV:PROV_ID)             !List box control field - type derived from field
PROV:PROV_MES          LIKE(PROV:PROV_MES)            !List box control field - type derived from field
PROV:PROV_ANIO         LIKE(PROV:PROV_ANIO)           !List box control field - type derived from field
PROV:PROV_LICENCIA     LIKE(PROV:PROV_LICENCIA)       !List box control field - type derived from field
CTA:CTA_DETALLE        LIKE(CTA:CTA_DETALLE)          !List box control field - type derived from field
PROV:PROV_FECHA_UPDATE_DATE LIKE(PROV:PROV_FECHA_UPDATE_DATE) !List box control field - type derived from field
PROV:PROV_FECHA_UPDATE_TIME LIKE(PROV:PROV_FECHA_UPDATE_TIME) !List box control field - type derived from field
CTA:CTA_ID_UNIBIZ      LIKE(CTA:CTA_ID_UNIBIZ)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Provisiones'),AT(,,278,325),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('Provision'),SYSTEM
                       LIST,AT(8,30,257,258),USE(?Browse:1),FONT(,10),VSCROLL,FLAT,FORMAT('0R(2)|M~PROV ID~C(0' & |
  ')@n-14@36C(2)|M~MES~C(0)@n02@40C(2)|M~AÑO~C(0)@n04@0R(2)|M~PROV LICENCIA~C(0)@n-14@1' & |
  '20L(2)|M~LICENCIA~C(0)@s40@50C|M~FECHA~@d17@0R(8)|M~PROV FECHA UPDATE TIME~C(0)@t7@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the PROVISION file')
                       BUTTON('&Select'),AT(29,200,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(82,200,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Agregar'),AT(79,295,56,14),USE(?Insert:4),FONT(,10),LEFT,ICON('WAINSERT.ICO'),FLAT, |
  MSG('Insert a Record'),TIP('Insert a Record')
                       BUTTON('&Cambiar'),AT(139,295,56,14),USE(?Change:4),FONT(,10),LEFT,ICON('WACHANGE.ICO'),DEFAULT, |
  FLAT,MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Borrar'),AT(200,295,56,14),USE(?Delete:4),FONT(,10),LEFT,ICON('WADELETE.ICO'),FLAT, |
  MSG('Delete the Record'),TIP('Delete the Record')
                       SHEET,AT(4,4,270,313),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
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
Reset                  PROCEDURE(),DERIVED
                     END

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
  GlobalErrors.SetProcedureName('Provision')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PROV:PROV_ID',PROV:PROV_ID)                        ! Added by: BrowseBox(ABC)
  BIND('PROV:PROV_MES',PROV:PROV_MES)                      ! Added by: BrowseBox(ABC)
  BIND('PROV:PROV_ANIO',PROV:PROV_ANIO)                    ! Added by: BrowseBox(ABC)
  BIND('PROV:PROV_LICENCIA',PROV:PROV_LICENCIA)            ! Added by: BrowseBox(ABC)
  BIND('CTA:CTA_DETALLE',CTA:CTA_DETALLE)                  ! Added by: BrowseBox(ABC)
  BIND('CTA:CTA_ID_UNIBIZ',CTA:CTA_ID_UNIBIZ)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CTA_CONTABLE.Open                                 ! File CTA_CONTABLE used by this procedure, so make sure it's RelationManager is open
  Relate:PROVISION.SetOpenRelated()
  Relate:PROVISION.Open                                    ! File PROVISION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PROVISION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AppendOrder('-PROV:PROV_ID')                        ! Append an additional sort order
  BRW1.AddField(PROV:PROV_ID,BRW1.Q.PROV:PROV_ID)          ! Field PROV:PROV_ID is a hot field or requires assignment from browse
  BRW1.AddField(PROV:PROV_MES,BRW1.Q.PROV:PROV_MES)        ! Field PROV:PROV_MES is a hot field or requires assignment from browse
  BRW1.AddField(PROV:PROV_ANIO,BRW1.Q.PROV:PROV_ANIO)      ! Field PROV:PROV_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(PROV:PROV_LICENCIA,BRW1.Q.PROV:PROV_LICENCIA) ! Field PROV:PROV_LICENCIA is a hot field or requires assignment from browse
  BRW1.AddField(CTA:CTA_DETALLE,BRW1.Q.CTA:CTA_DETALLE)    ! Field CTA:CTA_DETALLE is a hot field or requires assignment from browse
  BRW1.AddField(PROV:PROV_FECHA_UPDATE_DATE,BRW1.Q.PROV:PROV_FECHA_UPDATE_DATE) ! Field PROV:PROV_FECHA_UPDATE_DATE is a hot field or requires assignment from browse
  BRW1.AddField(PROV:PROV_FECHA_UPDATE_TIME,BRW1.Q.PROV:PROV_FECHA_UPDATE_TIME) ! Field PROV:PROV_FECHA_UPDATE_TIME is a hot field or requires assignment from browse
  BRW1.AddField(CTA:CTA_ID_UNIBIZ,BRW1.Q.CTA:CTA_ID_UNIBIZ) ! Field CTA:CTA_ID_UNIBIZ is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePROVISION
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
    Relate:PROVISION.Close
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
    UpdatePROVISION
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


BRW1.Reset PROCEDURE

  CODE
  PARENT.Reset
  POST(EVENT:ScrollTop,?Browse:1)		


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form PROVISION
!!! </summary>
UpdatePROVISION PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:Licencia         LONG                                  !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::PROV:Record LIKE(PROV:RECORD),THREAD
QuickWindow          WINDOW('Provisión'),AT(,,216,140),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('UpdatePROVISION'),SYSTEM
                       SHEET,AT(4,4,208,98),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           PROMPT('Mes:'),AT(17,28),USE(?PROV:PROV_MES:Prompt),FONT(,10,COLOR:Green,FONT:bold),TRN
                           ENTRY(@n02),AT(17,42,40,16),USE(PROV:PROV_MES),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                           PROMPT('Año:'),AT(60,28),USE(?PROV:PROV_ANIO:Prompt),FONT(,10,COLOR:Green,FONT:bold),TRN
                           ENTRY(@n04),AT(60,42,40,16),USE(PROV:PROV_ANIO),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                           PROMPT('Licencia:'),AT(118,28),USE(?PROV:PROV_LICENCIA:Prompt),FONT(,10,COLOR:Green,FONT:bold), |
  TRN
                           ENTRY(@N_7b),AT(118,42,57,16),USE(PROV:PROV_LICENCIA),FONT(,10,COLOR:Red,FONT:bold),CENTER, |
  DISABLE,FLAT
                           ENTRY(@s40),AT(19,72,178,16),USE(CTA:CTA_DETALLE),FONT(,10,COLOR:Red,FONT:bold),DISABLE,FLAT
                           BUTTON('...'),AT(181,42,16,16),USE(?CallLookup)
                         END
                       END
                       BUTTON('&Aceptar'),AT(77,114,58,14),USE(?OK),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(146,114,58,14),USE(?Cancel),FONT(,10),LEFT,ICON('WACANCEL.ICO'),FLAT, |
  MSG('Cancel operation'),TIP('Cancel operation')
                       ENTRY(@n-14),AT(6,116,64,10),USE(PROV:PROV_ID),HIDE
                       ENTRY(@n-14),AT(106,2,60,10),USE(CTA:CTA_ID_UNIBIZ),HIDE
                     END
SSEC::Viewing        BYTE(0)

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
    ActionMessage = 'Agregar Cabecera Provisión'
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdatePROVISION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PROV:PROV_MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PROV:Record,History::PROV:Record)
  SELF.AddHistoryField(?PROV:PROV_MES,2)
  SELF.AddHistoryField(?PROV:PROV_ANIO,3)
  SELF.AddHistoryField(?PROV:PROV_LICENCIA,4)
  SELF.AddHistoryField(?PROV:PROV_ID,1)
  SELF.AddUpdateFile(Access:PROVISION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CTA_CONTABLE.Open                                 ! File CTA_CONTABLE used by this procedure, so make sure it's RelationManager is open
  Relate:PROVISION.SetOpenRelated()
  Relate:PROVISION.Open                                    ! File PROVISION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PROVISION
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PROV:PROV_MES{PROP:ReadOnly} = True
    ?PROV:PROV_ANIO{PROP:ReadOnly} = True
    ?PROV:PROV_LICENCIA{PROP:ReadOnly} = True
    ?CTA:CTA_DETALLE{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PROV:PROV_ID{PROP:ReadOnly} = True
    ?CTA:CTA_ID_UNIBIZ{PROP:ReadOnly} = True
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
    Relate:CTA_CONTABLE.Close
    Relate:PROVISION.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  PROV:PROV_FECHA_UPDATE_DATE = TODAY()
  PROV:PROV_FECHA_UPDATE_TIME = CLOCK()
  PROV:PROV_MES = MONTH(TODAY())
  PROV:PROV_ANIO = YEAR(TODAY())
  PARENT.PrimeFields


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
    OF ?OK
      IF PROV:PROV_LICENCIA = 0 THEN
      	MESSAGE('ELIJA LA CUENTA DE LICENCIA')
      	CYCLE
      ELSE 
      	GET(PROVISION,PROV:PK_AUX)
      	IF NOT ERRORCODE() THEN
      		MESSAGE('ERROR: PROVISIÓN DUPLICADA!')
      		CYCLE
      	END	
      END	
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PROV:PROV_LICENCIA
      ThisWindow.Reset(1)
    OF ?CallLookup
      ThisWindow.Update()
      CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
        PROV:PROV_LICENCIA = CTA:CTA_ID_UNIBIZ
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CTA:CTA_ID_UNIBIZ
      IF CTA:CTA_ID_UNIBIZ OR ?CTA:CTA_ID_UNIBIZ{PROP:Req}
        CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
        IF Access:CTA_CONTABLE.TryFetch(CTA:PK_CTA_CONTABLE)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            CTA:CTA_ID_UNIBIZ = CTA:CTA_ID_UNIBIZ
            PROV:PROV_LICENCIA = CTA:CTA_ID_UNIBIZ
          ELSE
            CLEAR(PROV:PROV_LICENCIA)
            SELECT(?CTA:CTA_ID_UNIBIZ)
            CYCLE
          END
        ELSE
          PROV:PROV_LICENCIA = CTA:CTA_ID_UNIBIZ
        END
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
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
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
!!! Browse the DETALLE_PROVISION file
!!! </summary>
ProcesarAsientoProvision PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:title            STRING(50)                            !
Loc:CtaDetalle       STRING(20)                            !
Loc:cta              LONG                                  !
Loc:ProvId           LONG                                  !
Loc:str              STRING(4000)                          !
Loc:contador         SHORT                                 !
Loc:saldo            REAL                                  !
BRW1::View:Browse    VIEW(DETALLE_PROVISION)
                       PROJECT(PROVD:PROVD_ID)
                       PROJECT(PROVD:PROVD_FECHA_DATE)
                       PROJECT(PROVD:PROVD_LEGAJO)
                       PROJECT(PROVD:PROVD_CCOSTO)
                       PROJECT(PROVD:PROVD_9931)
                       PROJECT(PROVD:PROVD_LIQUIDACION)
                       PROJECT(PROVD:PROVD_DIAS)
                       PROJECT(PROVD:PROVD_CARGAS)
                       PROJECT(PROVD:PROVD_VACPTELIQ)
                       PROJECT(PROVD:PROVD_FECHA_TIME)
                       JOIN(EPL:PK_EMPLEADOS,PROVD:PROVD_LEGAJO)
                         PROJECT(EPL:EMP_NOMBRE)
                         PROJECT(EPL:EMP_LEGAJO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PROVD:PROVD_ID         LIKE(PROVD:PROVD_ID)           !List box control field - type derived from field
PROVD:PROVD_FECHA_DATE LIKE(PROVD:PROVD_FECHA_DATE)   !List box control field - type derived from field
PROVD:PROVD_LEGAJO     LIKE(PROVD:PROVD_LEGAJO)       !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
PROVD:PROVD_CCOSTO     LIKE(PROVD:PROVD_CCOSTO)       !List box control field - type derived from field
PROVD:PROVD_9931       LIKE(PROVD:PROVD_9931)         !List box control field - type derived from field
PROVD:PROVD_LIQUIDACION LIKE(PROVD:PROVD_LIQUIDACION) !List box control field - type derived from field
PROVD:PROVD_DIAS       LIKE(PROVD:PROVD_DIAS)         !List box control field - type derived from field
PROVD:PROVD_CARGAS     LIKE(PROVD:PROVD_CARGAS)       !List box control field - type derived from field
PROVD:PROVD_VACPTELIQ  LIKE(PROVD:PROVD_VACPTELIQ)    !List box control field - type derived from field
PROVD:PROVD_FECHA_TIME LIKE(PROVD:PROVD_FECHA_TIME)   !List box control field - type derived from field
EPL:EMP_LEGAJO         LIKE(EPL:EMP_LEGAJO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Procesar Provisión'),AT(,,538,368),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ProcesarAsientoProvision'),SYSTEM
                       LIST,AT(6,76,528,284),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('0R(2)|M~PROVD ID~C' & |
  '(0)@n-14@50C(2)|M~FECHA~C(0)@d17@40C(2)|M~LEGAJO~C(0)@n_7@145L(2)|M~EMPLEADO~C(0)@s3' & |
  '1@30C|M~CC~@n_7@50C|M~_9931~@n_11.2@50C(2)|M~LIQ~@s9@30C|M~DIAS~@n3@55C|M~C. SOCIALE' & |
  'S~@n_11.2@55C|M~VAC PTE LIQ~@n_11.2@0R(2)|M~PROVD FECHA TIME~C(0)@t7@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the DETALLE_PROVISION file'),SCROLL
                       ENTRY(@n_7B),AT(130,290,60,10),USE(PROV:PROV_ID),HIDE
                       GROUP('Provisión'),AT(6,6,528,61),USE(?GROUP1),FONT(,10,COLOR:Green,FONT:bold),BOXED
                         ENTRY(@n02B),AT(16,31,30,16),USE(PROV:PROV_MES),FONT(,,COLOR:Red),CENTER,DISABLE,FLAT
                         PROMPT('Mes'),AT(16,19),USE(?PROV:PROV_MES:Prompt)
                         ENTRY(@n4B),AT(53,31,40,16),USE(PROV:PROV_ANIO),FONT(,,COLOR:Red),CENTER,DISABLE,FLAT
                         PROMPT('Año'),AT(53,19),USE(?PROV:PROV_ANIO:Prompt)
                         ENTRY(@s20),AT(102,31,180,16),USE(Loc:CtaDetalle),FONT(,,COLOR:Red),DISABLE,FLAT
                         STRING(@n_11.2B),AT(297,32,68,16),USE(Loc:saldo,,?Loc:saldo:2),FONT(,12,COLOR:Red,FONT:bold), |
  CENTER
                         BUTTON('Asiento'),AT(460,40,62,20),USE(?BUTTON1),FONT(,,COLOR:Black,FONT:regular),LEFT,ICON('element_ne' & |
  'w_after.ico'),DISABLE,FLAT
                         BUTTON('Abrir'),AT(390,19,64,20),USE(?CallLookup),FONT(,10,COLOR:Black,FONT:regular),LEFT, |
  ICON('wizopen.ico'),FLAT,LAYOUT(0)
                         BUTTON('Procesar'),AT(390,40,64,20),USE(?BUTTON2),FONT(,,COLOR:Black,FONT:regular),LEFT,ICON('down.ico'), |
  DISABLE,FLAT,LAYOUT(0)
                         BUTTON('E&xportar'),AT(460,19,62,20),USE(?EvoExportar),FONT(,,COLOR:Black,FONT:regular),LEFT, |
  ICON('export.ico'),DISABLE,FLAT,LAYOUT(0)
                       END
                     END

Loc::QHlist5 QUEUE,PRE(QHL5)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar5 QUEUE,PRE(Q5)
FieldPar                 CSTRING(800)
                         END
QPar25 QUEUE,PRE(Qp25)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado5          STRING(100)
Loc::Titulo5          STRING(100)
SavPath5          STRING(2000)
Evo::Group5  GROUP,PRE()
Evo::Procedure5          STRING(100)
Evo::App5          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_5  SHORT
Gol_woI_5 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_5),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_5),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_5),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_5),TRN
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
PrintExBrowse5 ROUTINE

 OPEN(Gol_woI_5)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_5 = BRW1.FileLoaded
 IF Not  EC::LoadI_5
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_5)
 SETCURSOR()
  Evo::App5          = 'infoper'
  Evo::Procedure5          = GlobalErrors.GetProcedureName()& 5
 
  FREE(QPar5)
  Q5:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,'
  ADD(QPar5)  !!1
  Q5:FieldPar  = ';'
  ADD(QPar5)  !!2
  Q5:FieldPar  = 'Spanish'
  ADD(QPar5)  !!3
  Q5:FieldPar  = ''
  ADD(QPar5)  !!4
  Q5:FieldPar  = true
  ADD(QPar5)  !!5
  Q5:FieldPar  = ''
  ADD(QPar5)  !!6
  Q5:FieldPar  = true
  ADD(QPar5)  !!7
 !!!! Exportaciones
  Q5:FieldPar  = 'HTML|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'EXCEL|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'WORD|'
  Q5:FieldPar  = CLIP( Q5:FieldPar)&'ASCII|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'XML|'
   Q5:FieldPar  = CLIP( Q5:FieldPar)&'PRT|'
  ADD(QPar5)  !!8
  Q5:FieldPar  = 'All'
  ADD(QPar5)   !.9.
  Q5:FieldPar  = ' 0'
  ADD(QPar5)   !.10
  Q5:FieldPar  = 0
  ADD(QPar5)   !.11
  Q5:FieldPar  = '1'
  ADD(QPar5)   !.12
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.13
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.14
 
  Q5:FieldPar  = ''
  ADD(QPar5)   !.15
 
   Q5:FieldPar  = '16'
  ADD(QPar5)   !.16
 
   Q5:FieldPar  = 1
  ADD(QPar5)   !.17
   Q5:FieldPar  = 2
  ADD(QPar5)   !.18
   Q5:FieldPar  = '2'
  ADD(QPar5)   !.19
   Q5:FieldPar  = 12
  ADD(QPar5)   !.20
 
   Q5:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar5)   !.21
 
   Q5:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar5)   !.22
 
   CLEAR(Q5:FieldPar)
  ADD(QPar5)   ! 23 Caracteres Encoding para xml
 
  Q5:FieldPar  = '0'
  ADD(QPar5)   ! 24 Use Open Office
 
   Q5:FieldPar  = 'golmedo'
  ADD(QPar5) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q5:FieldPar  = ''
  ADD(QPar5)   ! 26 
  Q5:FieldPar  = ''
  ADD(QPar5)   ! 27 
  Q5:FieldPar  = '' 
  ADD(QPar5)   ! 28 
  Q5:FieldPar  = 'BEXPORT' 
  ADD(QPar5)   ! 29 infoper034.clw
 !!!!!
 
 
  FREE(QPar25)
  Qp25:F2N  = 'ECNOEXPORT'
  Qp25:F2P  = '@n-14'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'FECHA'
  Qp25:F2P  = '@d17'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'LEGAJO'
  Qp25:F2P  = '@n_7'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'EMPLEADO'
  Qp25:F2P  = '@s31'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'CC'
  Qp25:F2P  = '@n_7'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = '_9931'
  Qp25:F2P  = '@n_11.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'LIQ'
  Qp25:F2P  = '@s9'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'DIAS'
  Qp25:F2P  = '@n3'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'C. SOCIALES'
  Qp25:F2P  = '@n_11.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
       Qp25:F2N  = 'VAC PTE LIQ'
  Qp25:F2P  = '@n_11.2'
  Qp25:F2T  = '0'
  ADD(QPar25)
  Qp25:F2N  = 'ECNOEXPORT'
  Qp25:F2P  = '@t7'
  Qp25:F2T  = '0'
  ADD(QPar25)
  SysRec# = false
  FREE(Loc::QHlist5)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar25,SysRec#)
         QHL5:Id      = SysRec#
         QHL5:Nombre  = Qp25:F2N
         QHL5:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL5:Pict    = Qp25:F2P
         QHL5:Tot    = Qp25:F2T
         ADD(Loc::QHlist5)
      Else
        break
     END
  END
  Loc::Titulo5 =Loc:title
 
 SavPath5 = PATH()
  Exportar(Loc::QHlist5,BRW1.Q,QPar5,0,Loc::Titulo5,Evo::Group5)
 IF Not EC::LoadI_5 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath5)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcesarAsientoProvision')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PROVD:PROVD_ID',PROVD:PROVD_ID)                    ! Added by: ExBrowse(Evo_Export)
  BIND('PROV:PROV_ID',PROV:PROV_ID)                        ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_LEGAJO',PROVD:PROVD_LEGAJO)            ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_CCOSTO',PROVD:PROVD_CCOSTO)            ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_9931',PROVD:PROVD_9931)                ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_LIQUIDACION',PROVD:PROVD_LIQUIDACION)  ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_DIAS',PROVD:PROVD_DIAS)                ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_CARGAS',PROVD:PROVD_CARGAS)            ! Added by: BrowseBox(ABC)
  BIND('PROVD:PROVD_VACPTELIQ',PROVD:PROVD_VACPTELIQ)      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:ADETALLE_LICENCIA.Open                            ! File ADETALLE_LICENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:CTA_CONTABLE.Open                                 ! File CTA_CONTABLE used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_PROVISION.SetOpenRelated()
  Relate:DETALLE_PROVISION.Open                            ! File DETALLE_PROVISION used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  Access:PROVISION.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DETALLE_PROVISION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AppendOrder('PROVD:PROVD_CCOSTO')                   ! Append an additional sort order
  BRW1.SetFilter('(PROVD:PROVD_ID = PROV:PROV_ID)')        ! Apply filter expression to browse
  BRW1.AddField(PROVD:PROVD_ID,BRW1.Q.PROVD:PROVD_ID)      ! Field PROVD:PROVD_ID is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_FECHA_DATE,BRW1.Q.PROVD:PROVD_FECHA_DATE) ! Field PROVD:PROVD_FECHA_DATE is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_LEGAJO,BRW1.Q.PROVD:PROVD_LEGAJO) ! Field PROVD:PROVD_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_CCOSTO,BRW1.Q.PROVD:PROVD_CCOSTO) ! Field PROVD:PROVD_CCOSTO is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_9931,BRW1.Q.PROVD:PROVD_9931)  ! Field PROVD:PROVD_9931 is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_LIQUIDACION,BRW1.Q.PROVD:PROVD_LIQUIDACION) ! Field PROVD:PROVD_LIQUIDACION is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_DIAS,BRW1.Q.PROVD:PROVD_DIAS)  ! Field PROVD:PROVD_DIAS is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_CARGAS,BRW1.Q.PROVD:PROVD_CARGAS) ! Field PROVD:PROVD_CARGAS is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_VACPTELIQ,BRW1.Q.PROVD:PROVD_VACPTELIQ) ! Field PROVD:PROVD_VACPTELIQ is a hot field or requires assignment from browse
  BRW1.AddField(PROVD:PROVD_FECHA_TIME,BRW1.Q.PROVD:PROVD_FECHA_TIME) ! Field PROVD:PROVD_FECHA_TIME is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_LEGAJO,BRW1.Q.EPL:EMP_LEGAJO)      ! Field EPL:EMP_LEGAJO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ADETALLE_LICENCIA.Close
    Relate:CTA_CONTABLE.Close
    Relate:DETALLE_PROVISION.Close
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  !Refresco el nombre de la cuenta contable de la Licencia
  IF GlobalResponse = RequestCompleted THEN
  	!MESSAGE(CTA:CTA_DETALLE)
  	CTA:CTA_ID_UNIBIZ = PROV:PROV_LICENCIA
  	GET(CTA_CONTABLE,CTA:PK_CTA_CONTABLE)
  	IF NOT ERRORCODE() THEN
  		Loc:CtaDetalle = CTA:CTA_DETALLE
  		DISPLAY()
  		Loc:title = 'PROVISIÓN ' & clip(Loc:CtaDetalle) & ' MES: ' & FORMAT(PROV:PROV_MES,@N02) & ' AÑO: ' & FORMAT(PROV:PROV_ANIO,@N04)
  	END	
  ELSE
  	IF PROV:PROV_ID <> 0 THEN
  		GET(PROVISION,PROV:PK_PROVISION)
  		IF ERRORCODE() THEN
  			!BLANQUEO VARIBALES
  			PROV:PROV_ID = 0	
  			PROV:PROV_MES = 0
  			PROV:PROV_ANIO = 0
  			Loc:CtaDetalle = ''
  			Loc:saldo = 0
  			Loc:title = ''
  			!DESHABILITO LOS BOTONES
  			DISABLE(?BUTTON2)
  			DISABLE(?BUTTON1)
  			DISABLE(?EvoExportar)
  			ThisWindow.Reset(True)
  		END	
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
    Provision
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PROV:PROV_ID
      IF PROV:PROV_ID OR ?PROV:PROV_ID{PROP:Req}
        PROV:PROV_ID = PROV:PROV_ID
        IF Access:PROVISION.TryFetch(PROV:PK_PROVISION)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            PROV:PROV_ID = PROV:PROV_ID
          ELSE
            SELECT(?PROV:PROV_ID)
            CYCLE
          END
        END
      END
      ThisWindow.Reset(1)
    OF ?CallLookup
      ThisWindow.Update()
      !MUESTRA LA LISTA DE CABECERAS DE PROVISIONES
      !clear(PROV:PROV_ID,1)
      !post(event:accepted,?PROV:PROV_ID)
      PROV:PROV_ID = PROV:PROV_ID
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PROV:PROV_ID = PROV:PROV_ID
      END
      ThisWindow.Reset(1)
    OF ?BUTTON2
      ThisWindow.Update()
      !GENERAR VALORES PROVISION
      !CONSULTO LICENCIAS CON EL IDCTA DE LA PROVISION QUE
      !LIC_COBRE <> 'S' INNER JOIN EMPLEADO PARA TRAER LOS VALORES
      !DE LA PROVISION 9931 Y COMPLETAR LOS CAMPOS DETALLE PROVISION 
      !CALCULAR VALORES CARGAS SOCIALES ES EL 36% DEL VALOR DEL 9931*DIAS
      	clear(Loc:str)
      	Loc:str = 'SELECT EMP_LEGAJO, EMP_CCOSTO,EMP_PROVISION,EMP_LIQUIDACION,LIC_PAGAN FROM LICENCIA '&|	
      		  ' INNER   JOIN EMPLEADOS ON LIC_LEGAJO = EMP_LEGAJO '&|
      		  ' WHERE LIC_COBRO <> ''S'' AND EMP_ACTIVO = ''S'' AND EMP_CONVENIO <> 12 AND EMP_CONVENIO <> 3 AND LIC_CTA = '& PROV:PROV_LICENCIA
      	SETCLIPBOARD(Loc:str)
      	
      	TMPUsosMultiples{Prop:Sql} = CLIP(Loc:str)
          IF ERRORCODE() THEN
            MESSAGE(FileErrorCode() & ' -- ' & FileError() & ' -- ' & ErrorFile())
      		STOP(FileErrorCode())
      	
      	END
      
          Display
      	setcursor(CURSOR:wait)
      	!PROCESA CONSULTA
      	CLEAR(PROVD:RECORD)
          Loc:contador = 0
      	Loc:saldo = 0
      	!INSERTA EN CORTE_DETALLE EL RESULTADO DE LA CONSULTA
          loop
              next(TMPUsosMultiples)
              if errorcode() then break.   
      			PROVD:PROVD_ID = PROV:PROV_ID
      			PROVD:PROVD_LEGAJO = TUM:Col01
      			PROVD:PROVD_CCOSTO = TUM:Col02
      			PROVD:PROVD_FECHA_DATE = today()
      			PROVD:PROVD_9931 = TUM:Col03
      			PROVD:PROVD_LIQUIDACION = TUM:Col04
      			PROVD:PROVD_DIAS = TUM:Col05
      			PROVD:PROVD_CARGAS = ((TUM:Col03 * TUM:Col05) *36)/100
      			PROVD:PROVD_VACPTELIQ = TUM:Col03 * TUM:Col05
      			
      			Access:DETALLE_PROVISION.Insert()
      			IF ERROR()
      			END	
      
      		Loc:contador += 1
      		Loc:saldo += PROVD:PROVD_CARGAS + PROVD:PROVD_VACPTELIQ
      		
      	end ! loop
      
      	setcursor()
      
          message('Proceso concluido con ' & loc:contador & ' Registros','Provisión Procesada',Icon:Asterisk)
      	Display
      	BRW1.ResetFromFile()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse5
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?CallLookup
    !HABILITO O DESHABILITO EL GENERAR DETALLE Y EXPORTAR
    IF RECORDS(Queue:Browse:1) > 0 THEN
    	ENABLE(?BUTTON1)
    	ENABLE(?EvoExportar)
    	DISABLE(?BUTTON2)
    END
    IF RECORDS(Queue:Browse:1) = 0 AND PROV:PROV_ID <> 0 THEN
    	ENABLE(?BUTTON2)
    	DISABLE(?BUTTON1)
    	DISABLE(?EvoExportar)	
    END	
  END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.ResetFromView PROCEDURE

Loc:saldo:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:DETALLE_PROVISION.SetQuickScan(1)
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
    Loc:saldo:Sum += PROVD:PROVD_VACPTELIQ
  END
  SELF.View{PROP:IPRequestCount} = 0
  Loc:saldo = Loc:saldo:Sum
  PARENT.ResetFromView
  Relate:DETALLE_PROVISION.SetQuickScan(0)
  SETCURSOR()


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  !HABILITO O DESHABILITO EL GENERAR DETALLE Y EXPORTAR
  IF RECORDS(Queue:Browse:1) > 0 THEN
  	ENABLE(?BUTTON1)
  	ENABLE(?EvoExportar)
  	DISABLE(?BUTTON2)
  END
  IF RECORDS(Queue:Browse:1) = 0 AND PROV:PROV_ID <> 0 THEN
  	ENABLE(?BUTTON2)
  	DISABLE(?BUTTON1)
  	DISABLE(?EvoExportar)
  END	
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CTA_CONTABLE file
!!! </summary>
LicenciaCtaContable PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(CTA_CONTABLE)
                       PROJECT(CTA:CTA_ID_UNIBIZ)
                       PROJECT(CTA:CTA_CUENTA)
                       PROJECT(CTA:CTA_DETALLE)
                       PROJECT(CTA:CTA_IMPU)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CTA:CTA_ID_UNIBIZ      LIKE(CTA:CTA_ID_UNIBIZ)        !List box control field - type derived from field
CTA:CTA_CUENTA         LIKE(CTA:CTA_CUENTA)           !List box control field - type derived from field
CTA:CTA_DETALLE        LIKE(CTA:CTA_DETALLE)          !List box control field - type derived from field
CTA:CTA_IMPU           LIKE(CTA:CTA_IMPU)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Cuenta Contable de Licencia'),AT(,,252,223),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaCtaContable'), |
  SYSTEM
                       LIST,AT(8,30,236,179),USE(?Browse:1),FONT(,10),VSCROLL,FLAT,FORMAT('64C(2)|M~ID UNIBIZ~' & |
  'C(0)@n_7@64C(2)|M~CUENTA~C(0)@n_14@80C(2)|M~DESCRIPCION~@s40@0L(2)|M~CTA IMPU~@s1@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the CTA_CONTABLE file')
                       SHEET,AT(4,4,244,213),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           BUTTON('&Select'),AT(153,102,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                         END
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

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
  GlobalErrors.SetProcedureName('LicenciaCtaContable')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CTA:CTA_IMPU',CTA:CTA_IMPU)                        ! Added by: BrowseBox(ABC)
  BIND('CTA:CTA_ID_UNIBIZ',CTA:CTA_ID_UNIBIZ)              ! Added by: BrowseBox(ABC)
  BIND('CTA:CTA_CUENTA',CTA:CTA_CUENTA)                    ! Added by: BrowseBox(ABC)
  BIND('CTA:CTA_DETALLE',CTA:CTA_DETALLE)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CTA_CONTABLE.Open                                 ! File CTA_CONTABLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CTA_CONTABLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.SetFilter('(CTA:CTA_IMPU = ''H'')')                 ! Apply filter expression to browse
  BRW1.AddField(CTA:CTA_ID_UNIBIZ,BRW1.Q.CTA:CTA_ID_UNIBIZ) ! Field CTA:CTA_ID_UNIBIZ is a hot field or requires assignment from browse
  BRW1.AddField(CTA:CTA_CUENTA,BRW1.Q.CTA:CTA_CUENTA)      ! Field CTA:CTA_CUENTA is a hot field or requires assignment from browse
  BRW1.AddField(CTA:CTA_DETALLE,BRW1.Q.CTA:CTA_DETALLE)    ! Field CTA:CTA_DETALLE is a hot field or requires assignment from browse
  BRW1.AddField(CTA:CTA_IMPU,BRW1.Q.CTA:CTA_IMPU)          ! Field CTA:CTA_IMPU is a hot field or requires assignment from browse
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

