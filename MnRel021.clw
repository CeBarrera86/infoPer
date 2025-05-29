

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL021.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Up_Ver PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::EPD:Record  LIKE(EPD:RECORD),THREAD
QuickWindow          WINDOW('Form Emplea'),AT(,,529,292),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('Up_Ver'),SYSTEM
                       SHEET,AT(4,4,509,259),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Servic sue:'),AT(8,30),USE(?EPD:Servic_sue:Prompt),TRN
                           ENTRY(@n01),AT(61,30,40,10),USE(EPD:Servic_sue)
                           PROMPT('Legajo sue:'),AT(8,44),USE(?EPD:Legajo_sue:Prompt),TRN
                           ENTRY(@n03),AT(61,44,40,10),USE(EPD:Legajo_sue)
                           PROMPT('RC od 1 Sue:'),AT(8,58),USE(?EPD:RCod1_Sue:Prompt),TRN
                           ENTRY(@n04),AT(61,58,40,10),USE(EPD:RCod1_Sue)
                           PROMPT('Tipo sue:'),AT(8,72),USE(?EPD:Tipo_sue:Prompt),TRN
                           ENTRY(@n01),AT(61,72,40,10),USE(EPD:Tipo_sue)
                           PROMPT('Sector Sue:'),AT(8,86),USE(?EPD:Sector_Sue:Prompt),TRN
                           ENTRY(@n02),AT(61,86,40,10),USE(EPD:Sector_Sue)
                           PROMPT('Seccion sue:'),AT(8,100),USE(?EPD:Seccion_sue:Prompt),TRN
                           ENTRY(@n01),AT(61,100,40,10),USE(EPD:Seccion_sue)
                           PROMPT('Nrotar sue:'),AT(8,114),USE(?EPD:Nrotar_sue:Prompt),TRN
                           ENTRY(@n05),AT(61,114,27,10),USE(EPD:Nrotar1_sue)
                           PROMPT('CC osto sue:'),AT(8,128),USE(?EPD:CCosto_sue:Prompt),TRN
                           ENTRY(@n02),AT(61,128,40,10),USE(EPD:CCosto_sue)
                           PROMPT('Usua sue:'),AT(8,142),USE(?EPD:Usua_sue:Prompt),TRN
                           ENTRY(@n011),AT(61,142,48,10),USE(EPD:Usua_sue)
                           PROMPT('fami sue:'),AT(8,156),USE(?EPD:fami_sue:Prompt),TRN
                           ENTRY(@n02),AT(61,156,40,10),USE(EPD:fami_sue)
                           PROMPT('seguro sue:'),AT(113,30),USE(?EPD:seguro_sue:Prompt),TRN
                           ENTRY(@n01),AT(166,30,40,10),USE(EPD:seguro_sue)
                           PROMPT('licen sue:'),AT(113,44),USE(?EPD:licen_sue:Prompt),TRN
                           ENTRY(@n03),AT(166,44,40,10),USE(EPD:licen_sue)
                           PROMPT('jubi sue:'),AT(113,58),USE(?EPD:jubi_sue:Prompt),TRN
                           ENTRY(@n02),AT(166,58,40,10),USE(EPD:jubi_sue)
                           PROMPT('nombre sue:'),AT(113,73),USE(?EPD:nombre_sue:Prompt),TRN
                           ENTRY(@s30),AT(166,73,124,10),USE(EPD:nombre_sue)
                           PROMPT('domici sue:'),AT(113,86),USE(?EPD:domici_sue:Prompt),TRN
                           ENTRY(@s25),AT(166,86,104,10),USE(EPD:domici_sue)
                           PROMPT('locali sue:'),AT(113,100),USE(?EPD:locali_sue:Prompt),TRN
                           ENTRY(@s20),AT(166,100,84,10),USE(EPD:locali_sue)
                           PROMPT('sexo sue:'),AT(113,114),USE(?EPD:sexo_sue:Prompt),TRN
                           ENTRY(@s1),AT(166,114,40,10),USE(EPD:sexo_sue)
                           PROMPT('nacion sue:'),AT(113,129),USE(?EPD:nacion_sue:Prompt),TRN
                           ENTRY(@s1),AT(166,129,40,10),USE(EPD:nacion_sue)
                           PROMPT('Tipodoc sue:'),AT(113,142),USE(?EPD:Tipodoc_sue:Prompt),TRN
                           ENTRY(@s2),AT(166,142,40,10),USE(EPD:Tipodoc_sue)
                           PROMPT('cuil sue:'),AT(113,156),USE(?EPD:cuil_sue:Prompt),TRN
                           ENTRY(@n011),AT(166,156,48,10),USE(EPD:cuil_sue)
                           PROMPT('feing 1 sue:'),AT(307,31),USE(?EPD:feing1_sue:Prompt),TRN
                           ENTRY(@n06),AT(360,31,40,10),USE(EPD:feing1_sue)
                           PROMPT('feing 2 sue:'),AT(307,46),USE(?EPD:feing2_sue:Prompt),TRN
                           ENTRY(@n06),AT(360,46,40,10),USE(EPD:feing2_sue)
                           PROMPT('feing 3 sue:'),AT(307,60),USE(?EPD:feing3_sue:Prompt),TRN
                           ENTRY(@n06),AT(360,60,40,10),USE(EPD:feing3_sue)
                           PROMPT('feing 4 sue:'),AT(307,73),USE(?EPD:feing4_sue:Prompt),TRN
                           ENTRY(@n06),AT(360,73,40,10),USE(EPD:feing4_sue)
                           PROMPT('fenaci sue:'),AT(307,87),USE(?EPD:fenaci_sue:Prompt),TRN
                           ENTRY(@n06),AT(360,87,40,10),USE(EPD:fenaci_sue)
                           PROMPT('febaja sue:'),AT(307,102),USE(?EPD:febaja_sue:Prompt),TRN
                           ENTRY(@n06),AT(360,102,40,10),USE(EPD:febaja_sue)
                           PROMPT('ccateg sue:'),AT(307,116),USE(?EPD:ccateg_sue:Prompt),TRN
                           ENTRY(@s2),AT(360,116,40,10),USE(EPD:ccateg_sue)
                           PROMPT('salari sue:'),AT(307,129),USE(?EPD:salari_sue:Prompt),TRN
                           ENTRY(@s10),AT(360,129,44,10),USE(EPD:salari_sue)
                           PROMPT('reten sue:'),AT(307,143),USE(?EPD:reten_sue:Prompt),TRN
                           ENTRY(@s10),AT(360,143,44,10),USE(EPD:reten_sue)
                           PROMPT('nobrso sue:'),AT(307,158),USE(?EPD:nobrso_sue:Prompt),TRN
                           ENTRY(@n08),AT(360,158,40,10),USE(EPD:nobrso_sue)
                           PROMPT('cobrso sue:'),AT(54,175),USE(?EPD:cobrso_sue:Prompt),TRN
                           ENTRY(@n02),AT(107,175,40,10),USE(EPD:cobrso_sue)
                           PROMPT('cjubil sue:'),AT(54,188),USE(?EPD:cjubil_sue:Prompt),TRN
                           ENTRY(@n01),AT(107,188,40,10),USE(EPD:cjubil_sue)
                           PROMPT('activo sue:'),AT(54,201),USE(?EPD:activo_sue:Prompt),TRN
                           ENTRY(@s1),AT(107,201,40,10),USE(EPD:activo_sue)
                           PROMPT('cobro sue:'),AT(54,217),USE(?EPD:cobro_sue:Prompt),TRN
                           ENTRY(@n01),AT(107,217,40,10),USE(EPD:cobro_sue)
                           PROMPT('Conven sue:'),AT(54,231),USE(?EPD:Conven_sue:Prompt),TRN
                           ENTRY(@n01),AT(107,231,40,10),USE(EPD:Conven_sue)
                           PROMPT('antcat sue:'),AT(54,244),USE(?EPD:antcat_sue:Prompt),TRN
                           ENTRY(@n06),AT(107,244,40,10),USE(EPD:antcat_sue)
                           PROMPT('cargo sue:'),AT(158,175),USE(?EPD:cargo_sue:Prompt),TRN
                           ENTRY(@s30),AT(211,175,124,10),USE(EPD:cargo_sue)
                           PROMPT('porbae sue:'),AT(158,190),USE(?EPD:porbae_sue:Prompt),TRN
                           ENTRY(@n06.2),AT(211,190,40,10),USE(EPD:porbae_sue)
                           PROMPT('tipsem sue:'),AT(158,204),USE(?EPD:tipsem_sue:Prompt),TRN
                           ENTRY(@s1),AT(211,204,40,10),USE(EPD:tipsem_sue)
                           PROMPT('tturno sue:'),AT(158,218),USE(?EPD:tturno_sue:Prompt),TRN
                           ENTRY(@s1),AT(211,218,40,10),USE(EPD:tturno_sue)
                           PROMPT('cturno sue:'),AT(157,232),USE(?EPD:cturno_sue:Prompt),TRN
                           ENTRY(@s1),AT(211,232,40,10),USE(EPD:cturno_sue)
                           PROMPT('autoex sue:'),AT(157,247),USE(?EPD:autoex_sue:Prompt),TRN
                           ENTRY(@s1),AT(211,247,40,10),USE(EPD:autoex_sue)
                         END
                       END
                       BUTTON('&OK'),AT(318,276,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(371,276,56,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(434,276,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
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
    ActionMessage = 'Ver Registro'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
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
  GlobalErrors.SetProcedureName('Up_Ver')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPD:Servic_sue:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(EPD:Record,History::EPD:Record)
  SELF.AddHistoryField(?EPD:Servic_sue,2)
  SELF.AddHistoryField(?EPD:Legajo_sue,3)
  SELF.AddHistoryField(?EPD:RCod1_Sue,4)
  SELF.AddHistoryField(?EPD:Tipo_sue,6)
  SELF.AddHistoryField(?EPD:Sector_Sue,7)
  SELF.AddHistoryField(?EPD:Seccion_sue,8)
  SELF.AddHistoryField(?EPD:Nrotar1_sue,10)
  SELF.AddHistoryField(?EPD:CCosto_sue,13)
  SELF.AddHistoryField(?EPD:Usua_sue,14)
  SELF.AddHistoryField(?EPD:fami_sue,15)
  SELF.AddHistoryField(?EPD:seguro_sue,16)
  SELF.AddHistoryField(?EPD:licen_sue,17)
  SELF.AddHistoryField(?EPD:jubi_sue,18)
  SELF.AddHistoryField(?EPD:nombre_sue,19)
  SELF.AddHistoryField(?EPD:domici_sue,20)
  SELF.AddHistoryField(?EPD:locali_sue,21)
  SELF.AddHistoryField(?EPD:sexo_sue,22)
  SELF.AddHistoryField(?EPD:nacion_sue,23)
  SELF.AddHistoryField(?EPD:Tipodoc_sue,24)
  SELF.AddHistoryField(?EPD:cuil_sue,25)
  SELF.AddHistoryField(?EPD:feing1_sue,26)
  SELF.AddHistoryField(?EPD:feing2_sue,27)
  SELF.AddHistoryField(?EPD:feing3_sue,28)
  SELF.AddHistoryField(?EPD:feing4_sue,29)
  SELF.AddHistoryField(?EPD:fenaci_sue,30)
  SELF.AddHistoryField(?EPD:febaja_sue,31)
  SELF.AddHistoryField(?EPD:ccateg_sue,32)
  SELF.AddHistoryField(?EPD:salari_sue,33)
  SELF.AddHistoryField(?EPD:reten_sue,34)
  SELF.AddHistoryField(?EPD:nobrso_sue,35)
  SELF.AddHistoryField(?EPD:cobrso_sue,36)
  SELF.AddHistoryField(?EPD:cjubil_sue,37)
  SELF.AddHistoryField(?EPD:activo_sue,38)
  SELF.AddHistoryField(?EPD:cobro_sue,39)
  SELF.AddHistoryField(?EPD:Conven_sue,40)
  SELF.AddHistoryField(?EPD:antcat_sue,41)
  SELF.AddHistoryField(?EPD:cargo_sue,42)
  SELF.AddHistoryField(?EPD:porbae_sue,43)
  SELF.AddHistoryField(?EPD:tipsem_sue,44)
  SELF.AddHistoryField(?EPD:tturno_sue,45)
  SELF.AddHistoryField(?EPD:cturno_sue,46)
  SELF.AddHistoryField(?EPD:autoex_sue,47)
  SELF.AddUpdateFile(Access:Emplea)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Emplea
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?EPD:Servic_sue{PROP:ReadOnly} = True
    ?EPD:Legajo_sue{PROP:ReadOnly} = True
    ?EPD:RCod1_Sue{PROP:ReadOnly} = True
    ?EPD:Tipo_sue{PROP:ReadOnly} = True
    ?EPD:Sector_Sue{PROP:ReadOnly} = True
    ?EPD:Seccion_sue{PROP:ReadOnly} = True
    ?EPD:Nrotar1_sue{PROP:ReadOnly} = True
    ?EPD:CCosto_sue{PROP:ReadOnly} = True
    ?EPD:Usua_sue{PROP:ReadOnly} = True
    ?EPD:fami_sue{PROP:ReadOnly} = True
    ?EPD:seguro_sue{PROP:ReadOnly} = True
    ?EPD:licen_sue{PROP:ReadOnly} = True
    ?EPD:jubi_sue{PROP:ReadOnly} = True
    ?EPD:nombre_sue{PROP:ReadOnly} = True
    ?EPD:domici_sue{PROP:ReadOnly} = True
    ?EPD:locali_sue{PROP:ReadOnly} = True
    ?EPD:sexo_sue{PROP:ReadOnly} = True
    ?EPD:nacion_sue{PROP:ReadOnly} = True
    ?EPD:Tipodoc_sue{PROP:ReadOnly} = True
    ?EPD:cuil_sue{PROP:ReadOnly} = True
    ?EPD:feing1_sue{PROP:ReadOnly} = True
    ?EPD:feing2_sue{PROP:ReadOnly} = True
    ?EPD:feing3_sue{PROP:ReadOnly} = True
    ?EPD:feing4_sue{PROP:ReadOnly} = True
    ?EPD:fenaci_sue{PROP:ReadOnly} = True
    ?EPD:febaja_sue{PROP:ReadOnly} = True
    ?EPD:ccateg_sue{PROP:ReadOnly} = True
    ?EPD:salari_sue{PROP:ReadOnly} = True
    ?EPD:reten_sue{PROP:ReadOnly} = True
    ?EPD:nobrso_sue{PROP:ReadOnly} = True
    ?EPD:cobrso_sue{PROP:ReadOnly} = True
    ?EPD:cjubil_sue{PROP:ReadOnly} = True
    ?EPD:activo_sue{PROP:ReadOnly} = True
    ?EPD:cobro_sue{PROP:ReadOnly} = True
    ?EPD:Conven_sue{PROP:ReadOnly} = True
    ?EPD:antcat_sue{PROP:ReadOnly} = True
    ?EPD:cargo_sue{PROP:ReadOnly} = True
    ?EPD:porbae_sue{PROP:ReadOnly} = True
    ?EPD:tipsem_sue{PROP:ReadOnly} = True
    ?EPD:tturno_sue{PROP:ReadOnly} = True
    ?EPD:cturno_sue{PROP:ReadOnly} = True
    ?EPD:autoex_sue{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
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

