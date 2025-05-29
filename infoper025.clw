

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER025.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER024.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form CERTIFICADOS
!!! </summary>
FormCertificado PROCEDURE 

loc:certificado      &BLOB                                 !
Loc:Cstring          CSTRING(256)                          !
Loc:empleado         STRING(80)                            !
Loc:Fileopen         STRING(255)                           !
Loc:Filename         STRING(255)                           !
loc:DAU_ID           LONG                                  !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::CER:Record  LIKE(CER:RECORD),THREAD
QuickWindow          WINDOW('Certificado'),AT(,,215,243),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('FormDiasdeViaje'),SYSTEM
                       SHEET,AT(5,5,207,215),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           PROMPT('Fecha'),AT(10,89),USE(?CME:CME_FECHA:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@d17),AT(10,105,55,12),USE(CER:CER_FECHA_DATE),FONT(,10,,FONT:bold),CENTER,FLAT,READONLY, |
  REQ
                           GROUP,AT(10,25,80,60),USE(?GROUP1),BOXED
                             PROMPT('LEGAJO'),AT(25,36,47),USE(?CME:CME_NROLEG:Prompt),FONT(,12,COLOR:Red,FONT:bold)
                             ENTRY(@N_5),AT(22,58,54,19),USE(CER:CER_NROLEG),FONT(,18),READONLY,REQ
                           END
                           PROMPT('Usuario'),AT(10,121),USE(?CME:CME_USUARIO:Prompt),FONT(,10,,FONT:bold),TRN
                           ENTRY(@s12),AT(10,137,70,12),USE(CER:CER_USUARIO),FONT(,10,,FONT:bold),CENTER,FLAT,READONLY, |
  REQ
                           PROMPT('Observación'),AT(10,153),USE(?CME:CME_OBSERVACION:Prompt),FONT(,10,,FONT:bold),TRN
                           PROMPT('Certificado'),AT(92,25,52,12),USE(?PROMPT1),FONT(,10,,FONT:bold)
                           REGION,AT(94,57,112,159),USE(?ViewerCert),BEVEL(0,0,1)
                           BUTTON,AT(178,41,12,12),USE(?Escanear),FONT(,10,,FONT:bold),ICON('scanner.ico')
                           TEXT,AT(11,170,79,46),USE(CER:CER_OBSERVACION),FONT(,10),REQ
                           BUTTON,AT(94,41,12,12),USE(?Brillo),ICON('brillo.ico')
                           BUTTON,AT(110,41,12,12),USE(?Zoom),ICON(ICON:Zoom)
                           BUTTON,AT(126,41,12,12),USE(?Imprimir),ICON(ICON:Print1)
                           BUTTON,AT(162,41,12,12),USE(?Cargar),FONT(,10,,FONT:bold),ICON(ICON:Open)
                           BUTTON,AT(194,41,12,12),USE(?Guardar),ICON(ICON:Save)
                         END
                       END
                       CHECK('Borrar'),AT(5,222,59,16),USE(?Borrar),FONT(,10,COLOR:Red,FONT:bold),VALUE('1','0')
                       BUTTON('&Aceptar'),AT(73,222,67,16),USE(?Ok),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(143,222,67,16),USE(?Cancel),FONT(,10,,FONT:regular),LEFT,ICON('WACANCEL.ICO'), |
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
Bitmap           &ImageExBitmapClass
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
CER_PARAMETROS      ROUTINE
    CER:CER_FECHA_UPDATE_DATE = TODAY()
    CER:CER_FECHA_UPDATE_TIME = CLOCK()
    CER:CER_USUARIO = Glo:Usuario2
