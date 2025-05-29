

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER030.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER009.INC'),ONCE        !Req'd for module callout resolution
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
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

