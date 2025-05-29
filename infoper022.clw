

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER022.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER020.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
LicenciaPorSector PROCEDURE 

Loc:str              STRING(4000)                          !
Loc:Titulo           STRING(100)                           !
QLicencias           QUEUE,PRE(QLIC)                       !
QLegajo              LONG                                  !
QEmpleado            STRING(30)                            !
QAnio                LONG                                  !
QDias                SHORT                                 !
QTomo                SHORT                                 !
QQuedan              SHORT                                 !
QCobro               STRING(1)                             !
QSectorID            SHORT                                 !
QSector              STRING(50)                            !
                     END                                   !
Loc:opcion           BYTE                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Licencias Por Sector'),AT(,,406,300),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaPorSector'), |
  SYSTEM
                       GROUP,AT(3,4,398,42),USE(?GROUP1),FONT(,,,FONT:bold),BOXED
                         ENTRY(@s50),AT(8,20,146,15),USE(SEC:SEC_SECTOR),FONT(,,COLOR:Red),UPR,DISABLE,FLAT
                         BUTTON,AT(160,20,15,15),USE(?CallLookup)
                         OPTION,AT(177,11,108,28),USE(Loc:opcion),FONT(,,COLOR:Red,FONT:bold),TRN
                           RADIO(' Por Sector'),AT(187,19),USE(?OPTION1:RADIO1),FONT(,,,FONT:bold),VALUE('1')
                           RADIO(' Todos'),AT(242,19,33),USE(?LOC:OPCION:RADIO1),VALUE('2')
                         END
                         BUTTON('Procesar'),AT(287,10,58,28),USE(?BUTTON1),FONT(,,,FONT:regular),LEFT,ICON('down.ico'), |
  FLAT,LAYOUT(0)
                         STRING('Sector'),AT(8,10),USE(?STRING1),FONT(,,COLOR:Red,FONT:bold)
                         BUTTON('E&xportar'),AT(347,10,52,28),USE(?EvoExportar),FONT(,,,FONT:regular),LEFT,ICON('export.ico'), |
  CURSOR('mano.cur'),FLAT
                       END
                       ENTRY(@n-7),AT(14,30,60,10),USE(SEC:SEC_ID),HIDE
                       LIST,AT(3,52,398,242),USE(QLicencias),HVSCROLL,FLAT,FORMAT('30C(2)|M~LEGAJO~C(0)@n_7@11' & |
  '0L(2)|M~EMPLEADO~C(0)@s30@35C(2)|M~LICENCIA~C(1)@n04@35C(2)|M~DIAS~C(1)@n_7@35C(2)|M' & |
  '~TOMO~C(1)@n_7@35C(2)|M~QUEDAN~C(1)@n_7@28C(2)|M~COBRO~C(0)@s1@0C(2)|M~QS ector~C(1)' & |
  '@n_7@110L(2)|M~SECTOR~C(0)@s50@'),FROM(QLicencias)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
Loc::QHlist1 QUEUE,PRE(QHL1)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar1 QUEUE,PRE(Q1)
FieldPar                 CSTRING(800)
                         END
QPar21 QUEUE,PRE(Qp21)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado1          STRING(100)
Loc::Titulo1          STRING(100)
SavPath1          STRING(2000)
Evo::Group1  GROUP,PRE()
Evo::Procedure1          STRING(100)
Evo::App1          STRING(100)
Evo::NroPage          LONG
   END

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
PrintExQueue1 ROUTINE

 Evo::App1          = 'infoper'
 Evo::Procedure1          = GlobalErrors.GetProcedureName()& 1

 FREE(QPar1)
 Q1:FieldPar  = '1,2,3,4,5,6,7,8,9,'
 ADD(QPar1)  !!1
 Q1:FieldPar  = ';'
 ADD(QPar1)  !!2
 Q1:FieldPar  = 'Spanish'
 ADD(QPar1)  !!3
 Q1:FieldPar  = ''
 ADD(QPar1)  !!4
 Q1:FieldPar  = true
 ADD(QPar1)  !!5
 Q1:FieldPar  = ''
 ADD(QPar1)  !!6
 Q1:FieldPar  = true
 ADD(QPar1)  !!7
!!!! Exportaciones
 Q1:FieldPar  = 'HTML|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'EXCEL|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'WORD|'
 Q1:FieldPar  = CLIP( Q1:FieldPar)&'ASCII|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'XML|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'PRT|'
 ADD(QPar1)  !!8
 Q1:FieldPar  = 'All'
 ADD(QPar1)   !.9.
 Q1:FieldPar  = ' 0'
 ADD(QPar1)   !.10
 Q1:FieldPar  = 0
 ADD(QPar1)   !.11
 Q1:FieldPar  = '1'
 ADD(QPar1)   !.12

 Q1:FieldPar  = ''
 ADD(QPar1)   !.13

 Q1:FieldPar  = ''
 ADD(QPar1)   !.14

 Q1:FieldPar  = ''
 ADD(QPar1)   !.15

  Q1:FieldPar  = '16'
 ADD(QPar1)   !.16

  Q1:FieldPar  = 1
 ADD(QPar1)   !.17
  Q1:FieldPar  = 2
 ADD(QPar1)   !.18
  Q1:FieldPar  = '2'
 ADD(QPar1)   !.19
  Q1:FieldPar  = 12
 ADD(QPar1)   !.20

  Q1:FieldPar  = 0 !Exporta excel sin borrar
 ADD(QPar1)   !.21

  Q1:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
 ADD(QPar1)   !.22

  CLEAR(Q1:FieldPar)
 ADD(QPar1)   ! 23 Caracteres Encoding para xml

 Q1:FieldPar  = '0'
 ADD(QPar1)   ! 24 Use Open Office

  Q1:FieldPar  = 'golmedo'
 ADD(QPar1) ! 25

!---------------------------------------------------------------------------------------------
!!Registration 
 Q1:FieldPar  = ''
 ADD(QPar1)   ! 26 
 Q1:FieldPar  = ''
 ADD(QPar1)   ! 27 
 Q1:FieldPar  = '' 
 ADD(QPar1)   ! 28 
 Q1:FieldPar  = 'BEXPORT' 
 ADD(QPar1)   ! 29 infoper022.clw
