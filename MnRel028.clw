

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL028.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL029.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL031.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL032.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Browse_HoraDev PROCEDURE 

CurrentTab           STRING(80)                            !
loc:event            LONG                                  !
I                    LONG                                  !
MTOTAL               LONG                                  !
ZTOTAL               LONG                                  !
HTOTAL               LONG                                  !
KTOTAL               LONG                                  !
XTOTAL               STRING(7)                             !
QTOTAL               STRING(7)                             !
ZLONG                LONG(0)                               !
BRW1::View:Browse    VIEW(HORADEV)
                       PROJECT(HSD:SERVICIO)
                       PROJECT(HSD:LEGAJO)
                       PROJECT(HSD:FECHA)
                       PROJECT(HSD:HDESDE)
                       PROJECT(HSD:HHASTA)
                       PROJECT(HSD:TIPO)
                       PROJECT(HSD:MINUTOS)
                       PROJECT(HSD:OBSERVACION)
                       PROJECT(HSD:FEC_ALTA)
                       PROJECT(HSD:HOR_ALTA)
                       PROJECT(HSD:FEC_MODIF)
                       PROJECT(HSD:HOR_MODIF)
                       PROJECT(HSD:SERVILEG)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
HSD:SERVICIO           LIKE(HSD:SERVICIO)             !List box control field - type derived from field
HSD:LEGAJO             LIKE(HSD:LEGAJO)               !List box control field - type derived from field
HSD:FECHA              LIKE(HSD:FECHA)                !List box control field - type derived from field
HSD:HDESDE             LIKE(HSD:HDESDE)               !List box control field - type derived from field
HSD:HHASTA             LIKE(HSD:HHASTA)               !List box control field - type derived from field
HSD:TIPO               LIKE(HSD:TIPO)                 !List box control field - type derived from field
HSD:MINUTOS            LIKE(HSD:MINUTOS)              !List box control field - type derived from field
QTOTAL                 LIKE(QTOTAL)                   !List box control field - type derived from local data
HSD:OBSERVACION        LIKE(HSD:OBSERVACION)          !List box control field - type derived from field
HSD:FEC_ALTA           LIKE(HSD:FEC_ALTA)             !List box control field - type derived from field
HSD:HOR_ALTA           LIKE(HSD:HOR_ALTA)             !List box control field - type derived from field
HSD:FEC_MODIF          LIKE(HSD:FEC_MODIF)            !List box control field - type derived from field
HSD:HOR_MODIF          LIKE(HSD:HOR_MODIF)            !List box control field - type derived from field
HSD:SERVILEG           LIKE(HSD:SERVILEG)             !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDCB2::View:FileDropCombo VIEW(Emplea)
                       PROJECT(EPD:nombre_sue)
                       PROJECT(EPD:RCod1_Sue)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?EPD:nombre_sue
