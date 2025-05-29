

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER020.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER025.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER026.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('INFOPER027.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! </summary>
Main PROCEDURE 

f1                   DATE                                  !
f2                   DATE                                  !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
SQLOpenWindow       WINDOW('Inicializando conexión de datos...'),AT(,,208,26),CENTER,GRAY, |
                        FONT('MS Sans Serif',8,,FONT:regular),DOUBLE
                        STRING('Este proceso pude demorar unos segundos'),AT(31,12)
                        IMAGE('CONNECT.ICO'),AT(4,4,23,17),USE(?IMAGE1)
                        STRING('Realizando conexión y sincronizacion a base de datos'),AT(31,3)
                    END

AppFrame             APPLICATION(' Gestión Información de Interface y Anexos Sistema de Personal '),AT(,,510,360), |
  FONT('Microsoft Sans Serif',10),RESIZE,ALRT(F10Key),CENTER,ICON('personal.ico'),MAX,STATUS(-1, |
  60,300,50),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&Archivo'),USE(?FileMenu)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('Salir'),USE(?Exit),STD(STD:Close)
                         END
                         MENU('&Editar'),USE(?EditMenu)
                           ITEM('Cor&tar'),USE(?Cut),MSG('Remove item to Windows Clipboard'),STD(STD:Cut)
                           ITEM('&Copiar'),USE(?Copy),MSG('Copy item to Windows Clipboard'),STD(STD:Copy)
                           ITEM('&Pegar'),USE(?Paste),MSG('Paste contents of Windows Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Debitos Servicios'),USE(?BrowseMenu)
                           ITEM('Generar Debitos'),USE(?GenerarDebitosEmpleados)
                           ITEM('Imprimir Detalle Debitos '),USE(?MantenimientosImprimirDetalle)
                           ITEM,USE(?SEPARATOR2),SEPARATOR
                           ITEM('Mantenimiento Padron Debitos'),USE(?MantenimientosDEBITOEMPLEADOS)
                         END
                         MENU('Listados Varios'),USE(?ListadosVarios)
                           MENU('Listado de Personal'),USE(?ListadosVariosAlfabetico)
                             ITEM('Alfabetico'),USE(?ListadosVariosListadodePersonal)
                             ITEM('Legajo'),USE(?ListadosVariosAlfabeticoLegajo)
                           END
                           MENU('Mensualizados'),USE(?ListadosVariosMensualizados)
                             ITEM('Alfabetico'),USE(?ListadosVariosMensualizadosAlfabetico)
                             ITEM('Legajo'),USE(?ListadosVariosMensualizadosLegajo)
                           END
                           MENU('Jornalizados'),USE(?ListadosVariosJornalizados)
                             ITEM('Alfabetico'),USE(?ListadosVariosJornalizadosAlfabetico)
                             ITEM('Legajo'),USE(?ListadosVariosJornalizadosLegajo)
                           END
                           MENU('Recibos'),USE(?Recibos)
                             ITEM('Firma'),USE(?ITEM22)
                           END
                           ITEM('Personal - Suministro'),USE(?ListadosVariosPersonalSuministro)
                           ITEM('Tarifas EMPLEADOS'),USE(?ListadosVariosTarifasEMPLEADOS)
                           ITEM('Tarifas EMP s/debito'),USE(?ListadosVariosTarifasEMPsdebito)
                           ITEM('Cumpleaños EMPLEADOS'),USE(?ITEM18)
                         END
                         MENU('Licencias'),USE(?MENU1)
                           MENU('Empleados'),USE(?MENU3)
                             ITEM('Datos Empleados'),USE(?ITEM8)
                             ITEM('Editar Propiedades (Sector/4800/Horas Extras)'),USE(?ITEM1)
                           END
                           ITEM,USE(?SEPARATOR4),SEPARATOR
                           ITEM('Feriados'),USE(?ITEM13)
                           ITEM,USE(?SEPARATOR5),SEPARATOR
                           ITEM('Cuentas Contables'),USE(?ITEM15)
                           ITEM,USE(?SEPARATOR6),SEPARATOR
                           ITEM('Altas Masivas'),USE(?AltasMasivas)
                           ITEM('Altas, Bajas y Modificaciones'),USE(?ITEM2)
                           ITEM('Ingreso de Solicitud'),USE(?ITEM3)
                           ITEM,USE(?SEPARATOR3),SEPARATOR
                           MENU('Procesos'),USE(?Procesos)
                             MENU('Adelantos'),USE(?MENU4)
                               ITEM('Sueldo'),USE(?ITEM11)
                               ITEM('Licencia'),USE(?ITEM9)
                             END
                             ITEM('Provisión'),USE(?ITEM10)
                             ITEM('A Sueldo'),USE(?ITEM12)
                           END
                           MENU('Listados y Consultas'),USE(?MENU2)
                             ITEM('Por Año'),USE(?ITEM7),HIDE
                             ITEM('Por Fecha'),USE(?ITEM6),HIDE
                             ITEM('Por Sector'),USE(?ITEM4)
                             ITEM('Por Empleado'),USE(?ITEM5)
                           END
                           ITEM,USE(?SEPARATOR8),SEPARATOR
                           ITEM('Régimen Licencias Especiales'),USE(?ITEM21)
                         END
                         MENU('Horas Extras'),USE(?MENU5)
                           ITEM('Administrador Horas Extras'),USE(?ITEM14)
                         END
                         MENU('Ausencias'),USE(?MENU6)
                           MENU('Estados'),USE(?MENU8)
                             ITEM('Listar'),USE(?ITEM20)
                           END
                           ITEM,USE(?SEPARATOR7),SEPARATOR
                           MENU('Reportes'),USE(?MENU7)
                             ITEM('Por Empleado'),USE(?ITEM16)
                             ITEM('Por Sector'),USE(?ITEM17)
                             ITEM('Por Motivo'),USE(?ITEM19)
                           END
                         END
                         MENU('Recordatorios'),USE(?Recordatorios)
                           ITEM('Detalle'),USE(?Detalle_Recordatorios)
                         END
                       END
                       TOOLBAR,AT(0,0,510,23),USE(?Toolbar)
                         BUTTON,AT(2,1,20,20),USE(?Button14),ICON('kuser.ico'),MSG('Mantenimintos de empleados '),TIP('Mantenimie' & |
  'nto de de Empleados')
                         BUTTON('Debitos Servicios'),AT(37,1,67,10),USE(?Button15),FONT(,9),LEFT,ICON(ICON:NextPage), |
  MSG('Asignacion de Empleados - Suministro'),TIP('Asignacion de Empleados - Suministro')
                         BUTTON,AT(72,11,32,10),USE(?Button16),ICON(ICON:Print1),MSG('Imprimir Detalle'),TIP('Imprimir Detalle')
                         BUTTON,AT(488,1,20,20),USE(?Salir),ICON('exit.ico'),MSG(' '),STD(STD:Close),TIP('Salir')
                         BUTTON,AT(37,11,32,10),USE(?Button19),ICON(ICON:Thumbnail),MSG('Mantenimiento Lista Comrpobantes'), |
  TIP('Mantenimiento Lista Comrpobantes')
                         BUTTON('Licencia'),AT(119,1,60,20),USE(?BUTTON1),FONT(,,,FONT:regular),LEFT,ICON('calendario.ico')
                         BUTTON('Horas Extras'),AT(187,1,60,20),USE(?BUTTON2),LEFT,ICON('URL History (nonXP).ico')
                         BUTTON('Ausencia'),AT(255,1,60,20),USE(?Ausencia),FONT(,,,FONT:regular),LEFT,ICON('almanaque.ico')
                         BUTTON('Recordatorio'),AT(323,1,60,20),USE(?Recordatorio),FONT(,,,FONT:regular),LEFT,ICON('recordatorio.ico')
                         BUTTON,AT(466,1,20,20),USE(?Actualizar),ICON('Refresh.ico'),TIP('Sincronizar con Base Denarius')
                         BUTTON('Button3'),AT(406,7),USE(?BUTTON3)
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ACTUALIZAR_TABLA_EMPLEADOS ROUTINE
    open(Empleados)
    open(per)
    open(datpers)
    open(perdoc)
    open(empc)
    open(pertel)
    open(datadicn)
    if errorcode() then 
        MESSAGE('ATENCION: FALLO DE CONEXIÓN A BASE DE DATOS DENARIUS|LAS TABLAS DE REFERENCIA PUEDEN QUEDAR DESACTUALIZADAS|VERIFICAR CONFIGURACION ODBC "Denarius".','Sistema InfoPER',ICON:EXCLAMATION)
        MESSAGE(FILEERROR())        
    else    
        clear(per:record)
        set(per:per_emp,per:per_emp)
        LOOP
            next(per)
            if errorcode() then break.
            datpers:emp = per:emp
            datpers:nroleg = per:nroleg
            get(datpers,datpers:datpers_emp)
            if errorcode() then clear(datpers:record).
            DO CHK_REGISTRO_EMP
        END    
    end        
    !MESSAGE(records(per))            
    close(empleados)
    close(per)
    close(datpers)
    close(perdoc)
	close(empc)
    close(pertel)
    close(datadicn)
!CONSULTA VALOR DIA DE VACACIONES	
!select * from sue.empch where nroleg = 9562 and codigo = 9930
!order by substring(nroliq,4,4) desc, substring(nroliq,2,2) desc, substring(nroliq,1,1) desc	
CHK_REGISTRO_EMP    ROUTINE
    EPL:EMP_LEGAJO = per:nroleg
    GET(EMPLEADOS,EPL:PK_EMPLEADOS)
    IF ERRORCODE() THEN
        EPL:EMP_LEGAJO = per:nroleg
        EPL:EMP_NOMBRE = per:apynom
        EPL:EMP_DIRECCION = per:direc
        EPL:EMP_DESCUENTA_FACTURA = CHOOSE(per:activo,'S','N')
        EPL:EMP_ACTIVO = CHOOSE(per:activo,'S','N')
		EPL:EMP_MENSUAL = CHOOSE(per:relacion<>3,'S','N')
		EPL:EMP_CONVENIO = per:relacion
		EPL:EMP_CCOSTO = per:codccos
		EPL:EMP_SECTOR = 0
        EPL:EMP_LIC_CON_GOCE = 'S'
        EPL:EMP_EMAIL = datpers:email
        EPL:EMP_DNI = perdoc:nrodoc
		DO GET_9930
        DO GET_9931
        DO GET_TEL_EMP
        DO GET_CEL_EMP
        DO GET_FECANTIG
		EPL:EMP_UPDATE_DATE = TODAY()
		EPL:EMP_UPDATE_TIME = CLOCK()
        ADD(EMPLEADOS)
        IF ERRORCODE() THEN MESSAGE('NO SE PUDO AGREGAR NUEVO LEGAJO',EPL:EMP_LEGAJO).
    ELSE
        regrabar#=FALSE
        if EPL:EMP_NOMBRE <> per:apynom then EPL:EMP_NOMBRE = per:apynom ; regrabar# = true .
        if EPL:EMP_DIRECCION <> per:direc then EPL:EMP_DIRECCION = per:direc; regrabar# = true .
        if EPL:EMP_ACTIVO <> CHOOSE(per:activo,'S','N') then EPL:EMP_ACTIVO = CHOOSE(per:activo,'S','N'); regrabar# = true .
        if EPL:EMP_MENSUAL <> CHOOSE(per:relacion<>3,'S','N') then EPL:EMP_MENSUAL = CHOOSE(per:relacion<>3,'S','N'); regrabar# = true .    
!        IF EPL:EMP_FECANTIG <> format(datpers:fecant,@d012) then EPL:EMP_FECANTIG = format(datpers:fecant,@d012); regrabar# = true .     
        IF EPL:EMP_FECING <> format(datpers:fecant,@d012) then EPL:EMP_FECING = format(datpers:fecant,@d012); regrabar# = true .     
        IF EPL:EMP_FECNAC <> format(per:fecnac,@d012) then EPL:EMP_FECNAC = format(per:fecnac,@d012); regrabar# = true .     
        IF EPL:EMP_CONVENIO <> per:relacion then EPL:EMP_CONVENIO = per:relacion; regrabar# = true .  
        if EPL:EMP_CCOSTO <> per:codccos then EPL:EMP_CCOSTO = per:codccos ; regrabar# = true .
        IF EPL:EMP_EMAIL <> datpers:email THEN EPL:EMP_EMAIL = datpers:email ; regrabar# = TRUE .
        IF EPL:EMP_DNI <> perdoc:nrodoc THEN EPL:EMP_DNI = perdoc:nrodoc ; regrabar# = TRUE .
        
        !CHEQUEA SI CAMBIARON LOS VALORES DE VACACION Y PROVISION
		DO CHK_9930
        DO CHK_9931
        DO GET_TEL_EMP
        DO GET_CEL_EMP
        DO GET_FECANTIG
        
		if regrabar# then
			EPL:EMP_UPDATE_DATE = TODAY()
			EPL:EMP_UPDATE_TIME = CLOCK()
            PUT(EMPLEADOS)
            IF ERRORCODE() THEN MESSAGE('NO SE PUDO ACTUALIZAR LEGAJO EXISTENTE',EPL:EMP_LEGAJO).
        end
    END
GET_TEL_EMP         ROUTINE
    CLEAR(pertel:Record)
    pertel:emp = per:emp
    pertel:nroleg = per:nroleg
    pertel:codtel = 'Particular'
    get(pertel,pertel:pertel_emp)
    IF ERRORCODE() THEN
        EPL:EMP_TEL = pertel:codtel
        EPL:EMP_NRO_TEL = pertel:nrotel
    ELSE
        if EPL:EMP_TEL <> pertel:codtel then EPL:EMP_TEL = pertel:codtel; regrabar# = true .
        if EPL:EMP_NRO_TEL <> pertel:nrotel then EPL:EMP_NRO_TEL = pertel:nrotel; regrabar# = true .
    END
GET_CEL_EMP         ROUTINE
    CLEAR(pertel:Record)
    pertel:emp = per:emp
    pertel:nroleg = per:nroleg
    pertel:codtel = 'Celular'
    get(pertel,pertel:pertel_emp)
    IF ERRORCODE() THEN
        EPL:EMP_CEL = pertel:codtel
        EPL:EMP_NRO_CEL = pertel:nrotel
    ELSE
        if EPL:EMP_CEL <> pertel:codtel then EPL:EMP_CEL = pertel:codtel; regrabar# = true .
        if EPL:EMP_NRO_CEL <> pertel:nrotel then EPL:EMP_NRO_CEL = pertel:nrotel; regrabar# = true .
    END
GET_FECANTIG        ROUTINE
    CLEAR(datadicn:Record)
    CLEAR(adatadicn:Record)
    adatadicn:clave = '00100000'&format(EPL:EMP_LEGAJO, @S4)
    datadicn:clave = adatadicn:clave
    SET(adatadicn:datadicn_clave, adatadicn:datadicn_clave)
    f1 = 0
    f2 = 0
    LOOP UNTIL Access:adatadicn.Next() OR adatadicn:clave <> '00100000'&format(EPL:EMP_LEGAJO, @S4)
        f1 = adatadicn.fechmod
        IF f1 > f2 THEN
            f2 = f1
        END !IF
    END !LOOP
    datadicn.fechmod = f2

    get(datadicn,datadicn:datadicn_clavepk)
    IF ERRORCODE() THEN !Si no existe, agrego los datos - [66843 = 1984-01-01]
        EPL:EMP_FECANTIG = 66843 + datadicn:valor
    ELSE !Si existe, compruebo que no hayan cambiado
        if EPL:EMP_FECANTIG <> (66843 + datadicn:valor) then EPL:EMP_FECANTIG = (66843 + datadicn:valor); regrabar# = true .
    END
GET_9930    ROUTINE
		CLEAR(empc:record)
		mes# = MONTH(today())
	    emp:nroliq = '3' & FORMAT(mes#,@n02) & FORMAT(YEAR(TODAY()),@n4) 
		emp:nroleg = per:nroleg
		emp:codigo = '9930' 
		emp:ccosto = per:codccos 
		GET(empc,emp:empc_nroliq) 
		IF NOT ERRORCODE() THEN
			EPL:EMP_VACACION = emp:val 
			EPL:EMP_LIQUIDACION = emp:nroliq 
			!message('GET 9930 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
		ELSE 
			!--Pruebo con la liquidación siguiente
			IF mes# <> 12 THEN
				emp:nroliq = '3' & FORMAT(mes# + 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
			ELSE
				emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
			END		
			GET(empc,emp:empc_nroliq) 
			IF NOT ERRORCODE() THEN
				EPL:EMP_VACACION = emp:val 
				EPL:EMP_LIQUIDACION = emp:nroliq 
			ELSE  
				!--Pruebo con la liquidación anterior
				IF mes# <> 1 THEN
					emp:nroliq = '3' & FORMAT(mes# - 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
				ELSE
					emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
				END	
				GET(empc,emp:empc_nroliq)  
				IF NOT ERRORCODE() THEN
					EPL:EMP_VACACION = emp:val 
					EPL:EMP_LIQUIDACION = emp:nroliq 		
				END 	
			END		
			!message('ELSE GET 9930 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
		END		
GET_9931    ROUTINE
		CLEAR(empc:record)
		mes# = MONTH(today())
		emp:nroleg = per:nroleg
		emp:nroliq = '3' & FORMAT(mes#,@n02) & FORMAT(YEAR(TODAY()),@n4) 
		emp:codigo = '9931' 
		emp:ccosto = per:codccos 
		GET(empc,emp:empc_nroliq) 
		IF NOT ERRORCODE() THEN
			EPL:EMP_PROVISION = empc:val 
			EPL:EMP_LIQUIDACION = empc:nroliq 
			!message('GET 9931 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
		ELSE 
			!--Pruebo con la liquidación siguiente
			IF mes# <> 12 THEN
				emp:nroliq = '3' & FORMAT(mes# + 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
			ELSE
				emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
			END		
			GET(empc,emp:empc_nroliq) 
			IF NOT ERRORCODE() THEN
				EPL:EMP_PROVISION = emp:val 
				EPL:EMP_LIQUIDACION = emp:nroliq 
			ELSE  
				!--Pruebo con la liquidación anterior
				IF mes# <> 1 THEN
					emp:nroliq = '3' & FORMAT(mes# - 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
				ELSE
					emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
				END	
				GET(empc,emp:empc_nroliq)  
				IF NOT ERRORCODE() THEN
					EPL:EMP_PROVISION = emp:val 
					EPL:EMP_LIQUIDACION = emp:nroliq 		
				END 	
			END		
			!message('ELSE GET 9931 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
		END		
CHK_9930    ROUTINE
		CLEAR(empc:record)
		mes# = MONTH(today())
		emp:nroliq = '3' & FORMAT(mes#,@n02) & FORMAT(YEAR(TODAY()),@n4) 
		emp:nroleg = per:nroleg
		emp:codigo = '9930' 
		emp:ccosto = per:codccos 
		!MESSAGE('CHK_9930 LIQ ' & emp:nroliq & ' LEGAJO ' & emp:nroleg & ' CODIGO ' & emp:codigo & ' COSTO ' & emp:ccosto)
		GET(empc,emp:empc_nroliq) 
		!MESSAGE('ERRORCODE ' & ERRORCODE())
		IF NOT ERRORCODE() THEN
			IF EPL:EMP_VACACION <> emp:val THEN 
				EPL:EMP_VACACION = emp:val
				EPL:EMP_LIQUIDACION = emp:nroliq 
				regrabar# = true	
				!message('IF  CHK 9930 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
			END
		ELSE 
			!--Pruebo con la liquidación siguiente
			IF mes# <> 12 THEN
				emp:nroliq = '3' & FORMAT(mes# + 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
			ELSE
				emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
			END		
			GET(empc,emp:empc_nroliq) 
			IF NOT ERRORCODE() THEN
				IF EPL:EMP_VACACION <> emp:val THEN 
					EPL:EMP_VACACION = emp:val
					EPL:EMP_LIQUIDACION = emp:nroliq 
					regrabar# = true	
				END
			ELSE  
				!--Pruebo con la liquidación anterior
				IF mes# <> 1 THEN
					emp:nroliq = '3' & FORMAT(mes# - 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
				ELSE
					emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
				END	
				GET(empc,emp:empc_nroliq)  
				IF NOT ERRORCODE() THEN
					IF EPL:EMP_VACACION <> emp:val THEN 
						EPL:EMP_VACACION = emp:val
						EPL:EMP_LIQUIDACION = emp:nroliq 
						regrabar# = true	
					END
				END 	
			END			
			!message('ELSE  CHK 9930 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
		END 			
CHK_9931    ROUTINE
		CLEAR(emp:record)
		mes# = MONTH(today())
		emp:nroleg = per:nroleg
		emp:nroliq = '3' & FORMAT(mes#,@n02) & FORMAT(YEAR(TODAY()),@n4) 
		emp:codigo = '9931' 
		emp:ccosto = per:codccos 
		GET(empc,emp:empc_nroliq) 
		IF NOT ERRORCODE() THEN
			IF EPL:EMP_PROVISION <> emp:val THEN 
				EPL:EMP_PROVISION = emp:val
				EPL:EMP_LIQUIDACION = emp:nroliq 
				regrabar# = true	
			!	message('IF  CHK 9931 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
			END
		ELSE 
			!--Pruebo con la liquidación siguiente
			IF mes# <> 12 THEN
				emp:nroliq = '3' & FORMAT(mes# + 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
			ELSE
				emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
			END		
			GET(empc,emp:empc_nroliq) 
			IF NOT ERRORCODE() THEN
				IF EPL:EMP_PROVISION <> emp:val THEN 
					EPL:EMP_PROVISION = emp:val
					EPL:EMP_LIQUIDACION = emp:nroliq 
					regrabar# = true	
				END
			ELSE  
				!--Pruebo con la liquidación anterior
				IF mes# <> 1 THEN
					emp:nroliq = '3' & FORMAT(mes# - 1,@n02)& FORMAT(YEAR(TODAY()),@n4) 
				ELSE
					emp:nroliq = '3' & '01' & FORMAT(YEAR(TODAY()),@n4) 
				END	
				GET(empc,emp:empc_nroliq)  
				IF NOT ERRORCODE() THEN
					IF EPL:EMP_PROVISION <> emp:val THEN 
						EPL:EMP_PROVISION = emp:val
						EPL:EMP_LIQUIDACION = emp:nroliq 
						regrabar# = true	
					END
				END 	
			END			
			!message('ELSE  CHK 9931 legajo ' & per:nroleg & ' - ' & emp:val & ' - ' & emp:nroliq )
		END 			
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?GenerarDebitosEmpleados
    START(Mant_Debitos, 25000)
  OF ?MantenimientosImprimirDetalle
    START(ImpDetalle, 25000)
  OF ?MantenimientosDEBITOEMPLEADOS
    START(BrowseDEBITO_EMPLEADOS, 25000)
  END
Menu::ListadosVarios ROUTINE                               ! Code for menu items on ?ListadosVarios
  CASE ACCEPTED()
  OF ?ListadosVariosPersonalSuministro
    PSuministro()
  OF ?ListadosVariosTarifasEMPLEADOS
    TSuministro(0)
  OF ?ListadosVariosTarifasEMPsdebito
    TSuministro(1)
  OF ?ITEM18
    START(FechasCumpleaños, 25000)
  END
Menu::ListadosVariosAlfabetico ROUTINE                     ! Code for menu items on ?ListadosVariosAlfabetico
  CASE ACCEPTED()
  OF ?ListadosVariosListadodePersonal
    LPAlpha()
  OF ?ListadosVariosAlfabeticoLegajo
    LPLegajo()
  END
Menu::ListadosVariosMensualizados ROUTINE                  ! Code for menu items on ?ListadosVariosMensualizados
  CASE ACCEPTED()
  OF ?ListadosVariosMensualizadosAlfabetico
    LMAlpha()
  OF ?ListadosVariosMensualizadosLegajo
    LMLegajo()
  END
Menu::ListadosVariosJornalizados ROUTINE                   ! Code for menu items on ?ListadosVariosJornalizados
  CASE ACCEPTED()
  OF ?ListadosVariosJornalizadosAlfabetico
    LJAlpha()
  OF ?ListadosVariosJornalizadosLegajo
    LJLegajo()
  END
Menu::Recibos ROUTINE                                      ! Code for menu items on ?Recibos
  CASE ACCEPTED()
  OF ?ITEM22
    START(FirmaRecibos, 25000)
  END
Menu::MENU1 ROUTINE                                        ! Code for menu items on ?MENU1
  CASE ACCEPTED()
  OF ?ITEM13
    START(Feriados, 25000)
  OF ?ITEM15
    START(CuentasContables, 25000)
  OF ?AltasMasivas
    START(AltasMasivasLicencias, 25000)
  OF ?ITEM2
    START(ABMLicencias, 25000)
  OF ?ITEM3
    START(SolicitudLicencia, 25000)
  OF ?ITEM21
    START(LicenciasEspeciales, 25000)
  END
Menu::MENU3 ROUTINE                                        ! Code for menu items on ?MENU3
  CASE ACCEPTED()
  OF ?ITEM8
    START(ABMEmpleadosLicencia, 25000)
  OF ?ITEM1
    START(EmpleadosEdit, 25000)
    !!HACER LA LLAMADA
    !GlobalRequest = ChangeRecord
    !EditarEmpleados
    !    !message(GlobalResponse)
  END
Menu::Procesos ROUTINE                                     ! Code for menu items on ?Procesos
  CASE ACCEPTED()
  OF ?ITEM10
    START(ProcesarAsientoProvision, 25000)
  OF ?ITEM12
    START(Procesar_RetribucionesASueldo, 25000)
  END
Menu::MENU4 ROUTINE                                        ! Code for menu items on ?MENU4
  CASE ACCEPTED()
  OF ?ITEM11
    START(ProcesarAdelantoSueldo, 25000)
  OF ?ITEM9
    START(ProcesarAdelantoRetribucionLicencia, 25000)
  END
Menu::MENU2 ROUTINE                                        ! Code for menu items on ?MENU2
  CASE ACCEPTED()
  OF ?ITEM4
    START(LicenciaPorSector, 25000)
  OF ?ITEM5
    START(LicenciaPorEmpleado, 25000)
  END
Menu::MENU5 ROUTINE                                        ! Code for menu items on ?MENU5
  CASE ACCEPTED()
  OF ?ITEM14
    START(ProcesarHorasExtras, 25000)
  END
Menu::MENU6 ROUTINE                                        ! Code for menu items on ?MENU6
Menu::MENU8 ROUTINE                                        ! Code for menu items on ?MENU8
  CASE ACCEPTED()
  OF ?ITEM20
    START(ProcesarEstadosAusencias, 25000)
  END
Menu::MENU7 ROUTINE                                        ! Code for menu items on ?MENU7
  CASE ACCEPTED()
  OF ?ITEM16
    START(AusenciaPorEmpleado, 25000)
  OF ?ITEM17
    START(AusenciaPorSector, 25000)
  OF ?ITEM19
    START(AusenciaPorMotivo, 25000)
  END
Menu::Recordatorios ROUTINE                                ! Code for menu items on ?Recordatorios
  CASE ACCEPTED()
  OF ?Detalle_Recordatorios
    IF GLO:oneInstance_RecordatoriosDetalles_thread = 0      		
       GLO:oneInstance_RecordatoriosDetalles_thread = START(RecordatoriosDetalles, 25000)
    ELSE      		
       NOTIFY(EVENT:GainFocus, GLO:oneInstance_RecordatoriosDetalles_thread)      		
    END      		
  END
!--------------------------------------
WindowControlSecurity ROUTINE
  IF NOT Security.CheckAccess(eD_Administradores, SSEC::Override:Never)
    DISABLE(?Recibos)
  END!IF
  IF NOT Security.CheckAccess(eD_Administradores, SSEC::Override:Never)
    DISABLE(?AltasMasivas)
  END!IF
  IF NOT Security.CheckAccess(eD_Administradores, SSEC::Override:Never)
    DISABLE(?Procesos)
  END!IF

ThisWindow.Ask PROCEDURE

  CODE
  DO WindowControlSecurity
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sábado'
  END
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  
  AppFrame{Prop:StatusText,1} = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' & CLIP(Mes") & ' de ' & format(year(today()),@n04)  
   
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  Security.LoadQs
  IF NOT Security.Logon()
    RETURN Level:Fatal
  END!IF
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  Blobs::Name     = ExtractFilePath(Command(0)) & 'BLOBS.TPS'
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  !SETCURSOR(Cursor:Wait)
  !OPEN(SQLOpenWindow)
  !ACCEPT
  !  IF EVENT() = Event:OpenWindow
  !DO ACTUALIZAR_TABLA_EMPLEADOS
      
  Relate:adatadicn.Open                                    ! File adatadicn used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  !    POST(EVENT:CloseWindow)
  !  END
  !END
  !CLOSE(SQLOpenWindow)
  !SETCURSOR()
  SELF.Open(AppFrame)                                      ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  ds_SetApplicationWindow(AppFrame)
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:adatadicn.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF AppFrame{Prop:AcceptAll} THEN RETURN.
  PARENT.Reset(Force)
  DO WindowControlSecurity


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
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
      DO Menu::ListadosVarios                              ! Process menu items on ?ListadosVarios menu
      DO Menu::ListadosVariosAlfabetico                    ! Process menu items on ?ListadosVariosAlfabetico menu
      DO Menu::ListadosVariosMensualizados                 ! Process menu items on ?ListadosVariosMensualizados menu
      DO Menu::ListadosVariosJornalizados                  ! Process menu items on ?ListadosVariosJornalizados menu
      DO Menu::Recibos                                     ! Process menu items on ?Recibos menu
      DO Menu::MENU1                                       ! Process menu items on ?MENU1 menu
      DO Menu::MENU3                                       ! Process menu items on ?MENU3 menu
      DO Menu::Procesos                                    ! Process menu items on ?Procesos menu
      DO Menu::MENU4                                       ! Process menu items on ?MENU4 menu
      DO Menu::MENU2                                       ! Process menu items on ?MENU2 menu
      DO Menu::MENU5                                       ! Process menu items on ?MENU5 menu
      DO Menu::MENU6                                       ! Process menu items on ?MENU6 menu
      DO Menu::MENU8                                       ! Process menu items on ?MENU8 menu
      DO Menu::MENU7                                       ! Process menu items on ?MENU7 menu
      DO Menu::Recordatorios                               ! Process menu items on ?Recordatorios menu
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button14
      START(BrowseEMPLEADOS, 25000)
    OF ?Button15
      START(BrowseDEBITO_EMPLEADOS, 25000)
    OF ?Button16
      START(ImpDetalle, 25000)
    OF ?Button19
      START(Mant_Debitos, 25000)
    OF ?BUTTON1
      START(SolicitudLicencia, 25000)
    OF ?BUTTON2
      START(ProcesarHorasExtras, 25000)
    OF ?Ausencia
      IF GLO:oneInstance_SolicitudAusencia_thread = 0      		
         GLO:oneInstance_SolicitudAusencia_thread = START(SolicitudAusencia, 25000)
      ELSE      		
         NOTIFY(EVENT:GainFocus, GLO:oneInstance_SolicitudAusencia_thread)      		
      END      		
    OF ?Recordatorio
      IF GLO:oneInstance_RecordatoriosDetalles_thread = 0      		
         GLO:oneInstance_RecordatoriosDetalles_thread = START(RecordatoriosDetalles, 25000)
      ELSE      		
         NOTIFY(EVENT:GainFocus, GLO:oneInstance_RecordatoriosDetalles_thread)      		
      END      		
    OF ?Actualizar
      SETCURSOR(Cursor:Wait)
      OPEN(SQLOpenWindow)
      ACCEPT
        IF EVENT() = Event:OpenWindow
      	DO ACTUALIZAR_TABLA_EMPLEADOS
          POST(EVENT:CloseWindow)
        END
      END
      CLOSE(SQLOpenWindow)
      AppFrame{Prop:StatusText,3} = 'Última actualización con Base DENARIUS: ' & FORMAT(TODAY(),@D06B) & ' a las ' & FORMAT(CLOCK(), @T01B) & ' por ' & Glo:Usuario2
      SETCURSOR()
    OF ?BUTTON3
      START(DocEmp, 25000)
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
  CASE EVENT()
      OF EVENT:AlertKey     !Alert processing
  !        MESSAGE('F10Key')
          SETCURSOR(Cursor:Wait)
          OPEN(SQLOpenWindow)
          ACCEPT
            IF EVENT() = Event:OpenWindow
              DO ACTUALIZAR_TABLA_EMPLEADOS
              POST(EVENT:CloseWindow)
            END
          END
          CLOSE(SQLOpenWindow)
          AppFrame{Prop:StatusText,3} = 'Última actualización con Base DENARIUS: ' & FORMAT(TODAY(),@D06B) & ' a las ' & FORMAT(CLOCK(), @T01B) & ' por ' & Glo:Usuario2
          SETCURSOR()
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