!!!!!


 FREE(QPar21)
      Qp21:F2N  = 'LEGAJO'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'EMPLEADO'
 Qp21:F2P  = '@s30'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'LICENCIA'
 Qp21:F2P  = '@n04'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'DIAS'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'TOMO'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'QUEDAN'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'COBRO'
 Qp21:F2P  = '@s1'
 Qp21:F2T  = '0'
 ADD(QPar21)
 Qp21:F2N  = 'ECNOEXPORT'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'SECTOR'
 Qp21:F2P  = '@s50'
 Qp21:F2T  = '0'
 ADD(QPar21)
 SysRec# = false
 FREE(Loc::QHlist1)
 LOOP
    SysRec# += 1
    IF ?QLicencias{PROPLIST:Exists,SysRec#} = 1
        GET(QPar21,SysRec#)
        QHL1:Id      = SysRec#
        QHL1:Nombre  = Qp21:F2N
        QHL1:Longitud= ?QLicencias{PropList:Width,SysRec#}  /2
        QHL1:Pict    = Qp21:F2P
        QHL1:Tot    = Qp21:F2T
        ADD(Loc::QHlist1)
     Else
       break
    END
 END
 Loc::Titulo1 =Loc:Titulo

 SavPath1 = PATH()

  Exportar(Loc::QHlist1,QLicencias,QPar1,0,Loc::Titulo1,Evo::Group1)
 SETPATH(SavPath1)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LicenciaPorSector')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SEC:SEC_SECTOR
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:SECTOR.Open                                       ! File SECTOR used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:opcion = '1'
     ENABLE(?CallLookup)
  END
  IF Loc:opcion = '2'
     SEC:SEC_SECTOR = ''
     DISABLE(?CallLookup)
  END
  SELF.SetAlerts()
  Loc:opcion = 1
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SECTOR.Close
    Relate:TMPUsosMultiples.Close
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
    Sectores
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
    OF ?CallLookup
      ThisWindow.Update()
      SEC:SEC_ID = SEC:SEC_ID
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SEC:SEC_ID = SEC:SEC_ID
      END
      ThisWindow.Reset(1)
    OF ?Loc:opcion
      IF Loc:opcion = '1'
         ENABLE(?CallLookup)
      END
      IF Loc:opcion = '2'
         SEC:SEC_SECTOR = ''
         DISABLE(?CallLookup)
      END
      ThisWindow.Reset()
    OF ?BUTTON1
      ThisWindow.Update()
      !CONSULTA PARA ARMAR REPORT COLA O BROWSE
      !
      !select sum(lic_dias) as DIASL, isnull(SUM(dlic_toma),0) as TOMO, sum(lic_dias) - isnull(sum(dlic_toma),0) as DIASQ,LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR, SEC_SECTOR as Sector
      !from LICENCIA 
      !inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_CONVENIO <> 3 AND EMP_CONVENIO <> 12 and EMP_ACTIVO = 'S' --AND EMP_SECTOR = 31
      !left outer join DETALLE_LICENCIA on LIC_LEGAJO = DLIC_LEGAJO and lic_anio = DLIC_ANIO AND DLIC_ESTADO <> 'A'
      !LEFT OUTER join SECTOR on SEC_ID = EMP_SECTOR
      !group by LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR,SEC_SECTOR ORDER BY LIC_LEGAJO,LIC_ANIO
      Loc:Titulo = 'LICENCIAS POR SECTOR'
      IF Loc:opcion = 1 THEN
      	Loc:str = 'select lic_dias as DIASL, isnull(SUM(dlic_toma),0) as TOMO, lic_dias - isnull(sum(dlic_toma),0) as DIASQ,LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR, SEC_SECTOR as Sector ' &|
      			  'from LICENCIA ' &|
      			  'inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_ACTIVO = ''S'' AND EMP_SECTOR = ' & SEC:SEC_ID & ' AND EMP_CONVENIO <> 12 ' &|
      			  'left outer join DETALLE_LICENCIA on LIC_LEGAJO = DLIC_LEGAJO  AND DLIC_ESTADO <> ''A'' and lic_anio = DLIC_ANIO ' &|
                    'left outer join SECTOR on SEC_ID = EMP_SECTOR ' &|
      			  'group by LIC_DIAS,LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR,SEC_SECTOR ORDER BY LIC_LEGAJO,LIC_ANIO '
      
      ELSIF Loc:opcion = 2 THEN
      	Loc:str = 'select lic_dias as DIASL, isnull(SUM(dlic_toma),0) as TOMO, lic_dias - isnull(sum(dlic_toma),0) as DIASQ,LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR, SEC_SECTOR as Sector ' &|
      			  'from LICENCIA ' &|
      			  'inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_ACTIVO = ''S'' AND EMP_CONVENIO <> 12 ' &|
      			  'left outer join DETALLE_LICENCIA on LIC_LEGAJO = DLIC_LEGAJO  AND DLIC_ESTADO <> ''A'' and lic_anio = DLIC_ANIO ' &|
                    'left outer join SECTOR on SEC_ID = EMP_SECTOR ' &|
      			  'group by LIC_DIAS,LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR,SEC_SECTOR ORDER BY LIC_LEGAJO,LIC_ANIO '
      END
      setclipboard(Loc:str)
      
      TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
      if errorcode() then	stop(FileErrorCode()).
      FREE(QLicencias)	
      Loop
      	next(TMPUsosMultiples)
      	if errorcode() then break.
      	QLIC:QLegajo = TUM:Col04
      	QLIC:QEmpleado =  TUM:Col07
      	QLIC:QAnio = TUM:Col05
      	QLIC:QDias =  TUM:Col01
      	QLIC:QTomo = TUM:Col02
      	QLIC:QQuedan = TUM:Col03
      	QLIC:QCobro = TUM:Col06
      	QLIC:QSector = TUM:Col09
      	ADD(QLicencias)
      end !Loop
      	
      !!Para recorrer toda una cola
      !
      !LOOP Q# = 1 TO RECORDS(COLA) BY 1;GET(COLA,Q#)
      !
      !END
      !
      !GET(COLA,CAMPO)	Busca un registro
      !(El campo a buscar tiene que ser de la cola previamente igualado)
      !ADD(COLA)		Inserta un registro
      !PUT(COLA)		Modifica un registro
      !DELETE(COLA)	Borra un registro
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExQueue1
    OF ?SEC:SEC_ID
      IF SEC:SEC_ID OR ?SEC:SEC_ID{PROP:Req}
        SEC:SEC_ID = SEC:SEC_ID
        IF Access:SECTOR.TryFetch(SEC:PK_SECTOR)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            SEC:SEC_ID = SEC:SEC_ID
          ELSE
            SELECT(?SEC:SEC_ID)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
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
!!! Browse the SECTOR file
!!! </summary>
Sectores PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(SECTOR)
                       PROJECT(SEC:SEC_ID)
                       PROJECT(SEC:SEC_SECTOR)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SEC:SEC_ID             LIKE(SEC:SEC_ID)               !List box control field - type derived from field
SEC:SEC_SECTOR         LIKE(SEC:SEC_SECTOR)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Sectores'),AT(,,294,283),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,HLP('Sectores'),SYSTEM
                       LIST,AT(8,25,274,248),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('36C(2)|M~ID~C(0)@n' & |
  '_7@80L(2)|M~SECTOR~C(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the SECTOR file')
                       BUTTON('&Select'),AT(24,260,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,286,277),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                       STRING(@s50),AT(44,4,238),USE(SEC:SEC_SECTOR),FONT(,10,COLOR:Red,FONT:bold)
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
SetAlerts              PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
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
  GlobalErrors.SetProcedureName('Sectores')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SEC:SEC_ID',SEC:SEC_ID)                            ! Added by: BrowseBox(ABC)
  BIND('SEC:SEC_SECTOR',SEC:SEC_SECTOR)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:SECTOR.Open                                       ! File SECTOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SECTOR,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SEC:PK_NOMBRE)                        ! Add the sort order for SEC:PK_NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?SEC:SEC_SECTOR,SEC:SEC_SECTOR,1,BRW1) ! Initialize the browse locator using ?SEC:SEC_SECTOR using key: SEC:PK_NOMBRE , SEC:SEC_SECTOR
  BRW1.AddField(SEC:SEC_ID,BRW1.Q.SEC:SEC_ID)              ! Field SEC:SEC_ID is a hot field or requires assignment from browse
  BRW1.AddField(SEC:SEC_SECTOR,BRW1.Q.SEC:SEC_SECTOR)      ! Field SEC:SEC_SECTOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.Init(Queue:Browse:1,?Browse:1,'','',BRW1::View:Browse,SEC:PK_SECTOR)
  BRW1::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SECTOR.Close
  !Kill the Sort Header
  BRW1::SortHeader.Kill()
  END
  GlobalErrors.SetProcedureName
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


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
!!! <summary>
!!! Generated from procedure template - Report
!!! Report the LICENCIA File
!!! </summary>
ReportLicenciasPorSector PROCEDURE (long sector)

Progress:Thermometer BYTE                                  !
Process:View         VIEW(LICENCIA)
                       PROJECT(LIC:LIC_ANIO)
                       PROJECT(LIC:LIC_COBRO)
                       PROJECT(LIC:LIC_CTA)
                       PROJECT(LIC:LIC_DEPOSITADA)
                       PROJECT(LIC:LIC_DEPOSITO_DATE)
                       PROJECT(LIC:LIC_DEPOSITO_TIME)
                       PROJECT(LIC:LIC_DIAS)
                       PROJECT(LIC:LIC_DIAS_VIAJE)
                       PROJECT(LIC:LIC_FECHA_UPDATE_DATE)
                       PROJECT(LIC:LIC_FECHA_UPDATE_TIME)
                       PROJECT(LIC:LIC_LEGAJO)
                       PROJECT(LIC:LIC_PAGAN)
                       PROJECT(LIC:LIC_USER)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Report LICENCIA'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('LICENCIA Report'),AT(250,1020,7750,10168),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE,FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,7750,770),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report LICENCIA file'),AT(0,20,7750,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
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
                         STRING('LIC LEGAJO'),AT(50,390,675,170),USE(?HeaderTitle:1),TRN
                         STRING('LIC ANIO'),AT(825,390,675,170),USE(?HeaderTitle:2),TRN
                         STRING('LIC DIAS'),AT(1600,390,675,170),USE(?HeaderTitle:3),TRN
                         STRING('LIC COBRO'),AT(2375,390,675,170),USE(?HeaderTitle:4),TRN
                         STRING('LIC DEPOSITADA'),AT(3150,390,675,170),USE(?HeaderTitle:5),TRN
                         STRING('LIC FECHA UPDATE DATE'),AT(3925,390,675,170),USE(?HeaderTitle:6),TRN
                         STRING('LIC FECHA UPDATE TIME'),AT(4700,390,675,170),USE(?HeaderTitle:7),TRN
                         STRING('LIC PAGAN'),AT(5475,390,675,170),USE(?HeaderTitle:8),TRN
                         STRING('LIC DEPOSITO DATE'),AT(6250,390,675,170),USE(?HeaderTitle:9),TRN
                         STRING('LIC DEPOSITO TIME'),AT(7025,390,675,170),USE(?HeaderTitle:10),TRN
                         STRING('LIC DIAS VIAJE'),AT(50,570,675,170),USE(?HeaderTitle:11),TRN
                         STRING('LIC CTA'),AT(825,570,675,170),USE(?HeaderTitle:12),TRN
                         STRING('LIC USER'),AT(1600,570,675,170),USE(?HeaderTitle:13),TRN
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
                         STRING(@n-7),AT(50,50,675,170),USE(LIC:LIC_LEGAJO),LEFT
                         STRING(@n-7),AT(825,50,675,170),USE(LIC:LIC_ANIO),LEFT
                         STRING(@n3),AT(1600,50,675,170),USE(LIC:LIC_DIAS),LEFT
                         STRING(@s1),AT(2375,50,675,170),USE(LIC:LIC_COBRO),LEFT
                         STRING(@s1),AT(3150,50,675,170),USE(LIC:LIC_DEPOSITADA),LEFT
                         STRING(@d17),AT(3925,50,675,170),USE(LIC:LIC_FECHA_UPDATE_DATE),LEFT
                         STRING(@t7),AT(4700,50,675,170),USE(LIC:LIC_FECHA_UPDATE_TIME),LEFT
                         STRING(@n3),AT(5475,50,675,170),USE(LIC:LIC_PAGAN),LEFT
                         STRING(@d17),AT(6250,50,675,170),USE(LIC:LIC_DEPOSITO_DATE),LEFT
                         STRING(@t7),AT(7025,50,675,170),USE(LIC:LIC_DEPOSITO_TIME),LEFT
                         STRING(@s1),AT(50,230,675,170),USE(LIC:LIC_DIAS_VIAJE),LEFT
                         STRING(@n-14),AT(825,230,675,170),USE(LIC:LIC_CTA),RIGHT
                         STRING(@s20),AT(1600,230,675,170),USE(LIC:LIC_USER),LEFT
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
  GlobalErrors.SetProcedureName('ReportLicenciasPorSector')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LICENCIA.Open                                     ! File LICENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ThisReport.Init(Process:View, Relate:LICENCIA, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:LICENCIA.SetQuickScan(1,Propagate:OneMany)
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
    Relate:LICENCIA.Close
  END
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the EMPLEADOS file
!!! </summary>
EmpleadosEdit PROCEDURE 

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
                       PROJECT(EPL:EMP_OBSERVACION)
                       PROJECT(EPL:EMP_COD_REEMBOLSO)
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
EPL:EMP_OBSERVACION    LIKE(EPL:EMP_OBSERVACION)      !List box control field - type derived from field
EPL:EMP_COD_REEMBOLSO  LIKE(EPL:EMP_COD_REEMBOLSO)    !List box control field - type derived from field
EPL:EMP_ACTIVO         LIKE(EPL:EMP_ACTIVO)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Empleados - Licencias'),AT(,,637,351),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ABMEmpleadosLicencia'), |
  SYSTEM
                       LIST,AT(14,24,615,310),USE(?Browse:1),FONT(,10,,FONT:bold),HVSCROLL,FLAT,FORMAT('37C|M~Lega' & |
  'jo~@n_7@179L(4)|M~Empleado~C(2)@s50@141L(4)|M~Dirección~C(2)@s25@60C(2)|M~Antiguedad' & |
  '~C(0)@D06@0R(4)|M~Convenio~C(0)@n-7@84L(4)|M~Convenio~C(0)@s21@150L(2)|M~Sector~C(0)' & |
  '@s50@0R(2)|M~Sector~C(0)@n-7@50R(2)|M~9930~R(12)@n_12.2@50R(2)|M~9931~R(12)@n_25.2@5' & |
  '5C(2)|M~Liquidación~C(0)@s9@32C(2)|M~C.C~C(1)@n_7@25C(2)|M~4800~C(0)@s1@45C|M~HORAEX' & |
  'T~@s3@200L(2)|M~OBSERVACION~C(0)@s50@32C|M~COD REEMBOLSO~C(1)@n-7@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the EMPLEADOS file')
                       BUTTON('&View'),AT(152,259,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       SHEET,AT(4,4,631,346),USE(?CurrentTab),FONT(,10,,FONT:bold)
                         TAB('Por Apellido'),USE(?Tab:2)
                           BUTTON('&Select'),AT(282,260),USE(?Select),HIDE
                         END
                         TAB('Sin Sector'),USE(?TAB1)
                         END
                         TAB('Sin Tipo Hora Extra'),USE(?TAB2)
                         END
                         TAB('Sin Cod. Reembolso'),USE(?TAB3)
                         END
                       END
                       STRING(@s31),AT(300,4,181),USE(EPL:EMP_NOMBRE),FONT(,10,COLOR:Red,FONT:bold)
                       BUTTON('&Insert'),AT(491,2,42,12),USE(?Insert:2),HIDE
                       BUTTON('&Editar'),AT(533,2,42,12),USE(?Change:2),FONT(,10),FLAT,HIDE
                       BUTTON('&Delete'),AT(575,2,42,12),USE(?Delete:2),HIDE
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 1
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('EmpleadosEdit')
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
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?EPL:EMP_NOMBRE,EPL:EMP_NOMBRE,,BRW1) ! Initialize the browse locator using ?EPL:EMP_NOMBRE using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.SetFilter('(EPL:EMP_SECTOR <<> 0 and EPL:EMP_ACTIVO = ''S'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,EPL:EMP_NOMBRE,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.SetFilter('(EPL:EMP_ACTIVO = ''S'' and EPL:EMP_SECTOR = 0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,EPL:EMP_NOMBRE,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.SetFilter('(EPL:EMP_ACTIVO = ''S'' and NULL(EPL:EMP_HORAEXTRA))') ! Apply filter expression to browse
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,EPL:EMP_NOMBRE,,BRW1)          ! Initialize the browse locator using  using key: EPL:PK_Nombre , EPL:EMP_NOMBRE
  BRW1.SetFilter('(EPL:EMP_ACTIVO = ''S'' and NULL(EPL:EMP_COD_REEMBOLSO) AND EPL:EMP_CONVENIO = 1)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,EPL:PK_Nombre)                        ! Add the sort order for EPL:PK_Nombre for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
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
  BRW1.AddField(EPL:EMP_OBSERVACION,BRW1.Q.EPL:EMP_OBSERVACION) ! Field EPL:EMP_OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_COD_REEMBOLSO,BRW1.Q.EPL:EMP_COD_REEMBOLSO) ! Field EPL:EMP_COD_REEMBOLSO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_ACTIVO,BRW1.Q.EPL:EMP_ACTIVO)      ! Field EPL:EMP_ACTIVO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1                                    ! Will call: EditarEmpleados
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
    EditarEmpleados
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
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 1
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 4
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Form EMPLEADOS
!!! </summary>
EditarEmpleados PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:porcentaje       DECIMAL(7,2)                          !
Loc:FileName         STRING(255)                           !
Loc:HorasExtras      STRING(3)                             !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::EPL:Record  LIKE(EPL:RECORD),THREAD
QuickWindow          WINDOW('Editar Empleado'),AT(,,310,280),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('EditarEmpleados'),SYSTEM
                       SHEET,AT(5,5,300,245),USE(?CurrentTab:2)
                         TAB,USE(?Tab:3)
                           PROMPT('Legajo:'),AT(10,25),USE(?EPL:EMP_LEGAJO:Prompt:2),FONT(,10,,FONT:bold),TRN
                           ENTRY(@n_7B),AT(10,41,62,20),USE(EPL:EMP_LEGAJO),FONT(,12,COLOR:Red,FONT:bold),CENTER(1),DISABLE, |
  FLAT
                           PROMPT('Empleado:'),AT(10,126),USE(?EPL:EMP_NOMBRE:Prompt:2),FONT(,10,,FONT:bold),TRN
                           ENTRY(@s31),AT(10,142,226,20),USE(EPL:EMP_NOMBRE),FONT(,10,COLOR:Red,FONT:bold),DISABLE,FLAT
                           PROMPT('Sector:'),AT(10,165),USE(?EPL:EMP_SECTOR:Prompt:2),FONT(,10,,FONT:bold),TRN
                           BUTTON,AT(280,181,20,20),USE(?CallLookup:2)
                           CHECK('LICENCIA CON GOCE'),AT(10,65,113),USE(EPL:EMP_LIC_CON_GOCE),FONT(,10,,FONT:bold),VALUE('S', |
  'N')
                           ENTRY(@s50),AT(10,181,266,20),USE(SEC:SEC_SECTOR),FONT(,10,COLOR:Red,FONT:bold),UPR,DISABLE, |
  FLAT
                           PROMPT('Observación:'),AT(10,204),USE(?EPL:EMP_OBSERVACION:Prompt),FONT(,10,,FONT:bold)
                           ENTRY(@s50),AT(10,220,290,20),USE(EPL:EMP_OBSERVACION),FONT(,10,COLOR:Red,FONT:bold),FLAT
                           COMBO(@s3),AT(76,41,70,20),USE(Loc:HorasExtras),FONT(,10,COLOR:Red,FONT:bold),DROP(10),FLAT, |
  FROM('SC|#SC|SNC|#SNC'),READONLY
                           STRING('Tipo Hs Extra:'),AT(76,25),USE(?STRING1),FONT(,10,,FONT:bold)
                           ENTRY(@n_7),AT(240,142,60,20),USE(EPL:EMP_COD_REEMBOLSO),FONT(,10,COLOR:Red,FONT:bold),CENTER(1), |
  FLAT
                           STRING('Reembolso:'),AT(240,126),USE(?STRING2),FONT(,10,,FONT:bold)
                           REGION,AT(203,25,97,97),USE(?Viewer)
                           BUTTON,AT(184,45,15,15),USE(?Ver),ICON(ICON:Zoom)
                           BUTTON,AT(184,25,15,15),USE(?Abrir),ICON(ICON:Open)
                           BUTTON,AT(184,65,15,15),USE(?Bright),ICON('brillo.ico')
                           BUTTON,AT(184,85,15,15),USE(?Guardar),ICON(ICON:Save)
                         END
                       END
                       BUTTON('&Aceptar'),AT(169,255,65,20),USE(?OK),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(238,255,65,20),USE(?Cancel),FONT(,10),LEFT,ICON('WACANCEL.ICO'),FLAT, |
  MSG('Cancel operation'),TIP('Cancel operation')
                       ENTRY(@n-7),AT(158,5,60,10),USE(SEC:SEC_ID),HIDE
                       ENTRY(@n-7),AT(95,5,40,10),USE(EPL:EMP_SECTOR),RIGHT(1),HIDE
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
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

ImgViewer            CLASS(ImageExViewerClass)
                     END
ImageExTwain7        CLASS(ImageExTwainClass)
OnAcquired              FUNCTION (ImageExBitmapClass bmp), BOOL, DERIVED
                     END
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
TheBitmap           IMAGEEXBITMAPCLASS
JpgSaver            IMAGEEXJPEGSAVERCLASS
OrigWidth         SIGNED
OrigHeight        SIGNED

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
  ImgViewer.Init(QuickWindow, ?Viewer)
  ImgViewer.SetBkColor(0)
  ImgViewer.Bitmap.SetStretchFilter(IMAGEEXSTRETCHFILTER:Nearest)
  ImgViewer.Bitmap.SetDrawMode(IMAGEEXDRAWMODE:Opaque)
  ImgViewer.Bitmap.SetMasterAlpha(255)
  ImgViewer.ZoomToFit()
  ImgViewer.SetAllowFocus(0)
  ImgViewer.SetScrollsVisible(0)
  ImgViewer.SetMouseMode(1*IEMM:PAN + 1*IEMM:ZoomWheel + 1 * IEMM:HOTSPOTS)
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Editar'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & EPL:EMP_NOMBRE & ')' ! Append status message to window title text
  OF InsertRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (New)'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('EditarEmpleados')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPL:EMP_LEGAJO:Prompt:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(EPL:Record,History::EPL:Record)
  SELF.AddHistoryField(?EPL:EMP_LEGAJO,1)
  SELF.AddHistoryField(?EPL:EMP_NOMBRE,2)
  SELF.AddHistoryField(?EPL:EMP_LIC_CON_GOCE,25)
  SELF.AddHistoryField(?EPL:EMP_OBSERVACION,27)
  SELF.AddHistoryField(?EPL:EMP_COD_REEMBOLSO,28)
  SELF.AddHistoryField(?EPL:EMP_SECTOR,16)
  SELF.AddUpdateFile(Access:EMPLEADOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:SECTOR.Open                                       ! File SECTOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:EMPLEADOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
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
    DISABLE(?CallLookup:2)
    ?SEC:SEC_SECTOR{PROP:ReadOnly} = True
    ?EPL:EMP_OBSERVACION{PROP:ReadOnly} = True
    DISABLE(?Loc:HorasExtras)
    ?EPL:EMP_COD_REEMBOLSO{PROP:ReadOnly} = True
    DISABLE(?Abrir)
    DISABLE(?Bright)
    DISABLE(?Guardar)
    ?SEC:SEC_ID{PROP:ReadOnly} = True
    ?EPL:EMP_SECTOR{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  Loc:HorasExtras = EPL:EMP_HORAEXTRA
  ! SI NO ES LyF DESHABILITO EL REEMBOLSO
  IF EPL:EMP_CONVENIO <> 1 THEN
  	HIDE(?STRING2)
  	HIDE(?EPL:EMP_COD_REEMBOLSO)
  END	
  ImgViewer.Bitmap.LoadFromBlob(EPL:EMP_FOTO)
  ImgViewer.ZoomToFit()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMPLEADOS.Close
    Relate:SECTOR.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  IF EPL:EMP_LEGAJO <> 0 THEN	
  	SEC:SEC_ID = EPL:EMP_SECTOR
  	GET(SECTOR,SEC:PK_SECTOR)
  	IF NOT errorcode()
  		DISPLAY(?SEC:SEC_SECTOR)	
  	END 	
  END


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
    Sectores
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
    OF ?Abrir
       PictureDialogResult# = ImageEx:PictureDialog('Seleccionar Imagen', Loc:FileName, ImageEx:GetFilterString(), FILE:KEEPDIR)
      if PictureDialogResult#
          if TheBitmap.LoadFromFile(Loc:Filename)
              ImgViewer.Bitmap.Assign(TheBitmap)
          end
      end
      !Calculo porcentaje a a utilizar en reducción de foto
      TheBitmap.GetSize(OrigWidth, OrigHeight)
      Loc:porcentaje = 465/OrigWidth
      !Recortar y vizualizar
      ImgViewer.Bitmap.SetSize(OrigWidth*Loc:porcentaje, OrigHeight*Loc:porcentaje)
      ImgViewer.Bitmap.Draw(0, 0, OrigWidth*Loc:porcentaje, OrigHeight*Loc:porcentaje, TheBitmap, 0, 0, OrigWidth, OrigHeight)
      ImgViewer.ZoomToFit()
      !Guardar en variable de tabla como BLOB
      ImgViewer.Bitmap.SaveToBlob(EPL:EMP_FOTO,JpgSaver)
    OF ?Guardar
      Loc:Filename = EPL:EMP_LEGAJO & '_' & EPL:EMP_NOMBRE
      TheBitmap.LoadFromBlob(EPL:EMP_FOTO)
      SaveImage(TheBitmap, True, Loc:Filename)
    OF ?OK
      EPL:EMP_HORAEXTRA = Loc:HorasExtras
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EPL:EMP_LEGAJO
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update()
      SEC:SEC_ID = SEC:SEC_ID
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SEC:SEC_ID = SEC:SEC_ID
        EPL:EMP_SECTOR = SEC:SEC_ID
      END
      ThisWindow.Reset(1)
    OF ?Ver
      ThisWindow.Update()
      TheBitmap.LoadFromBlob(EPL:EMP_FOTO)
      wndViewImage(TheBitmap, 'Foto')
    OF ?Bright
      ThisWindow.Update()
      IF ?Viewer{PROP:Disable} = FALSE THEN
          TheBitmap.LoadFromBlob(EPL:EMP_FOTO)
          wndBrightness(TheBitmap, ImgViewer.Bitmap, 0, 0, 0)
          TheBitmap.SaveToBlob(EPL:EMP_FOTO, JpgSaver)
          POST(EVENT:Accepted,?Viewer)
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      
      !GlobalResponse = ReturnValue
      !message(GlobalResponse)
    OF ?SEC:SEC_ID
      IF SEC:SEC_ID OR ?SEC:SEC_ID{PROP:Req}
        SEC:SEC_ID = SEC:SEC_ID
        IF Access:SECTOR.TryFetch(SEC:PK_SECTOR)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            SEC:SEC_ID = SEC:SEC_ID
            EPL:EMP_SECTOR = SEC:SEC_ID
          ELSE
            CLEAR(EPL:EMP_SECTOR)
            SELECT(?SEC:SEC_ID)
            CYCLE
          END
        ELSE
          EPL:EMP_SECTOR = SEC:SEC_ID
        END
      END
      ThisWindow.Reset(1)
    OF ?EPL:EMP_SECTOR
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


ImageExTwain7.OnAcquired FUNCTION(ImageExBitmapClass Bmp)
Result               BOOL
   CODE
   Result = Parent.OnAcquired(Bmp)
   Return Result

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
LicenciaPorEmpleado PROCEDURE 

Loc:str              STRING(4000)                          !
Loc:Titulo           STRING(100)                           !
QLicencias           QUEUE,PRE(QLIC)                       !
QLegajo              LONG                                  !
QEmpleado            STRING(30)                            !
QAnio                LONG                                  !
QDias                SHORT                                 !
QDesde               DATE                                  !
QHasta               DATE                                  !
QTomo                SHORT                                 !
QQuedan              SHORT                                 !
QCobro               STRING(1)                             !
QSueldo              STRING(1)                             !
QDViaje              STRING(1)                             !
                     END                                   !
Loc:opcion           BYTE                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Licencias Por Empleado'),AT(,,437,300),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaPorSector'), |
  SYSTEM
                       GROUP,AT(3,4,430,42),USE(?GROUP1),FONT(,,,FONT:bold),BOXED
                         ENTRY(@s31),AT(11,22,142,15),USE(EPL:EMP_NOMBRE),FONT(,,COLOR:Red),UPR,DISABLE,FLAT
                         BUTTON,AT(157,22,15,15),USE(?CallLookup)
                         OPTION,AT(176,11,126,28),USE(Loc:opcion),FONT(,,COLOR:Red,FONT:bold),TRN
                           RADIO(' Por Empleado'),AT(182,19),USE(?OPTION1:RADIO1),FONT(,,,FONT:bold),VALUE('1')
                           RADIO(' Todos'),AT(258,19,33),USE(?LOC:OPCION:RADIO1),VALUE('2')
                         END
                         BUTTON('Procesar'),AT(308,12,58,28),USE(?BUTTON1),FONT(,,,FONT:regular),LEFT,ICON('down.ico'), |
  FLAT,LAYOUT(0)
                         STRING('Empleado'),AT(11,12),USE(?STRING1),FONT(,,COLOR:Red,FONT:bold)
                         BUTTON('E&xportar'),AT(375,12,52,28),USE(?EvoExportar),FONT(,,,FONT:regular),LEFT,ICON('export.ico'), |
  CURSOR('mano.cur'),FLAT
                         ENTRY(@n-7),AT(142,5,60,10),USE(EPL:EMP_LEGAJO),RIGHT(1),HIDE
                       END
                       LIST,AT(3,52,428,242),USE(QLicencias),HVSCROLL,FLAT,FORMAT('35C|M~LEGAJO~@n_7@150L(2)|M' & |
  '~EMPLEADO~C(0)@s30@35C|M~LICENCIA~@n04@30C|M~DIAS~@n_7@45C|M~DESDE~@d17@45C|M~HASTA~' & |
  '@d17@35C|M~TOMO~C(1)@n_7@0C(2)|M~QUEDAN~C(1)@n_7@0C(2)|M~A LICEN~C(0)@s1@0C(2)|M~A S' & |
  'UELDO~C(0)@s1@35C(2)|M~DIAS VIAJE~C(0)@s1@'),FROM(QLicencias)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
Loc::QHlist1 QUEUE,PRE(QHL1)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar1 QUEUE,PRE(Q1)
FieldPar                 CSTRING(800)
                         END
QPar21 QUEUE,PRE(Qp21)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado1          STRING(100)
Loc::Titulo1          STRING(100)
SavPath1          STRING(2000)
Evo::Group1  GROUP,PRE()
Evo::Procedure1          STRING(100)
Evo::App1          STRING(100)
Evo::NroPage          LONG
   END

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
PrintExQueue1 ROUTINE

 Evo::App1          = 'infoper'
 Evo::Procedure1          = GlobalErrors.GetProcedureName()& 1

 FREE(QPar1)
 Q1:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,'
 ADD(QPar1)  !!1
 Q1:FieldPar  = ';'
 ADD(QPar1)  !!2
 Q1:FieldPar  = 'Spanish'
 ADD(QPar1)  !!3
 Q1:FieldPar  = ''
 ADD(QPar1)  !!4
 Q1:FieldPar  = true
 ADD(QPar1)  !!5
 Q1:FieldPar  = ''
 ADD(QPar1)  !!6
 Q1:FieldPar  = true
 ADD(QPar1)  !!7
!!!! Exportaciones
 Q1:FieldPar  = 'HTML|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'EXCEL|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'WORD|'
 Q1:FieldPar  = CLIP( Q1:FieldPar)&'ASCII|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'XML|'
  Q1:FieldPar  = CLIP( Q1:FieldPar)&'PRT|'
 ADD(QPar1)  !!8
 Q1:FieldPar  = 'All'
 ADD(QPar1)   !.9.
 Q1:FieldPar  = ' 0'
 ADD(QPar1)   !.10
 Q1:FieldPar  = 0
 ADD(QPar1)   !.11
 Q1:FieldPar  = '1'
 ADD(QPar1)   !.12

 Q1:FieldPar  = ''
 ADD(QPar1)   !.13

 Q1:FieldPar  = ''
 ADD(QPar1)   !.14

 Q1:FieldPar  = ''
 ADD(QPar1)   !.15

  Q1:FieldPar  = '16'
 ADD(QPar1)   !.16

  Q1:FieldPar  = 1
 ADD(QPar1)   !.17
  Q1:FieldPar  = 2
 ADD(QPar1)   !.18
  Q1:FieldPar  = '2'
 ADD(QPar1)   !.19
  Q1:FieldPar  = 12
 ADD(QPar1)   !.20

  Q1:FieldPar  = 0 !Exporta excel sin borrar
 ADD(QPar1)   !.21

  Q1:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
 ADD(QPar1)   !.22

  CLEAR(Q1:FieldPar)
 ADD(QPar1)   ! 23 Caracteres Encoding para xml

 Q1:FieldPar  = '0'
 ADD(QPar1)   ! 24 Use Open Office

  Q1:FieldPar  = 'golmedo'
 ADD(QPar1) ! 25

!---------------------------------------------------------------------------------------------
!!Registration 
 Q1:FieldPar  = ''
 ADD(QPar1)   ! 26 
 Q1:FieldPar  = ''
 ADD(QPar1)   ! 27 
 Q1:FieldPar  = '' 
 ADD(QPar1)   ! 28 
 Q1:FieldPar  = 'BEXPORT' 
 ADD(QPar1)   ! 29 infoper022.clw
!!!!!


 FREE(QPar21)
      Qp21:F2N  = 'LEGAJO'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'EMPLEADO'
 Qp21:F2P  = '@s30'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'LICENCIA'
 Qp21:F2P  = '@n04'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'DIAS'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'DESDE'
 Qp21:F2P  = '@d17'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'HASTA'
 Qp21:F2P  = '@d17'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'TOMO'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
 Qp21:F2N  = 'ECNOEXPORT'
 Qp21:F2P  = '@n_7'
 Qp21:F2T  = '0'
 ADD(QPar21)
 Qp21:F2N  = 'ECNOEXPORT'
 Qp21:F2P  = '@s1'
 Qp21:F2T  = '0'
 ADD(QPar21)
 Qp21:F2N  = 'ECNOEXPORT'
 Qp21:F2P  = '@s1'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'D VIAJE'
 Qp21:F2P  = '@s1'
 Qp21:F2T  = '0'
 ADD(QPar21)
 SysRec# = false
 FREE(Loc::QHlist1)
 LOOP
    SysRec# += 1
    IF ?QLicencias{PROPLIST:Exists,SysRec#} = 1
        GET(QPar21,SysRec#)
        QHL1:Id      = SysRec#
        QHL1:Nombre  = Qp21:F2N
        QHL1:Longitud= ?QLicencias{PropList:Width,SysRec#}  /2
        QHL1:Pict    = Qp21:F2P
        QHL1:Tot    = Qp21:F2T
        ADD(Loc::QHlist1)
     Else
       break
    END
 END
 Loc::Titulo1 =Loc:Titulo

 SavPath1 = PATH()

  Exportar(Loc::QHlist1,QLicencias,QPar1,0,Loc::Titulo1,Evo::Group1)
 SETPATH(SavPath1)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LicenciaPorEmpleado')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPL:EMP_NOMBRE
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:opcion = '1'
     ENABLE(?CallLookup)
  END
  IF Loc:opcion = '2'
     SEC:SEC_SECTOR = ''
     DISABLE(?CallLookup)
  END
  SELF.SetAlerts()
  Loc:opcion = 1
  EnterByTabManager.Init(False)
  RETURN ReturnValue


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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
      END
      ThisWindow.Reset(1)
    OF ?Loc:opcion
      IF Loc:opcion = '1'
         ENABLE(?CallLookup)
      END
      IF Loc:opcion = '2'
         SEC:SEC_SECTOR = ''
         DISABLE(?CallLookup)
      END
      ThisWindow.Reset()
    OF ?BUTTON1
      ThisWindow.Update()
      !CONSULTA PARA ARMAR REPORT COLA O BROWSE
      !
      !select sum(lic_dias) as DIASL, isnull(SUM(dlic_toma),0) as TOMO, sum(lic_dias) - isnull(sum(dlic_toma),0) as DIASQ,LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR, SEC_SECTOR as Sector
      !from LICENCIA 
      !inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_CONVENIO <> 3 AND EMP_CONVENIO <> 12 and EMP_ACTIVO = 'S' --AND EMP_SECTOR = 31
      !left outer join DETALLE_LICENCIA on LIC_LEGAJO = DLIC_LEGAJO and lic_anio = DLIC_ANIO AND DLIC_ESTADO <> 'A'
      !LEFT OUTER join SECTOR on SEC_ID = EMP_SECTOR
      !group by LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,EMP_SECTOR,SEC_SECTOR ORDER BY LIC_LEGAJO,LIC_ANIO
      Loc:Titulo = 'LICENCIAS POR EMPLEADO'
      IF Loc:opcion = 1 THEN
      	Loc:str = 'select CONVERT(VARCHAR,DLIC_INICIO,112) AS DESDE,CONVERT(VARCHAR,DLIC_FIN,112) AS HASTA, sum(lic_dias) as DIASL, isnull(SUM(dlic_toma),0) as TOMO, sum(lic_dias) - isnull(sum(dlic_toma),0) as DIASQ, '&|
                    'LIC_LEGAJO,LIC_ANIO,ISNULL(DLIC_ASUELDO,''N''),ISNULL(DLIC_VIAJE,''N''),ISNULL(DLIC_COBRAR,''N''), EMP_NOMBRE '&|
                    'from LICENCIA '&|
                    'inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_ACTIVO = ''S'' AND EMP_LIC_CON_GOCE = ''S'' AND EMP_CONVENIO <> 12 '&|
                    'left outer join DETALLE_LICENCIA on DLIC_ANIO = LIC_ANIO  AND DLIC_ESTADO <> ''A'' and DLIC_LEGAJO = LIC_LEGAJO '&|
                    'WHERE LIC_LEGAJO = ' & EPL:EMP_LEGAJO & ' group by ' &|
                    'LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,DLIC_INICIO,DLIC_FIN,DLIC_ASUELDO,DLIC_VIAJE,DLIC_COBRAR ORDER BY LIC_LEGAJO,LIC_ANIO '
      
      ELSIF Loc:opcion = 2 THEN
      	Loc:str = 'select CONVERT(VARCHAR,DLIC_INICIO,112) AS DESDE,CONVERT(VARCHAR,DLIC_FIN,112) AS HASTA, sum(lic_dias) as DIASL, isnull(SUM(dlic_toma),0) as TOMO, sum(lic_dias) - isnull(sum(dlic_toma),0) as DIASQ, '&|
                    'LIC_LEGAJO,LIC_ANIO,ISNULL(DLIC_ASUELDO,''N''),ISNULL(DLIC_VIAJE,''N''),ISNULL(DLIC_COBRAR,''N''), EMP_NOMBRE '&|
                    'from LICENCIA '&|
                    'inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_ACTIVO = ''S'' AND EMP_LIC_CON_GOCE = ''S'' AND EMP_CONVENIO <> 12 '&|
                    'left outer join DETALLE_LICENCIA on DLIC_ANIO = LIC_ANIO  AND DLIC_ESTADO <> ''A'' and DLIC_LEGAJO = LIC_LEGAJO '&|
                    'GROUP BY LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,DLIC_INICIO,DLIC_FIN,DLIC_ASUELDO,DLIC_VIAJE,DLIC_COBRAR ORDER BY LIC_LEGAJO,LIC_ANIO '
      END
      setclipboard(Loc:str)
      
      TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
      if errorcode() then	stop(FileErrorCode()).
      FREE(QLicencias)	
      Loop
      	next(TMPUsosMultiples)
      	if errorcode() then break.
      		QLIC:QLegajo = TUM:Col06
      		QLIC:QEmpleado = TUM:Col11
      		QLIC:QAnio = TUM:Col07
      		QLIC:QDias = TUM:Col03
      		QLIC:QDesde = DEFormat(TUM:Col01,@d012)
      		QLIC:QHasta = DEFormat(TUM:Col02,@d012)
      		QLIC:QTomo = TUM:Col04
      		QLIC:QQuedan = TUM:Col05
      		QLIC:QCobro = TUM:Col10
      		QLIC:QSueldo = TUM:Col08
      		QLIC:QDViaje = TUM:Col09
      	ADD(QLicencias)
      end !Loop
      	
      !!CONSULTA EN EL SQL REFORMAR PARA CALCULAR DIAS QUE QUEDAN
      !select CONVERT(VARCHAR,DLA.DLIC_INICIO,112) AS DESDE,CONVERT(VARCHAR,DLA.DLIC_FIN,112) AS HASTA, sum(lic_dias) as DIASL, 
      !isnull(SUM(DLA.dlic_toma),0) as TOMO, sum(lic_dias) - isnull((SELECT sum(DLS.dlic_toma) FROM DETALLE_LICENCIA DLS WHERE DLS.DLIC_ANIO = DLA.DLIC_ANIO AND DLS.DLIC_LEGAJO =DLA.DLIC_LEGAJO AND DLS.DLIC_FIN <=DLA.DLIC_FIN GROUP BY DLS.DLIC_ANIO,DLS.DLIC_LEGAJO,DLS.DLIC_TOMA),0) as DIASQ, 
      !LIC_LEGAJO,LIC_ANIO,ISNULL(DLA.DLIC_ASUELDO,'N'),ISNULL(DLA.DLIC_VIAJE,'N'),ISNULL(DLA.DLIC_COBRAR,'N'), 
      !EMP_NOMBRE from LICENCIA 
      !inner join EMPLEADOS on LIC_LEGAJO = EMP_LEGAJO and EMP_ACTIVO = 'S' AND EMP_LIC_CON_GOCE = 'S' AND EMP_CONVENIO <> 12 
      !left outer join DETALLE_LICENCIA DLA on DLA.DLIC_ANIO = LIC_ANIO  AND DLA.DLIC_ESTADO <> 'A' and DLA.DLIC_LEGAJO = LIC_LEGAJO 
      !GROUP BY LIC_LEGAJO,LIC_ANIO,LIC_COBRO,EMP_NOMBRE,DLA.DLIC_INICIO,DLA.DLIC_FIN,DLA.DLIC_ASUELDO,DLA.DLIC_VIAJE,DLA.DLIC_COBRAR 
      !ORDER BY LIC_LEGAJO,LIC_ANIO
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExQueue1
    OF ?EPL:EMP_LEGAJO
      IF EPL:EMP_LEGAJO OR ?EPL:EMP_LEGAJO{PROP:Req}
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        IF Access:EMPLEADOS.TryFetch(EPL:PK_EMPLEADOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
          ELSE
            SELECT(?EPL:EMP_LEGAJO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
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
!!! Browse the FERIADOS file
!!! </summary>
Feriados PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:feriado          STRING(20)                            !
BRW1::View:Browse    VIEW(FERIADOS)
                       PROJECT(FER:DIAFERIADO_DATE)
                       PROJECT(FER:DIAFERIADO_TIME)
                       PROJECT(FER:DIAFERIADO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FER:DIAFERIADO_DATE    LIKE(FER:DIAFERIADO_DATE)      !List box control field - type derived from field
FER:DIAFERIADO_TIME    LIKE(FER:DIAFERIADO_TIME)      !List box control field - type derived from field
FER:DIAFERIADO         LIKE(FER:DIAFERIADO)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Feriados'),AT(,,126,283),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('Feriados'),SYSTEM
                       LIST,AT(8,30,108,218),USE(?Browse:1),FONT(,10),VSCROLL,FLAT,FORMAT('60C(2)|M~FECHA~C(0)' & |
  '@d17@0R(2)|M~DIAFERIADO TIME~C(0)@t7@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the F' & |
  'ERIADOS file')
                       BUTTON,AT(20,258,20,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON,AT(50,258,20,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON,AT(82,258,20,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,118,278),USE(?CurrentTab)
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
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('Feriados')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:FERIADOS.Open                                     ! File FERIADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FERIADOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FER:PK_FERIADOS)                      ! Add the sort order for FER:PK_FERIADOS for sort order 1
  BRW1.AddField(FER:DIAFERIADO_DATE,BRW1.Q.FER:DIAFERIADO_DATE) ! Field FER:DIAFERIADO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(FER:DIAFERIADO_TIME,BRW1.Q.FER:DIAFERIADO_TIME) ! Field FER:DIAFERIADO_TIME is a hot field or requires assignment from browse
  BRW1.AddField(FER:DIAFERIADO,BRW1.Q.FER:DIAFERIADO)      ! Field FER:DIAFERIADO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateFERIADOS
  SELF.SetAlerts()
  POST(EVENT:ScrollBottom,?Browse:1)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FERIADOS.Close
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
    UpdateFERIADOS
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  FER:DIAFERIADO_TIME = 0
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Process
!!! Process the HORASEXTRASCVS File
!!! </summary>
administradoHorasExtras PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(HORASEXTRASCVS)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Process HORASEXTRASCVS'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
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

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  ImportHE= 'C:\PERSONAL\ASIETOS\HorasExtras.csv'
  GlobalErrors.SetProcedureName('administradoHorasExtras')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:HORASEXTRASCVS.Open                               ! File HORASEXTRASCVS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:HORASEXTRASCVS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(HORASEXTRASCVS,'QUICKSCAN=on')
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
    Relate:HORASEXTRASCVS.Close
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  message(IHE:ï___Fecha)
  message(IHE:Legajo)
  message(IHE:Inicio)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Form FERIADOS
!!! </summary>
UpdateFERIADOS PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::FER:Record  LIKE(FER:RECORD),THREAD
QuickWindow          WINDOW('Feriados'),AT(,,155,70),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('UpdateFERIADOS'),SYSTEM
                       SHEET,AT(4,4,144,44),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           PROMPT('Fecha:'),AT(16,27),USE(?FER:DIAFERIADO_DATE:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@d17),AT(52,26,55,14),USE(FER:DIAFERIADO_DATE),FONT(,10,,FONT:bold),CENTER,FLAT
                           BUTTON,AT(114,25,14,14),USE(?Calendar)
                         END
                       END
                       BUTTON('&Aceptar'),AT(29,52,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(82,52,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
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
Calendar7            CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateFERIADOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FER:DIAFERIADO_DATE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(FER:Record,History::FER:Record)
  SELF.AddHistoryField(?FER:DIAFERIADO_DATE,3)
  SELF.AddUpdateFile(Access:FERIADOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FERIADOS.Open                                     ! File FERIADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:FERIADOS
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
    ?FER:DIAFERIADO_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar)
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
    Relate:FERIADOS.Close
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
    OF ?Calendar
      ThisWindow.Update()
      Calendar7.SelectOnClose = True
      Calendar7.Ask('Seleccione Día',FER:DIAFERIADO_DATE)
      IF Calendar7.Response = RequestCompleted THEN
      FER:DIAFERIADO_DATE=Calendar7.SelectedDate
      DISPLAY(?FER:DIAFERIADO_DATE)
      END
      ThisWindow.Reset(True)
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
!!! Browse the CTA_CONTABLE file
!!! </summary>
CuentasContables PROCEDURE 

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
QuickWindow          WINDOW('Cuentas Contables de Licencias'),AT(,,237,224),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('CuentasContables'), |
  SYSTEM
                       LIST,AT(10,27,216,186),USE(?Browse:1),FONT(,10),VSCROLL,FLAT,FORMAT('30R(3)|M~Unibiz~C(' & |
  '0)@n_14@50R(3)|M~Cuenta~C(0)@n_14@100L(3)|M~Denominación~C(2)@s40@0L(2)|M~Imputaciòn~@s1@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the CTA_CONTABLE file')
                       SHEET,AT(4,4,228,218),USE(?CurrentTab)
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
  GlobalErrors.SetProcedureName('CuentasContables')
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
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CTA:PK_CTA_CONTABLE)                  ! Add the sort order for CTA:PK_CTA_CONTABLE for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CTA:CTA_ID_UNIBIZ,,BRW1)       ! Initialize the browse locator using  using key: CTA:PK_CTA_CONTABLE , CTA:CTA_ID_UNIBIZ
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

