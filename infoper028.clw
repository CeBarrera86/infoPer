

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER028.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER027.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
RecordatoriosAlarmas PROCEDURE 


Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
               !Primary key field - type derived from field
SEC:SEC_ID             LIKE(SEC:SEC_ID)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END

Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Detalle de Recordatorios y Alarmas'),AT(,,350,235),FONT('Microsoft Sans Serif',10, |
  COLOR:Black,FONT:bold,CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('RecordatoriosAlarmas'), |
  SYSTEM
                       BUTTON('&Cerrar'),AT(304,216,40,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&Nuevo'),AT(5,216,45,14),USE(?Insert),FONT(,,00701919h),LEFT,ICON('wainsert.ico')
                       BUTTON('&Modificar'),AT(52,216,45,14),USE(?Change),FONT(,,00701919h),LEFT,ICON('wachange.ico')
                       BUTTON('&Borrar'),AT(100,216,45,14),USE(?Delete),FONT(,,00701919h),LEFT,ICON('wadelete.ico')
                       GROUP('Recordatorios'),AT(5,5,340,140),USE(?GROUP1),BOXED
                         LIST,AT(10,15,330,125),USE(?List),FONT(,10,,FONT:regular),HVSCROLL,FORMAT('25C|~Legajo~' & |
  '@N5B@35C|~Desde~@d17@35C|~Hasta~@d17@122L(1)|~Sector~C(0)@s50@20C|~Motivo~@S4@60L(1)' & |
  '|M~Título~C(0)@s20@800L(1)|M~Descripción~C(0)@s255@'),FROM(Queue:Browse),IMM
                       END
                       GROUP('Alarmas'),AT(5,150,340,60),USE(?GROUP2),BOXED
                         LIST,AT(10,160,330,45),USE(?List:2),FONT(,,,FONT:regular),VSCROLL,FORMAT('60C|~ID~@N5B@' & |
  '140C|~Fecha~@D06B@40C|~Hora~@T01B@'),FROM(Queue:Browse:1),IMM
                       END
                       BUTTON('Crear Alarma'),AT(192,216),USE(?Alarma)
                       BUTTON('&Select'),AT(176,103),USE(?Select)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator

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
  GlobalErrors.SetProcedureName('RecordatoriosAlarmas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Cancel
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.Q &= Queue:Browse
  BRW5.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW5.RetainRow = 0
  BRW5.AddSortOrder()                        ! Add the sort order for REC:PK_REC_ID for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5.AddField(SEC:SEC_ID,BRW5.Q.SEC:SEC_ID)              ! Field SEC:SEC_ID is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:1
  BRW7.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW7.RetainRow = 0

  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
   BRW7.SetFilter('(RAL:RAL_REC_ID)')                       ! Apply filter expression to browse
  BRW5.AskProcedure = 1                                    ! Will call: FormRECORDATORIO
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened

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
    FormRECORDATORIO
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
    OF ?Delete
      
      
          
          IF NOT ERRORCODE()  THEN
              
          ELSE
              STOP(ERROR())
          END
  
      !RAL:RAL_REC_ID = REC:REC_ID
      !GET(RECORDATORIO_ALARMAS, RAL:FK_RAL_REC_ID)
      !MESSAGE(RECORD())
      !IF NOT ERRORCODE() THEN
      !    Access:RECORDATORIO_ALARMAS.DeleteRecord()
      !    MESSAGE('Se ELIMINÓ la/s alarma/s asociada/s', 'Eliminación', ICON:Exclamation, BUTTON:OK, 1)
      !END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Alarma
      ThisWindow.Update()
      GlobalRequest = InsertRecord
      
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


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END

