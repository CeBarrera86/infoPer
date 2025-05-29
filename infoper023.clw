

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER023.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER017.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER024.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER025.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the DETALLE_HORAS_EXTRA file
!!! </summary>
ProcesarHorasExtras PROCEDURE 

Reembolso            SHORT                                 !
Loc:TipoHE           STRING(3)                             !
Loc:Horas            SHORT                                 !
Loc:Minutos          SHORT                                 !
Loc:estado           STRING(10)                            !
Loc:IdHoraExtra      SHORT                                 !
Loc:CodReembolso     SHORT                                 !
Loc:tiempo           DECIMAL(7,2)                          !
Loc:convenio         STRING(10)                            !
Loc:fecha            DATE                                  !
Loc:fecha2           DATE                                  !
Loc:legajo           SHORT                                 !
Loc:str              STRING(4000)                          !
CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(DETALLE_HORAS_EXTRA)
                       PROJECT(HEXD:HEXD_ID)
                       PROJECT(HEXD:HEXD_FECHA_DATE)
                       PROJECT(HEXD:HEXD_FECHA_TIME)
                       PROJECT(HEXD:HEXD_LEGAJO)
                       PROJECT(HEXD:HEXD_EMPLEADO)
                       PROJECT(HEXD:HEXD_INICIO_Time)
                       PROJECT(HEXD:HEXD_INICIO_Dot)
                       PROJECT(HEXD:HEXD_INICIO_Hundreds)
                       PROJECT(HEXD:HEXD_FIN_Time)
                       PROJECT(HEXD:HEXD_FIN_Dot)
                       PROJECT(HEXD:HEXD_FIN_Hundreds)
                       PROJECT(HEXD:HEXD_CONVENIO)
                       PROJECT(HEXD:HEXD_TIPO)
                       PROJECT(HEXD:HEXD_TIEMPO)
                       PROJECT(HEXD:HEXD_TIEMPO1)
                       PROJECT(HEXD:HEXD_DENARIUS)
                       PROJECT(HEXD:HEXD_REEMBOLSO)
                       PROJECT(HEXD:HEXD_REEMBOLSOD)
                       PROJECT(HEXD:HEXD_DIA_HABIL)
                       PROJECT(HEXD:HEXD_FECHA)
                       PROJECT(HEXD:HEXD_INICIO)
                       PROJECT(HEXD:HEXD_FIN)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
HEXD:HEXD_ID           LIKE(HEXD:HEXD_ID)             !List box control field - type derived from field
HEXD:HEXD_ID_NormalFG  LONG                           !Normal forground color
HEXD:HEXD_ID_NormalBG  LONG                           !Normal background color
HEXD:HEXD_ID_SelectedFG LONG                          !Selected forground color
HEXD:HEXD_ID_SelectedBG LONG                          !Selected background color
HEXD:HEXD_FECHA_DATE   LIKE(HEXD:HEXD_FECHA_DATE)     !List box control field - type derived from field
HEXD:HEXD_FECHA_DATE_NormalFG LONG                    !Normal forground color
HEXD:HEXD_FECHA_DATE_NormalBG LONG                    !Normal background color
HEXD:HEXD_FECHA_DATE_SelectedFG LONG                  !Selected forground color
HEXD:HEXD_FECHA_DATE_SelectedBG LONG                  !Selected background color
HEXD:HEXD_FECHA_TIME   LIKE(HEXD:HEXD_FECHA_TIME)     !List box control field - type derived from field
HEXD:HEXD_FECHA_TIME_NormalFG LONG                    !Normal forground color
HEXD:HEXD_FECHA_TIME_NormalBG LONG                    !Normal background color
HEXD:HEXD_FECHA_TIME_SelectedFG LONG                  !Selected forground color
HEXD:HEXD_FECHA_TIME_SelectedBG LONG                  !Selected background color
HEXD:HEXD_LEGAJO       LIKE(HEXD:HEXD_LEGAJO)         !List box control field - type derived from field
HEXD:HEXD_LEGAJO_NormalFG LONG                        !Normal forground color
HEXD:HEXD_LEGAJO_NormalBG LONG                        !Normal background color
HEXD:HEXD_LEGAJO_SelectedFG LONG                      !Selected forground color
HEXD:HEXD_LEGAJO_SelectedBG LONG                      !Selected background color
HEXD:HEXD_EMPLEADO     LIKE(HEXD:HEXD_EMPLEADO)       !List box control field - type derived from field
HEXD:HEXD_EMPLEADO_NormalFG LONG                      !Normal forground color
HEXD:HEXD_EMPLEADO_NormalBG LONG                      !Normal background color
HEXD:HEXD_EMPLEADO_SelectedFG LONG                    !Selected forground color
HEXD:HEXD_EMPLEADO_SelectedBG LONG                    !Selected background color
HEXD:HEXD_INICIO_Time  LIKE(HEXD:HEXD_INICIO_Time)    !List box control field - type derived from field
HEXD:HEXD_INICIO_Time_NormalFG LONG                   !Normal forground color
HEXD:HEXD_INICIO_Time_NormalBG LONG                   !Normal background color
HEXD:HEXD_INICIO_Time_SelectedFG LONG                 !Selected forground color
HEXD:HEXD_INICIO_Time_SelectedBG LONG                 !Selected background color
HEXD:HEXD_INICIO_Dot   LIKE(HEXD:HEXD_INICIO_Dot)     !List box control field - type derived from field
HEXD:HEXD_INICIO_Dot_NormalFG LONG                    !Normal forground color
HEXD:HEXD_INICIO_Dot_NormalBG LONG                    !Normal background color
HEXD:HEXD_INICIO_Dot_SelectedFG LONG                  !Selected forground color
HEXD:HEXD_INICIO_Dot_SelectedBG LONG                  !Selected background color
HEXD:HEXD_INICIO_Hundreds LIKE(HEXD:HEXD_INICIO_Hundreds) !List box control field - type derived from field
HEXD:HEXD_INICIO_Hundreds_NormalFG LONG               !Normal forground color
HEXD:HEXD_INICIO_Hundreds_NormalBG LONG               !Normal background color
HEXD:HEXD_INICIO_Hundreds_SelectedFG LONG             !Selected forground color
HEXD:HEXD_INICIO_Hundreds_SelectedBG LONG             !Selected background color
HEXD:HEXD_FIN_Time     LIKE(HEXD:HEXD_FIN_Time)       !List box control field - type derived from field
HEXD:HEXD_FIN_Time_NormalFG LONG                      !Normal forground color
HEXD:HEXD_FIN_Time_NormalBG LONG                      !Normal background color
HEXD:HEXD_FIN_Time_SelectedFG LONG                    !Selected forground color
HEXD:HEXD_FIN_Time_SelectedBG LONG                    !Selected background color
HEXD:HEXD_FIN_Dot      LIKE(HEXD:HEXD_FIN_Dot)        !List box control field - type derived from field
HEXD:HEXD_FIN_Dot_NormalFG LONG                       !Normal forground color
HEXD:HEXD_FIN_Dot_NormalBG LONG                       !Normal background color
HEXD:HEXD_FIN_Dot_SelectedFG LONG                     !Selected forground color
HEXD:HEXD_FIN_Dot_SelectedBG LONG                     !Selected background color
HEXD:HEXD_FIN_Hundreds LIKE(HEXD:HEXD_FIN_Hundreds)   !List box control field - type derived from field
HEXD:HEXD_FIN_Hundreds_NormalFG LONG                  !Normal forground color
HEXD:HEXD_FIN_Hundreds_NormalBG LONG                  !Normal background color
HEXD:HEXD_FIN_Hundreds_SelectedFG LONG                !Selected forground color
HEXD:HEXD_FIN_Hundreds_SelectedBG LONG                !Selected background color
HEXD:HEXD_CONVENIO     LIKE(HEXD:HEXD_CONVENIO)       !List box control field - type derived from field
HEXD:HEXD_CONVENIO_NormalFG LONG                      !Normal forground color
HEXD:HEXD_CONVENIO_NormalBG LONG                      !Normal background color
HEXD:HEXD_CONVENIO_SelectedFG LONG                    !Selected forground color
HEXD:HEXD_CONVENIO_SelectedBG LONG                    !Selected background color
HEXD:HEXD_TIPO         LIKE(HEXD:HEXD_TIPO)           !List box control field - type derived from field
HEXD:HEXD_TIPO_NormalFG LONG                          !Normal forground color
HEXD:HEXD_TIPO_NormalBG LONG                          !Normal background color
HEXD:HEXD_TIPO_SelectedFG LONG                        !Selected forground color
HEXD:HEXD_TIPO_SelectedBG LONG                        !Selected background color
HEXD:HEXD_TIEMPO       LIKE(HEXD:HEXD_TIEMPO)         !List box control field - type derived from field
HEXD:HEXD_TIEMPO_NormalFG LONG                        !Normal forground color
HEXD:HEXD_TIEMPO_NormalBG LONG                        !Normal background color
HEXD:HEXD_TIEMPO_SelectedFG LONG                      !Selected forground color
HEXD:HEXD_TIEMPO_SelectedBG LONG                      !Selected background color
HEXD:HEXD_TIEMPO1      LIKE(HEXD:HEXD_TIEMPO1)        !List box control field - type derived from field
HEXD:HEXD_TIEMPO1_NormalFG LONG                       !Normal forground color
HEXD:HEXD_TIEMPO1_NormalBG LONG                       !Normal background color
HEXD:HEXD_TIEMPO1_SelectedFG LONG                     !Selected forground color
HEXD:HEXD_TIEMPO1_SelectedBG LONG                     !Selected background color
HEXD:HEXD_DENARIUS     LIKE(HEXD:HEXD_DENARIUS)       !List box control field - type derived from field
HEXD:HEXD_DENARIUS_NormalFG LONG                      !Normal forground color
HEXD:HEXD_DENARIUS_NormalBG LONG                      !Normal background color
HEXD:HEXD_DENARIUS_SelectedFG LONG                    !Selected forground color
HEXD:HEXD_DENARIUS_SelectedBG LONG                    !Selected background color
HEXD:HEXD_REEMBOLSO    LIKE(HEXD:HEXD_REEMBOLSO)      !List box control field - type derived from field
HEXD:HEXD_REEMBOLSO_NormalFG LONG                     !Normal forground color
HEXD:HEXD_REEMBOLSO_NormalBG LONG                     !Normal background color
HEXD:HEXD_REEMBOLSO_SelectedFG LONG                   !Selected forground color
HEXD:HEXD_REEMBOLSO_SelectedBG LONG                   !Selected background color
EPL:EMP_HORAEXTRA      LIKE(EPL:EMP_HORAEXTRA)        !List box control field - type derived from field
EPL:EMP_HORAEXTRA_NormalFG LONG                       !Normal forground color
EPL:EMP_HORAEXTRA_NormalBG LONG                       !Normal background color
EPL:EMP_HORAEXTRA_SelectedFG LONG                     !Selected forground color
EPL:EMP_HORAEXTRA_SelectedBG LONG                     !Selected background color
HEXD:HEXD_REEMBOLSOD   LIKE(HEXD:HEXD_REEMBOLSOD)     !List box control field - type derived from field
HEXD:HEXD_REEMBOLSOD_NormalFG LONG                    !Normal forground color
HEXD:HEXD_REEMBOLSOD_NormalBG LONG                    !Normal background color
HEXD:HEXD_REEMBOLSOD_SelectedFG LONG                  !Selected forground color
HEXD:HEXD_REEMBOLSOD_SelectedBG LONG                  !Selected background color
HEXD:HEXD_DIA_HABIL    LIKE(HEXD:HEXD_DIA_HABIL)      !List box control field - type derived from field
HEXD:HEXD_DIA_HABIL_NormalFG LONG                     !Normal forground color
HEXD:HEXD_DIA_HABIL_NormalBG LONG                     !Normal background color
HEXD:HEXD_DIA_HABIL_SelectedFG LONG                   !Selected forground color
HEXD:HEXD_DIA_HABIL_SelectedBG LONG                   !Selected background color
HEXD:HEXD_FECHA        LIKE(HEXD:HEXD_FECHA)          !Primary key field - type derived from field
HEXD:HEXD_INICIO       LIKE(HEXD:HEXD_INICIO)         !Primary key field - type derived from field
HEXD:HEXD_FIN          LIKE(HEXD:HEXD_FIN)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Detalle de Horas Extras'),AT(,,542,372),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('ProcesarHorasExtras')
                       LIST,AT(4,120,535,245),USE(?Browse:1),FONT(,10,,FONT:bold),HVSCROLL,FLAT,FORMAT('0R(2)|M*~H' & |
  'EXD ID~C(0)@n-7@50C|M*~Fecha~@d17@0R(2)|M*~HEXD FECHA TIME~C(0)@t7@35C|M*~Legajo~@n_' & |
  '7@120L(2)|M*~Empleado~C(0)@s50@50C|M*~Hora Inicio~@T4@0C|M*~HEXD INICIO Dot~@s20@0D(' & |
  '4)|M*~HEXD INICIO Hundreds~C(0)@s20@50C|M*~Hora Fin~@T4@0L(2)|M*~HEXD FIN Dot~L(0)@s' & |
  '20@0L(2)|M*~HEXD FIN Hundreds~@s20@43C|M*~Convenio~@s10@30C|M*~Tipo~@s10@0C|M*~Tiemp' & |
  'o~@s5@45C|M*~Tiempo~@s8@42C|M*~Denarius~@n_7@0C|M*~_Reembolso~C(1)@n_7@0R(2)|M*~EMP ' & |
  'HORAEXTRA~C(0)@s3@68C|M*~Reembolso (%)~@n_7.2@0R(2)|M*~HEXD DIA HABIL~C(1)@n-7@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the DETALLE_HORAS_EXTRA file')
                       ENTRY(@n-7),AT(138,209,60,10),USE(HEX:HEX_ID),HIDE
                       GROUP,AT(7,5,528,108),USE(?GROUP1),FONT(,10,COLOR:Green,FONT:bold),BOXED
                         PROMPT('Mes'),AT(24,12),USE(?HEX:HEX_MES:Prompt),FONT(,10,COLOR:Green,FONT:bold)
                         ENTRY(@n02B),AT(24,26,30,16),USE(HEX:HEX_MES),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT,READONLY
                         PROMPT('Año'),AT(69,12),USE(?HEX:HEX_ANIO:Prompt),FONT(,10,COLOR:Green,FONT:bold)
                         ENTRY(@n4B),AT(69,26,40,16),USE(HEX:HEX_ANIO),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT,READONLY
                         ENTRY(@s30),AT(124,26,218,16),USE(HEX:HEX_OBSERVACION),FONT(,10,COLOR:Red,FONT:bold),FLAT, |
  READONLY
                         PROMPT('Observación'),AT(124,12),USE(?HEX:HEX_OBSERVACION:Prompt),FONT(,10,COLOR:Green,FONT:bold)
                         BUTTON('Abrir Periodo'),AT(360,22,70,20),USE(?CallLookup),FONT(,10),LEFT,ICON('wizopen.ico'), |
  FLAT
                         BUTTON('Procesar Archivo'),AT(360,58,70,20),USE(?LookupFile),FONT(,10),LEFT,ICON('down.ico'), |
  DISABLE,FLAT
                         PROMPT('Archivo Horas Extra'),AT(24,48),USE(?Glo:HorasExtrasCVS:Prompt),FONT(,10,COLOR:Green, |
  FONT:bold)
                         ENTRY(@s100),AT(24,62,317,16),USE(Glo:HorasExtrasCVS),FONT(,10,COLOR:Red,FONT:bold),FLAT,READONLY
                         BUTTON('E&xportar'),AT(450,22,70,20),USE(?EvoExportar),FONT(,10),LEFT,ICON('export.ico'),DISABLE, |
  FLAT
                         BUTTON('Denarius'),AT(454,58,70,20),USE(?BUTTON1),FONT(,10,,FONT:bold),LEFT,ICON('element_ne' & |
  'w_after.ico'),DISABLE,FLAT
                         PROMPT('Por Legajo:'),AT(24,92),USE(?Loc:legajo:Prompt)
                         ENTRY(@n_7B),AT(82,88,60,16),USE(Loc:legajo),FONT(,,COLOR:Red),RIGHT(1),DISABLE,FLAT
                         COMBO(@s10),AT(240,88,102,16),USE(Loc:convenio),FONT(,,COLOR:Red),DISABLE,DROP(10),FLAT,FROM('TODOS|#TOD' & |
  'OS|AP|#AP|ATSA|#ATSA|EC|#EC|FC|#FC|FOE|#FOE|LyF|#LyF|PP|#FP|S|#S|SS|#SS|UTA|#UTA'),READONLY
                         STRING('Por Convenio:'),AT(172,92),USE(?STRING1)
                         PROMPT('Estado:'),AT(372,88),USE(?PROMPT1)
                         STRING(@s10),AT(414,88,85),USE(Loc:estado),FONT(,,COLOR:Red)
                       END
                       BUTTON('&Select'),AT(102,183),USE(?Select),HIDE
                       BUTTON('&Insert'),AT(197,243,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(239,243,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(281,243,42,12),USE(?Delete),HIDE
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
Loc::QHlist3 QUEUE,PRE(QHL3)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar3 QUEUE,PRE(Q3)
FieldPar                 CSTRING(800)
                         END
QPar23 QUEUE,PRE(Qp23)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado3          STRING(100)
Loc::Titulo3          STRING(100)
SavPath3          STRING(2000)
Evo::Group3  GROUP,PRE()
Evo::Procedure3          STRING(100)
Evo::App3          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FileLookup2          SelectFileClass
Ec::LoadI_3  SHORT
Gol_woI_3 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_3),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_3),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_3),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_3),TRN
       END
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
DEVOLVER_COD_REEMBOLSO      ROUTINE
	Loc:CodReembolso = 0
	EPL:EMP_LEGAJO = ERPREM:LEGAJO
	GET(EMPLEADOS,EPL:PK_EMPLEADOS)
	IF NOT ERRORCODE() THEN
		Loc:CodReembolso = EPL:EMP_COD_REEMBOLSO
		Loc:TipoHE = EPL:EMP_HORAEXTRA
	END	
	
