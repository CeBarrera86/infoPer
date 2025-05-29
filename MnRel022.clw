

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL022.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Exportar_Datos_Tarjetas PROCEDURE 

Progress:Thermometer BYTE                                  !
star                 STRING(15)                            !
i                    BYTE                                  !
Process:View         VIEW(Emplea)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW(' Exportando datos tarjetas'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),VERTICAL
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(41,42,55,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('Exportar_Datos_Tarjetas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
  Relate:TARJETA.Open                                      ! File TARJETA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Emplea, ?Progress:PctText, Progress:Thermometer, ProgressMgr, EPD:RCod1_Sue)
  ThisProcess.AddSortOrder(EPD:Key1_sue)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Emplea,'QUICKSCAN=on')
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
    Relate:TARJETA.Close
  END
  ProgressMgr.Kill()
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


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  if EPD:activo_sue <> 'N' THEN
      TAR:TAR_Legajo=EPD:RCod1_Sue
      TAR:TAR_Reloj=0
      TAR:TAR_Codigo=0
      set(TAR:PK_TARJETA,TAR:PK_TARJETA)
  
      star=''
      loop
         next(TARJETA)
         if errorcode() then break.
         if TAR:TAR_Legajo <> EPD:RCod1_Sue then break.
         star=clip(star) & format(TAR:TAR_Reloj,@n01) & format(TAR:TAR_Codigo,@n04)
      end
  
      loop i = 1 to 15
         if star[i] = ' ' then star[i] = '0'.
      end
  
      if star <> EPD:Cod3_Sue then
          if star = '000000000000000' then
              message('VERIFICAR: ' & EPD:RCod1_Sue & ' [sin-datos] ' & ' [' & EPD:COD3_SUE & '] ' & EPD:nombre_sue,' Legajo [ntarNuevos] [ntarActuales] Nombre  **VERIFICAR**')
          else
              message('NOVEDAD: ' & EPD:RCod1_Sue & ' [' & star & '] ' & ' [' & EPD:COD3_SUE & '] ' & EPD:nombre_sue,' Legajo [ntarNuevos] [ntarActuales] Nombre ==NOVEDAD==')
              EPD:Cod3_Sue = star
              put(EMPLEA)
              if errorcode() = 40 then
                 message('UN CODIGO TARJETA-HUELLA YA ESTA ASIGNADO' ,' ERROR GRABANDO DATOS - Legajo: ' & EPD:RCod1_Sue)
              elsif errorcode() then
                 message('no se actualizaron tarjetas, legajo: ' & EPD:RCod1_Sue,' ERROR GRABANDO DATOS')
              end
          end
      end
  end
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

