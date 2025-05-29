

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER017.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Update_Emp_comprobante PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
loc:datocomp         STRING(50)                            !
loc:valida1          BYTE                                  !
loc:valida2          BYTE                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::Ecp:Record  LIKE(Ecp:RECORD),THREAD
QuickWindow          WINDOW('Form Empleado_Comprobante'),AT(,,253,180),FONT('Microsoft Sans Serif',12,COLOR:Navy, |
  FONT:regular),RESIZE,CENTER,GRAY,IMM,MDI,HLP('Update_Emp_comprobante'),SYSTEM
                       SHEET,AT(4,4,244,154),USE(?CurrentTab)
                         TAB(' '),USE(?Tab:1)
                           OPTION,AT(91,23,144,21),USE(Ecp:codempresa),BOXED,READONLY,SKIP,TRN
                             RADIO(' ELEC'),AT(108,30,32,10),USE(?Ecp:codempresa:Radio1),SKIP,TRN,VALUE('1')
                             RADIO(' TEL'),AT(148,30,30,10),USE(?Ecp:codempresa:Radio2),SKIP,TRN,VALUE('2')
                             RADIO(' TV'),AT(186,30,30,10),USE(?Ecp:codempresa:Radio3),SKIP,TRN,VALUE('3')
                           END
                           STRING(@n02),AT(48,29),USE(glo:periodo),FONT(,12,,FONT:bold,CHARSET:ANSI),CENTER
                           STRING('Período:'),AT(20,28),USE(?String3)
                           STRING(@n04),AT(62,29),USE(glo:Ano),FONT(,12,,FONT:bold,CHARSET:ANSI),CENTER
                           PROMPT('Legajo:'),AT(47,53),USE(?Ecp:Legajo:Prompt),TRN
                           ENTRY(@n_6b),AT(75,53,29,10),USE(Ecp:Legajo),RIGHT(1)
                           BUTTON('...'),AT(107,52,12,11),USE(?Button3)
                           PROMPT('Empleado:'),AT(36,71),USE(?Ecp:Empleado:Prompt),TRN
                           ENTRY(@s31),AT(75,71,160,10),USE(Ecp:Empleado)
                           PROMPT('Cliente - Suministro:'),AT(12,87),USE(?Ecp:Cliente:Prompt),TRN
                           ENTRY(@n_6),AT(75,87,36,10),USE(Ecp:Cliente),RIGHT(1)
                           ENTRY(@n_6),AT(119,87,36,10),USE(Ecp:Suministro),RIGHT(1)
                           BUTTON,AT(156,87,13,11),USE(?OK_CLI),ICON('C:\Clarion6\ICONS\CHECK1.ICO'),FLAT,HIDE
                           BUTTON('Verificar'),AT(172,87,30,10),USE(?Button4),FONT(,8,,,CHARSET:ANSI)
                           STRING(@s25),AT(72,102,81,9),USE(CLI:CLI_TITULAR),FONT(,10,COLOR:Purple,,CHARSET:ANSI)
                           STRING(@s10),AT(153,102,39,9),USE(SUM:SUM_CALLE),FONT(,10,COLOR:Purple,,CHARSET:ANSI)
                           STRING(@n_4B),AT(193,102,19,9),USE(SUM:SUM_ALTURA),FONT(,10,COLOR:Purple,,CHARSET:ANSI),LEFT
                           PROMPT('Tipo-NºComp:'),AT(27,119),USE(?Ecp:Tipo:Prompt),TRN
                           ENTRY(@n2b),AT(75,119,16,10),USE(Ecp:Tipo),RIGHT(1),SKIP
                           ENTRY(@s20),AT(97,119,55,10),USE(Ecp:Numero),UPR
                           BUTTON,AT(156,117,13,12),USE(?OK_CPTE),ICON('C:\Clarion6\ICONS\CHECK1.ICO'),FLAT,HIDE
                           BUTTON('Verificar'),AT(172,119,30,10),USE(?Button4:2),FONT(,8,,,CHARSET:ANSI)
                           PROMPT('Importe:'),AT(44,137),USE(?Ecp:Importe:Prompt),TRN
                           ENTRY(@n_11_.2),AT(75,137,51,10),USE(Ecp:Importe),RIGHT
                           STRING(@s15),AT(174,138,39,8),USE(loc:datocomp),FONT(,10,COLOR:Maroon,,CHARSET:ANSI)
                           STRING(@d17b),AT(135,138),USE(Ecp:fechavto_date),FONT(,10,COLOR:Maroon,,CHARSET:ANSI)
                           CHECK('  Mensualizado'),AT(156,55,70,8),USE(Ecp:Condicion),VALUE('S','N')
                         END
                       END
                       BUTTON('&Aceptar'),AT(56,162,70,14),USE(?OK),FONT(,12,,FONT:bold,CHARSET:ANSI),LEFT,ICON('WAOK.ICO'), |
  DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(129,162,67,14),USE(?Cancel),FONT(,12,,FONT:bold,CHARSET:ANSI),LEFT, |
  ICON('WACANCEL.ICO'),FLAT
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
PrimeFields            PROCEDURE(),PROC,DERIVED
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
verificar_suministro ROUTINE
! if glo:empresa = 1 then
    loc:valida1=0
    SUM:SUM_EMPRESA=1
    SUM:SUM_CLIENTE=Ecp:Cliente
    SUM:SUM_ID=Ecp:Suministro
    GET(SUMINISTRO,SUM:PK_SUMINISTRO)
    IF ERRORCODE() THEN
       MESSAGE('SUMINISTRO NO EXISTE')
       ERASE(?Ecp:Cliente)
       ERASE(?Ecp:Suministro)
       HIDE(?OK_CLI)
    ELSE
       UNHIDE(?OK_CLI)
       CLI:CLI_EMPRESA=1
       CLI:CLI_ID=SUM:SUM_CLIENTE
       GET(CLIENTE,CLI:PK_CLIENTE)
       DISPLAY(?CLI:CLI_TITULAR)
       loc:valida1=1
    END