ARMAR_ARCHIVO_HORASEXTRA ROUTINE
!--HORAS EXTRAS TOTALIZADAS
	Loc:str = 'SELECT  HEXD_LEGAJO, HEXD_DENARIUS,' &|
			  '(SUM(DATEDIFF(SECOND, ''00:00:00'', CONVERT(TIME,HEXD_TIEMPO1,108))) / 86400) AS dias,' &|
			  '(SUM(DATEDIFF(SECOND, ''00:00:00'', CONVERT(TIME,HEXD_TIEMPO1,108))) % 86400) / (3600) AS horas,' &|
			  '((SUM(DATEDIFF(SECOND, ''00:00:00'', CONVERT(TIME,HEXD_TIEMPO1,108))) % 86400) % (3600)) / 60 AS minutos,' &|
	          '((SUM(DATEDIFF(SECOND, ''00:00:00'', CONVERT(TIME,HEXD_TIEMPO1,108))) % 86400) % (3600)) % 60 AS seconds ' &|
			  'FROM DETALLE_HORAS_EXTRA ' &|
			  'WHERE HEXD_ID = ' & HEX:HEX_ID & ' GROUP BY  HEXD_LEGAJO,HEXD_DENARIUS ORDER BY HEXD_LEGAJO'

	
			
!		'DATEADD(ms, SUM(DATEDIFF(ms, ''00:00:00.000'', CONVERT(TIME,HEXD_TIEMPO,108))), ''00:00:00.000'') AS HORASEXTRAS, ' &|
!			  'DATEPART(HOUR,DATEADD(ms, SUM(DATEDIFF(ms, ''00:00:00.000'', CONVERT(TIME,HEXD_TIEMPO,108))), ''00:00:00.000'')) AS HORAS,' &|
!			  'DATEPART(MINUTE,DATEADD(ms, SUM(DATEDIFF(ms, ''00:00:00.000'', CONVERT(TIME,HEXD_TIEMPO,108))), ''00:00:00.000'')) AS MINUTOS ' &|
	!--REEMBOLSO
	!SELECT  HEXD_LEGAJO,SUM(HEXD_REEMBOLSO)AS REEMBOLSO
	!FROM DETALLE_HORAS_EXTRA WHERE HEXD_REEMBOLSO <> 0 GROUP BY  HEXD_LEGAJO ORDER BY HEXD_LEGAJO

	setclipboard(loc:str)
	GLO:HORASEXTRA_ERP = 'F:\TRANSASI.DAT\sueldos\HORAS_' & FORMAT(HEX:HEX_MES,@N02) & HEX:HEX_ANIO & '.txt'
	close(ERP_HORASEXTRA)
	create(ERP_HORASEXTRA)
	open(ERP_HORASEXTRA)
	TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
	if errorcode() then
	message(ErrorCode())
	stop(FileErrorCode()).
		
	loop
		next(TMPUsosMultiples)
		Loc:tiempo = (TUM:Col03 * 24) + TUM:Col04 + (TUM:Col05/100)
		if errorcode() then break.
		ERPHEX:LEGAJO = TUM:Col01
		ERPHEX:LIQUIDACION = '3'&FORMAT(HEX:HEX_MES,@N02)&HEX:HEX_ANIO
		ERPHEX:CODIGO = TUM:Col02
		!ERPHEX:BLANCO = ''
		ERPHEX:HORAS = Loc:tiempo * 100
		append(ERP_HORASEXTRA)
		if errorcode() then stop(fileErrorCode()).
	end ! loop
		message('Archivo de Horas Extra almacenado en: ' & GLO:HORASEXTRA_ERP,'Horas Extra',Icon:Asterisk)	

	CLOSE(ERP_HORASEXTRA)
ARMAR_ARCHIVO_REEMBOLSOS ROUTINE
	!--REEMBOLSO	
		Loc:str = 'select legajo, ReembolsoTotal from (SELECT HEXD_LEGAJO as legajo,SUM(CAST(REEMBOLSO AS INT))as ReembolsoTotal ' &|
				  'FROM (SELECT  HEXD_FECHA,HEXD_LEGAJO,SUM(HEXD_REEMBOLSOD) AS REEMBOLSO ' &|
				  'FROM DETALLE_HORAS_EXTRA ' &|
				  'WHERE HEXD_ID = ' & HEX:HEX_ID & ' GROUP BY  HEXD_LEGAJO,HEXD_FECHA) AS TMP ' &|
				  'GROUP BY HEXD_LEGAJO) as tmp2 ' &|
			      'where ReembolsoTotal <> 0 ORDER BY legajo'

	setclipboard(loc:str)
	GLO:REEMBOLSO_ERP = 'F:\TRANSASI.DAT\sueldos\REEM_' & FORMAT(HEX:HEX_MES,@N02) & HEX:HEX_ANIO & '.txt'
	close(ERP_REEMBOLSO)
	create(ERP_REEMBOLSO)
	open(ERP_REEMBOLSO)
	TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
	if errorcode() then
	message(ErrorCode())
	stop(FileErrorCode()).
		
	loop
		next(TMPUsosMultiples)
		if errorcode() then break.
		ERPREM:LEGAJO = TUM:Col01
		ERPREM:LIQUIDACION = '3'&FORMAT(HEX:HEX_MES,@N02)&HEX:HEX_ANIO
		DO DEVOLVER_COD_REEMBOLSO 
		ERPREM:CODIGO = Loc:CodReembolso
		!ERPHEX:BLANCO = ''
		!IF
		ERPREM:REEMBOLSO = TUM:Col02 * 100
		append(ERP_REEMBOLSO)
		if errorcode() then stop(fileErrorCode()).
	end ! loop
		message('Archivo de Reembolso almacenado en: ' & GLO:REEMBOLSO_ERP,'Reembolso',Icon:Asterisk)	

	CLOSE(ERP_REEMBOLSO)
