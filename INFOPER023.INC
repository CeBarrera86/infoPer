  MODULE('INFOPER023.CLW')
ProcesarHorasExtras    PROCEDURE                      !Browse the DETALLE_HORAS_EXTRA file
HorasExtras            PROCEDURE                      !Browse the HORAS_EXTRA file
UpdateHORAS_EXTRA      PROCEDURE                      !Form HORAS_EXTRA
UpdateDETALLE_HORAS_EXTRA PROCEDURE                   !Form DETALLE_HORAS_EXTRA
UpdateHorasExtras      PROCEDURE                      !Form HORAS_EXTRA
ProcesarHExtras        PROCEDURE(SHORT)               !Process the HORASEXTRASCVS File
UpdateHExtrasDenarius  PROCEDURE(string)              !Form DETALLE_HORAS_EXTRA
HorasEXtraDenariuis    PROCEDURE(string)              !Browse the HORAS_EXTRA_DENARIUS file
SolicitudAusencia      PROCEDURE                      !Window
  END
