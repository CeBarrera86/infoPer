

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL007.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
RelojIncorporarMarcadas PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(TMPReloj)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW(' Incorporando marcadas ...'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(39,42,57,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Kill                   PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('RelojIncorporarMarcadas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:HISRELOJ.Open                                     ! File HISRELOJ used by this procedure, so make sure it's RelationManager is open
  Relate:LGRELOJ.Open                                      ! File LGRELOJ used by this procedure, so make sure it's RelationManager is open
  Relate:Reloj.Open                                        ! File Reloj used by this procedure, so make sure it's RelationManager is open
  Relate:TARJETA.Open                                      ! File TARJETA used by this procedure, so make sure it's RelationManager is open
  Relate:TMPReloj.Open                                     ! File TMPReloj used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  !    glo:reloj = 2
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:TMPReloj, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(TMPReloj,'QUICKSCAN=on')
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:HISRELOJ.Close
    Relate:LGRELOJ.Close
    Relate:Reloj.Close
    Relate:TARJETA.Close
    Relate:TMPReloj.Close
  END
  GlobalErrors.SetProcedureName
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


ThisProcess.Kill PROCEDURE

  CODE
  LGR:NRELOJ=glo:reloj
  LGR:FECHAR_DATE=today()
  LGR:FECHAR_TIME=clock()
  add(LGRELOJ)
  PARENT.Kill


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      !HIS:HIS_id = (autoumber)
      HIS:HIS_Reloj   = glo:reloj
      HIS:HIS_Tarjeta = deformat(TPR:Tarjeta,@n05)
      HIS:HIS_Fecha   = TPR:Fecha ! string
      HIS:HIS_Hora    = TPR:HHora ! string
      HIS:HIS_Legajo  = 0
    ! saco el legajo
      TAR:TAR_Reloj = glo:reloj
      TAR:TAR_Codigo = deformat(TPR:Tarjeta,@n05)
      get(tarjeta,TAR:IX_Reloj_Tarjeta)
      if not errorcode()   ! si queda en 0 tenesmos un problema
              HIS:HIS_Legajo = TAR:TAR_Legajo
      else
              HIS:HIS_Legajo = 0
      end
    ! Armo el datetime
      HIS:HIS_Fecha_Date_DATE = date(deformat(TPR:Mes,@n02),deformat(TPR:Dia,@n02),deformat(TPR:Ano,@n04)) ! date
      HIS:HIS_Fecha_Date_TIME = TPR:Horita ! time
    ! grabo
      access:HisReloj.TryInsert()
      ! si esta duplicado no lo graba ! es automatico ,...............
  
      REL:Fecha = format(TPR:Ano - 2000,@n02) & format(TPR:Mes,@n02) & format(TPR:Dia,@n02)
      REL:Hora = TPR:GHH & TPR:GMM
      REL:Nro_Reloj = format(glo:reloj,@n1)
      REL:Nro_Tarjeta = format(tpr:tarjeta,@n04)
      ADD(RELOJ)
  
  
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

