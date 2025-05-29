

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL027.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('MNREL025.INC'),ONCE        !Req'd for module callout resolution
                     END


  INCLUDE('MAPIMAIL.INC'),ONCE
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
RelojEnviarEmails PROCEDURE 

loc:fecha            DATE                                  !
loc:Sector           SHORT                                 !
loc:sede             SHORT                                 !
loc:ncopias          BYTE(2)                               !
i                    BYTE                                  !
n                    BYTE                                  !
loc:ufecha           STRING(20)                            !
loc:email            STRING(30)                            !
loc:asunto           STRING(40)                            !
loc:nombrepdf        STRING(30)                            !
   INCLUDE('MAPIMAILDATA.INC')
FDCB4::View:FileDropCombo VIEW(LUGAR)
                       PROJECT(LUG:LUG_Descripcion)
                       PROJECT(LUG:LUG_Sede)
                       PROJECT(LUG:LUG_EMAIL)
                       PROJECT(LUG:LUG_Codigo)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?LUG:LUG_Descripcion
LUG:LUG_Descripcion    LIKE(LUG:LUG_Descripcion)      !List box control field - type derived from field
LUG:LUG_Sede           LIKE(LUG:LUG_Sede)             !List box control field - type derived from field
LUG:LUG_EMAIL          LIKE(LUG:LUG_EMAIL)            !Browse hot field - type derived from field
LUG:LUG_Codigo         LIKE(LUG:LUG_Codigo)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('  Enviar Partes Diarios por eMail'),AT(,,175,62),FONT('MS Sans Serif',10,,FONT:bold), |
  DOUBLE,TILED,CENTER,GRAY,IMM,HLP('RelojArmarPartes'),WALLPAPER('WIZABT00.GIF')
                       STRING('Ultima Actualización:'),AT(115,2,44,7),USE(?String3),FONT(,8,COLOR:Blue,FONT:regular, |
  CHARSET:ANSI)
                       PROMPT('Fecha:'),AT(6,5),USE(?loc:fecha:Prompt),TRN
                       ENTRY(@d17),AT(34,4,38,10),USE(loc:fecha),FONT(,10,,FONT:bold,CHARSET:ANSI)
                       BUTTON,AT(75,4,14,11),USE(?Calendar),ICON('D:\DesCla61\Personal\icos\WIZFIND.ICO')
                       STRING(@s16),AT(115,8),USE(loc:ufecha),FONT(,10,COLOR:Blue,FONT:bold,CHARSET:ANSI)
                       PROMPT('Sector:'),AT(6,22),USE(?loc:Sector:Prompt),TRN
                       ENTRY(@n_3),AT(34,22,20,10),USE(loc:Sector),RIGHT(1),READONLY,REQ,SKIP
                       STRING(@s30),AT(27,53),USE(loc:email),FONT(,8,COLOR:Red,FONT:regular,CHARSET:ANSI),CENTER, |
  TRN
                       COMBO(@s30),AT(57,22,107,10),USE(LUG:LUG_Descripcion),DROP(5),FORMAT('119L(2)|M~Descrip' & |
  'cion~@s30@28R(2)|M~LUG Sede~L@n-7@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('Enviar eMail'),AT(34,39,67,14),USE(?Ok),LEFT,ICON('C:\Clarion6\Iconos_xp\Crysta' & |
  'l\email.ico'),FLAT
                       BUTTON('&Cancelar'),AT(114,39,50,14),USE(?Cancel),FONT(,8,,,CHARSET:ANSI),LEFT,ICON(ICON:Cross), |
  FLAT,MSG(' '),STD(STD:Close),TIP(' ')
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

    if loc:email = '' then
       disable(?ok)
    else
       enable(?ok)
    end

!enviar_mail ROUTINE
!    RUN('cmd.exe /d /c epar.bat ' & clip(loc:email) & ' "' & clip(loc:asunto) & '"' & ' c:\pdf\parte' & format(loc:sector,@n03) & '.pdf',1)
    
