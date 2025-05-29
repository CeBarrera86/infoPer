

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL020.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
Pasar_Datos_Emplea PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Emplea)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW(' Pasar datos EMPLEA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
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
  GlobalErrors.SetProcedureName('Pasar_Datos_Emplea')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:Emplea.Open                                       ! File Emplea used by this procedure, so make sure it's RelationManager is open
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
    Relate:EMPLEADOS.Close
    Relate:Emplea.Close
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
      EMP:EMP_Legajo = EPD:Legajo_sue
      EMP:EMP_Servicio = EPD:Servic_sue
      if access:empleados.tryfetch(EMP:PK_EMPLEADOS)
         i# = 1
      else
         i# = 0
      end
      EMP:EMP_Servicio                  =          EPD:Servic_sue
      EMP:EMP_Sector                    =          EPD:Sector_Sue
      EMP:EMP_Seccion                   =          EPD:Seccion_sue
      EMP:EMP_Nombre                    =          EPD:nombre_sue
      convertoemtoansi(EMP:EMP_Nombre)
      EMP:EMP_Calle                     =          EPD:domici_sue
      EMP:EMP_Numero                    =          0
      EMP:EMP_Piso                      =          0
      EMP:EMP_Dpto                      =          ''
      EMP:EMP_Telefono                  =          ''
      EMP:EMP_Celular                   =          ''
      EMP:EMP_Sexo                      =          EPD:sexo_sue
      EMP:EMP_Cuil                      =          EPD:cuil_sue
      EMP:EMP_Nacionalidad              =          EPD:nacion_sue
  
      case upper(EPD:Tipodoc_sue)
      of 'LE'
              EMP:EMP_Tipo_Documento            =  4
      of 'LC'
              EMP:EMP_Tipo_Documento            =  5
      of 'DN'
              EMP:EMP_Tipo_Documento            =  1
      end ! case
  
  
      EMP:EMP_NDocumento                =          EPD:cuil_sue
  
      EMP:EMP_Fecha_Ingreso_DATE        =       date(EPD:feing1_sue[3:4], EPD:feing1_sue[1:2], EPD:feing1_sue[5:6])
      EMP:EMP_Fecha_Nacimiento_DATE     =       date(EPD:fenaci_sue[3:4], EPD:fenaci_sue[1:2], EPD:fenaci_sue[5:6])
      EMP:EMP_Fecha_Base_DATE           =       date(EPD:feing2_sue[3:4], EPD:feing2_sue[1:2], EPD:feing2_sue[5:6])
      EMP:EMP_Fecha_Base_Licencia_DATE  =       date(EPD:feing3_sue[3:4], EPD:feing3_sue[1:2], EPD:feing3_sue[5:6])
      EMP:EMP_Fecha_Para_Ascenso_DATE   =       date(EPD:feing4_sue[3:4], EPD:feing4_sue[1:2], EPD:feing4_sue[5:6])
      EMP:EMP_Fecha_Baja_DATE           =       date(EPD:febaja_sue[3:4], EPD:febaja_sue[1:2], EPD:febaja_sue[5:6])
  
      EMP:EMP_Convenio                  =       EPD:Conven_sue
      EMP:EMP_Categoria                 =       EPD:ccateg_sue
      EMP:EMP_Cargo                     =       ''
      EMP:EMP_Banco                     =       0
      EMP:EMP_Tipo_Cuenta               =       0
      EMP:EMP_Numero_Cuenta             =       ''
      EMP:EMP_TipoSemana                =       EPD:tipsem_sue
      
      EMP:EMP_HExtras                   =       EPD:autoex_sue
      EMP:EMP_Fecha_Cambio_Categoria_DATE =     date(EPD:antcat_sue[3:4], EPD:antcat_sue[1:2], EPD:antcat_sue[5:6])
  
      EMP:EMP_Jubilacion                =       EPD:reten_sue[1]
  
      EMP:EMP_Reparto                   =       0
      EMP:EMP_ObraSocial                =       EPD:reten_sue[2]
  
      EMP:EMP_Lugar                     =       0
  
      IF EPD:activo_sue THEN
         EMP:EMP_ACTIVO='S'
      ELSE
         EMP:EMP_ACTIVO='N'
      END
  
      EMP:EMP_Tarjeta                   =       EPD:Nrotar1_sue
  
      !EMP:EMP_PorBae = format(EPD:porbae_sue,@n_5.2)
      if i# = 1
          access:empleados.tryInsert ()
          message('Nuevo Registro: ' & EMP:EMP_Nombre)
      else
  !        if upper(EPD:activo_sue) = 'S'
              access:empleados.TryUpdate()
  !        end
      end
     
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