EPD:nombre_sue         LIKE(EPD:nombre_sue)           !List box control field - type derived from field
EPD:RCod1_Sue          LIKE(EPD:RCod1_Sue)            !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW(' CONTROL HORAS DEVOLUCION'),AT(,,395,227),FONT('MS Sans Serif',10,,FONT:regular),RESIZE, |
  CENTER,COLOR(,COLOR:Black,00A5DCFAh),GRAY,IMM,MDI,HLP('Browse_HoraDev'),SYSTEM
                       BUTTON('&Agregar'),AT(42,182,60,14),USE(?Insert:3),LEFT,KEY(InsertKey),ICON('WAINSERT.ICO'), |
  FLAT,SKIP
                       BUTTON('&Modificar'),AT(106,182,60,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  SKIP
                       BUTTON('&Borrar'),AT(170,182,60,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,SKIP
                       SHEET,AT(4,0,386,202),USE(?CurrentTab),COLOR(00DFDBBDh)
                         TAB,USE(?Tab:2)
                           COMBO(@s30),AT(11,20,158,11),USE(EPD:nombre_sue),FONT(,,COLOR:Blue,FONT:bold,CHARSET:ANSI), |
  COLOR(00A5DCFAh,00A5DCFAh,COLOR:Blue),DROP(5),FORMAT('120L(2)|M@s30@'),FROM(Queue:FileDropCombo), |
  IMM,SKIP
                           BUTTON('&Imprimir'),AT(281,18,51,14),USE(?Imprimir),LEFT,ICON(ICON:Print1),FLAT,SKIP
                           STRING('LEGAJO:'),AT(186,22),USE(?String1)
                           ENTRY(@n04b),AT(218,21,32,10),USE(EPD:Cod1_SUE),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI), |
  CENTER,OVR,COLOR(00A5DCFAh,00A5DCFAh,COLOR:Blue)
                           BUTTON(' '),AT(11,182,13,14),USE(?btn_tr),LEFT,ICON(ICON:Paste),SKIP
                           STRING(@S10),AT(295,183),USE(XTOTAL),FONT(,14,00804000h,FONT:bold,CHARSET:ANSI)
                           STRING('Total'),AT(267,183),USE(?String3),FONT(,14,00804000h,FONT:bold,CHARSET:ANSI)
                           BUTTON('&Cerrar'),AT(337,18,45,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,SKIP
                         END
                       END
                       LIST,AT(10,37,375,139),USE(?Browse:1),HVSCROLL,COLOR(00A5DCFAh,00A5DCFAh,00C08000h),FORMAT('36R(2)|M~S' & |
  'ERVICIO~C(0)@n1@35R(2)|M~LEGAJO~C(0)@n_3@50C(2)|M~FECHA~C(0)@d06b@35C(2)|M~HDESDE~C(' & |
  '0)@T01@35C(2)|M~HHASTA~C(0)@T01@25C(2)|M~TIPO~L@s1@28R(4)|M~MIN~C(0)@n-_6@35R(5)|M~H' & |
  'ORAS~C(9)@s7@80L(2)|M~OBSERVACION~@s20@45R(2)~Fecha-Hora~@d05b@25L(2)|M~ALTA~@t01b@4' & |
  '0R(2)~Fecha-Hora~@d05b@30L(2)|M~MODIF~@t01b@'),FROM(Queue:Browse:1),IMM
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
ResetFromView          PROCEDURE(),DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
EditInPlace::HSD:FECHA CLASS(EditEntryClass)               ! Edit-in-place class for field HSD:FECHA
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::HSD:HDESDE CLASS(EditEntryClass)              ! Edit-in-place class for field HSD:HDESDE
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED
                     END

EditInPlace::HSD:HHASTA CLASS(EditEntryClass)              ! Edit-in-place class for field HSD:HHASTA
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED
                     END

EditInPlace::HSD:TIPO CLASS(EditEntryClass)                ! Edit-in-place class for field HSD:TIPO
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
                     END

EditInPlace::HSD:MINUTOS CLASS(EditEntryClass)             ! Edit-in-place class for field HSD:MINUTOS
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED
                     END

EditInPlace::QTOTAL  EditEntryClass                        ! Edit-in-place class for field QTOTAL
EditInPlace::HSD:OBSERVACION CLASS(EditEntryClass)         ! Edit-in-place class for field HSD:OBSERVACION
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED
TakeAccepted           PROCEDURE(BYTE Action),BYTE,DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB2                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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
CALCULOS ROUTINE
   IF (Queue:Browse:1.HSD:HHASTA - Queue:Browse:1.HSD:HDESDE) <> 0 THEN
       IF Queue:Browse:1.HSD:HHASTA = 0 THEN  !CASO MEDIANOCHE
       Queue:Browse:1.HSD:MINUTOS = (8640001 - Queue:Browse:1.HSD:HDESDE) / 6000
       ELSE
       Queue:Browse:1.HSD:MINUTOS = (Queue:Browse:1.HSD:HHASTA - Queue:Browse:1.HSD:HDESDE) / 6000
       END
       IF Queue:Browse:1.HSD:MINUTOS < 0 THEN
          Queue:Browse:1.HSD:MINUTOS = 9999
       END
       IF Queue:Browse:1.HSD:TIPO = 'D' THEN Queue:Browse:1.HSD:MINUTOS *= -1 .
   ELSE
       Queue:Browse:1.QTOTAL=''
   END



CONVERTIR_A_HORAS ROUTINE
    LOOP I = 1 TO RECORDS(Queue:Browse:1)
        GET(Queue:Browse:1,I)
        IF Queue:Browse:1.HSD:MINUTOS = 9999 THEN
           Queue:Browse:1.QTOTAL = '???????'
        ELSE
           HTOTAL = Queue:Browse:1.HSD:MINUTOS / 60
           MTOTAL = Queue:Browse:1.HSD:MINUTOS - (HTOTAL * 60)
           Queue:Browse:1.QTOTAL = CLIP(LEFT(FORMAT(HTOTAL,@N_4))) & ':' & FORMAT(MTOTAL,@N02)
           IF Queue:Browse:1.HSD:MINUTOS < 0 THEN
              Queue:Browse:1.QTOTAL = '-' & CLIP(Queue:Browse:1.QTOTAL)
           END
        END
        PUT(Queue:Browse:1)
    END


    IF ZTOTAL < 0 THEN
       XTOTAL = '-'
    ELSE
       XTOTAL = ''
    END

    KTOTAL = ZTOTAL
    HTOTAL = KTOTAL / 60
    KTOTAL = KTOTAL - (HTOTAL * 60)
    XTOTAL = CLIP(XTOTAL) & CLIP(LEFT(FORMAT(HTOTAL,@N_4))) & ':' & FORMAT(KTOTAL,@N02)

    DISPLAY(?XTOTAL)



ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Browse_HoraDev')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Insert:3
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('QTOTAL',QTOTAL)                                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  Relate:HORADEV.Open                                      ! File HORADEV used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:HORADEV,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,HSD:PK_HORADEV)                       ! Add the sort order for HSD:PK_HORADEV for sort order 1
  BRW1.AddRange(HSD:SERVILEG,Relate:HORADEV,Relate:Emplea) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,HSD:FECHA,1,BRW1)              ! Initialize the browse locator using  using key: HSD:PK_HORADEV , HSD:FECHA
  BRW1.AddField(HSD:SERVICIO,BRW1.Q.HSD:SERVICIO)          ! Field HSD:SERVICIO is a hot field or requires assignment from browse
  BRW1.AddField(HSD:LEGAJO,BRW1.Q.HSD:LEGAJO)              ! Field HSD:LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(HSD:FECHA,BRW1.Q.HSD:FECHA)                ! Field HSD:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(HSD:HDESDE,BRW1.Q.HSD:HDESDE)              ! Field HSD:HDESDE is a hot field or requires assignment from browse
  BRW1.AddField(HSD:HHASTA,BRW1.Q.HSD:HHASTA)              ! Field HSD:HHASTA is a hot field or requires assignment from browse
  BRW1.AddField(HSD:TIPO,BRW1.Q.HSD:TIPO)                  ! Field HSD:TIPO is a hot field or requires assignment from browse
  BRW1.AddField(HSD:MINUTOS,BRW1.Q.HSD:MINUTOS)            ! Field HSD:MINUTOS is a hot field or requires assignment from browse
  BRW1.AddField(QTOTAL,BRW1.Q.QTOTAL)                      ! Field QTOTAL is a hot field or requires assignment from browse
  BRW1.AddField(HSD:OBSERVACION,BRW1.Q.HSD:OBSERVACION)    ! Field HSD:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(HSD:FEC_ALTA,BRW1.Q.HSD:FEC_ALTA)          ! Field HSD:FEC_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(HSD:HOR_ALTA,BRW1.Q.HSD:HOR_ALTA)          ! Field HSD:HOR_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(HSD:FEC_MODIF,BRW1.Q.HSD:FEC_MODIF)        ! Field HSD:FEC_MODIF is a hot field or requires assignment from browse
  BRW1.AddField(HSD:HOR_MODIF,BRW1.Q.HSD:HOR_MODIF)        ! Field HSD:HOR_MODIF is a hot field or requires assignment from browse
  BRW1.AddField(HSD:SERVILEG,BRW1.Q.HSD:SERVILEG)          ! Field HSD:SERVILEG is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB2.Init(EPD:nombre_sue,?EPD:nombre_sue,Queue:FileDropCombo.ViewPosition,FDCB2::View:FileDropCombo,Queue:FileDropCombo,Relate:Emplea,ThisWindow,GlobalErrors,0,1,0)
  FDCB2.Q &= Queue:FileDropCombo
  FDCB2.AddSortOrder(EPD:Key1_sue)
  FDCB2.SetFilter('EPD:activo_sue = ''S'' OR EPD:Rcod1_sue = 0')
  FDCB2.AddField(EPD:nombre_sue,FDCB2.Q.EPD:nombre_sue) !List box control field - type derived from field
  FDCB2.AddField(EPD:RCod1_Sue,FDCB2.Q.EPD:RCod1_Sue) !Browse hot field - type derived from field
  ThisWindow.AddItem(FDCB2.WindowComponent)
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
    Relate:HORADEV.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
   DO CONVERTIR_A_HORAS
  PARENT.Reset(Force)


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
    OF ?Insert:3
      IF EPD:RCod1_Sue = 0 THEN CYCLE.
    OF ?Imprimir
      IF EPD:RCod1_Sue = 0 THEN CYCLE.
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Delete:3
      ThisWindow.Update()
      IF NOT HSD:OBSERVACION = 'BORRAR' THEN CYCLE.
    OF ?Imprimir
      ThisWindow.Update()
      HorasDevPRT(0,HSD:SERVILEG,0,TODAY(),0)
      ThisWindow.Reset
    OF ?EPD:Cod1_SUE
      GET(EMPLEA,EPD:Key1_sue)
      IF NOT ERRORCODE() AND EPD:activo_sue = 'S' THEN
         CHANGE(?EPD:nombre_sue,EPD:nombre_sue)
      ELSE
         MESSAGE('LEGAJO NO EXISTE O INACTIVO',' MENSAJE AL OPERADOR')
         ERASE(?EPD:nombre_sue,-1)
         CHANGE(?EPD:Cod1_SUE,'0000')
      END
      
      POST(EVENT:ScrollBottom,?Browse:1)
    OF ?btn_tr
      ThisWindow.Update()
      Transferir_HDLegajo(EPD:Servic_sue,EPD:Legajo_sue)
      ThisWindow.Reset
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
    OF ?EPD:nombre_sue
      POST(EVENT:ScrollBottom,?Browse:1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! HSD:SERVICIO Disable
  SELF.AddEditControl(,2) ! HSD:LEGAJO Disable
  SELF.AddEditControl(EditInPlace::HSD:FECHA,3)
  SELF.AddEditControl(EditInPlace::HSD:HDESDE,4)
  SELF.AddEditControl(EditInPlace::HSD:HHASTA,5)
  SELF.AddEditControl(EditInPlace::HSD:TIPO,6)
  SELF.AddEditControl(EditInPlace::HSD:MINUTOS,7)
  SELF.AddEditControl(EditInPlace::QTOTAL,8)
  SELF.AddEditControl(EditInPlace::HSD:OBSERVACION,9)
  SELF.AddEditControl(,10) ! HSD:FEC_ALTA Disable
  SELF.AddEditControl(,11) ! HSD:HOR_ALTA Disable
  SELF.AddEditControl(,12) ! HSD:FEC_MODIF Disable
  SELF.AddEditControl(,13) ! HSD:HOR_MODIF Disable
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  HSD:SERVILEG =  EPD:Cod1_SUE
  RETURN ReturnValue


BRW1.ResetFromView PROCEDURE

ZTOTAL:Sum           REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:HORADEV.SetQuickScan(1)
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
    ZTOTAL:Sum += HSD:MINUTOS
  END
  SELF.View{PROP:IPRequestCount} = 0
  ZTOTAL = ZTOTAL:Sum
  PARENT.ResetFromView
  Relate:HORADEV.SetQuickScan(0)
  SETCURSOR()


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


EditInPlace::HSD:FECHA.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Text} = '@D06b'
  SELF.REQ = True


