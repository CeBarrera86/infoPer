   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
INCLUDE('CWSYNCHC.INC'),ONCE

   MAP
     MODULE('MNREL_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('MNREL001.CLW')
Main                   PROCEDURE   !
     END
     MODULE('MNREL024.CLW')
UltimaLectura          FUNCTION(SHORT,SHORT),STRING   !
     END
       MODULE('Claevol.Lib')
       Exportar(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP)
       ExportarVII(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP,*QUEUE)
       END
   END

glo:TMPReloj         STRING(40)
Glo:Reloj            SHORT
Glo:Sede             SHORT
glo:SEI_LeerReloj    STRING(1)
glo:SEI_Modificar_Datos STRING(1)
glo:SEI_Sacar_Partes STRING(1)
glo:SEI_Armar_Partes STRING(1)
glo:super            BYTE
glo:nsector          SHORT
glo:fecha            DATE
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
Emplea               FILE,DRIVER('Btrieve'),NAME('g:\pers\emplea.dat'),PRE(EPD),BINDABLE,THREAD !ARCHIVO EMPLEADOS - BTRIEVE-
Key1_sue                 KEY(EPD:RCod1_Sue),NOCASE,OPT,PRIMARY !Servicio Legajo     
KeyT1_Sue                KEY(EPD:Nrotar1_sue),NOCASE,OPT   !x tarjeta1          
KeyT2_Sue                KEY(EPD:Nrotar2_sue),NOCASE,OPT   !                    
KeyT3_Sue                KEY(EPD:Nrotar3_sue),NOCASE,OPT   !                    
key4_sue                 KEY(EPD:nombre_sue),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Cod1_SUE                    GROUP                          !                    
Servic_sue                    STRING(@n01)                 !                    
Legajo_sue                    STRING(@n03)                 !                    
                            END                            !                    
RCod1_Sue                   STRING(@n04),OVER(Cod1_SUE)    !                    
Cod2_sue                    GROUP                          !                    
Tipo_sue                      STRING(@n01)                 !                    
Sector_Sue                    STRING(@n02)                 !                    
Seccion_sue                   STRING(@n01)                 !                    
                            END                            !                    
Cod3_Sue                    GROUP                          !                    
Nrotar1_sue                   STRING(@n05)                 !                    
Nrotar2_sue                   STRING(@N05)                 !                    
Nrotar3_sue                   STRING(@N05)                 !                    
                            END                            !                    
CCosto_sue                  STRING(@n02)                   !                    
Usua_sue                    STRING(@n011)                  !                    
fami_sue                    STRING(@n02)                   !                    
seguro_sue                  STRING(@n01)                   !                    
licen_sue                   STRING(@n03)                   !                    
jubi_sue                    STRING(@n02)                   !                    
nombre_sue                  STRING(30)                     !                    
domici_sue                  STRING(25)                     !                    
locali_sue                  STRING(20)                     !                    
sexo_sue                    STRING(1)                      !                    
nacion_sue                  STRING(1)                      !                    
Tipodoc_sue                 STRING(2)                      !                    
cuil_sue                    STRING(@n011)                  !                    
feing1_sue                  STRING(@n06)                   !                    
feing2_sue                  STRING(@n06)                   !                    
feing3_sue                  STRING(@n06)                   !                    
feing4_sue                  STRING(@n06)                   !                    
fenaci_sue                  STRING(@n06)                   !                    
febaja_sue                  STRING(@n06)                   !                    
ccateg_sue                  STRING(2)                      !                    
salari_sue                  STRING(10)                     !                    
reten_sue                   STRING(10)                     !                    
nobrso_sue                  STRING(@n08)                   !                    
cobrso_sue                  STRING(@n02)                   !                    
cjubil_sue                  STRING(@n01)                   !                    
activo_sue                  STRING(1)                      !                    
cobro_sue                   STRING(@n01)                   !                    
Conven_sue                  STRING(@n01)                   !                    
antcat_sue                  STRING(@n06)                   !                    
cargo_sue                   STRING(30)                     !                    
porbae_sue                  STRING(@n05v2)                 !                    
tipsem_sue                  STRING(1)                      !                    
tturno_sue                  STRING(1)                      !                    
cturno_sue                  STRING(1)                      !                    
autoex_sue                  STRING(1)                      !                    
                         END
                     END                       

TMPUsosMultiples     FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo.TMPUsosMultiples'),PRE(TUM),BINDABLE,CREATE,THREAD !                    
PK_TMPUsosMultiples      KEY(TUM:Col01,TUM:Col02,TUM:Col03),PRIMARY !                    
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
Col31                       CSTRING(51)                    !                    
Col32                       CSTRING(51)                    !                    
Col33                       CSTRING(51)                    !                    
Col34                       CSTRING(51)                    !                    
Col35                       CSTRING(51)                    !                    
Col36                       CSTRING(51)                    !                    
Col37                       CSTRING(51)                    !                    
Col38                       CSTRING(51)                    !                    
Col39                       CSTRING(51)                    !                    
Col40                       CSTRING(51)                    !                    
                         END
                     END                       

TMPReloj             FILE,DRIVER('ASCII'),NAME(glo:TMPReloj),PRE(TPR),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Tarjeta                     STRING(@n05)                   !                    
Espacio1                    STRING(1)                      !                    
Fecha                       GROUP                          !                    
Dia                           STRING(@n02)                 !                    
R1                            STRING(1)                    !                    
Mes                           STRING(@n02)                 !                    
R2                            STRING(1)                    !                    
Ano                           STRING(@n04)                 !                    
                            END                            !                    
Espacio2                    STRING(1)                      !                    
HHora                       STRING(5)                      !                    
HGrupo                      GROUP,OVER(HHora)              !                    
GHH                           STRING(@n02)                 !                    
GG                            STRING(1)                    !                    
GMM                           STRING(@n02)                 !                    
                            END                            !                    
Horita                      STRING(@t1),OVER(HHora)        !                    
Espacio3                    STRING(1)                      !                    
Relleno                     STRING(5)                      !                    
                         END
                     END                       

TMP_Personal         FILE,DRIVER('MSSQL'),OWNER('gea_pico,geacorpico,sa,bmast24'),NAME('dbo."TMP_Personal"'),PRE(TPE),BINDABLE,CREATE,THREAD !                    
Record                   RECORD,PRE()
Col01                       CSTRING(51)                    !                    
col02                       CSTRING(51)                    !                    
col03                       CSTRING(51)                    !                    
col04                       CSTRING(51)                    !                    
col05                       CSTRING(51)                    !                    
col06                       CSTRING(51)                    !                    
col07                       CSTRING(51)                    !                    
                         END
                     END                       

HISRELOJ             FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo.HISRELOJ'),PRE(HIS),BINDABLE,THREAD !                    
PK_HISRELOJ              KEY(HIS:HIS_id),PRIMARY           !                    
IX_FECHA                 KEY(HIS:HIS_Fecha),DUP            !                    
IX_Reloj_Tarjeta         KEY(HIS:HIS_Reloj,HIS:HIS_Tarjeta),DUP !                    
IX_Reloj_Fecha_Tarjeta   KEY(HIS:HIS_Reloj,HIS:HIS_Fecha,HIS:HIS_Tarjeta),DUP !                    
IX_Reloj_Fecha_Tarjeta_Hora KEY(HIS:HIS_Reloj,HIS:HIS_Fecha,HIS:HIS_Tarjeta,HIS:HIS_Hora) !                    
IX_HISRELOJFechaD        KEY(HIS:HIS_Reloj,HIS:HIS_Fecha_Date),DUP !                    
KEY__WA_Sys_HIS_Tarjeta_1CBC4616 KEY(HIS:HIS_Tarjeta),DUP,NAME('_WA_Sys_HIS_Tarjeta_1CBC4616') !                    
KEY__WA_Sys_HIS_Legajo_1CBC4616 KEY(HIS:HIS_Legajo),DUP,NAME('_WA_Sys_HIS_Legajo_1CBC4616') !                    
IX_HISRELOJ              KEY(HIS:HIS_Fecha,HIS:HIS_Legajo,HIS:HIS_Hora),DUP !                    
Record                   RECORD,PRE()
HIS_id                      LONG,NAME('"HIS_id"')          !                    
HIS_Reloj                   SHORT,NAME('"HIS_Reloj"')      !                    
HIS_Tarjeta                 LONG,NAME('"HIS_Tarjeta"')     !                    
HIS_Fecha                   STRING(10),NAME('"HIS_Fecha"') !                    
HIS_Hora                    STRING(5),NAME('"HIS_Hora"')   !                    
HIS_Reloj1                  STRING(2),NAME('"HIS_Reloj1"') !                    
HIS_Reloj2                  STRING(2),NAME('"HIS_Reloj2"') !                    
HIS_Legajo                  SHORT,NAME('"HIS_Legajo"')     !                    
HIS_Fecha_Date              STRING(8),NAME('"HIS_Fecha_Date"') !                    
HIS_Fecha_Date_GROUP        GROUP,OVER(HIS_Fecha_Date)     !                    
HIS_Fecha_Date_DATE           DATE                         !                    
HIS_Fecha_Date_TIME           TIME                         !                    
                            END                            !                    
                         END
                     END                       

HORADEV              FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo."HORADEV"'),PRE(HSD),BINDABLE,THREAD !horas a devolver    
PK_HORADEV               KEY(HSD:SERVILEG,HSD:FECHA,HSD:HDESDE),NOCASE,OPT,PRIMARY !                    
Record                   RECORD,PRE()
SERVILEG                    STRING(4)                      !                    
RSERVILEG                   GROUP,OVER(SERVILEG)           !                    
SERVICIO                      STRING(@n1)                  !                    
LEGAJO                        STRING(@n3)                  !                    
                            END                            !                    
FECHA                       LONG                           !                    
HDESDE                      LONG                           !                    
HHASTA                      LONG                           !                    
TIPO                        STRING(1)                      !                    
MINUTOS                     SHORT                          !                    
OBSERVACION                 STRING(20)                     !                    
FEC_ALTA                    LONG                           !                    
HOR_ALTA                    LONG                           !                    
FEC_MODIF                   LONG                           !                    
HOR_MODIF                   LONG                           !                    
                         END
                     END                       

LGRELOJ              FILE,DRIVER('MSSQL'),OWNER('gea_pico,personal,sa,bmast24'),NAME('dbo.LGRELOJ'),PRE(LGR),BINDABLE,CREATE,THREAD !                    
IX_LGRELOJ               KEY(LGR:NRELOJ),DUP               !                    
Record                   RECORD,PRE()
NRELOJ                      LONG                           !                    
FECHAR                      STRING(8)                      !                    
FECHAR_GROUP                GROUP,OVER(FECHAR)             !                    
FECHAR_DATE                   DATE                         !                    
FECHAR_TIME                   TIME                         !                    
                            END                            !                    
                         END
                     END                       

Reloj                FILE,DRIVER('Btrieve'),NAME('g:\pers\relojes.dat'),PRE(REL),CREATE,BINDABLE,THREAD !Encabezado del btrieve
K_Relo                   KEY(REL:Fecha,REL:Hora_Group,REL:Nro_Tarjeta),NOCASE,OPT,PRIMARY !Fecha Hora Tarjeta  
K_Tarjeta                KEY(REL:Nro_Tarjeta),DUP,NOCASE,OPT !Por Tarjeta         
Record                   RECORD,PRE()
KGeneral                    GROUP                          !                    
Fechota                       GROUP                        !                    
Fecha                           STRING(@d11)               !                    
Hora_Group                      GROUP                      !                    
HH                                STRING(@n02)             !                    
MM                                STRING(@n02)             !                    
                                END                        !                    
Hora                            STRING(@T2.),OVER(Hora_Group) !                    
                              END                          !                    
Nro_Reloj                     STRING(@n01)                 !                    
Nro_Tarjeta                   STRING(@n04)                 !                    
                            END                            !                    
                         END
                     END                       

EMPLEADOS            FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo.EMPLEADOS'),PRE(EMP),BINDABLE,CREATE,THREAD !                    
IX_EMPLEADOS_NOM         KEY(EMP:EMP_Nombre),DUP,NOCASE,OPT !                    
PK_EMPLEADOS             KEY(EMP:EMP_Servicio,EMP:EMP_Legajo),PRIMARY !                    
Record                   RECORD,PRE()
EMP_Legajo                  SHORT,NAME('"EMP_Legajo"')     !                    
EMP_Servicio                SHORT,NAME('"EMP_Servicio"')   !                    
EMP_Sector                  SHORT,NAME('"EMP_Sector"')     !                    
EMP_Seccion                 SHORT,NAME('"EMP_Seccion"')    !                    
EMP_Nombre                  STRING(50),NAME('"EMP_Nombre"') !                    
EMP_Calle                   STRING(20),NAME('"EMP_Calle"') !                    
EMP_Numero                  SHORT,NAME('"EMP_Numero"')     !                    
EMP_Piso                    STRING(10),NAME('"EMP_Piso"')  !                    
EMP_Dpto                    STRING(10),NAME('"EMP_Dpto"')  !                    
EMP_Localidad               SHORT,NAME('"EMP_Localidad"')  !                    
EMP_Telefono                STRING(10),NAME('"EMP_Telefono"') !                    
EMP_Celular                 STRING(10),NAME('"EMP_Celular"') !                    
EMP_Sexo                    STRING(1),NAME('"EMP_Sexo"')   !                    
EMP_Cuil                    STRING(11),NAME('"EMP_Cuil"')  !                    
EMP_Nacionalidad            STRING(1),NAME('"EMP_Nacionalidad"') !                    
EMP_Tipo_Documento          BYTE,NAME('"EMP_Tipo_Documento"') !                    
EMP_NDocumento              STRING(10),NAME('"EMP_NDocumento"') !                    
EMP_Fecha_Ingreso           STRING(8),NAME('"EMP_Fecha_Ingreso"') !                    
EMP_Fecha_Ingreso_GROUP     GROUP,OVER(EMP_Fecha_Ingreso)  !                    
EMP_Fecha_Ingreso_DATE        DATE                         !                    
EMP_Fecha_Ingreso_TIME        TIME                         !                    
                            END                            !                    
EMP_Fecha_Nacimiento        STRING(8),NAME('"EMP_Fecha_Nacimiento"') !                    
EMP_Fecha_Nacimiento_GROUP  GROUP,OVER(EMP_Fecha_Nacimiento) !                    
EMP_Fecha_Nacimiento_DATE     DATE                         !                    
EMP_Fecha_Nacimiento_TIME     TIME                         !                    
                            END                            !                    
EMP_Fecha_Base              STRING(8),NAME('"EMP_Fecha_Base"') !                    
EMP_Fecha_Base_GROUP        GROUP,OVER(EMP_Fecha_Base)     !                    
EMP_Fecha_Base_DATE           DATE                         !                    
EMP_Fecha_Base_TIME           TIME                         !                    
                            END                            !                    
EMP_Fecha_Base_Licencia     STRING(8),NAME('"EMP_Fecha_Base_Licencia"') !                    
EMP_Fecha_Base_Licencia_GROUP GROUP,OVER(EMP_Fecha_Base_Licencia) !                    
EMP_Fecha_Base_Licencia_DATE  DATE                         !                    
EMP_Fecha_Base_Licencia_TIME  TIME                         !                    
                            END                            !                    
EMP_Fecha_Para_Ascenso      STRING(8),NAME('"EMP_Fecha_Para_Ascenso"') !                    
EMP_Fecha_Para_Ascenso_GROUP GROUP,OVER(EMP_Fecha_Para_Ascenso) !                    
EMP_Fecha_Para_Ascenso_DATE   DATE                         !                    
EMP_Fecha_Para_Ascenso_TIME   TIME                         !                    
                            END                            !                    
EMP_Fecha_Baja              STRING(8),NAME('"EMP_Fecha_Baja"') !                    
EMP_Fecha_Baja_GROUP        GROUP,OVER(EMP_Fecha_Baja)     !                    
EMP_Fecha_Baja_DATE           DATE                         !                    
EMP_Fecha_Baja_TIME           TIME                         !                    
                            END                            !                    
EMP_Convenio                SHORT,NAME('"EMP_Convenio"')   !                    
EMP_Categoria               SHORT,NAME('"EMP_Categoria"')  !                    
EMP_Cargo                   SHORT,NAME('"EMP_Cargo"')      !                    
EMP_Banco                   SHORT,NAME('"EMP_Banco"')      !                    
EMP_Tipo_Cuenta             SHORT,NAME('"EMP_Tipo_Cuenta"') !                    
EMP_Numero_Cuenta           STRING(20),NAME('"EMP_Numero_Cuenta"') !                    
EMP_TipoSemana              STRING(1),NAME('"EMP_TipoSemana"') !                    
EMP_HExtras                 BYTE,NAME('"EMP_HExtras"')     !                    
EMP_Fecha_Cambio_Categoria  STRING(8),NAME('"EMP_Fecha_Cambio_Categoria"') !                    
EMP_Fecha_Cambio_Categoria_GROUP GROUP,OVER(EMP_Fecha_Cambio_Categoria) !                    
EMP_Fecha_Cambio_Categoria_DATE DATE                       !                    
EMP_Fecha_Cambio_Categoria_TIME TIME                       !                    
                            END                            !                    
EMP_Jubilacion              BYTE,NAME('"EMP_Jubilacion"')  !                    
EMP_Ley19032                BYTE,NAME('"EMP_Ley19032"')    !                    
EMP_Reparto                 BYTE,NAME('"EMP_Reparto"')     !                    
EMP_ObraSocial              SHORT,NAME('"EMP_ObraSocial"') !                    
EMP_Lugar                   SHORT,NAME('"EMP_Lugar"')      !                    
EMP_Activo                  STRING(1)                      !                    
EMP_Tarjeta                 LONG                           !                    
                         END
                     END                       

SEDEINI              FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,sa,bmast24'),NAME('dbo.SEDEINI'),PRE(SEI),BINDABLE,CREATE,THREAD !                    
PK_SEDEINI               KEY(SEI:SEI_Sede),PRIMARY         !                    
KEY__WA_Sys_SED_Reloj_2180FB33 KEY(SEI:SEI_Reloj),DUP,NAME('_WA_Sys_SED_Reloj_2180FB33') !                    
KEY__WA_Sys_SED_RutaRegis_2180FB33 KEY(SEI:SEI_RutaRegis),DUP,NAME('_WA_Sys_SED_RutaRegis_2180FB33') !                    
KEY__WA_Sys_SED_NombreRegis_2180FB33 KEY(SEI:SEI_NombreRegis),DUP,NAME('_WA_Sys_SED_NombreRegis_2180FB33') !                    
KEY__WA_Sys_SED_LeerReloj_2180FB33 KEY(SEI:SEI_LeerReloj),DUP,NAME('_WA_Sys_SED_LeerReloj_2180FB33') !                    
KEY__WA_Sys_SED_Modificar_Datos_2180FB33 KEY(SEI:SEI_Modificar_Datos),DUP,NAME('_WA_Sys_SED_Modificar_Datos_2180FB33') !                    
KEY__WA_Sys_SED_Sacar_Partes_2180FB33 KEY(SEI:SEI_Sacar_Partes),DUP,NAME('_WA_Sys_SED_Sacar_Partes_2180FB33') !                    
KEY__WA_Sys_SED_Armar_Partes_2180FB33 KEY(SEI:SEI_Armar_Partes),DUP,NAME('_WA_Sys_SED_Armar_Partes_2180FB33') !                    
Record                   RECORD,PRE()
SEI_Sede                    SHORT,NAME('"SEI_Sede"')       !                    
SEI_Reloj                   SHORT,NAME('"SEI_Reloj"')      !                    
SEI_RutaRegis               STRING(50),NAME('"SEI_RutaRegis"') !                    
SEI_NombreRegis             STRING(50),NAME('"SEI_NombreRegis"') !                    
SEI_LeerReloj               STRING(1),NAME('"SEI_LeerReloj"') !                    
SEI_Modificar_Datos         STRING(1),NAME('"SEI_Modificar_Datos"') !                    
SEI_Sacar_Partes            STRING(1),NAME('"SEI_Sacar_Partes"') !                    
SEI_Armar_Partes            STRING(1),NAME('"SEI_Armar_Partes"') !                    
                         END
                     END                       

LUGAR                FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo.LUGAR'),PRE(LUG),BINDABLE,CREATE,THREAD !                    
PK_LUGAR                 KEY(LUG:LUG_Codigo),PRIMARY       !                    
IX_Descripcion           KEY(LUG:LUG_Descripcion),DUP      !                    
IX_SEDE                  KEY(LUG:LUG_Sede),DUP,NOCASE,OPT  !                    
Record                   RECORD,PRE()
LUG_Codigo                  SHORT,NAME('"LUG_Codigo"')     !                    
LUG_Descripcion             STRING(50),NAME('"LUG_Descripcion"') !                    
LUG_Hora_Entrada            STRING(8),NAME('"LUG_Hora_Entrada"') !                    
LUG_Hora_Entrada_GROUP      GROUP,OVER(LUG_Hora_Entrada)   !                    
LUG_Hora_Entrada_DATE         DATE                         !                    
LUG_Hora_Entrada_TIME         TIME                         !                    
                            END                            !                    
LUG_Hora_Salida             STRING(8),NAME('"LUG_Hora_Salida"') !                    
LUG_Hora_Salida_GROUP       GROUP,OVER(LUG_Hora_Salida)    !                    
LUG_Hora_Salida_DATE          DATE                         !                    
LUG_Hora_Salida_TIME          TIME                         !                    
                            END                            !                    
LUG_Sede                    SHORT                          !                    
LUG_EMAIL                   STRING(30)                     !                    
                         END
                     END                       

SEDE_RELOJ           FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo."SEDE_RELOJ"'),PRE(SED),BINDABLE,CREATE,THREAD !                    
PK_SEDE_RELOJ            KEY(SED:SED_Codigo),PRIMARY       !                    
IX_Descripcion           KEY(SED:SED_Descripcion),DUP      !                    
KEY__WA_Sys_SED_Reloj_6B24EA82 KEY(SED:SED_Reloj),DUP,NAME('_WA_Sys_SED_Reloj_6B24EA82') !                    
Record                   RECORD,PRE()
SED_Codigo                  SHORT,NAME('"SED_Codigo"')     !                    
SED_Descripcion             STRING(50),NAME('"SED_Descripcion"') !                    
SED_Reloj                   SHORT,NAME('"SED_Reloj"')      !                    
                         END
                     END                       

SEDE_RELOJ_EMP       FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo."SEDE_RELOJ_EMP"'),PRE(SED2),BINDABLE,CREATE,THREAD !                    
PK_SEDE_RELOJ_EMP        KEY(SED2:SRL_Sede,SED2:SRL_Lugar,SED2:SRL_Legajo),PRIMARY !                    
FK_SEDE_RELOJ_EMP_SEDE_RELOJ1 KEY(SED2:SRL_Sede),DUP       !                    
FK_SEDE_RELOJ_EMP_LUGAR1 KEY(SED2:SRL_Lugar),DUP           !                    
FK_SEDE_RELOJ_EMP_EMPLEADOS1 KEY(SED2:SRL_Legajo),DUP      !                    
Record                   RECORD,PRE()
SRL_Sede                    SHORT,NAME('"SRL_Sede"')       !                    
SRL_Lugar                   SHORT,NAME('"SRL_Lugar"')      !                    
SRL_Legajo                  SHORT,NAME('"SRL_Legajo"')     !                    
                         END
                     END                       

TARJETA              FILE,DRIVER('MSSQL'),OWNER('GEA_PICO,Personal,SA,bmast24'),NAME('dbo.TARJETA'),PRE(TAR),BINDABLE,CREATE,THREAD !                    
PK_TARJETA               KEY(TAR:TAR_Legajo,TAR:TAR_Reloj,TAR:TAR_Codigo),PRIMARY !                    
FK_TARJETA_EMPLEADOS     KEY(TAR:TAR_Legajo),DUP           !                    
IX_Reloj                 KEY(TAR:TAR_Reloj),DUP            !                    
IX_Reloj_Tarjeta         KEY(TAR:TAR_Reloj,TAR:TAR_Codigo),NOCASE,OPT !                    
Record                   RECORD,PRE()
TAR_Legajo                  SHORT,NAME('"TAR_Legajo"')     !                    
TAR_Reloj                   SHORT,NAME('"TAR_Reloj"')      !                    
TAR_Codigo                  SHORT,NAME('"TAR_Codigo"')     !                    
TAR_Observaciones           STRING(50)                     !                    
                         END
                     END                       

EMPLEA2              FILE,DRIVER('Btrieve'),NAME('g:\pers\emplea.dat'),PRE(EMP2),BINDABLE,THREAD !                    
Key1_sue                 KEY(EMP2:RCod1_Sue),NOCASE,OPT,PRIMARY !Servicio Legajo     
KeyT1_Sue                KEY(EMP2:Nrotar1_sue),NOCASE,OPT  !x tarjeta1          
KeyT2_Sue                KEY(EMP2:Nrotar2_sue),NOCASE,OPT  !                    
KeyT3_Sue                KEY(EMP2:Nrotar3_sue),NOCASE,OPT  !                    
key4_sue                 KEY(EMP2:nombre_sue),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Cod1_SUE                    GROUP                          !                    
Servic_sue                    STRING(@n01)                 !                    
Legajo_sue                    STRING(@n03)                 !                    
                            END                            !                    
RCod1_Sue                   STRING(@n04),OVER(Cod1_SUE)    !                    
Cod2_sue                    GROUP                          !                    
Tipo_sue                      STRING(@n01)                 !                    
Sector_Sue                    STRING(@n02)                 !                    
Seccion_sue                   STRING(@n01)                 !                    
                            END                            !                    
Cod3_Sue                    GROUP                          !                    
Nrotar1_sue                   STRING(@n05)                 !                    
Nrotar2_sue                   STRING(@N05)                 !                    
Nrotar3_sue                   STRING(@N05)                 !                    
                            END                            !                    
CCosto_sue                  STRING(@n02)                   !                    
Usua_sue                    STRING(@n011)                  !                    
fami_sue                    STRING(@n02)                   !                    
seguro_sue                  STRING(@n01)                   !                    
licen_sue                   STRING(@n03)                   !                    
jubi_sue                    STRING(@n02)                   !                    
nombre_sue                  STRING(30)                     !                    
domici_sue                  STRING(25)                     !                    
locali_sue                  STRING(20)                     !                    
sexo_sue                    STRING(1)                      !                    
nacion_sue                  STRING(1)                      !                    
Tipodoc_sue                 STRING(2)                      !                    
cuil_sue                    STRING(@n011)                  !                    
feing1_sue                  STRING(@n06)                   !                    
feing2_sue                  STRING(@n06)                   !                    
feing3_sue                  STRING(@n06)                   !                    
feing4_sue                  STRING(@n06)                   !                    
fenaci_sue                  STRING(@n06)                   !                    
febaja_sue                  STRING(@n06)                   !                    
ccateg_sue                  STRING(2)                      !                    
salari_sue                  STRING(10)                     !                    
reten_sue                   STRING(10)                     !                    
nobrso_sue                  STRING(@n08)                   !                    
cobrso_sue                  STRING(@n02)                   !                    
cjubil_sue                  STRING(@n01)                   !                    
activo_sue                  STRING(1)                      !                    
cobro_sue                   STRING(@n01)                   !                    
Conven_sue                  STRING(@n01)                   !                    
antcat_sue                  STRING(@n06)                   !                    
cargo_sue                   STRING(30)                     !                    
porbae_sue                  STRING(@n05v2)                 !                    
tipsem_sue                  STRING(1)                      !                    
tturno_sue                  STRING(1)                      !                    
cturno_sue                  STRING(1)                      !                    
autoex_sue                  STRING(1)                      !                    
                         END
                     END                       

!endregion


QueueLock CriticalSection

NewData Semaphore

Limiter &IMutex,AUTO
Result SIGNED,AUTO
LastErr LONG,AUTO

Access:Emplea        &FileManager,THREAD                   ! FileManager for Emplea
Relate:Emplea        &RelationManager,THREAD               ! RelationManager for Emplea
Access:TMPUsosMultiples &FileManager,THREAD                ! FileManager for TMPUsosMultiples
Relate:TMPUsosMultiples &RelationManager,THREAD            ! RelationManager for TMPUsosMultiples
Access:TMPReloj      &FileManager,THREAD                   ! FileManager for TMPReloj
Relate:TMPReloj      &RelationManager,THREAD               ! RelationManager for TMPReloj
Access:TMP_Personal  &FileManager,THREAD                   ! FileManager for TMP_Personal
Relate:TMP_Personal  &RelationManager,THREAD               ! RelationManager for TMP_Personal
Access:HISRELOJ      &FileManager,THREAD                   ! FileManager for HISRELOJ
Relate:HISRELOJ      &RelationManager,THREAD               ! RelationManager for HISRELOJ
Access:HORADEV       &FileManager,THREAD                   ! FileManager for HORADEV
Relate:HORADEV       &RelationManager,THREAD               ! RelationManager for HORADEV
Access:LGRELOJ       &FileManager,THREAD                   ! FileManager for LGRELOJ
Relate:LGRELOJ       &RelationManager,THREAD               ! RelationManager for LGRELOJ
Access:Reloj         &FileManager,THREAD                   ! FileManager for Reloj
Relate:Reloj         &RelationManager,THREAD               ! RelationManager for Reloj
Access:EMPLEADOS     &FileManager,THREAD                   ! FileManager for EMPLEADOS
Relate:EMPLEADOS     &RelationManager,THREAD               ! RelationManager for EMPLEADOS
Access:SEDEINI       &FileManager,THREAD                   ! FileManager for SEDEINI
Relate:SEDEINI       &RelationManager,THREAD               ! RelationManager for SEDEINI
Access:LUGAR         &FileManager,THREAD                   ! FileManager for LUGAR
Relate:LUGAR         &RelationManager,THREAD               ! RelationManager for LUGAR
Access:SEDE_RELOJ    &FileManager,THREAD                   ! FileManager for SEDE_RELOJ
Relate:SEDE_RELOJ    &RelationManager,THREAD               ! RelationManager for SEDE_RELOJ
Access:SEDE_RELOJ_EMP &FileManager,THREAD                  ! FileManager for SEDE_RELOJ_EMP
Relate:SEDE_RELOJ_EMP &RelationManager,THREAD              ! RelationManager for SEDE_RELOJ_EMP
Access:TARJETA       &FileManager,THREAD                   ! FileManager for TARJETA
Relate:TARJETA       &RelationManager,THREAD               ! RelationManager for TARJETA
Access:EMPLEA2       &FileManager,THREAD                   ! FileManager for EMPLEA2
Relate:EMPLEA2       &RelationManager,THREAD               ! RelationManager for EMPLEA2

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
  !========================================================================================================================
  
  !MESSAGE('Se va a pedir un Mutex para evitar que este programa ejecute 2 veces| Ver Global Embeds')
  
  Limiter &= NewMutex('MNREL',,LastErr)
  IF Limiter &= NULL
  !    MESSAGE ('ERROR: No puede crearse el Mutex ' & LastErr)
      HALT(0,'El programa no puede ejecutarse')
  ELSE
      Result = Limiter.TryWait(50)
  END
  
  IF Result <= WAIT:OK
  !    MESSAGE('El Mutex fue asignado, no se podran generar mas instancias del programa hasta que no se cierre y se libere el Mutex')
  ELSIF Result = WAIT:TIMEOUT
  !    MESSAGE('El programa ya esta en ejecucion')
      HALT(0,'El programa MNREL ya está en ejecución')
  ELSE
  !    MESSAGE('Fallo la espera del Mutex ' & Result) !show Result
      HALT(0,'El programa no puede ejecutarse')
  END
  !========================================================================================================================
  
  
  
  
  
   glo:nsector = command('1')
   if glo:nsector = 11341 then
      glo:nsector=0
   else
      if glo:nsector = 0 and not exists('MnRel.app') then
         message('Acceso no permitido o configuración incorrecta del sistema.',' CONTROL HORARIO DEL PERSONAL')
         halt(0)
      end
   end
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\MnRel.INI', NVD_INI)                      ! Configure INIManager to use INI file
  DctInit
  Main
  INIMgr.Update
  
  !Desactivar el Mutex
  Limiter.Release()
  Limiter.Kill()
  
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

