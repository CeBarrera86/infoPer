

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER031.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
ArmarDatosRecaudacion PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Empleado_Comprobante)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW(' Generando Datos para Recaudacion'),AT(,,142,59),FONT('MS Sans Serif',10,,FONT:regular), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(41,42,60,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
ApplyFilter            PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('ArmarDatosRecaudacion')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  CREATE(TXDEB)
  if errorcode() then
     message('no se pudo inicializar datos para RECAUDACION')
  end
  Relate:Empleado_Comprobante.Open                         ! File Empleado_Comprobante used by this procedure, so make sure it's RelationManager is open
  Relate:TXDEB.Open                                        ! File TXDEB used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:Empleado_Comprobante, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ecp:Legajo)
  ThisProcess.AddSortOrder(Ecp:PK_Empleado_Comprobante)
  ThisProcess.AddRange(Ecp:codempresa,glo:empresa)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Empleado_Comprobante,'QUICKSCAN=on')
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Empleado_Comprobante.Close
    Relate:TXDEB.Close
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


ThisProcess.ApplyFilter PROCEDURE

  CODE
         GET(SELF.Order.RangeList.List,1)
         SELF.Order.RangeList.List.Right = glo:Ano ! Ecp:anio
         GET(SELF.Order.RangeList.List,2)
         SELF.Order.RangeList.List.Right = glo:periodo ! Ecp:periodo
  PARENT.ApplyFilter


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  TXD:EMPRESA=1
  TXD:filler1='|'
  TXD:CLIENTE=Ecp:Cliente
  TXD:filler2='|'
  TXD:SUMIN=Ecp:Suministro
  TXD:filler3='|'
  TXD:ANIO=Ecp:anio
  TXD:filler4='|'
  TXD:MES=Ecp:periodo
  TXD:filler5='|'
  TXD:FECHAVTO=format(day(Ecp:fechavto_date),@n02) & format(month(Ecp:fechavto_date),@n02) & format(year(Ecp:fechavto_date),@n04)
  TXD:filler6='|'
  TXD:IMPORTE=Ecp:Importe
  TXD:filler7='|'
  TXD:FECHAPAG=format(day(glo:fecha),@n02) & format(month(glo:fecha),@n02) & format(year(glo:fecha),@n04)
  TXD:filler8='|'
  TXD:ULTIMO='0'
  TXD:filler9='|'
  add(txdeb)
  
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

