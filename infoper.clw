   PROGRAM


    include('QuickPDFLite.inc'),once
WINEVENT:Version              equate ('3.99')   !Deprecated
WinEvent:TemplateVersion      equate('3.99')
event:WinEventTaskbarLoadIcon equate(0500h+5510)

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('MYDOORS.CLW'),ONCE
   INCLUDE('STABSEC.INC'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
_IMAGEEXEXTERNAL_	EQUATE(0)
_IMAGEEXDLLMODE_  EQUATE(0)
   INCLUDE('IMAGEEX.INC'), ONCE
   Include('EventEqu.Clw'),Once

   MAP
     MODULE('INFOPER_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('INFOPER001.CLW')
Main                   PROCEDURE   !
     END
     MODULE('INFOPER021.CLW')
SSEC::Logon            PROCEDURE(<LONG p_Override>,*Security p_Security,BYTE p_ChangePassword,BYTE p_MaskUserName,BYTE p_Backdoor,STRING p_BackdoorUsername,BYTE p_AutoFillUsername,BYTE p_AuditLogon,BYTE p_AuditBackdoor,BYTE p_AuditLogonFailures,BYTE p_MaxLogonTries)   !
     END
     MODULE('INFOPER024.CLW')
wndBrightness          PROCEDURE(imageexBitmapClass Src, ImageexBitmapClass Dst,Byte,Byte,Byte)   !
wndScanning            PROCEDURE   !
     END
     MODULE('INFOPER026.CLW')
MotivoAnulacion        PROCEDURE   !Window
     END
     MODULE('INFOPER027.CLW')
wndViewImage           PROCEDURE(ImageExBitmapClass, string)   !
ExtractFileExt         FUNCTION(STRING Filename), STRING   !
SaveImage              FUNCTION(ImageExBitmapClass Bmp, BOOL ShowOptions=false, <string>), BOOL, PROC   !
PrintCert              PROCEDURE(ImageExBitmapClass ,string)   !Report the SQLBLOB File
     END
     MODULE('API')
         _hwrite(LONG,LONG,long),long,PASCAL,RAW
         _lcreat(*CSTRING,SIGNED),LONG,PASCAL,RAW
         _lclose(LONG),LONG,PASCAL
         _lopen(*CSTRING,SIGNED),LONG,PASCAL,RAW
         _lwrite(LONG,*GROUP,UNSIGNED),UNSIGNED,PASCAL,RAW
         _llseek(LONG, LONG, SIGNED),LONG,PASCAL
         ShellExecute(Long,*CSTRING,*CSTRING,*CSTRING,*CSTRING,Long),Long, |
         PASCAL,RAW,NAME('ShellExecuteA')
     END
     MODULE('Clarion runtime library')
         FnSplit(*cstring,*cstring,*cstring,*cstring,*cstring),short,raw,name('_fnsplit')
         Access(*cstring,signed),signed,raw,name('_access'), PROC
     END
     include('eventmap.clw')
       MODULE('claevo.Dll')
       Exportar(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP)
       ExportarVII(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP,*QUEUE)
       END
       MODULE('claevo.Dll')
       EcRptExport(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP)
       ExportarRptII(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP,*QUEUE)
       PDP(*QUEUE,Long)
       END
   END

GLO:GEA_PICO_GEACORPICO_CNX STRING('GEA_PICO,GeaCorpico,sa {28}')
GLO:GEA_PICO_PERSONAL_CNX STRING('GEA_PICO,Interfaz,sa {30}')
GLO:ODBC_DENARIUS_CNX STRING('GEA_PICO,Interfaz,sa {30}')
GLO:LicenseKey       STRING(30)
Glo:Filename         CSTRING(256)
Blobs::name          STRING(255)
Glo:diaLetra         STRING(20)
GLO:Obs_Anulacion    STRING(255)
GLO:UserAccess       BYTE
glo:certificado      &BLOB
GLO:REEMBOLSO_ERP    STRING(50)
GLO:HORASEXTRA_ERP   STRING(50)
Glo:idCabeceraHE     SHORT
Glo:HorasExtrasCVS   STRING(100)
glo:CertificadoAusencia &CSTRING
Glo:TxtAsiento       STRING(60)
GLO:NOMBRE_ERP       STRING(60)
SSEC::DefaultMaxPwdAge LONG
ImportHE             STRING(4000)
GLO:THREAD           LONG
glo:Ano              STRING(4)
glo:periodo          STRING(20)
Glo:Mensual          STRING(1)
Glo:Usuario          LONG
Glo:Usuario2         STRING(20)
glo:empresa          BYTE
glo:fecha            DATE
glo:nom_txdeb        STRING(50)
glo:servicio         LONG(1)
GLO:oneInstance_FormRECORDATORIO_thread LONG(0)
GLO:oneInstance_FormSolicitudAusencia_thread LONG(0)
GLO:oneInstance_RecordatoriosDetalles_thread LONG(0)
GLO:oneInstance_SolicitudAusencia_thread LONG(0)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
CLIENTE              FILE,DRIVER('MSSQL','/LOGONSCREEN=False /TRUSTEDCONNECTION=True'),OWNER(GLO:GEA_PICO_GEACORPICO_CNX),NAME('CLIENTE'),PRE(CLI),BINDABLE,THREAD !                    
PK_CLIENTE               KEY(CLI:CLI_EMPRESA,CLI:CLI_ID),NOCASE,PRIMARY !                    
IX_CLIENTE1              KEY(CLI:CLI_TITULAR),DUP,NOCASE   !                    
PKCLIENTE_BUSSUM         KEY(CLI:CLI_TITULAR,CLI:CLI_EMPRESA,CLI:CLI_ID),DUP,NOCASE !                    
Record                   RECORD,PRE()
CLI_EMPRESA                 SHORT                          !                    
CLI_ID                      LONG                           !                    
CLI_FECHA_INGRESO           STRING(8)                      !                    
CLI_FECHA_INGRESO_GROUP     GROUP,OVER(CLI_FECHA_INGRESO)  !                    
CLI_FECHA_INGRESO_DATE        DATE                         !                    
CLI_FECHA_INGRESO_TIME        TIME                         !                    
                            END                            !                    
CLI_TITULAR                 CSTRING(36)                    !                    
CLI_LOCALIDAD_RESIDENCIA    LONG                           !                    
CLI_CODIGO_POSTAL_RESIDENCIA CSTRING(16)                   !                    
CLI_CALLE_RESIDENCIA        CSTRING(46)                    !                    
CLI_ALTURA_RESIDENCIA       LONG                           !                    
CLI_PISO_RESIDENCIA         CSTRING(11)                    !                    
CLI_DEPARTAMENTO_RESIDENCIA CSTRING(4)                     !                    
CLI_TELEFONO_RESIDENCIA     CSTRING(21)                    !                    
CLI_TELEFONO_CELULAR        CSTRING(21)                    !                    
CLI_FAX                     CSTRING(21)                    !                    
CLI_E_MAIL                  CSTRING(41)                    !                    
CLI_LOCALIDAD_LABORAL       LONG                           !                    
CLI_CODIGO_POSTAL_LABORAL   CSTRING(16)                    !                    
CLI_CALLE_LABORAL           CSTRING(46)                    !                    
CLI_ALTURA_LABORAL          LONG                           !                    
CLI_PISO_LABORAL            CSTRING(4)                     !                    
CLI_DEPARTAMENTO_LABORAL    CSTRING(4)                     !                    
CLI_ANEXO                   CSTRING(31)                    !                    
CLI_TELEFONO_LABORAL        CSTRING(21)                    !                    
CLI_SITUACION_IVA           LONG                           !                    
CLI_CUIT                    CSTRING(12)                    !                    
CLI_SITUACION_IIBB          LONG                           !                    
CLI_NUMERO_IIBB             CSTRING(21)                    !                    
CLI_EXENCION_PERCEPCION_IVA REAL                           !                    
CLI_EXENCION_NACIONAL       REAL                           !                    
CLI_EXENCION_PROVINCIAL     REAL                           !                    
CLI_EXENCION_MUNICIPAL      REAL                           !                    
CLI_POTENCIAL               STRING(1)                      !                    
CLI_CLASIFICACION           SHORT                          !                    
CLI_ESTADO_CIVIL            SHORT                          !                    
CLI_PROFESION               SHORT                          !                    
CLI_FECHA_NACIMIENTO        STRING(8)                      !                    
CLI_FECHA_NACIMIENTO_GROUP  GROUP,OVER(CLI_FECHA_NACIMIENTO) !                    
CLI_FECHA_NACIMIENTO_DATE     DATE                         !                    
CLI_FECHA_NACIMIENTO_TIME     TIME                         !                    
                            END                            !                    
CLI_NACIONALIDAD            CSTRING(26)                    !                    
CLI_LUGAR_NACIMIENTO        CSTRING(51)                    !                    
CLI_SEXO                    STRING(1)                      !                    
CLI_ESTADO                  LONG                           !                    
CLI_CLAVE_PERSONAL          CSTRING(11)                    !                    
CLI_ID_USER                 STRING(20)                     !                    
CLI_FECHA_UPDATE            STRING(8)                      !                    
CLI_FECHA_UPDATE_GROUP      GROUP,OVER(CLI_FECHA_UPDATE)   !                    
CLI_FECHA_UPDATE_DATE         DATE                         !                    
CLI_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
CLI_LOTE_REPLICACION        LONG                           !                    
                         END
                     END                       

SUMINISTRO           FILE,DRIVER('MSSQL','/LOGONSCREEN=False /TRUSTEDCONNECTION=True'),OWNER(GLO:GEA_PICO_GEACORPICO_CNX),NAME('dbo.SUMINISTRO'),PRE(SUM),BINDABLE,THREAD !                    
PK_SUMINISTRO            KEY(SUM:SUM_EMPRESA,SUM:SUM_CLIENTE,SUM:SUM_ID),NOCASE,PRIMARY !                    
IX_SUMINISTRO_DOMICILIO  KEY(SUM:SUM_LOCALIDAD,SUM:SUM_CALLE,SUM:SUM_ALTURA),DUP,NOCASE !                    
IX_SUMIMISTRO_DIRECCION_POSTAL KEY(SUM:SUM_EMPRESA,SUM:SUM_CLIENTE,SUM:SUM_ID,SUM:SUM_DIRECCION_POSTAL),DUP,NOCASE !                    
IX_SUMINISTRO_BUSQUEDA_SUMINISTRO KEY(SUM:SUM_EMPRESA,SUM:SUM_CLIENTE,SUM:SUM_SUCURSAL,SUM:SUM_LOCALIDAD,SUM:SUM_ID,SUM:SUM_CALLE,SUM:SUM_ALTURA,SUM:SUM_PISO,SUM:SUM_DEPARTAMENTO),DUP,NOCASE !                    
Record                   RECORD,PRE()
SUM_EMPRESA                 SHORT                          !                    
SUM_CLIENTE                 LONG                           !                    
SUM_ID                      SHORT                          !                    
SUM_SUCURSAL                LONG                           !                    
SUM_GRUPO                   LONG                           !                    
SUM_RUTA                    LONG                           !                    
SUM_ORDEN_LECTURA           LONG                           !                    
SUM_LOCALIDAD               SHORT                          !                    
SUM_CODIGO_POSTAL           CSTRING(16)                    !                    
SUM_CALLE                   STRING(45)                     !                    
SUM_ALTURA                  LONG                           !                    
SUM_PISO                    CSTRING(11)                    !                    
SUM_DEPARTAMENTO            CSTRING(4)                     !                    
SUM_CALLE_ENTRE1            CSTRING(46)                    !                    
SUM_CALLE_ENTRE2            CSTRING(46)                    !                    
SUM_ANEXO                   CSTRING(31)                    !                    
SUM_REFERENCIA_MUNICIPAL    CSTRING(16)                    !                    
SUM_CIRCUNSCRIPCION         CSTRING(9)                     !                    
SUM_RADIO                   CSTRING(9)                     !                    
SUM_MANZANA                 CSTRING(9)                     !                    
SUM_QUINTA                  CSTRING(9)                     !                    
SUM_PARCELA                 CSTRING(9)                     !                    
SUM_SUBPARCELA              CSTRING(9)                     !                    
SUM_INQUILINO               STRING(1)                      !                    
SUM_FECHA_VTO_ALQUILER      STRING(8)                      !                    
SUM_FECHA_VTO_ALQUILER_GROUP GROUP,OVER(SUM_FECHA_VTO_ALQUILER) !                    
SUM_FECHA_VTO_ALQUILER_DATE   DATE                         !                    
SUM_FECHA_VTO_ALQUILER_TIME   TIME                         !                    
                            END                            !                    
SUM_CIIU                    LONG                           !                    
SUM_DIRECCION_POSTAL        STRING(1)                      !                    
SUM_GARANTE                 STRING(1)                      !                    
SUM_MOROSIDAD               STRING(1)                      !                    
SUM_FACTURABLE              STRING(1)                      !                    
SUM_ESTADO_ADM              BYTE                           !                    
SUM_FECHA_ESTADO_ADM        STRING(8)                      !                    
SUM_FECHA_ESTADO_ADM_GROUP  GROUP,OVER(SUM_FECHA_ESTADO_ADM) !                    
SUM_FECHA_ESTADO_ADM_DATE     DATE                         !                    
SUM_FECHA_ESTADO_ADM_TIME     TIME                         !                    
                            END                            !                    
SUM_FECHA_CAMBIO_TITULARIDAD STRING(8)                     !                    
SUM_FECHA_CAMBIO_TITULARIDAD_GROUP GROUP,OVER(SUM_FECHA_CAMBIO_TITULARIDAD) !                    
SUM_FECHA_CAMBIO_TITULARIDAD_DATE DATE                     !                    
SUM_FECHA_CAMBIO_TITULARIDAD_TIME TIME                     !                    
                            END                            !                    
SUM_TIENE_CONCEPTOS_PUNTUALES STRING(1)                    !                    
SUM_VALIDA_PUNTUAL          CSTRING(2)                     !                    
SUM_SUMINISTRO_ANTERIOR1    CSTRING(9)                     !                    
SUM_SUMINISTRO_ANTERIOR2    CSTRING(9)                     !                    
SUM_SUMINISTRO_ANTERIOR3    CSTRING(9)                     !                    
SUM_SUMINISTRO_ANTERIOR4    CSTRING(13)                    !                    
SUM_ID_USER                 STRING(20)                     !                    
SUM_FECHA_UPDATE            STRING(8)                      !                    
SUM_FECHA_UPDATE_GROUP      GROUP,OVER(SUM_FECHA_UPDATE)   !                    
SUM_FECHA_UPDATE_DATE         DATE                         !                    
SUM_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
SUM_LOTE_REPLICACION        LONG                           !                    
                         END
                     END                       

EMPLEADOS            FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.EMPLEADOS'),PRE(EPL),BINDABLE,CREATE,THREAD !                    
FK_CONVENIO              KEY(EPL:EMP_CONVENIO),NOCASE      !                    
FK_SECTOR                KEY(EPL:EMP_SECTOR),DUP,NOCASE    !                    
PK_EMPLEADOS             KEY(EPL:EMP_LEGAJO),PRIMARY       !                    
PK_Nombre                KEY(EPL:EMP_NOMBRE),DUP,NAME('PK_Nombre') !                    
PK_Direccion             KEY(EPL:EMP_DIRECCION),DUP,NAME('PK_Direccion') !                    
EMP_FOTO                    BLOB,BINARY,NAME('"EMP_FOTO"') !                    
Record                   RECORD,PRE()
EMP_LEGAJO                  SHORT                          !                    
EMP_NOMBRE                  STRING(50)                     !                    
EMP_DIRECCION               CSTRING(26)                    !                    
EMP_TEL                     CSTRING(11)                    !                    
EMP_NRO_TEL                 CSTRING(15)                    !                    
EMP_CEL                     CSTRING(11)                    !                    
EMP_NRO_CEL                 CSTRING(16)                    !                    
EMP_EMAIL                   STRING(50)                     !                    
EMP_DESCUENTA_FACTURA       CSTRING(2)                     !                    
EMP_ACTIVO                  CSTRING(2)                     !                    
EMP_MENSUAL                 STRING(1)                      !                    
EMP_FECING                  STRING(@D012)                  !                    
EMP_FECANTIG                STRING(@D012)                  !                    
EMP_FECNAC                  STRING(@D012)                  !                    
EMP_CONVENIO                SHORT                          !                    
EMP_SECTOR                  SHORT                          !                    
EMP_VACACION                DECIMAL(19,4)                  !                    
EMP_PROVISION               DECIMAL(19,4)                  !                    
EMP_LIQUIDACION             STRING(9)                      !                    
EMP_CCOSTO                  SHORT                          !                    
EMP_UPDATE                  STRING(8),NAME('"EMP_UPDATE"') !                    
EMP_UPDATE_GROUP            GROUP,OVER(EMP_UPDATE)         !                    
EMP_UPDATE_DATE               DATE                         !                    
EMP_UPDATE_TIME               TIME                         !                    
                            END                            !                    
EMP_LIC_CON_GOCE            STRING(1)                      !                    
EMP_HORAEXTRA               STRING(3)                      !                    
EMP_OBSERVACION             STRING(50)                     !                    
EMP_COD_REEMBOLSO           SHORT                          !                    
EMP_DNI                     CSTRING(11)                    !                    
                         END
                     END                       

Empleado_Comprobante FILE,DRIVER('MSSQL','/LOGONSCREEN=False /TRUSTEDCONNECTION=True'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.Empleado_Comprobante'),PRE(Ecp),BINDABLE,CREATE,THREAD !                    
PK_Empleado_Comprobante  KEY(Ecp:anio,Ecp:periodo,Ecp:codempresa,Ecp:Legajo,Ecp:Cliente,Ecp:Suministro,Ecp:Tipo,Ecp:Numero),NAME('PK_Empleado_Comprobante'),PRIMARY !                    
IX_Empleado_Comprobante  KEY(Ecp:Empleado),DUP,NAME('IX_Empleado_Comprobante') !                    
IX_Empleado_Comprobante_1 KEY(Ecp:Legajo),DUP,NAME('IX_Empleado_Comprobante_1') !                    
Record                   RECORD,PRE()
anio                        SHORT                          !                    
periodo                     BYTE                           !                    
codempresa                  BYTE                           !                    
Legajo                      SHORT                          !                    
Empleado                    CSTRING(32)                    !                    
Cliente                     LONG                           !                    
Suministro                  LONG                           !                    
Tipo                        BYTE                           !                    
Numero                      STRING(20)                     !                    
Importe                     DECIMAL(19,4)                  !                    
Condicion                   STRING(1)                      !                    
fechavto                    STRING(8)                      !                    
rfechavto                   GROUP,OVER(fechavto)           !                    
fechavto_date                 DATE                         !                    
fechavto_time                 TIME                         !                    
                            END                            !                    
                         END
                     END                       

TMPUsosMultiples     FILE,DRIVER('MSSQL','/LOGONSCREEN=False /TRUSTEDCONNECTION=True'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.TMPUsosMultiples'),PRE(TUM),BINDABLE,CREATE,THREAD !                    
PK_TMPUsosMultiples      KEY(TUM:Col01,TUM:Col02,TUM:Col03),NOCASE,OPT,PRIMARY !                    
Record                   RECORD,PRE()
Col01                       CSTRING(101)                   !                    
Col02                       CSTRING(51)                    !                    
Col03                       CSTRING(51)                    !                    
Col04                       CSTRING(51)                    !                    
Col05                       CSTRING(51)                    !                    
Col06                       CSTRING(51)                    !                    
Col07                       CSTRING(51)                    !                    
Col08                       CSTRING(51)                    !                    
Col09                       CSTRING(51)                    !                    
Col10                       CSTRING(51)                    !                    
Col11                       CSTRING(51)                    !                    
Col12                       CSTRING(51)                    !                    
Col13                       CSTRING(51)                    !                    
Col14                       CSTRING(51)                    !                    
Col15                       CSTRING(51)                    !                    
Col16                       CSTRING(51)                    !                    
Col17                       CSTRING(51)                    !                    
Col18                       CSTRING(51)                    !                    
Col19                       CSTRING(51)                    !                    
Col20                       CSTRING(51)                    !                    
Col21                       CSTRING(51)                    !                    
Col22                       CSTRING(51)                    !                    
Col23                       CSTRING(51)                    !                    
Col24                       CSTRING(51)                    !                    
Col25                       CSTRING(51)                    !                    
Col26                       CSTRING(51)                    !                    
Col27                       CSTRING(51)                    !                    
Col28                       CSTRING(51)                    !                    
Col29                       CSTRING(51)                    !                    
Col30                       CSTRING(51)                    !                    
                         END
                     END                       

TXDEB                FILE,DRIVER('ASCII'),NAME(glo:nom_txdeb),PRE(TXD),BINDABLE,CREATE,THREAD !                    
Record                   RECORD,PRE()
EMPRESA                     STRING(@n03)                   !                    
filler1                     STRING(1)                      !                    
CLIENTE                     STRING(@n09)                   !                    
filler2                     STRING(1)                      !                    
SUMIN                       STRING(@n03)                   !                    
filler3                     STRING(1)                      !                    
ANIO                        STRING(@n04)                   !                    
filler4                     STRING(1)                      !                    
MES                         STRING(@n02)                   !                    
filler5                     STRING(1)                      !                    
FECHAVTO                    STRING(8)                      !                    
filler6                     STRING(1)                      !                    
IMPORTE                     STRING(@n013v2)                !                    
filler7                     STRING(1)                      !                    
FECHAPAG                    STRING(8)                      !                    
filler8                     STRING(1)                      !                    
ULTIMO                      STRING(1)                      !                    
filler9                     STRING(1)                      !                    
                         END
                     END                       

DESFAC               FILE,DRIVER('MEMORY'),NAME('G:\PERS\DESFAC.DAT'),PRE(DES),CREATE,BINDABLE,THREAD !facturas a descontar de sueldos
KEY_DESFAC               KEY(DES:PERIODO,DES:LEGAJO,DES:SERVICIO),NOCASE,OPT !                    
Record                   RECORD,PRE()
PERIODO                     STRING(@N06)                   !                    
LEGAJO                      STRING(@N04)                   !                    
SERVICIO                    STRING(@N01)                   !                    
IMPORTE                     STRING(@N010v2)                !                    
                         END
                     END                       

DEBITO_EMPLEADOS     FILE,DRIVER('MSSQL','/LOGONSCREEN=False /TRUSTEDCONNECTION=True'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.DEBITO_EMPLEADOS'),PRE(DEB),BINDABLE,CREATE,THREAD !                    
PK_DEBITO_EMPLEADOS      KEY(DEB:DEB_LEGAJO,DEB:DEB_EMPRESA,DEB:DEB_CLIENTE,DEB:DEB_SUMINISTRO,DEB:DEB_SERVICIO),PRIMARY !                    
Pk_Cliente               KEY(DEB:DEB_EMPRESA,DEB:DEB_CLIENTE,DEB:DEB_SUMINISTRO),DUP,NAME('Pk_Cliente') !                    
pk_Legajo                KEY(DEB:DEB_LEGAJO),DUP,NAME('pk_Legajo') !                    
Record                   RECORD,PRE()
DEB_LEGAJO                  LONG                           !                    
DEB_EMPRESA                 LONG                           !                    
DEB_CLIENTE                 LONG                           !                    
DEB_SUMINISTRO              LONG                           !                    
DEB_SERVICIO                LONG                           !                    
                         END
                     END                       

COMPROBANTE          FILE,DRIVER('MSSQL','/LOGONSCREEN=False /TRUSTEDCONNECTION=True'),OWNER(GLO:GEA_PICO_GEACORPICO_CNX),NAME('COMPROBANTE'),PRE(CDE),BINDABLE,THREAD !                    
PK_COMPROBANTE_DEBITO    KEY(CDE:CDE_EMPRESA,CDE:CDE_TIPO,CDE:CDE_NUMERO),NOCASE,PRIMARY !                    
FK_COMPROBANTE_SUMINISTRO KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO),DUP,NOCASE !                    
IX_COMPROBANTE_IMPRESION KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_ANO,CDE:CDE_PERIODO),DUP,NOCASE !                    
IX_SINCRONIZACION        KEY(CDE:CDE_NUMERO),DUP,NOCASE    !                    
comprobante0             KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_CLASE_COMPROBANTE,CDE:CDE_FECHA_1VTO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NAME('comprobante0'),NOCASE !                    
IX_IMPRESION_COMPROBANTE KEY(CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
COMPROBANTE_IMPRESION_FACTURA2 KEY(CDE:CDE_TIPO,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
IX_COMPROBANTE_NCR_PEND  KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
IX_ASIENTO_FACTURACION_FECHAS KEY(CDE:CDE_NUMERO,CDE:CDE_EMPRESA,CDE:CDE_TIPO,CDE:CDE_FECHA_EMISION),DUP,NOCASE !                    
PK_COMPROBANTE_COBRANZA_BANCO KEY(CDE:CDE_EMPRESA,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
IDX_COMPROBANTE_DEUDA    KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_ANO,CDE:CDE_PERIODO,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_FECHA_EMISION,CDE:CDE_FECHA_1VTO,CDE:CDE_FECHA_2VTO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
IDX_COMPROBANTE_00       KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_TIPO,CDE:CDE_CLASE_COMPROBANTE,CDE:CDE_FECHA_1VTO,CDE:CDE_FECHA_2VTO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
IDX_COMPROBANTE_000      KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_CLASE_COMPROBANTE,CDE:CDE_FECHA_1VTO,CDE:CDE_FECHA_2VTO,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
pkcomprobante1           KEY(CDE:CDE_EMPRESA,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_FECHA_1VTO),DUP,NAME('pkcomprobante1'),NOCASE !                    
idxcomprobante1          KEY(CDE:CDE_EMPRESA,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_IMPORTE),DUP,NAME('idxcomprobante1'),NOCASE !                    
idxcomprobante22         KEY(CDE:CDE_FECHA_EMISION),DUP,NAME('idxcomprobante22'),NOCASE !                    
IX_COMPROBANTE_1         KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE,CDE:CDE_SUMINISTRO,CDE:CDE_TIPO,CDE:CDE_NUMERO,CDE:CDE_FECHA_EMISION,CDE:CDE_IMPORTE,CDE:CDE_CANCELADO),DUP,NOCASE !                    
KEY__WA_Sys_cde_cancelado_566B5B6C KEY(CDE:CDE_CANCELADO),DUP,NAME('_WA_Sys_cde_cancelado_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FECHA_PAGO_566B5B6C KEY(CDE:CDE_FECHA_PAGO),DUP,NAME('_WA_Sys_CDE_FECHA_PAGO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_SUMINISTRO_566B5B6C KEY(CDE:CDE_SUMINISTRO),DUP,NAME('_WA_Sys_CDE_SUMINISTRO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FECHA_1VTO_566B5B6C KEY(CDE:CDE_FECHA_1VTO),DUP,NAME('_WA_Sys_CDE_FECHA_1VTO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_BANCO_SUCURSAL_PAGO_566B5B6C KEY(CDE:CDE_BANCO_SUCURSAL_PAGO),DUP,NAME('_WA_Sys_CDE_BANCO_SUCURSAL_PAGO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FILIAL_CENTRO_ATENCION_PAGO_566B5B6C KEY(CDE:CDE_FILIAL_CENTRO_ATENCION_PAGO),DUP,NAME('_WA_Sys_CDE_FILIAL_CENTRO_ATENCION_PAGO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_cde_ano_566B5B6C KEY(CDE:CDE_ANO),DUP,NAME('_WA_Sys_cde_ano_566B5B6C'),NOCASE !                    
KEY__WA_Sys_cde_periodo_566B5B6C KEY(CDE:CDE_PERIODO),DUP,NAME('_WA_Sys_cde_periodo_566B5B6C'),NOCASE !                    
KEY__WA_Sys_Cde_Importe_566B5B6C KEY(CDE:CDE_IMPORTE),DUP,NAME('_WA_Sys_Cde_Importe_566B5B6C'),NOCASE !                    
KEY__WA_Sys_cde_fecha_plazo_otorgado_566B5B6C KEY(CDE:CDE_FECHA_PLAZO_OTORGADO),DUP,NAME('_WA_Sys_cde_fecha_plazo_otorgado_566B5B6C'),NOCASE !                    
KEY__WA_Sys_cde_id_user_otorgo_plazo_566B5B6C KEY(CDE:CDE_ID_USER_OTORGO_PLAZO),DUP,NAME('_WA_Sys_cde_id_user_otorgo_plazo_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FECHA_UPDATE_566B5B6C KEY(CDE:CDE_FECHA_UPDATE),DUP,NAME('_WA_Sys_CDE_FECHA_UPDATE_566B5B6C'),NOCASE !                    
FK_COMPROBANTE_SUCURSAL  KEY(CDE:CDE_SUCURSAL),DUP,NOCASE  !                    
KEY__WA_Sys_CDE_GRUPO_566B5B6C KEY(CDE:CDE_GRUPO),DUP,NAME('_WA_Sys_CDE_GRUPO_566B5B6C'),NOCASE !                    
FK_COMPROBANTE_CLASE_COMPROBANTE KEY(CDE:CDE_CLASE_COMPROBANTE),DUP,NOCASE !                    
KEY__WA_Sys_CDE_RUTA_566B5B6C KEY(CDE:CDE_RUTA),DUP,NAME('_WA_Sys_CDE_RUTA_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_PAGO_EN_SUCURSAL_566B5B6C KEY(CDE:CDE_PAGO_EN_SUCURSAL),DUP,NAME('_WA_Sys_CDE_PAGO_EN_SUCURSAL_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_LOTE_REPLICACION_566B5B6C KEY(CDE:CDE_LOTE_REPLICACION),DUP,NAME('_WA_Sys_CDE_LOTE_REPLICACION_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FECHA_2VTO_566B5B6C KEY(CDE:CDE_FECHA_2VTO),DUP,NAME('_WA_Sys_CDE_FECHA_2VTO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_CONSUMO_566B5B6C KEY(CDE:CDE_CONSUMO),DUP,NAME('_WA_Sys_CDE_CONSUMO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_ID_USER_566B5B6C KEY(CDE:CDE_ID_USER),DUP,NAME('_WA_Sys_CDE_ID_USER_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FECHA_USER_OTORGO_566B5B6C KEY(CDE:CDE_FECHA_USER_OTORGO),DUP,NAME('_WA_Sys_CDE_FECHA_USER_OTORGO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_MOTIVO_PLAZO_OTORGADO_566B5B6C KEY(CDE:CDE_MOTIVO_PLAZO_OTORGADO),DUP,NAME('_WA_Sys_CDE_MOTIVO_PLAZO_OTORGADO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_FECHA_PROCESO_PAGO_566B5B6C KEY(CDE:CDE_FECHA_PROCESO_PAGO),DUP,NAME('_WA_Sys_CDE_FECHA_PROCESO_PAGO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_CONSUMO_DIRECTO_566B5B6C KEY(CDE:CDE_CONSUMO_DIRECTO),DUP,NAME('_WA_Sys_CDE_CONSUMO_DIRECTO_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_CONSUMO_CONVER_566B5B6C KEY(CDE:CDE_CONSUMO_CONVER),DUP,NAME('_WA_Sys_CDE_CONSUMO_CONVER_566B5B6C'),NOCASE !                    
KEY__WA_Sys_CDE_CALORIAS_566B5B6C KEY(CDE:CDE_CALORIAS),DUP,NAME('_WA_Sys_CDE_CALORIAS_566B5B6C'),NOCASE !                    
IX_COMPROBANTE_ANO_PERIODO KEY(CDE:CDE_EMPRESA,CDE:CDE_ANO,CDE:CDE_PERIODO),DUP !                    
FK_COMPROBANTE_TIPO_COMPROBANTE KEY(CDE:CDE_TIPO),DUP,NOCASE !                    
FK_COMPROBANTE_GRUPO     KEY(CDE:CDE_SUCURSAL,CDE:CDE_GRUPO),DUP,NOCASE !                    
FK_COMPROBANTE_CLIENTE   KEY(CDE:CDE_EMPRESA,CDE:CDE_CLIENTE),DUP,NOCASE !                    
FK_COMPROBANTE_EMPRESA   KEY(CDE:CDE_EMPRESA),DUP,NOCASE   !                    
K_Tipo_Ano_Periodo_grupo KEY(CDE:CDE_TIPO,CDE:CDE_ANO,CDE:CDE_PERIODO,CDE:CDE_GRUPO),DUP,NOCASE !K_Completa          
Record                   RECORD,PRE()
CDE_EMPRESA                 SHORT                          !                    
CDE_TIPO                    BYTE                           !                    
CDE_NUMERO                  STRING(20)                     !                    
CDE_CLIENTE                 LONG                           !                    
CDE_SUMINISTRO              LONG                           !                    
CDE_ANO                     LONG                           !                    
CDE_PERIODO                 LONG                           !                    
CDE_CLASE_COMPROBANTE       BYTE                           !                    
CDE_SUCURSAL                LONG                           !                    
CDE_GRUPO                   LONG                           !                    
CDE_RUTA                    LONG                           !                    
CDE_FECHA_EMISION           STRING(8)                      !                    
CDE_FECHA_EMISION_GROUP     GROUP,OVER(CDE_FECHA_EMISION)  !                    
CDE_FECHA_EMISION_DATE        DATE                         !                    
CDE_FECHA_EMISION_TIME        TIME                         !                    
                            END                            !                    
CDE_FECHA_1VTO              STRING(8)                      !                    
CDE_FECHA_1VTO_GROUP        GROUP,OVER(CDE_FECHA_1VTO)     !                    
CDE_FECHA_1VTO_DATE           DATE                         !                    
CDE_FECHA_1VTO_TIME           TIME                         !                    
                            END                            !                    
CDE_FECHA_2VTO              STRING(8)                      !                    
CDE_FECHA_2VTO_GROUP        GROUP,OVER(CDE_FECHA_2VTO)     !                    
CDE_FECHA_2VTO_DATE           DATE                         !                    
CDE_FECHA_2VTO_TIME           TIME                         !                    
                            END                            !                    
CDE_IMPORTE                 DECIMAL(19,4)                  !                    
CDE_CANCELADO               DECIMAL(19,4)                  !                    
CDE_CALORIAS                LONG                           !                    
CDE_CONSUMO                 LONG                           !                    
CDE_CONSUMO_CONVER          DECIMAL(19,4)                  !                    
CDE_CONSUMO_DIRECTO         LONG                           !                    
CDE_FECHA_PAGO              STRING(8)                      !                    
CDE_FECHA_PAGO_GROUP        GROUP,OVER(CDE_FECHA_PAGO)     !                    
CDE_FECHA_PAGO_DATE           DATE                         !                    
CDE_FECHA_PAGO_TIME           TIME                         !                    
                            END                            !                    
CDE_FECHA_PROCESO_PAGO      STRING(8)                      !                    
CDE_FECHA_PROCESO_PAGO_GROUP GROUP,OVER(CDE_FECHA_PROCESO_PAGO) !                    
CDE_FECHA_PROCESO_PAGO_DATE   DATE                         !                    
CDE_FECHA_PROCESO_PAGO_TIME   TIME                         !                    
                            END                            !                    
CDE_PAGO_EN_SUCURSAL        CSTRING(2)                     !                    
CDE_BANCO_SUCURSAL_PAGO     LONG                           !                    
CDE_FILIAL_CENTRO_ATENCION_PAGO LONG                       !                    
CDE_FECHA_PLAZO_OTORGADO    STRING(8)                      !                    
CDE_FECHA_PLAZO_OTORGADO_GROUP GROUP,OVER(CDE_FECHA_PLAZO_OTORGADO) !                    
CDE_FECHA_PLAZO_OTORGADO_DATE DATE                         !                    
CDE_FECHA_PLAZO_OTORGADO_TIME TIME                         !                    
                            END                            !                    
CDE_MOTIVO_PLAZO_OTORGADO   CSTRING(256)                   !                    
CDE_ID_USER_OTORGO_PLAZO    CSTRING(21)                    !                    
CDE_FECHA_USER_OTORGO       STRING(8)                      !                    
CDE_FECHA_USER_OTORGO_GROUP GROUP,OVER(CDE_FECHA_USER_OTORGO) !                    
CDE_FECHA_USER_OTORGO_DATE    DATE                         !                    
CDE_FECHA_USER_OTORGO_TIME    TIME                         !                    
                            END                            !                    
CDE_ID_USER                 STRING(20)                     !                    
CDE_FECHA_UPDATE            STRING(8)                      !                    
CDE_FECHA_UPDATE_GROUP      GROUP,OVER(CDE_FECHA_UPDATE)   !                    
CDE_FECHA_UPDATE_DATE         DATE                         !                    
CDE_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
CDE_LOTE_REPLICACION        LONG                           !                    
                         END
                     END                       

per                  FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('sue.per'),PRE(per),BINDABLE,THREAD !tabla Denarius      
per_nom                  KEY(per:emp,per:apynom,per:nroleg),DUP !                    
per_emp                  KEY(per:emp,per:nroleg)           !                    
Record                   RECORD,PRE()
emp                         SHORT                          !                    
nroleg                      LONG                           !                    
apynom                      CSTRING(51)                    !                    
direc                       CSTRING(36)                    !                    
relacion                    BYTE                           !                    
activo                      BYTE                           !                    
codccos                     LONG                           !                    
fecnac                      DATE                           !                    
                         END
                     END                       

datpers              FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('sue.datpers'),PRE(datpers),BINDABLE,THREAD !tabla Denarius      
datpers_cuil             KEY(datpers:emp,datpers:cuil),DUP !                    
datpers_emp              KEY(datpers:emp,datpers:nroleg)   !                    
datpers_lugpag           KEY(datpers:emp,datpers:lugpag,datpers:nroleg) !                    
Record                   RECORD,PRE()
emp                         SHORT                          !                    
nroleg                      LONG                           !                    
apell                       CSTRING(21)                    !                    
nombre                      CSTRING(31)                    !                    
calle                       CSTRING(36)                    !                    
nro                         CSTRING(6)                     !                    
piso                        CSTRING(3)                     !                    
dpto                        CSTRING(5)                     !                    
paisnac                     BYTE                           !                    
ciudnac                     CSTRING(26)                    !                    
provnac                     BYTE                           !                    
fecant                      DATE                           !                    
fectran                     DATE                           !                    
fecdena                     DATE                           !                    
cuil                        CSTRING(14)                    !                    
feinac                      DATE                           !                    
fafafjp                     DATE                           !                    
tipoper                     BYTE                           !                    
codactiv                    CSTRING(9)                     !                    
lugpag                      LONG                           !                    
contrato                    BYTE                           !                    
nrosol                      SHORT                          !                    
pjorred                     PDECIMAL(5,2)                  !                    
canrenov                    BYTE                           !                    
duracont                    SHORT                          !                    
jubilado                    BYTE                           !                    
presta                      BYTE                           !                    
planp                       BYTE                           !                    
nroapre                     CSTRING(21)                    !                    
porcpre                     PDECIMAL(5,2)                  !                    
email                       CSTRING(51)                    !                    
condleg                     BYTE                           !                    
cat                         CSTRING(21)                    !                    
fecinic                     DATE                           !                    
bankc                       SHORT                          !                    
codsucc                     SHORT                          !                    
mesantre                    SHORT                          !                    
cbu                         CSTRING(23)                    !                    
                         END
                     END                       

CONVENIO             FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.CONVENIO'),PRE(CON),BINDABLE,THREAD !                    
PK_CONVENIO              KEY(CON:CONV_ID),PRIMARY          !                    
Record                   RECORD,PRE()
CONV_ID                     SHORT,NAME('"CONV_ID"')        !                    
CONV_CONVENIO               STRING(21),NAME('"CONV_CONVENIO"') !                    
CONV_VACA                   STRING(1),NAME('"CONV_VACA"')  !                    
CONV_DIAS                   STRING(1),NAME('"CONV_DIAS"')  !                    
CONV_SEMANAS                BYTE,NAME('"CONV_SEMANAS"')    !                    
CONV_DVIAJE                 STRING(1),NAME('"CONV_DVIAJE"') !                    
                         END
                     END                       

DETALLE_LICENCIA     FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DETALLE_LICENCIA"'),PRE(DLIC),BINDABLE,THREAD !                    
PK_DETALLE_LICENCIA      KEY(DLIC:DLIC_LEGAJO,DLIC:DLIC_ANIO,DLIC:DLIC_INICIO,DLIC:DLIC_FIN),PRIMARY !                    
Record                   RECORD,PRE()
DLIC_LEGAJO                 SHORT,NAME('"DLIC_LEGAJO"')    !                    
DLIC_ANIO                   SHORT,NAME('"DLIC_ANIO"')      !                    
DLIC_INICIO                 STRING(8),NAME('"DLIC_INICIO"') !                    
DLIC_INICIO_GROUP           GROUP,OVER(DLIC_INICIO)        !                    
DLIC_INICIO_DATE              DATE                         !                    
DLIC_INICIO_TIME              TIME                         !                    
                            END                            !                    
DLIC_FIN                    STRING(8),NAME('"DLIC_FIN"')   !                    
DLIC_FIN_GROUP              GROUP,OVER(DLIC_FIN)           !                    
DLIC_FIN_DATE                 DATE                         !                    
DLIC_FIN_TIME                 TIME                         !                    
                            END                            !                    
DLIC_TOMA                   BYTE,NAME('"DLIC_TOMA"')       !                    
DLIC_ASUELDO                STRING(1),NAME('"DLIC_ASUELDO"') !                    
DLIC_COBRAR                 STRING(1),NAME('"DLIC_COBRAR"') !                    
DLIC_VIAJE                  STRING(1),NAME('"DLIC_VIAJE"') !                    
DLIC_FECHA_UPDATE           STRING(8),NAME('"DLIC_FECHA_UPDATE"') !                    
DLIC_FECHA_UPDATE_GROUP     GROUP,OVER(DLIC_FECHA_UPDATE)  !                    
DLIC_FECHA_UPDATE_DATE        DATE                         !                    
DLIC_FECHA_UPDATE_TIME        TIME                         !                    
                            END                            !                    
DLIC_FECHA                  STRING(8),NAME('"DLIC_FECHA"') !                    
DLIC_FECHA_GROUP            GROUP,OVER(DLIC_FECHA)         !                    
DLIC_FECHA_DATE               DATE                         !                    
DLIC_FECHA_TIME               TIME                         !                    
                            END                            !                    
DLIC_ESTADO                 STRING(1),NAME('"DLIC_ESTADO"') !                    
DLIC_USER                   STRING(20)                     !                    
                         END
                     END                       

DIAS_VIAJE           FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DIAS_VIAJE"'),PRE(DV),BINDABLE,THREAD !                    
PK_DIAS_VIAJE            KEY(DV:DV_LEGAJO,DV:DV_LICENCIA),PRIMARY !                    
Record                   RECORD,PRE()
DV_LEGAJO                   SHORT,NAME('"DV_LEGAJO"')      !                    
DV_LICENCIA                 SHORT,NAME('"DV_LICENCIA"')    !                    
DV_DESDE                    STRING(8),NAME('"DV_DESDE"')   !                    
DV_DESDE_GROUP              GROUP,OVER(DV_DESDE)           !                    
DV_DESDE_DATE                 DATE                         !                    
DV_DESDE_TIME                 TIME                         !                    
                            END                            !                    
DV_HASTA                    STRING(8),NAME('"DV_HASTA"')   !                    
DV_HASTA_GROUP              GROUP,OVER(DV_HASTA)           !                    
DV_HASTA_DATE                 DATE                         !                    
DV_HASTA_TIME                 TIME                         !                    
                            END                            !                    
DV_DIAS                     BYTE,NAME('"DV_DIAS"')         !                    
DV_OBSERVACION              STRING(30)                     !                    
DV_FECHA_UPDATE             STRING(8),NAME('"DV_FECHA_UPDATE"') !                    
DV_FECHA_UPDATE_GROUP       GROUP,OVER(DV_FECHA_UPDATE)    !                    
DV_FECHA_UPDATE_DATE          DATE                         !                    
DV_FECHA_UPDATE_TIME          TIME                         !                    
                            END                            !                    
DV_DEPOSITADO               STRING(8),NAME('"DV_DEPOSITADO"') !                    
DV_DEPOSITADO_GROUP         GROUP,OVER(DV_DEPOSITADO)      !                    
DV_DEPOSITADO_DATE            DATE                         !                    
DV_DEPOSITADO_TIME            TIME                         !                    
                            END                            !                    
DV_FECHA                    STRING(8),NAME('"DV_FECHA"')   !                    
DV_FECHA_GROUP              GROUP,OVER(DV_FECHA)           !                    
DV_FECHA_DATE                 DATE                         !                    
DV_FECHA_TIME                 TIME                         !                    
                            END                            !                    
DV_USER                     STRING(20)                     !                    
                         END
                     END                       

LICENCIA             FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.LICENCIA'),PRE(LIC),BINDABLE,THREAD !                    
FK_CTA                   KEY(LIC:LIC_CTA),DUP,NOCASE       !                    
PK_LICENCIA              KEY(LIC:LIC_LEGAJO,LIC:LIC_ANIO),PRIMARY !                    
Record                   RECORD,PRE()
LIC_LEGAJO                  SHORT,NAME('"LIC_LEGAJO"')     !                    
LIC_ANIO                    SHORT,NAME('"LIC_ANIO"')       !                    
LIC_DIAS                    BYTE,NAME('"LIC_DIAS"')        !                    
LIC_COBRO                   STRING(1),NAME('"LIC_COBRO"')  !                    
LIC_DEPOSITADA              STRING(1)                      !                    
LIC_FECHA_UPDATE            STRING(8),NAME('"LIC_FECHA_UPDATE"') !                    
LIC_FECHA_UPDATE_GROUP      GROUP,OVER(LIC_FECHA_UPDATE)   !                    
LIC_FECHA_UPDATE_DATE         DATE                         !                    
LIC_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
LIC_PAGAN                   BYTE                           !                    
LIC_DEPOSITO                STRING(8),NAME('"LIC_DEPOSITO"') !                    
LIC_DEPOSITO_GROUP          GROUP,OVER(LIC_DEPOSITO)       !                    
LIC_DEPOSITO_DATE             DATE                         !                    
LIC_DEPOSITO_TIME             TIME                         !                    
                            END                            !                    
LIC_DIAS_VIAJE              STRING(1)                      !                    
LIC_CTA                     LONG                           !                    
LIC_USER                    STRING(20)                     !                    
LIC_OBSERVACION             STRING(100)                    !                    
                         END
                     END                       

PARAMETRO_DIAS_VIAJE FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."PARAMETRO_DIAS_VIAJE"'),PRE(PRMV),BINDABLE,THREAD !                    
PK_PARAMETRO_DIAS_VIAJE  KEY(PRMV:PRMV_KMS,PRMV:PRMV_GRAMIO),PRIMARY !                    
Record                   RECORD,PRE()
PRMV_KMS                    SHORT,NAME('"PRMV_KMS"')       !                    
PRMV_DIAS                   BYTE,NAME('"PRMV_DIAS"')       !                    
PRMV_GRAMIO                 SHORT,NAME('"PRMV_GRAMIO"')    !                    
                         END
                     END                       

PARAMETRO_LICENCIA   FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."PARAMETRO_LICENCIA"'),PRE(PRML),BINDABLE,THREAD !                    
FK_CONVENIO              KEY(PRML:PRML_CONVENIO),DUP,NOCASE !                    
PK_PARAMETRO_LICENCIA    KEY(PRML:PRML_CONVENIO,PRML:PRML_ANTD,PRML:PRML_ANTH),PRIMARY !                    
Record                   RECORD,PRE()
PRML_CONVENIO               SHORT,NAME('"PRML_CONVENIO"')  !                    
PRML_DIAS                   BYTE,NAME('"PRML_DIAS"')       !                    
PRML_ANTD                   BYTE,NAME('"PRML_ANTD"')       !                    
PRML_ANTH                   BYTE,NAME('"PRML_ANTH"')       !                    
PRML_PAGAN                  BYTE                           !                    
                         END
                     END                       

SECTOR               FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.SECTOR'),PRE(SEC),BINDABLE,THREAD !                    
PK_NOMBRE                KEY(SEC:SEC_SECTOR),NOCASE        !                    
PK_SECTOR                KEY(SEC:SEC_ID),PRIMARY           !                    
Record                   RECORD,PRE()
SEC_ID                      SHORT,NAME('"SEC_ID"')         !                    
SEC_SECTOR                  STRING(50),NAME('"SEC_SECTOR"') !                    
                         END
                     END                       

FERIADOS             FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.FERIADOS'),PRE(FER),BINDABLE,THREAD !                    
PK_FERIADOS              KEY(FER:DIAFERIADO),PRIMARY       !                    
Record                   RECORD,PRE()
DIAFERIADO                  STRING(8)                      !                    
DIAFERIADO_GROUP            GROUP,OVER(DIAFERIADO)         !                    
DIAFERIADO_DATE               DATE                         !                    
DIAFERIADO_TIME               TIME                         !                    
                            END                            !                    
                         END
                     END                       

empch                FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('sue.empch'),PRE(empch),BINDABLE,THREAD !tabla Denarius      
empch_nroliq             KEY(empch:nroliq,empch:nroleg,empch:codigo,empch:ccosto) !                    
Record                   RECORD,PRE()
nroleg                      LONG                           !                    
nroliq                      LONG                           !                    
codigo                      SHORT                          !                    
ccosto                      LONG                           !                    
val                         PDECIMAL(12,2)                 !                    
cant                        PDECIMAL(9,2)                  !                    
                         END
                     END                       

empc                 FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('sue.empc'),PRE(emp),BINDABLE,THREAD !tabla Denarius      
empc_nroliq              KEY(emp:nroliq,emp:nroleg,emp:codigo,emp:ccosto) !                    
Record                   RECORD,PRE()
nroleg                      LONG                           !                    
nroliq                      LONG                           !                    
codigo                      SHORT                          !                    
ccosto                      LONG                           !                    
val                         PDECIMAL(12,2)                 !                    
cant                        PDECIMAL(9,2)                  !                    
                         END
                     END                       

CTA_CONTABLE         FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."CTA_CONTABLE"'),PRE(CTA),BINDABLE,THREAD !                    
PK_CTA_CONTABLE          KEY(CTA:CTA_ID_UNIBIZ),PRIMARY    !                    
Record                   RECORD,PRE()
CTA_ID_UNIBIZ               LONG,NAME('"CTA_ID_UNIBIZ"')   !                    
CTA_CUENTA                  LONG,NAME('"CTA_CUENTA"')      !                    
CTA_DETALLE                 STRING(40),NAME('"CTA_DETALLE"') !                    
CTA_IMPU                    STRING(1),NAME('"CTA_IMPU"')   !                    
                         END
                     END                       

PROVISION            FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.PROVISION'),PRE(PROV),BINDABLE,THREAD !                    
FK_CTALICENCIA           KEY(PROV:PROV_LICENCIA),DUP,NOCASE !                    
PK_PROVISION             KEY(PROV:PROV_ID),PRIMARY         !                    
PK_AUX                   KEY(PROV:PROV_MES,PROV:PROV_ANIO,PROV:PROV_LICENCIA),NOCASE !                    
Record                   RECORD,PRE()
PROV_ID                     LONG,NAME('"PROV_ID"')         !                    
PROV_MES                    BYTE,NAME('"PROV_MES"')        !                    
PROV_ANIO                   SHORT,NAME('"PROV_ANIO"')      !                    
PROV_LICENCIA               LONG,NAME('"PROV_LICENCIA"')   !                    
PROV_FECHA_UPDATE           STRING(8),NAME('"PROV_FECHA_UPDATE"') !                    
PROV_FECHA_UPDATE_GROUP     GROUP,OVER(PROV_FECHA_UPDATE)  !                    
PROV_FECHA_UPDATE_DATE        DATE                         !                    
PROV_FECHA_UPDATE_TIME        TIME                         !                    
                            END                            !                    
PROV_USER                   STRING(20)                     !                    
                         END
                     END                       

DETALLE_PROVISION    FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DETALLE_PROVISION"'),PRE(PROVD),BINDABLE,THREAD !                    
FK_LEGAJO                KEY(PROVD:PROVD_LEGAJO),DUP,NOCASE !                    
FK_PROVISION             KEY(PROVD:PROVD_ID),DUP,NOCASE    !                    
PK_PROVISION_DETALLE     KEY(PROVD:PROVD_ID,PROVD:PROVD_LEGAJO),PRIMARY !                    
Record                   RECORD,PRE()
PROVD_ID                    LONG,NAME('"PROVD_ID"')        !                    
PROVD_LEGAJO                SHORT,NAME('"PROVD_LEGAJO"')   !                    
PROVD_CCOSTO                SHORT,NAME('"PROVD_CCOSTO"')   !                    
PROVD_FECHA                 STRING(8),NAME('"PROVD_FECHA"') !                    
PROVD_FECHA_GROUP           GROUP,OVER(PROVD_FECHA)        !                    
PROVD_FECHA_DATE              DATE                         !                    
PROVD_FECHA_TIME              TIME                         !                    
                            END                            !                    
PROVD_9931                  DECIMAL(19,4),NAME('"PROVD_9931"') !                    
PROVD_LIQUIDACION           STRING(9),NAME('"PROVD_LIQUIDACION"') !                    
PROVD_DIAS                  BYTE,NAME('"PROVD_DIAS"')      !                    
PROVD_CARGAS                DECIMAL(19,4),NAME('"PROVD_CARGAS"') !                    
PROVD_VACPTELIQ             DECIMAL(19,4),NAME('"PROVD_VACPTELIQ"') !                    
PROVD_USER                  STRING(20)                     !                    
                         END
                     END                       

TXTAsiento           FILE,DRIVER('ASCII'),NAME(Glo:TxtAsiento),PRE(TXTA),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
linea                       STRING(95)                     !                    
                         END
                     END                       

SSEC::UserInGroup    FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_UserInGroup'),PRE(SUIG_),BINDABLE,CREATE,THREAD !                    
UserKey                  KEY(SUIG_:UserNo,SUIG_:UGrpNo),NOCASE,OPT,PRIMARY !                    
UGrpKey                  KEY(SUIG_:UGrpNo,SUIG_:UserNo),NOCASE,OPT !                    
Record                   RECORD,PRE()
UserNo                      LONG                           !                    
UGrpNo                      LONG                           !                    
                         END
                     END                       

SSEC::Door           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Door'),PRE(SDoor_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SDoor_:No),NOCASE,OPT,PRIMARY !                    
EquateKey                KEY(SDoor_:Equate),NOCASE,OPT     !                    
DGrpDescKey              KEY(SDoor_:DGrpNo,SDoor_:Description),NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          SHORT                          !Door Number         
DGrpNo                      LONG                           !Door Group #        
Equate                      STRING(30)                     !Equate for MYDOORS.CLW
Description                 STRING(60)                     !Description         
Freeze                      BYTE                           !                    
                         END
                     END                       

SSEC::DoorGroup      FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_DoorGroup'),PRE(SDGrp_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SDGrp_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SDGrp_:Name),NOCASE,OPT       !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
Name                        STRING(30)                     !                    
Freeze                      BYTE                           !                    
                         END
                     END                       

SSEC::Access         FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Access'),PRE(SAcc_),BINDABLE,CREATE,THREAD !                    
UserDoorKey              KEY(SAcc_:UserNo,SAcc_:DoorNo),NOCASE,OPT,PRIMARY !                    
DoorUserKey              KEY(SAcc_:DoorNo,SAcc_:UserNo),NOCASE,OPT !                    
Record                   RECORD,PRE()
UserNo                      SHORT                          !User Number         
DoorNo                      SHORT                          !Door Number         
DenyFlag                    BYTE                           !Is this "Deny Access to User"?
                         END
                     END                       

SSEC::Program        FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Program'),PRE(SProg_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SProg_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SProg_:Name),NOCASE,OPT       !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
Name                        STRING(8)                      !                    
                         END
                     END                       

SSEC::Procedure      FILE,DRIVER('MSSQL'),NAME('_Procedure'),PRE(SProc_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SProc_:No),NOCASE,OPT,PRIMARY !                    
ProgKey                  KEY(SProc_:ProgNo,SProc_:Name),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
ProgNo                      LONG                           !                    
Name                        STRING(30)                     !                    
GeneralDoorNo               LONG                           !                    
GeneralOverride             BYTE                           !                    
InsertDoorNo                LONG                           !                    
InsertOverride              BYTE                           !                    
ChangeDoorNo                LONG                           !                    
ChangeOverride              BYTE                           !                    
DeleteDoorNo                LONG                           !                    
DeleteOverride              BYTE                           !                    
ViewDoorNo                  LONG                           !                    
ViewOverride                BYTE                           !                    
                         END
                     END                       

SSEC::File           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_File'),PRE(SFile_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SFile_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SFile_:Name),NOCASE,OPT       !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
Name                        STRING(30)                     !                    
                         END
                     END                       

SSEC::Field          FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Field'),PRE(SField_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SField_:No),NOCASE,OPT,PRIMARY !                    
FileKey                  KEY(SField_:FileNo,SField_:Name),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
FileNo                      LONG                           !                    
Name                        STRING(30)                     !                    
                         END
                     END                       

SSEC::PwdLog         FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_PwdLog'),PRE(SPwdLog_),BINDABLE,CREATE,THREAD !Password Log        
NoKey                    KEY(SPwdLog_:No),NOCASE,OPT,PRIMARY !                    
UserKey                  KEY(SPwdLog_:UserNo,-SPwdLog_:Date,-SPwdLog_:No),NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !PwdLog Number       
UserNo                      LONG                           !User Number         
Password                    STRING(20)                     !Password            
Date                        LONG                           !When was the password chosen?
Time                        LONG                           !When was the password chosen?
                         END
                     END                       

SSEC::Call           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Call'),PRE(SCall_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SCall_:No),NOCASE,OPT,PRIMARY !                    
DateKey                  KEY(SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
ProcKey                  KEY(SCall_:ProcNo,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
ProcReqKey               KEY(SCall_:ProcNo,SCall_:Request,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
UserKey                  KEY(SCall_:UserNo,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
FileKey                  KEY(SCall_:FileNo,SCall_:Date,SCall_:Time),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Description                 STRING(100)                    !                    
No                          LONG                           !                    
ProcNo                      LONG                           !                    
Request                     LONG                           !                    
UserNo                      LONG                           !                    
Date                        LONG                           !                    
Time                        LONG                           !                    
FileNo                      LONG                           !                    
PrimaryKey                  LONG                           !                    
AccessDenied                BYTE                           !                    
RequestCancelled            BYTE                           !                    
                         END
                     END                       

SSEC::Edit           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('_Edit'),PRE(SEdit_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SEdit_:No),NOCASE,OPT,PRIMARY !                    
CallKey                  KEY(SEdit_:CallNo),DUP,NOCASE,OPT !                    
FieldKey                 KEY(SEdit_:FieldNo),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
No                          LONG                           !                    
CallNo                      LONG                           !                    
FieldNo                     LONG                           !                    
OldValue                    STRING(30)                     !                    
NewValue                    STRING(30)                     !                    
                         END
                     END                       

SSEC::User           FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('dbo."_User"'),PRE(SUser_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SUser_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SUser_:LastName,SUser_:FirstName),NOCASE,OPT !                    
GroupNameKey             KEY(SUser_:GroupFlag,SUser_:LastName,SUser_:FirstName),NOCASE,OPT !                    
LevelNdx                 KEY(SUser_:Level),DUP,NOCASE,OPT  !                    
Record                   RECORD,PRE()
No                          LONG                           !User Number         
GroupFlag                   BYTE                           !Is this a group?    
LastName                    STRING(25)                     !Last Name           
FirstName                   STRING(15)                     !First Name (optional)
Password                    STRING(20)                     !Password            
Level                       SHORT                          !User Level (if not using Doors)
PasswordSize                BYTE                           !Size of Password Field (0=8).  Don't change this value if you don't fully understand the implications.
PasswordMaxAge              SHORT                          !How many days until password change is required (0=Never)
PasswordDate                LONG                           !When was the current password chosen?
PasswordTime                LONG                           !When was the current password chosen?
LogonDate                   LONG                           !Last successful logon date
LogonTime                   LONG                           !Last successful logon time
Failures                    SHORT                          !Failure count since last successful logon
Locked                      BYTE                           !Is this user locked out?
                         END
                     END                       

ERP_ASIENTO          FILE,DRIVER('ASCII'),NAME(GLO:NOMBRE_ERP),PRE(TRP),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
NASIENTO                    STRING(@N05)                   !                    
NORDEN                      STRING(@N05)                   !                    
FECHA                       STRING(@D06)                   !                    
CONCEPTO                    STRING(40)                     !                    
IDCUENTA                    STRING(@N04)                   !                    
IDCCOSTO                    STRING(@N04)                   !                    
DEBE                        STRING(@N014.2-)               !                    
HABER                       STRING(@N014.2-)               !                    
                         END
                     END                       

HORASEXTRASCVS       FILE,DRIVER('BASIC','/FIRSTROWHEADER=ON'),NAME(Glo:HorasExtrasCVS),PRE(IHE),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Ô___Fecha                   STRING(10)                     !                    
Cent__Costo                 STRING(2)                      !                    
Legajo                      STRING(4)                      !                    
Nombre                      STRING(26)                     !                    
Convenio                    STRING(5)                      !                    
Inicio                      STRING(8)                      !                    
Fin                         STRING(8)                      !                    
Tipo                        STRING(4)                      !                    
Devoluci√_n                 STRING(5)                      !                    
                         END
                     END                       

DETALLE_HORAS_EXTRA  FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DETALLE_HORAS_EXTRA"'),PRE(HEXD),BINDABLE,THREAD !                    
FK_EMPLEADO              KEY(HEXD:HEXD_LEGAJO),DUP,NOCASE  !                    
FK_HSEXTRADENARIUS       KEY(HEXD:HEXD_DENARIUS),DUP,NOCASE !                    
FK_HORASEXTRAS           KEY(HEXD:HEXD_ID),DUP,NOCASE      !                    
PK_DETALLE_HORAS_EXTRA   KEY(HEXD:HEXD_ID,HEXD:HEXD_FECHA,HEXD:HEXD_LEGAJO,HEXD:HEXD_INICIO,HEXD:HEXD_FIN),PRIMARY !                    
Record                   RECORD,PRE()
HEXD_ID                     SHORT,NAME('"HEXD_ID"')        !                    
HEXD_FECHA                  STRING(8),NAME('"HEXD_FECHA"') !                    
HEXD_FECHA_GROUP            GROUP,OVER(HEXD_FECHA)         !                    
HEXD_FECHA_DATE               DATE                         !                    
HEXD_FECHA_TIME               TIME                         !                    
                            END                            !                    
HEXD_LEGAJO                 SHORT,NAME('"HEXD_LEGAJO"')    !                    
HEXD_INICIO                 STRING(16),NAME('"HEXD_INICIO"') !                    
HEXD_INICIO_GROUP           GROUP,OVER(HEXD_INICIO),NAME('HEXD_INICIO') !                    
HEXD_INICIO_Time              STRING(@T4),NAME('HEXD_INICIO') !                    
HEXD_INICIO_Dot               STRING(@P.P),NAME('HEXD_INICIO') !                    
HEXD_INICIO_Hundreds          STRING(@N7),NAME('HEXD_INICIO') !                    
                            END                            !                    
HEXD_FIN                    STRING(16),NAME('"HEXD_FIN"')  !                    
HEXD_FIN_GROUP              GROUP,OVER(HEXD_FIN),NAME('HEXD_FIN') !                    
HEXD_FIN_Time                 STRING(@T4),NAME('HEXD_FIN') !                    
HEXD_FIN_Dot                  STRING(@P.P),NAME('HEXD_FIN') !                    
HEXD_FIN_Hundreds             STRING(@N7),NAME('HEXD_FIN') !                    
                            END                            !                    
HEXD_EMPLEADO               STRING(50),NAME('"HEXD_EMPLEADO"') !                    
HEXD_CONVENIO               STRING(10),NAME('"HEXD_CONVENIO"') !                    
HEXD_TIPO                   STRING(10),NAME('"HEXD_TIPO"') !                    
HEXD_TIEMPO                 STRING(5),NAME('"HEXD_TIEMPO"') !                    
HEXD_TIEMPO1                STRING(8)                      !                    
HEXD_DENARIUS               SHORT,NAME('"HEXD_DENARIUS"')  !                    
HEXD_REEMBOLSO              SHORT                          !                    
HEXD_TIPOHORA               STRING(3)                      !                    
HEXD_REEMBOLSOD             DECIMAL(7,2)                   !                    
HEXD_DIA_HABIL              SHORT                          !                    
                         END
                     END                       

HORAS_EXTRA          FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."HORAS_EXTRA"'),PRE(HEX),BINDABLE,THREAD !                    
PK_HORAS_EXTRA           KEY(HEX:HEX_ID),PRIMARY           !                    
Record                   RECORD,PRE()
HEX_ID                      SHORT,NAME('"HEX_ID"')         !                    
HEX_MES                     BYTE,NAME('"HEX_MES"')         !                    
HEX_ANIO                    SHORT,NAME('"HEX_ANIO"')       !                    
HEX_OBSERVACION             STRING(30),NAME('"HEX_OBSERVACION"') !                    
HEX_FECHA_UPDATE            STRING(8),NAME('"HEX_FECHA_UPDATE"') !                    
HEX_FECHA_UPDATE_GROUP      GROUP,OVER(HEX_FECHA_UPDATE)   !                    
HEX_FECHA_UPDATE_DATE         DATE                         !                    
HEX_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
HEX_USER                    STRING(20),NAME('"HEX_USER"')  !                    
HEX_ESTADO                  STRING(1)                      !                    
HEX_LIQUIDACION             STRING(9)                      !                    
                         END
                     END                       

HORAS_EXTRA_DENARIUS FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."HORAS_EXTRA_DENARIUS"'),PRE(HEXCD),BINDABLE,THREAD !                    
PK_HORAS_EXTRA_DENARIUS  KEY(HEXCD:HEXCD_ID),PRIMARY       !                    
FK_INTRANET              KEY(HEXCD:HEXCD_TIPO_INTRANET,HEXCD:HEXCD_TIPO_HORA),DUP,NOCASE !                    
Record                   RECORD,PRE()
HEXCD_ID                    BYTE,NAME('"HEXCD_ID"')        !                    
HEXCD_CONCEPTO              STRING(50),NAME('"HEXCD_CONCEPTO"') !                    
HEXCD_CODIGO                SHORT,NAME('"HEXCD_CODIGO"')   !                    
HEXCD_TIPO_INTRANET         STRING(10)                     !                    
HEXCD_TIPO_HORA             STRING(3)                      !                    
                         END
                     END                       

DETALLE_HORAS_EXTRAS FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DETALLE_HORAS_EXTRAS"'),PRE(DET),BINDABLE,THREAD !                    
PK_DETALLE_HORAS_EXTRAS  KEY(DET:HEXD_ID,DET:HEXD_FECHA,DET:HEXD_LEGAJO,DET:HEXD_INICIO,DET:HEXD_FIN),PRIMARY !                    
Record                   RECORD,PRE()
HEXD_ID                     SHORT,NAME('"HEXD_ID"')        !                    
HEXD_FECHA                  STRING(8),NAME('"HEXD_FECHA"') !                    
HEXD_FECHA_GROUP            GROUP,OVER(HEXD_FECHA)         !                    
HEXD_FECHA_DATE               DATE                         !                    
HEXD_FECHA_TIME               TIME                         !                    
                            END                            !                    
HEXD_LEGAJO                 SHORT,NAME('"HEXD_LEGAJO"')    !                    
HEXD_INICIO                 STRING(8),NAME('"HEXD_INICIO"') !                    
HEXD_FIN                    STRING(8),NAME('"HEXD_FIN"')   !                    
HEXD_EMPLEADO               STRING(50),NAME('"HEXD_EMPLEADO"') !                    
HEXD_CONVENIO               STRING(10),NAME('"HEXD_CONVENIO"') !                    
HEXD_TIPO                   STRING(10),NAME('"HEXD_TIPO"') !                    
HEXD_TIEMPO                 STRING(5),NAME('"HEXD_TIEMPO"') !                    
HEXD_DENARIUS               SHORT,NAME('"HEXD_DENARIUS"')  !                    
                         END
                     END                       

ERP_HORASEXTRA       FILE,DRIVER('BASIC','/ALWAYSQUOTE=OFF /COMMA=9 /ENDOFRECORDINQUOTE=OFF'),NAME(GLO:HORASEXTRA_ERP),PRE(ERPHEX),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
LEGAJO                      STRING(@N5)                    !                    
LIQUIDACION                 STRING(@S8)                    !                    
CODIGO                      STRING(@N3)                    !                    
BLANCO                      STRING(@N3)                    !                    
HORAS                       STRING(@N4)                    !                    
                         END
                     END                       

ERP_REEMBOLSO        FILE,DRIVER('BASIC','/ALWAYSQUOTE=OFF /COMMA=9 /ENDOFRECORDINQUOTE=OFF'),NAME(GLO:REEMBOLSO_ERP),PRE(ERPREM),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
LEGAJO                      STRING(@N5)                    !                    
LIQUIDACION                 STRING(@S8)                    !                    
CODIGO                      STRING(@N3)                    !                    
BLANCO                      STRING(@N3)                    !                    
REEMBOLSO                   STRING(@N4)                    !                    
                         END
                     END                       

CERTIFICADOS         FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."CERTIFICADOS"'),PRE(CER),BINDABLE,THREAD !                    
PK_CER_ID                KEY(CER:CER_ID),PRIMARY           !                    
FK_CER_DAU_ID            KEY(CER:CER_DAU_ID),DUP           !                    
CER_CERTIFICADOS            BLOB,BINARY,NAME('"CER_CERTIFICADOS"') !                    
Record                   RECORD,PRE()
CER_ID                      LONG,NAME('"CER_ID"')          !                    
CER_DAU_ID                  LONG,NAME('"CER_DAU_ID"')      !                    
CER_NROLEG                  SHORT,NAME('"CER_NROLEG"')     !                    
CER_OBSERVACION             CSTRING(256),NAME('"CER_OBSERVACION"') !                    
CER_FECHA                   STRING(8),NAME('"CER_FECHA"')  !                    
CER_FECHA_GROUP             GROUP,OVER(CER_FECHA)          !                    
CER_FECHA_DATE                DATE                         !                    
CER_FECHA_TIME                TIME                         !                    
                            END                            !                    
CER_FECHA_UPDATE            STRING(8),NAME('"CER_FECHA_UPDATE"') !                    
CER_FECHA_UPDATE_GROUP      GROUP,OVER(CER_FECHA_UPDATE)   !                    
CER_FECHA_UPDATE_DATE         DATE                         !                    
CER_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
CER_USUARIO                 CSTRING(13),NAME('"CER_USUARIO"') !                    
                         END
                     END                       

CONCEPTO_MEDICO      FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."CONCEPTO_MEDICO"'),PRE(CME),BINDABLE,THREAD !                    
PK_CME_ID                KEY(CME:CME_ID),PRIMARY           !                    
FK_CME_DAU_ID            KEY(CME:CME_DAU_ID),DUP           !                    
FK_CME_CODIGO            KEY(CME:CME_CODIGO),DUP           !                    
CME_CERTIFICADOS            BLOB,BINARY,NAME('"CME_CERTIFICADOS"') !                    
Record                   RECORD,PRE()
CME_ID                      LONG,NAME('"CME_ID"')          !                    
CME_DAU_ID                  LONG,NAME('"CME_DAU_ID"')      !                    
CME_NROLEG                  SHORT,NAME('"CME_NROLEG"')     !                    
CME_CODIGO                  CSTRING(6),NAME('"CME_CODIGO"') !                    
CME_DESCRIPCION             CSTRING(256),NAME('"CME_DESCRIPCION"') !                    
CME_MEDICO                  CSTRING(26),NAME('"CME_MEDICO"') !                    
CME_OBSERVACION             CSTRING(256),NAME('"CME_OBSERVACION"') !                    
CME_FECHA                   STRING(8),NAME('"CME_FECHA"')  !                    
CME_FECHA_GROUP             GROUP,OVER(CME_FECHA)          !                    
CME_FECHA_DATE                DATE                         !                    
CME_FECHA_TIME                TIME                         !                    
                            END                            !                    
CME_FECHA_UPDATE            STRING(8),NAME('"CME_FECHA_UPDATE"') !                    
CME_FECHA_UPDATE_GROUP      GROUP,OVER(CME_FECHA_UPDATE)   !                    
CME_FECHA_UPDATE_DATE         DATE                         !                    
CME_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
CME_USUARIO                 CSTRING(13),NAME('"CME_USUARIO"') !                    
                         END
                     END                       

DETALLE_AUSENCIA     FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DETALLE_AUSENCIA"'),PRE(DAU),BINDABLE,THREAD !                    
CLA_DAU                  KEY(DAU:DAU_NROLEG,-DAU:DAU_FECHA),DUP,NOCASE !                    
PK_DAU_ID                KEY(DAU:DAU_ID),PRIMARY           !                    
FK_DAU_NROLEG            KEY(DAU:DAU_NROLEG,DAU:DAU_ID),DUP !                    
FK_DAU_MOTIVO            KEY(DAU:DAU_MOTIVO),DUP           !                    
Record                   RECORD,PRE()
DAU_ID                      LONG,NAME('"DAU_ID"')          !                    
DAU_NROLEG                  SHORT,NAME('"DAU_NROLEG"')     !                    
DAU_ANIO                    LONG,NAME('"DAU_ANIO"')        !                    
DAU_INICIO                  STRING(8),NAME('"DAU_INICIO"') !                    
DAU_INICIO_GROUP            GROUP,OVER(DAU_INICIO)         !                    
DAU_INICIO_DATE               DATE                         !                    
DAU_INICIO_TIME               TIME                         !                    
                            END                            !                    
DAU_DIAS                    SHORT,NAME('"DAU_DIAS"')       !                    
DAU_HORAS                   SHORT,NAME('"DAU_HORAS"')      !                    
DAU_FIN                     STRING(8),NAME('"DAU_FIN"')    !                    
DAU_FIN_GROUP               GROUP,OVER(DAU_FIN)            !                    
DAU_FIN_DATE                  DATE                         !                    
DAU_FIN_TIME                  TIME                         !                    
                            END                            !                    
DAU_CONDICION               CSTRING(11),NAME('"DAU_CONDICION"') !                    
DAU_MOTIVO                  CSTRING(6),NAME('"DAU_MOTIVO"') !                    
DAU_DESCRIPCION             CSTRING(121),NAME('"DAU_DESCRIPCION"') !                    
DAU_OBSERVACIONES           CSTRING(256),NAME('"DAU_OBSERVACIONES"') !                    
DAU_ESTADO                  CSTRING(3),NAME('"DAU_ESTADO"') !                    
DAU_FECHA                   STRING(8),NAME('"DAU_FECHA"')  !                    
DAU_FECHA_GROUP             GROUP,OVER(DAU_FECHA)          !                    
DAU_FECHA_DATE                DATE                         !                    
DAU_FECHA_TIME                TIME                         !                    
                            END                            !                    
DAU_FECHA_UPDATE            STRING(8),NAME('"DAU_FECHA_UPDATE"') !                    
DAU_FECHA_UPDATE_GROUP      GROUP,OVER(DAU_FECHA_UPDATE)   !                    
DAU_FECHA_UPDATE_DATE         DATE                         !                    
DAU_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
DAU_USUARIO                 CSTRING(13),NAME('"DAU_USUARIO"') !                    
                         END
                     END                       

ENFERMEDADES         FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.ENFERMEDADES'),PRE(ENF),BINDABLE,THREAD !                    
PK_ENF_CODIGO            KEY(ENF:ENF_CODIGO),PRIMARY       !                    
Record                   RECORD,PRE()
ENF_CODIGO                  CSTRING(6),NAME('"ENF_CODIGO"') !                    
ENF_DESCRIPCION             CSTRING(201),NAME('"ENF_DESCRIPCION"') !                    
                         END
                     END                       

MOTIVO_AUSENCIA      FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."MOTIVO_AUSENCIA"'),PRE(MAU),BINDABLE,THREAD !                    
PK_MAU_DESCRIPCION       KEY(MAU:MAU_DESCRIPCION),DUP,NOCASE !                    
PK_MAU_CODIGO            KEY(MAU:MAU_CODIGO),PRIMARY       !                    
Record                   RECORD,PRE()
MAU_CODIGO                  CSTRING(6),NAME('"MAU_CODIGO"') !                    
MAU_DESCRIPCION             CSTRING(26),NAME('"MAU_DESCRIPCION"') !                    
                         END
                     END                       

pertel               FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('sue.pertel'),PRE(pertel),BINDABLE,THREAD !tabla Denarius      
pertel_emp               KEY(pertel:emp,pertel:nroleg,pertel:codtel) !                    
Record                   RECORD,PRE()
emp                         SHORT                          !                    
nroleg                      LONG                           !                    
codtel                      CSTRING(11)                    !                    
nrotel                      CSTRING(21)                    !                    
                         END
                     END                       

REGIMEN_LICENCIAS_ESPECIALES FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."REGIMEN_LICENCIAS_ESPECIALES"'),PRE(RLE),BINDABLE,THREAD !                    
PK_RLE_ID                KEY(RLE:RLE_ID),PRIMARY           !                    
FK_RLE_CONVENIO          KEY(RLE:RLE_CONVENIO),DUP         !                    
FK_RLE_MOTIVO            KEY(RLE:RLE_MOTIVO),DUP           !                    
Record                   RECORD,PRE()
RLE_ID                      SHORT,NAME('"RLE_ID"')         !                    
RLE_CONVENIO                SHORT,NAME('"RLE_CONVENIO"')   !                    
RLE_MOTIVO                  CSTRING(6),NAME('"RLE_MOTIVO"') !                    
RLE_DIAS                    SHORT,NAME('"RLE_DIAS"')       !                    
RLE_CONDICION               CSTRING(11),NAME('"RLE_CONDICION"') !                    
RLE_DESCRIPCION             CSTRING(256),NAME('"RLE_DESCRIPCION"') !                    
                         END
                     END                       

datadicn             FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('dad.datadicn'),PRE(datadicn),BINDABLE,THREAD !tabla Denarius      
datadicn_clave           KEY(datadicn:clave),DUP,NOCASE    !                    
datadicn_clavepk         KEY(datadicn:clave,datadicn:fechmod),NOCASE,PRIMARY !                    
datadicn_nombre          KEY(datadicn:nombre,datadicn:clave,datadicn:fecvig) !                    
datadicn_valor           KEY(datadicn:nombre,datadicn:valor,datadicn:clave,datadicn:fecvig) !                    
Record                   RECORD,PRE()
nombre                      CSTRING(11)                    !                    
clave                       CSTRING(31)                    !                    
fecvig                      DATE                           !                    
valor                       PDECIMAL(15)                   !                    
fechmod                     DATE                           !                    
horamod                     TIME                           !                    
usumod                      LONG                           !                    
                         END
                     END                       

LIQUIDALEG           FILE,DRIVER('MSSQL','/TRUSTEDCONNECTION=TRUE'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.LIQUIDALEG'),PRE(LIQ),BINDABLE,THREAD !                    
PK_LIQUIDALEG            KEY(LIQ:LIQ_LEGAJO,LIQ:LIQ_NROLIQ),PRIMARY !                    
Record                   RECORD,PRE()
LIQ_LEGAJO                  SHORT,NAME('"LIQ_LEGAJO"')     !                    
LIQ_NROLIQ                  LONG,NAME('"LIQ_NROLIQ"')      !                    
                         END
                     END                       

SQLBLOB              FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo.SQLBLOB'),PRE(SQB),BINDABLE,THREAD !                    
IMAGEN                      BLOB,BINARY                    !                    
Record                   RECORD,PRE()
VAR01                       CSTRING(201)                   !                    
VAR02                       CSTRING(201)                   !                    
VAR03                       CSTRING(201)                   !                    
VAR04                       CSTRING(201)                   !                    
VAR05                       CSTRING(201)                   !                    
VAR06                       CSTRING(201)                   !                    
VAR07                       CSTRING(201)                   !                    
VAR08                       CSTRING(201)                   !                    
VAR09                       CSTRING(201)                   !                    
VAR10                       CSTRING(201)                   !                    
                         END
                     END                       

PER_WEBREC           FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."PER_WEBREC"'),PRE(PWR),BINDABLE,THREAD !                    
PK_PER_WEBREC            KEY(PWR:PWR_LEGAJO,PWR:PWR_DFECHA,PWR:PWR_HFECHA),PRIMARY !                    
PWR_IMAGEN                  BLOB,BINARY,NAME('"PWR_IMAGEN"') !                    
Record                   RECORD,PRE()
PWR_LEGAJO                  SHORT,NAME('"PWR_LEGAJO"')     !                    
PWR_DFECHA                  STRING(8),NAME('"PWR_DFECHA"') !                    
PWR_DFECHA_GROUP            GROUP,OVER(PWR_DFECHA)         !                    
PWR_DFECHA_DATE               DATE                         !                    
PWR_DFECHA_TIME               TIME                         !                    
                            END                            !                    
PWR_HFECHA                  STRING(8),NAME('"PWR_HFECHA"') !                    
PWR_HFECHA_GROUP            GROUP,OVER(PWR_HFECHA)         !                    
PWR_HFECHA_DATE               DATE                         !                    
PWR_HFECHA_TIME               TIME                         !                    
                            END                            !                    
PWR_TEXTO                   CSTRING(131),NAME('"PWR_TEXTO"') !                    
PWR_ADJUNTO                 CSTRING(21),NAME('"PWR_ADJUNTO"') !                    
PWR_USER                    CSTRING(21),NAME('"PWR_USER"') !                    
PWR_UFECHA                  STRING(8),NAME('"PWR_UFECHA"') !                    
PWR_UFECHA_GROUP            GROUP,OVER(PWR_UFECHA)         !                    
PWR_UFECHA_DATE               DATE                         !                    
PWR_UFECHA_TIME               TIME                         !                    
                            END                            !                    
                         END
                     END                       

perdoc               FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('sue.perdoc'),PRE(perdoc),BINDABLE,THREAD !tabla Denarius      
perdoc_coddoc            KEY(perdoc:emp,perdoc:nroleg,perdoc:coddoc) !                    
perdoc_emp               KEY(perdoc:emp,perdoc:nroleg)     !                    
Record                   RECORD,PRE()
emp                         SHORT                          !                    
nroleg                      LONG                           !                    
id                          BYTE                           !                    
coddoc                      CSTRING(5)                     !                    
nrodoc                      LONG                           !                    
exped                       CSTRING(11)                    !                    
                         END
                     END                       

ADETALLE_LICENCIA    FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."DETALLE_LICENCIA"'),PRE(ADLIC),BINDABLE,THREAD !Alias               
PK_DETALLE_LICENCIA      KEY(ADLIC:DLIC_LEGAJO,ADLIC:DLIC_ANIO,ADLIC:DLIC_INICIO,ADLIC:DLIC_FIN),PRIMARY !                    
Record                   RECORD,PRE()
DLIC_LEGAJO                 SHORT,NAME('"DLIC_LEGAJO"')    !                    
DLIC_ANIO                   SHORT,NAME('"DLIC_ANIO"')      !                    
DLIC_INICIO                 STRING(8),NAME('"DLIC_INICIO"') !                    
DLIC_INICIO_GROUP           GROUP,OVER(DLIC_INICIO)        !                    
DLIC_INICIO_DATE              DATE                         !                    
DLIC_INICIO_TIME              TIME                         !                    
                            END                            !                    
DLIC_FIN                    STRING(8),NAME('"DLIC_FIN"')   !                    
DLIC_FIN_GROUP              GROUP,OVER(DLIC_FIN)           !                    
DLIC_FIN_DATE                 DATE                         !                    
DLIC_FIN_TIME                 TIME                         !                    
                            END                            !                    
DLIC_TOMA                   BYTE,NAME('"DLIC_TOMA"')       !                    
DLIC_ASUELDO                STRING(1),NAME('"DLIC_ASUELDO"') !                    
DLIC_COBRAR                 STRING(1),NAME('"DLIC_COBRAR"') !                    
DLIC_VIAJE                  STRING(1),NAME('"DLIC_VIAJE"') !                    
DLIC_FECHA_UPDATE           STRING(8),NAME('"DLIC_FECHA_UPDATE"') !                    
DLIC_FECHA_UPDATE_GROUP     GROUP,OVER(DLIC_FECHA_UPDATE)  !                    
DLIC_FECHA_UPDATE_DATE        DATE                         !                    
DLIC_FECHA_UPDATE_TIME        TIME                         !                    
                            END                            !                    
DLIC_FECHA                  STRING(8),NAME('"DLIC_FECHA"') !                    
DLIC_FECHA_GROUP            GROUP,OVER(DLIC_FECHA)         !                    
DLIC_FECHA_DATE               DATE                         !                    
DLIC_FECHA_TIME               TIME                         !                    
                            END                            !                    
DLIC_ESTADO                 STRING(1),NAME('"DLIC_ESTADO"') !                    
DLIC_USER                   STRING(20)                     !                    
                         END
                     END                       

SSEC::UserGroup      FILE,DRIVER('MSSQL'),OWNER('gea_pico,Personal,sa,bmast24'),NAME('dbo."_User"'),PRE(SUGrp_),BINDABLE,CREATE,THREAD !                    
NoKey                    KEY(SUGrp_:No),NOCASE,OPT,PRIMARY !                    
NameKey                  KEY(SUGrp_:LastName,SUGrp_:FirstName),NOCASE,OPT !                    
GroupNameKey             KEY(SUGrp_:GroupFlag,SUGrp_:LastName,SUGrp_:FirstName),NOCASE,OPT !                    
LevelNdx                 KEY(SUGrp_:Level),DUP,NOCASE,OPT  !                    
Record                   RECORD,PRE()
No                          LONG                           !User Number         
GroupFlag                   BYTE                           !Is this a group?    
LastName                    STRING(25)                     !Last Name           
FirstName                   STRING(15)                     !First Name (optional)
Password                    STRING(20)                     !Password            
Level                       SHORT                          !User Level (if not using Doors)
PasswordSize                BYTE                           !Size of Password Field (0=8).  Don't change this value if you don't fully understand the implications.
PasswordMaxAge              SHORT                          !How many days until password change is required (0=Never)
PasswordDate                LONG                           !When was the current password chosen?
PasswordTime                LONG                           !When was the current password chosen?
LogonDate                   LONG                           !Last successful logon date
LogonTime                   LONG                           !Last successful logon time
Failures                    SHORT                          !Failure count since last successful logon
Locked                      BYTE                           !Is this user locked out?
                         END
                     END                       

AHORAS_EXTRA         FILE,DRIVER('MSSQL'),OWNER(GLO:GEA_PICO_PERSONAL_CNX),NAME('dbo."HORAS_EXTRA"'),PRE(AHEX),BINDABLE,THREAD !                    
PK_HORAS_EXTRA           KEY(AHEX:HEX_ID),PRIMARY          !                    
Record                   RECORD,PRE()
HEX_ID                      SHORT,NAME('"HEX_ID"')         !                    
HEX_MES                     BYTE,NAME('"HEX_MES"')         !                    
HEX_ANIO                    SHORT,NAME('"HEX_ANIO"')       !                    
HEX_OBSERVACION             STRING(30),NAME('"HEX_OBSERVACION"') !                    
HEX_FECHA_UPDATE            STRING(8),NAME('"HEX_FECHA_UPDATE"') !                    
HEX_FECHA_UPDATE_GROUP      GROUP,OVER(HEX_FECHA_UPDATE)   !                    
HEX_FECHA_UPDATE_DATE         DATE                         !                    
HEX_FECHA_UPDATE_TIME         TIME                         !                    
                            END                            !                    
HEX_USER                    STRING(20),NAME('"HEX_USER"')  !                    
HEX_ESTADO                  STRING(1)                      !                    
HEX_LIQUIDACION             STRING(9)                      !                    
                         END
                     END                       

adatadicn            FILE,DRIVER('ODBC'),OWNER(GLO:ODBC_DENARIUS_CNX),NAME('dad.datadicn'),PRE(datadicnAlias),BINDABLE,THREAD !                    
datadicn_clave           KEY(datadicnAlias:clave),DUP,NOCASE !                    
datadicn_clavepk         KEY(datadicnAlias:clave,datadicnAlias:fechmod),NOCASE,PRIMARY !                    
datadicn_nombre          KEY(datadicnAlias:nombre,datadicnAlias:clave,datadicnAlias:fecvig) !                    
datadicn_valor           KEY(datadicnAlias:nombre,datadicnAlias:valor,datadicnAlias:clave,datadicnAlias:fecvig) !                    
Record                   RECORD,PRE()
nombre                      CSTRING(11)                    !                    
clave                       CSTRING(31)                    !                    
fecvig                      DATE                           !                    
valor                       PDECIMAL(15)                   !                    
fechmod                     DATE                           !                    
horamod                     TIME                           !                    
usumod                      LONG                           !                    
                         END
                     END                       

!endregion

!----- SuperSecurity Equates -----!
SSEC::DefaultMaxPwdAge          EQUATE(0)
SSEC::SupportPasswordExpiration EQUATE(0)
SSEC::AutoLogonFromNetwork      EQUATE(0)
!----- SuperSecurity Class -----!
Security             CLASS(SSEC::SecurityClass),MODULE('INFO$SEC.CLW'),LINK('INFO$SEC.CLW',_ABCLinkMode_)
MaxLogonFailures       SHORT
!--- Public Methods
AddCall                PROCEDURE(STRING ProgName, STRING ProcName, <LONG Request>, <STRING File>, <LONG PrimaryKey>, <STRING Description>, <BYTE AccessDenied>),LONG,PROC
CheckAccess            PROCEDURE(SHORT Door, <BYTE Override>, <STRING AccDenMsg>, <BYTE UseGlobMsg>),BYTE,DERIVED
CheckDoorUsed          FUNCTION,BYTE
CheckRuntimeAccess     PROCEDURE(STRING Prog, STRING Proc, <LONG Request>,<BYTE p_NoMessage>,<*BYTE Viewing>),BYTE
CheckUsersExist        PROCEDURE(<BYTE GroupFlag>),BYTE
CheckUserGroupsExist   PROCEDURE,BYTE
CompareEdit            PROCEDURE(LONG CallNo, STRING FileName, STRING FieldName, *? OldValue, *? NewValue)
FreeCache              PROCEDURE,DERIVED
GetCallRequest         PROCEDURE,STRING
GetCallUsername        PROCEDURE,STRING
GetFieldName           PROCEDURE(LONG p_N),STRING
GetFileName            PROCEDURE(LONG p_N),STRING
GetProcName            PROCEDURE(LONG p_N),STRING
GetProgName            PROCEDURE(LONG p_N),STRING
HaltNow                PROCEDURE(<STRING p_Message>),VIRTUAL
Init                   PROCEDURE
Kill                   PROCEDURE
LoadQs                 PROCEDURE
Logon                  PROCEDURE(<LONG p_Override>),LONG,PROC
PasswordSize           PROCEDURE(<BYTE p_Force>),BYTE
PrepareLogonOpenFiles  PROCEDURE,VIRTUAL  !EXTINCT
PrepareFilenames       PROCEDURE,VIRTUAL
Purge                  PROCEDURE(LONG Date,<BYTE Stream>)
PutCall                PROCEDURE(LONG CallNo, LONG Response, <LONG PrimaryKey>, <STRING Description>)
ResetOptions           PROCEDURE
RestoreUser            PROCEDURE(<BYTE GroupFlag>)
RestoreUserGroup       PROCEDURE
SaveUser               PROCEDURE(<BYTE GroupFlag>)
SaveUserGroup          PROCEDURE
UpdateRuntime          PROCEDURE(STRING Prog, STRING Proc, <BYTE UpdateForm>, <BYTE WatchShift>),DERIVED
Set_UserNo             PROCEDURE(LONG p_Value,BYTE p_Sync=1),DERIVED
!--- Protected Methods -----!
FetchUser              PROCEDURE(LONG UserNo),BYTE,DERIVED,PROTECTED
UpdateProcedure:Runtime PROCEDURE(BYTE UpdateForm),DERIVED,PROTECTED
!--- Private Methods
AddProcQ               PROCEDURE(<BYTE NoSort>),PRIVATE
AddProgQ               PROCEDURE(<BYTE NoSort>),PRIVATE
AddFieldQ              PROCEDURE(<BYTE NoSort>),PRIVATE
AddFileQ               PROCEDURE(<BYTE NoSort>),PRIVATE
GetFieldNo             PROCEDURE(LONG FileNo, STRING FieldName),LONG,PRIVATE
GetFileNo              PROCEDURE(STRING FileName),LONG,PRIVATE
GetProcNo              PROCEDURE(LONG ProgNo, STRING ProcName),LONG,PRIVATE
GetProgNo              PROCEDURE(STRING ProgName),LONG,PRIVATE
LoadFieldQ             PROCEDURE,PRIVATE
LoadFileQ              PROCEDURE,PRIVATE
LoadProcQ              PROCEDURE,PRIVATE
LoadProgQ              PROCEDURE,PRIVATE
                     END!CLASS
SSEC::ViewRecord     BYTE,THREAD
WE::MustClose       long
WE::CantCloseNow    long
Access:CLIENTE       &FileManager,THREAD                   ! FileManager for CLIENTE
Relate:CLIENTE       &RelationManager,THREAD               ! RelationManager for CLIENTE
Access:SUMINISTRO    &FileManager,THREAD                   ! FileManager for SUMINISTRO
Relate:SUMINISTRO    &RelationManager,THREAD               ! RelationManager for SUMINISTRO
Access:EMPLEADOS     &FileManager,THREAD                   ! FileManager for EMPLEADOS
Relate:EMPLEADOS     &RelationManager,THREAD               ! RelationManager for EMPLEADOS
Access:Empleado_Comprobante &FileManager,THREAD            ! FileManager for Empleado_Comprobante
Relate:Empleado_Comprobante &RelationManager,THREAD        ! RelationManager for Empleado_Comprobante
Access:TMPUsosMultiples &FileManager,THREAD                ! FileManager for TMPUsosMultiples
Relate:TMPUsosMultiples &RelationManager,THREAD            ! RelationManager for TMPUsosMultiples
Access:TXDEB         &FileManager,THREAD                   ! FileManager for TXDEB
Relate:TXDEB         &RelationManager,THREAD               ! RelationManager for TXDEB
Access:DESFAC        &FileManager,THREAD                   ! FileManager for DESFAC
Relate:DESFAC        &RelationManager,THREAD               ! RelationManager for DESFAC
Access:DEBITO_EMPLEADOS &FileManager,THREAD                ! FileManager for DEBITO_EMPLEADOS
Relate:DEBITO_EMPLEADOS &RelationManager,THREAD            ! RelationManager for DEBITO_EMPLEADOS
Access:COMPROBANTE   &FileManager,THREAD                   ! FileManager for COMPROBANTE
Relate:COMPROBANTE   &RelationManager,THREAD               ! RelationManager for COMPROBANTE
Access:per           &FileManager,THREAD                   ! FileManager for per
Relate:per           &RelationManager,THREAD               ! RelationManager for per
Access:datpers       &FileManager,THREAD                   ! FileManager for datpers
Relate:datpers       &RelationManager,THREAD               ! RelationManager for datpers
Access:CONVENIO      &FileManager,THREAD                   ! FileManager for CONVENIO
Relate:CONVENIO      &RelationManager,THREAD               ! RelationManager for CONVENIO
Access:DETALLE_LICENCIA &FileManager,THREAD                ! FileManager for DETALLE_LICENCIA
Relate:DETALLE_LICENCIA &RelationManager,THREAD            ! RelationManager for DETALLE_LICENCIA
Access:DIAS_VIAJE    &FileManager,THREAD                   ! FileManager for DIAS_VIAJE
Relate:DIAS_VIAJE    &RelationManager,THREAD               ! RelationManager for DIAS_VIAJE
Access:LICENCIA      &FileManager,THREAD                   ! FileManager for LICENCIA
Relate:LICENCIA      &RelationManager,THREAD               ! RelationManager for LICENCIA
Access:PARAMETRO_DIAS_VIAJE &FileManager,THREAD            ! FileManager for PARAMETRO_DIAS_VIAJE
Relate:PARAMETRO_DIAS_VIAJE &RelationManager,THREAD        ! RelationManager for PARAMETRO_DIAS_VIAJE
Access:PARAMETRO_LICENCIA &FileManager,THREAD              ! FileManager for PARAMETRO_LICENCIA
Relate:PARAMETRO_LICENCIA &RelationManager,THREAD          ! RelationManager for PARAMETRO_LICENCIA
Access:SECTOR        &FileManager,THREAD                   ! FileManager for SECTOR
Relate:SECTOR        &RelationManager,THREAD               ! RelationManager for SECTOR
Access:FERIADOS      &FileManager,THREAD                   ! FileManager for FERIADOS
Relate:FERIADOS      &RelationManager,THREAD               ! RelationManager for FERIADOS
Access:empch         &FileManager,THREAD                   ! FileManager for empch
Relate:empch         &RelationManager,THREAD               ! RelationManager for empch
Access:empc          &FileManager,THREAD                   ! FileManager for empc
Relate:empc          &RelationManager,THREAD               ! RelationManager for empc
Access:CTA_CONTABLE  &FileManager,THREAD                   ! FileManager for CTA_CONTABLE
Relate:CTA_CONTABLE  &RelationManager,THREAD               ! RelationManager for CTA_CONTABLE
Access:PROVISION     &FileManager,THREAD                   ! FileManager for PROVISION
Relate:PROVISION     &RelationManager,THREAD               ! RelationManager for PROVISION
Access:DETALLE_PROVISION &FileManager,THREAD               ! FileManager for DETALLE_PROVISION
Relate:DETALLE_PROVISION &RelationManager,THREAD           ! RelationManager for DETALLE_PROVISION
Access:TXTAsiento    &FileManager,THREAD                   ! FileManager for TXTAsiento
Relate:TXTAsiento    &RelationManager,THREAD               ! RelationManager for TXTAsiento
Access:SSEC::UserInGroup &FileManager,THREAD               ! FileManager for SSEC::UserInGroup
Relate:SSEC::UserInGroup &RelationManager,THREAD           ! RelationManager for SSEC::UserInGroup
Access:SSEC::Door    &FileManager,THREAD                   ! FileManager for SSEC::Door
Relate:SSEC::Door    &RelationManager,THREAD               ! RelationManager for SSEC::Door
Access:SSEC::DoorGroup &FileManager,THREAD                 ! FileManager for SSEC::DoorGroup
Relate:SSEC::DoorGroup &RelationManager,THREAD             ! RelationManager for SSEC::DoorGroup
Access:SSEC::Access  &FileManager,THREAD                   ! FileManager for SSEC::Access
Relate:SSEC::Access  &RelationManager,THREAD               ! RelationManager for SSEC::Access
Access:SSEC::Program &FileManager,THREAD                   ! FileManager for SSEC::Program
Relate:SSEC::Program &RelationManager,THREAD               ! RelationManager for SSEC::Program
Access:SSEC::Procedure &FileManager,THREAD                 ! FileManager for SSEC::Procedure
Relate:SSEC::Procedure &RelationManager,THREAD             ! RelationManager for SSEC::Procedure
Access:SSEC::File    &FileManager,THREAD                   ! FileManager for SSEC::File
Relate:SSEC::File    &RelationManager,THREAD               ! RelationManager for SSEC::File
Access:SSEC::Field   &FileManager,THREAD                   ! FileManager for SSEC::Field
Relate:SSEC::Field   &RelationManager,THREAD               ! RelationManager for SSEC::Field
Access:SSEC::PwdLog  &FileManager,THREAD                   ! FileManager for SSEC::PwdLog
Relate:SSEC::PwdLog  &RelationManager,THREAD               ! RelationManager for SSEC::PwdLog
Access:SSEC::Call    &FileManager,THREAD                   ! FileManager for SSEC::Call
Relate:SSEC::Call    &RelationManager,THREAD               ! RelationManager for SSEC::Call
Access:SSEC::Edit    &FileManager,THREAD                   ! FileManager for SSEC::Edit
Relate:SSEC::Edit    &RelationManager,THREAD               ! RelationManager for SSEC::Edit
Access:SSEC::User    &FileManager,THREAD                   ! FileManager for SSEC::User
Relate:SSEC::User    &RelationManager,THREAD               ! RelationManager for SSEC::User
Access:ERP_ASIENTO   &FileManager,THREAD                   ! FileManager for ERP_ASIENTO
Relate:ERP_ASIENTO   &RelationManager,THREAD               ! RelationManager for ERP_ASIENTO
Access:HORASEXTRASCVS &FileManager,THREAD                  ! FileManager for HORASEXTRASCVS
Relate:HORASEXTRASCVS &RelationManager,THREAD              ! RelationManager for HORASEXTRASCVS
Access:DETALLE_HORAS_EXTRA &FileManager,THREAD             ! FileManager for DETALLE_HORAS_EXTRA
Relate:DETALLE_HORAS_EXTRA &RelationManager,THREAD         ! RelationManager for DETALLE_HORAS_EXTRA
Access:HORAS_EXTRA   &FileManager,THREAD                   ! FileManager for HORAS_EXTRA
Relate:HORAS_EXTRA   &RelationManager,THREAD               ! RelationManager for HORAS_EXTRA
Access:HORAS_EXTRA_DENARIUS &FileManager,THREAD            ! FileManager for HORAS_EXTRA_DENARIUS
Relate:HORAS_EXTRA_DENARIUS &RelationManager,THREAD        ! RelationManager for HORAS_EXTRA_DENARIUS
Access:DETALLE_HORAS_EXTRAS &FileManager,THREAD            ! FileManager for DETALLE_HORAS_EXTRAS
Relate:DETALLE_HORAS_EXTRAS &RelationManager,THREAD        ! RelationManager for DETALLE_HORAS_EXTRAS
Access:ERP_HORASEXTRA &FileManager,THREAD                  ! FileManager for ERP_HORASEXTRA
Relate:ERP_HORASEXTRA &RelationManager,THREAD              ! RelationManager for ERP_HORASEXTRA
Access:ERP_REEMBOLSO &FileManager,THREAD                   ! FileManager for ERP_REEMBOLSO
Relate:ERP_REEMBOLSO &RelationManager,THREAD               ! RelationManager for ERP_REEMBOLSO
Access:CERTIFICADOS  &FileManager,THREAD                   ! FileManager for CERTIFICADOS
Relate:CERTIFICADOS  &RelationManager,THREAD               ! RelationManager for CERTIFICADOS
Access:CONCEPTO_MEDICO &FileManager,THREAD                 ! FileManager for CONCEPTO_MEDICO
Relate:CONCEPTO_MEDICO &RelationManager,THREAD             ! RelationManager for CONCEPTO_MEDICO
Access:DETALLE_AUSENCIA &FileManager,THREAD                ! FileManager for DETALLE_AUSENCIA
Relate:DETALLE_AUSENCIA &RelationManager,THREAD            ! RelationManager for DETALLE_AUSENCIA
Access:ENFERMEDADES  &FileManager,THREAD                   ! FileManager for ENFERMEDADES
Relate:ENFERMEDADES  &RelationManager,THREAD               ! RelationManager for ENFERMEDADES
Access:MOTIVO_AUSENCIA &FileManager,THREAD                 ! FileManager for MOTIVO_AUSENCIA
Relate:MOTIVO_AUSENCIA &RelationManager,THREAD             ! RelationManager for MOTIVO_AUSENCIA
Access:pertel        &FileManager,THREAD                   ! FileManager for pertel
Relate:pertel        &RelationManager,THREAD               ! RelationManager for pertel
Access:REGIMEN_LICENCIAS_ESPECIALES &FileManager,THREAD    ! FileManager for REGIMEN_LICENCIAS_ESPECIALES
Relate:REGIMEN_LICENCIAS_ESPECIALES &RelationManager,THREAD ! RelationManager for REGIMEN_LICENCIAS_ESPECIALES
Access:datadicn      &FileManager,THREAD                   ! FileManager for datadicn
Relate:datadicn      &RelationManager,THREAD               ! RelationManager for datadicn
Access:LIQUIDALEG    &FileManager,THREAD                   ! FileManager for LIQUIDALEG
Relate:LIQUIDALEG    &RelationManager,THREAD               ! RelationManager for LIQUIDALEG
Access:SQLBLOB       &FileManager,THREAD                   ! FileManager for SQLBLOB
Relate:SQLBLOB       &RelationManager,THREAD               ! RelationManager for SQLBLOB
Access:PER_WEBREC    &FileManager,THREAD                   ! FileManager for PER_WEBREC
Relate:PER_WEBREC    &RelationManager,THREAD               ! RelationManager for PER_WEBREC
Access:perdoc        &FileManager,THREAD                   ! FileManager for perdoc
Relate:perdoc        &RelationManager,THREAD               ! RelationManager for perdoc
Access:ADETALLE_LICENCIA &FileManager,THREAD               ! FileManager for ADETALLE_LICENCIA
Relate:ADETALLE_LICENCIA &RelationManager,THREAD           ! RelationManager for ADETALLE_LICENCIA
Access:SSEC::UserGroup &FileManager,THREAD                 ! FileManager for SSEC::UserGroup
Relate:SSEC::UserGroup &RelationManager,THREAD             ! RelationManager for SSEC::UserGroup
Access:AHORAS_EXTRA  &FileManager,THREAD                   ! FileManager for AHORAS_EXTRA
Relate:AHORAS_EXTRA  &RelationManager,THREAD               ! RelationManager for AHORAS_EXTRA
Access:adatadicn     &FileManager,THREAD                   ! FileManager for adatadicn
Relate:adatadicn     &RelationManager,THREAD               ! RelationManager for adatadicn

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  
  
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\infoper.INI', NVD_INI)                    ! Configure INIManager to use INI file
  DctInit
  Security.Init
  GLO:GEA_PICO_GEACORPICO_CNX='GEA_PICO,Geacorpico;App=Infoper'
  GLO:GEA_PICO_PERSONAL_CNX='GEA_PICO,Personal,sa,bmast24;App=Infoper'
  GLO:ODBC_DENARIUS_CNX='Denarius,ideafix,ideafix1;App=Infoper'
  Main
  INIMgr.Update
  Security.Kill
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

