

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER029.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER030.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Mant_Debitos_browse PROCEDURE 

CurrentTab           STRING(80)                            !
imp_total            PDECIMAL(11,2)                        !
LOC:SERVICIO         STRING(50)                            !
BRW1::View:Browse    VIEW(Empleado_Comprobante)
                       PROJECT(Ecp:anio)
                       PROJECT(Ecp:periodo)
                       PROJECT(Ecp:codempresa)
                       PROJECT(Ecp:Legajo)
                       PROJECT(Ecp:Empleado)
                       PROJECT(Ecp:Cliente)
                       PROJECT(Ecp:Suministro)
                       PROJECT(Ecp:Numero)
                       PROJECT(Ecp:Importe)
                       PROJECT(Ecp:Tipo)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ecp:anio               LIKE(Ecp:anio)                 !List box control field - type derived from field
Ecp:periodo            LIKE(Ecp:periodo)              !List box control field - type derived from field
Ecp:codempresa         LIKE(Ecp:codempresa)           !List box control field - type derived from field
Ecp:Legajo             LIKE(Ecp:Legajo)               !List box control field - type derived from field
Ecp:Empleado           LIKE(Ecp:Empleado)             !List box control field - type derived from field
Ecp:Cliente            LIKE(Ecp:Cliente)              !List box control field - type derived from field
Ecp:Suministro         LIKE(Ecp:Suministro)           !List box control field - type derived from field
Ecp:Numero             LIKE(Ecp:Numero)               !List box control field - type derived from field
Ecp:Importe            LIKE(Ecp:Importe)              !List box control field - type derived from field
Ecp:Tipo               LIKE(Ecp:Tipo)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW(' Mantenimiento Lista de Debitos'),AT(,,358,209),FONT('Microsoft Sans Serif',12,COLOR:Navy, |
  FONT:regular),RESIZE,CENTER,GRAY,IMM,MDI,HLP('Mant_Debitos_browse'),SYSTEM
                       LIST,AT(8,30,342,150),USE(?Browse:1),VSCROLL,COLOR(00E0E0E0h),FORMAT('25C(2)|M~anio~C(0' & |
  ')@n04@15C(2)|M~per~C(0)@n02@20C(2)|M~emp~C(0)@n1@30R(2)|M~Legajo~C(0)@n_6@100L(2)|M~' & |
  'Empleado~@s31@30R(4)|M~Cliente~C(0)@n_6@30R(2)|M~Sum~C(0)@n_6@45L(3)|M~NºComprob~L(2' & |
  ')@s10@58D(15)|M~Importe~C(2)@n_11_.2@'),FROM(Queue:Browse:1),IMM
                       BUTTON('&Visualizar'),AT(10,184,60,14),USE(?View:2),LEFT,ICON('ZOOM.ICO'),FLAT
                       BUTTON('&Agregar'),AT(74,184,60,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT
                       BUTTON('&Modificar'),AT(138,184,60,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT
                       BUTTON('&Borrar'),AT(202,184,60,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT
                       SHEET,AT(4,4,350,200),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           STRING(@n-_11_.2),AT(292,188,49),USE(imp_total),FONT(,12,,FONT:bold,CHARSET:ANSI)
                         END
                       END
                       STRING(@s50),AT(38,5,190,6),USE(LOC:SERVICIO),FONT('Arial',12,COLOR:Teal,FONT:bold,CHARSET:ANSI), |
  CENTER
                       BUTTON('&Cerrar'),AT(304,4,42,10),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT
                       BUTTON('E&xportar'),AT(243,4,52,10),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                     END

Loc::QHlist6 QUEUE,PRE(QHL6)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar6 QUEUE,PRE(Q6)
FieldPar                 CSTRING(800)
                         END
QPar26 QUEUE,PRE(Qp26)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado6          STRING(100)
Loc::Titulo6          STRING(100)
SavPath6          STRING(2000)
Evo::Group6  GROUP,PRE()
Evo::Procedure6          STRING(100)
Evo::App6          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ApplyRange             PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_6  SHORT
Gol_woI_6 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_6),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_6),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_6),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_6),TRN
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
PrintExBrowse6 ROUTINE

 OPEN(Gol_woI_6)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_6 = BRW1.FileLoaded
 IF Not  EC::LoadI_6
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_6)
 SETCURSOR()
  Evo::App6          = 'infoper'
  Evo::Procedure6          = GlobalErrors.GetProcedureName()& 6
 
  FREE(QPar6)
  Q6:FieldPar  = '1,2,3,4,5,6,7,8,9,'
  ADD(QPar6)  !!1
  Q6:FieldPar  = ';'
  ADD(QPar6)  !!2
  Q6:FieldPar  = 'Spanish'
  ADD(QPar6)  !!3
  Q6:FieldPar  = ''
  ADD(QPar6)  !!4
  Q6:FieldPar  = true
  ADD(QPar6)  !!5
  Q6:FieldPar  = ''
  ADD(QPar6)  !!6
  Q6:FieldPar  = true
  ADD(QPar6)  !!7
 !!!! Exportaciones
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'EXCEL|'
  Q6:FieldPar  = CLIP( Q6:FieldPar)&'ASCII|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'PRT|'
  ADD(QPar6)  !!8
  Q6:FieldPar  = 'All'
  ADD(QPar6)   !.9.
  Q6:FieldPar  = ' 0'
  ADD(QPar6)   !.10
  Q6:FieldPar  = 0
  ADD(QPar6)   !.11
  Q6:FieldPar  = '1'
  ADD(QPar6)   !.12
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.13
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.14
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.15
 
   Q6:FieldPar  = '16'
  ADD(QPar6)   !.16
 
   Q6:FieldPar  = 1
  ADD(QPar6)   !.17
   Q6:FieldPar  = 2
  ADD(QPar6)   !.18
   Q6:FieldPar  = '2'
  ADD(QPar6)   !.19
   Q6:FieldPar  = 12
  ADD(QPar6)   !.20
 
   Q6:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar6)   !.21
 
   Q6:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar6)   !.22
 
   CLEAR(Q6:FieldPar)
  ADD(QPar6)   ! 23 Caracteres Encoding para xml
 
  Q6:FieldPar  = '0'
  ADD(QPar6)   ! 24 Use Open Office
 
   Q6:FieldPar  = 'golmedo'
  ADD(QPar6) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q6:FieldPar  = ''
  ADD(QPar6)   ! 26 
  Q6:FieldPar  = ''
  ADD(QPar6)   ! 27 
  Q6:FieldPar  = '' 
  ADD(QPar6)   ! 28 
  Q6:FieldPar  = 'BEXPORT' 
  ADD(QPar6)   ! 29 infoper029.clw
 !!!!!
 
 
  FREE(QPar26)
       Qp26:F2N  = 'anio'
  Qp26:F2P  = '@n04'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'per'
  Qp26:F2P  = '@n02'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'emp'
  Qp26:F2P  = '@n1'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'Legajo'
  Qp26:F2P  = '@n_6'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'Empleado'
  Qp26:F2P  = '@s31'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'Cliente'
  Qp26:F2P  = '@n_6'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'Sum'
  Qp26:F2P  = '@n_6'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'NºComprob'
  Qp26:F2P  = '@s10'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'Importe'
  Qp26:F2P  = '@n_11.2'
  Qp26:F2T  = '0'
  ADD(QPar26)
  SysRec# = false
  FREE(Loc::QHlist6)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar26,SysRec#)
         QHL6:Id      = SysRec#
         QHL6:Nombre  = Qp26:F2N
         QHL6:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL6:Pict    = Qp26:F2P
         QHL6:Tot    = Qp26:F2T
         ADD(Loc::QHlist6)
      Else
        break
     END
  END
  Loc::Titulo6 =LOC:SERVICIO
 
 SavPath6 = PATH()
  Exportar(Loc::QHlist6,BRW1.Q,QPar6,0,Loc::Titulo6,Evo::Group6)
 IF Not EC::LoadI_6 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath6)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Mant_Debitos_browse')
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
  Relate:Empleado_Comprobante.Open                         ! File Empleado_Comprobante used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Empleado_Comprobante,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,Ecp:PK_Empleado_Comprobante)          ! Add the sort order for Ecp:PK_Empleado_Comprobante for sort order 1
  BRW1.AddRange(Ecp:codempresa,glo:empresa)                ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Ecp:Legajo,,BRW1)              ! Initialize the browse locator using  using key: Ecp:PK_Empleado_Comprobante , Ecp:Legajo
  BRW1.AddField(Ecp:anio,BRW1.Q.Ecp:anio)                  ! Field Ecp:anio is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:periodo,BRW1.Q.Ecp:periodo)            ! Field Ecp:periodo is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:codempresa,BRW1.Q.Ecp:codempresa)      ! Field Ecp:codempresa is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Legajo,BRW1.Q.Ecp:Legajo)              ! Field Ecp:Legajo is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Empleado,BRW1.Q.Ecp:Empleado)          ! Field Ecp:Empleado is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Cliente,BRW1.Q.Ecp:Cliente)            ! Field Ecp:Cliente is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Suministro,BRW1.Q.Ecp:Suministro)      ! Field Ecp:Suministro is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Numero,BRW1.Q.Ecp:Numero)              ! Field Ecp:Numero is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Importe,BRW1.Q.Ecp:Importe)            ! Field Ecp:Importe is a hot field or requires assignment from browse
  BRW1.AddField(Ecp:Tipo,BRW1.Q.Ecp:Tipo)                  ! Field Ecp:Tipo is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1                                    ! Will call: Update_Emp_comprobante
  SELF.SetAlerts()
  
  execute glo:empresa 
  	LOC:SERVICIO = 'SERVICIO ELECTRICO'
  	LOC:SERVICIO = 'TELEFONIA-INTERNET'
  	LOC:SERVICIO = 'TELEVISION'
  ELSE
  	LOC:SERVICIO = ALL ('*')
  END	
  
  LOC:SERVICIO = CLIP(LOC:SERVICIO) & '  Período: ' & FORMAT(glo:periodo,@n02) & '/' & FORMAT(glo:Ano,@n04)
  	
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Empleado_Comprobante.Close
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
    Update_Emp_comprobante
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse6
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


BRW1.ApplyRange PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
         GET(SELF.Order.RangeList.List,1)
         SELF.Order.RangeList.List.Right = glo:Ano ! Ecp:anio
         GET(SELF.Order.RangeList.List,2)
         SELF.Order.RangeList.List.Right = glo:periodo ! Ecp:periodo
  ReturnValue = PARENT.ApplyRange()
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetFromView PROCEDURE

imp_total:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:Empleado_Comprobante.SetQuickScan(1)
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
    imp_total:Sum += Ecp:Importe
  END
  SELF.View{PROP:IPRequestCount} = 0
  imp_total = imp_total:Sum
  PARENT.ResetFromView
  Relate:Empleado_Comprobante.SetQuickScan(0)
  SETCURSOR()


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

