

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL013.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
RelojArmarPartesPRT PROCEDURE (fecha,Sector,sede,ncopias)

Progress:Thermometer BYTE                                  !
loc:sector           SHORT                                 !
loc:sede             SHORT                                 !
loc:str              STRING(4000)                          !
loc:texto            STRING(20)                            !
loc:StrFecha         STRING(10)                            !
loc:Hora1            STRING(5)                             !
Loc:hora2            STRING(5)                             !
Observaciones        STRING(30)                            !
Hora3                STRING(5)                             !
Hora4                STRING(5)                             !
loc:legajo           SHORT                                 !
loc:nombre           STRING(40)                            !
QMARCADAS            QUEUE,PRE(QMA)                        !
LEGAJO               STRING(@n04)                          !
HORA                 STRING(@T01)                          !
NOMBRE               STRING(35)                            !
TARJETA              STRING(@N05)                          !
                     END                                   !
Process:View         VIEW(LUGAR)
                       PROJECT(LUG:LUG_Codigo)
                       PROJECT(LUG:LUG_Descripcion)
                       PROJECT(LUG:LUG_Sede)
                       JOIN(SED:PK_SEDE_RELOJ,LUG:LUG_Sede)
                         PROJECT(SED:SED_Descripcion)
                       END
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Imprimiendo...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT('Parte Diario Personal'),AT(10,28,194,248),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9, |
  ,,CHARSET:ANSI),MM
                       HEADER,AT(10,5,194,22),USE(?Header)
                         STRING('C O R P I C O  -  P a r t e   D i a r i o   d e   E n t r a d a s   y   S a l i' & |
  ' d a s   d e l   P e r s o n a l'),AT(4,11,177,5),USE(?String25),FONT('Arial',10,,FONT:bold), |
  TRN
                         BOX,AT(1,16,193,6),USE(?Box1),COLOR(COLOR:Black),FILL(00CECED0h)
                         STRING('Legajo'),AT(4,17),USE(?String20),TRN
                         STRING('Nombre'),AT(42,17),USE(?String21),TRN
                         STRING('Marcada Nº 1'),AT(84,17),USE(?String22),TRN
                         STRING('Marcada Nº 2'),AT(109,17),USE(?String23),TRN
                         STRING('Observaciones'),AT(148,17),USE(?String24),TRN
                       END
Detail                 DETAIL,AT(,,,5),USE(?Detail),FONT('Arial',11)
                         STRING('Sede'),AT(92,0),USE(?String5),FONT(,,,FONT:regular),TRN
                         STRING('Sector'),AT(6,0),USE(?String6),FONT(,,,FONT:regular),TRN
                         STRING(@s20),AT(110,0,44,6),USE(SED:SED_Descripcion),FONT(,,,FONT:regular),TRN
                         STRING(@d06),AT(168,0),USE(fecha),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Fecha:'),AT(155,0),USE(?String9),FONT(,,,FONT:regular),TRN
                         STRING(@s30),AT(27,0,65,6),USE(LUG:LUG_Descripcion),FONT(,,,FONT:bold),TRN
                         STRING(@n03),AT(101,0),USE(LUG:LUG_Sede),RIGHT(1),TRN
                         STRING(@n03),AT(19,0),USE(LUG:LUG_Codigo),TRN
                       END
Detalle                DETAIL,AT(,,,5),USE(?Detalle),FONT('Arial',10)
                         STRING(@s5),AT(92,0,11,5),USE(loc:Hora1),RIGHT,TRN
                         STRING(@s5),AT(109,0,11,5),USE(Loc:hora2),RIGHT,TRN
                         STRING(@s30),AT(130,0,63,5),USE(Observaciones),LEFT,TRN
                         STRING(@N_5B),AT(9,0,12,5),USE(loc:legajo),RIGHT,TRN
                         STRING(@s40),AT(24,0,63,5),USE(loc:nombre),LEFT,TRN
                       END
