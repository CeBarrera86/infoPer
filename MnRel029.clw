

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('MNREL029.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
HorasDevPRT PROCEDURE (dlugar,legajo, fdesde,fhasta,general)

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
loc:nombre           STRING(40)                            !
QMARCADAS            QUEUE,PRE(QMA)                        !
LUGAR                STRING(30)                            !
SERVILEG             STRING(4)                             !
NOMBRE               STRING(30)                            !
FECHA                LONG                                  !
HDESDE               LONG                                  !
HHASTA               LONG                                  !
TIPO                 STRING(10)                            !
MINUTOS              LONG                                  !
HORAS                STRING(7)                             !
SALDO                STRING(7)                             !
OBSERVACION          STRING(20)                            !
                     END                                   !
LOC:LUGAR            LONG                                  !
LOC:LEGAJO           LONG                                  !
LOC:FDESDE           LONG                                  !
LOC:FHASTA           LONG                                  !
XLEGAJO              STRING(@n04)                          !
MTOTAL               LONG                                  !
HTOTAL               LONG                                  !
ZTOTAL               LONG                                  !
GMINUTOS             LONG                                  !
GHORAS               STRING(10)                            !
Process:View         VIEW(LUGAR)
                       PROJECT(LUG:LUG_Codigo)
                       PROJECT(LUG:LUG_Sede)
                       JOIN(SED:PK_SEDE_RELOJ,LUG:LUG_Sede)
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

Report               REPORT('Parte Diario Personal'),AT(10,27,194,253),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9, |
  ,,CHARSET:ANSI),MM
                       HEADER,AT(10,5,194,22),USE(?Header)
                         BOX,AT(165,9,22,6),USE(?Box2),COLOR(COLOR:Black)
                         STRING('C O R P I C O  -  Informe Control Devolución Horas'),AT(5,10,112,5),USE(?String25), |
  FONT('Arial',12,,FONT:regular),TRN
                         STRING('Datos Actualizados a la fecha:'),AT(120,10,46,5),USE(?String28),TRN
                         STRING(@d06b),AT(168,10),USE(glo:fecha),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                         BOX,AT(3,15,190,6),USE(?Box1),COLOR(COLOR:Black),FILL(00CECED0h)
                         STRING('Legajo'),AT(21,16,10,4),USE(?String20),TRN
                         STRING('Fecha'),AT(36,16,9,4),USE(?String21:2),TRN
                         STRING('Horario'),AT(60,16,11,4),USE(?String21),TRN
                         STRING('Tipo'),AT(83,16,11,4),USE(?String21:3),CENTER,TRN
                         STRING('Horas'),AT(109,16,9,4),USE(?String23),TRN
                         STRING('Saldo'),AT(168,16,9,4),USE(?String23:2),TRN
                         STRING('Observaciones'),AT(130,16,22,4),USE(?String24),TRN
                       END
break2                 BREAK(QMA:LUGAR)
break1                   BREAK(QMA:SERVILEG)
                           HEADER,AT(,,,6)
                             STRING(@s30),AT(22,1,74,4),USE(QMA:LUGAR),FONT(,10,,FONT:bold,CHARSET:ANSI)
                             STRING(@s30),AT(123,1,68,4),USE(QMA:NOMBRE),FONT(,10,,FONT:bold,CHARSET:ANSI)
                             LINE,AT(193,1,0,5),USE(?Line5:2),COLOR(COLOR:Black)
                             LINE,AT(3,5,190,0),USE(?Line1:5),COLOR(COLOR:Black)
                             LINE,AT(3,1,0,5),USE(?Line5),COLOR(COLOR:Black)
                             LINE,AT(3,1,190,0),USE(?Line1),COLOR(COLOR:Black)
                           END
Detalle                    DETAIL,AT(,,,4),USE(?Detalle),FONT('Arial',10)
                             LINE,AT(3,0,0,4),USE(?Line5:5),COLOR(COLOR:Black)
                             STRING(@s4),AT(22,0,9,4),USE(QMA:SERVILEG),FONT(,9,,,CHARSET:ANSI)
                             STRING(@D06B),AT(33,0,19,4),USE(QMA:FECHA),FONT(,9,,,CHARSET:ANSI),RIGHT(1)
                             STRING(@T01),AT(55,0,10,4),USE(QMA:HDESDE),FONT(,9,,,CHARSET:ANSI),RIGHT(1)
                             STRING(@T01),AT(66,0,10,4),USE(QMA:HHASTA),FONT(,9,,,CHARSET:ANSI),RIGHT(1),TRN
                             STRING(@s10),AT(80,0,22,4),USE(QMA:TIPO),FONT(,9,,,CHARSET:ANSI)
                             STRING(@s7),AT(104,0,15,4),USE(QMA:HORAS),FONT(,9,,,CHARSET:ANSI),RIGHT
                             STRING(@s7),AT(163,0,15,4),USE(QMA:SALDO),FONT(,9,,,CHARSET:ANSI),RIGHT,TRN
                             LINE,AT(193,0,0,4),USE(?Line5:6),COLOR(COLOR:Black)
                             STRING(@s20),AT(123,0,38,4),USE(QMA:OBSERVACION),FONT(,9,,,CHARSET:ANSI)
                           END
