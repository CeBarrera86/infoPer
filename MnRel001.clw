

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL027.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL028.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('MNREL030.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! </summary>
Main PROCEDURE 

LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
AppFrame             APPLICATION('CORPICO - Control Horario del Personal'),AT(0,0,528,296),FONT('MS Sans Serif', |
  8,,FONT:regular),RESIZE,MAXIMIZE,HVSCROLL,ICON('D:\DesCla61\Personal\icos\Untitled (142).ico'), |
  MAX,HLP('~Main'),PALETTE(256),STATUS,SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&Archivo'),USE(?File)
                           ITEM('&Print Setup ...'),USE(?PrintSetup),MSG('Setup printer'),STD(STD:PrintSetup)
                           ITEM('E&xit'),USE(?Abort),STD(STD:Close)
                         END
                         MENU('&Edicion'),USE(?Edit)
                           ITEM('C&ortar'),USE(?Cut),STD(STD:Cut)
                           ITEM('&Copiar'),USE(?Copy),MSG('Copy item to Windows Clipboard'),STD(STD:Copy)
                           ITEM('&Pegar'),USE(?Paste),MSG('Paste contents of Windows Clipboard'),STD(STD:Paste)
                         END
                         MENU('Reloj'),USE(?Reloj)
                           ITEM('Incorporar Marcadas'),USE(?RelojIncorporarMarcadas)
                           ITEM('Ver Marcadas'),USE(?RelojVerMarcadas)
                           ITEM('ArmarPartes'),USE(?RelojArmarPartes)
                           ITEM('Ver Datos Empleados'),USE(?RelojVerEmpleadat)
                           ITEM('Horas Devolucion<09H>CtrlH'),USE(?RelojHorasDevolucion),KEY(CtrlH)
                           ITEM('Informes Horas Devolución'),USE(?RelojInformesHorasDevolución)
                         END
                         MENU('&Window'),USE(?Window),STD(STD:WindowList)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Stack all open windows'),STD(STD:CascadeWindow)
                           ITEM('Tile &Horizontal'),USE(?TileHorizontal),MSG('Make all open windows visible'),STD(STD:TileHorizontal)
                           ITEM('Tile &Vertical'),USE(?TileVertical),MSG('Make all open windows visible'),STD(STD:TileVertical)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Align all window icons'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),USE(?Help)
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('How to use Windows Help'),STD(STD:HelpOnHelp)
                           ITEM('&About...'),USE(?About)
                         END
                       END
                       TOOLBAR,AT(0,0,224,47),USE(?Toolbar)
                         GROUP,AT(0,0,,18),USE(?ToolbarGroup,Toolbar:ToolbarGroup),FULL,BEVEL(1,0,1545),BOXED
                           GROUP,AT(0,3,56,12),USE(?FrameEditGroup,Toolbar:FrameEditGroup),BEVEL(1,0,144),BOXED
                             BUTTON,AT(0,1,18,16),USE(?Toolbar:Insert,Toolbar:Insert),ICON('wizIns.ico'),DISABLE,FLAT
                             BUTTON,AT(18,1,18,16),USE(?Toolbar:Change,Toolbar:Change),ICON('wizEdit.ico'),DISABLE,FLAT
                             BUTTON,AT(36,1,18,16),USE(?Toolbar:Delete,Toolbar:Delete),ICON('wizDel.ico'),DISABLE,FLAT
                           END
                           GROUP,AT(56,3,128,12),USE(?FrameNavigateGroup,Toolbar:FrameNavigateGroup),BEVEL(1,0,144),BOXED
                             BUTTON,AT(56,1,18,16),USE(?Toolbar:Top,Toolbar:Top),ICON('wizFirst.ico'),DISABLE,FLAT
                             BUTTON,AT(74,1,18,16),USE(?Toolbar:PageUp,Toolbar:PageUp),ICON('wizPgUp.ico'),DELAY(50),DISABLE, |
  FLAT,IMM
                             BUTTON,AT(92,1,18,16),USE(?Toolbar:Up,Toolbar:Up),ICON('wizUp.ico'),DELAY(50),DISABLE,FLAT, |
  IMM
                             BUTTON,AT(110,1,18,16),USE(?Toolbar:Locate,Toolbar:Locate),ICON('wizFind.ico'),DISABLE,FLAT
                             BUTTON,AT(128,1,18,16),USE(?Toolbar:Down,Toolbar:Down),ICON('wizDown.ico'),DELAY(50),DISABLE, |
  FLAT,IMM
                             BUTTON,AT(146,1,18,16),USE(?Toolbar:PageDown,Toolbar:PageDown),ICON('wizPgDn.ico'),DELAY(50), |
  DISABLE,FLAT,IMM
                             BUTTON,AT(164,1,18,16),USE(?Toolbar:Bottom,Toolbar:Bottom),ICON('wizLast.ico'),DISABLE,FLAT
                           END
                           GROUP,AT(184,3,20,12),USE(?FrameHistoryGroup,Toolbar:FrameHistoryGroup),BEVEL(1,0,144),BOXED
                             BUTTON,AT(184,1,18,16),USE(?Toolbar:History,Toolbar:History),ICON('wizDitto.ico'),DISABLE, |
  FLAT
                           END
                           GROUP,AT(204,3,20,12),USE(?FrameHelpGroup,Toolbar:FrameHelpGroup),BEVEL(1,0,144),BOXED
                             BUTTON,AT(27,20,23,22),USE(?RLugar),ICON('D:\DesCla61\Personal\icos\button_ok.ico'),MSG('Lugares as' & |
  'ociados a las sedes de los Relojes Para impresion de Partes'),TIP('Lugares asociados' & |
  ' a las sedes de los Relojes Para impresion de Partes')
                             BUTTON,AT(51,20,23,22),USE(?RUbicacion),ICON('D:\DesCla61\Personal\icos\Untitled (142).ico'), |
  MSG('Ubicacion del Personal'),TIP('Ubicacion del Personal')
                             BUTTON,AT(3,20,23,22),USE(?RSede),ICON('D:\DesCla61\ico\Home (nonXP).ico'),MSG('Sedes Dond' & |
  'e Estan los Relojes'),TIP('Sedes Donde Estan los Relojes')
                             BUTTON,AT(76,20,23,22),USE(?RTarjeta),ICON('D:\DesCla61\ico\Deffault Document (nonXP).ico'), |
  MSG('Numeros de Tarjetas'),TIP('Numeros de Tarjetas')
                             BUTTON,AT(217,20,23,22),USE(?SReloj),ICON('D:\DesCla61\ico\Scheduled Tasks (nonXP).ico'),MSG('Seleccionar Reloj'), |
  TIP('Seleccionar Reloj')
                             BUTTON,AT(318,20,23,22),USE(?Button13:2),ICON('D:\DesCla61\ico\Text Document (nonXP).ico')
                             BUTTON,AT(481,20,23,22),USE(?Button13:3),ICON('D:\DesCla61\ico\Accessibly Settings (nonXP).ico'), |
  STD(STD:Close)
                             BUTTON,AT(418,20,23,22),USE(?EnviarMails),ICON('D:\DesCla61\Personal\icos\e-mail.ico')
                             BUTTON,AT(204,1,18,16),USE(?Toolbar:Help,Toolbar:Help),ICON('wizHelp.ico'),DISABLE,FLAT
                           END
                         END
                         STRING(@n1),AT(102,20,16,23),USE(Glo:Sede),FONT(,24,COLOR:Gray,FONT:bold,CHARSET:ANSI)
                         STRING('Enviar eMails -->'),AT(351,26),USE(?String2:2),FONT(,,,FONT:bold),TRN
                         STRING('Incorporar Marcadas -->'),AT(124,26,96,10),USE(?String1),FONT(,,,FONT:bold),TRN
                         STRING('Imprimir Partes -->'),AT(247,26),USE(?String2),FONT(,,,FONT:bold),TRN
                         STRING('Salir -->'),AT(450,26),USE(?String3),FONT(,,,FONT:bold)
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::File ROUTINE                                         ! Code for menu items on ?File
Menu::Edit ROUTINE                                         ! Code for menu items on ?Edit
Menu::Reloj ROUTINE                                        ! Code for menu items on ?Reloj
  CASE ACCEPTED()
  OF ?RelojIncorporarMarcadas
    START(RelojIncorporarMarcadas, 25000)
  OF ?RelojVerMarcadas
    START(VerMarcadas, 25000)
  OF ?RelojArmarPartes
    START(RelojArmarPartes, 25000)
  OF ?RelojVerEmpleadat
    START(Browse_Emplea, 25000)
  OF ?RelojHorasDevolucion
    START(Browse_HoraDev, 25000)
  OF ?RelojInformesHorasDevolución
    START(Informes_HorasDev, 25000)
  END
Menu::Window ROUTINE                                       ! Code for menu items on ?Window
Menu::Help ROUTINE                                         ! Code for menu items on ?Help
  CASE ACCEPTED()
  OF ?About
    AboutWindow()
  END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
    if glo:nsector <> 0 then
       RelojArmarPartes
       ReturnValue = Level:Fatal
    else
       glo:nsector=0
    end
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
      SedeIni{prop:logonScreen} = false
      Tmp_Personal{prop:logonScreen} = false
  Relate:SEDEINI.Open                                      ! File SEDEINI used by this procedure, so make sure it's RelationManager is open
  Relate:TMP_Personal.Open                                 ! File TMP_Personal used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(AppFrame)                                      ! Open window
      glo:sede = getIni('General','Sede',0,'C:\windows\Reloj.ini')
      if glo:sede = 0
          IF command('2') = 'DEVELOPER' THEN
              GLO:SEDE = 1
          ELSE
              message('No tiene autorizacion de uso')
              halt(0)
          END
      else
          ! armar y dar permisos
          SEI:SEI_Sede = GLO:SEDE
          GET(SedeIni,SEI:PK_SEDEINI)
          if errorcode() then
              message('No tiene autorizacion de uso')
              halt(0)
          else
              glo:sede = SEI:SEI_Reloj
              glo:reloj = SEI:SEI_Reloj
      !        message(glo:reloj)
              glo:TMPReloj = clip(SEI:SEI_RutaRegis) & clip(SEI:SEI_NombreRegis)
              glo:SEI_LeerReloj         = SEI:SEI_LeerReloj
              glo:SEI_Modificar_Datos   = SEI:SEI_Modificar_Datos
              glo:SEI_Sacar_Partes      = SEI:SEI_Sacar_Partes
              glo:SEI_Armar_Partes      = SEI:SEI_Armar_Partes
              if sei:sei_reloj = 1
                  glo:super = true
              else
                  glo:super = false
              end
              if SEI:SEI_Modificar_Datos = 'S'
                  Enable(?RSede)
                  Enable(?RUbicacion)
                  Enable(?RLugar)
                  Enable(?RTarjeta)
                  enable(?sreloj)
              else
                  disable(?RSede)
                  disable(?RUbicacion)
                  disable(?RLugar)
                  disable(?RTarjeta)
                  disable(?sreloj)
              end
          end
      end
  
  Display
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SEDEINI.Close
    Relate:TMP_Personal.Close
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
    OF ?Button13:2
      glo:nsector=0
    OF ?Toolbar:Insert
    OROF ?Toolbar:Change
    OROF ?Toolbar:Delete
    OROF ?Toolbar:Top
    OROF ?Toolbar:PageUp
    OROF ?Toolbar:Up
    OROF ?Toolbar:Locate
    OROF ?Toolbar:Down
    OROF ?Toolbar:PageDown
    OROF ?Toolbar:Bottom
    OROF ?Toolbar:History
    OROF ?Toolbar:Help
      IF SYSTEM{PROP:Active} <> THREAD()
        POST(EVENT:Accepted,ACCEPTED(),SYSTEM{Prop:Active} )
        CYCLE
      END
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::File                                        ! Process menu items on ?File menu
      DO Menu::Edit                                        ! Process menu items on ?Edit menu
      DO Menu::Reloj                                       ! Process menu items on ?Reloj menu
      DO Menu::Window                                      ! Process menu items on ?Window menu
      DO Menu::Help                                        ! Process menu items on ?Help menu
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?RLugar
      START(PersonalLugar, 25000)
    OF ?RUbicacion
      START(PersonalUbicacionPersonal, 25000)
    OF ?RSede
      START(PersonalSedes, 25000)
    OF ?RTarjeta
      START(PersonalTarjetas, 25000)
    OF ?SReloj
      START(SeleccionarReloj, 25000)
    OF ?Button13:2
      START(RelojArmarPartes, 25000)
    OF ?EnviarMails
      START(RelojEnviarEmails, 25000)
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