Detalle2               DETAIL,AT(,,,1),USE(?detalle2)
                         LINE,AT(1,0,192,0),USE(?Line2),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(10,277,194,8),USE(?Footer)
                         STRING('Página'),AT(87,1),USE(?String26),FONT(,,,FONT:regular),TRN
                         STRING(@n02),AT(98,1),USE(?String27),FONT(,,,FONT:bold),PAGENO,TRN
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('RelojArmarPartesPRT')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LUGAR.SetOpenRelated()
  Relate:LUGAR.Open                                        ! File LUGAR used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
      loc:sector = sector
      loc:sede = sede
  
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:LUGAR, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LUG:LUG_Codigo)
  ThisReport.AddSortOrder(LUG:PK_LUGAR)
  ThisReport.AddRange(LUG:LUG_Codigo,loc:sector)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:LUGAR.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = 100
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  if ncopias = 0 then
     SELF.SkipPreview = False
  else
     SELF.SkipPreview = True
  end
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
    Relate:TMPUsosMultiples.Close
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  loc:StrFecha = format(day(fecha),@n02) & '/' & format(month(fecha),@n02)  & '/' & format(year(fecha),@n04)
    loc:str =  ' select srl_legajo,his_hora, isnull(emp_nombre,'''') as emp_nombre, HIS_TARJETA from personal..SEDE_RELOJ_EMP ' &|
      ' left outer join personal..empleados on (emp_servicio * 1000 + emp_legajo) = srl_legajo ' &|
      ' left outer join personal..hisreloj on his_legajo = srl_legajo and his_fecha = ' & '''' & loc:strFecha & '''' & |
      ' where srl_lugar = ' & loc:Sector & ' and srl_sede =  ' & loc:sede & |
      '  ORDER BY HIS_Fecha, SRL_Lugar, SRL_Legajo, HIS_Hora '
  
  !! linea-cambiada    ' left outer join personal..hisreloj on his_reloj = srl_sede and his_legajo = srl_legajo and his_fecha = ' & '''' & loc:strFecha & '''' & |
  
      !setclipboard(loc:str)
      tmpUsosMultiples{prop:sql} = clip(upper(loc:str))
      if errorcode() then stop(fileerror()).
      i#   = 0
      leg# = 0
      clear(loc:hora1)
      clear(loc:hora2)
      clear(loc:legajo)
      clear(loc:nombre)
      loop
          next(TmpUsosMultiples)
          if errorcode() then
              if i# = 1 then   print(rpt:detalle).
              break.
  
          IF tum:col04 = 0 THEN ! NO VINO
              loc:legajo = deformat(tum:col01,@n04)
              loc:nombre = clip(tum:col03)
              OBSERVACIONES = 'AUSENTE'
              print(rpt:detalle2)
              print(rpt:detalle)
          ELSE
              if leg# <> tum:col01
                  IF leg# <> 0 AND loc:hora1 <> ''
                        print(rpt:detalle)
                  END
                  print(rpt:detalle2)
                  leg# = tum:col01
                  loc:legajo = deformat(tum:col01,@n06)
                  loc:nombre = clip(tum:col03)
                  loc:hora1 = clip(tum:col02)
                  loc:hora2 = '00:00'
                  observaciones = ''
                  I# = 1
                  !print(rpt:detalle)
              else
                  ! ARMAR CASE DE I SI ES UNO IMPRIMO
                  IF I# = 1
                      loc:hora2 = clip(tum:col02)
                      observaciones = ''
                      print(rpt:detalle)
                      CLEAR(LOC:LEGAJO)
                      CLEAR(LOC:NOMBRE)
                      I# = 2
                      LOC:HORA1 = ''
                      LOC:HORA2 = '00:00'
                  ELSE
      !                SI ES DOS
                      loc:hora1 = clip(tum:col02)
                      loc:hora2 = '00:00'
                      I# = 1
                  END
              ! SI ES TRES
  
              END
          END
     end ! loop
     print(rpt:detalle2)
  ReturnValue = PARENT.TakeCloseEvent()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