! end


! if glo:empresa = 2 then
!    loc:valida1=0
!    clf:cuenta=Ecp:Cliente
!    clf:cliente=Ecp:Suministro
!    clf:servicio=0
!    SET(clf:PK_clientes,clf:PK_clientes)
!    NEXT(CLIENTES)
!    IF ERRORCODE() OR NOT (clf:cuenta=Ecp:Cliente AND clf:cliente=Ecp:Suministro) THEN
!       MESSAGE('SUMINISTRO NO EXISTE')
!       ERASE(?Ecp:Cliente)
!       ERASE(?Ecp:Suministro)
!       HIDE(?OK_CLI)
!    ELSE
!       UNHIDE(?OK_CLI)
!       CLI:CLI_TITULAR=clf:razonsocial
!       DISPLAY(?CLI:CLI_TITULAR)
!       SUM:SUM_CALLE=clf:domicilio
!       SUM:SUM_ALTURA=clf:numero
!       DISPLAY(?SUM:SUM_CALLE,?SUM:SUM_ALTURA)
!       loc:valida1=1
!    END
! end

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Ver Registro'
  OF InsertRecord
    ActionMessage = 'Agregar Item Planilla'
  OF ChangeRecord
    ActionMessage = 'Modificar Item Planilla'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('Update_Emp_comprobante')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ecp:codempresa:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Ecp:Record,History::Ecp:Record)
  SELF.AddHistoryField(?Ecp:codempresa,3)
  SELF.AddHistoryField(?Ecp:Legajo,4)
  SELF.AddHistoryField(?Ecp:Empleado,5)
  SELF.AddHistoryField(?Ecp:Cliente,6)
  SELF.AddHistoryField(?Ecp:Suministro,7)
  SELF.AddHistoryField(?Ecp:Tipo,8)
  SELF.AddHistoryField(?Ecp:Numero,9)
  SELF.AddHistoryField(?Ecp:Importe,10)
  SELF.AddHistoryField(?Ecp:fechavto_date,14)
  SELF.AddHistoryField(?Ecp:Condicion,11)
  SELF.AddUpdateFile(Access:Empleado_Comprobante)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CLIENTE.Open                                      ! File CLIENTE used by this procedure, so make sure it's RelationManager is open
  Relate:COMPROBANTE.Open                                  ! File COMPROBANTE used by this procedure, so make sure it's RelationManager is open
  Relate:DEBITO_EMPLEADOS.Open                             ! File DEBITO_EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:Empleado_Comprobante.Open                         ! File Empleado_Comprobante used by this procedure, so make sure it's RelationManager is open
  Relate:SUMINISTRO.Open                                   ! File SUMINISTRO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Empleado_Comprobante
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
    ?Ecp:Legajo{PROP:ReadOnly} = True
    DISABLE(?Button3)
    ?Ecp:Empleado{PROP:ReadOnly} = True
    ?Ecp:Cliente{PROP:ReadOnly} = True
    ?Ecp:Suministro{PROP:ReadOnly} = True
    DISABLE(?OK_CLI)
    DISABLE(?Button4)
    ?Ecp:Tipo{PROP:ReadOnly} = True
    ?Ecp:Numero{PROP:ReadOnly} = True
    DISABLE(?OK_CPTE)
    DISABLE(?Button4:2)
    ?Ecp:Importe{PROP:ReadOnly} = True
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
    Relate:CLIENTE.Close
    Relate:COMPROBANTE.Close
    Relate:DEBITO_EMPLEADOS.Close
    Relate:EMPLEADOS.Close
    Relate:Empleado_Comprobante.Close
    Relate:SUMINISTRO.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  Ecp:anio = glo:ano
  Ecp:periodo = glo:periodo
  Ecp:codempresa = glo:empresa
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
    BrowseEMPLEADOS
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
       if not (loc:valida1 and loc:valida2) then
          message(' No se verificaron datos obligatorios ', ' Mensaje al operador')
          cycle
       end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Ecp:Legajo
      IF not QuickWindow{Prop:AcceptAll} THEN
          DEB:DEB_LEGAJO=ECP:LEGAJO
          GET(DEBITO_EMPLEADOS,DEB:pk_Legajo)
          if not errorcode()
              CHANGE(?Ecp:Cliente,DEB:DEB_CLIENTE)
              CHANGE(?Ecp:Suministro,DEB:DEB_SUMINISTRO)
              DO vERIFICAR_SUMINISTRO
          end    
      END
      IF Ecp:Legajo OR ?Ecp:Legajo{PROP:Req}
        EPL:EMP_LEGAJO = Ecp:Legajo
        IF Access:EMPLEADOS.TryFetch(EPL:PK_EMPLEADOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            Ecp:Legajo = EPL:EMP_LEGAJO
            Ecp:Empleado = EPL:EMP_NOMBRE
          ELSE
            CLEAR(Ecp:Empleado)
            SELECT(?Ecp:Legajo)
            CYCLE
          END
        ELSE
          Ecp:Empleado = EPL:EMP_NOMBRE
        END
      END
      ThisWindow.Reset(1)
    OF ?Button3
      ThisWindow.Update()
      clear(Ecp:Legajo,1)
      post(event:accepted,?Ecp:Legajo)
    OF ?Button4
      ThisWindow.Update()
      DO verificar_suministro
    OF ?Button4:2
      ThisWindow.Update()
      !if glo:empresa = 1 then
          loc:valida2=0
          if ecp:tipo = 0 then
          change(?Ecp:Tipo,14)
          end
          HIDE(?OK_CPTE)
          CHANGE(?Ecp:Importe,0)
          CDE:CDE_EMPRESA=1
          CDE:CDE_TIPO=Ecp:Tipo
          CDE:CDE_NUMERO=Ecp:Numero
          GET(COMPROBANTE,CDE:PK_COMPROBANTE_DEBITO)
          IF NOT ERRORCODE() THEN
             IF Ecp:Cliente = CDE:CDE_CLIENTE AND Ecp:Suministro = CDE:CDE_SUMINISTRO THEN
                CHANGE(?Ecp:Importe,(CDE:CDE_IMPORTE - CDE:CDE_CANCELADO))
                CHANGE(?LOC:DATOCOMP,' Per: ' & FORMAT(CDE:CDE_PERIODO,@N02) & '-' & FORMAT(CDE:CDE_ANO,@N04) )
                CHANGE(?Ecp:fechavto_date,CDE:CDE_FECHA_1VTO_DATE)
                UNHIDE(?OK_CPTE)
                loc:valida2=1
             END
          END
      !end
      
      if glo:empresa = 1 and not inrange(Ecp:tipo,12,15) then LOC:valida2=0; change(?ecp:importe,0); hide(?ok_cpte); message('--no es cpte.del servicio--'). 
      if glo:empresa = 2 and not inrange(Ecp:tipo,61,62) then LOC:valida2=0; change(?ecp:importe,0); hide(?ok_cpte); message('--no es cpte.del servicio--'). 
      if glo:empresa = 3 and not inrange(Ecp:tipo,81,82) then LOC:valida2=0; change(?ecp:importe,0); hide(?ok_cpte); message('--no es cpte.del servicio--'). 
      
      !if glo:empresa = 2 then
      !    loc:valida2=0
      !    if ecp:tipo = 0 then
      !    change(?Ecp:Tipo,1)
      !    end
      !
      !    HIDE(?OK_CPTE)
      !    CHANGE(?Ecp:Importe,0)
      !
      !    ccf:idc=Ecp:Numero
      !    GET(Ctacte,ccf:PK_ctacte)
      !    IF NOT ERRORCODE() THEN
      !       IF Ecp:Cliente = ccf:cuenta AND Ecp:Suministro = ccf:cliente THEN
      !          CHANGE(?Ecp:Importe,(ccf:importe - ccf:pago))
      !          CHANGE(?LOC:DATOCOMP,' Per: ' & CLIP(ccf:periodo))
      !          CHANGE(?Ecp:fechavto_date,ccf:fechavto_DATE)
      !          UNHIDE(?OK_CPTE)
      !          loc:valida2=1
      !       END
      !    END
      !end
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
!!! Form CONCEPTO_MEDICO
!!! </summary>
FormConceptoMedico PROCEDURE 

Loc:empleado         STRING(50)                            !
loc:certificado      &BLOB                                 !
Loc:Fileheader       STRING(30)                            !
Loc:Filename         STRING(255)                           !
loc:DAU_ID           LONG                                  !
ActionMessage        CSTRING(40)                           !
FDCB7::View:FileDropCombo VIEW(ENFERMEDADES)
                       PROJECT(ENF:ENF_CODIGO)
                       PROJECT(ENF:ENF_DESCRIPCION)
                     END
Queue:FileDropCombo:1 QUEUE                           !Queue declaration for browse/combo box using ?CME:CME_CODIGO
ENF:ENF_CODIGO         LIKE(ENF:ENF_CODIGO)           !List box control field - type derived from field
ENF:ENF_DESCRIPCION    LIKE(ENF:ENF_DESCRIPCION)      !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::CME:Record  LIKE(CME:RECORD),THREAD
QuickWindow          WINDOW('Concepto Médico'),AT(,,292,243),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('FormDiasdeViaje'),SYSTEM
                       SHEET,AT(5,5,282,215),USE(?CurrentTab),FONT(,10,,FONT:bold)
                         TAB,USE(?Tab:1)
                           PROMPT('Fecha'),AT(94,25),USE(?CME:CME_FECHA:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@d17),AT(94,41,55,12),USE(CME:CME_FECHA_DATE),FONT(,10,,FONT:bold),CENTER,FLAT,READONLY, |
  REQ
                           GROUP,AT(10,25,80,60),USE(?GROUP1),BOXED
                             PROMPT('LEGAJO'),AT(25,36,47),USE(?CME:CME_NROLEG:Prompt),FONT(,12,COLOR:Red,FONT:bold)
                             ENTRY(@n_5),AT(22,58,54,19),USE(CME:CME_NROLEG),FONT(,18),READONLY,REQ
                           END
                           PROMPT('Usuario'),AT(94,57),USE(?CME:CME_USUARIO:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@s12),AT(94,73,70,12),USE(CME:CME_USUARIO),FONT(,10,,FONT:bold),CENTER,FLAT,READONLY, |
  REQ
                           PROMPT('Código'),AT(10,132),USE(?CME:CME_CODIGO:Prompt),FONT(,10,,FONT:bold),TRN
                           PROMPT('Médico/a'),AT(10,149),USE(?CME:CME_MEDICO:Prompt),FONT(,10,,FONT:bold),TRN
                           PROMPT('Observación'),AT(10,165),USE(?CME:CME_OBSERVACION:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@s25),AT(58,149,106,12),USE(CME:CME_MEDICO),FONT(,10,,FONT:regular),FLAT,REQ
                           COMBO(@s3),AT(59,133,45,11),USE(CME:CME_CODIGO),FONT(,10),DROP(10),FORMAT('15L(1)~Cod.~C(0)@s3@'), |
  FROM(Queue:FileDropCombo:1),IMM,REQ,SCROLL
                           PROMPT('Certificado'),AT(168,25,52,12),USE(?PROMPT1),FONT(,10,,FONT:bold)
                           REGION,AT(170,57,112,159),USE(?ViewerCert),BEVEL(0,0,1)
                           BUTTON,AT(254,41,12,12),USE(?Escanear),FONT(,10,,FONT:bold),ICON('scanner.ico')
                           TEXT,AT(11,95,153,33),USE(CME:CME_DESCRIPCION),FONT(,10),READONLY
                           TEXT,AT(11,182,153,33),USE(CME:CME_OBSERVACION),FONT(,10)
                           BUTTON,AT(170,41,12,12),USE(?Brillo),ICON('brillo.ico')
                           BUTTON,AT(186,41,12,12),USE(?Zoom),ICON(ICON:Zoom)
                           BUTTON,AT(202,41,12,12),USE(?Imprimir),ICON(ICON:Print1)
                           BUTTON,AT(238,41,12,12),USE(?Cargar),ICON(ICON:Open)
                           BUTTON,AT(270,41,12,12),USE(?Guardar),ICON(ICON:Save)
                         END
                       END
                       CHECK('Borrar'),AT(5,222,45,16),USE(?Borrar),FONT(,10,COLOR:Red,FONT:bold),VALUE('1','0')
                       BUTTON('&Aceptar'),AT(148,222,67,16),USE(?Ok),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(219,222,67,16),USE(?Cancel),FONT(,10,,FONT:regular),LEFT,ICON('WACANCEL.ICO'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
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
Open                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB7                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo:1         !Reference to browse queue type
                     END

ImgViewer            CLASS(ImageExViewerClass)
                     END
ImageExTwain4        CLASS(ImageExTwainClass)
OnAcquired              FUNCTION (ImageExBitmapClass bmp), BOOL, DERIVED
                     END
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
!Bitmap           &ImageExBitmapClass
TheBitmap        ImageExBitmapClass
JpgSaver         ImageExJpegSaverClass
PDFSaver         ImageExPdfSaverClass
kMaxFoto         EQUATE(2048)

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
CME_PARAMETROS      ROUTINE
    CME:CME_FECHA_UPDATE_DATE = TODAY()
    CME:CME_FECHA_UPDATE_TIME = CLOCK()
    CME:CME_USUARIO = Glo:Usuario2
DAU_PARAMETROS      ROUTINE
    DAU:DAU_FECHA_UPDATE_DATE = TODAY()
    DAU:DAU_FECHA_UPDATE_TIME = CLOCK()
    DAU:DAU_USUARIO = Glo:Usuario2
PrepararDatos       ROUTINE
    !    ----- Nombre DB ----
    empleado" = clip(EPL:EMP_NOMBRE)
    val# = instring(',',empleado")
    nombre" = CLIP(LEFT(empleado"[val#+1:LEN(empleado")]))
    apellido" = CLIP(LEFT(empleado"[1:val#-1]))
    !    ----- Apellido ----
    val# = instring(' ',CLIP(LEFT(apellido")))
    IF val# <> 0 THEN
        ap" = apellido"[1:val#]
    ELSE
        ap" = apellido"
    END
    !    ----- Nombre -----
    val# = instring(' ',CLIP(LEFT(nombre")))
    IF val# <> 0 THEN
        nom" = nombre"[1:val#]
    ELSE
        nom" = nombre"
    END

    Loc:empleado = CLIP(ap") & '_' & CLIP(nom")

ThisWindow.Ask PROCEDURE

  CODE
  ImgViewer.Init(QuickWindow, ?ViewerCert)
  ImgViewer.SetBkColor(16777215)
  ImgViewer.Bitmap.SetStretchFilter(IMAGEEXSTRETCHFILTER:Nearest)
  ImgViewer.Bitmap.SetDrawMode(IMAGEEXDRAWMODE:Opaque)
  ImgViewer.Bitmap.SetMasterAlpha(255)
  ImgViewer.SetZoomPercent(20)
  ImgViewer.SetAllowFocus(0)
  ImgViewer.SetScrollsVisible(0)
  ImgViewer.SetMouseMode(0*IEMM:PAN + 0*IEMM:ZoomWheel + 1 * IEMM:HOTSPOTS)
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Concepto Médico'
  OF InsertRecord
    ActionMessage = 'Establece el Concepto Médico'
  OF ChangeRecord
    ActionMessage = 'Modifica el Concepto Médico'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  IF SELF.Request = ViewRecord OR SELF.Request = ChangeRecord THEN
      CLEAR(CME:Record)
      CME:CME_DAU_ID = DAU:DAU_ID
      GET(CONCEPTO_MEDICO, CME:FK_CME_DAU_ID)
      IF NOT ERRORCODE() THEN !Si existe el CONCEPTO que quiero borrar, ingreso al IF
          ImgViewer.Bitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
          ImgViewer.ZoomToFit()
      END
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('FormConceptoMedico')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CME:CME_FECHA:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ENF:ENF_DESCRIPCION',ENF:ENF_DESCRIPCION)          ! Added by: FileDropCombo(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CME:Record,History::CME:Record)
  SELF.AddHistoryField(?CME:CME_FECHA_DATE,11)
  SELF.AddHistoryField(?CME:CME_NROLEG,3)
  SELF.AddHistoryField(?CME:CME_USUARIO,17)
  SELF.AddHistoryField(?CME:CME_MEDICO,6)
  SELF.AddHistoryField(?CME:CME_CODIGO,4)
  SELF.AddHistoryField(?CME:CME_DESCRIPCION,5)
  SELF.AddHistoryField(?CME:CME_OBSERVACION,7)
  SELF.AddUpdateFile(Access:CONCEPTO_MEDICO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONCEPTO_MEDICO.Open                              ! File CONCEPTO_MEDICO used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:ENFERMEDADES.Open                                 ! File ENFERMEDADES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONCEPTO_MEDICO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?Ok
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?CME:CME_FECHA_DATE{PROP:ReadOnly} = True
    ?CME:CME_NROLEG{PROP:ReadOnly} = True
    ?CME:CME_USUARIO{PROP:ReadOnly} = True
    ?CME:CME_MEDICO{PROP:ReadOnly} = True
    DISABLE(?CME:CME_CODIGO)
    DISABLE(?Escanear)
    ?CME:CME_OBSERVACION{PROP:ReadOnly} = True
    DISABLE(?Cargar)
    DISABLE(?Guardar)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB7.Init(CME:CME_CODIGO,?CME:CME_CODIGO,Queue:FileDropCombo:1.ViewPosition,FDCB7::View:FileDropCombo,Queue:FileDropCombo:1,Relate:ENFERMEDADES,ThisWindow,GlobalErrors,0,1,0)
  FDCB7.Q &= Queue:FileDropCombo:1
  FDCB7.AddSortOrder(ENF:PK_ENF_CODIGO)
  FDCB7.AddField(ENF:ENF_CODIGO,FDCB7.Q.ENF:ENF_CODIGO) !List box control field - type derived from field
  FDCB7.AddField(ENF:ENF_DESCRIPCION,FDCB7.Q.ENF:ENF_DESCRIPCION) !Browse hot field - type derived from field
  FDCB7.AddUpdateField(ENF:ENF_CODIGO,CME:CME_CODIGO)
  FDCB7.AddUpdateField(ENF:ENF_DESCRIPCION,CME:CME_DESCRIPCION)
  ThisWindow.AddItem(FDCB7.WindowComponent)
  FDCB7.DefaultFill = 0
  SELF.SetAlerts()
  IF SELF.Request = ViewRecord THEN
      TheBitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
  END
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONCEPTO_MEDICO.Close
    Relate:DETALLE_AUSENCIA.Close
    Relate:ENFERMEDADES.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  IF SELF.Request = ViewRecord AND DAU:DAU_FIN_DATE < TODAY() AND GLO:UserAccess <> 1 THEN
      DISABLE(?Borrar)
  ELSE
      ENABLE(?Borrar)
  END


ThisWindow.PrimeFields PROCEDURE

  CODE
  CME:CME_DAU_ID = DAU:DAU_ID
  CME:CME_NROLEG = DAU:DAU_NROLEG
  CME:CME_FECHA_DATE = TODAY()
  CME:CME_FECHA_TIME = CLOCK()
  CME:CME_FECHA_UPDATE_DATE = TODAY()
  CME:CME_FECHA_UPDATE_TIME = CLOCK()
  CME:CME_USUARIO = Glo:Usuario2
  PARENT.PrimeFields


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
    CASE ACCEPTED()
    OF ?Cargar
       PictureDialogResult# = ImageEx:PictureDialog(, Loc:Filename, ImageEx:GetFilterString(), FILE:KEEPDIR)
      IF PictureDialogResult#
          IF TheBitmap.LoadFromFile(Loc:Filename) THEN
              ImgViewer.Bitmap.Assign(TheBitmap)
              ImgViewer.ZoomToFit()
              ImgViewer.Bitmap.SaveToBlob(CME:CME_CERTIFICADOS, JpgSaver)
          END
      END
    OF ?Guardar
      DO PrepararDatos
      Loc:Filename = DAU:DAU_NROLEG & '_' & CLIP(Loc:empleado) & '_' & FORMAT(DAU:DAU_INICIO_DATE,@D06-) & '_' & FORMAT(DAU:DAU_FIN_DATE,@D06-)
      TheBitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
      SaveImage(TheBitmap, True, Loc:Filename)
    OF ?Ok
      !Se verifica que no se haya superado el límite de 20 días para la validación para usuarios comunes
      IF GLO:UserAccess <> 1 THEN !GLO:UserAccess = 1 => Administradores
          IF SELF.Request = InsertRecord AND TODAY() > (DAU:DAU_FECHA_DATE + 19) THEN
              BEEP
              MESSAGE('No se puede VALIDAR, se supero el límite de 20 días', 'Error de VALIDACIÓN', ICON:Exclamation, BUTTON:OK, 1)
              CYCLE
          END
      END
      !Se verifica que todos los campos tengan datos
      IF CME:CME_CODIGO = '' OR CME:CME_MEDICO = '' THEN
          BEEP
          MESSAGE('Debe completar los campos antes de VALIDAR', 'Error de VALIDACIÓN', ICON:Exclamation, BUTTON:OK, 1)
          IF CME:CME_CODIGO = '' THEN
              SELECT(?CME:CME_CODIGO)
          ELSE
              SELECT(?CME:CME_MEDICO)
          END    
          CYCLE
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CME:CME_CODIGO
      IF NOT QuickWindow{PROP:AcceptAll}
        IF Access:CONCEPTO_MEDICO.TryValidateField(4)      ! Attempt to validate CME:CME_CODIGO in CONCEPTO_MEDICO
          SELECT(?CME:CME_CODIGO)
          CYCLE
        ELSE
          FieldColorQueue.Feq = ?CME:CME_CODIGO
          GET(FieldColorQueue, FieldColorQueue.Feq)
          IF ERRORCODE() = 0
            ?CME:CME_CODIGO{PROP:FontColor} = FieldColorQueue.OldColor
            DELETE(FieldColorQueue)
          END
        END
      END
    OF ?Escanear
      ThisWindow.Update()
      !Se llama al procedure de escaneo
      wndScanning()
      !Visualizo la última imagen seleccionada
      ImgViewer.Bitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
      ImgViewer.ZoomToFit()
    OF ?Brillo
      ThisWindow.Update()
      IF ?ViewerCert{PROP:hide} = FALSE THEN
          TheBitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
          wndBrightness(TheBitmap, ImgViewer.Bitmap, 0, 0, 0)
          TheBitmap.SaveToBlob(CME:CME_CERTIFICADOS, JpgSaver)
          POST(EVENT:Accepted,?ViewerCert)
      END
    OF ?Zoom
      ThisWindow.Update()
      IF ?ViewerCert{PROP:hide} = FALSE THEN
          IF SELF.Request = InsertRecord THEN
              wndViewImage(TheBitmap, 'Certificado Médico')
          ELSE
              CLEAR(CME:Record)
              CME:CME_DAU_ID = DAU:DAU_ID
              GET(CONCEPTO_MEDICO, CME:FK_CME_DAU_ID)
              IF NOT ERRORCODE() THEN !Si existe el CONCEPTO, lo muestro
                  TheBitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
                  wndViewImage(TheBitmap, 'Certificado Médico')
              END
          END
      END
    OF ?Imprimir
      ThisWindow.Update()
      DO PrepararDatos
      Loc:Filename = DAU:DAU_NROLEG & '_' & CLIP(Loc:empleado) & '_' & FORMAT(DAU:DAU_INICIO_DATE,@D06-) & '_' & FORMAT(DAU:DAU_FIN_DATE,@D06-)
      TheBitmap.LoadFromBlob(CME:CME_CERTIFICADOS)
      IF ?ViewerCert{PROP:hide}=FALSE THEN
          PrintCert(TheBitmap, Loc:Filename)
      END   
    OF ?Ok
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      SETCURSOR(CURSOR:Wait)
      IF SELF.Request = ViewRecord AND ?Borrar{PROP:Checked} = 1 THEN
          CLEAR(CME:Record)
          CME:CME_DAU_ID = DAU:DAU_ID
          GET(CONCEPTO_MEDICO, CME:FK_CME_DAU_ID)
          IF NOT ERRORCODE() THEN !Si existe el CONCEPTO que quiero borrar, ingreso al IF
              CLEAR(DAU:Record)
              DAU:DAU_NROLEG = CME:CME_NROLEG
              DAU:DAU_ID = CME:CME_DAU_ID
              GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
              IF NOT ERRORCODE() THEN !Ubico el detalle y lo paso a estado pendiente
                  DO DAU_PARAMETROS
                  DAU:DAU_ESTADO = 'P'
                  Access:DETALLE_AUSENCIA.Update()
              END
              Access:CONCEPTO_MEDICO.DeleteRecord() !Elimino el CONCEPTO asociado a la AUSENCIA
              MESSAGE('Se ha ELIMINADO el CONCEPTO MÉDICO asociado', 'Eliminación', ICON:Exclamation, BUTTON:OK, 1)
          ELSE
              MESSAGE('No EXISTE un CONCEPTO MÉDICO asociado', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          END
      ELSIF SELF.Request = ChangeRecord THEN
          DO CME_PARAMETROS
          Access:CONCEPTO_MEDICO.Update()
      ELSE !Es un InsertRecord
          DO CME_PARAMETROS
      END
      SETCURSOR()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  IF ReturnValue = Level:Benign THEN
      IF SELF.Request = InsertRecord THEN
          CLEAR(DAU:Record)
          DAU:DAU_NROLEG = CME:CME_NROLEG
          DAU:DAU_ID = CME:CME_DAU_ID
          GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
          IF NOT ERRORCODE() THEN !Actualizo estado de AUSENCIA
              DO DAU_PARAMETROS
              DAU:DAU_ESTADO = 'V'
              Access:DETALLE_AUSENCIA.update()
              IF NOT ERRORCODE() THEN
                  MESSAGE('Se ha Validado una AUSENCIA por CONCEPTO MÉDICO', 'Validación',ICON:Exclamation,BUTTON:OK,1)
              END
          ELSE
              MESSAGE('NO es posible VALIDAR la AUSENCIA por CONCEPTO MÉDICO', 'Inconsistencia de Validación',ICON:Exclamation,BUTTON:OK,1)
          END
      ELSIF SELF.Request = ChangeRecord THEN
          CLEAR(CME:Record)
          CME:CME_DAU_ID = DAU:DAU_ID
          GET(CONCEPTO_MEDICO, CME:FK_CME_DAU_ID)
          IF NOT ERRORCODE() THEN !Si existe el CONCEPTO, modifico lo necesario
              IF DAU:DAU_ESTADO = 'A' THEN
                  CLEAR(DAU:Record)
                  DAU:DAU_NROLEG = CME:CME_NROLEG
                  DAU:DAU_ID = CME:CME_DAU_ID
                  GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
                  IF NOT ERRORCODE() THEN
                      DO DAU_PARAMETROS
                      DAU:DAU_ESTADO = 'P'
                      Access:DETALLE_AUSENCIA.Update()
                  END
              END
          ELSE
              MESSAGE('No EXISTE el CONCEPTO MÉDICO a modificar', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          END
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


ImageExTwain4.OnAcquired FUNCTION(ImageExBitmapClass Bmp)
Result               BOOL
   CODE
   Result = Parent.OnAcquired(Bmp)
   Return Result

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