PrintExBrowse3 ROUTINE

 OPEN(Gol_woI_3)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_3 = BRW1.FileLoaded
 IF Not  EC::LoadI_3
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_3)
 SETCURSOR()
  Evo::App3          = 'infoper'
  Evo::Procedure3          = GlobalErrors.GetProcedureName()& 3
 
  FREE(QPar3)
  Q3:FieldPar  = '1,6,11,16,21,26,31,36,41,46,51,56,61,66,71,76,81,86,91,96,'
  ADD(QPar3)  !!1
  Q3:FieldPar  = ';'
  ADD(QPar3)  !!2
  Q3:FieldPar  = 'Spanish'
  ADD(QPar3)  !!3
  Q3:FieldPar  = ''
  ADD(QPar3)  !!4
  Q3:FieldPar  = true
  ADD(QPar3)  !!5
  Q3:FieldPar  = ''
  ADD(QPar3)  !!6
  Q3:FieldPar  = true
  ADD(QPar3)  !!7
 !!!! Exportaciones
  Q3:FieldPar  = 'HTML|'
   Q3:FieldPar  = CLIP( Q3:FieldPar)&'EXCEL|'
   Q3:FieldPar  = CLIP( Q3:FieldPar)&'WORD|'
  Q3:FieldPar  = CLIP( Q3:FieldPar)&'ASCII|'
   Q3:FieldPar  = CLIP( Q3:FieldPar)&'XML|'
   Q3:FieldPar  = CLIP( Q3:FieldPar)&'PRT|'
  ADD(QPar3)  !!8
  Q3:FieldPar  = 'All'
  ADD(QPar3)   !.9.
  Q3:FieldPar  = ' 0'
  ADD(QPar3)   !.10
  Q3:FieldPar  = 0
  ADD(QPar3)   !.11
  Q3:FieldPar  = '1'
  ADD(QPar3)   !.12
 
  Q3:FieldPar  = ''
  ADD(QPar3)   !.13
 
  Q3:FieldPar  = ''
  ADD(QPar3)   !.14
 
  Q3:FieldPar  = ''
  ADD(QPar3)   !.15
 
   Q3:FieldPar  = '16'
  ADD(QPar3)   !.16
 
   Q3:FieldPar  = 1
  ADD(QPar3)   !.17
   Q3:FieldPar  = 2
  ADD(QPar3)   !.18
   Q3:FieldPar  = '2'
  ADD(QPar3)   !.19
   Q3:FieldPar  = 12
  ADD(QPar3)   !.20
 
   Q3:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar3)   !.21
 
   Q3:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar3)   !.22
 
   CLEAR(Q3:FieldPar)
  ADD(QPar3)   ! 23 Caracteres Encoding para xml
 
  Q3:FieldPar  = '0'
  ADD(QPar3)   ! 24 Use Open Office
 
   Q3:FieldPar  = 'golmedo'
  ADD(QPar3) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q3:FieldPar  = ''
  ADD(QPar3)   ! 26 
  Q3:FieldPar  = ''
  ADD(QPar3)   ! 27 
  Q3:FieldPar  = '' 
  ADD(QPar3)   ! 28 
  Q3:FieldPar  = 'BEXPORT' 
  ADD(QPar3)   ! 29 infoper023.clw
 !!!!!
 
 
  FREE(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@n-7'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'FECHA'
  Qp23:F2P  = '@d17'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@t7'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'LEGAJO'
  Qp23:F2P  = '@n_7'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'EMPLEADO'
  Qp23:F2P  = '@s50'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'HORA INICIO'
  Qp23:F2P  = '@T4'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@s20'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@s20'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'HORA FIN'
  Qp23:F2P  = '@T4'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@s20'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@s20'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'CONVENIO'
  Qp23:F2P  = '@s10'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'TIPO'
  Qp23:F2P  = '@s10'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@s5'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'TIEMPO'
  Qp23:F2P  = '@s8'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'CODIGO DENARIUS'
  Qp23:F2P  = '@n_7'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@n_7'
  Qp23:F2T  = '0'
  ADD(QPar23)
  Qp23:F2N  = 'ECNOEXPORT'
  Qp23:F2P  = '@s3'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'REEMBOLSO (%)'
  Qp23:F2P  = '@n_18.2'
  Qp23:F2T  = '0'
  ADD(QPar23)
       Qp23:F2N  = 'HEXD DIA HABIL'
  Qp23:F2P  = '@n-7'
  Qp23:F2T  = '0'
  ADD(QPar23)
  SysRec# = false
  FREE(Loc::QHlist3)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar23,SysRec#)
         QHL3:Id      = SysRec#
         QHL3:Nombre  = Qp23:F2N
         QHL3:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL3:Pict    = Qp23:F2P
         QHL3:Tot    = Qp23:F2T
         ADD(Loc::QHlist3)
      Else
        break
     END
  END
  Loc::Titulo3 =HEX:HEX_OBSERVACION
 
 SavPath3 = PATH()
  Exportar(Loc::QHlist3,BRW1.Q,QPar3,0,Loc::Titulo3,Evo::Group3)
 IF Not EC::LoadI_3 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath3)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcesarHorasExtras')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('HEXD:HEXD_ID',HEXD:HEXD_ID)                        ! Added by: BrowseSelectButton(ABC)
  BIND('HEX:HEX_ID',HEX:HEX_ID)                            ! Added by: BrowseBox(ABC)
  BIND('Loc:legajo',Loc:legajo)                            ! Added by: BrowseBox(ABC)
  BIND('Loc:convenio',Loc:convenio)                        ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_LEGAJO',HEXD:HEXD_LEGAJO)                ! Added by: BrowseSelectButton(ABC)
  BIND('HEXD:HEXD_CONVENIO',HEXD:HEXD_CONVENIO)            ! Added by: BrowseSelectButton(ABC)
  BIND('HEXD:HEXD_EMPLEADO',HEXD:HEXD_EMPLEADO)            ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_INICIO_Time',HEXD:HEXD_INICIO_Time)      ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_INICIO_Dot',HEXD:HEXD_INICIO_Dot)        ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_INICIO_Hundreds',HEXD:HEXD_INICIO_Hundreds) ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_FIN_Time',HEXD:HEXD_FIN_Time)            ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_FIN_Dot',HEXD:HEXD_FIN_Dot)              ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_FIN_Hundreds',HEXD:HEXD_FIN_Hundreds)    ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_TIPO',HEXD:HEXD_TIPO)                    ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_TIEMPO',HEXD:HEXD_TIEMPO)                ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_DENARIUS',HEXD:HEXD_DENARIUS)            ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_FECHA',HEXD:HEXD_FECHA)                  ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_INICIO',HEXD:HEXD_INICIO)                ! Added by: BrowseBox(ABC)
  BIND('HEXD:HEXD_FIN',HEXD:HEXD_FIN)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_HORAS_EXTRA.Open                          ! File DETALLE_HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:HORAS_EXTRA.Open                                  ! File HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  Relate:HORAS_EXTRA_DENARIUS.Open                         ! File HORAS_EXTRA_DENARIUS used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DETALLE_HORAS_EXTRA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.SetFilter('(HEXD:HEXD_ID= HEX:HEX_ID AND Loc:legajo = 0 AND Loc:convenio = ''TODOS'' OR  ( Loc:legajo = HEXD:HEXD_LEGAJO AND HEXD:HEXD_ID= HEX:HEX_ID ) OR (Loc:convenio = HEXD:HEXD_CONVENIO AND HEXD:HEXD_ID= HEX:HEX_ID ))') ! Apply filter expression to browse
  BRW1.AddResetField(Loc:convenio)                         ! Apply the reset field
  BRW1.AddResetField(Loc:legajo)                           ! Apply the reset field
  BRW1.AddField(HEXD:HEXD_ID,BRW1.Q.HEXD:HEXD_ID)          ! Field HEXD:HEXD_ID is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FECHA_DATE,BRW1.Q.HEXD:HEXD_FECHA_DATE) ! Field HEXD:HEXD_FECHA_DATE is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FECHA_TIME,BRW1.Q.HEXD:HEXD_FECHA_TIME) ! Field HEXD:HEXD_FECHA_TIME is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_LEGAJO,BRW1.Q.HEXD:HEXD_LEGAJO)  ! Field HEXD:HEXD_LEGAJO is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_EMPLEADO,BRW1.Q.HEXD:HEXD_EMPLEADO) ! Field HEXD:HEXD_EMPLEADO is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_INICIO_Time,BRW1.Q.HEXD:HEXD_INICIO_Time) ! Field HEXD:HEXD_INICIO_Time is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_INICIO_Dot,BRW1.Q.HEXD:HEXD_INICIO_Dot) ! Field HEXD:HEXD_INICIO_Dot is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_INICIO_Hundreds,BRW1.Q.HEXD:HEXD_INICIO_Hundreds) ! Field HEXD:HEXD_INICIO_Hundreds is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FIN_Time,BRW1.Q.HEXD:HEXD_FIN_Time) ! Field HEXD:HEXD_FIN_Time is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FIN_Dot,BRW1.Q.HEXD:HEXD_FIN_Dot) ! Field HEXD:HEXD_FIN_Dot is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FIN_Hundreds,BRW1.Q.HEXD:HEXD_FIN_Hundreds) ! Field HEXD:HEXD_FIN_Hundreds is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_CONVENIO,BRW1.Q.HEXD:HEXD_CONVENIO) ! Field HEXD:HEXD_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_TIPO,BRW1.Q.HEXD:HEXD_TIPO)      ! Field HEXD:HEXD_TIPO is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_TIEMPO,BRW1.Q.HEXD:HEXD_TIEMPO)  ! Field HEXD:HEXD_TIEMPO is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_TIEMPO1,BRW1.Q.HEXD:HEXD_TIEMPO1) ! Field HEXD:HEXD_TIEMPO1 is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_DENARIUS,BRW1.Q.HEXD:HEXD_DENARIUS) ! Field HEXD:HEXD_DENARIUS is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_REEMBOLSO,BRW1.Q.HEXD:HEXD_REEMBOLSO) ! Field HEXD:HEXD_REEMBOLSO is a hot field or requires assignment from browse
  BRW1.AddField(EPL:EMP_HORAEXTRA,BRW1.Q.EPL:EMP_HORAEXTRA) ! Field EPL:EMP_HORAEXTRA is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_REEMBOLSOD,BRW1.Q.HEXD:HEXD_REEMBOLSOD) ! Field HEXD:HEXD_REEMBOLSOD is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_DIA_HABIL,BRW1.Q.HEXD:HEXD_DIA_HABIL) ! Field HEXD:HEXD_DIA_HABIL is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FECHA,BRW1.Q.HEXD:HEXD_FECHA)    ! Field HEXD:HEXD_FECHA is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_INICIO,BRW1.Q.HEXD:HEXD_INICIO)  ! Field HEXD:HEXD_INICIO is a hot field or requires assignment from browse
  BRW1.AddField(HEXD:HEXD_FIN,BRW1.Q.HEXD:HEXD_FIN)        ! Field HEXD:HEXD_FIN is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 2                                    ! Will call: UpdateHExtrasDenarius(HEX:HEX_ESTADO)
  FileLookup2.Init
  FileLookup2.ClearOnCancel = True
  FileLookup2.Flags=BOR(FileLookup2.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup2.SetMask('All Files','*.CSV')                 ! Set the file mask
  FileLookup2.DefaultDirectory='M:\PERSONAL\Horas Extras'
  FileLookup2.DefaultFile='*.csv'
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  Loc:convenio = 'TODOS'
  Glo:HorasExtrasCVS = ''
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_HORAS_EXTRA.Close
    Relate:EMPLEADOS.Close
    Relate:HORAS_EXTRA.Close
    Relate:HORAS_EXTRA_DENARIUS.Close
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      HorasExtras
      UpdateHExtrasDenarius(HEX:HEX_ESTADO)
    END
    ReturnValue = GlobalResponse
  END
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
    OF ?BUTTON1
      Loc:fecha2 = DATE(PROV:PROV_MES,1,PROV:PROV_ANIO) + 35
      Loc:fecha = DATE(MONTH(Loc:fecha2),1,YEAR(Loc:fecha2))-1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?HEX:HEX_ID
      IF HEX:HEX_ID OR ?HEX:HEX_ID{PROP:Req}
        HEX:HEX_ID = HEX:HEX_ID
        IF Access:HORAS_EXTRA.TryFetch(HEX:PK_HORAS_EXTRA)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            HEX:HEX_ID = HEX:HEX_ID
            Loc:IdHoraExtra = HEX:HEX_ID
          ELSE
            CLEAR(Loc:IdHoraExtra)
            SELECT(?HEX:HEX_ID)
            CYCLE
          END
        ELSE
          Loc:IdHoraExtra = HEX:HEX_ID
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      HEX:HEX_ID = HEX:HEX_ID
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        HEX:HEX_ID = HEX:HEX_ID
        Loc:IdHoraExtra = HEX:HEX_ID
      END
      ThisWindow.Reset(1)
    OF ?LookupFile
      ThisWindow.Update()
      Glo:HorasExtrasCVS = FileLookup2.Ask(0)
      DISPLAY
      !MESSAGE('AFTERLOOKUPFILE')
      ProcesarHExtras(HEX:HEX_ID)
      BRW1.ResetFromFile()
      
      IF RECORDS(Queue:Browse:1) > 0 THEN
      	ENABLE(?BUTTON1)
      	ENABLE(?EvoExportar)
      	DISABLE(?LookupFile)
      	ENABLE(?Loc:legajo)
      	ENABLE(?Loc:convenio)
       	!Loc:convenio = 'TODOS'
      END
      IF RECORDS(Queue:Browse:1) = 0 AND HEX:HEX_ID <> 0 THEN
      	DISABLE(?BUTTON1)
      	ENABLE(?LookupFile)
      	DISABLE(?EvoExportar)	
      	DISABLE(?Loc:legajo)
      	DISABLE(?Loc:convenio)
      	Loc:convenio = 'TODOS'
      	Loc:legajo = 0
      END	
    OF ?Glo:HorasExtrasCVS
      ThisWindow.Reset(1)
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse3
    OF ?BUTTON1
      ThisWindow.Update()
      !CONSULTAS PARA LA TABLA TEMP
      ! PONER EN EL WHERE LA CONDICION DE QUE SEA EL DETALLE DE UNA CABECERA
      ! PARA QUE NO ME HAGA DE TODOS LA TABLA Y SI DE UN PERIODO
      DO ARMAR_ARCHIVO_HORASEXTRA
      DO ARMAR_ARCHIVO_REEMBOLSOS
      !CAMBIAR EL ESTADO A LA CABECERA
      HEX:HEX_ID = Loc:IdHoraExtra
      GET(HORAS_EXTRA,HEX:PK_HORAS_EXTRA)
      IF NOT ERRORCODE() AND HEX:HEX_ESTADO <> 'C' THEN
      	HEX:HEX_ESTADO = 'C' 
      	HEX:HEX_FECHA_UPDATE_DATE = TODAY()
      	HEX:HEX_FECHA_UPDATE_TIME = CLOCK()
      	HEX:HEX_USER = Glo:Usuario2
      	Access:HORAS_EXTRA.Update()
      END	
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?CallLookup
    !HABILITO O DESHABILITO LOS BOTONES
    Glo:HorasExtrasCVS = ''
    IF HEX:HEX_ESTADO = 'P' THEN
    	Loc:estado = 'PROCESADO'
    END	
    IF HEX:HEX_ESTADO = 'C' THEN
    	Loc:estado = 'CERRADO'
    END	
    
    IF RECORDS(Queue:Browse:1) > 0 THEN
    	ENABLE(?BUTTON1)
    	ENABLE(?EvoExportar)
    	DISABLE(?LookupFile)
    	ENABLE(?Loc:legajo)
    	ENABLE(?Loc:convenio)
     	!Loc:convenio = 'TODOS'
    END
    IF RECORDS(Queue:Browse:1) = 0 AND HEX:HEX_ID <> 0 THEN
    	DISABLE(?BUTTON1)
    	ENABLE(?LookupFile)
    	DISABLE(?EvoExportar)	
    	DISABLE(?Loc:legajo)
    	DISABLE(?Loc:convenio)
    	Loc:convenio = 'TODOS'
    	Loc:legajo = 0
    END	
  END
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (HEXD:HEXD_DIA_HABIL = 0)
    SELF.Q.HEXD:HEXD_ID_NormalFG = 255                     ! Set conditional color values for HEXD:HEXD_ID
    SELF.Q.HEXD:HEXD_ID_NormalBG = -1
    SELF.Q.HEXD:HEXD_ID_SelectedFG = -1
    SELF.Q.HEXD:HEXD_ID_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_NormalFG = 255             ! Set conditional color values for HEXD:HEXD_FECHA_DATE
    SELF.Q.HEXD:HEXD_FECHA_DATE_NormalBG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_NormalFG = 255             ! Set conditional color values for HEXD:HEXD_FECHA_TIME
    SELF.Q.HEXD:HEXD_FECHA_TIME_NormalBG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_SelectedBG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_NormalFG = 255                 ! Set conditional color values for HEXD:HEXD_LEGAJO
    SELF.Q.HEXD:HEXD_LEGAJO_NormalBG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_NormalFG = 255               ! Set conditional color values for HEXD:HEXD_EMPLEADO
    SELF.Q.HEXD:HEXD_EMPLEADO_NormalBG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_NormalFG = 255            ! Set conditional color values for HEXD:HEXD_INICIO_Time
    SELF.Q.HEXD:HEXD_INICIO_Time_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_NormalFG = 255             ! Set conditional color values for HEXD:HEXD_INICIO_Dot
    SELF.Q.HEXD:HEXD_INICIO_Dot_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_NormalFG = 255        ! Set conditional color values for HEXD:HEXD_INICIO_Hundreds
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_NormalFG = 255               ! Set conditional color values for HEXD:HEXD_FIN_Time
    SELF.Q.HEXD:HEXD_FIN_Time_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_NormalFG = 255                ! Set conditional color values for HEXD:HEXD_FIN_Dot
    SELF.Q.HEXD:HEXD_FIN_Dot_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_NormalFG = 255           ! Set conditional color values for HEXD:HEXD_FIN_Hundreds
    SELF.Q.HEXD:HEXD_FIN_Hundreds_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_SelectedBG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_NormalFG = 255               ! Set conditional color values for HEXD:HEXD_CONVENIO
    SELF.Q.HEXD:HEXD_CONVENIO_NormalBG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIPO_NormalFG = 255                   ! Set conditional color values for HEXD:HEXD_TIPO
    SELF.Q.HEXD:HEXD_TIPO_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIPO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIPO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_NormalFG = 255                 ! Set conditional color values for HEXD:HEXD_TIEMPO
    SELF.Q.HEXD:HEXD_TIEMPO_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_NormalFG = 255                ! Set conditional color values for HEXD:HEXD_TIEMPO1
    SELF.Q.HEXD:HEXD_TIEMPO1_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_SelectedBG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_NormalFG = 255               ! Set conditional color values for HEXD:HEXD_DENARIUS
    SELF.Q.HEXD:HEXD_DENARIUS_NormalBG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_SelectedFG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_SelectedBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_NormalFG = 255              ! Set conditional color values for HEXD:HEXD_REEMBOLSO
    SELF.Q.HEXD:HEXD_REEMBOLSO_NormalBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_SelectedBG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_NormalFG = 255                ! Set conditional color values for EPL:EMP_HORAEXTRA
    SELF.Q.EPL:EMP_HORAEXTRA_NormalBG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_SelectedFG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_SelectedBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_NormalFG = 255             ! Set conditional color values for HEXD:HEXD_REEMBOLSOD
    SELF.Q.HEXD:HEXD_REEMBOLSOD_NormalBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_SelectedFG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_SelectedBG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_NormalFG = 255              ! Set conditional color values for HEXD:HEXD_DIA_HABIL
    SELF.Q.HEXD:HEXD_DIA_HABIL_NormalBG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_SelectedFG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_SelectedBG = -1
  ELSIF (HEXD:HEXD_DIA_HABIL = 1)
    SELF.Q.HEXD:HEXD_ID_NormalFG = 0                       ! Set conditional color values for HEXD:HEXD_ID
    SELF.Q.HEXD:HEXD_ID_NormalBG = -1
    SELF.Q.HEXD:HEXD_ID_SelectedFG = -1
    SELF.Q.HEXD:HEXD_ID_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_NormalFG = 0               ! Set conditional color values for HEXD:HEXD_FECHA_DATE
    SELF.Q.HEXD:HEXD_FECHA_DATE_NormalBG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_NormalFG = 0               ! Set conditional color values for HEXD:HEXD_FECHA_TIME
    SELF.Q.HEXD:HEXD_FECHA_TIME_NormalBG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_SelectedBG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_NormalFG = 0                   ! Set conditional color values for HEXD:HEXD_LEGAJO
    SELF.Q.HEXD:HEXD_LEGAJO_NormalBG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_NormalFG = 0                 ! Set conditional color values for HEXD:HEXD_EMPLEADO
    SELF.Q.HEXD:HEXD_EMPLEADO_NormalBG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_NormalFG = 0              ! Set conditional color values for HEXD:HEXD_INICIO_Time
    SELF.Q.HEXD:HEXD_INICIO_Time_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_NormalFG = 0               ! Set conditional color values for HEXD:HEXD_INICIO_Dot
    SELF.Q.HEXD:HEXD_INICIO_Dot_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_NormalFG = 0          ! Set conditional color values for HEXD:HEXD_INICIO_Hundreds
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_NormalFG = 0                 ! Set conditional color values for HEXD:HEXD_FIN_Time
    SELF.Q.HEXD:HEXD_FIN_Time_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_NormalFG = 0                  ! Set conditional color values for HEXD:HEXD_FIN_Dot
    SELF.Q.HEXD:HEXD_FIN_Dot_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_NormalFG = 0             ! Set conditional color values for HEXD:HEXD_FIN_Hundreds
    SELF.Q.HEXD:HEXD_FIN_Hundreds_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_SelectedBG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_NormalFG = 0                 ! Set conditional color values for HEXD:HEXD_CONVENIO
    SELF.Q.HEXD:HEXD_CONVENIO_NormalBG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIPO_NormalFG = 0                     ! Set conditional color values for HEXD:HEXD_TIPO
    SELF.Q.HEXD:HEXD_TIPO_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIPO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIPO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_NormalFG = 0                   ! Set conditional color values for HEXD:HEXD_TIEMPO
    SELF.Q.HEXD:HEXD_TIEMPO_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_NormalFG = 0                  ! Set conditional color values for HEXD:HEXD_TIEMPO1
    SELF.Q.HEXD:HEXD_TIEMPO1_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_SelectedBG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_NormalFG = 0                 ! Set conditional color values for HEXD:HEXD_DENARIUS
    SELF.Q.HEXD:HEXD_DENARIUS_NormalBG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_SelectedFG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_SelectedBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_NormalFG = 0                ! Set conditional color values for HEXD:HEXD_REEMBOLSO
    SELF.Q.HEXD:HEXD_REEMBOLSO_NormalBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_SelectedBG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_NormalFG = 0                  ! Set conditional color values for EPL:EMP_HORAEXTRA
    SELF.Q.EPL:EMP_HORAEXTRA_NormalBG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_SelectedFG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_SelectedBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_NormalFG = 0               ! Set conditional color values for HEXD:HEXD_REEMBOLSOD
    SELF.Q.HEXD:HEXD_REEMBOLSOD_NormalBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_SelectedFG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_SelectedBG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_NormalFG = 0                ! Set conditional color values for HEXD:HEXD_DIA_HABIL
    SELF.Q.HEXD:HEXD_DIA_HABIL_NormalBG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_SelectedFG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_SelectedBG = -1
  ELSE
    SELF.Q.HEXD:HEXD_ID_NormalFG = -1                      ! Set color values for HEXD:HEXD_ID
    SELF.Q.HEXD:HEXD_ID_NormalBG = -1
    SELF.Q.HEXD:HEXD_ID_SelectedFG = -1
    SELF.Q.HEXD:HEXD_ID_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_NormalFG = -1              ! Set color values for HEXD:HEXD_FECHA_DATE
    SELF.Q.HEXD:HEXD_FECHA_DATE_NormalBG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FECHA_DATE_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_NormalFG = -1              ! Set color values for HEXD:HEXD_FECHA_TIME
    SELF.Q.HEXD:HEXD_FECHA_TIME_NormalBG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FECHA_TIME_SelectedBG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_NormalFG = -1                  ! Set color values for HEXD:HEXD_LEGAJO
    SELF.Q.HEXD:HEXD_LEGAJO_NormalBG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_LEGAJO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_NormalFG = -1                ! Set color values for HEXD:HEXD_EMPLEADO
    SELF.Q.HEXD:HEXD_EMPLEADO_NormalBG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_EMPLEADO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_NormalFG = -1             ! Set color values for HEXD:HEXD_INICIO_Time
    SELF.Q.HEXD:HEXD_INICIO_Time_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Time_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_NormalFG = -1              ! Set color values for HEXD:HEXD_INICIO_Dot
    SELF.Q.HEXD:HEXD_INICIO_Dot_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Dot_SelectedBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_NormalFG = -1         ! Set color values for HEXD:HEXD_INICIO_Hundreds
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_NormalBG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_SelectedFG = -1
    SELF.Q.HEXD:HEXD_INICIO_Hundreds_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_NormalFG = -1                ! Set color values for HEXD:HEXD_FIN_Time
    SELF.Q.HEXD:HEXD_FIN_Time_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Time_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_NormalFG = -1                 ! Set color values for HEXD:HEXD_FIN_Dot
    SELF.Q.HEXD:HEXD_FIN_Dot_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Dot_SelectedBG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_NormalFG = -1            ! Set color values for HEXD:HEXD_FIN_Hundreds
    SELF.Q.HEXD:HEXD_FIN_Hundreds_NormalBG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_SelectedFG = -1
    SELF.Q.HEXD:HEXD_FIN_Hundreds_SelectedBG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_NormalFG = -1                ! Set color values for HEXD:HEXD_CONVENIO
    SELF.Q.HEXD:HEXD_CONVENIO_NormalBG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_CONVENIO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIPO_NormalFG = -1                    ! Set color values for HEXD:HEXD_TIPO
    SELF.Q.HEXD:HEXD_TIPO_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIPO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIPO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_NormalFG = -1                  ! Set color values for HEXD:HEXD_TIEMPO
    SELF.Q.HEXD:HEXD_TIEMPO_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIEMPO_SelectedBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_NormalFG = -1                 ! Set color values for HEXD:HEXD_TIEMPO1
    SELF.Q.HEXD:HEXD_TIEMPO1_NormalBG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_SelectedFG = -1
    SELF.Q.HEXD:HEXD_TIEMPO1_SelectedBG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_NormalFG = -1                ! Set color values for HEXD:HEXD_DENARIUS
    SELF.Q.HEXD:HEXD_DENARIUS_NormalBG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_SelectedFG = -1
    SELF.Q.HEXD:HEXD_DENARIUS_SelectedBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_NormalFG = -1               ! Set color values for HEXD:HEXD_REEMBOLSO
    SELF.Q.HEXD:HEXD_REEMBOLSO_NormalBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_SelectedFG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSO_SelectedBG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_NormalFG = -1                 ! Set color values for EPL:EMP_HORAEXTRA
    SELF.Q.EPL:EMP_HORAEXTRA_NormalBG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_SelectedFG = -1
    SELF.Q.EPL:EMP_HORAEXTRA_SelectedBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_NormalFG = -1              ! Set color values for HEXD:HEXD_REEMBOLSOD
    SELF.Q.HEXD:HEXD_REEMBOLSOD_NormalBG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_SelectedFG = -1
    SELF.Q.HEXD:HEXD_REEMBOLSOD_SelectedBG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_NormalFG = -1               ! Set color values for HEXD:HEXD_DIA_HABIL
    SELF.Q.HEXD:HEXD_DIA_HABIL_NormalBG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_SelectedFG = -1
    SELF.Q.HEXD:HEXD_DIA_HABIL_SelectedBG = -1
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the HORAS_EXTRA file
!!! </summary>
HorasExtras PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(HORAS_EXTRA)
                       PROJECT(HEX:HEX_ID)
                       PROJECT(HEX:HEX_MES)
                       PROJECT(HEX:HEX_ANIO)
                       PROJECT(HEX:HEX_OBSERVACION)
                       PROJECT(HEX:HEX_ESTADO)
                       PROJECT(HEX:HEX_FECHA_UPDATE_DATE)
                       PROJECT(HEX:HEX_USER)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
HEX:HEX_ID             LIKE(HEX:HEX_ID)               !List box control field - type derived from field
HEX:HEX_MES            LIKE(HEX:HEX_MES)              !List box control field - type derived from field
HEX:HEX_ANIO           LIKE(HEX:HEX_ANIO)             !List box control field - type derived from field
HEX:HEX_OBSERVACION    LIKE(HEX:HEX_OBSERVACION)      !List box control field - type derived from field
HEX:HEX_ESTADO         LIKE(HEX:HEX_ESTADO)           !List box control field - type derived from field
HEX:HEX_FECHA_UPDATE_DATE LIKE(HEX:HEX_FECHA_UPDATE_DATE) !List box control field - type derived from field
HEX:HEX_USER           LIKE(HEX:HEX_USER)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Cabeceras Horas Extra'),AT(,,394,314),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('HorasExtras'),SYSTEM
                       LIST,AT(8,26,376,251),USE(?Browse:1),FONT(,10,,FONT:bold),HVSCROLL,FLAT,FORMAT('0R(2)|M~HE' & |
  'X ID~C(0)@n-7@32C|M~Mes~@n02@36C|M~Año~@n4@140L(2)|M~Observación~C(2)@s30@40C|M~Esta' & |
  'do~@s1@50C|M~Fecha~@d17@50L(2)|M~Usuario~C(0)@s20@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he HORAS_EXTRA file')
                       SHEET,AT(4,4,388,280),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           BUTTON('&Select'),AT(100,77),USE(?Select),HIDE
                         END
                       END
                       BUTTON('&Agregar'),AT(184,290,62,20),USE(?Insert),FONT(,10),LEFT,ICON('wainsert.ico')
                       BUTTON('&Cambiar'),AT(252,290,65,20),USE(?Change),FONT(,10),LEFT,ICON('wachange.ico')
                       BUTTON('&Borrar'),AT(323,290,62,20),USE(?Delete),FONT(,10,,FONT:regular),LEFT,ICON('wadelete.ico')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('HorasExtras')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('HEX:HEX_ID',HEX:HEX_ID)                            ! Added by: BrowseBox(ABC)
  BIND('HEX:HEX_MES',HEX:HEX_MES)                          ! Added by: BrowseBox(ABC)
  BIND('HEX:HEX_ANIO',HEX:HEX_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('HEX:HEX_OBSERVACION',HEX:HEX_OBSERVACION)          ! Added by: BrowseBox(ABC)
  BIND('HEX:HEX_USER',HEX:HEX_USER)                        ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:HORAS_EXTRA.Open                                  ! File HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:HORAS_EXTRA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,HEX:PK_HORAS_EXTRA)                   ! Add the sort order for HEX:PK_HORAS_EXTRA for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,HEX:HEX_ID,,BRW1)              ! Initialize the browse locator using  using key: HEX:PK_HORAS_EXTRA , HEX:HEX_ID
  BRW1.AddField(HEX:HEX_ID,BRW1.Q.HEX:HEX_ID)              ! Field HEX:HEX_ID is a hot field or requires assignment from browse
  BRW1.AddField(HEX:HEX_MES,BRW1.Q.HEX:HEX_MES)            ! Field HEX:HEX_MES is a hot field or requires assignment from browse
  BRW1.AddField(HEX:HEX_ANIO,BRW1.Q.HEX:HEX_ANIO)          ! Field HEX:HEX_ANIO is a hot field or requires assignment from browse
  BRW1.AddField(HEX:HEX_OBSERVACION,BRW1.Q.HEX:HEX_OBSERVACION) ! Field HEX:HEX_OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(HEX:HEX_ESTADO,BRW1.Q.HEX:HEX_ESTADO)      ! Field HEX:HEX_ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(HEX:HEX_FECHA_UPDATE_DATE,BRW1.Q.HEX:HEX_FECHA_UPDATE_DATE) ! Field HEX:HEX_FECHA_UPDATE_DATE is a hot field or requires assignment from browse
  BRW1.AddField(HEX:HEX_USER,BRW1.Q.HEX:HEX_USER)          ! Field HEX:HEX_USER is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateHorasExtras
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:HORAS_EXTRA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateHorasExtras
    ReturnValue = GlobalResponse
  END
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form HORAS_EXTRA
!!! </summary>
UpdateHORAS_EXTRA PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::HEX:Record  LIKE(HEX:RECORD),THREAD
QuickWindow          WINDOW('Form HORAS_EXTRA'),AT(,,232,140),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateHORAS_EXTRA'),SYSTEM
                       SHEET,AT(4,4,224,114),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('HEX ID:'),AT(8,20),USE(?HEX:HEX_ID:Prompt),TRN
                           ENTRY(@n-7),AT(100,20,40,10),USE(HEX:HEX_ID)
                           PROMPT('HEX MES:'),AT(8,34),USE(?HEX:HEX_MES:Prompt),TRN
                           ENTRY(@n3),AT(100,34,40,10),USE(HEX:HEX_MES)
                           PROMPT('HEX ANIO:'),AT(8,48),USE(?HEX:HEX_ANIO:Prompt),TRN
                           ENTRY(@n-7),AT(100,48,40,10),USE(HEX:HEX_ANIO)
                           PROMPT('HEX OBSERVACION:'),AT(8,62),USE(?HEX:HEX_OBSERVACION:Prompt),TRN
                           ENTRY(@s30),AT(100,62,124,10),USE(HEX:HEX_OBSERVACION)
                           PROMPT('HEX FECHA UPDATE DATE:'),AT(8,76),USE(?HEX:HEX_FECHA_UPDATE_DATE:Prompt),TRN
                           ENTRY(@d17),AT(100,76,104,10),USE(HEX:HEX_FECHA_UPDATE_DATE)
                           PROMPT('HEX FECHA UPDATE TIME:'),AT(8,90),USE(?HEX:HEX_FECHA_UPDATE_TIME:Prompt),TRN
                           ENTRY(@t7),AT(100,90,104,10),USE(HEX:HEX_FECHA_UPDATE_TIME)
                           PROMPT('HEX USER:'),AT(8,104),USE(?HEX:HEX_USER:Prompt),TRN
                           ENTRY(@s20),AT(100,104,84,10),USE(HEX:HEX_USER)
                         END
                       END
                       BUTTON('&OK'),AT(73,122,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(126,122,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(179,122,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END
SSEC::Viewing        BYTE(0)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Agregar Periodo Horas Extra'
  OF ChangeRecord
    ActionMessage = 'Modificar Periodo Horas Extra'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdateHORAS_EXTRA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?HEX:HEX_ID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(HEX:Record,History::HEX:Record)
  SELF.AddHistoryField(?HEX:HEX_ID,1)
  SELF.AddHistoryField(?HEX:HEX_MES,2)
  SELF.AddHistoryField(?HEX:HEX_ANIO,3)
  SELF.AddHistoryField(?HEX:HEX_OBSERVACION,4)
  SELF.AddHistoryField(?HEX:HEX_FECHA_UPDATE_DATE,7)
  SELF.AddHistoryField(?HEX:HEX_FECHA_UPDATE_TIME,8)
  SELF.AddHistoryField(?HEX:HEX_USER,9)
  SELF.AddUpdateFile(Access:HORAS_EXTRA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:HORAS_EXTRA.Open                                  ! File HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:HORAS_EXTRA
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?HEX:HEX_ID{PROP:ReadOnly} = True
    ?HEX:HEX_MES{PROP:ReadOnly} = True
    ?HEX:HEX_ANIO{PROP:ReadOnly} = True
    ?HEX:HEX_OBSERVACION{PROP:ReadOnly} = True
    ?HEX:HEX_FECHA_UPDATE_DATE{PROP:ReadOnly} = True
    ?HEX:HEX_FECHA_UPDATE_TIME{PROP:ReadOnly} = True
    ?HEX:HEX_USER{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:HORAS_EXTRA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  HEX:HEX_MES = MONTH(TODAY())
  HEX:HEX_ANIO = YEAR(TODAY())
  HEX:HEX_ESTADO = 'P'
  PARENT.PrimeFields


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
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
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form DETALLE_HORAS_EXTRA
!!! </summary>
UpdateDETALLE_HORAS_EXTRA PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::HEXD:Record LIKE(HEXD:RECORD),THREAD
QuickWindow          WINDOW('Form DETALLE_HORAS_EXTRA'),AT(,,308,182),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateDETALLE_HORAS_EXTRA'),SYSTEM
                       SHEET,AT(4,4,300,156),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('HEXD ID:'),AT(8,20),USE(?HEXD:HEXD_ID:Prompt),TRN
                           ENTRY(@n-7),AT(96,20,40,10),USE(HEXD:HEXD_ID)
                           PROMPT('HEXD FECHA DATE:'),AT(8,34),USE(?HEXD:HEXD_FECHA_DATE:Prompt),TRN
                           ENTRY(@d17),AT(96,34,104,10),USE(HEXD:HEXD_FECHA_DATE)
                           PROMPT('HEXD FECHA TIME:'),AT(8,48),USE(?HEXD:HEXD_FECHA_TIME:Prompt),TRN
                           ENTRY(@t7),AT(96,48,104,10),USE(HEXD:HEXD_FECHA_TIME)
                           PROMPT('HEXD LEGAJO:'),AT(8,62),USE(?HEXD:HEXD_LEGAJO:Prompt),TRN
                           ENTRY(@n-7),AT(96,62,40,10),USE(HEXD:HEXD_LEGAJO)
                           PROMPT('HEXD INICIO Time:'),AT(8,76),USE(?HEXD:HEXD_INICIO_Time:Prompt),TRN
                           ENTRY(@s20),AT(96,76,84,10),USE(HEXD:HEXD_INICIO_Time)
                           PROMPT('HEXD INICIO Hundreds:'),AT(8,90),USE(?HEXD:HEXD_INICIO_Hundreds:Prompt),TRN
                           ENTRY(@s20),AT(96,90,84,10),USE(HEXD:HEXD_INICIO_Hundreds)
                           PROMPT('HEXD FIN Time:'),AT(8,104),USE(?HEXD:HEXD_FIN_Time:Prompt),TRN
                           ENTRY(@s20),AT(96,104,84,10),USE(HEXD:HEXD_FIN_Time)
                           PROMPT('HEXD FIN Hundreds:'),AT(8,118),USE(?HEXD:HEXD_FIN_Hundreds:Prompt),TRN
                           ENTRY(@s20),AT(96,118,84,10),USE(HEXD:HEXD_FIN_Hundreds)
                           PROMPT('HEXD EMPLEADO:'),AT(8,132),USE(?HEXD:HEXD_EMPLEADO:Prompt),TRN
                           ENTRY(@s50),AT(96,132,204,10),USE(HEXD:HEXD_EMPLEADO)
                           PROMPT('HEXD CONVENIO:'),AT(8,146),USE(?HEXD:HEXD_CONVENIO:Prompt),TRN
                           ENTRY(@s10),AT(96,146,44,10),USE(HEXD:HEXD_CONVENIO)
                         END
                         TAB('&2) General (cont.)'),USE(?Tab:2)
                           PROMPT('HEXD TIPO:'),AT(8,20),USE(?HEXD:HEXD_TIPO:Prompt),TRN
                           ENTRY(@s10),AT(96,20,44,10),USE(HEXD:HEXD_TIPO)
                           PROMPT('HEXD TIEMPO:'),AT(8,34),USE(?HEXD:HEXD_TIEMPO:Prompt),TRN
                           ENTRY(@s5),AT(96,34,40,10),USE(HEXD:HEXD_TIEMPO)
                           PROMPT('HEXD DENARIUS:'),AT(8,48),USE(?HEXD:HEXD_DENARIUS:Prompt),TRN
                           ENTRY(@n-7),AT(96,48,40,10),USE(HEXD:HEXD_DENARIUS)
                         END
                       END
                       BUTTON('&OK'),AT(149,164,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(202,164,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(255,164,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END
SSEC::Viewing        BYTE(0)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdateDETALLE_HORAS_EXTRA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?HEXD:HEXD_ID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(HEXD:Record,History::HEXD:Record)
  SELF.AddHistoryField(?HEXD:HEXD_ID,1)
  SELF.AddHistoryField(?HEXD:HEXD_FECHA_DATE,4)
  SELF.AddHistoryField(?HEXD:HEXD_FECHA_TIME,5)
  SELF.AddHistoryField(?HEXD:HEXD_LEGAJO,6)
  SELF.AddHistoryField(?HEXD:HEXD_INICIO_Time,9)
  SELF.AddHistoryField(?HEXD:HEXD_INICIO_Hundreds,11)
  SELF.AddHistoryField(?HEXD:HEXD_FIN_Time,14)
  SELF.AddHistoryField(?HEXD:HEXD_FIN_Hundreds,16)
  SELF.AddHistoryField(?HEXD:HEXD_EMPLEADO,17)
  SELF.AddHistoryField(?HEXD:HEXD_CONVENIO,18)
  SELF.AddHistoryField(?HEXD:HEXD_TIPO,19)
  SELF.AddHistoryField(?HEXD:HEXD_TIEMPO,20)
  SELF.AddHistoryField(?HEXD:HEXD_DENARIUS,22)
  SELF.AddUpdateFile(Access:DETALLE_HORAS_EXTRA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:DETALLE_HORAS_EXTRA.Open                          ! File DETALLE_HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DETALLE_HORAS_EXTRA
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?HEXD:HEXD_ID{PROP:ReadOnly} = True
    ?HEXD:HEXD_FECHA_DATE{PROP:ReadOnly} = True
    ?HEXD:HEXD_FECHA_TIME{PROP:ReadOnly} = True
    ?HEXD:HEXD_LEGAJO{PROP:ReadOnly} = True
    ?HEXD:HEXD_INICIO_Time{PROP:ReadOnly} = True
    ?HEXD:HEXD_INICIO_Hundreds{PROP:ReadOnly} = True
    ?HEXD:HEXD_FIN_Time{PROP:ReadOnly} = True
    ?HEXD:HEXD_FIN_Hundreds{PROP:ReadOnly} = True
    ?HEXD:HEXD_EMPLEADO{PROP:ReadOnly} = True
    ?HEXD:HEXD_CONVENIO{PROP:ReadOnly} = True
    ?HEXD:HEXD_TIPO{PROP:ReadOnly} = True
    ?HEXD:HEXD_TIEMPO{PROP:ReadOnly} = True
    ?HEXD:HEXD_DENARIUS{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_HORAS_EXTRA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
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
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form HORAS_EXTRA
!!! </summary>
UpdateHorasExtras PROCEDURE 

CurrentTab           STRING(80)                            !
Loc:CabeceraUnica    STRING(1)                             !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::HEX:Record  LIKE(HEX:RECORD),THREAD
QuickWindow          WINDOW('Cabecera Horas Extra'),AT(,,207,147),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('UpdateHorasExtras'),SYSTEM
                       SHEET,AT(4,4,198,109),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                           PROMPT('Mes:'),AT(17,30),USE(?HEX:HEX_MES:Prompt),FONT(,10,COLOR:Green,FONT:bold),TRN
                           ENTRY(@n02),AT(17,43,49,16),USE(HEX:HEX_MES),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                           PROMPT('Año:'),AT(130,29),USE(?HEX:HEX_ANIO:Prompt),FONT(,10,COLOR:Green,FONT:bold),TRN
                           ENTRY(@n04),AT(130,43,56,16),USE(HEX:HEX_ANIO),FONT(,10,COLOR:Red,FONT:bold),CENTER,FLAT
                           PROMPT('Observación:'),AT(17,66),USE(?HEX:HEX_OBSERVACION:Prompt),FONT(,10,COLOR:Green,FONT:bold), |
  TRN
                           ENTRY(@s30),AT(17,81,170,16),USE(HEX:HEX_OBSERVACION),FONT(,10,COLOR:Red,FONT:bold),FLAT
                         END
                       END
                       BUTTON('&Aceptar'),AT(57,124,60,14),USE(?OK),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(125,124,60,14),USE(?Cancel),FONT(,10),LEFT,ICON('WACANCEL.ICO'),FLAT, |
  MSG('Cancel operation'),TIP('Cancel operation')
                     END
SSEC::Viewing        BYTE(0)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Agregar Periodo Horas Extras'
  OF ChangeRecord
    ActionMessage = 'Modificar Periodo Horas Extras'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdateHorasExtras')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?HEX:HEX_MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(HEX:Record,History::HEX:Record)
  SELF.AddHistoryField(?HEX:HEX_MES,2)
  SELF.AddHistoryField(?HEX:HEX_ANIO,3)
  SELF.AddHistoryField(?HEX:HEX_OBSERVACION,4)
  SELF.AddUpdateFile(Access:HORAS_EXTRA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AHORAS_EXTRA.Open                                 ! File AHORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  Relate:HORAS_EXTRA.Open                                  ! File HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:HORAS_EXTRA
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?HEX:HEX_MES{PROP:ReadOnly} = True
    ?HEX:HEX_ANIO{PROP:ReadOnly} = True
    ?HEX:HEX_OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  IF HEX:HEX_ESTADO = 'C' THEN
  	DISABLE(?HEX:HEX_MES)
  	DISABLE(?HEX:HEX_ANIO)
  END	
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AHORAS_EXTRA.Close
    Relate:HORAS_EXTRA.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  HEX:HEX_MES = MONTH(TODAY())
  HEX:HEX_ANIO = YEAR(TODAY())
  HEX:HEX_ESTADO = 'P'
  HEX:HEX_FECHA_UPDATE_DATE = TODAY()
  HEX:HEX_FECHA_UPDATE_TIME = CLOCK()
  HEX:HEX_USER = Glo:Usuario2
  PARENT.PrimeFields


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
    OF ?OK
      !CONTROL DE QUE NO SE REPITA EL PERIODO (LIQUIDACION)
      !IF SELF.Request = InsertRecord THEN
      Loc:CabeceraUnica = 'S'
      CLEAR(AHEX:Record)
      AHEX:HEX_MES = HEX:HEX_MES
      AHEX:HEX_ANIO = HEX:HEX_ANIO
      SET(AHEX:PK_HORAS_EXTRA,AHEX:PK_HORAS_EXTRA)
      LOOP 
      	NEXT(AHORAS_EXTRA)
      	IF ERRORCODE() THEN BREAK.
      	IF 	AHEX:HEX_MES = HEX:HEX_MES AND AHEX:HEX_ANIO = HEX:HEX_ANIO THEN
      		Loc:CabeceraUnica = 'N'
      	END	
      END	
      IF Loc:CabeceraUnica = 'N' THEN
      	message('ERROR: YA EXISTE LIQUIDACION')
      	CYCLE.
      !END	
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
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
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Process
!!! Process the HORASEXTRASCVS File
!!! </summary>
ProcesarHExtras PROCEDURE (SHORT idCabeceraHE)

Progress:Thermometer BYTE                                  !
Loc:habil            SHORT                                 !
Loc:Horas            SHORT                                 !
Loc:Segundos         SHORT                                 !
Loc:Minutos          SHORT                                 !
Loc:IdCabeceraHE     SHORT                                 !
Process:View         VIEW(HORASEXTRASCVS)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Process HORASEXTRASCVS'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),DOUBLE,CENTER,GRAY,MDI,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
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

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
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
VERIFICAR_DIA_HABIL ROUTINE
	!SI EL DIAS ES HABIL LO MARCA CON 1 SINO CON 0
	Loc:habil = 0
	loop dia# = HEXD:HEXD_FECHA_DATE to HEXD:HEXD_FECHA_DATE
	 if (Dia# % 7) = 0 then cycle. ! porque es domingo
	 if (Dia# % 7) = 6 then cycle. ! porque es sabado
	 !
	 ! busco si es feriado
	 !
	 clear(FERIADOS:record)
	 FER:DIAFERIADO_DATE = dia#
	 if access:FERIADOS.fetch(FER:PK_FERIADOS) = level:benign then cycle. !porque es feriado
	 !
	 Loc:habil += 1
	end!loop

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProcesarHExtras')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:DETALLE_HORAS_EXTRA.Open                          ! File DETALLE_HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_HORAS_EXTRAS.Open                         ! File DETALLE_HORAS_EXTRAS used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:HORASEXTRASCVS.Open                               ! File HORASEXTRASCVS used by this procedure, so make sure it's RelationManager is open
  Relate:HORAS_EXTRA_DENARIUS.Open                         ! File HORAS_EXTRA_DENARIUS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:HORASEXTRASCVS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(HORASEXTRASCVS,'QUICKSCAN=on')
  SELF.SetAlerts()
  
  Loc:IdCabeceraHE = idCabeceraHE
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
    Relate:DETALLE_HORAS_EXTRA.Close
    Relate:DETALLE_HORAS_EXTRAS.Close
    Relate:EMPLEADOS.Close
    Relate:HORASEXTRASCVS.Close
    Relate:HORAS_EXTRA_DENARIUS.Close
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
    OF EVENT:OpenWindow
        WE::CantCloseNow += 1
        WE::CantCloseNowSetHere = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      if WE::CantCloseNow > 0 and ReturnValue = Level:Benign and WE::CantCloseNowSetHere
        WE::CantCloseNow -= 1
        WE::CantCloseNowSetHere = 0
      end
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  
  IF LEN(CLIP(IHE:Tipo)) > 0 AND CLIP(IHE:Convenio) <> 'UOCRA' THEN
  CLEAR(HEXD:Record)	
  HEXD:HEXD_ID = Loc:IdCabeceraHE
  HEXD:HEXD_FECHA_DATE = DATE(IHE:ï___Fecha[6:7],IHE:ï___Fecha[9:10],IHE:ï___Fecha[1:4])
  HEXD:HEXD_FECHA_TIME = 0
  HEXD:HEXD_LEGAJO = clip(IHE:Legajo)
  HEXD:HEXD_EMPLEADO = clip(IHE:Nombre)
  HEXD:HEXD_INICIO_Time =  CLIP(IHE:Inicio)
  HEXD:HEXD_FIN_Time = CLIP(IHE:Fin)
  HEXD:HEXD_CONVENIO = CLIP(IHE:Convenio)
  	IF CLIP(IHE:Tipo) = 'Hora' THEN
  		HEXD:HEXD_TIPO = 'S'
  	ELSE
  		HEXD:HEXD_TIPO =  CLIP(IHE:Tipo) 
  	END		
  	HEXD:HEXD_TIEMPO = FORMAT(HEXD:HEXD_FIN_Time - HEXD:HEXD_INICIO_Time + 1,@T4)
  	HEXD:HEXD_TIEMPO1 = FORMAT(HEXD:HEXD_FIN_Time - HEXD:HEXD_INICIO_Time + 1,@T4)
  	Loc:Horas = HEXD:HEXD_TIEMPO[1:2]
  	Loc:Minutos = 	HEXD:HEXD_TIEMPO[4:5]
  	Loc:Segundos = HEXD:HEXD_TIEMPO[7:8]
  	CLEAR(EPL:Record)
  	EPL:EMP_LEGAJO = clip(IHE:Legajo)
  	GET(EMPLEADOS,EPL:PK_EMPLEADOS)
  	IF NOT ERRORCODE() THEN
  		HEXD:HEXD_TIPOHORA = CLIP(EPL:EMP_HORAEXTRA)	
  	END	
  	CLEAR(HEXCD:Record)
  	!TODO VER SI ESTO LOOPEA SIN ASIGNAR UN VALOR AL GRUPO
  	SET(HEXCD:PK_HORAS_EXTRA_DENARIUS,HEXCD:PK_HORAS_EXTRA_DENARIUS)
  		LOOP 
  			NEXT(HORAS_EXTRA_DENARIUS)
  			IF ERRORCODE() THEN BREAK.	
  			IF HEXCD:HEXCD_TIPO_INTRANET = HEXD:HEXD_TIPO AND HEXD:HEXD_TIPOHORA = HEXCD:HEXCD_TIPO_HORA THEN
  				HEXD:HEXD_DENARIUS = HEXCD:HEXCD_ID
  			END	
  		END	
  	DO VERIFICAR_DIA_HABIL
  	HEXD:HEXD_DIA_HABIL = Loc:habil
  	IF ( CLIP(HEXD:HEXD_CONVENIO) = 'LyF' ) THEN	
  		IF CLIP(HEXD:HEXD_TIPOHORA) = 'SC'  THEN 
  			IF (Loc:Horas >= 7 AND Loc:habil = 1) OR (Loc:Horas >= 14 AND Loc:habil = 0) THEN				
  				HEXD:HEXD_REEMBOLSO = 2 
  				HEXD:HEXD_REEMBOLSOD = 2
  			ELSIF (Loc:Horas >= 1 AND Loc:Horas < 7 AND Loc:habil = 1) OR (Loc:Horas < 14 AND Loc:Horas >= 7  AND Loc:habil = 0) THEN	
  				HEXD:HEXD_REEMBOLSO = 1	
  				HEXD:HEXD_REEMBOLSOD = 1
  			ELSE
  				HEXD:HEXD_REEMBOLSO = 0 
  				!Para poder acumular y calcular el reembolso de todo el dia cuando hace hs extra cortadas
  				IF Loc:habil = 1 THEN
  					Loc:Horas = HEXD:HEXD_TIEMPO[1:2]*60
  					Loc:Minutos = HEXD:HEXD_TIEMPO[4:5]
  					HEXD:HEXD_REEMBOLSOD = ((Loc:Horas + Loc:Minutos)*2)/420	
  				ELSIF Loc:habil = 0 THEN
  					Loc:Horas = HEXD:HEXD_TIEMPO[1:2]*60
  					Loc:Minutos = HEXD:HEXD_TIEMPO[4:5]
  					HEXD:HEXD_REEMBOLSOD = ((Loc:Horas + Loc:Minutos)*2)/840	
  				END	
  			END		
  		ELSIF CLIP(HEXD:HEXD_TIPOHORA) = 'SNC'  THEN 
  			IF (Loc:Horas >= 6 AND Loc:habil = 1) OR (Loc:Horas >= 12 AND Loc:habil = 0) THEN
  				HEXD:HEXD_REEMBOLSO = 2 
  				HEXD:HEXD_REEMBOLSOD = 2
  			ELSIF (Loc:Horas >= 1 AND Loc:Horas < 6 AND Loc:habil = 1) OR (Loc:Horas < 12 AND Loc:Horas > 6 AND Loc:habil = 0) THEN
  				HEXD:HEXD_REEMBOLSO = 1 
  				HEXD:HEXD_REEMBOLSOD = 1
  			ELSE
  				HEXD:HEXD_REEMBOLSO = 0
  				!Para poder acumular y calcular el reembolso de todo el dia cuando hace hs extra cortadas
  				IF Loc:habil = 1 THEN
  					Loc:Horas = HEXD:HEXD_TIEMPO[1:2]*60
  					Loc:Minutos = HEXD:HEXD_TIEMPO[4:5]
  					HEXD:HEXD_REEMBOLSOD = ((Loc:Horas + Loc:Minutos)*2)/360	
  				ELSIF Loc:habil = 0 THEN
  					Loc:Horas = HEXD:HEXD_TIEMPO[1:2]*60
  					Loc:Minutos = HEXD:HEXD_TIEMPO[4:5]
  					HEXD:HEXD_REEMBOLSOD = ((Loc:Horas + Loc:Minutos)*2)/720	
  				END				 
  			END	
  		END	
  	ELSE
  		HEXD:HEXD_REEMBOLSO = 0
  		HEXD:HEXD_REEMBOLSOD = 0
  	END	
  ADD(DETALLE_HORAS_EXTRA)
  if errorcode() THEN
  	message(FILEerror())
  	stop()
  end	
  END	
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Form DETALLE_HORAS_EXTRA
!!! </summary>
UpdateHExtrasDenarius PROCEDURE (string estado)

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::HEXD:Record LIKE(HEXD:RECORD),THREAD
QuickWindow          WINDOW('Cambiar Hora Extra Denarius'),AT(,,195,118),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('UpdateHExtrasDenarius'), |
  SYSTEM
                       SHEET,AT(4,5,183,84),USE(?CurrentTab)
                         TAB,USE(?Tab:1),FONT(,10)
                           PROMPT('Reembolsos (%)'),AT(108,36),USE(?HEXD:HEXD_REEMBOLSO:Prompt:2),FONT(,,00004000h,FONT:bold), |
  TRN
                           ENTRY(@n_7),AT(15,52,47,16),USE(HEXD:HEXD_DENARIUS),FONT(,,COLOR:Red,FONT:bold),CENTER,FLAT
                           PROMPT('Código Denarius'),AT(15,36),USE(?HEXD:HEXD_DENARIUS:Prompt:2),FONT(,,00004000h,FONT:bold), |
  TRN
                           BUTTON,AT(70,52,16,16),USE(?CallLookup)
                           ENTRY(@n_7.2),AT(108,52,68,16),USE(HEXD:HEXD_REEMBOLSOD),FONT(,,COLOR:Red,FONT:bold),CENTER, |
  FLAT
                         END
                       END
                       BUTTON('&Aceptar'),AT(38,94,60,14),USE(?OK),FONT(,10),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(116,92,60,14),USE(?Cancel),FONT(,10),LEFT,ICON('WACANCEL.ICO'),FLAT, |
  MSG('Cancel operation'),TIP('Cancel operation')
                       ENTRY(@n3),AT(70,2,47,16),USE(HEXCD:HEXCD_ID),FONT(,,COLOR:Red,FONT:bold),CENTER,FLAT,HIDE
                       ENTRY(@s3),AT(125,3,60,10),USE(HEXD:HEXD_TIPOHORA),HIDE
                     END
SSEC::Viewing        BYTE(0)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Ver Hora Extra'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Cambiar Hora Extra'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & HEXD:HEXD_EMPLEADO & ')' ! Append status message to window title text
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('UpdateHExtrasDenarius')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?HEXD:HEXD_REEMBOLSO:Prompt:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(HEXD:Record,History::HEXD:Record)
  SELF.AddHistoryField(?HEXD:HEXD_DENARIUS,22)
  SELF.AddHistoryField(?HEXD:HEXD_REEMBOLSOD,25)
  SELF.AddHistoryField(?HEXD:HEXD_TIPOHORA,24)
  SELF.AddUpdateFile(Access:DETALLE_HORAS_EXTRA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:DETALLE_HORAS_EXTRA.Open                          ! File DETALLE_HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  Relate:HORAS_EXTRA_DENARIUS.Open                         ! File HORAS_EXTRA_DENARIUS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DETALLE_HORAS_EXTRA
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?HEXD:HEXD_DENARIUS{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?HEXD:HEXD_REEMBOLSOD{PROP:ReadOnly} = True
    ?HEXCD:HEXCD_ID{PROP:ReadOnly} = True
    ?HEXD:HEXD_TIPOHORA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  
  IF estado = 'C' THEN
  	SELF.Request = ViewRecord
  	DISABLE(?HEXD:HEXD_DENARIUS)
  	DISABLE(?CallLookup)
  	DISABLE(?HEXD:HEXD_REEMBOLSOD)
  END	
  IF CLIP(HEXD:HEXD_CONVENIO) <> 'LyF' THEN
  	DISABLE(?HEXD:HEXD_REEMBOLSOD)
  END
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_HORAS_EXTRA.Close
    Relate:HORAS_EXTRA_DENARIUS.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    HorasEXtraDenariuis(HEXD:HEXD_TIPOHORA)
    ReturnValue = GlobalResponse
  END
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
    OF ?HEXD:HEXD_DENARIUS
      ThisWindow.Reset(1)
    OF ?CallLookup
      ThisWindow.Update()
      HEXCD:HEXCD_ID = HEXCD:HEXCD_ID
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        HEXCD:HEXCD_ID = HEXCD:HEXCD_ID
        HEXD:HEXD_DENARIUS = HEXCD:HEXCD_ID
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?HEXCD:HEXCD_ID
      IF HEXCD:HEXCD_ID OR ?HEXCD:HEXCD_ID{PROP:Req}
        HEXCD:HEXCD_ID = HEXCD:HEXCD_ID
        IF Access:HORAS_EXTRA_DENARIUS.TryFetch(HEXCD:PK_HORAS_EXTRA_DENARIUS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            HEXCD:HEXCD_ID = HEXCD:HEXCD_ID
            HEXD:HEXD_DENARIUS = HEXCD:HEXCD_ID
          ELSE
            CLEAR(HEXD:HEXD_DENARIUS)
            SELECT(?HEXCD:HEXCD_ID)
            CYCLE
          END
        ELSE
          HEXD:HEXD_DENARIUS = HEXCD:HEXCD_ID
        END
      END
      ThisWindow.Reset(1)
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
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the HORAS_EXTRA_DENARIUS file
!!! </summary>
HorasEXtraDenariuis PROCEDURE (string tipohora)

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(HORAS_EXTRA_DENARIUS)
                       PROJECT(HEXCD:HEXCD_ID)
                       PROJECT(HEXCD:HEXCD_CONCEPTO)
                       PROJECT(HEXCD:HEXCD_CODIGO)
                       PROJECT(HEXCD:HEXCD_TIPO_INTRANET)
                       PROJECT(HEXCD:HEXCD_TIPO_HORA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
HEXCD:HEXCD_ID         LIKE(HEXCD:HEXCD_ID)           !List box control field - type derived from field
HEXCD:HEXCD_CONCEPTO   LIKE(HEXCD:HEXCD_CONCEPTO)     !List box control field - type derived from field
HEXCD:HEXCD_CODIGO     LIKE(HEXCD:HEXCD_CODIGO)       !List box control field - type derived from field
HEXCD:HEXCD_TIPO_INTRANET LIKE(HEXCD:HEXCD_TIPO_INTRANET) !List box control field - type derived from field
HEXCD:HEXCD_TIPO_HORA  LIKE(HEXCD:HEXCD_TIPO_HORA)    !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Código Horas Extra Denarius'),AT(,,277,224),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('HorasEXtraDenariuis'), |
  SYSTEM
                       LIST,AT(6,27,256,180),USE(?Browse:1),FONT(,10),HVSCROLL,FLAT,FORMAT('36C|M~Código~@n3@8' & |
  '0L(2)|M~Concepto~C(0)@s50@0R(2)|M~HEXCD CODIGO~C(0)@n-7@0L(2)|M~HEXCD TIPO INTRANET~' & |
  '@s10@0L(2)|M~HEXCD TIPO HORA~@s3@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the HORAS' & |
  '_EXTRA_DENARIUS file')
                       BUTTON('&Select'),AT(206,80,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,266,214),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                         END
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('HorasEXtraDenariuis')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('HEXCD:HEXCD_ID',HEXCD:HEXCD_ID)                    ! Added by: BrowseBox(ABC)
  BIND('HEXCD:HEXCD_CONCEPTO',HEXCD:HEXCD_CONCEPTO)        ! Added by: BrowseBox(ABC)
  BIND('HEXCD:HEXCD_CODIGO',HEXCD:HEXCD_CODIGO)            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:DETALLE_HORAS_EXTRA.Open                          ! File DETALLE_HORAS_EXTRA used by this procedure, so make sure it's RelationManager is open
  Relate:HORAS_EXTRA_DENARIUS.Open                         ! File HORAS_EXTRA_DENARIUS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:HORAS_EXTRA_DENARIUS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.SetFilter('(HEXCD:HEXCD_TIPO_HORA = HEXD:HEXD_TIPOHORA)') ! Apply filter expression to browse
  BRW1.AddField(HEXCD:HEXCD_ID,BRW1.Q.HEXCD:HEXCD_ID)      ! Field HEXCD:HEXCD_ID is a hot field or requires assignment from browse
  BRW1.AddField(HEXCD:HEXCD_CONCEPTO,BRW1.Q.HEXCD:HEXCD_CONCEPTO) ! Field HEXCD:HEXCD_CONCEPTO is a hot field or requires assignment from browse
  BRW1.AddField(HEXCD:HEXCD_CODIGO,BRW1.Q.HEXCD:HEXCD_CODIGO) ! Field HEXCD:HEXCD_CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(HEXCD:HEXCD_TIPO_INTRANET,BRW1.Q.HEXCD:HEXCD_TIPO_INTRANET) ! Field HEXCD:HEXCD_TIPO_INTRANET is a hot field or requires assignment from browse
  BRW1.AddField(HEXCD:HEXCD_TIPO_HORA,BRW1.Q.HEXCD:HEXCD_TIPO_HORA) ! Field HEXCD:HEXCD_TIPO_HORA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  !message(tipohora)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_HORAS_EXTRA.Close
    Relate:HORAS_EXTRA_DENARIUS.Close
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
SolicitudAusencia PROCEDURE 

prueba               LONG                                  !
Loc:diasLetras       STRING(20)                            !
Loc:dias             STRING(20)                            !
loc:legajo           LONG                                  !
loc:anio             LONG                                  !
loc:restan           SHORT                                 !
loc:inicio           CSTRING(17)                           !
loc:fin              CSTRING(17)                           !
loc:fecha_inicio     CSTRING(17)                           !
loc:fecha_fin        CSTRING(17)                           !
loc:fecha_inicio_a   CSTRING(17)                           !
loc:fecha_fin_a      CSTRING(17)                           !
CtrlOblgatorio       SHORT                                 !
SetObligatorio       BYTE                                  !
Obligatorio          BYTE                                  !
loc:str              STRING(4000)                          !
nombre               STRING(20)                            !
apellido             STRING(20)                            !
names                STRING(40)                            !
Convenios            SHORT                                 !
Tipo_Dias            STRING(1)                             !
Semana               SHORT                                 !
Loc:dias_restan      SHORT                                 !
BRW5::View:Browse    VIEW(DETALLE_AUSENCIA)
                       PROJECT(DAU:DAU_INICIO_DATE)
                       PROJECT(DAU:DAU_FIN_DATE)
                       PROJECT(DAU:DAU_DIAS)
                       PROJECT(DAU:DAU_DESCRIPCION)
                       PROJECT(DAU:DAU_OBSERVACIONES)
                       PROJECT(DAU:DAU_ANIO)
                       PROJECT(DAU:DAU_INICIO_TIME)
                       PROJECT(DAU:DAU_FIN_TIME)
                       PROJECT(DAU:DAU_MOTIVO)
                       PROJECT(DAU:DAU_CONDICION)
                       PROJECT(DAU:DAU_FECHA_DATE)
                       PROJECT(DAU:DAU_FECHA_TIME)
                       PROJECT(DAU:DAU_USUARIO)
                       PROJECT(DAU:DAU_NROLEG)
                       PROJECT(DAU:DAU_ESTADO)
                       PROJECT(DAU:DAU_ID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List
DAU:DAU_INICIO_DATE    LIKE(DAU:DAU_INICIO_DATE)      !List box control field - type derived from field
DAU:DAU_INICIO_DATE_NormalFG LONG                     !Normal forground color
DAU:DAU_INICIO_DATE_NormalBG LONG                     !Normal background color
DAU:DAU_INICIO_DATE_SelectedFG LONG                   !Selected forground color
DAU:DAU_INICIO_DATE_SelectedBG LONG                   !Selected background color
DAU:DAU_FIN_DATE       LIKE(DAU:DAU_FIN_DATE)         !List box control field - type derived from field
DAU:DAU_FIN_DATE_NormalFG LONG                        !Normal forground color
DAU:DAU_FIN_DATE_NormalBG LONG                        !Normal background color
DAU:DAU_FIN_DATE_SelectedFG LONG                      !Selected forground color
DAU:DAU_FIN_DATE_SelectedBG LONG                      !Selected background color
DAU:DAU_DIAS           LIKE(DAU:DAU_DIAS)             !List box control field - type derived from field
DAU:DAU_DIAS_NormalFG  LONG                           !Normal forground color
DAU:DAU_DIAS_NormalBG  LONG                           !Normal background color
DAU:DAU_DIAS_SelectedFG LONG                          !Selected forground color
DAU:DAU_DIAS_SelectedBG LONG                          !Selected background color
Loc:dias               LIKE(Loc:dias)                 !List box control field - type derived from local data
Loc:dias_NormalFG      LONG                           !Normal forground color
Loc:dias_NormalBG      LONG                           !Normal background color
Loc:dias_SelectedFG    LONG                           !Selected forground color
Loc:dias_SelectedBG    LONG                           !Selected background color
DAU:DAU_DESCRIPCION    LIKE(DAU:DAU_DESCRIPCION)      !List box control field - type derived from field
DAU:DAU_DESCRIPCION_NormalFG LONG                     !Normal forground color
DAU:DAU_DESCRIPCION_NormalBG LONG                     !Normal background color
DAU:DAU_DESCRIPCION_SelectedFG LONG                   !Selected forground color
DAU:DAU_DESCRIPCION_SelectedBG LONG                   !Selected background color
DAU:DAU_OBSERVACIONES  LIKE(DAU:DAU_OBSERVACIONES)    !List box control field - type derived from field
DAU:DAU_OBSERVACIONES_NormalFG LONG                   !Normal forground color
DAU:DAU_OBSERVACIONES_NormalBG LONG                   !Normal background color
DAU:DAU_OBSERVACIONES_SelectedFG LONG                 !Selected forground color
DAU:DAU_OBSERVACIONES_SelectedBG LONG                 !Selected background color
DAU:DAU_ANIO           LIKE(DAU:DAU_ANIO)             !Browse hot field - type derived from field
DAU:DAU_INICIO_TIME    LIKE(DAU:DAU_INICIO_TIME)      !Browse hot field - type derived from field
DAU:DAU_FIN_TIME       LIKE(DAU:DAU_FIN_TIME)         !Browse hot field - type derived from field
DAU:DAU_MOTIVO         LIKE(DAU:DAU_MOTIVO)           !Browse hot field - type derived from field
DAU:DAU_CONDICION      LIKE(DAU:DAU_CONDICION)        !Browse hot field - type derived from field
DAU:DAU_FECHA_DATE     LIKE(DAU:DAU_FECHA_DATE)       !Browse hot field - type derived from field
DAU:DAU_FECHA_TIME     LIKE(DAU:DAU_FECHA_TIME)       !Browse hot field - type derived from field
DAU:DAU_USUARIO        LIKE(DAU:DAU_USUARIO)          !Browse hot field - type derived from field
DAU:DAU_NROLEG         LIKE(DAU:DAU_NROLEG)           !Browse hot field - type derived from field
DAU:DAU_ESTADO         LIKE(DAU:DAU_ESTADO)           !Browse hot field - type derived from field
DAU:DAU_ID             LIKE(DAU:DAU_ID)               !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Solicitud Ausencia'),AT(,,500,300),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,ICON('personal.ico'),GRAY,IMM,MDI,HLP('SolicitudAusencia'),SYSTEM
                       GROUP('EMPLEADO/A'),AT(5,5,490,139),USE(?GROUP1),FONT(,,,FONT:bold,CHARSET:DEFAULT),BOXED
                         PROMPT('Nro. de Legajo'),AT(28,20),USE(?EPL:EMP_LEGAJO:Prompt),FONT(,12,,FONT:bold)
                         ENTRY(@N_5),AT(36,38,60,30),USE(EPL:EMP_LEGAJO),FONT(,18,COLOR:Red,FONT:bold),CENTER(1),FLAT
                         PROMPT('Buscar por Apellido'),AT(17,71),USE(?CallLookup:Prompt),FONT(,12,,FONT:bold)
                         BUTTON,AT(45,89,40,40),USE(?CallLookup),ICON('clients.ico')
                         PROMPT('Nombre'),AT(153,20),USE(?EPL:EMP_NOMBRE:Prompt),FONT(,12,,FONT:bold)
                         ENTRY(@s31),AT(207,20,268,12),USE(EPL:EMP_NOMBRE),FONT(,12,,FONT:bold),FLAT,READONLY,SKIP
                         PROMPT('Dirección'),AT(153,44),USE(?EPL:EMP_DIRECCION:Prompt),FONT(,12,,FONT:bold)
                         ENTRY(@s25),AT(207,44,207,12),USE(EPL:EMP_DIRECCION),FONT(,12,,FONT:bold),FLAT,READONLY,SKIP
                         PROMPT('Convenio'),AT(153,68),USE(?CON:CONV_CONVENIO:Prompt),FONT(,12)
                         ENTRY(@s12),AT(207,68,157,12),USE(CON:CONV_CONVENIO),FONT(,12),UPR,FLAT
                         PROMPT('Nro. Tel.'),AT(153,92),USE(?EPL:EMP_NRO_TEL:Prompt),FONT(,12)
                         ENTRY(@s15),AT(207,92,107,12),USE(EPL:EMP_NRO_TEL),FONT(,12),UPR,FLAT
                         PROMPT('Nro. Cel.'),AT(318,92),USE(?EPL:EMP_NRO_CEL:Prompt),FONT(,12)
                         ENTRY(@s15),AT(369,92,107,12),USE(EPL:EMP_NRO_CEL),FONT(,12),UPR,FLAT
                         LINE,AT(133,20,0,110),USE(?LINE1),COLOR(COLOR:Black)
                         PROMPT('E-mail'),AT(153,115),USE(?EPL:EMP_EMAIL:Prompt),FONT(,12)
                         ENTRY(@s50),AT(207,115,207,14),USE(EPL:EMP_EMAIL),FONT(,12),UPR,FLAT
                       END
                       GROUP('DETALLE AUSENCIAS'),AT(5,148,490,147),USE(?GROUP2),FONT(,,COLOR:Black,FONT:bold,CHARSET:DEFAULT), |
  BOXED
                         LIST,AT(10,158,480,112),USE(?List),FONT(,10),HVSCROLL,FLAT,FORMAT('53L(1)|*~Inicio~C(0)' & |
  '@d17@53L(1)|*~Fin~C(0)@d17@0L(1)|*~DAU DIAS~C(0)@n-7@30C|*~Días~@s20@92L(1)|*~Motivo' & |
  '~C(0)@s25@300L(1)|M*~Observaciones~C(0)@s255@'),FROM(Queue:Browse:1),IMM,SCROLL
                         BUTTON('&Agregar'),AT(10,275,72,15),USE(?Insert),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wainsert.ico'), |
  FLAT,LAYOUT(0)
                         BUTTON('&Modificar'),AT(86,275,72,15),USE(?Change),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wachange.ico'), |
  FLAT,LAYOUT(0)
                         BUTTON('Concepto Médico'),AT(237,275,90,15),USE(?Concept),FONT(,10,COLOR:Red,FONT:bold),FLAT
                         BUTTON('Validar'),AT(390,275,40,15),USE(?Validate),FONT(,10,COLOR:Green,FONT:bold),FLAT
                         BUTTON('Anular'),AT(449,275,40,15),USE(?Cancel),FONT(,10,0000008Bh,FONT:bold),FLAT
                         BUTTON('&Borrar'),AT(36,201,72,15),USE(?Delete),FONT(,10,COLOR:Navy,FONT:bold),LEFT,ICON('wadelete.ico'), |
  FLAT,HIDE,LAYOUT(0)
                         BUTTON('Certificado'),AT(331,275,55,15),USE(?Certificate),FONT(,10,008B8B00h),FLAT
                         BUTTON('Reporte'),AT(184,275),USE(?Reporte),FONT(,10),FLAT
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Open                   PROCEDURE(),DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  GLO:oneInstance_SolicitudAusencia_thread = 0

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ANULAR_AUSENCIA     ROUTINE
    CLEAR(DAU:Record)
    DAU:DAU_NROLEG = BRW5.Q.DAU:DAU_NROLEG
    DAU:DAU_ID = BRW5.Q.DAU:DAU_ID
    GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
    IF NOT ERRORCODE() THEN
        DO PREPARAR_PARAMETROS
        MotivoAnulacion()
        IF GLO:Obs_Anulacion <> '' THEN
            DAU:DAU_OBSERVACIONES = DAU:DAU_OBSERVACIONES & ' - ' & GLO:Obs_Anulacion
            DAU:DAU_ESTADO = 'A'
            Access:DETALLE_AUSENCIA.Update()
            IF NOT ERRORCODE() THEN
                MESSAGE('Se ha Anulado la AUSENCIA', 'Anulación', ICON:Exclamation, BUTTON:OK, 1)
                BRW5.ResetFromFile()
            END
        END
    END
PREPARAR_PARAMETROS ROUTINE
    DAU:DAU_ANIO = BRW5.Q.DAU:DAU_ANIO
    DAU:DAU_INICIO_DATE = BRW5.Q.DAU:DAU_INICIO_DATE
    DAU:DAU_INICIO_TIME = BRW5.Q.DAU:DAU_INICIO_TIME
    DAU:DAU_DIAS = BRW5.Q.DAU:DAU_DIAS
    DAU:DAU_FIN_DATE = BRW5.Q.DAU:DAU_FIN_DATE
    DAU:DAU_FIN_TIME = BRW5.Q.DAU:DAU_FIN_TIME
    DAU:DAU_MOTIVO = BRW5.Q.DAU:DAU_MOTIVO
    DAU:DAU_CONDICION = BRW5.Q.DAU:DAU_CONDICION
    DAU:DAU_DESCRIPCION = BRW5.Q.DAU:DAU_DESCRIPCION
    DAU:DAU_OBSERVACIONES = BRW5.Q.DAU:DAU_OBSERVACIONES
    DAU:DAU_FECHA_DATE = BRW5.Q.DAU:DAU_FECHA_DATE
    DAU:DAU_FECHA_TIME = BRW5.Q.DAU:DAU_FECHA_TIME
    DAU:DAU_FECHA_UPDATE_DATE = TODAY()
    DAU:DAU_FECHA_UPDATE_TIME = CLOCK()
    DAU:DAU_USUARIO = BRW5.Q.DAU:DAU_USUARIO
DIA_LETRA      ROUTINE
    CASE DAU:DAU_DIAS
    OF 1
        Glo:diaLetra = '(Uno)'
    OF 2
        Glo:diaLetra = '(Dos)'
    OF 3
        Glo:diaLetra = '(Tres)'
    OF 4
        Glo:diaLetra = '(Cuatro)'
    OF 5
        Glo:diaLetra = '(Cinco)'
    OF 6
        Glo:diaLetra = '(Seis)'
    OF 7
        Glo:diaLetra = '(Siete)'
    OF 8
        Glo:diaLetra = '(Ocho)'
    OF 9
        Glo:diaLetra = '(Nueve)'
    OF 10
        Glo:diaLetra = '(Diez)'
    OF 11
        Glo:diaLetra = '(Once)'
    OF 12
        Glo:diaLetra = '(Doce)'
    OF 13
        Glo:diaLetra = '(Trece)'
    OF 14
        Glo:diaLetra = '(Catorce)'
    OF 15
        Glo:diaLetra = '(Quince)'
    OF 16
        Glo:diaLetra = '(Dieciséis)'
    OF 17
        Glo:diaLetra = '(Diecisiete)'
    OF 18
        Glo:diaLetra = '(Dieciocho)'
    OF 19
        Glo:diaLetra = '(Diecinueve)'
    OF 20
        Glo:diaLetra = '(Veinte)'
    OF 21
        Glo:diaLetra = '(Veintiuno)'
    OF 22
        Glo:diaLetra = '(Veintidós)'
    OF 23
        Glo:diaLetra = '(Veintitrés)'
    OF 24
        Glo:diaLetra = '(Veinticuatro)'
    OF 25
        Glo:diaLetra = '(Veinticinco)'
    OF 26
        Glo:diaLetra = '(Veintiséis)'
    OF 27
        Glo:diaLetra = '(Veintisiete)'
    OF 28
        Glo:diaLetra = '(Veintiocho)'
    OF 29
        Glo:diaLetra = '(Veintinueve)'
    OF 30
        Glo:diaLetra = '(Treinta)'
    OF 31
        Glo:diaLetra = '(Treinta y uno)'
    OF 32
        Glo:diaLetra = '(Treinta y dos)'
    OF 33
        Glo:diaLetra = '(Treinta y tres)'
    OF 34
        Glo:diaLetra = '(Treinta y cuatro)'
    OF 35
        Glo:diaLetra = '(Treinta y cinco)'
    ELSE
        Glo:diaLetra = ''
    END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SolicitudAusencia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EPL:EMP_LEGAJO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('DAU:DAU_ESTADO',DAU:DAU_ESTADO)                    ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_ANIO',DAU:DAU_ANIO)                        ! Added by: BrowseBox(ABC)
  BIND('loc:anio',loc:anio)                                ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_DIAS',DAU:DAU_DIAS)                        ! Added by: BrowseBox(ABC)
  BIND('Loc:dias',Loc:dias)                                ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_DESCRIPCION',DAU:DAU_DESCRIPCION)          ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_OBSERVACIONES',DAU:DAU_OBSERVACIONES)      ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_MOTIVO',DAU:DAU_MOTIVO)                    ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_CONDICION',DAU:DAU_CONDICION)              ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_USUARIO',DAU:DAU_USUARIO)                  ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_NROLEG',DAU:DAU_NROLEG)                    ! Added by: BrowseBox(ABC)
  BIND('DAU:DAU_ID',DAU:DAU_ID)                            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:CERTIFICADOS.Open                                 ! File CERTIFICADOS used by this procedure, so make sure it's RelationManager is open
  Relate:CONCEPTO_MEDICO.Open                              ! File CONCEPTO_MEDICO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  Relate:EMPLEADOS.Open                                    ! File EMPLEADOS used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  Relate:empch.Open                                        ! File empch used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW5.Init(?List,Queue:Browse:1.ViewPosition,BRW5::View:Browse,Queue:Browse:1,Relate:DETALLE_AUSENCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW5.Q &= Queue:Browse:1
  BRW5.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW5.RetainRow = 0
  BRW5.AddSortOrder(,DAU:FK_DAU_NROLEG)                    ! Add the sort order for DAU:FK_DAU_NROLEG for sort order 1
  BRW5.AddRange(DAU:DAU_NROLEG,EPL:EMP_LEGAJO)             ! Add single value range limit for sort order 1
  BRW5.SetFilter('(DAU:DAU_ESTADO = ''P'' OR DAU:DAU_ANIO >= (loc:anio - 1))') ! Apply filter expression to browse
  !BRW5.SetOrder('-DAU:DAU_FECHA')
  BRW5.AddField(DAU:DAU_INICIO_DATE,BRW5.Q.DAU:DAU_INICIO_DATE) ! Field DAU:DAU_INICIO_DATE is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_FIN_DATE,BRW5.Q.DAU:DAU_FIN_DATE)  ! Field DAU:DAU_FIN_DATE is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_DIAS,BRW5.Q.DAU:DAU_DIAS)          ! Field DAU:DAU_DIAS is a hot field or requires assignment from browse
  BRW5.AddField(Loc:dias,BRW5.Q.Loc:dias)                  ! Field Loc:dias is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_DESCRIPCION,BRW5.Q.DAU:DAU_DESCRIPCION) ! Field DAU:DAU_DESCRIPCION is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_OBSERVACIONES,BRW5.Q.DAU:DAU_OBSERVACIONES) ! Field DAU:DAU_OBSERVACIONES is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_ANIO,BRW5.Q.DAU:DAU_ANIO)          ! Field DAU:DAU_ANIO is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_INICIO_TIME,BRW5.Q.DAU:DAU_INICIO_TIME) ! Field DAU:DAU_INICIO_TIME is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_FIN_TIME,BRW5.Q.DAU:DAU_FIN_TIME)  ! Field DAU:DAU_FIN_TIME is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_MOTIVO,BRW5.Q.DAU:DAU_MOTIVO)      ! Field DAU:DAU_MOTIVO is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_CONDICION,BRW5.Q.DAU:DAU_CONDICION) ! Field DAU:DAU_CONDICION is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_FECHA_DATE,BRW5.Q.DAU:DAU_FECHA_DATE) ! Field DAU:DAU_FECHA_DATE is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_FECHA_TIME,BRW5.Q.DAU:DAU_FECHA_TIME) ! Field DAU:DAU_FECHA_TIME is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_USUARIO,BRW5.Q.DAU:DAU_USUARIO)    ! Field DAU:DAU_USUARIO is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_NROLEG,BRW5.Q.DAU:DAU_NROLEG)      ! Field DAU:DAU_NROLEG is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_ESTADO,BRW5.Q.DAU:DAU_ESTADO)      ! Field DAU:DAU_ESTADO is a hot field or requires assignment from browse
  BRW5.AddField(DAU:DAU_ID,BRW5.Q.DAU:DAU_ID)              ! Field DAU:DAU_ID is a hot field or requires assignment from browse
  BRW5.AskProcedure = 2                                    ! Will call: FormSolicitudAusencia
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  loc:anio = YEAR(TODAY())
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CERTIFICADOS.Close
    Relate:CONCEPTO_MEDICO.Close
    Relate:CONVENIO.Close
    Relate:DETALLE_AUSENCIA.Close
    Relate:EMPLEADOS.Close
    Relate:TMPUsosMultiples.Close
    Relate:empch.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  !Estado de botones al iniciar el procedure
  DISABLE(?Cancel)
  DISABLE(?Certificate)
  DISABLE(?Change)
  DISABLE(?Concept)
  DISABLE(?Reporte)
  DISABLE(?Delete)
  DISABLE(?Validate)


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  !MESSAGE('RESETW')
  !COMPLETA O REFRESCA LOS CAMPOS LUEGO DE ELEGIR UN LEGAJO
  IF EPL:EMP_LEGAJO <> 0 THEN	
      !COMPROBAMOS SI EL EMPLEADO EXISTE SINO BLANQUEAMOS LOS CAMPOS
      GET(EMPLEADOS,EPL:PK_EMPLEADOS)
      IF ERRORCODE() THEN
          !LOS EMPLEADOS APTOS PARA AUSENCIAS DEBEN SER ACITVOS Y NO PASANTES
          CLEAR(EMPLEADOS:RECORD)
          GET(EMPLEADOS,0)
          CLEAR(SECTOR:RECORD)
          GET(SECTOR,0)
          CLEAR(CONVENIO:RECORD)
          GET(CONVENIO,0)
          DISPLAY()
          SELECT(?EPL:EMP_LEGAJO)
      ELSE
          CON:CONV_ID = EPL:EMP_CONVENIO
          GET(CONVENIO,CON:PK_CONVENIO)
          IF NOT errorcode()
              DISPLAY(?CON:CONV_CONVENIO)
          END
      END
  END


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      ABMEmpleadosAusencia
      FormSolicitudAusencia
    END
    ReturnValue = GlobalResponse
  END
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
    OF ?Concept
      !Se verifica que la fecha de FIN de AUSENCIA no sea nula
      IF DAU:DAU_FIN_DATE = '' THEN
          MESSAGE('¡Seleccionar Fecha FIN!', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          CYCLE
      END
    OF ?Validate
      !No se puede validar una AUSENCIA sin Fecha FIN
      IF DAU:DAU_FIN_GROUP = '' THEN
          BEEP
          MESSAGE('No se puede VALIDAR, establecer FECHA FIN', 'Error de VALIDACIÓN', ICON:Exclamation, BUTTON:OK, 1)
          CYCLE
      END
      !Se verifica que no se haya superado el límite de 20 días para la validación
      MESSAGE(GLO:UserAccess)
      IF TODAY() > (DAU:DAU_FECHA_DATE + 19) AND ~GLO:UserAccess THEN
          BEEP
          MESSAGE('No se puede VALIDAR, se supero el límite de 20 días', 'Error de VALIDACIÓN', ICON:Exclamation, BUTTON:OK, 1)
          CYCLE
      END
      !Se verifica que la fecha de FIN de AUSENCIA no sea nula
      IF DAU:DAU_FIN_DATE = '' OR NULL(DAU:DAU_FIN) THEN
          MESSAGE('¡Seleccionar Fecha FIN!', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          CYCLE
      END
    OF ?Certificate
      !Se verifica que la fecha de FIN de AUSENCIA no sea nula
      IF DAU:DAU_FIN_DATE = '' THEN
          MESSAGE('¡Seleccionar Fecha FIN!', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          CYCLE
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EPL:EMP_LEGAJO
      IF EPL:EMP_LEGAJO OR ?EPL:EMP_LEGAJO{PROP:Req}
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        IF Access:EMPLEADOS.TryFetch(EPL:PK_EMPLEADOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
            DAU:DAU_NROLEG = EPL:EMP_LEGAJO
            CON:CONV_ID = EPL:EMP_CONVENIO
          ELSE
            CLEAR(DAU:DAU_NROLEG)
            CLEAR(CON:CONV_ID)
            SELECT(?EPL:EMP_LEGAJO)
            CYCLE
          END
        ELSE
          DAU:DAU_NROLEG = EPL:EMP_LEGAJO
          CON:CONV_ID = EPL:EMP_CONVENIO
        END
      END
      ThisWindow.Reset(1)
    OF ?CallLookup
      ThisWindow.Update()
      clear(EPL:EMP_LEGAJO,1)
      post(event:accepted,?EPL:EMP_LEGAJO)
      EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        DAU:DAU_NROLEG = EPL:EMP_LEGAJO
        CON:CONV_ID = EPL:EMP_CONVENIO
      END
      ThisWindow.Reset(1)
    OF ?Concept
      ThisWindow.Update()
      !Abriendo FORM de Concepto Médico
      CLEAR(CME:Record) !Limpio el Búfer
      CME:CME_DAU_ID = BRW5.Q.DAU:DAU_ID
      GET(CONCEPTO_MEDICO,CME:FK_CME_DAU_ID) !Obtengo datos para ver si existe CONCEPTO MÉDICO
      IF NOT ERRORCODE() THEN !Concepto médico existente, se verifica estado del certificado
          IF (DAU:DAU_ESTADO = 'A' OR DAU:DAU_ESTADO = 'P') AND (DAU:DAU_FIN_DATE >= TODAY() OR GLO:UserAccess <> 0) THEN
              GlobalRequest = ChangeRecord
              FormConceptoMedico()
          ELSE
              GlobalRequest = ViewRecord
              FormConceptoMedico()
          END 
      ELSE !NO existe certificado médico, creo un nuevo certificado
          GlobalRequest = InsertRecord
          FormConceptoMedico()
      END
      ThisWindow.Reset(1)
    OF ?Validate
      ThisWindow.Update()
      !BOTON VALIDAR AUSENCIA
      CLEAR(DAU:Record)
      DAU:DAU_NROLEG = BRW5.Q.DAU:DAU_NROLEG
      DAU:DAU_ID = BRW5.Q.DAU:DAU_ID
      GET(DETALLE_AUSENCIA, DAU:FK_DAU_NROLEG)
      IF NOT errorcode() THEN
          DO PREPARAR_PARAMETROS
          DAU:DAU_ESTADO = 'V'
          Access:DETALLE_AUSENCIA.Update()
          IF NOT ERRORCODE() THEN
              MESSAGE('Se ha Validado una AUSENCIA', 'Validación!',ICON:Exclamation,BUTTON:OK,1)
              BRW5.ResetFromFile()
          END
      ELSE
          MESSAGE('NO es posible VALIDAR la AUSENCIA', 'Inconsistencia de Validación!',ICON:Exclamation,BUTTON:OK,1)
      END
      ThisWindow.Reset(1)
    OF ?Cancel
      ThisWindow.Update()
      !BOTON ANULAR AUSENCIA
      !Fecha de Fin de Ausencia >= que la actual o es administrador? Si, me deja anular
      IF DAU:DAU_FIN_DATE >= TODAY() OR DAU:DAU_FIN_DATE = '' OR GLO:UserAccess THEN
          IF DAU:DAU_MOTIVO = 'AC' OR DAU:DAU_MOTIVO = 'E' OR DAU:DAU_MOTIVO = 'AF' OR DAU:DAU_MOTIVO = 'M' OR DAU:DAU_MOTIVO = 'TL' THEN
              CLEAR(CME:Record) !Limpio el Búfer
              CME:CME_DAU_ID = BRW5.Q.DAU:DAU_ID
              GET(CONCEPTO_MEDICO,CME:FK_CME_DAU_ID) !Obtengo datos para ver si existe un CONCEPTO MÉDICO asociado
              IF NOT ERRORCODE() THEN !Si existe, debo eliminar el CONCEPTO MÉDICO
                  MESSAGE('Debe ELIMINAR el CONCEPTO MÉDICO asociado!', 'Inconsistencia de Anulación', ICON:Exclamation, BUTTON:OK, 1)
              ELSE
                  DO ANULAR_AUSENCIA
              END
          ELSIF DAU:DAU_MOTIVO = 'CD' OR DAU:DAU_MOTIVO = 'CP' OR DAU:DAU_MOTIVO = 'C' OR DAU:DAU_MOTIVO = 'CA' OR DAU:DAU_MOTIVO = 'LS' OR DAU:DAU_MOTIVO = 'DV' OR DAU:DAU_MOTIVO = 'DS' OR DAU:DAU_MOTIVO = 'EX' OR DAU:DAU_MOTIVO = 'F' OR DAU:DAU_MOTIVO = 'G' OR DAU:DAU_MOTIVO = 'MA' OR DAU:DAU_MOTIVO = 'NA' OR DAU:DAU_MOTIVO = 'S' OR DAU:DAU_MOTIVO = 'RP' OR DAU:DAU_MOTIVO = 'VA' OR DAU:DAU_MOTIVO = 'A' OR DAU:DAU_MOTIVO = 'SA' THEN
              CLEAR(CER:Record) !Limpio el Búfer
              CER:CER_DAU_ID = BRW5.Q.DAU:DAU_ID
              GET(CERTIFICADOS,CER:FK_CER_DAU_ID) !Obtengo datos para ver si existe CERTIDFICADO
              IF NOT ERRORCODE() THEN !Si existe, debo eliminar el CERTIFICADO
                  MESSAGE('Debe ELIMINAR el CERTIFICADO asociado!', 'Inconsistencia de Anulación', ICON:Exclamation, BUTTON:OK, 1)
              ELSE
                  DO ANULAR_AUSENCIA
              END
          ELSE
              DO ANULAR_AUSENCIA
          END
      ELSE !No, No puede anular una que ya paso!
          MESSAGE('No es posible ANULAR la AUSENCIA ya FINALIZADA', 'Anulación', ICON:Exclamation, BUTTON:OK, 1)
      END
      ThisWindow.Reset(1)
    OF ?Certificate
      ThisWindow.Update()
      !Abriendo FORM de Certificados
      CLEAR(CER:Record) !Limpio el Búfer
      CER:CER_DAU_ID = DAU:DAU_ID
      GET(CERTIFICADOS, CER:FK_CER_DAU_ID) !Obtengo datos para ver si existe CERTIFICADO
      IF NOT ERRORCODE() THEN !Concepto médico existente, se verifica estado del certificado
          IF (DAU:DAU_ESTADO = 'A' OR DAU:DAU_ESTADO = 'P') AND (DAU:DAU_FIN_DATE >= TODAY() OR GLO:UserAccess <> 0) THEN
              GlobalRequest = ChangeRecord
              FormCertificado()
          ELSE
              GlobalRequest = ViewRecord
              FormCertificado()
          END
      ELSE !Si NO existe, inserto nuevos datos
          GlobalRequest = InsertRecord
          FormCertificado()
      END
      ThisWindow.Reset(1)
    OF ?Reporte
      ThisWindow.Update()
      IF DAU:DAU_DIAS <> 0 THEN
          DO DIA_LETRA
      ELSE
          DAU:DAU_DIAS = ''
          Glo:diaLetra = ''
      END
      ReporteMedico(DAU:DAU_ID, DAU:DAU_NROLEG)
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
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?Insert
      IF EPL:EMP_LEGAJO = 0 OR EPL:EMP_LEGAJO = '' THEN
          MESSAGE('¡Seleccionar EMPLEADO!', 'Advertencia!', ICON:Exclamation, BUTTON:OK, 1)
          SELECT(EPL:EMP_LEGAJO)
          CYCLE.
    END
  ReturnValue = PARENT.TakeSelected()
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW5.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !MESSAGE('RESETFROMFILE')
  !REFRESCA LOS CAMBIOS EIP
  IF VCRRequest=VCR:None
  CASE Request
      OF ChangeRecord OROF InsertRecord
          IF Response = RequestCompleted
              ThisWindow.Reset(1)
          END
      END
  END


BRW5.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW5.SetQueueRecord PROCEDURE

  CODE
  Loc:dias = DAU:DAU_DIAS & ' - ' & LEFT(DAU:DAU_CONDICION[1:1])
  PARENT.SetQueueRecord
  
  IF (DAU:DAU_ESTADO = 'P')
    SELF.Q.DAU:DAU_INICIO_DATE_NormalFG = 16711680         ! Set conditional color values for DAU:DAU_INICIO_DATE
    SELF.Q.DAU:DAU_INICIO_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedBG = 16711680
    SELF.Q.DAU:DAU_FIN_DATE_NormalFG = 16711680            ! Set conditional color values for DAU:DAU_FIN_DATE
    SELF.Q.DAU:DAU_FIN_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedBG = 16711680
    SELF.Q.DAU:DAU_DIAS_NormalFG = 16711680                ! Set conditional color values for DAU:DAU_DIAS
    SELF.Q.DAU:DAU_DIAS_NormalBG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedFG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedBG = 16711680
    SELF.Q.Loc:dias_NormalFG = 16711680                    ! Set conditional color values for Loc:dias
    SELF.Q.Loc:dias_NormalBG = -1
    SELF.Q.Loc:dias_SelectedFG = -1
    SELF.Q.Loc:dias_SelectedBG = 16711680
    SELF.Q.DAU:DAU_DESCRIPCION_NormalFG = 16711680         ! Set conditional color values for DAU:DAU_DESCRIPCION
    SELF.Q.DAU:DAU_DESCRIPCION_NormalBG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedFG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedBG = 16711680
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalFG = 16711680       ! Set conditional color values for DAU:DAU_OBSERVACIONES
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalBG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedFG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedBG = 16711680
  ELSIF (DAU:DAU_ESTADO = 'V')
    SELF.Q.DAU:DAU_INICIO_DATE_NormalFG = 32768            ! Set conditional color values for DAU:DAU_INICIO_DATE
    SELF.Q.DAU:DAU_INICIO_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedBG = 32768
    SELF.Q.DAU:DAU_FIN_DATE_NormalFG = 32768               ! Set conditional color values for DAU:DAU_FIN_DATE
    SELF.Q.DAU:DAU_FIN_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedBG = 32768
    SELF.Q.DAU:DAU_DIAS_NormalFG = 32768                   ! Set conditional color values for DAU:DAU_DIAS
    SELF.Q.DAU:DAU_DIAS_NormalBG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedFG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedBG = 32768
    SELF.Q.Loc:dias_NormalFG = 32768                       ! Set conditional color values for Loc:dias
    SELF.Q.Loc:dias_NormalBG = -1
    SELF.Q.Loc:dias_SelectedFG = -1
    SELF.Q.Loc:dias_SelectedBG = 32768
    SELF.Q.DAU:DAU_DESCRIPCION_NormalFG = 32768            ! Set conditional color values for DAU:DAU_DESCRIPCION
    SELF.Q.DAU:DAU_DESCRIPCION_NormalBG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedFG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedBG = 32768
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalFG = 32768          ! Set conditional color values for DAU:DAU_OBSERVACIONES
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalBG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedFG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedBG = 32768
  ELSIF (DAU:DAU_ESTADO = 'A')
    SELF.Q.DAU:DAU_INICIO_DATE_NormalFG = 255              ! Set conditional color values for DAU:DAU_INICIO_DATE
    SELF.Q.DAU:DAU_INICIO_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedBG = 255
    SELF.Q.DAU:DAU_FIN_DATE_NormalFG = 255                 ! Set conditional color values for DAU:DAU_FIN_DATE
    SELF.Q.DAU:DAU_FIN_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedBG = 255
    SELF.Q.DAU:DAU_DIAS_NormalFG = 255                     ! Set conditional color values for DAU:DAU_DIAS
    SELF.Q.DAU:DAU_DIAS_NormalBG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedFG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedBG = 255
    SELF.Q.Loc:dias_NormalFG = 255                         ! Set conditional color values for Loc:dias
    SELF.Q.Loc:dias_NormalBG = -1
    SELF.Q.Loc:dias_SelectedFG = -1
    SELF.Q.Loc:dias_SelectedBG = 255
    SELF.Q.DAU:DAU_DESCRIPCION_NormalFG = 255              ! Set conditional color values for DAU:DAU_DESCRIPCION
    SELF.Q.DAU:DAU_DESCRIPCION_NormalBG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedFG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedBG = 255
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalFG = 255            ! Set conditional color values for DAU:DAU_OBSERVACIONES
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalBG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedFG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedBG = 255
  ELSE
    SELF.Q.DAU:DAU_INICIO_DATE_NormalFG = -1               ! Set color values for DAU:DAU_INICIO_DATE
    SELF.Q.DAU:DAU_INICIO_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_INICIO_DATE_SelectedBG = -1
    SELF.Q.DAU:DAU_FIN_DATE_NormalFG = -1                  ! Set color values for DAU:DAU_FIN_DATE
    SELF.Q.DAU:DAU_FIN_DATE_NormalBG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedFG = -1
    SELF.Q.DAU:DAU_FIN_DATE_SelectedBG = -1
    SELF.Q.DAU:DAU_DIAS_NormalFG = -1                      ! Set color values for DAU:DAU_DIAS
    SELF.Q.DAU:DAU_DIAS_NormalBG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedFG = -1
    SELF.Q.DAU:DAU_DIAS_SelectedBG = -1
    SELF.Q.Loc:dias_NormalFG = -1                          ! Set color values for Loc:dias
    SELF.Q.Loc:dias_NormalBG = -1
    SELF.Q.Loc:dias_SelectedFG = -1
    SELF.Q.Loc:dias_SelectedBG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_NormalFG = -1               ! Set color values for DAU:DAU_DESCRIPCION
    SELF.Q.DAU:DAU_DESCRIPCION_NormalBG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedFG = -1
    SELF.Q.DAU:DAU_DESCRIPCION_SelectedBG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalFG = -1             ! Set color values for DAU:DAU_OBSERVACIONES
    SELF.Q.DAU:DAU_OBSERVACIONES_NormalBG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedFG = -1
    SELF.Q.DAU:DAU_OBSERVACIONES_SelectedBG = -1
  END


BRW5.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
  !CONDICION QUE EVALUA LA LÓGICA DE LOS BOTONES
  !SE MUESTRAN LOS BOTONES SEGUN EL ESTADO (P, A, V) Y EL MOTIVO DE AUSENCIA.
  IF RECORDS(BRW5.Q) > 0 THEN
      IF DAU:DAU_ESTADO = 'V' THEN !Validados
          IF DAU:DAU_MOTIVO = 'AC' OR DAU:DAU_MOTIVO = 'E' OR DAU:DAU_MOTIVO = 'AF' OR DAU:DAU_MOTIVO = 'M' OR DAU:DAU_MOTIVO = 'TL' THEN
              ENABLE(?Cancel)
              DISABLE(?Certificate)
              IF GLO:UserAccess = 1 THEN
                  ENABLE(?Change)
              ELSE
                  DISABLE(?Change)
              END
              ENABLE(?Concept)
              ENABLE(?Reporte)
              DISABLE(?Validate)
          ELSIF DAU:DAU_MOTIVO = 'CD' OR DAU:DAU_MOTIVO = 'CP' OR DAU:DAU_MOTIVO = 'C' OR DAU:DAU_MOTIVO = 'CA' OR DAU:DAU_MOTIVO = 'LS' OR DAU:DAU_MOTIVO = 'DV' OR DAU:DAU_MOTIVO = 'DS' OR DAU:DAU_MOTIVO = 'EX' OR DAU:DAU_MOTIVO = 'F' OR DAU:DAU_MOTIVO = 'G' OR DAU:DAU_MOTIVO = 'MA' OR DAU:DAU_MOTIVO = 'NA' OR DAU:DAU_MOTIVO = 'S' OR DAU:DAU_MOTIVO = 'RP' OR DAU:DAU_MOTIVO = 'VA' OR DAU:DAU_MOTIVO = 'A' OR DAU:DAU_MOTIVO = 'SA' THEN
              ENABLE(?Cancel)
              ENABLE(?Certificate)
              IF GLO:UserAccess = 1 THEN
                  ENABLE(?Change)
              ELSE
                  DISABLE(?Change)
              END
              DISABLE(?Concept)
              DISABLE(?Reporte)
              DISABLE(?Validate)
          ELSE
              ENABLE(?Cancel)
              DISABLE(?Certificate)
              IF GLO:UserAccess = 1 THEN
                  ENABLE(?Change)
              ELSE
                  DISABLE(?Change)
              END
              DISABLE(?Concept)
              DISABLE(?Reporte)
              DISABLE(?Validate)
          END
      ELSIF DAU:DAU_ESTADO = 'P' THEN !Pendientes
          IF DAU:DAU_MOTIVO = 'AC' OR DAU:DAU_MOTIVO = 'E' OR DAU:DAU_MOTIVO = 'AF' OR DAU:DAU_MOTIVO = 'M' OR DAU:DAU_MOTIVO = 'TL' THEN
              ENABLE(?Cancel) !Botón ANULAR
              DISABLE(?Certificate) !Botón CERTIFICADO
              ENABLE(?Change) !Botón MODIFICAR
              ENABLE(?Concept) !Botón CONCEPTO MÉDICO
              ENABLE(?Reporte) !Botón REPORTE Médico
              DISABLE(?Validate) !Botón VALIDAR
          ELSIF DAU:DAU_MOTIVO = 'CD' OR DAU:DAU_MOTIVO = 'CP' OR DAU:DAU_MOTIVO = 'C' OR DAU:DAU_MOTIVO = 'CA' OR DAU:DAU_MOTIVO = 'LS' OR DAU:DAU_MOTIVO = 'DV' OR DAU:DAU_MOTIVO = 'DS' OR DAU:DAU_MOTIVO = 'EX' OR DAU:DAU_MOTIVO = 'F' OR DAU:DAU_MOTIVO = 'G' OR DAU:DAU_MOTIVO = 'MA' OR DAU:DAU_MOTIVO = 'NA' OR DAU:DAU_MOTIVO = 'S' OR DAU:DAU_MOTIVO = 'RP' OR DAU:DAU_MOTIVO = 'VA' OR DAU:DAU_MOTIVO = 'A' OR DAU:DAU_MOTIVO = 'SA' THEN
              ENABLE(?Cancel)
              ENABLE(?Certificate)
              ENABLE(?Change)
              DISABLE(?Concept)
              DISABLE(?Reporte)
              DISABLE(?Validate)
          ELSE
              ENABLE(?Cancel)
              DISABLE(?Certificate)
              ENABLE(?Change)
              DISABLE(?Concept)
              DISABLE(?Reporte)
              ENABLE(?Validate)
          END
      ELSE !Anulados
          DISABLE(?Cancel) !Botón ANULAR
          DISABLE(?Certificate) !Botón CERTIFICADO
          ENABLE(?Change) !Botón MODIFICAR
          DISABLE(?Concept) !Botón CONCEPTO MÉDICO
          DISABLE(?Reporte) !Botón REPORTE Médico
          DISABLE(?Validate) !Botón VALIDAR
      END
  ELSE
      DISABLE(?Cancel)
      DISABLE(?Certificate)
      DISABLE(?Change)
      DISABLE(?Concept)
      DISABLE(?Reporte)
      DISABLE(?Validate)
  END

