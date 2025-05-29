

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL031.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
IngresoHHMM PROCEDURE 

TMINUTOS             SHORT                                 !
HTOTAL               LONG                                  !
MTOTAL               LONG                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW(' Conversion de HORAS y MINUTOS '),AT(,,165,60),FONT('MS Sans Serif',8,,FONT:regular), |
  CENTER,GRAY
                       STRING('HORAS:'),AT(14,15),USE(?String1)
                       ENTRY(@n_3B),AT(45,13,31,12),USE(HTOTAL),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI),LEFT(8)
                       STRING('MINUTOS:'),AT(85,15),USE(?String1:2)
                       ENTRY(@n_2B),AT(124,13,26,12),USE(MTOTAL),FONT(,12,COLOR:Blue,FONT:bold,CHARSET:ANSI),LEFT(8)
                       BUTTON('ACEPTAR'),AT(13,37,65,14),USE(?Button3),LEFT,ICON(ICON:Tick)
                       BUTTON('CANCELAR'),AT(88,37,65,14),USE(?Button3:2),LEFT,ICON(ICON:Cross)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(TMINUTOS)

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
  GlobalErrors.SetProcedureName('IngresoHHMM')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
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
    OF ?Button3
      IF NOT INRANGE(MTOTAL,0,59) THEN
         SELECT(?MTOTAL)
         CYCLE
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update()
         TMINUTOS = (HTOTAL * 60) + MTOTAL
      !   IF ESNEGATIVO THEN TMINUTOS = TMINUTOS * (-1).
         POST(EVENT:CloseWindow)
    OF ?Button3:2
      ThisWindow.Update()
      TMINUTOS=0
      POST(EVENT:CloseWindow)
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