enviar_mail         ROUTINE
    LOC:NOMBREPDF = 'c:\pdf\parte' & format(loc:sector,@n03) & '.pdf'
    IF EXISTS(LOC:NOMBREPDF) THEN
        !Enviar Mail
        !SavePath = PATH()    !Guardar PATH() original

        ThisMail.Init        !Iniciar sesión MAPI
        IF NOT ThisMail.LoggedOn
          ReturnCode = ThisMail.Logon('','',False,False,False,False)
        END

        IF ThisMail.LoggedOn
          !Preparar mensaje
          Subject = loc:asunto
          NoteText=''
  
          ThisMail.MessageGroup.SubjectAddress = ADDRESS(Subject)
          ThisMail.MessageGroup.NoteTextAddress = ADDRESS(NoteText)

          !Preparar Remitente
          OriginatorInfo.Nombre = 'CORPICO - OFICINA PERSONAL'  !Nombre del remitente
          OriginatorInfo.Direccion = 'personal@corpico.com.ar'    !Cuenta del remitente
          Originator.RecipClass = 0               !MAPI_ORIG
          Originator.NameAddress = ADDRESS(OriginatorInfo.Nombre)    !Esto va tal cual 
          Originator.AddressAddress = ADDRESS(OriginatorInfo.Direccion)  !Esto va tal cual
          ThisMail.MessageGroup.OriginatorAddress = ADDRESS(Originator)  !Esto va tal cual
         
          !Preparar Receptores
          RecipientInfo.Nombre[1] = clip(left(LUG:LUG_Descripcion))
          RecipientInfo.Direccion[1] = clip(left(loc:email))

          Recipient.RecipClass[1] = 1
          Recipient.NameAddress[1] = ADDRESS(RecipientInfo.Nombre[1])
          Recipient.AddressAddress[1] = ADDRESS(RecipientInfo.Direccion[1])

          RecipientInfo.Nombre[2] = ''
          RecipientInfo.Direccion[2] = ''
          Recipient.RecipClass[2] = 2
          Recipient.NameAddress[2] = ADDRESS(RecipientInfo.Nombre[1])
          Recipient.AddressAddress[2] = ADDRESS(RecipientInfo.Direccion[1])

          ThisMail.MessageGroup.RecipCount = 1     !Cantidad de receptores
          ThisMail.MessageGroup.RecipsAddress = ADDRESS(Recipient)

          !Preparar Archivos Adjuntos
        !  MPC:Adj1=loc:Adj1
        !  MPC:Adj2=loc:Adj2

          n=0
          if LOC:NOMBREPDF <> '' then
             n+=1
             AttachInfo.PathName[n] = CLIP(LEFT(LOC:NOMBREPDF)) !La ubicación del archivo a adjuntar
             AttachInfo.FileName[n] = 'ParteDiarioPersonal.PDF'   !El nombre que verá el receptor
             Attach.InPosition[n] = n
             Attach.PathNameAddress[n] = ADDRESS(AttachInfo.PathName[n])
             Attach.FileNameAddress[n] = ADDRESS(AttachInfo.FileName[n])

        !     n+=1
        !     AttachInfo.PathName[n] = 'C:\MAIL\' & CLIP(LEFT(MPC:Ano)) & '\LOGO_COR.GIF' !La ubicación del archivo a adjuntar
        !     AttachInfo.FileName[n] = ''    !El nombre que verá el receptor
        !     Attach.InPosition[n] = n
        !     Attach.PathNameAddress[n] = ADDRESS(AttachInfo.PathName[n])
        !     Attach.FileNameAddress[n] = ADDRESS(AttachInfo.FileName[n])
          end


        !
        !  if MPC:Adj1 <> '' then
        !     n+=1  
        !     AttachInfo.PathName[n] = CLIP(LEFT(MPC:Adj1)) !La ubicación del archivo a adjuntar
        !     AttachInfo.FileName[n] = 'CondicionesGenerales.doc'    !El nombre que verá el receptor
        !     Attach.InPosition[n] = n
        !     Attach.PathNameAddress[n] = ADDRESS(AttachInfo.PathName[n])
        !     Attach.FileNameAddress[n] = ADDRESS(AttachInfo.FileName[n])
        !  end
        !
        !  if MPC:Adj2 <> '' then
        !     n+=1
        !     AttachInfo.PathName[n] = CLIP(LEFT(MPC:Adj2)) !La ubicación del archivo a adjuntar
        !     AttachInfo.FileName[n] = ''    !El nombre que verá el receptor
        !     Attach.InPosition[n] = n
        !     Attach.PathNameAddress[n] = ADDRESS(AttachInfo.PathName[n])
        !     Attach.FileNameAddress[n] = ADDRESS(AttachInfo.FileName[n])
        !  end

          ThisMail.MessageGroup.FileCount = n      !Cantidad de archivos adjuntos
          ThisMail.MessageGroup.FilesAddress = ADDRESS(Attach)

          !Enviar
          ReturnCode = ThisMail.SendMail(False,False,False)
        END

        !SETPATH(SavePath)       !Restaurar PATH() original
        !select(?Browse:1)
    ELSE
        MESSAGE('PDF NO ENCONTRADO', ' ENVIAR x eMAIL')
    END

    

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('RelojEnviarEmails')
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
  
      glo:nsector = 0
      loc:email = ' << ENVIO GENERAL >>'
  
  
  
  
  
  
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  FDCB4.Init(LUG:LUG_Descripcion,?LUG:LUG_Descripcion,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:LUGAR,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(LUG:IX_Descripcion)
  FDCB4.SetFilter('LUG:LUG_Sede=glo:Sede or glo:super')
  FDCB4.AddField(LUG:LUG_Descripcion,FDCB4.Q.LUG:LUG_Descripcion) !List box control field - type derived from field
  FDCB4.AddField(LUG:LUG_Sede,FDCB4.Q.LUG:LUG_Sede) !List box control field - type derived from field
  FDCB4.AddField(LUG:LUG_EMAIL,FDCB4.Q.LUG:LUG_EMAIL) !Browse hot field - type derived from field
  FDCB4.AddField(LUG:LUG_Codigo,FDCB4.Q.LUG:LUG_Codigo) !Primary key field - type derived from field
  FDCB4.AddUpdateField(LUG:LUG_Codigo,loc:Sector)
  FDCB4.AddUpdateField(LUG:LUG_Sede,loc:sede)
  FDCB4.AddUpdateField(LUG:LUG_EMAIL,loc:email)
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
           if glo:nsector = 0 then
              CASE MESSAGE('CONFIRMA ?',' ENVíO GENERAL DE PARTES POR E-MAIL',ICON:Question,'&Si|&No',2,2)
              OF 1                               !Yes button
                  LUG:LUG_Codigo=0
                  set(LUG:PK_LUGAR,LUG:PK_LUGAR)
                  loop
                      next(LUGAR)
                      if errorcode() then break.
                      if LUG:LUG_EMAIL <> '' then
                         loc:sector = LUG:LUG_Codigo
                         loc:email=LUG:LUG_EMAIL
                         loc:asunto='Parte ' & format(loc:fecha,@d05) & ' - ' & LUG:LUG_Descripcion
                         RelojArmarPartesPDF(loc:fecha,LUG:LUG_Codigo,LUG:LUG_Sede,1)
                         do enviar_mail
                         LUG:LUG_Codigo=loc:sector+1
                         set(LUG:PK_LUGAR,LUG:PK_LUGAR)
                      end
                  end
              END !CASE
           else
              loc:asunto='Parte ' & format(loc:fecha,@d05) & ' - ' & LUG:LUG_Descripcion
              RelojArmarPartesPDF(loc:fecha,loc:sector,loc:sede,1)
              do enviar_mail
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
      !message(lug:lug_email)
      !loc:email=LUG:LUG_EMAIL
      !disable(?loc:sector,?LUG:LUG_Descripcion)
      
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