DAU_PARAMETROS ROUTINE
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
  IF SELF.Request = ViewRecord OR SELF.Request = ChangeRecord THEN
      CLEAR(CER:Record)
      CER:CER_DAU_ID = DAU:DAU_ID
      GET(CERTIFICADOS, CER:FK_CER_DAU_ID)
      IF NOT ERRORCODE() THEN
          ImgViewer.Bitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
          ImgViewer.ZoomToFit()
      END
  END
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Certificado'
  OF InsertRecord
    ActionMessage = 'Establece el Certificado'
  OF ChangeRecord
    ActionMessage = 'Modifica el Certificado'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('FormCertificado')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CME:CME_FECHA:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CER:Record,History::CER:Record)
  SELF.AddHistoryField(?CER:CER_FECHA_DATE,8)
  SELF.AddHistoryField(?CER:CER_NROLEG,3)
  SELF.AddHistoryField(?CER:CER_USUARIO,14)
  SELF.AddHistoryField(?CER:CER_OBSERVACION,4)
  SELF.AddUpdateFile(Access:CERTIFICADOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CERTIFICADOS.Open                                 ! File CERTIFICADOS used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:SQLBLOB.Open                                      ! File SQLBLOB used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CERTIFICADOS
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
    ?CER:CER_FECHA_DATE{PROP:ReadOnly} = True
    ?CER:CER_NROLEG{PROP:ReadOnly} = True
    ?CER:CER_USUARIO{PROP:ReadOnly} = True
    ?CME:CME_OBSERVACION:Prompt{PROP:ReadOnly} = True
    DISABLE(?Escanear)
    DISABLE(?Cargar)
    DISABLE(?Guardar)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  IF SELF.Request = ViewRecord THEN
      TheBitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
  END
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CERTIFICADOS.Close
    Relate:DETALLE_AUSENCIA.Close
    Relate:EMPLEADOS.Close
    Relate:SQLBLOB.Close
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
  CER:CER_DAU_ID = DAU:DAU_ID
  CER:CER_NROLEG = DAU:DAU_NROLEG
  CER:CER_FECHA_DATE = TODAY()
  CER:CER_FECHA_TIME = CLOCK()
  CER:CER_FECHA_UPDATE_DATE = TODAY()
  CER:CER_FECHA_UPDATE_TIME = CLOCK()
  CER:CER_USUARIO = Glo:Usuario2
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
       PictureDialogResult# = ImageEx:PictureDialog(, Loc:Fileopen, ImageEx:GetFilterString(), FILE:KEEPDIR)
      IF PictureDialogResult#
          IF TheBitmap.LoadFromFile(Loc:Fileopen) THEN
              ImgViewer.Bitmap.Assign(TheBitmap)
              ImgViewer.ZoomToFit()
              TheBitmap.SaveToBlob(CER:CER_CERTIFICADOS, JpgSaver)
          END
      END
    OF ?Guardar
      DO PrepararDatos
      Loc:Filename = DAU:DAU_NROLEG & '_' & CLIP(Loc:empleado) & '_' & FORMAT(DAU:DAU_INICIO_DATE,@D06-) & '_' & FORMAT(DAU:DAU_FIN_DATE,@D06-)
      TheBitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
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
      IF CER:CER_OBSERVACION = '' THEN
          BEEP
          MESSAGE('Debe completar los campos antes de VALIDAR', 'Error de VALIDACIÓN', ICON:Exclamation, BUTTON:OK, 1)
          SELECT(?CER:CER_OBSERVACION)
          CYCLE
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Escanear
      ThisWindow.Update()
      !Se llama al procedure de escaneo
      wndScanning()
      !Visualizo la última imagen seleccionada
      ImgViewer.Bitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
      ImgViewer.ZoomToFit()
    OF ?Brillo
      ThisWindow.Update()
      IF ?ViewerCert{PROP:hide} = FALSE THEN
          TheBitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
          wndBrightness(TheBitmap, ImgViewer.Bitmap, 0, 0, 0)
          TheBitmap.SaveToBlob(CER:CER_CERTIFICADOS, JpgSaver)
          POST(EVENT:Accepted,?ViewerCert)
      END
    OF ?Zoom
      ThisWindow.Update()
      IF ?ViewerCert{PROP:hide} = FALSE THEN
          IF SELF.Request = InsertRecord THEN
              wndViewImage(TheBitmap, 'Certificado')
          ELSE
              CLEAR(CER:Record)
              CER:CER_DAU_ID = DAU:DAU_ID
              GET(CERTIFICADOS, CER:FK_CER_DAU_ID)
              IF NOT ERRORCODE() THEN
                  TheBitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
                  wndViewImage(TheBitmap, 'Certificado')
              END
          END
      END
    OF ?Imprimir
      ThisWindow.Update()
      DO PrepararDatos
      Loc:Filename = DAU:DAU_NROLEG & '_' & CLIP(Loc:empleado) & '_' & FORMAT(DAU:DAU_INICIO_DATE,@D06-) & '_' & FORMAT(DAU:DAU_FIN_DATE,@D06-)
      TheBitmap.LoadFromBlob(CER:CER_CERTIFICADOS)
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
          CLEAR(CER:Record)
          CER:CER_DAU_ID = DAU:DAU_ID
          GET(CERTIFICADOS, CER:FK_CER_DAU_ID)
          IF NOT ERRORCODE() THEN !Si existe el CERTIFICADO que quiero borrar, ingreso al IF
              CLEAR(DAU:Record)
              DAU:DAU_NROLEG = CER:CER_NROLEG
              DAU:DAU_ID = CER:CER_DAU_ID
              GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
              IF NOT ERRORCODE() THEN !Ubico el detalle y lo paso a estado pendiente
                  DO DAU_PARAMETROS
                  DAU:DAU_ESTADO = 'P'
                  Access:DETALLE_AUSENCIA.Update()
              END
              Access:CERTIFICADOS.DeleteRecord() !Elimino el CERTIFICADO asociado a la AUSENCIA
              MESSAGE('Se ha ELIMINADO el CERTIFICADO asociado', 'Eliminación', ICON:Exclamation, BUTTON:OK, 1)
          ELSE
              MESSAGE('No EXISTE un CERTIFICADO asociado', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          END   
      ELSIF SELF.Request = ChangeRecord THEN
          DO CER_PARAMETROS
          Access:CERTIFICADOS.Update()
      ELSE !Es un InsertRecord
          DO CER_PARAMETROS
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
          DAU:DAU_NROLEG = CER:CER_NROLEG
          DAU:DAU_ID = CER:CER_DAU_ID
          GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
          IF NOT ERRORCODE() THEN !Actualizo estado de AUSENCIA
              DO DAU_PARAMETROS
              DAU:DAU_ESTADO = 'V'
              Access:DETALLE_AUSENCIA.update()
              IF NOT ERRORCODE() THEN
                  MESSAGE('Se ha Validado una AUSENCIA por CERTIFICADO', 'Validación',ICON:Exclamation,BUTTON:OK,1)
              END
          ELSE
              MESSAGE('NO es posible VALIDAR la AUSENCIA por CERTIFICADO', 'Inconsistencia de Validación',ICON:Exclamation,BUTTON:OK,1)
          END
      ELSIF SELF.Request = ChangeRecord THEN
          CLEAR(CER:Record)
          CER:CER_DAU_ID = DAU:DAU_ID
          GET(CERTIFICADOS, CER:FK_CER_DAU_ID)
          IF NOT ERRORCODE() THEN !Si existe el certificado, modifico lo necesario
              IF DAU:DAU_ESTADO = 'A' THEN
                  CLEAR(DAU:Record)
                  DAU:DAU_NROLEG = CER:CER_NROLEG
                  DAU:DAU_ID = CER:CER_DAU_ID
                  GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
                  IF NOT ERRORCODE() THEN
                      DO DAU_PARAMETROS
                      DAU:DAU_ESTADO = 'P'
                      Access:DETALLE_AUSENCIA.Update()
                  END
              END
          ELSE
              MESSAGE('No EXISTE el CERTIFICADO a modificar', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
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


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
AusenciaPorEmpleado PROCEDURE 

Loc:str              STRING(4000)                          !
Loc:total            LONG                                  !
Loc:descripcion      STRING(40)                            !
Loc:motivo_id        STRING(10)                            !
Loc:legajo           SHORT                                 !
Loc:sector           STRING(40)                            !
Loc:sector_id        STRING(20)                            !
Loc:ini              STRING(@D12)                          !
Loc:fin              STRING(@D12)                          !
Loc:Titulo           STRING(100)                           !
Loc:opcion           BYTE                                  !
Loc:opcion_emp       BYTE                                  !
QAusencias           QUEUE,PRE()                           !
QLegajo              LONG                                  !
QNombre              STRING(50)                            !
QSector              STRING(40)                            !
QConvenio            STRING(15)                            !
QInicio              DATE                                  !
QFin                 DATE                                  !
QDias                BYTE                                  !
QEstado              STRING(3)                             !
QMotivo              STRING(20)                            !
QObservaciones       CSTRING(256)                          !
QCodigo              STRING(5)                             !
QDescripcion         STRING(255)                           !
QMedico              STRING(30)                            !
QObservacion         STRING(255)                           !
QObservacion_cert    STRING(255)                           !
                     END                                   !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Ausencias por Empleado'),AT(,,465,300),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaPorSector'), |
  STATUS(-1,50,100,65,-1),SYSTEM
                       GROUP,AT(5,1,455,42),USE(?GROUP1),FONT(,,,FONT:bold),BOXED
                         OPTION,AT(10,10,120,14),USE(Loc:opcion),FONT(,,COLOR:Red,FONT:bold),TRN
                           RADIO('Por Fecha'),AT(12,12,48),USE(?OPTION1:RADIO1),FONT(,,,FONT:bold),VALUE('1')
                           RADIO('Por Rango'),AT(72,12,48),USE(?OPTION1:RADIO2),VALUE('2')
                         END
                         ENTRY(@D06B),AT(10,28,45,9),USE(Loc:ini),CENTER
                         BUTTON,AT(58,27,10,10),USE(?Calendar),ICON('almanaque.ico')
                         ENTRY(@D06B),AT(72,28,45,9),USE(Loc:fin),CENTER
                         BUTTON,AT(120,27,10,10),USE(?Calendar:2),ICON('almanaque.ico')
                         BUTTON('E&xportar'),AT(406,10,50,12),USE(?EvoExportar),FONT(,,,FONT:regular),LEFT,ICON('export.ico'), |
  CURSOR('mano.cur'),FLAT
                         BUTTON('Procesar'),AT(406,26,50,12),USE(?Procesar),FONT(,,,FONT:regular),LEFT,ICON(ICON:Zoom), |
  FLAT
                         BUTTON('Empleado'),AT(152,26,38,14),USE(?CallLookup)
                         ENTRY(@s31),AT(194,26,186,13),USE(EPL:EMP_NOMBRE),FONT(,13,,FONT:bold),READONLY
                         OPTION,AT(152,10,120,14),USE(Loc:opcion_emp),TRN
                           RADIO('Todos'),AT(160,12),USE(?OPTION1:RADIO3),FONT(,,00006400h),VALUE('1')
                           RADIO('Por Empleado'),AT(202,12,61,10),USE(?OPTION1:RADIO4),FONT(,,00006400h),VALUE('2')
                         END
                       END
                       LIST,AT(5,46,455,250),USE(QAusencias),HVSCROLL,FLAT,FORMAT('24R(1)|~Legajo~C(0)@N05B@12' & |
  '0L(1)|M~Nombre~C(0)@s50@70L(1)|M~Sector~C(0)@s40@50L(1)|~Convenio~C(0)@s15@35C|~Inic' & |
  'io~@D06B@35C|~Fin~@D06B@16C|~Días~@N_2@23C|~Estado~@s3@65L(1)|~Motivo~C(0)@s20@120L(' & |
  '1)|M~Observaciones~C(0)@s255@25C(1)|~Código~C(0)@s5@120L(1)|M~Descripción~C(0)@s255@' & |
  '65L(1)|M~Médico/a~C(0)@s30@150L(1)|M~Observación Médica~C(0)@s255@1020L(1)|M~Observa' & |
  'ción por Certificados~C(0)@s255@'),FROM(QAusencias)
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
Open                   PROCEDURE(),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar5            CalendarClass
Calendar4            CalendarClass

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
 Q1:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,'
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
 ADD(QPar1)   ! 29 infoper025.clw
!!!!!


 FREE(QPar21)
      Qp21:F2N  = 'Legajo'
 Qp21:F2P  = '@N06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Nombre'
 Qp21:F2P  = '@s50'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Sector'
 Qp21:F2P  = '@s40'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Convenio'
 Qp21:F2P  = '@s15'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Inicio'
 Qp21:F2P  = '@D06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Fin'
 Qp21:F2P  = '@D06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Días'
 Qp21:F2P  = '@N_2'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Estado'
 Qp21:F2P  = '@s3'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Motivo'
 Qp21:F2P  = '@s20'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observaciones'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Código'
 Qp21:F2P  = '@s5'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Descripción'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Médico/a'
 Qp21:F2P  = '@s30'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observación Médica'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observación por Certificados'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
 SysRec# = false
 FREE(Loc::QHlist1)
 LOOP
    SysRec# += 1
    IF ?QAusencias{PROPLIST:Exists,SysRec#} = 1
        GET(QPar21,SysRec#)
        QHL1:Id      = SysRec#
        QHL1:Nombre  = Qp21:F2N
        QHL1:Longitud= ?QAusencias{PropList:Width,SysRec#}  /2
        QHL1:Pict    = Qp21:F2P
        QHL1:Tot    = Qp21:F2T
        ADD(Loc::QHlist1)
     Else
       break
    END
 END
 Loc::Titulo1 =Loc:Titulo

 SavPath1 = PATH()

  Exportar(Loc::QHlist1,QAusencias,QPar1,0,Loc::Titulo1,Evo::Group1)
 SETPATH(SavPath1)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('AusenciaPorEmpleado')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OPTION1:RADIO1
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
     Loc:ini = TODAY()
     Loc:fin = ''
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     DISABLE(?Loc:fin)
     DISABLE(?Calendar:2)
  END
  IF Loc:opcion <> '1'
     Loc:ini = ''
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     ENABLE(?Loc:fin)
     ENABLE(?Calendar:2)
  END
  IF Loc:opcion = '2'
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     ENABLE(?Loc:fin)
     ENABLE(?Calendar:2)
  END
  IF Loc:opcion <> '2'
     DISABLE(?Loc:fin)
     DISABLE(?Calendar:2)
  END
  IF Loc:opcion_emp = '1'
     DISABLE(?EPL:EMP_NOMBRE)
     ENABLE(?Procesar)
  END
  IF Loc:opcion_emp <> '1'
     ENABLE(?EPL:EMP_NOMBRE)
  END
  IF Loc:opcion_emp = '2'
     ENABLE(?EPL:EMP_NOMBRE)
     ENABLE(?Procesar)
  END
  IF Loc:opcion_emp <> '2'
     DISABLE(?EPL:EMP_NOMBRE)
  END
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
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !Estado de botones al iniciar el procedure
  DISABLE(?Loc:ini)
  DISABLE(?Calendar)
  DISABLE(?EvoExportar)
  DISABLE(?Procesar)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Empleados
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
    OF ?Procesar
      !Lógica de control de datos a consultar
      IF Loc:opcion = 2 THEN
          IF Loc:opcion_emp = 2 THEN
              IF Loc:fin = '' OR EPL:EMP_NOMBRE = '' THEN
                  MESSAGE('Revisar datos!')
                  CYCLE
              END
          ELSE !Loc:opcion_emp = 1
              IF Loc:fin = '' THEN
                  MESSAGE('Revisar datos!')
                  CYCLE
              END
          END
      ELSE !Loc:opcion = 1
          IF Loc:opcion_emp = 2 AND EPL:EMP_NOMBRE = '' THEN
              MESSAGE('Revisar datos!')
              CYCLE
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:opcion
      IF Loc:opcion = '1'
         Loc:ini = TODAY()
         Loc:fin = ''
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         DISABLE(?Loc:fin)
         DISABLE(?Calendar:2)
      END
      IF Loc:opcion <> '1'
         Loc:ini = ''
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         ENABLE(?Loc:fin)
         ENABLE(?Calendar:2)
      END
      IF Loc:opcion = '2'
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         ENABLE(?Loc:fin)
         ENABLE(?Calendar:2)
      END
      IF Loc:opcion <> '2'
         DISABLE(?Loc:fin)
         DISABLE(?Calendar:2)
      END
      ThisWindow.Reset()
    OF ?Calendar
      ThisWindow.Update()
      Calendar5.SelectOnClose = True
      Calendar5.Ask('Seleccionar Fecha',Loc:ini)
      IF Calendar5.Response = RequestCompleted THEN
      Loc:ini=Calendar5.SelectedDate
      DISPLAY(?Loc:ini)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar4.SelectOnClose = True
      Calendar4.Ask('Seleccionar Fecha',Loc:fin)
      IF Calendar4.Response = RequestCompleted THEN
      Loc:fin=Calendar4.SelectedDate
      DISPLAY(?Loc:fin)
      END
      ThisWindow.Reset(True)
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExQueue1
    OF ?Procesar
      ThisWindow.Update()
      IF Loc:opcion_emp = 1 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Ausencias del día'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_ESTADO AS ESTADO, DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO, CME_OBSERVACION AS OBSERVACION, '&|
                        'CER_OBSERVACION AS OBSERVACION_CERT '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'LEFT JOIN CERTIFICADOS ON CER_DAU_ID = DAU_ID '&|
                        'WHERE (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN > <39>' & loc:ini & '<39>) '&|
                        'OR (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN IS NULL) '&|
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Ausencias Generales'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_ESTADO AS ESTADO, DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION, '&|
                        'CER_OBSERVACION AS OBSERVACION_CERT '&|                  
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'LEFT JOIN CERTIFICADOS ON CER_DAU_ID = DAU_ID '&|
                        'WHERE (<39>' & loc:fin & '<39> >= DAU_INICIO AND <39>' & loc:ini & '<39> < DAU_FIN) '&|
                        'OR (<39>' & loc:fin & '<39> >= DAU_INICIO AND DAU_FIN IS NULL) '&|          
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          END    
      ELSIF Loc:opcion_emp = 2 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Ausencias del día'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_ESTADO AS ESTADO, DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION, '&|
                        'CER_OBSERVACION AS OBSERVACION_CERT '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'LEFT JOIN CERTIFICADOS ON CER_DAU_ID = DAU_ID '&|
                        'WHERE DAU_NROLEG = ' & Loc:legajo & ' '&|
                        'AND ((DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN > <39>' & loc:ini & '<39>) '&|
                        'OR (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN IS NULL)) '&|
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Ausencias Generales'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_ESTADO AS ESTADO, DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION, '&|
                        'CER_OBSERVACION AS OBSERVACION_CERT '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'LEFT JOIN CERTIFICADOS ON CER_DAU_ID = DAU_ID '&|
                        'WHERE DAU_NROLEG = ' & Loc:legajo & ' '&|
                        'AND ((<39>' & loc:fin & '<39> >= DAU_INICIO AND <39>' & loc:ini & '<39> < DAU_FIN) '&|
                        'OR (<39>' & loc:fin & '<39> >= DAU_INICIO AND DAU_FIN IS NULL)) '&|          
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          END
      END
          
      SETCLIPBOARD(Loc:str)
      TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
      
      IF ERRORCODE() THEN STOP(FILEERRORCODE()).
      
      FREE(QAusencias)
      LOOP
      	NEXT(TMPUsosMultiples)
          IF ERRORCODE() THEN BREAK.
              QAusencias:QLegajo = TUM:Col01
              QAusencias:QNombre = TUM:Col02
              QAusencias:QSector = TUM:Col03
              QAusencias:QConvenio = TUM:Col04
              QAusencias:QInicio = DEFormat(TUM:Col05,@d012)
              QAusencias:QFin = DEFormat(TUM:Col06,@d012)
              QAusencias:QDias = TUM:Col07
              QAusencias:QEstado = TUM:Col08
              QAusencias:QMotivo = TUM:Col09
              QAusencias:QObservaciones = TUM:Col10
              QAusencias:QCodigo = TUM:Col11
              QAusencias:QDescripcion = TUM:Col12
              QAusencias:QMedico = TUM:Col13
              QAusencias:QObservacion = TUM:Col14
              QAusencias:QObservacion_cert = TUM:Col15
      	ADD(QAusencias)
      END !Loop
      !Loc:total = RECORDS(QAusencias)
      !MESSAGE(Loc:total)
      IF RECORDS(QAusencias) > 0 THEN
          ENABLE(?EvoExportar)
      ELSE
          DISABLE(?EvoExportar)
      END
      !DISPLAY()
    OF ?CallLookup
      ThisWindow.Update()
      EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
        Loc:legajo = EPL:EMP_LEGAJO
      END
      ThisWindow.Reset(1)
    OF ?EPL:EMP_NOMBRE
      IF EPL:EMP_NOMBRE OR ?EPL:EMP_NOMBRE{PROP:Req}
        EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
        IF Access:EMPLEADOS.TryFetch(EPL:PK_Nombre)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
            Loc:legajo = EPL:EMP_LEGAJO
          ELSE
            CLEAR(Loc:legajo)
            SELECT(?EPL:EMP_NOMBRE)
            CYCLE
          END
        ELSE
          Loc:legajo = EPL:EMP_LEGAJO
        END
      END
      ThisWindow.Reset()
    OF ?Loc:opcion_emp
      IF Loc:opcion_emp = '1'
         DISABLE(?EPL:EMP_NOMBRE)
         ENABLE(?Procesar)
      END
      IF Loc:opcion_emp <> '1'
         ENABLE(?EPL:EMP_NOMBRE)
      END
      IF Loc:opcion_emp = '2'
         ENABLE(?EPL:EMP_NOMBRE)
         ENABLE(?Procesar)
      END
      IF Loc:opcion_emp <> '2'
         DISABLE(?EPL:EMP_NOMBRE)
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


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
  !IF QAusencias <= 0 THEN
  !    DISABLE(?MAU:MAU_DESCRIPCION)
  !    DISABLE(?Filtrar)
  !END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?OPTION1:RADIO3
      EPL:EMP_NOMBRE = ''
    END
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
!!! Browse the DETALLE_LICENCIA file
!!! </summary>
ProcesarEstadosAusencias PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:total            SHORT                                 !
Loc:estados          STRING(1)                             !
Loc:titulo           STRING(4000)                          !
Loc:desde            DATE                                  !
Loc:hasta            DATE                                  !
BRW1::View:Browse    VIEW(DETALLE_AUSENCIA)
                       PROJECT(DAU:DAU_FECHA_DATE)
                       PROJECT(DAU:DAU_NROLEG)
                       PROJECT(DAU:DAU_ESTADO)
                       PROJECT(DAU:DAU_INICIO_DATE)
                       PROJECT(DAU:DAU_FIN_DATE)
                       PROJECT(DAU:DAU_DIAS)
                       PROJECT(DAU:DAU_CONDICION)
                       PROJECT(DAU:DAU_DESCRIPCION)
                       PROJECT(DAU:DAU_OBSERVACIONES)
                       PROJECT(DAU:DAU_ID)
                       JOIN(EMPLEADOS,'DAU:DAU_NROLEG = EPL:EMP_LEGAJO')
                         PROJECT(EPL:EMP_NOMBRE)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
DAU:DAU_FECHA_DATE     LIKE(DAU:DAU_FECHA_DATE)       !List box control field - type derived from field
DAU:DAU_NROLEG         LIKE(DAU:DAU_NROLEG)           !List box control field - type derived from field
EPL:EMP_NOMBRE         LIKE(EPL:EMP_NOMBRE)           !List box control field - type derived from field
DAU:DAU_ESTADO         LIKE(DAU:DAU_ESTADO)           !List box control field - type derived from field
DAU:DAU_INICIO_DATE    LIKE(DAU:DAU_INICIO_DATE)      !List box control field - type derived from field
DAU:DAU_FIN_DATE       LIKE(DAU:DAU_FIN_DATE)         !List box control field - type derived from field
DAU:DAU_DIAS           LIKE(DAU:DAU_DIAS)             !List box control field - type derived from field
DAU:DAU_CONDICION      LIKE(DAU:DAU_CONDICION)        !List box control field - type derived from field
DAU:DAU_DESCRIPCION    LIKE(DAU:DAU_DESCRIPCION)      !List box control field - type derived from field
DAU:DAU_OBSERVACIONES  LIKE(DAU:DAU_OBSERVACIONES)    !List box control field - type derived from field
DAU:DAU_ID             LIKE(DAU:DAU_ID)               !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Estado Ausencias'),AT(,,511,358),FONT('Microsoft Sans Serif',8,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ProcesarAdelantoSueldo'), |
  SYSTEM
                       LIST,AT(5,57,501,262),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('45C|~FECHA~@d17@38' & |
  'C|~LEGAJO~@N_5B@124L(1)|M~NOMBRE~C(0)@s31@40C|~ESTADO~@s2@45C|~INICIO~@d17@45C|~FIN~' & |
  '@d17@32C|~DIAS~@N_3B@55L(1)|~CONDICION~C(0)@s10@80L(1)|M~DESCRIPCION~C(0)@s120@120L(' & |
  '1)|M~OBSERVACIONES~C(0)@s255@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the DETALLE_L' & |
  'ICENCIA file')
                       BUTTON('&Insert'),AT(68,180,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(111,180,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(152,180,42,12),USE(?Delete),HIDE
                       GROUP,AT(5,10,501,43),USE(?GROUP1),BOXED
                         ENTRY(@d17),AT(10,31,63,14),USE(Loc:desde),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         ENTRY(@d17),AT(101,31,63,14),USE(Loc:hasta),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                         BUTTON,AT(77,31,14,14),USE(?Calendar)
                         BUTTON,AT(168,31,14,14),USE(?Calendar:2)
                         STRING('Desde:'),AT(10,15),USE(?STRING1),FONT(,10,COLOR:Navy,FONT:bold)
                         STRING('Hasta:'),AT(101,15,34,12),USE(?STRING1:2),FONT(,10,COLOR:Navy,FONT:bold)
                         OPTION,AT(245,15,255,30),USE(Loc:estados),FONT(,10,COLOR:Navy,FONT:bold)
                           RADIO('Pendientes'),AT(257,23,65,15),USE(?OPTION1:RADIO1),VALUE('P')
                           RADIO('Validados'),AT(326,23,60,15),USE(?OPTION1:RADIO2),VALUE('V')
                           RADIO('Todos'),AT(449,23,45,15),USE(?OPTION1:RADIO4),FONT(,,COLOR:Navy),VALUE('T')
                           RADIO('Anulados'),AT(390,23,55,15),USE(?OPTION1:RADIO3),FONT(,,COLOR:Navy),VALUE('A')
                         END
                       END
                       GROUP,AT(5,323,501,30),USE(?GROUP2),FONT(,10,,FONT:bold),BOXED
                         BUTTON('Salir'),AT(444,333,50,15),USE(?BUTTON3),FONT(,10,,FONT:bold),LEFT,ICON('SALIR.ICO'), |
  FLAT,STD(STD:Close)
                         BUTTON('E&xportar/Imprimir'),AT(187,333,110,15),USE(?EvoExportar),LEFT,ICON('export.ico'), |
  FLAT
                         PROMPT('Total:'),AT(10,333,,15),USE(?PROMPT1),FONT(,12),CENTER
                         ENTRY(@N7B),AT(45,334,27,14),USE(Loc:total),CENTER
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
InitSort               PROCEDURE(BYTE NewOrder),BYTE,DERIVED
                     END

BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
EditInPlace::DAU:DAU_FECHA_DATE EditEntryClass             ! Edit-in-place class for field DAU:DAU_FECHA_DATE
EditInPlace::DAU:DAU_NROLEG EditEntryClass                 ! Edit-in-place class for field DAU:DAU_NROLEG
EditInPlace::EPL:EMP_NOMBRE EditEntryClass                 ! Edit-in-place class for field EPL:EMP_NOMBRE
EditInPlace::DAU:DAU_ESTADO EditEntryClass                 ! Edit-in-place class for field DAU:DAU_ESTADO
EditInPlace::DAU:DAU_INICIO_DATE EditEntryClass            ! Edit-in-place class for field DAU:DAU_INICIO_DATE
EditInPlace::DAU:DAU_FIN_DATE EditEntryClass               ! Edit-in-place class for field DAU:DAU_FIN_DATE
EditInPlace::DAU:DAU_DIAS EditEntryClass                   ! Edit-in-place class for field DAU:DAU_DIAS
EditInPlace::DAU:DAU_CONDICION EditEntryClass              ! Edit-in-place class for field DAU:DAU_CONDICION
EditInPlace::DAU:DAU_DESCRIPCION EditEntryClass            ! Edit-in-place class for field DAU:DAU_DESCRIPCION
EditInPlace::DAU:DAU_OBSERVACIONES EditEntryClass          ! Edit-in-place class for field DAU:DAU_OBSERVACIONES
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
  Q4:FieldPar  = '1,2,3,4,5,6,7,8,9,10,'
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
  ADD(QPar4)   ! 29 infoper025.clw
 !!!!!
 
 
  FREE(QPar24)
       Qp24:F2N  = 'FECHA'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU NROLEG'
  Qp24:F2P  = '@n-7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'NOMBRE'
  Qp24:F2P  = '@s31'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU ESTADO'
  Qp24:F2P  = '@s2'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU INICIO DATE'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU FIN DATE'
  Qp24:F2P  = '@d17'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU DIAS'
  Qp24:F2P  = '@n-7'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'CONDICION'
  Qp24:F2P  = '@s10'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU DESCRIPCION'
  Qp24:F2P  = '@s120'
  Qp24:F2T  = '0'
  ADD(QPar24)
       Qp24:F2N  = 'DAU OBSERVACIONES'
  Qp24:F2P  = '@s255'
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
  GlobalErrors.SetProcedureName('ProcesarEstadosAusencias')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:hasta',Loc:hasta)                              ! Added by: BrowseBox(ABC)
  BIND('Loc:desde',Loc:desde)                              ! Added by: BrowseBox(ABC)
  BIND('Loc:estados',Loc:estados)                          ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_ESTADO',DAU:DAU_ESTADO)                    ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_NROLEG',DAU:DAU_NROLEG)                    ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_DIAS',DAU:DAU_DIAS)                        ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_CONDICION',DAU:DAU_CONDICION)              ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_DESCRIPCION',DAU:DAU_DESCRIPCION)          ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_OBSERVACIONES',DAU:DAU_OBSERVACIONES)      ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_ID',DAU:DAU_ID)                            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DETALLE_AUSENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.SetFilter('(DAU:DAU_INICIO_DATE <<= Loc:hasta AND (DAU:DAU_FIN_DATE >= Loc:desde OR NULL(DAU:DAU_FIN_DATE)) AND (Loc:estados = ''T'' OR DAU:DAU_ESTADO = Loc:estados))') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:desde)                            ! Apply the reset field
  BRW1.AddResetField(Loc:estados)                          ! Apply the reset field
  BRW1.AddResetField(Loc:hasta)                            ! Apply the reset field
  BRW1.AddResetField(Loc:total)                            ! Apply the reset field
  BRW1.SetOrder('DAU:DAU_NROLEG')
  BRW1.AddField(DAU:DAU_FECHA_DATE,BRW1.Q.DAU:DAU_FECHA_DATE) ! Field DAU:DAU_FECHA_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_NROLEG,BRW1.Q.DAU:DAU_NROLEG)      ! Field DAU:DAU_NROLEG is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_NOMBRE,BRW1.Q.EPL:EMP_NOMBRE)      ! Field EPL:EMP_NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_ESTADO,BRW1.Q.DAU:DAU_ESTADO)      ! Field DAU:DAU_ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_INICIO_DATE,BRW1.Q.DAU:DAU_INICIO_DATE) ! Field DAU:DAU_INICIO_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_FIN_DATE,BRW1.Q.DAU:DAU_FIN_DATE)  ! Field DAU:DAU_FIN_DATE is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_DIAS,BRW1.Q.DAU:DAU_DIAS)          ! Field DAU:DAU_DIAS is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_CONDICION,BRW1.Q.DAU:DAU_CONDICION) ! Field DAU:DAU_CONDICION is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_DESCRIPCION,BRW1.Q.DAU:DAU_DESCRIPCION) ! Field DAU:DAU_DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_OBSERVACIONES,BRW1.Q.DAU:DAU_OBSERVACIONES) ! Field DAU:DAU_OBSERVACIONES is a hot field or requires assignment from browse
  BRW1.AddField(DAU:DAU_ID,BRW1.Q.DAU:DAU_ID)              ! Field DAU:DAU_ID is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:estados = 'P'
     Loc:total = RECORDS(BRW1.Q)
  END
  IF Loc:estados = 'V'
     Loc:total = RECORDS(BRW1.Q)
  END
  IF Loc:estados = 'T'
     Loc:total = RECORDS(BRW1.Q)
  END
  IF Loc:estados = 'A'
     Loc:total = RECORDS(BRW1.Q)
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
  Loc:desde = date(MONTH(today()),01,year(today()))
  Loc:hasta = today()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_AUSENCIA.Close
    Relate:EMPLEADOS.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
    Loc:total = RECORDS(BRW1.Q)
    ThisWindow.Reset(1)
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?EvoExportar
        Loc:titulo = 'ESTADOS AUSENCIAS - DESDE: ' & format(Loc:desde,@d17) & ' HASTA: ' & format(Loc:hasta,@d17)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:desde
      ThisWindow.Reset(1)
    OF ?Loc:hasta
      ThisWindow.Reset(1)
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
    OF ?Loc:estados
      IF Loc:estados = 'P'
         Loc:total = RECORDS(BRW1.Q)
      END
      IF Loc:estados = 'V'
         Loc:total = RECORDS(BRW1.Q)
      END
      IF Loc:estados = 'T'
         Loc:total = RECORDS(BRW1.Q)
      END
      IF Loc:estados = 'A'
         Loc:total = RECORDS(BRW1.Q)
      END
      ThisWindow.Reset()
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
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(EditInPlace::DAU:DAU_FECHA_DATE,1)
  SELF.AddEditControl(EditInPlace::DAU:DAU_NROLEG,2)
  SELF.AddEditControl(EditInPlace::EPL:EMP_NOMBRE,3)
  SELF.AddEditControl(EditInPlace::DAU:DAU_ESTADO,4)
  SELF.AddEditControl(EditInPlace::DAU:DAU_INICIO_DATE,5)
  SELF.AddEditControl(EditInPlace::DAU:DAU_FIN_DATE,6)
  SELF.AddEditControl(EditInPlace::DAU:DAU_DIAS,7)
  SELF.AddEditControl(EditInPlace::DAU:DAU_CONDICION,8)
  SELF.AddEditControl(EditInPlace::DAU:DAU_DESCRIPCION,9)
  SELF.AddEditControl(EditInPlace::DAU:DAU_OBSERVACIONES,10)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.InitSort PROCEDURE(BYTE NewOrder)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.InitSort(NewOrder)
    Loc:total = RECORDS(BRW1.Q)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
