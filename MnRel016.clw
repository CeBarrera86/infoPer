

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('MNREL016.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Exportar_a_Btireve PROCEDURE 

Loc:Fecha            DATE                                  !
loc:StrFecha         STRING(10)                            !
loc:horaString       STRING(5)                             !
Hora                 GROUP,PRE(),OVER(loc:horaString)      !
HHH                  STRING(@n02)                          !
Punto                STRING(1)                             !
MMM                  STRING(@n02)                          !
                     END                                   !
loc:str              STRING(4000)                          !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
Window               WINDOW('Exportar Datos Para BTrieve'),AT(,,223,65),FONT('MS Sans Serif',8,,FONT:regular),GRAY
                       PANEL,AT(4,4,212,49),USE(?Panel1),BEVEL(2,-2),FILL(00B48B6Dh)
                       PROMPT('Fecha:'),AT(12,18),USE(?Loc:Fecha:Prompt),TRN
                       ENTRY(@d17),AT(38,18,60,10),USE(Loc:Fecha)
                       BUTTON,AT(101,16,14,12),USE(?Calendar),ICON('D:\DesCla61\Personal\icos\WIZINS.ICO'),FLAT,SKIP
                       STRING(@d6),AT(48,34),USE(REL:Fecha),TRN
                       BUTTON,AT(149,15,27,20),USE(?OkButton),LEFT,ICON('D:\DesCla61\Personal\icos\ok.ico'),DEFAULT, |
  FLAT
                       BUTTON,AT(178,15,27,20),USE(?CancelButton),LEFT,ICON('D:\DesCla61\Personal\icos\cancelar.ico'), |
  FLAT,STD(STD:Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Calendar1            CalendarClass

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
  GlobalErrors.SetProcedureName('Exportar_a_Btireve')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Reloj.Open                                        ! File Reloj used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
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
  IF SELF.FilesOpened
    Relate:Reloj.Close
    Relate:TMPUsosMultiples.Close
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Calendar
      ThisWindow.Update()
      Calendar1.SelectOnClose = True
      Calendar1.Ask('Select a Date',Loc:Fecha)
      IF Calendar1.Response = RequestCompleted THEN
      Loc:Fecha=Calendar1.SelectedDate
      DISPLAY(?Loc:Fecha)
      END
      ThisWindow.Reset(True)
    OF ?OkButton
      ThisWindow.Update()
        loc:StrFecha = format(day(loc:fecha),@n02) & '/' & format(month(loc:fecha),@n02)  & '/' & format(year(loc:fecha),@n04)
        loc:str = 'select his_fecha,his_hora,emp_tarjeta from personal..hisreloj ' &|
                  '    inner join personal..empleados on his_legajo = emp_legajo ' &|
                  ' where his_fecha = ' & '''' & Clip(loc:StrFecha) & ''''
        TMPUsosMultiples{prop:sql} = clip(loc:str)
        if errorcode() then stop(Fileerror()).
        i# = 0
        
        loop
          next(TMPUsosMultiples)
          if errorcode() then break.
          i#+=1
          REL:Fecha = format(year(loc:fecha) - 2000,@n02) & format(month(loc:fecha),@n02) & format(day(loc:fecha),@n02)
      
          loc:horaString =   clip(tum:col02)
          REL:HH = HHh
          REL:MM = MMm
          REL:Nro_Tarjeta = format(tum:col03,@n05)
       !   message(REL:Fecha & '|' & REL:Hora & '|' & REL:Nro_Tarjeta)
          add(Reloj)
          if errorcode() then
              message(FileError()).
        end ! loop
        message('Procesados: ' & i#,'Corpico',Icon:Exclamation)
        post(event:closeWindow)
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