detail1                    DETAIL,AT(,,,11),USE(?detail1)
                             LINE,AT(3,6,0,4),USE(?Line5:7),COLOR(COLOR:Black)
                             LINE,AT(3,6,190,0),USE(?Line1:2),COLOR(COLOR:Black)
                             STRING('Total General:'),AT(80,6,19,3),USE(?String29),FONT(,8,,,CHARSET:ANSI),TRN
                             STRING(@s10),AT(98,6,17,3),USE(GHORAS),FONT(,8,,,CHARSET:ANSI),RIGHT,TRN
                             LINE,AT(193,6,0,4),USE(?Line5:8),COLOR(COLOR:Black)
                             LINE,AT(3,10,190,0),USE(?Line1:3),COLOR(COLOR:Black)
                           END
                           FOOTER,AT(,,,2)
                             LINE,AT(3,0,0,1),USE(?Line5:3),COLOR(COLOR:Black)
                             LINE,AT(193,0,0,1),USE(?Line5:4),COLOR(COLOR:Black)
                             LINE,AT(3,1,190,0),USE(?Line1:4),COLOR(COLOR:Black)
                           END
                         END
                         FOOTER,AT(,,,1),PAGEAFTER(1)
                         END
                       END
                       FOOTER,AT(10,279,194,6),USE(?Footer)
                         STRING('Página'),AT(87,1),USE(?String26),FONT(,8,,FONT:regular),TRN
                         STRING(@n02),AT(98,1),USE(?String27),FONT(,8,,FONT:regular),PAGENO,TRN
                       END
                     END
ThisWindow           CLASS(ReportManager)
EndReport              PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Next                   PROCEDURE(),BYTE,PROC,DERIVED
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

ThisWindow.EndReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  IF LOC:LEGAJO = 0 AND GENERAL THEN
      HTOTAL = GMINUTOS / 60
      MTOTAL = GMINUTOS % 60
      GHORAS = CLIP(LEFT(FORMAT(HTOTAL,@N_4))) & ':' & FORMAT(MTOTAL,@N02)
      IF GMINUTOS < 0 THEN
         GHORAS = '-' & CLIP(GHORAS)
      END
      PRINT(RPT:Detail1)
  END
  ReturnValue = PARENT.EndReport()
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('HorasDevPRT')
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
      loc:lugar = dlugar
      loc:legajo = legajo
      loc:fdesde = fdesde
      loc:fhasta = fhasta
  
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:LUGAR, ?Progress:PctText, Progress:Thermometer, RECORDS(QMARCADAS))
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = 100
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
      loc:str =  'call personal..HORASDEV(' & format(loc:lugar,@n04) & ',' & format(loc:legajo,@n04) & ',' & format(loc:fdesde,@n05) & ',' & format(loc:fhasta,@n05) & ')'
      setclipboard(loc:str)
      tmpUsosMultiples{prop:sql} = clip(upper(loc:str))
      if errorcode() then stop(fileerror()).
      gminutos=0
      loop
          next(TmpUsosMultiples)
          if errorcode() then break.
          QMA:LUGAR = TUM:Col01
          QMA:SERVILEG = TUM:Col02
          QMA:NOMBRE = TUM:Col03
          IF TUM:Col04 = 99999 THEN
             QMA:FECHA = TODAY()
          ELSE
             QMA:FECHA = TUM:Col04
          END
          QMA:HDESDE = TUM:Col05
          QMA:HHASTA =TUM:Col06
          CASE TUM:Col07[1]
              OF 'T'
              QMA:TIPO = 'Trabajadas'
              OF 'D'
              QMA:TIPO = 'Devolución'
              ELSE
              QMA:TIPO = ''
          END
          QMA:MINUTOS = TUM:Col08
          QMA:HORAS = ''
          QMA:OBSERVACION = TUM:Col09
          ADD(QMARCADAS)
          gminutos += qma:minutos
      end
  
     XLEGAJO = ''
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


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

Progress BYTE,AUTO
  CODE
      ThisReport.RecordsProcessed+=1
      GET(QMARCADAS,ThisReport.RecordsProcessed)
      IF ERRORCODE() THEN
         ReturnValue = Level:Notify
      ELSE
         ReturnValue = Level:Benign
      END
      IF ReturnValue = Level:Notify
          IF ThisReport.RecordsProcessed>RECORDS(QMARCADAS)
             SELF.Response = RequestCompleted
             POST(EVENT:CloseWindow)
             RETURN Level:Notify
          ELSE
             SELF.Response = RequestCancelled
             POST(EVENT:CloseWindow)
             RETURN Level:Fatal
          END
      ELSE
         Progress = ThisReport.RecordsProcessed / ThisReport.RecordsToProcess*100
         IF Progress > 100 THEN Progress = 100.
         IF Progress <> Progress:Thermometer
           Progress:Thermometer = Progress
           DISPLAY()
         END
      END
      RETURN Level:Benign
  ReturnValue = PARENT.Next()
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
      IF XLEGAJO <> QMA:SERVILEG THEN
         ZTOTAL = 0
         XLEGAJO = QMA:SERVILEG
      END
  
      HTOTAL = QMA:MINUTOS / 60
      MTOTAL = QMA:MINUTOS - (HTOTAL * 60)
      QMA:HORAS = CLIP(LEFT(FORMAT(HTOTAL,@N_4))) & ':' & FORMAT(MTOTAL,@N02)
      IF QMA:MINUTOS < 0 THEN
         QMA:HORAS = '-' & CLIP(QMA:HORAS)
      END
  
      ZTOTAL += QMA:MINUTOS
      HTOTAL = ZTOTAL / 60
      MTOTAL = ZTOTAL - (HTOTAL * 60)
      QMA:SALDO = CLIP(LEFT(FORMAT(HTOTAL,@N_4))) & ':' & FORMAT(MTOTAL,@N02)
      IF ZTOTAL < 0 THEN
         QMA:SALDO = '-' & CLIP(QMA:SALDO)
      END
  
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detalle)
  RETURN ReturnValue