EditInPlace::HSD:HDESDE.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Text} = '@T02'


EditInPlace::HSD:HDESDE.TakeAccepted PROCEDURE(BYTE Action)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  DO CALCULOS
  RETURN ReturnValue


EditInPlace::HSD:HHASTA.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Text} = '@T02'


EditInPlace::HSD:HHASTA.TakeAccepted PROCEDURE(BYTE Action)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  DO CALCULOS
  RETURN ReturnValue


EditInPlace::HSD:TIPO.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Upr} = True
  SELF.REQ = True


EditInPlace::HSD:MINUTOS.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  If SELF.FEQ
      IF NOT(Queue:Browse:1.HSD:HDESDE = 0 AND Queue:Browse:1.HSD:HHASTA = 0) THEN
      SELF.FEQ{prop:readonly} = TRUE
      END
  END


EditInPlace::HSD:MINUTOS.TakeAccepted PROCEDURE(BYTE Action)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  DO CALCULOS
  RETURN ReturnValue


EditInPlace::HSD:MINUTOS.TakeEvent PROCEDURE(UNSIGNED Event)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  IF EVENT() = 257 THEN ! si selecciona casilla de minutos
     IF (Queue:Browse:1.HSD:HDESDE = 0 AND Queue:Browse:1.HSD:HHASTA = 0) THEN
         CASE MESSAGE('Opciones de ingreso',' Seleccione las opciones de ingreso',ICON:Question,'&Minutos|&Horas',2,2)
         OF 2                               !No button
          Queue:Browse:1.HSD:MINUTOS = IngresoHHMM()
          IF Queue:Browse:1.HSD:TIPO = 'D' THEN
             Queue:Browse:1.HSD:MINUTOS = Queue:Browse:1.HSD:MINUTOS * -1
          END
         END
     END
  END
  RETURN ReturnValue


EditInPlace::HSD:OBSERVACION.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  SELF.FEQ{PROP:Upr} = True


EditInPlace::HSD:OBSERVACION.TakeAccepted PROCEDURE(BYTE Action)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeAccepted(Action)
  IF (Queue:Browse:1.HSD:HDESDE = 0 AND Queue:Browse:1.HSD:HHASTA = 0) AND Queue:Browse:1.HSD:OBSERVACION = '' THEN
     Queue:Browse:1.HSD:OBSERVACION = ALL('?')
  END
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

