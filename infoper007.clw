

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER007.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
LPAlpha PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(EMPLEADOS)
                       PROJECT(EPL:EMP_DIRECCION)
                       PROJECT(EPL:EMP_LEGAJO)
                       PROJECT(EPL:EMP_MENSUAL)
                       PROJECT(EPL:EMP_NOMBRE)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1010,1396,6000,9292),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(990,469,6000,917),USE(?unnamed:3)
                         STRING('CORPICO --- Listado de Empleados '),AT(10,115,6000,220),USE(?unnamed:6),FONT(,14,, |
  FONT:bold),CENTER
                         BOX,AT(73,615,5854,281),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Silver)
                         STRING('Legajo'),AT(188,677,458,167),USE(?unnamed:5),TRN
                         STRING('Nombre'),AT(1240,677,1104,167),USE(?unnamed:4),TRN
                         STRING('Direccion'),AT(3458,677,1104,167),USE(?unnamed:2),TRN
                         STRING('Mensual'),AT(5188,677,646,167),USE(?unnamed),TRN
                       END
detail                 DETAIL,AT(,,6000,167),USE(?detail)
                         STRING(@n_4),AT(63,-10,521,156),USE(EPL:EMP_LEGAJO),RIGHT(1)
                         STRING(@s31),AT(719,-10,2323,156),USE(EPL:EMP_NOMBRE)
                         STRING(@s25),AT(3302,-10,1875,156),USE(EPL:EMP_DIRECCION)
                         CHECK,AT(5406,0,417,156),USE(EPL:EMP_MENSUAL)
                       END
                       FOOTER,AT(1000,10698,6000,219),USE(?unnamed:7)
                         STRING(@pPagina <<<#p),AT(5250,30,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Open                   PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
?Exportarword  EQUATE(-1025)

QHList QUEUE,PRE(QHL)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
TextColor             SHORT
TextBack             SHORT
TextFont               STRING(20)
TextFontSize      SHORT
FTextColor             SHORT
FTextBack             SHORT
FTextFont               STRING(20)
FTextFontSize      SHORT
                         END
Titulo                     STRING(100)
QPAR QUEUE,PRE(Q)
FieldPar                 CSTRING(200)
                         END
evo::any     ANY
evo::envio   CSTRING(5000)
evo::path    CSTRING(5000)

Evo::Group  GROUP,PRE()
Evo::Aplication STRING(100)
Evo::Procedure STRING(100)
Evo::Html   BYTE
Evo::xls   BYTE
Evo::doc  BYTE
Evo::Ascii BYTE
Evo::xml   BYTE
Evo:typexport STRING(10)
   END


EVO:QDatos               QUEUE,PRE(QDat)
Col1                       CSTRING(100)
Col2                       CSTRING(100)
Col3                       CSTRING(100)
Col4                       CSTRING(100)
Col5                       CSTRING(100)
Col6                       CSTRING(100)
Col7                       CSTRING(100)
Col8                       CSTRING(100)
Col9                       CSTRING(100)
Col10                      CSTRING(100)
Col11                      CSTRING(100)
Col12                      CSTRING(100)
Col13                      CSTRING(100)
Col14                      CSTRING(100)
Col15                      CSTRING(100)
Col16                      CSTRING(100)
Col17                      CSTRING(100)
Col18                      CSTRING(100)
Col19                      CSTRING(100)
Col20                      CSTRING(100)
Col21                      CSTRING(100)
Col22                      CSTRING(100)
Col23                      CSTRING(100)
Col24                      CSTRING(100)
Col25                      CSTRING(100)
Col26                      CSTRING(100)
Col27                      CSTRING(100)
Col28                      CSTRING(100)
Col29                      CSTRING(100)
Col30                      CSTRING(100)
Col31                      CSTRING(100)
Col32                      CSTRING(100)
Col33                      CSTRING(100)
Col34                      CSTRING(100)
Col35                      CSTRING(100)
Col36                      CSTRING(100)
Col37                      CSTRING(100)
Col38                      CSTRING(100)
Col39                      CSTRING(100)
Col40                      CSTRING(100)
Col41                      CSTRING(100)
Col42                      CSTRING(100)
Col43                      CSTRING(100)
Col44                      CSTRING(100)
Col45                      CSTRING(100)
Col46                      CSTRING(100)
Col47                      CSTRING(100)
Col48                      CSTRING(100)
Col49                      CSTRING(100)
Col50                      CSTRING(100)
 END
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
QCargaExport ROUTINE
!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
        ADD(EVO:QDatos)
        ASSERT (NOT ErrorCode())
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------
CargaParametros ROUTINE
        FREE(QHList)
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        FREE(QPar)
        Q:FieldPar  = ''
        ADD(QPar)!.1.
        Q:FieldPar  = ';'
        ADD(QPar)!.2.
        Q:FieldPar  = 'Spanish'
        ADD(QPar)!.3.
        Q:FieldPar  = ''
        ADD(QPar)!.4.
        Q:FieldPar  = true
        ADD(QPar)!.5.
        Q:FieldPar  = ''
        ADD(QPar)!.6.
        Q:FieldPar  = ''
        ADD(QPar)!.7.
        Q:FieldPar  = 'FREE'
        ADD(QPar)   !.8.
        Titulo = 'Report the EMPLEADOS'
        Q:FieldPar  = 'REPORT'
        ADD(QPar)   !.9.
        Q:FieldPar  = 1 !Order
         ADD(QPar)   !.10
         Q:FieldPar  = 0
         ADD(QPar)   !.11
         Q:FieldPar  = '1'
         ADD(QPar)   !.12

         Q:FieldPar  = ''
         ADD(QPar)   !.13

         Q:FieldPar  = ''
         ADD(QPar)   !.14

         Q:FieldPar  = ''
         ADD(QPar)   !.15

         Q:FieldPar  = '16'
        ADD(QPar)   !.16

        Q:FieldPar  =  1
        ADD(QPar)   !.17.
        Q:FieldPar  =  2
        ADD(QPar)   !.18.
        Q:FieldPar  =  '2'
        ADD(QPar)   !.19.
        Q:FieldPar  =  12
        ADD(QPar)   !.20.
        Q:FieldPar  = 0 !Exporta a excel sin borrar
        ADD(QPar)     !.21
        Q:FieldPar  = 0         !Nro Pag. Desde Report (BExp)
        ADD(QPar)     !.22
        Q:FieldPar  = 0
        ADD(QPar)     !.23 Caracteres Encoding para xml
        Q:FieldPar  = 1
        ADD(QPar)      !24
        Q:FieldPar  = '13021968'
        ADD(QPar)     !.25
  !---------------------------------------------------------------------------------------------
!!Registration 
        Q:FieldPar  = ''
        ADD(QPar)   ! 26  
        Q:FieldPar  =  ''
        ADD(QPar)   ! 27  
        Q:FieldPar  =  '' 
        ADD(QPar)   ! 28  
        Q:FieldPar  =  'REXPORT' 
        ADD(QPar)   ! 29 infoper007.clw
        
        !.30 en adelante
      ! 30 en adelante

!!! Parametros Grupo
        Evo::Aplication          = 'infoper'
        Evo::Procedure          = GlobalErrors.GetProcedureName()& 1
        Evo::Html   = 1
        Evo::xls   = 1
        Evo::doc   = 1
        Evo::xml   = 1
        Evo::Ascii   = 1
        Evo:typexport = 'All'


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LPAlpha')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:EMPLEADOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, EPL:EMP_NOMBRE)
  ThisReport.AddSortOrder(EPL:PK_Nombre)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:EMPLEADOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = 100
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EMPLEADOS.Close
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
   Do QCargaExport
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
    CREATE(?Exportarword,CREATE:Item)
    ?Exportarword{PROP:Use} = LASTFIELD()+300
    ?Exportarword{PROP:Text} = 'Exportacion'
    UNHIDE(?Exportarword)
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  CASE EVENT()
    OF EVENT:Accepted
      CASE FIELD()
        OF ?Exportarword
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
          Do CargaParametros
              evo::path  = PATH()
              EcRptExport(QHList,EVO:QDatos,QPar,0,Titulo,Evo::Group)
              SETPATH(evo::path)
      END!CASE
  END!CASE
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------
  RETURN ReturnValue

