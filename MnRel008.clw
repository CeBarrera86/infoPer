

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL008.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL013.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
RelojArmarPartes PROCEDURE 

loc:fecha            DATE                                  !
loc:Sector           SHORT                                 !
loc:sede             SHORT                                 !
loc:ncopias          BYTE(2)                               !
i                    BYTE                                  !
loc:ufecha           STRING(20)                            !
loc:email            STRING(30)                            !
FDCB4::View:FileDropCombo VIEW(LUGAR)
                       PROJECT(LUG:LUG_Descripcion)
                       PROJECT(LUG:LUG_Sede)
                       PROJECT(LUG:LUG_Codigo)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?LUG:LUG_Descripcion
LUG:LUG_Descripcion    LIKE(LUG:LUG_Descripcion)      !List box control field - type derived from field
LUG:LUG_Sede           LIKE(LUG:LUG_Sede)             !List box control field - type derived from field
LUG:LUG_Codigo         LIKE(LUG:LUG_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('  Imprimir Parte Diario'),AT(,,175,62),FONT('MS Sans Serif',10,,FONT:bold),DOUBLE, |
  TILED,CENTER,GRAY,IMM,HLP('RelojArmarPartes'),WALLPAPER('WIZABT00.GIF')
                       STRING('Ultima Actualización:'),AT(115,2,44,7),USE(?String3),FONT(,8,COLOR:Blue,FONT:regular, |
  CHARSET:ANSI)
                       PROMPT('Fecha:'),AT(6,5),USE(?loc:fecha:Prompt),TRN
                       ENTRY(@d17),AT(34,4,38,10),USE(loc:fecha),FONT(,10,,FONT:bold,CHARSET:ANSI)
                       BUTTON,AT(75,4,14,11),USE(?Calendar),ICON('D:\DesCla61\Personal\icos\WIZFIND.ICO')
                       STRING(@s16),AT(115,8),USE(loc:ufecha),FONT(,10,COLOR:Blue,FONT:bold,CHARSET:ANSI)
                       PROMPT('Sector:'),AT(6,22),USE(?loc:Sector:Prompt),TRN
                       ENTRY(@n_3),AT(34,22,20,10),USE(loc:Sector),RIGHT(1),READONLY,REQ,SKIP
                       STRING(@s30),AT(76,54),USE(loc:email),FONT(,8,COLOR:Red,FONT:regular,CHARSET:ANSI),TRN
                       COMBO(@s30),AT(57,22,107,10),USE(LUG:LUG_Descripcion),DROP(5),FORMAT('119L(2)|M~Descrip' & |
  'cion~@s30@28R(2)|M~LUG Sede~L@n-7@'),FROM(Queue:FileDropCombo),IMM
                       SPIN(@n1),AT(34,41,20,10),USE(loc:ncopias),CENTER,RANGE(0,3),STEP(1)
                       PROMPT('Copias'),AT(6,41),USE(?loc:Sector:Prompt:2),TRN
                       BUTTON('Imprimir'),AT(64,38,51,14),USE(?Ok),LEFT,ICON('C:\Clarion6\Iconos_xp\Crystal\pr' & |
  'inter1.ico'),FLAT
                       BUTTON('&Cancelar'),AT(119,39,50,14),USE(?Cancel),FONT(,8,,,CHARSET:ANSI),LEFT,ICON(ICON:Cross), |
  FLAT,MSG(' '),STD(STD:Close),TIP(' ')
                       STRING('( copias=0 para vista previa )'),AT(5,54),USE(?String1),FONT(,6,,FONT:regular,CHARSET:ANSI), |
  TRN
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

Calendar3            CalendarClass
FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
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
datos_lugar ROUTINE
    if glo:nsector <> 0 then
    loc:sector = glo:nsector
    end
    LUG:LUG_Codigo=loc:sector
    get(lugar,LUG:PK_LUGAR)
    loc:sede = LUG:LUG_Sede
    loc:email=LUG:LUG_EMAIL
    display(?loc:sector, ?LUG:LUG_Descripcion)
    loc:ufecha = UltimaLectura(0,loc:sector)
    if loc:ufecha[1:10] = format(year(today()),@n04) & '-' & format(month(today()),@n02) & '-' & format(day(today()),@n02) then
       loc:ufecha = '  =Hoy=  ' & loc:ufecha[12:16]
    else
       loc:ufecha =  loc:ufecha[1:16]
    end
    display(?loc:ufecha)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('RelojArmarPartes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String3
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:Sede',glo:Sede)                                ! Added by: FileDropCombo(ABC)
  BIND('glo:super',glo:super)                              ! Added by: FileDropCombo(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  Relate:LUGAR.SetOpenRelated()
  Relate:LUGAR.Open                                        ! File LUGAR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
      ! sedee          Tomo la global
  !   message(glo:sede)
  
      if (today() % 7) = 1 then  ! si es lunes
         loc:fecha = today() - 3
      else
         loc:fecha = today() -1
      end
  
      if glo:nsector <> 0 then
         do datos_lugar
         disable(?loc:sector,?LUG:LUG_Descripcion)
      end
  
  
  
  
  
  
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB4.Init(LUG:LUG_Descripcion,?LUG:LUG_Descripcion,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:LUGAR,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(LUG:IX_Descripcion)
  FDCB4.SetFilter('LUG:LUG_Sede=glo:Sede or glo:super')
  FDCB4.AddField(LUG:LUG_Descripcion,FDCB4.Q.LUG:LUG_Descripcion) !List box control field - type derived from field
  FDCB4.AddField(LUG:LUG_Sede,FDCB4.Q.LUG:LUG_Sede) !List box control field - type derived from field
  FDCB4.AddField(LUG:LUG_Codigo,FDCB4.Q.LUG:LUG_Codigo) !Primary key field - type derived from field
  FDCB4.AddUpdateField(LUG:LUG_Codigo,loc:Sector)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LUGAR.Close
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
    OF ?Ok
       !   message(loc:sede & '--' & loc:sector)
          if loc:ncopias = 0 then
             RelojArmarPartesPRT(loc:fecha,loc:sector,loc:sede,0)
          else
             loop i = 1 to loc:ncopias
             RelojArmarPartesPRT(loc:fecha,loc:sector,loc:sede,loc:ncopias)
             end
          end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar3.SelectOnClose = True
      Calendar3.Ask('Select a Date',loc:fecha)
      IF Calendar3.Response = RequestCompleted THEN
      loc:fecha=Calendar3.SelectedDate
      DISPLAY(?loc:fecha)
      END
      ThisWindow.Reset(True)
    OF ?LUG:LUG_Descripcion
      !message(loc:sede)
      
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
  if glo:nsector <> loc:sector then
     glo:nsector = loc:sector
     do datos_lugar
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

