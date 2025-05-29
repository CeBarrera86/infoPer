  MODULE('INFOPER020.CLW')
TSuministro            PROCEDURE(byte)
ABMEmpleadosLicencia   PROCEDURE                      !Browse the EMPLEADOS file
UpdateEMPLEADOS        PROCEDURE                      !Form EMPLEADOS
AltasMasivasLicencias  PROCEDURE                      !Window
ABMLicencias           PROCEDURE                      !Window
SolicitudLicencia      PROCEDURE                      !Window
FormSolicitudLicencia  PROCEDURE(string,short,string,short,short,short,short) !Form DETALLE_LICENCIA
FormDiasdeViaje        PROCEDURE(short,short,date,date) !Form DIAS_VIAJE
KmDiasdeViaje          PROCEDURE                      !Browse the PARAMETRO_DIAS_VIAJE file
AdelantoLicencia       PROCEDURE                      !Report the DETALLE_LICENCIA File
  END
