

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL018.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
VerMarcadas PROCEDURE 

Tarjetas             STRING(@n05)                          !
BRW1::View:Browse    VIEW(Reloj)
                       PROJECT(REL:Fecha)
                       PROJECT(REL:Hora)
                       PROJECT(REL:Nro_Reloj)
                       PROJECT(REL:Nro_Tarjeta)
                       PROJECT(REL:Hora_Group)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
REL:Fecha              LIKE(REL:Fecha)                !List box control field - type derived from field
REL:Hora               LIKE(REL:Hora)                 !List box control field - type derived from field
REL:Nro_Reloj          LIKE(REL:Nro_Reloj)            !List box control field - type derived from field
REL:Nro_Tarjeta        LIKE(REL:Nro_Tarjeta)          !List box control field - type derived from field
REL:Hora_Group         STRING(SIZE(REL:Hora_Group))   !Primary key field - STRING defined to hold GROUP's contents
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
BrowseWindow         WINDOW('Marcadas Solo Vista'),AT(0,0,147,163),GRAY,MDI,SYSTEM
                       LIST,AT(5,5,138,156),USE(?List),HVSCROLL,FORMAT('40L(2)|M~Fecha~@d6@20L(2)|M~Hora~@T01@' & |
  '11C(2)|M~R~@n01@20L(2)|M~Nro Tarjeta~@n04@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  VCR
                       BUTTON('&Insertar'),AT(5,132,40,12),USE(?Insert),HIDE
                       BUTTON('&Cambiar'),AT(49,132,40,12),USE(?Change),DEFAULT,HIDE
                       BUTTON('&Borrar'),AT(93,132,40,12),USE(?Delete),HIDE
                       BUTTON('&Seleccionar'),AT(21,148,45,12),USE(?Select),HIDE
                       BUTTON('Cerrar'),AT(88,148,40,12),USE(?Close),HIDE
                     END

BRW1::LastSortOrder       BYTE
BRW1::SortHeader  CLASS(SortHeaderClassType) !Declare SortHeader Class
QueueResorted          PROCEDURE(STRING pString),VIRTUAL
                  END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('VerMarcadas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Reloj.Open                                        ! File Reloj used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  tarjetas = 0
  BRW1.Init(?List,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:Reloj,SELF) ! Initialize the browse manager
  SELF.Open(BrowseWindow)                                  ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(REL:Fecha,BRW1.Q.REL:Fecha)                ! Field REL:Fecha is a hot field or requires assignment from browse
  BRW1.AddField(REL:Hora,BRW1.Q.REL:Hora)                  ! Field REL:Hora is a hot field or requires assignment from browse
  BRW1.AddField(REL:Nro_Reloj,BRW1.Q.REL:Nro_Reloj)        ! Field REL:Nro_Reloj is a hot field or requires assignment from browse
  BRW1.AddField(REL:Nro_Tarjeta,BRW1.Q.REL:Nro_Tarjeta)    ! Field REL:Nro_Tarjeta is a hot field or requires assignment from browse
  BRW1.AddField(REL:Hora_Group,BRW1.Q.REL:Hora_Group)      ! Field REL:Hora_Group is a hot field or requires assignment from browse
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.Init(Queue:Browse,?List,'','',BRW1::View:Browse)
  BRW1::SortHeader.UseSortColors = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Reloj.Close
  !Kill the Sort Header
  BRW1::SortHeader.Kill()
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !Initialize the Sort Header using the Browse Queue and Browse Control
  BRW1::SortHeader.SetAlerts()


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
  !Take Sort Headers Events
  IF BRW1::SortHeader.TakeEvents()
     RETURN Level:Notify
  END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder<>NewOrder THEN
     BRW1::SortHeader.ClearSort()
  END
  BRW1::LastSortOrder=NewOrder
  RETURN ReturnValue

BRW1::SortHeader.QueueResorted       PROCEDURE(STRING pString)
  CODE
    IF pString = ''
       BRW1.RestoreSort()
       BRW1.ResetSort(True)
    ELSE
       BRW1.ReplaceSort(pString)
    END