AusenciaPorSector PROCEDURE 

Loc:str              STRING(4000)                          !
Loc:total            LONG                                  !
Loc:descripcion      STRING(40)                            !
Loc:motivo_id        STRING(10)                            !
Loc:legajo           SHORT                                 !
Loc:sector           STRING(40)                            !
Loc:sector_id        STRING(20)                            !
Loc:ini              STRING(@D12)                          !
Loc:fin              STRING(@D12)                          !
Loc:Titulo           STRING(100)                           !
Loc:opcion           BYTE                                  !
Loc:opcion_sec       BYTE                                  !
QAusencias           QUEUE,PRE()                           !
QLegajo              LONG                                  !
QNombre              STRING(50)                            !
QConvenio            STRING(15)                            !
QInicio              DATE                                  !
QFin                 DATE                                  !
QDias                BYTE                                  !
QMotivo              STRING(20)                            !
QObservaciones       CSTRING(256)                          !
QCodigo              STRING(5)                             !
QDescripcion         STRING(255)                           !
QMedico              STRING(30)                            !
QObservacion         STRING(255)                           !
                     END                                   !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Ausencias por Sector'),AT(,,465,300),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaPorSector'), |
  STATUS(-1,50,100,65,-1),SYSTEM
                       GROUP,AT(5,1,455,42),USE(?GROUP1),FONT(,,,FONT:bold),BOXED
                         OPTION,AT(10,10,120,14),USE(Loc:opcion),FONT(,,COLOR:Red,FONT:bold),TRN
                           RADIO('Por Fecha'),AT(12,12,48),USE(?OPTION1:RADIO1),FONT(,,,FONT:bold),VALUE('1')
                           RADIO('Por Rango'),AT(72,12,48),USE(?OPTION1:RADIO2),VALUE('2')
                         END
                         ENTRY(@D06B),AT(10,28,45,9),USE(Loc:ini),CENTER
                         BUTTON,AT(58,27,10,10),USE(?Calendar),ICON('almanaque.ico')
                         ENTRY(@D06B),AT(72,28,45,9),USE(Loc:fin),CENTER
                         BUTTON,AT(120,27,10,10),USE(?Calendar:2),ICON('almanaque.ico')
                         BUTTON('E&xportar'),AT(406,10,50,12),USE(?EvoExportar),FONT(,,,FONT:regular),LEFT,ICON('export.ico'), |
  CURSOR('mano.cur'),FLAT
                         BUTTON('Procesar'),AT(406,26,50,12),USE(?Procesar),FONT(,,,FONT:regular),LEFT,ICON(ICON:Zoom), |
  FLAT
                         BUTTON('Sector'),AT(152,26,38,14),USE(?CallLookup)
                         ENTRY(@s50),AT(194,26,186,13),USE(SEC:SEC_SECTOR),FONT(,13,,FONT:bold),READONLY
                         OPTION,AT(152,10,106,14),USE(Loc:opcion_sec),TRN
                           RADIO('Todos'),AT(160,12),USE(?OPTION1:RADIO3),FONT(,,00006400h),VALUE('1')
                           RADIO('Por Sector'),AT(202,12,51,10),USE(?OPTION1:RADIO4),FONT(,,00006400h),VALUE('2')
                         END
                       END
                       LIST,AT(5,46,455,250),USE(QAusencias),HVSCROLL,FLAT,FORMAT('24R(1)|~Legajo~C(0)@N05B@12' & |
  '0L(1)|M~Nombre~C(0)@s50@50L(1)|~Convenio~C(0)@s15@35C|~Inicio~@D06B@35C|~Fin~@D06B@1' & |
  '6C|~Días~@N_2@65L(1)|~Motivo~C(0)@s20@120L(1)|M~Observaciones~C(0)@s255@25C(1)|~Códi' & |
  'go~C(0)@s5@120L(1)|M~Descripción~C(0)@s255@65L(1)|M~Médico/a~C(0)@s30@150L(1)|M~Obse' & |
  'rvación Médica~C(0)@s255@'),FROM(QAusencias)
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
Open                   PROCEDURE(),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar5            CalendarClass
Calendar4            CalendarClass

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
 Q1:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
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
 ADD(QPar1)   ! 29 infoper025.clw
