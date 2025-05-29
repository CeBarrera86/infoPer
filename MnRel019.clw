

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL019.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL007.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SeleccionarReloj PROCEDURE 

LOC:SEDE             BYTE                                  !
loc:ufecha           STRING(20)                            !
FDCB1::View:FileDropCombo VIEW(SEDE_RELOJ)
                       PROJECT(SED:SED_Descripcion)
                       PROJECT(SED:SED_Codigo)
                       JOIN(SEI:PK_SEDEINI,SED:SED_Codigo)
                         PROJECT(SEI:SEI_RutaRegis)
                         PROJECT(SEI:SEI_NombreRegis)
                       END
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?SED:SED_Descripcion
SED:SED_Descripcion    LIKE(SED:SED_Descripcion)      !List box control field - type derived from field
SEI:SEI_RutaRegis      LIKE(SEI:SEI_RutaRegis)        !Browse hot field - type derived from field
SEI:SEI_NombreRegis    LIKE(SEI:SEI_NombreRegis)      !Browse hot field - type derived from field
SED:SED_Codigo         LIKE(SED:SED_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW(' Seleccionar Reloj a Procesar'),AT(,,332,86),FONT('MS Sans Serif',8,COLOR:Purple,FONT:regular), |
  GRAY
                       PROMPT('Sede:'),AT(21,15),USE(?Glo:Sede:Prompt),FONT(,12,,FONT:bold,CHARSET:ANSI)
                       STRING(@s15),AT(23,34,76,10),USE(SEI:SEI_RutaRegis),FONT(,,COLOR:Green,,CHARSET:ANSI),RIGHT
                       STRING(@s30),AT(100,34,135,10),USE(SEI:SEI_NombreRegis),FONT(,,COLOR:Green,,CHARSET:ANSI), |
  LEFT
                       GROUP,AT(13,48,208,31),USE(?Group1),BOXED,TRN
                         STRING(@s19),AT(28,56),USE(loc:ufecha),FONT(,18,COLOR:Blue,,CHARSET:ANSI),CENTER
                       END
                       ENTRY(@n_02B),AT(55,12,25,16),USE(Glo:Sede),FONT(,12,,FONT:bold,CHARSET:ANSI),RIGHT(1),READONLY, |
  SKIP
                       COMBO(@s20),AT(84,12,136,16),USE(SED:SED_Descripcion),FONT(,10,,FONT:bold,CHARSET:ANSI),DROP(5), |
  FORMAT('200L(2)|M~SED Descripcion~@s50@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('Procesar'),AT(244,11,72,22),USE(?OkButton),FONT(,,COLOR:Green,FONT:bold,CHARSET:ANSI), |
  LEFT,ICON('D:\DesCla61\ico\ok.ico'),DEFAULT
                       BUTTON('Cancelar'),AT(246,52,70,22),USE(?OkButton:2),FONT(,,COLOR:Maroon,,CHARSET:ANSI),LEFT, |
  ICON('D:\DesCla61\ico\cancelar.ico'),DEFAULT,STD(STD:Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FDCB1                CLASS(FileDropComboClass)             ! File drop combo manager
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SeleccionarReloj')
    glo:sede=0
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Glo:Sede:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SEI:SEI_RutaRegis',SEI:SEI_RutaRegis)              ! Added by: FileDropCombo(ABC)
  BIND('SEI:SEI_NombreRegis',SEI:SEI_NombreRegis)          ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SEDE_RELOJ.Open                                   ! File SEDE_RELOJ used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  FDCB1.Init(SED:SED_Descripcion,?SED:SED_Descripcion,Queue:FileDropCombo.ViewPosition,FDCB1::View:FileDropCombo,Queue:FileDropCombo,Relate:SEDE_RELOJ,ThisWindow,GlobalErrors,0,1,0)
  FDCB1.Q &= Queue:FileDropCombo
  FDCB1.AddSortOrder(SED:IX_Descripcion)
  FDCB1.AddField(SED:SED_Descripcion,FDCB1.Q.SED:SED_Descripcion) !List box control field - type derived from field
  FDCB1.AddField(SEI:SEI_RutaRegis,FDCB1.Q.SEI:SEI_RutaRegis) !Browse hot field - type derived from field
  FDCB1.AddField(SEI:SEI_NombreRegis,FDCB1.Q.SEI:SEI_NombreRegis) !Browse hot field - type derived from field
  FDCB1.AddField(SED:SED_Codigo,FDCB1.Q.SED:SED_Codigo) !Primary key field - type derived from field
  FDCB1.AddUpdateField(SED:SED_Codigo,Glo:Sede)
  FDCB1.AddUpdateField(SED:SED_Reloj,Glo:Reloj)
  ThisWindow.AddItem(FDCB1.WindowComponent)
  FDCB1.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SEDE_RELOJ.Close
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
    OF ?OkButton
              SEI:SEI_Sede = GLO:SEDE
              GET(SedeIni,SEI:PK_SEDEINI)
              if errorcode() then
                  message('No tiene autorizacion de uso')
                  halt(0)
              else
                  glo:sede = SEI:SEI_Reloj
                  glo:reloj = SEI:SEI_Reloj
                  glo:TMPReloj = clip(SEI:SEI_RutaRegis) & clip(SEI:SEI_NombreRegis)
      !            message(clip(glo:TMPReloj))
              end ! if
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SED:SED_Descripcion
      !     message(glo:sede)
          loc:ufecha=UltimaLectura(glo:sede,0)
          if loc:ufecha[1:10] = format(year(today()),@n04) & '-' & format(month(today()),@n02) & '-' & format(day(today()),@n02) then
             loc:ufecha = '  =Hoy=  ' & loc:ufecha[12:16]
          else
             loc:ufecha =  loc:ufecha[1:16]
          end
          display(?loc:ufecha)
    OF ?OkButton
      ThisWindow.Update()
      RelojIncorporarMarcadas()
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