!!!!!


 FREE(QPar21)
      Qp21:F2N  = 'Legajo'
 Qp21:F2P  = '@N06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Nombre'
 Qp21:F2P  = '@s50'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Convenio'
 Qp21:F2P  = '@s15'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Inicio'
 Qp21:F2P  = '@D06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Fin'
 Qp21:F2P  = '@D06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Días'
 Qp21:F2P  = '@N_2'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Motivo'
 Qp21:F2P  = '@s20'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observaciones'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Código'
 Qp21:F2P  = '@s5'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Descripción'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Médico/a'
 Qp21:F2P  = '@s30'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observación Médica'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
 SysRec# = false
 FREE(Loc::QHlist1)
 LOOP
    SysRec# += 1
    IF ?QAusencias{PROPLIST:Exists,SysRec#} = 1
        GET(QPar21,SysRec#)
        QHL1:Id      = SysRec#
        QHL1:Nombre  = Qp21:F2N
        QHL1:Longitud= ?QAusencias{PropList:Width,SysRec#}  /2
        QHL1:Pict    = Qp21:F2P
        QHL1:Tot    = Qp21:F2T
        ADD(Loc::QHlist1)
     Else
       break
    END
 END
 Loc::Titulo1 =Loc:Titulo

 SavPath1 = PATH()

  Exportar(Loc::QHlist1,QAusencias,QPar1,0,Loc::Titulo1,Evo::Group1)
 SETPATH(SavPath1)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('AusenciaPorSector')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OPTION1:RADIO1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:SECTOR.Open                                       ! File SECTOR used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:opcion = '1'
     Loc:ini = TODAY()
     Loc:fin = ''
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     DISABLE(?Loc:fin)
     DISABLE(?Calendar:2)
  END
  IF Loc:opcion <> '1'
     Loc:ini = ''
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     ENABLE(?Loc:fin)
     ENABLE(?Calendar:2)
  END
  IF Loc:opcion = '2'
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     ENABLE(?Loc:fin)
     ENABLE(?Calendar:2)
  END
  IF Loc:opcion <> '2'
     DISABLE(?Loc:fin)
     DISABLE(?Calendar:2)
  END
  IF Loc:opcion_sec = '1'
     DISABLE(?SEC:SEC_SECTOR)
     ENABLE(?Procesar)
     DISABLE(?CallLookup)
  END
  IF Loc:opcion_sec <> '1'
     ENABLE(?SEC:SEC_SECTOR)
     ENABLE(?CallLookup)
  END
  IF Loc:opcion_sec = '2'
     ENABLE(?SEC:SEC_SECTOR)
     ENABLE(?Procesar)
     ENABLE(?CallLookup)
  END
  IF Loc:opcion_sec <> '2'
     DISABLE(?SEC:SEC_SECTOR)
     DISABLE(?CallLookup)
  END
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
    Relate:SECTOR.Close
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !Estado de botones al iniciar el procedure
  DISABLE(?Loc:ini)
  DISABLE(?Calendar)
  DISABLE(?EvoExportar)
  DISABLE(?Procesar)


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
    OF ?Procesar
      !Lógica de control de datos a consultar
      IF Loc:opcion = 2 THEN
          IF Loc:opcion_sec = 2 THEN
              IF Loc:fin = '' OR SEC:SEC_SECTOR = '' THEN
                  MESSAGE('Revisar datos!')
                  CYCLE
              END
          ELSE !Loc:opcion_sec = 1
              IF Loc:fin = '' THEN
                  MESSAGE('Revisar datos!')
                  CYCLE
              END
          END
      ELSE !Loc:opcion = 1
          IF Loc:opcion_sec = 2 AND SEC:SEC_SECTOR = '' THEN
              MESSAGE('Revisar datos!')
              CYCLE
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:opcion
      IF Loc:opcion = '1'
         Loc:ini = TODAY()
         Loc:fin = ''
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         DISABLE(?Loc:fin)
         DISABLE(?Calendar:2)
      END
      IF Loc:opcion <> '1'
         Loc:ini = ''
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         ENABLE(?Loc:fin)
         ENABLE(?Calendar:2)
      END
      IF Loc:opcion = '2'
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         ENABLE(?Loc:fin)
         ENABLE(?Calendar:2)
      END
      IF Loc:opcion <> '2'
         DISABLE(?Loc:fin)
         DISABLE(?Calendar:2)
      END
      ThisWindow.Reset()
    OF ?Calendar
      ThisWindow.Update()
      Calendar5.SelectOnClose = True
      Calendar5.Ask('Seleccionar Fecha',Loc:ini)
      IF Calendar5.Response = RequestCompleted THEN
      Loc:ini=Calendar5.SelectedDate
      DISPLAY(?Loc:ini)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar4.SelectOnClose = True
      Calendar4.Ask('Seleccionar Fecha',Loc:fin)
      IF Calendar4.Response = RequestCompleted THEN
      Loc:fin=Calendar4.SelectedDate
      DISPLAY(?Loc:fin)
      END
      ThisWindow.Reset(True)
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExQueue1
    OF ?Procesar
      ThisWindow.Update()
      IF Loc:opcion_sec = 1 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Ausencias del día'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN > <39>' & loc:ini & '<39>) '&|
                        'OR (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN IS NULL) '&|
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Ausencias Generales'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE (<39>' & loc:fin & '<39> >= DAU_INICIO AND <39>' & loc:ini & '<39> < DAU_FIN) '&|
                        'OR (<39>' & loc:fin & '<39> >= DAU_INICIO AND DAU_FIN IS NULL) '&|          
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          END    
      ELSIF Loc:opcion_sec = 2 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Ausencias del día'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE SEC_ID = ' & Loc:sector_id & ' '&|
                        'AND ((DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN > <39>' & loc:ini & '<39>) '&|
                        'OR (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN IS NULL)) '&|
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Ausencias Generales'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE SEC_ID = ' & Loc:sector_id & ' '&|
                        'AND ((<39>' & loc:fin & '<39> >= DAU_INICIO AND <39>' & loc:ini & '<39> < DAU_FIN) '&|
                        'OR (<39>' & loc:fin & '<39> >= DAU_INICIO AND DAU_FIN IS NULL)) '&|          
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          END
      END
          
      SETCLIPBOARD(Loc:str)
      TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
      
      IF ERRORCODE() THEN STOP(FILEERRORCODE()).
      
      FREE(QAusencias)
      LOOP
      	NEXT(TMPUsosMultiples)
          IF ERRORCODE() THEN BREAK.
              QAusencias:QLegajo = TUM:Col01
              QAusencias:QNombre = TUM:Col02
      !        QAusencias:QSector = TUM:Col03
              QAusencias:QConvenio = TUM:Col03
              QAusencias:QInicio = DEFormat(TUM:Col04,@d012)
              QAusencias:QFin = DEFormat(TUM:Col05,@d012)
              QAusencias:QDias = TUM:Col06
              QAusencias:QMotivo = TUM:Col07
              QAusencias:QObservaciones = TUM:Col08
              QAusencias:QCodigo = TUM:Col09
              QAusencias:QDescripcion = TUM:Col10
              QAusencias:QMedico = TUM:Col11
              QAusencias:QObservacion = TUM:Col12
      	ADD(QAusencias)
      END !Loop
      !Loc:total = RECORDS(QAusencias)
      !MESSAGE(Loc:total)
      IF RECORDS(QAusencias) > 0 THEN
          ENABLE(?EvoExportar)
      ELSE
          DISABLE(?EvoExportar)
      END
      !DISPLAY()
    OF ?CallLookup
      ThisWindow.Update()
      SEC:SEC_SECTOR = SEC:SEC_SECTOR
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SEC:SEC_SECTOR = SEC:SEC_SECTOR
        Loc:sector_id = SEC:SEC_ID
      END
      ThisWindow.Reset(1)
    OF ?SEC:SEC_SECTOR
      IF SEC:SEC_SECTOR OR ?SEC:SEC_SECTOR{PROP:Req}
        SEC:SEC_SECTOR = SEC:SEC_SECTOR
        IF Access:SECTOR.TryFetch(SEC:PK_NOMBRE)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            SEC:SEC_SECTOR = SEC:SEC_SECTOR
            Loc:sector_id = SEC:SEC_ID
          ELSE
            CLEAR(Loc:sector_id)
            SELECT(?SEC:SEC_SECTOR)
            CYCLE
          END
        ELSE
          Loc:sector_id = SEC:SEC_ID
        END
      END
      ThisWindow.Reset()
    OF ?Loc:opcion_sec
      IF Loc:opcion_sec = '1'
         DISABLE(?SEC:SEC_SECTOR)
         ENABLE(?Procesar)
         DISABLE(?CallLookup)
      END
      IF Loc:opcion_sec <> '1'
         ENABLE(?SEC:SEC_SECTOR)
         ENABLE(?CallLookup)
      END
      IF Loc:opcion_sec = '2'
         ENABLE(?SEC:SEC_SECTOR)
         ENABLE(?Procesar)
         ENABLE(?CallLookup)
      END
      IF Loc:opcion_sec <> '2'
         DISABLE(?SEC:SEC_SECTOR)
         DISABLE(?CallLookup)
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


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
  !IF QAusencias <= 0 THEN
  !    DISABLE(?MAU:MAU_DESCRIPCION)
  !    DISABLE(?Filtrar)
  !END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?OPTION1:RADIO3
      SEC:SEC_SECTOR = ''
    END
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
!!! Window
!!! </summary>
AusenciaPorMotivo PROCEDURE 

Loc:str              STRING(4000)                          !
Loc:total            LONG                                  !
Loc:descripcion      STRING(40)                            !
Loc:motivo_id        STRING(10)                            !
Loc:legajo           SHORT                                 !
Loc:sector           STRING(40)                            !
Loc:sector_id        STRING(20)                            !
Loc:ini              STRING(@D12)                          !
Loc:fin              STRING(@D12)                          !
Loc:Titulo           STRING(100)                           !
Loc:opcion           BYTE                                  !
Loc:opcion_mot       BYTE                                  !
QAusencias           QUEUE,PRE()                           !
QLegajo              LONG                                  !
QNombre              STRING(50)                            !
QSector              STRING(40)                            !
QConvenio            STRING(15)                            !
QInicio              DATE                                  !
QFin                 DATE                                  !
QDias                BYTE                                  !
QObservaciones       CSTRING(256)                          !
QCodigo              STRING(5)                             !
QDescripcion         STRING(255)                           !
QMedico              STRING(30)                            !
QObservacion         STRING(255)                           !
                     END                                   !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Ausencias por Fecha'),AT(,,465,300),FONT('Microsoft Sans Serif',10,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaPorSector'),STATUS(-1,50,100, |
  65,-1),SYSTEM
                       GROUP,AT(5,1,455,42),USE(?GROUP1),FONT(,,,FONT:bold),BOXED
                         OPTION,AT(10,10,120,14),USE(Loc:opcion),FONT(,,COLOR:Red,FONT:bold),TRN
                           RADIO('Por Fecha'),AT(12,12,48),USE(?OPTION1:RADIO1),FONT(,,,FONT:bold),VALUE('1')
                           RADIO('Por Rango'),AT(72,12,48),USE(?OPTION1:RADIO2),VALUE('2')
                         END
                         ENTRY(@D06B),AT(10,28,45,9),USE(Loc:ini),CENTER
                         BUTTON,AT(58,27,10,10),USE(?Calendar),ICON('almanaque.ico')
                         ENTRY(@D06B),AT(72,28,45,9),USE(Loc:fin),CENTER
                         BUTTON,AT(120,27,10,10),USE(?Calendar:2),ICON('almanaque.ico')
                         BUTTON('E&xportar'),AT(406,10,50,12),USE(?EvoExportar),FONT(,,,FONT:regular),LEFT,ICON('export.ico'), |
  CURSOR('mano.cur'),FLAT
                         BUTTON('Procesar'),AT(406,26,50,12),USE(?Procesar),FONT(,,,FONT:regular),LEFT,ICON(ICON:Zoom), |
  FLAT
                         BUTTON('Motivo'),AT(152,26,38,14),USE(?CallLookup)
                         ENTRY(@s25),AT(194,26,186,13),USE(MAU:MAU_DESCRIPCION),FONT(,13,,FONT:bold),READONLY
                         OPTION,AT(152,10,106,14),USE(Loc:opcion_mot),TRN
                           RADIO('Todos'),AT(160,12),USE(?OPTION1:RADIO3),FONT(,,00006400h),VALUE('1')
                           RADIO('Por Motivo'),AT(202,12,51,10),USE(?OPTION1:RADIO4),FONT(,,00006400h),VALUE('2')
                         END
                       END
                       LIST,AT(5,46,455,250),USE(QAusencias),HVSCROLL,FLAT,FORMAT('24R(1)|~Legajo~C(0)@N05B@12' & |
  '0L(1)|M~Nombre~C(0)@s50@130L(1)|~Sector~C(0)@s40@50L(1)|~Convenio~C(0)@s15@35C|~Inic' & |
  'io~@D06B@35C|~Fin~@D06B@16C|~Días~@N_2@120L(1)|M~Observaciones~C(0)@s255@25C(1)|~Cód' & |
  'igo~C(0)@s5@120L(1)|M~Descripción~C(0)@s255@65L(1)|M~Médico/a~C(0)@s30@150L(1)|M~Obs' & |
  'ervación Médica~C(0)@s255@'),FROM(QAusencias)
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
Open                   PROCEDURE(),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Calendar5            CalendarClass
Calendar4            CalendarClass

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
 Q1:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
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
 ADD(QPar1)   ! 29 infoper025.clw
!!!!!


 FREE(QPar21)
      Qp21:F2N  = 'Legajo'
 Qp21:F2P  = '@N06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Nombre'
 Qp21:F2P  = '@s50'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Sector'
 Qp21:F2P  = '@s40'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Convenio'
 Qp21:F2P  = '@s15'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Inicio'
 Qp21:F2P  = '@D06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Fin'
 Qp21:F2P  = '@D06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Días'
 Qp21:F2P  = '@N_2'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observaciones'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Código'
 Qp21:F2P  = '@s5'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Descripción'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Médico/a'
 Qp21:F2P  = '@s30'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Observación Médica'
 Qp21:F2P  = '@s255'
 Qp21:F2T  = '0'
 ADD(QPar21)
 SysRec# = false
 FREE(Loc::QHlist1)
 LOOP
    SysRec# += 1
    IF ?QAusencias{PROPLIST:Exists,SysRec#} = 1
        GET(QPar21,SysRec#)
        QHL1:Id      = SysRec#
        QHL1:Nombre  = Qp21:F2N
        QHL1:Longitud= ?QAusencias{PropList:Width,SysRec#}  /2
        QHL1:Pict    = Qp21:F2P
        QHL1:Tot    = Qp21:F2T
        ADD(Loc::QHlist1)
     Else
       break
    END
 END
 Loc::Titulo1 =Loc:Titulo

 SavPath1 = PATH()

  Exportar(Loc::QHlist1,QAusencias,QPar1,0,Loc::Titulo1,Evo::Group1)
 SETPATH(SavPath1)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('AusenciaPorMotivo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OPTION1:RADIO1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:MOTIVO_AUSENCIA.Open                              ! File MOTIVO_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:opcion = '1'
     Loc:ini = TODAY()
     Loc:fin = ''
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     DISABLE(?Loc:fin)
     DISABLE(?Calendar:2)
  END
  IF Loc:opcion <> '1'
     Loc:ini = ''
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     ENABLE(?Loc:fin)
     ENABLE(?Calendar:2)
  END
  IF Loc:opcion = '2'
     ENABLE(?Loc:ini)
     ENABLE(?Calendar)
     ENABLE(?Loc:fin)
     ENABLE(?Calendar:2)
  END
  IF Loc:opcion <> '2'
     DISABLE(?Loc:fin)
     DISABLE(?Calendar:2)
  END
  IF Loc:opcion_mot = '1'
     DISABLE(?MAU:MAU_DESCRIPCION)
     ENABLE(?Procesar)
     DISABLE(?CallLookup)
  END
  IF Loc:opcion_mot <> '1'
     ENABLE(?MAU:MAU_DESCRIPCION)
     ENABLE(?CallLookup)
  END
  IF Loc:opcion_mot = '2'
     ENABLE(?MAU:MAU_DESCRIPCION)
     ENABLE(?Procesar)
     ENABLE(?CallLookup)
  END
  IF Loc:opcion_mot <> '2'
     DISABLE(?MAU:MAU_DESCRIPCION)
     DISABLE(?CallLookup)
  END
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:MOTIVO_AUSENCIA.Close
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !Estado de botones al iniciar el procedure
  DISABLE(?Loc:ini)
  DISABLE(?Calendar)
  DISABLE(?EvoExportar)
  DISABLE(?Procesar)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Motivos
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
    OF ?Procesar
      !Lógica de control de datos a consultar
      IF Loc:opcion = 2 THEN
          IF Loc:opcion_mot = 2 THEN
              IF Loc:fin = '' OR MAU:MAU_DESCRIPCION = '' THEN
                  MESSAGE('Revisar datos!')
                  CYCLE
              END
          ELSE !Loc:opcion_mot = 1
              IF Loc:fin = '' THEN
                  MESSAGE('Revisar datos!')
                  CYCLE
              END
          END
      ELSE !Loc:opcion = 1
          IF Loc:opcion_mot = 2 AND MAU:MAU_DESCRIPCION = '' THEN
              MESSAGE('Revisar datos!')
              CYCLE
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:opcion
      IF Loc:opcion = '1'
         Loc:ini = TODAY()
         Loc:fin = ''
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         DISABLE(?Loc:fin)
         DISABLE(?Calendar:2)
      END
      IF Loc:opcion <> '1'
         Loc:ini = ''
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         ENABLE(?Loc:fin)
         ENABLE(?Calendar:2)
      END
      IF Loc:opcion = '2'
         ENABLE(?Loc:ini)
         ENABLE(?Calendar)
         ENABLE(?Loc:fin)
         ENABLE(?Calendar:2)
      END
      IF Loc:opcion <> '2'
         DISABLE(?Loc:fin)
         DISABLE(?Calendar:2)
      END
      ThisWindow.Reset()
    OF ?Calendar
      ThisWindow.Update()
      Calendar5.SelectOnClose = True
      Calendar5.Ask('Seleccionar Fecha',Loc:ini)
      IF Calendar5.Response = RequestCompleted THEN
      Loc:ini=Calendar5.SelectedDate
      DISPLAY(?Loc:ini)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar4.SelectOnClose = True
      Calendar4.Ask('Seleccionar Fecha',Loc:fin)
      IF Calendar4.Response = RequestCompleted THEN
      Loc:fin=Calendar4.SelectedDate
      DISPLAY(?Loc:fin)
      END
      ThisWindow.Reset(True)
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExQueue1
    OF ?Procesar
      ThisWindow.Update()
      IF Loc:opcion_mot = 1 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Ausencias del día'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN > <39>' & loc:ini & '<39>) '&|
                        'OR (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN IS NULL) '&|
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Ausencias Generales'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_DESCRIPCION AS MOTIVO, DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE (<39>' & loc:fin & '<39> >= DAU_INICIO AND <39>' & loc:ini & '<39> < DAU_FIN) '&|
                        'OR (<39>' & loc:fin & '<39> >= DAU_INICIO AND DAU_FIN IS NULL) '&|          
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          END    
      ELSIF Loc:opcion_mot = 2 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Ausencias del día'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE DAU_MOTIVO = <39>' & Loc:motivo_id & '<39> '&|
                        'AND ((DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN > <39>' & loc:ini & '<39>) '&|
                        'OR (DAU_INICIO <= <39>' & loc:ini & '<39> AND DAU_FIN IS NULL)) '&|
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Ausencias Generales'
              Loc:str = 'SELECT DAU_NROLEG AS LEGAJO, EMP_NOMBRE AS NOMBRE, SEC_SECTOR AS SECTOR, CONV_CONVENIO AS CONVENIO, '&|
                        'CONVERT(VARCHAR, DAU_INICIO, 112) AS INICIO, CONVERT(VARCHAR, DAU_FIN, 112) AS FIN, DAU_DIAS AS DIAS, '&|
                        'DAU_OBSERVACIONES AS OBSERVACIONES, '&|
                        'CME_CODIGO AS CODIGO, CME_DESCRIPCION AS DESCRIPCION, CME_MEDICO AS MEDICO,	CME_OBSERVACION AS OBSERVACION '&|
                        'FROM DETALLE_AUSENCIA '&|
                        'LEFT JOIN EMPLEADOS ON EMP_LEGAJO = DAU_NROLEG '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'LEFT JOIN CONVENIO ON CONV_ID = EMP_CONVENIO '&|
                        'LEFT JOIN CONCEPTO_MEDICO ON CME_DAU_ID = DAU_ID '&|
                        'WHERE DAU_MOTIVO = <39>' & Loc:motivo_id & '<39> '&|
                        'AND ((<39>' & loc:fin & '<39> >= DAU_INICIO AND <39>' & loc:ini & '<39> < DAU_FIN) '&|
                        'OR (<39>' & loc:fin & '<39> >= DAU_INICIO AND DAU_FIN IS NULL)) '&|          
                        'ORDER BY DAU_FECHA_UPDATE DESC '
          END
      END
          
      SETCLIPBOARD(Loc:str)
      TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
      
      IF ERRORCODE() THEN STOP(FILEERRORCODE()).
      
      FREE(QAusencias)
      LOOP
      	NEXT(TMPUsosMultiples)
          IF ERRORCODE() THEN BREAK.
              QAusencias:QLegajo = TUM:Col01
              QAusencias:QNombre = TUM:Col02
              QAusencias:QSector = TUM:Col03
              QAusencias:QConvenio = TUM:Col04
              QAusencias:QInicio = DEFormat(TUM:Col05,@d012)
              QAusencias:QFin = DEFormat(TUM:Col06,@d012)
              QAusencias:QDias = TUM:Col07
              QAusencias:QObservaciones = TUM:Col08
              QAusencias:QCodigo = TUM:Col09
              QAusencias:QDescripcion = TUM:Col10
              QAusencias:QMedico = TUM:Col11
              QAusencias:QObservacion = TUM:Col12
      	ADD(QAusencias)
      END !Loop
      !Loc:total = RECORDS(QAusencias)
      !MESSAGE(Loc:total)
      IF RECORDS(QAusencias) > 0 THEN
          ENABLE(?EvoExportar)
      ELSE
          DISABLE(?EvoExportar)
      END
      !DISPLAY()
    OF ?CallLookup
      ThisWindow.Update()
      MAU:MAU_DESCRIPCION = MAU:MAU_DESCRIPCION
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        MAU:MAU_DESCRIPCION = MAU:MAU_DESCRIPCION
        Loc:motivo_id = MAU:MAU_CODIGO
      END
      ThisWindow.Reset(1)
    OF ?MAU:MAU_DESCRIPCION
      IF MAU:MAU_DESCRIPCION OR ?MAU:MAU_DESCRIPCION{PROP:Req}
        MAU:MAU_DESCRIPCION = MAU:MAU_DESCRIPCION
        IF Access:MOTIVO_AUSENCIA.TryFetch(MAU:PK_MAU_DESCRIPCION)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            MAU:MAU_DESCRIPCION = MAU:MAU_DESCRIPCION
            Loc:motivo_id = MAU:MAU_CODIGO
          ELSE
            CLEAR(Loc:motivo_id)
            SELECT(?MAU:MAU_DESCRIPCION)
            CYCLE
          END
        ELSE
          Loc:motivo_id = MAU:MAU_CODIGO
        END
      END
      ThisWindow.Reset()
    OF ?Loc:opcion_mot
      IF Loc:opcion_mot = '1'
         DISABLE(?MAU:MAU_DESCRIPCION)
         ENABLE(?Procesar)
         DISABLE(?CallLookup)
      END
      IF Loc:opcion_mot <> '1'
         ENABLE(?MAU:MAU_DESCRIPCION)
         ENABLE(?CallLookup)
      END
      IF Loc:opcion_mot = '2'
         ENABLE(?MAU:MAU_DESCRIPCION)
         ENABLE(?Procesar)
         ENABLE(?CallLookup)
      END
      IF Loc:opcion_mot <> '2'
         DISABLE(?MAU:MAU_DESCRIPCION)
         DISABLE(?CallLookup)
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


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
  !IF QAusencias <= 0 THEN
  !    DISABLE(?MAU:MAU_DESCRIPCION)
  !    DISABLE(?Filtrar)
  !END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?OPTION1:RADIO3
      MAU:MAU_DESCRIPCION = ''
    END
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
!!! Browse the MOTIVO_AUSENCIA file
!!! </summary>
Motivos PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(MOTIVO_AUSENCIA)
                       PROJECT(MAU:MAU_CODIGO)
                       PROJECT(MAU:MAU_DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MAU:MAU_CODIGO         LIKE(MAU:MAU_CODIGO)           !List box control field - type derived from field
MAU:MAU_DESCRIPCION    LIKE(MAU:MAU_DESCRIPCION)      !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Motivos'),AT(,,260,280),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Motivos'),SYSTEM
                       LIST,AT(10,25,240,245),USE(?Browse:1),HVSCROLL,FORMAT('30C|~CÓD.~@s5@80L(1)|M~DESCRIPCI' & |
  'ÓN~C(0)@s25@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the MOTIVO_AUSENCIA file')
                       BUTTON('&Select'),AT(9,259,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(5,5,250,270),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                       STRING(@s25),AT(34,7,125),USE(MAU:MAU_DESCRIPCION),FONT(,,COLOR:Red,FONT:bold)
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
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
  GlobalErrors.SetProcedureName('Motivos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('MAU:MAU_CODIGO',MAU:MAU_CODIGO)                    ! Added by: BrowseBox(ABC)
  BIND('MAU:MAU_DESCRIPCION',MAU:MAU_DESCRIPCION)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:MOTIVO_AUSENCIA.Open                              ! File MOTIVO_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:MOTIVO_AUSENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,MAU:PK_MAU_CODIGO)                    ! Add the sort order for MAU:PK_MAU_CODIGO for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,MAU:MAU_CODIGO,,BRW1)          ! Initialize the browse locator using  using key: MAU:PK_MAU_CODIGO , MAU:MAU_CODIGO
  BRW1.AddField(MAU:MAU_CODIGO,BRW1.Q.MAU:MAU_CODIGO)      ! Field MAU:MAU_CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(MAU:MAU_DESCRIPCION,BRW1.Q.MAU:MAU_DESCRIPCION) ! Field MAU:MAU_DESCRIPCION is a hot field or requires assignment from browse
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
    Relate:MOTIVO_AUSENCIA.Close
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Report MÉDICOS File
!!! </summary>
ReporteMedico PROCEDURE (long id,short legajo)

Progress:Thermometer BYTE                                  !
Loc:diaLetra         STRING(20)                            !
Loc:id               LONG                                  !
Loc:legajo           SHORT                                 !
Process:View         VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_DIRECCION)
                       PROJECT(EPL:EMP_EMAIL)
                       PROJECT(EPL:EMP_LEGAJO)
                       PROJECT(EPL:EMP_NOMBRE)
                       PROJECT(EPL:EMP_NRO_CEL)
                       PROJECT(EPL:EMP_NRO_TEL)
                       PROJECT(EPL:EMP_CONVENIO)
                       PROJECT(EPL:EMP_SECTOR)
                       JOIN(CON:PK_CONVENIO,EPL:EMP_CONVENIO)
                         PROJECT(CON:CONV_CONVENIO)
                       END
                       JOIN(SEC:PK_SECTOR,EPL:EMP_SECTOR)
                         PROJECT(SEC:SEC_SECTOR)
                       END
                       JOIN(DETALLE_AUSENCIA,'EPL:EMP_LEGAJO = DAU:DAU_NROLEG')
                         PROJECT(DAU:DAU_DESCRIPCION)
                         PROJECT(DAU:DAU_DIAS)
                         PROJECT(DAU:DAU_FIN_DATE)
                         PROJECT(DAU:DAU_INICIO_DATE)
                         PROJECT(DAU:DAU_ID)
                         JOIN(CME:FK_CME_DAU_ID,DAU:DAU_ID)
                           PROJECT(CME:CME_CODIGO)
                           PROJECT(CME:CME_DESCRIPCION)
                         END
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Report EMPLEADOS'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('EMPLEADOS Report'),AT(250,650,7750,10354),PRE(RPT),PAPER(PAPER:A4),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,300),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Reporte Médico'),AT(0,0,7750,292),USE(?ReportTitle),FONT('Microsoft Sans Serif',14, |
  ,FONT:bold,CHARSET:DEFAULT),CENTER
                       END
Detail                 DETAIL,AT(0,-100,8000,4750),USE(?Detail)
                         IMAGE('CP.gif'),AT(200,150,1437,1687),USE(?IMAGE1)
                         STRING('Lugar :'),AT(1792,146,583,240),USE(?STRING1),FONT(,12,,FONT:bold)
                         STRING('General Pico'),AT(2437,146,975),USE(?STRING2),FONT(,12)
                         STRING('Fecha :'),AT(3542,146,,240),USE(?STRING3),FONT(,12,,FONT:bold)
                         STRING(@d17),AT(4229,146,896),USE(DAU:DAU_INICIO_DATE),FONT(,12),CENTER
                         STRING('Legajo :'),AT(1792,437,677,240),USE(?HeaderTitle:1),FONT(,12,,FONT:bold),TRN
                         STRING(@N_5),AT(2521,437,540,240),USE(EPL:EMP_LEGAJO),FONT(,12),CENTER
                         STRING('Nombre :'),AT(3187,437,760,240),USE(?HeaderTitle:2),FONT(,12,,FONT:bold),TRN
                         STRING(@s31),AT(4000,437,3719,240),USE(EPL:EMP_NOMBRE),FONT(,12),LEFT
                         STRING('Dirección :'),AT(1792,729,885,240),USE(?HeaderTitle:3),FONT(,12,,FONT:bold),TRN
                         STRING(@s25),AT(2729,729,2667,240),USE(EPL:EMP_DIRECCION),FONT(,12),LEFT
                         STRING('Tel. :'),AT(1792,1021,400,240),USE(?HeaderTitle:4),FONT(,12,,FONT:bold),TRN
                         STRING(@s14),AT(2240,1021,1365,240),USE(EPL:EMP_NRO_TEL),FONT(,12),LEFT
                         STRING('Cel. :'),AT(3698,1021,400,240),USE(?HeaderTitle:6),FONT(,12,,FONT:bold),TRN
                         STRING(@s15),AT(4146,1021,1448,240),USE(EPL:EMP_NRO_CEL),FONT(,12),LEFT
                         STRING('e-mail :'),AT(1792,1312,620,240),USE(?HeaderTitle:8),FONT(,12,,FONT:bold),TRN
                         STRING(@s50),AT(2458,1312,4927,240),USE(EPL:EMP_EMAIL),FONT(,12),LEFT
                         STRING('Convenio :'),AT(1792,1594,885,240),USE(?HeaderTitle:9),FONT(,12,,FONT:bold),TRN
                         STRING(@s21),AT(2729,1594,1180,240),USE(CON:CONV_CONVENIO),FONT(,12),LEFT
                         STRING('Sector:'),AT(4000,1594,646,240),USE(?HeaderTitle:10),FONT(,12,,FONT:bold),TRN
                         STRING(@s50),AT(4687,1594,2863,240),USE(SEC:SEC_SECTOR),FONT(,12),LEFT
                         LINE,AT(198,1896,7333,0),USE(?LINE1),LINEWIDTH(2)
                         STRING('Diagnóstico :'),AT(200,2130,1080),USE(?STRING4),FONT(,12,,FONT:bold)
                         LINE,AT(1312,2365,396,0),USE(?LINE2),LINEWIDTH(1)
                         STRING('Inasistencias Justificadas desde:'),AT(200,2630,2750),USE(?STRING5),FONT(,12,,FONT:bold)
                         LINE,AT(2958,2854,1479,0),USE(?LINE3),LINEWIDTH(1)
                         STRING('hasta:'),AT(4583,2635,500),USE(?STRING6),FONT(,12,,FONT:bold)
                         LINE,AT(5187,2854,1479,0),USE(?LINE4),LINEWIDTH(1)
                         STRING('inclusive.-'),AT(6717,2635),USE(?STRING7),FONT(,12,,FONT:bold)
                         STRING('Días certificados por médico/a cabecera :'),AT(200,3130,3430),USE(?STRING8),FONT(, |
  12,,FONT:bold)
                         LINE,AT(3646,3365,3896,0),USE(?LINE5),LINEWIDTH(1)
                         LINE,AT(4354,4240,3198,0),USE(?LINE6),LINEWIDTH(1)
                         STRING('Firma Doctor/a'),AT(5323,4312),USE(?STRING9),FONT(,12,,FONT:bold)
                         LINE,AT(0,0,0,4729),USE(?LINE7),LINEWIDTH(2)
                         LINE,AT(7750,0,0,4729),USE(?LINE8),LINEWIDTH(2)
                         LINE,AT(0,0,7729,0),USE(?LINE9),LINEWIDTH(2)
                         LINE,AT(0,4750,7729,0),USE(?LINE10),LINEWIDTH(2)
                         STRING('Motivo :'),AT(5323,146,635,240),USE(?STRING10),FONT(,12,,FONT:bold)
                         STRING(@s120),AT(6021,146,1365,240),USE(DAU:DAU_DESCRIPCION),FONT(,12),LEFT
                         LINE,AT(1760,2240,73,0),USE(?LINE11)
                         LINE,AT(1312,2365,6240,0),USE(?LINE12)
                       END
                       FORM,AT(250,-100,8000,4750),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING(@d17),AT(3104,3292),USE(DAU:DAU_INICIO_DATE,,?DAU:DAU_INICIO_DATE:2),FONT(,14,,FONT:bold), |
  CENTER
                         STRING(@D17B),AT(5333,3292),USE(DAU:DAU_FIN_DATE),FONT(,14,,FONT:bold),CENTER
                         STRING(@s3),AT(1292,2781),USE(CME:CME_CODIGO),FONT(,14,,FONT:bold),CENTER
                         STRING(@N_3B),AT(3500,3767),USE(DAU:DAU_DIAS),FONT(,16,,FONT:bold),RIGHT
                         STRING(@s20),AT(3990,3767),USE(Glo:diaLetra),FONT(,16,,FONT:bold),LEFT
                         TEXT,AT(1865,2792,5700,568),USE(CME:CME_DESCRIPCION),FONT(,12)
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
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
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
  GlobalErrors.SetProcedureName('ReporteMedico')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Loc:legajo',Loc:legajo)                            ! Added by: Report
  BIND('Loc:id',Loc:id)                                    ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:EMPLEADOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, EPL:EMP_LEGAJO)
  ThisReport.AddSortOrder(EPL:PK_EMPLEADOS)
  ThisReport.SetFilter('EPL:EMP_LEGAJO = Loc:legajo AND DAU:DAU_ID = Loc:id')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = 'Reporte MÉDICO'
  Relate:EMPLEADOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  Loc:legajo = legajo
  Loc:id = id
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
    Relate:DETALLE_AUSENCIA.Close
    Relate:EMPLEADOS.Close
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  IF CME:CME_CODIGO = '' THEN
      SETTARGET(Report)
      ?LINE2{PROP:Hide} = 1
      ?LINE11{PROP:Hide} = 1
      ?LINE12{PROP:Hide} = 0
      SETTARGET()      
  ELSE
      SETTARGET(Report)
      ?LINE2{PROP:Hide} = 0
      ?LINE11{PROP:Hide} = 0
      ?LINE12{PROP:Hide} = 1
      SETTARGET()
  END
  PRINT(RPT:Detail)
  RETURN ReturnValue


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
FechasCumpleaños PROCEDURE 

Loc:legajo           SHORT                                 !
Loc:mes              BYTE                                  !
Loc:meses            STRING(12)                            !
Loc:opcion           BYTE                                  !
Loc:opcion_emp       BYTE                                  !
Loc:str              STRING(4000)                          !
Loc:Titulo           STRING(100)                           !
Loc:total            LONG                                  !
QEmpleados           QUEUE,PRE()                           !
QLegajo              SHORT                                 !
QNombre              STRING(50)                            !
QFecha               DATE                                  !
QSector              STRING(40)                            !
QTel                 CSTRING(15)                           !
QCel                 CSTRING(16)                           !
QDireccion           STRING(80)                            !
                     END                                   !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Fechas de Cumpleaños'),AT(,,465,300),FONT('Microsoft Sans Serif',10,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('LicenciaPorSector'), |
  STATUS(-1,50,100,65,-1),SYSTEM
                       GROUP,AT(5,1,278,42),USE(?GROUP1),FONT(,,,FONT:bold),BOXED
                         OPTION,AT(10,8,100,14),USE(Loc:opcion_emp),TRN
                           RADIO('Todos'),AT(12,10,33),USE(?OPTION1:RADIO3),FONT(,,00006400h),VALUE('1')
                           RADIO('Por Empleado'),AT(48,10,60,10),USE(?OPTION1:RADIO4),FONT(,,00006400h),VALUE('2')
                         END
                         OPTION,AT(113,8,57,14),USE(Loc:opcion),FONT(,,COLOR:Red,FONT:bold),TRN
                           RADIO('Hoy'),AT(114,10,25),USE(?OPTION1:RADIO1),FONT(,,,FONT:bold),VALUE('1')
                           RADIO('Mes'),AT(142,10,25),USE(?OPTION1:RADIO2),VALUE('2')
                         END
                         SPIN(@s12),AT(174,8,52,13),USE(Loc:meses),FONT(,10,,FONT:regular),CENTER,FROM('Enero|Febr' & |
  'ero|Marzo|Abril|Mayo|Junio|Julio|Agosto|Septiembre|Octubre|Noviembre|Diciembre'),RANGE(1, |
  12),STEP(1),READONLY
                         BUTTON('Procesar'),AT(229,8,50,14),USE(?Procesar),FONT(,,,FONT:regular),LEFT,ICON(ICON:Zoom), |
  FLAT
                         BUTTON('Empleado'),AT(10,26,38,14),USE(?CallLookup)
                         ENTRY(@s31),AT(52,26,174,13),USE(EPL:EMP_NOMBRE),FONT(,13,,FONT:bold),READONLY
                         BUTTON('E&xportar'),AT(229,26,50,14),USE(?EvoExportar),FONT(,,,FONT:regular),LEFT,ICON('export.ico'), |
  CURSOR('mano.cur'),FLAT
                       END
                       LIST,AT(5,46,455,250),USE(QEmpleados),FONT(,12,,FONT:regular),HVSCROLL,FLAT,FORMAT('24C|~Legaj' & |
  'o~@N_5@140L(1)|M~Nombre~C(0)@s50@42C|~Fecha~@d06B@105L(1)|~Sector~C(0)@s40@53R(1)|~T' & |
  'el~C(0)@s14@53R(1)|~Cel~C(0)@s15@100L(1)|M~Dirección~C(0)@s80@'),FROM(QEmpleados)
                       BUTTON('Reporte'),AT(290,8,53),USE(?Reporte),FONT(,,,FONT:bold)
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
Open                   PROCEDURE(),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
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
 Q1:FieldPar  = '1,2,3,4,5,6,7,'
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
 ADD(QPar1)   ! 29 infoper025.clw
!!!!!


 FREE(QPar21)
      Qp21:F2N  = 'Legajo'
 Qp21:F2P  = '@N06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Nombre'
 Qp21:F2P  = '@s50'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Fecha'
 Qp21:F2P  = '@d06B'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Sector'
 Qp21:F2P  = '@s40'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Tel'
 Qp21:F2P  = '@s14'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Cel'
 Qp21:F2P  = '@s15'
 Qp21:F2T  = '0'
 ADD(QPar21)
      Qp21:F2N  = 'Dirección'
 Qp21:F2P  = '@s50'
 Qp21:F2T  = '0'
 ADD(QPar21)
 SysRec# = false
 FREE(Loc::QHlist1)
 LOOP
    SysRec# += 1
    IF ?QEmpleados{PROPLIST:Exists,SysRec#} = 1
        GET(QPar21,SysRec#)
        QHL1:Id      = SysRec#
        QHL1:Nombre  = Qp21:F2N
        QHL1:Longitud= ?QEmpleados{PropList:Width,SysRec#}  /2
        QHL1:Pict    = Qp21:F2P
        QHL1:Tot    = Qp21:F2T
        ADD(Loc::QHlist1)
     Else
       break
    END
 END
 Loc::Titulo1 =Loc:Titulo

 SavPath1 = PATH()

  Exportar(Loc::QHlist1,QEmpleados,QPar1,0,Loc::Titulo1,Evo::Group1)
 SETPATH(SavPath1)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FechasCumpleaños')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OPTION1:RADIO3
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
  IF Loc:opcion_emp = '1'
     DISABLE(?CallLookup)
     DISABLE(?EPL:EMP_NOMBRE)
     ENABLE(?OPTION1:RADIO1)
     ENABLE(?OPTION1:RADIO2)
  END
  IF Loc:opcion_emp <> '1'
     ENABLE(?CallLookup)
     ENABLE(?EPL:EMP_NOMBRE)
     DISABLE(?OPTION1:RADIO1)
     DISABLE(?OPTION1:RADIO2)
     DISABLE(?Loc:meses)
  END
  IF Loc:opcion_emp = '2'
     ENABLE(?CallLookup)
     ENABLE(?EPL:EMP_NOMBRE)
     DISABLE(?OPTION1:RADIO1)
     DISABLE(?OPTION1:RADIO2)
  END
  IF Loc:opcion_emp <> '2'
     DISABLE(?CallLookup)
     DISABLE(?EPL:EMP_NOMBRE)
     ENABLE(?OPTION1:RADIO1)
     ENABLE(?OPTION1:RADIO2)
  END
  IF Loc:opcion = '1'
     DISABLE(?Loc:meses)
  END
  IF Loc:opcion <> '1'
     ENABLE(?Loc:meses)
  END
  IF Loc:opcion = '2'
     ENABLE(?Loc:meses)
  END
  IF Loc:opcion <> '2'
     DISABLE(?Loc:meses)
  END
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
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !Estado de botones al iniciar el procedure
  DISABLE(?EvoExportar)
  DISABLE(?CallLookup)
  DISABLE(?EPL:EMP_NOMBRE)
  DISABLE(?OPTION1:RADIO1)
  DISABLE(?OPTION1:RADIO2)
  DISABLE(?Loc:meses)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Empleados
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
    OF ?Procesar
      !!Lógica de control de datos a consultar
      !IF Loc:opcion_emp = '' THEN
      !    MESSAGE('Revisar datos!')
      !    CYCLE
      !END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Loc:opcion_emp
      IF Loc:opcion_emp = '1'
         DISABLE(?CallLookup)
         DISABLE(?EPL:EMP_NOMBRE)
         ENABLE(?OPTION1:RADIO1)
         ENABLE(?OPTION1:RADIO2)
      END
      IF Loc:opcion_emp <> '1'
         ENABLE(?CallLookup)
         ENABLE(?EPL:EMP_NOMBRE)
         DISABLE(?OPTION1:RADIO1)
         DISABLE(?OPTION1:RADIO2)
         DISABLE(?Loc:meses)
      END
      IF Loc:opcion_emp = '2'
         ENABLE(?CallLookup)
         ENABLE(?EPL:EMP_NOMBRE)
         DISABLE(?OPTION1:RADIO1)
         DISABLE(?OPTION1:RADIO2)
      END
      IF Loc:opcion_emp <> '2'
         DISABLE(?CallLookup)
         DISABLE(?EPL:EMP_NOMBRE)
         ENABLE(?OPTION1:RADIO1)
         ENABLE(?OPTION1:RADIO2)
      END
      ThisWindow.Reset()
    OF ?Loc:opcion
      IF Loc:opcion = '1'
         DISABLE(?Loc:meses)
      END
      IF Loc:opcion <> '1'
         ENABLE(?Loc:meses)
      END
      IF Loc:opcion = '2'
         ENABLE(?Loc:meses)
      END
      IF Loc:opcion <> '2'
         DISABLE(?Loc:meses)
      END
      ThisWindow.Reset()
    OF ?Procesar
      ThisWindow.Update()
      IF Loc:opcion_emp = 1 THEN
          IF loc:opcion = 1 THEN
              loc:titulo = 'Cumpleaños del día'
              Loc:str = 'SELECT EMP_LEGAJO AS LEGAJO, EMP_NOMBRE AS NOMBRE, CONVERT(VARCHAR, EMP_FECNAC, 112) AS FECHA, '&|
                        'SEC_SECTOR AS SECTOR, EMP_NRO_CEL, EMP_NRO_TEL AS TEL, EMP_DIRECCION AS DIRECCION '&|
                        'FROM EMPLEADOS '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'WHERE MONTH(EMP_FECNAC) = ' & MONTH(TODAY()) & ' AND DAY(EMP_FECNAC) = ' & DAY(TODAY()) & ' AND EMP_ACTIVO = ''S'' '&|
                        'ORDER BY EMP_LEGAJO ASC '
          ELSIF loc:opcion = 2 THEN
              loc:titulo = 'Cumpleaños mes de ' & Loc:meses
              Loc:str = 'SELECT EMP_LEGAJO AS LEGAJO, EMP_NOMBRE AS NOMBRE, CONVERT(VARCHAR, EMP_FECNAC, 112) AS FECHA, '&|
                        'SEC_SECTOR AS SECTOR, EMP_NRO_CEL, EMP_NRO_TEL AS TEL, EMP_DIRECCION AS DIRECCION '&|
                        'FROM EMPLEADOS '&|
                        'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                        'WHERE MONTH(EMP_FECNAC) = ' & Loc:mes & ' AND EMP_ACTIVO = ''S'' '&|
                        'ORDER BY DAY(EMP_FECNAC) ASC, EMP_LEGAJO ASC '
          END
      ELSIF Loc:opcion_emp = 2 THEN
          loc:titulo = 'Cumpleaños de ' & EPL:EMP_NOMBRE
          Loc:str = 'SELECT EMP_LEGAJO AS LEGAJO, EMP_NOMBRE AS NOMBRE, CONVERT(VARCHAR, EMP_FECNAC, 112) AS FECHA, '&|
                    'SEC_SECTOR AS SECTOR, EMP_NRO_CEL, EMP_NRO_TEL AS TEL, EMP_DIRECCION AS DIRECCION '&|
                    'FROM EMPLEADOS '&|
                    'LEFT JOIN SECTOR ON SEC_ID = EMP_SECTOR '&|
                    'WHERE EMP_LEGAJO = ' & Loc:legajo & ' AND EMP_ACTIVO = ''S'' '
      END
         
      SETCLIPBOARD(Loc:str)
      TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
      
      IF ERRORCODE() THEN STOP(FILEERRORCODE()).
      
      FREE(QEmpleados)
      LOOP
      	NEXT(TMPUsosMultiples)
          IF ERRORCODE() THEN BREAK.
          QEmpleados:QLegajo = TUM:Col01
          QEmpleados:QNombre = TUM:Col02
          QEmpleados:QFecha = DEFormat(TUM:Col03,@d012)
          QEmpleados:QSector = TUM:Col04
          QEmpleados:QCel = TUM:Col05
          QEmpleados:QTel = TUM:Col06
          QEmpleados:QDireccion = TUM:Col07
      	ADD(QEmpleados)
      END !Loop
      !Loc:total = RECORDS(QAusencias)
      !MESSAGE(Loc:total)
      IF RECORDS(QEmpleados) > 0 THEN
          ENABLE(?EvoExportar)
      ELSE
          DISABLE(?EvoExportar)
      END
      !DISPLAY()
    OF ?CallLookup
      ThisWindow.Update()
      EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
        Loc:legajo = EPL:EMP_LEGAJO
      END
      ThisWindow.Reset(1)
    OF ?EPL:EMP_NOMBRE
      IF EPL:EMP_NOMBRE OR ?EPL:EMP_NOMBRE{PROP:Req}
        EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
        IF Access:EMPLEADOS.TryFetch(EPL:PK_Nombre)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_NOMBRE = EPL:EMP_NOMBRE
            Loc:legajo = EPL:EMP_LEGAJO
          ELSE
            CLEAR(Loc:legajo)
            SELECT(?EPL:EMP_NOMBRE)
            CYCLE
          END
        ELSE
          Loc:legajo = EPL:EMP_LEGAJO
        END
      END
      ThisWindow.Reset()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExQueue1
    OF ?Reporte
      ThisWindow.Update()
      !ReporteCumpleaños()
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


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?Loc:meses
      CASE Loc:meses
          OF 'Enero'
              Loc:mes = 1
          OF 'Febrero'
              Loc:mes = 2
          OF 'Marzo'
              Loc:mes = 3
          OF 'Abril'
              Loc:mes = 4
          OF 'Mayo'
              Loc:mes = 5
          OF 'Junio'
              Loc:mes = 6
          OF 'Julio'
              Loc:mes = 7
          OF 'Agosto'
              Loc:mes = 8
          OF 'Septiembre'
              Loc:mes = 9
          OF 'Octubre'
              Loc:mes = 10
          OF 'Noviembre'
              Loc:mes = 11
          OF 'Diciembre'
              Loc:mes = 12
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?OPTION1:RADIO3
      EPL:EMP_NOMBRE = ''
    OF ?OPTION1:RADIO4
      Loc:opcion = ''
      Loc:meses = ''
      Loc:mes = ''
    OF ?OPTION1:RADIO1
      Loc:meses = ''
    OF ?OPTION1:RADIO2
      Loc:meses = 'Enero'
      Loc:mes = 1
    END
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

