  MEMBER('infoper.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
infoper_BC0:DctInit    PROCEDURE
infoper_BC0:DctKill    PROCEDURE
infoper_BC0:FilesInit  PROCEDURE
  END

Hide:Access:CLIENTE  CLASS(FileManager),TYPE               ! FileManager for CLIENTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CLIENTE  CLASS(RelationManager),TYPE           ! RelationManager for CLIENTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SUMINISTRO CLASS(FileManager),TYPE             ! FileManager for SUMINISTRO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SUMINISTRO CLASS(RelationManager),TYPE         ! RelationManager for SUMINISTRO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:EMPLEADOS CLASS(FileManager),TYPE              ! FileManager for EMPLEADOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:EMPLEADOS CLASS(RelationManager),TYPE          ! RelationManager for EMPLEADOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Empleado_Comprobante CLASS(FileManager),TYPE   ! FileManager for Empleado_Comprobante
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:Empleado_Comprobante CLASS(RelationManager),TYPE ! RelationManager for Empleado_Comprobante
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TMPUsosMultiples CLASS(FileManager),TYPE       ! FileManager for TMPUsosMultiples
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TMPUsosMultiples CLASS(RelationManager),TYPE   ! RelationManager for TMPUsosMultiples
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TXDEB    CLASS(FileManager),TYPE               ! FileManager for TXDEB
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TXDEB    CLASS(RelationManager),TYPE           ! RelationManager for TXDEB
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DESFAC   CLASS(FileManager),TYPE               ! FileManager for DESFAC
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DESFAC   CLASS(RelationManager),TYPE           ! RelationManager for DESFAC
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DEBITO_EMPLEADOS CLASS(FileManager),TYPE       ! FileManager for DEBITO_EMPLEADOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DEBITO_EMPLEADOS CLASS(RelationManager),TYPE   ! RelationManager for DEBITO_EMPLEADOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:COMPROBANTE CLASS(FileManager),TYPE            ! FileManager for COMPROBANTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:COMPROBANTE CLASS(RelationManager),TYPE        ! RelationManager for COMPROBANTE
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:per      CLASS(FileManager),TYPE               ! FileManager for per
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:per      CLASS(RelationManager),TYPE           ! RelationManager for per
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:datpers  CLASS(FileManager),TYPE               ! FileManager for datpers
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:datpers  CLASS(RelationManager),TYPE           ! RelationManager for datpers
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CONVENIO CLASS(FileManager),TYPE               ! FileManager for CONVENIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONVENIO CLASS(RelationManager),TYPE           ! RelationManager for CONVENIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DETALLE_LICENCIA CLASS(FileManager),TYPE       ! FileManager for DETALLE_LICENCIA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DETALLE_LICENCIA CLASS(RelationManager),TYPE   ! RelationManager for DETALLE_LICENCIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DIAS_VIAJE CLASS(FileManager),TYPE             ! FileManager for DIAS_VIAJE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DIAS_VIAJE CLASS(RelationManager),TYPE         ! RelationManager for DIAS_VIAJE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LICENCIA CLASS(FileManager),TYPE               ! FileManager for LICENCIA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LICENCIA CLASS(RelationManager),TYPE           ! RelationManager for LICENCIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PARAMETRO_DIAS_VIAJE CLASS(FileManager),TYPE   ! FileManager for PARAMETRO_DIAS_VIAJE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PARAMETRO_DIAS_VIAJE CLASS(RelationManager),TYPE ! RelationManager for PARAMETRO_DIAS_VIAJE
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PARAMETRO_LICENCIA CLASS(FileManager),TYPE     ! FileManager for PARAMETRO_LICENCIA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PARAMETRO_LICENCIA CLASS(RelationManager),TYPE ! RelationManager for PARAMETRO_LICENCIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SECTOR   CLASS(FileManager),TYPE               ! FileManager for SECTOR
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SECTOR   CLASS(RelationManager),TYPE           ! RelationManager for SECTOR
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:FERIADOS CLASS(FileManager),TYPE               ! FileManager for FERIADOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:FERIADOS CLASS(RelationManager),TYPE           ! RelationManager for FERIADOS
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:empch    CLASS(FileManager),TYPE               ! FileManager for empch
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:empch    CLASS(RelationManager),TYPE           ! RelationManager for empch
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:CLIENTE &Hide:Access:CLIENTE,AUTO,THREAD
_Hide:Relate:CLIENTE &Hide:Relate:CLIENTE,AUTO,THREAD
_Hide:Access:SUMINISTRO &Hide:Access:SUMINISTRO,AUTO,THREAD
_Hide:Relate:SUMINISTRO &Hide:Relate:SUMINISTRO,AUTO,THREAD
_Hide:Access:EMPLEADOS &Hide:Access:EMPLEADOS,AUTO,THREAD
_Hide:Relate:EMPLEADOS &Hide:Relate:EMPLEADOS,AUTO,THREAD
_Hide:Access:Empleado_Comprobante &Hide:Access:Empleado_Comprobante,AUTO,THREAD
_Hide:Relate:Empleado_Comprobante &Hide:Relate:Empleado_Comprobante,AUTO,THREAD
_Hide:Access:TMPUsosMultiples &Hide:Access:TMPUsosMultiples,AUTO,THREAD
_Hide:Relate:TMPUsosMultiples &Hide:Relate:TMPUsosMultiples,AUTO,THREAD
_Hide:Access:TXDEB   &Hide:Access:TXDEB,AUTO,THREAD
_Hide:Relate:TXDEB   &Hide:Relate:TXDEB,AUTO,THREAD
_Hide:Access:DESFAC  &Hide:Access:DESFAC,AUTO,THREAD
_Hide:Relate:DESFAC  &Hide:Relate:DESFAC,AUTO,THREAD
_Hide:Access:DEBITO_EMPLEADOS &Hide:Access:DEBITO_EMPLEADOS,AUTO,THREAD
_Hide:Relate:DEBITO_EMPLEADOS &Hide:Relate:DEBITO_EMPLEADOS,AUTO,THREAD
_Hide:Access:COMPROBANTE &Hide:Access:COMPROBANTE,AUTO,THREAD
_Hide:Relate:COMPROBANTE &Hide:Relate:COMPROBANTE,AUTO,THREAD
_Hide:Access:per     &Hide:Access:per,AUTO,THREAD
_Hide:Relate:per     &Hide:Relate:per,AUTO,THREAD
_Hide:Access:datpers &Hide:Access:datpers,AUTO,THREAD
_Hide:Relate:datpers &Hide:Relate:datpers,AUTO,THREAD
_Hide:Access:CONVENIO &Hide:Access:CONVENIO,AUTO,THREAD
_Hide:Relate:CONVENIO &Hide:Relate:CONVENIO,AUTO,THREAD
_Hide:Access:DETALLE_LICENCIA &Hide:Access:DETALLE_LICENCIA,AUTO,THREAD
_Hide:Relate:DETALLE_LICENCIA &Hide:Relate:DETALLE_LICENCIA,AUTO,THREAD
_Hide:Access:DIAS_VIAJE &Hide:Access:DIAS_VIAJE,AUTO,THREAD
_Hide:Relate:DIAS_VIAJE &Hide:Relate:DIAS_VIAJE,AUTO,THREAD
_Hide:Access:LICENCIA &Hide:Access:LICENCIA,AUTO,THREAD
_Hide:Relate:LICENCIA &Hide:Relate:LICENCIA,AUTO,THREAD
_Hide:Access:PARAMETRO_DIAS_VIAJE &Hide:Access:PARAMETRO_DIAS_VIAJE,AUTO,THREAD
_Hide:Relate:PARAMETRO_DIAS_VIAJE &Hide:Relate:PARAMETRO_DIAS_VIAJE,AUTO,THREAD
_Hide:Access:PARAMETRO_LICENCIA &Hide:Access:PARAMETRO_LICENCIA,AUTO,THREAD
_Hide:Relate:PARAMETRO_LICENCIA &Hide:Relate:PARAMETRO_LICENCIA,AUTO,THREAD
_Hide:Access:SECTOR  &Hide:Access:SECTOR,AUTO,THREAD
_Hide:Relate:SECTOR  &Hide:Relate:SECTOR,AUTO,THREAD
_Hide:Access:FERIADOS &Hide:Access:FERIADOS,AUTO,THREAD
_Hide:Relate:FERIADOS &Hide:Relate:FERIADOS,AUTO,THREAD
_Hide:Access:empch   &Hide:Access:empch,AUTO,THREAD
_Hide:Relate:empch   &Hide:Relate:empch,AUTO,THREAD


infoper_BC0:DctInit PROCEDURE
  CODE
  _Hide:Access:CLIENTE &= NEW(Hide:Access:CLIENTE)
  _Hide:Relate:CLIENTE &= NEW(Hide:Relate:CLIENTE)
  _Hide:Access:SUMINISTRO &= NEW(Hide:Access:SUMINISTRO)
  _Hide:Relate:SUMINISTRO &= NEW(Hide:Relate:SUMINISTRO)
  _Hide:Access:EMPLEADOS &= NEW(Hide:Access:EMPLEADOS)
  _Hide:Relate:EMPLEADOS &= NEW(Hide:Relate:EMPLEADOS)
  _Hide:Access:Empleado_Comprobante &= NEW(Hide:Access:Empleado_Comprobante)
  _Hide:Relate:Empleado_Comprobante &= NEW(Hide:Relate:Empleado_Comprobante)
  _Hide:Access:TMPUsosMultiples &= NEW(Hide:Access:TMPUsosMultiples)
  _Hide:Relate:TMPUsosMultiples &= NEW(Hide:Relate:TMPUsosMultiples)
  _Hide:Access:TXDEB &= NEW(Hide:Access:TXDEB)
  _Hide:Relate:TXDEB &= NEW(Hide:Relate:TXDEB)
  _Hide:Access:DESFAC &= NEW(Hide:Access:DESFAC)
  _Hide:Relate:DESFAC &= NEW(Hide:Relate:DESFAC)
  _Hide:Access:DEBITO_EMPLEADOS &= NEW(Hide:Access:DEBITO_EMPLEADOS)
  _Hide:Relate:DEBITO_EMPLEADOS &= NEW(Hide:Relate:DEBITO_EMPLEADOS)
  _Hide:Access:COMPROBANTE &= NEW(Hide:Access:COMPROBANTE)
  _Hide:Relate:COMPROBANTE &= NEW(Hide:Relate:COMPROBANTE)
  _Hide:Access:per &= NEW(Hide:Access:per)
  _Hide:Relate:per &= NEW(Hide:Relate:per)
  _Hide:Access:datpers &= NEW(Hide:Access:datpers)
  _Hide:Relate:datpers &= NEW(Hide:Relate:datpers)
  _Hide:Access:CONVENIO &= NEW(Hide:Access:CONVENIO)
  _Hide:Relate:CONVENIO &= NEW(Hide:Relate:CONVENIO)
  _Hide:Access:DETALLE_LICENCIA &= NEW(Hide:Access:DETALLE_LICENCIA)
  _Hide:Relate:DETALLE_LICENCIA &= NEW(Hide:Relate:DETALLE_LICENCIA)
  _Hide:Access:DIAS_VIAJE &= NEW(Hide:Access:DIAS_VIAJE)
  _Hide:Relate:DIAS_VIAJE &= NEW(Hide:Relate:DIAS_VIAJE)
  _Hide:Access:LICENCIA &= NEW(Hide:Access:LICENCIA)
  _Hide:Relate:LICENCIA &= NEW(Hide:Relate:LICENCIA)
  _Hide:Access:PARAMETRO_DIAS_VIAJE &= NEW(Hide:Access:PARAMETRO_DIAS_VIAJE)
  _Hide:Relate:PARAMETRO_DIAS_VIAJE &= NEW(Hide:Relate:PARAMETRO_DIAS_VIAJE)
  _Hide:Access:PARAMETRO_LICENCIA &= NEW(Hide:Access:PARAMETRO_LICENCIA)
  _Hide:Relate:PARAMETRO_LICENCIA &= NEW(Hide:Relate:PARAMETRO_LICENCIA)
  _Hide:Access:SECTOR &= NEW(Hide:Access:SECTOR)
  _Hide:Relate:SECTOR &= NEW(Hide:Relate:SECTOR)
  _Hide:Access:FERIADOS &= NEW(Hide:Access:FERIADOS)
  _Hide:Relate:FERIADOS &= NEW(Hide:Relate:FERIADOS)
  _Hide:Access:empch &= NEW(Hide:Access:empch)
  _Hide:Relate:empch &= NEW(Hide:Relate:empch)
  Relate:CLIENTE &= _Hide:Relate:CLIENTE
  Relate:SUMINISTRO &= _Hide:Relate:SUMINISTRO
  Relate:EMPLEADOS &= _Hide:Relate:EMPLEADOS
  Relate:Empleado_Comprobante &= _Hide:Relate:Empleado_Comprobante
  Relate:TMPUsosMultiples &= _Hide:Relate:TMPUsosMultiples
  Relate:TXDEB &= _Hide:Relate:TXDEB
  Relate:DESFAC &= _Hide:Relate:DESFAC
  Relate:DEBITO_EMPLEADOS &= _Hide:Relate:DEBITO_EMPLEADOS
  Relate:COMPROBANTE &= _Hide:Relate:COMPROBANTE
  Relate:per &= _Hide:Relate:per
  Relate:datpers &= _Hide:Relate:datpers
  Relate:CONVENIO &= _Hide:Relate:CONVENIO
  Relate:DETALLE_LICENCIA &= _Hide:Relate:DETALLE_LICENCIA
  Relate:DIAS_VIAJE &= _Hide:Relate:DIAS_VIAJE
  Relate:LICENCIA &= _Hide:Relate:LICENCIA
  Relate:PARAMETRO_DIAS_VIAJE &= _Hide:Relate:PARAMETRO_DIAS_VIAJE
  Relate:PARAMETRO_LICENCIA &= _Hide:Relate:PARAMETRO_LICENCIA
  Relate:SECTOR &= _Hide:Relate:SECTOR
  Relate:FERIADOS &= _Hide:Relate:FERIADOS
  Relate:empch &= _Hide:Relate:empch


infoper_BC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:CLIENTE.Init
  _Hide:Relate:SUMINISTRO.Init
  _Hide:Relate:EMPLEADOS.Init
  _Hide:Relate:Empleado_Comprobante.Init
  _Hide:Relate:TMPUsosMultiples.Init
  _Hide:Relate:TXDEB.Init
  _Hide:Relate:DESFAC.Init
  _Hide:Relate:DEBITO_EMPLEADOS.Init
  _Hide:Relate:COMPROBANTE.Init
  _Hide:Relate:per.Init
  _Hide:Relate:datpers.Init
  _Hide:Relate:CONVENIO.Init
  _Hide:Relate:DETALLE_LICENCIA.Init
  _Hide:Relate:DIAS_VIAJE.Init
  _Hide:Relate:LICENCIA.Init
  _Hide:Relate:PARAMETRO_DIAS_VIAJE.Init
  _Hide:Relate:PARAMETRO_LICENCIA.Init
  _Hide:Relate:SECTOR.Init
  _Hide:Relate:FERIADOS.Init
  _Hide:Relate:empch.Init


infoper_BC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:CLIENTE.Kill
  DISPOSE(_Hide:Relate:CLIENTE)
  _Hide:Relate:SUMINISTRO.Kill
  DISPOSE(_Hide:Relate:SUMINISTRO)
  _Hide:Relate:EMPLEADOS.Kill
  DISPOSE(_Hide:Relate:EMPLEADOS)
  _Hide:Relate:Empleado_Comprobante.Kill
  DISPOSE(_Hide:Relate:Empleado_Comprobante)
  _Hide:Relate:TMPUsosMultiples.Kill
  DISPOSE(_Hide:Relate:TMPUsosMultiples)
  _Hide:Relate:TXDEB.Kill
  DISPOSE(_Hide:Relate:TXDEB)
  _Hide:Relate:DESFAC.Kill
  DISPOSE(_Hide:Relate:DESFAC)
  _Hide:Relate:DEBITO_EMPLEADOS.Kill
  DISPOSE(_Hide:Relate:DEBITO_EMPLEADOS)
  _Hide:Relate:COMPROBANTE.Kill
  DISPOSE(_Hide:Relate:COMPROBANTE)
  _Hide:Relate:per.Kill
  DISPOSE(_Hide:Relate:per)
  _Hide:Relate:datpers.Kill
  DISPOSE(_Hide:Relate:datpers)
  _Hide:Relate:CONVENIO.Kill
  DISPOSE(_Hide:Relate:CONVENIO)
  _Hide:Relate:DETALLE_LICENCIA.Kill
  DISPOSE(_Hide:Relate:DETALLE_LICENCIA)
  _Hide:Relate:DIAS_VIAJE.Kill
  DISPOSE(_Hide:Relate:DIAS_VIAJE)
  _Hide:Relate:LICENCIA.Kill
  DISPOSE(_Hide:Relate:LICENCIA)
  _Hide:Relate:PARAMETRO_DIAS_VIAJE.Kill
  DISPOSE(_Hide:Relate:PARAMETRO_DIAS_VIAJE)
  _Hide:Relate:PARAMETRO_LICENCIA.Kill
  DISPOSE(_Hide:Relate:PARAMETRO_LICENCIA)
  _Hide:Relate:SECTOR.Kill
  DISPOSE(_Hide:Relate:SECTOR)
  _Hide:Relate:FERIADOS.Kill
  DISPOSE(_Hide:Relate:FERIADOS)
  _Hide:Relate:empch.Kill
  DISPOSE(_Hide:Relate:empch)


Hide:Relate:CLIENTE.Init PROCEDURE
  CODE
  _Hide:Access:CLIENTE.Init
  SELF.Init(Access:CLIENTE,1)


Hide:Access:CLIENTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CLI:Record
  SELF.FileNameValue = 'CLIENTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CLIENTE
  PARENT.Init
  Access:CLIENTE &= SELF


Hide:Access:CLIENTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CLIENTE &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CLIENTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CLIENTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CLI:PK_CLIENTE,'CLI:PK_CLIENTE',0)
    SELF.AddKey(CLI:IX_CLIENTE1,'CLI:IX_CLIENTE1',0)
    SELF.AddKey(CLI:PKCLIENTE_BUSSUM,'CLI:PKCLIENTE_BUSSUM',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CLIENTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DEBITO_EMPLEADOS)


Hide:Relate:CLIENTE.Kill PROCEDURE

  CODE
  _Hide:Access:CLIENTE.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:CLIENTE &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CLIENTE)                            ! destroy the file manager


Hide:Relate:SUMINISTRO.Init PROCEDURE
  CODE
  _Hide:Access:SUMINISTRO.Init
  SELF.Init(Access:SUMINISTRO,1)


Hide:Access:SUMINISTRO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUM:Record
  SELF.FileNameValue = 'SUMINISTRO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SUMINISTRO
  PARENT.Init
  Access:SUMINISTRO &= SELF


Hide:Access:SUMINISTRO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SUMINISTRO &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SUMINISTRO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SUMINISTRO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SUM:PK_SUMINISTRO,'SUM:PK_SUMINISTRO',0)
    SELF.AddKey(SUM:IX_SUMINISTRO_DOMICILIO,'SUM:IX_SUMINISTRO_DOMICILIO',0)
    SELF.AddKey(SUM:IX_SUMIMISTRO_DIRECCION_POSTAL,'SUM:IX_SUMIMISTRO_DIRECCION_POSTAL',0)
    SELF.AddKey(SUM:IX_SUMINISTRO_BUSQUEDA_SUMINISTRO,'SUM:IX_SUMINISTRO_BUSQUEDA_SUMINISTRO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SUMINISTRO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DEBITO_EMPLEADOS)


Hide:Relate:SUMINISTRO.Kill PROCEDURE

  CODE
  _Hide:Access:SUMINISTRO.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SUMINISTRO &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SUMINISTRO)                         ! destroy the file manager


Hide:Relate:EMPLEADOS.Init PROCEDURE
  CODE
  _Hide:Access:EMPLEADOS.Init
  SELF.Init(Access:EMPLEADOS,1)


Hide:Access:EMPLEADOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EPL:Record
  SELF.FileNameValue = 'EMPLEADOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EMPLEADOS
  PARENT.Init
  Access:EMPLEADOS &= SELF


Hide:Access:EMPLEADOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EMPLEADOS &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EMPLEADOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EMPLEADOS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(EPL:FK_CONVENIO,'EPL:FK_CONVENIO',0)
    SELF.AddKey(EPL:FK_SECTOR,'EPL:FK_SECTOR',0)
    SELF.AddKey(EPL:PK_EMPLEADOS,'EPL:PK_EMPLEADOS',0)
    SELF.AddKey(EPL:PK_Nombre,'EPL:PK_Nombre',0)
    SELF.AddKey(EPL:PK_Direccion,'EPL:PK_Direccion',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:EMPLEADOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 9
    GlobalErrors.SetField('EPL:EMP_DESCUENTA_FACTURA')
    IF INSTRING(']' & EPL:EMP_DESCUENTA_FACTURA & '[', ']S[]N[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Si'',''NO''')
      END
    END
  OF 10
    GlobalErrors.SetField('EPL:EMP_ACTIVO')
    IF INSTRING(']' & EPL:EMP_ACTIVO & '[', ']S[]N[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''SI'',''NO''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:EMPLEADOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DEBITO_EMPLEADOS)

  SELF.AddRelation(Relate:CONVENIO,RI:None,RI:None,CON:PK_CONVENIO)
  SELF.AddRelationLink(EPL:EMP_CONVENIO,CON:CONV_ID)

  SELF.AddRelation(Relate:SECTOR,RI:None,RI:None,SEC:PK_SECTOR)
  SELF.AddRelationLink(EPL:EMP_SECTOR,SEC:SEC_ID)

  SELF.AddRelation(Relate:LICENCIA,RI:None,RI:None,LIC:PK_LICENCIA)
  SELF.AddRelationLink(EPL:EMP_LEGAJO,LIC:LIC_LEGAJO)

  SELF.AddRelation(Relate:DETALLE_PROVISION,RI:None,RI:None,PROVD:FK_LEGAJO)
  SELF.AddRelationLink(EPL:EMP_LEGAJO,PROVD:PROVD_LEGAJO)

  SELF.AddRelation(Relate:DETALLE_HORAS_EXTRA,RI:None,RI:None,HEXD:FK_EMPLEADO)
  SELF.AddRelationLink(EPL:EMP_LEGAJO,HEXD:HEXD_LEGAJO)

  SELF.AddRelation(Relate:PER_WEBREC,RI:None,RI:None,PWR:PK_PER_WEBREC)
  SELF.AddRelationLink(EPL:EMP_LEGAJO,PWR:PWR_LEGAJO)


Hide:Relate:EMPLEADOS.Kill PROCEDURE

  CODE
  _Hide:Access:EMPLEADOS.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:EMPLEADOS &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EMPLEADOS)                          ! destroy the file manager


Hide:Relate:Empleado_Comprobante.Init PROCEDURE
  CODE
  _Hide:Access:Empleado_Comprobante.Init
  SELF.Init(Access:Empleado_Comprobante,1)


Hide:Access:Empleado_Comprobante.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ecp:Record
  SELF.FileNameValue = 'Empleado_Comprobante'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Empleado_Comprobante
  PARENT.Init
  Access:Empleado_Comprobante &= SELF


Hide:Access:Empleado_Comprobante.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Empleado_Comprobante &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Empleado_Comprobante.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Empleado_Comprobante,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Ecp:PK_Empleado_Comprobante,'Ecp:PK_Empleado_Comprobante',0)
    SELF.AddKey(Ecp:IX_Empleado_Comprobante,'Ecp:IX_Empleado_Comprobante',0)
    SELF.AddKey(Ecp:IX_Empleado_Comprobante_1,'Ecp:IX_Empleado_Comprobante_1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:Empleado_Comprobante.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('Ecp:codempresa')
    IF INSTRING(']' & Ecp:codempresa & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''ELECTRICO'',''TELEFONIA'',''TV''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:Empleado_Comprobante.Kill PROCEDURE

  CODE
  _Hide:Access:Empleado_Comprobante.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:Empleado_Comprobante &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Empleado_Comprobante)               ! destroy the file manager


Hide:Relate:TMPUsosMultiples.Init PROCEDURE
  CODE
  _Hide:Access:TMPUsosMultiples.Init
  SELF.Init(Access:TMPUsosMultiples,1)


Hide:Access:TMPUsosMultiples.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TUM:Record
  SELF.FileNameValue = 'TMPUsosMultiples'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TMPUsosMultiples
  PARENT.Init
  Access:TMPUsosMultiples &= SELF


Hide:Access:TMPUsosMultiples.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TMPUsosMultiples &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TMPUsosMultiples.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TMPUsosMultiples,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TUM:PK_TMPUsosMultiples,'TUM:PK_TMPUsosMultiples',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TMPUsosMultiples.Kill PROCEDURE

  CODE
  _Hide:Access:TMPUsosMultiples.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:TMPUsosMultiples &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TMPUsosMultiples)                   ! destroy the file manager


Hide:Relate:TXDEB.Init PROCEDURE
  CODE
  _Hide:Access:TXDEB.Init
  SELF.Init(Access:TXDEB,1)


Hide:Access:TXDEB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TXD:Record
  SELF.FileNameValue = 'TXDEB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TXDEB
  SELF.FileName &= glo:nom_txdeb
  PARENT.Init
  Access:TXDEB &= SELF


Hide:Access:TXDEB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TXDEB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TXDEB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TXDEB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TXDEB.Kill PROCEDURE

  CODE
  _Hide:Access:TXDEB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:TXDEB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TXDEB)                              ! destroy the file manager


Hide:Relate:DESFAC.Init PROCEDURE
  CODE
  _Hide:Access:DESFAC.Init
  SELF.Init(Access:DESFAC,1)


Hide:Access:DESFAC.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DES:Record
  SELF.FileNameValue = 'DESFAC'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DESFAC
  PARENT.Init
  Access:DESFAC &= SELF


Hide:Access:DESFAC.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DESFAC &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DESFAC.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DESFAC,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DES:KEY_DESFAC,'DES:KEY_DESFAC',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DESFAC.Kill PROCEDURE

  CODE
  _Hide:Access:DESFAC.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:DESFAC &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DESFAC)                             ! destroy the file manager


Hide:Relate:DEBITO_EMPLEADOS.Init PROCEDURE
  CODE
  _Hide:Access:DEBITO_EMPLEADOS.Init
  SELF.Init(Access:DEBITO_EMPLEADOS,1)


Hide:Access:DEBITO_EMPLEADOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DEB:Record
  SELF.FileNameValue = 'DEBITO_EMPLEADOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DEBITO_EMPLEADOS
  PARENT.Init
  Access:DEBITO_EMPLEADOS &= SELF


Hide:Access:DEBITO_EMPLEADOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DEBITO_EMPLEADOS &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DEBITO_EMPLEADOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DEBITO_EMPLEADOS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DEB:PK_DEBITO_EMPLEADOS,'DEB:PK_DEBITO_EMPLEADOS',0)
    SELF.AddKey(DEB:Pk_Cliente,'DEB:Pk_Cliente',0)
    SELF.AddKey(DEB:pk_Legajo,'DEB:pk_Legajo',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DEBITO_EMPLEADOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:EMPLEADOS,RI:None,RI:None,EPL:PK_EMPLEADOS)
  SELF.AddRelationLink(DEB:DEB_LEGAJO,EPL:EMP_LEGAJO)

  SELF.AddRelation(Relate:CLIENTE,RI:None,RI:None,CLI:PK_CLIENTE)
  SELF.AddRelationLink(DEB:DEB_EMPRESA,CLI:CLI_EMPRESA)
  SELF.AddRelationLink(DEB:DEB_CLIENTE,CLI:CLI_ID)

  SELF.AddRelation(Relate:SUMINISTRO,RI:None,RI:None,SUM:PK_SUMINISTRO)
  SELF.AddRelationLink(DEB:DEB_EMPRESA,SUM:SUM_EMPRESA)
  SELF.AddRelationLink(DEB:DEB_CLIENTE,SUM:SUM_CLIENTE)
  SELF.AddRelationLink(DEB:DEB_SUMINISTRO,SUM:SUM_ID)


Hide:Relate:DEBITO_EMPLEADOS.Kill PROCEDURE

  CODE
  _Hide:Access:DEBITO_EMPLEADOS.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:DEBITO_EMPLEADOS &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DEBITO_EMPLEADOS)                   ! destroy the file manager


Hide:Relate:COMPROBANTE.Init PROCEDURE
  CODE
  _Hide:Access:COMPROBANTE.Init
  SELF.Init(Access:COMPROBANTE,1)


Hide:Access:COMPROBANTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CDE:Record
  SELF.FileNameValue = 'COMPROBANTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= COMPROBANTE
  PARENT.Init
  Access:COMPROBANTE &= SELF


Hide:Access:COMPROBANTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:COMPROBANTE &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:COMPROBANTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(COMPROBANTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CDE:PK_COMPROBANTE_DEBITO,'CDE:PK_COMPROBANTE_DEBITO',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_SUMINISTRO,'CDE:FK_COMPROBANTE_SUMINISTRO',0)
    SELF.AddKey(CDE:IX_COMPROBANTE_IMPRESION,'CDE:IX_COMPROBANTE_IMPRESION',0)
    SELF.AddKey(CDE:IX_SINCRONIZACION,'CDE:IX_SINCRONIZACION',0)
    SELF.AddKey(CDE:comprobante0,'CDE:comprobante0',0)
    SELF.AddKey(CDE:IX_IMPRESION_COMPROBANTE,'CDE:IX_IMPRESION_COMPROBANTE',0)
    SELF.AddKey(CDE:COMPROBANTE_IMPRESION_FACTURA2,'CDE:COMPROBANTE_IMPRESION_FACTURA2',0)
    SELF.AddKey(CDE:IX_COMPROBANTE_NCR_PEND,'CDE:IX_COMPROBANTE_NCR_PEND',0)
    SELF.AddKey(CDE:IX_ASIENTO_FACTURACION_FECHAS,'CDE:IX_ASIENTO_FACTURACION_FECHAS',0)
    SELF.AddKey(CDE:PK_COMPROBANTE_COBRANZA_BANCO,'CDE:PK_COMPROBANTE_COBRANZA_BANCO',0)
    SELF.AddKey(CDE:IDX_COMPROBANTE_DEUDA,'CDE:IDX_COMPROBANTE_DEUDA',0)
    SELF.AddKey(CDE:IDX_COMPROBANTE_00,'CDE:IDX_COMPROBANTE_00',0)
    SELF.AddKey(CDE:IDX_COMPROBANTE_000,'CDE:IDX_COMPROBANTE_000',0)
    SELF.AddKey(CDE:pkcomprobante1,'CDE:pkcomprobante1',0)
    SELF.AddKey(CDE:idxcomprobante1,'CDE:idxcomprobante1',0)
    SELF.AddKey(CDE:idxcomprobante22,'CDE:idxcomprobante22',0)
    SELF.AddKey(CDE:IX_COMPROBANTE_1,'CDE:IX_COMPROBANTE_1',0)
    SELF.AddKey(CDE:KEY__WA_Sys_cde_cancelado_566B5B6C,'CDE:KEY__WA_Sys_cde_cancelado_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FECHA_PAGO_566B5B6C,'CDE:KEY__WA_Sys_CDE_FECHA_PAGO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_SUMINISTRO_566B5B6C,'CDE:KEY__WA_Sys_CDE_SUMINISTRO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FECHA_1VTO_566B5B6C,'CDE:KEY__WA_Sys_CDE_FECHA_1VTO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_BANCO_SUCURSAL_PAGO_566B5B6C,'CDE:KEY__WA_Sys_CDE_BANCO_SUCURSAL_PAGO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FILIAL_CENTRO_ATENCION_PAGO_566B5B6C,'CDE:KEY__WA_Sys_CDE_FILIAL_CENTRO_ATENCION_PAGO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_cde_ano_566B5B6C,'CDE:KEY__WA_Sys_cde_ano_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_cde_periodo_566B5B6C,'CDE:KEY__WA_Sys_cde_periodo_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_Cde_Importe_566B5B6C,'CDE:KEY__WA_Sys_Cde_Importe_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_cde_fecha_plazo_otorgado_566B5B6C,'CDE:KEY__WA_Sys_cde_fecha_plazo_otorgado_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_cde_id_user_otorgo_plazo_566B5B6C,'CDE:KEY__WA_Sys_cde_id_user_otorgo_plazo_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FECHA_UPDATE_566B5B6C,'CDE:KEY__WA_Sys_CDE_FECHA_UPDATE_566B5B6C',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_SUCURSAL,'CDE:FK_COMPROBANTE_SUCURSAL',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_GRUPO_566B5B6C,'CDE:KEY__WA_Sys_CDE_GRUPO_566B5B6C',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_CLASE_COMPROBANTE,'CDE:FK_COMPROBANTE_CLASE_COMPROBANTE',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_RUTA_566B5B6C,'CDE:KEY__WA_Sys_CDE_RUTA_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_PAGO_EN_SUCURSAL_566B5B6C,'CDE:KEY__WA_Sys_CDE_PAGO_EN_SUCURSAL_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_LOTE_REPLICACION_566B5B6C,'CDE:KEY__WA_Sys_CDE_LOTE_REPLICACION_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FECHA_2VTO_566B5B6C,'CDE:KEY__WA_Sys_CDE_FECHA_2VTO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_CONSUMO_566B5B6C,'CDE:KEY__WA_Sys_CDE_CONSUMO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_ID_USER_566B5B6C,'CDE:KEY__WA_Sys_CDE_ID_USER_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FECHA_USER_OTORGO_566B5B6C,'CDE:KEY__WA_Sys_CDE_FECHA_USER_OTORGO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_MOTIVO_PLAZO_OTORGADO_566B5B6C,'CDE:KEY__WA_Sys_CDE_MOTIVO_PLAZO_OTORGADO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_FECHA_PROCESO_PAGO_566B5B6C,'CDE:KEY__WA_Sys_CDE_FECHA_PROCESO_PAGO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_CONSUMO_DIRECTO_566B5B6C,'CDE:KEY__WA_Sys_CDE_CONSUMO_DIRECTO_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_CONSUMO_CONVER_566B5B6C,'CDE:KEY__WA_Sys_CDE_CONSUMO_CONVER_566B5B6C',0)
    SELF.AddKey(CDE:KEY__WA_Sys_CDE_CALORIAS_566B5B6C,'CDE:KEY__WA_Sys_CDE_CALORIAS_566B5B6C',0)
    SELF.AddKey(CDE:IX_COMPROBANTE_ANO_PERIODO,'CDE:IX_COMPROBANTE_ANO_PERIODO',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_TIPO_COMPROBANTE,'CDE:FK_COMPROBANTE_TIPO_COMPROBANTE',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_GRUPO,'CDE:FK_COMPROBANTE_GRUPO',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_CLIENTE,'CDE:FK_COMPROBANTE_CLIENTE',0)
    SELF.AddKey(CDE:FK_COMPROBANTE_EMPRESA,'CDE:FK_COMPROBANTE_EMPRESA',0)
    SELF.AddKey(CDE:K_Tipo_Ano_Periodo_grupo,'K_Completa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:COMPROBANTE.Kill PROCEDURE

  CODE
  _Hide:Access:COMPROBANTE.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:COMPROBANTE &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:COMPROBANTE)                        ! destroy the file manager


Hide:Relate:per.Init PROCEDURE
  CODE
  _Hide:Access:per.Init
  SELF.Init(Access:per,1)


Hide:Access:per.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= per:Record
  SELF.FileNameValue = 'per'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= per
  PARENT.Init
  Access:per &= SELF


Hide:Access:per.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:per &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:per.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(per,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadOnly
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(per:per_nom,'per:per_nom',0)
    SELF.AddKey(per:per_emp,'per:per_emp',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:per.Kill PROCEDURE

  CODE
  _Hide:Access:per.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:per &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:per)                                ! destroy the file manager


Hide:Relate:datpers.Init PROCEDURE
  CODE
  _Hide:Access:datpers.Init
  SELF.Init(Access:datpers,1)


Hide:Access:datpers.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= datpers:Record
  SELF.FileNameValue = 'datpers'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= datpers
  PARENT.Init
  Access:datpers &= SELF


Hide:Access:datpers.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:datpers &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:datpers.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(datpers,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(datpers:datpers_cuil,'datpers:datpers_cuil',0)
    SELF.AddKey(datpers:datpers_emp,'datpers:datpers_emp',0)
    SELF.AddKey(datpers:datpers_lugpag,'datpers:datpers_lugpag',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:datpers.Kill PROCEDURE

  CODE
  _Hide:Access:datpers.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:datpers &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:datpers)                            ! destroy the file manager


Hide:Relate:CONVENIO.Init PROCEDURE
  CODE
  _Hide:Access:CONVENIO.Init
  SELF.Init(Access:CONVENIO,1)


Hide:Access:CONVENIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CON:Record
  SELF.FileNameValue = 'CONVENIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONVENIO
  PARENT.Init
  Access:CONVENIO &= SELF


Hide:Access:CONVENIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONVENIO &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONVENIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONVENIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CON:PK_CONVENIO,'CON:PK_CONVENIO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CONVENIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PARAMETRO_LICENCIA,RI:None,RI:None,PRML:FK_CONVENIO)
  SELF.AddRelationLink(CON:CONV_ID,PRML:PRML_CONVENIO)

  SELF.AddRelation(Relate:EMPLEADOS)

  SELF.AddRelation(Relate:REGIMEN_LICENCIAS_ESPECIALES,RI:None,RI:None,RLE:FK_RLE_CONVENIO)
  SELF.AddRelationLink(CON:CONV_ID,RLE:RLE_CONVENIO)


Hide:Relate:CONVENIO.Kill PROCEDURE

  CODE
  _Hide:Access:CONVENIO.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:CONVENIO &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONVENIO)                           ! destroy the file manager


Hide:Relate:DETALLE_LICENCIA.Init PROCEDURE
  CODE
  _Hide:Access:DETALLE_LICENCIA.Init
  SELF.Init(Access:DETALLE_LICENCIA,1)


Hide:Access:DETALLE_LICENCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DLIC:Record
  SELF.FileNameValue = 'DETALLE_LICENCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_LICENCIA
  PARENT.Init
  Access:DETALLE_LICENCIA &= SELF


Hide:Access:DETALLE_LICENCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_LICENCIA &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DETALLE_LICENCIA.PrimeFields PROCEDURE

  CODE
  DLIC:DLIC_ASUELDO = 'N'                                  ! Assign initial field value
  DLIC:DLIC_COBRAR = 'N'                                   ! Assign initial field value
  DLIC:DLIC_VIAJE = 'P'                                    ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DETALLE_LICENCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DETALLE_LICENCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DLIC:PK_DETALLE_LICENCIA,'DLIC:PK_DETALLE_LICENCIA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DETALLE_LICENCIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DIAS_VIAJE)

  SELF.AddRelation(Relate:LICENCIA)


Hide:Relate:DETALLE_LICENCIA.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_LICENCIA.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_LICENCIA &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_LICENCIA)                   ! destroy the file manager


Hide:Relate:DIAS_VIAJE.Init PROCEDURE
  CODE
  _Hide:Access:DIAS_VIAJE.Init
  SELF.Init(Access:DIAS_VIAJE,1)


Hide:Access:DIAS_VIAJE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DV:Record
  SELF.FileNameValue = 'DIAS_VIAJE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DIAS_VIAJE
  PARENT.Init
  Access:DIAS_VIAJE &= SELF


Hide:Access:DIAS_VIAJE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DIAS_VIAJE &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DIAS_VIAJE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DIAS_VIAJE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DV:PK_DIAS_VIAJE,'DV:PK_DIAS_VIAJE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DIAS_VIAJE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DETALLE_LICENCIA,RI:None,RI:None,DLIC:PK_DETALLE_LICENCIA)
  SELF.AddRelationLink(DV:DV_LEGAJO,DLIC:DLIC_LEGAJO)
  SELF.AddRelationLink(DV:DV_LICENCIA,DLIC:DLIC_ANIO)

  SELF.AddRelation(Relate:LICENCIA,RI:None,RI:None,LIC:PK_LICENCIA)
  SELF.AddRelationLink(DV:DV_LEGAJO,LIC:LIC_LEGAJO)
  SELF.AddRelationLink(DV:DV_LICENCIA,LIC:LIC_ANIO)


Hide:Relate:DIAS_VIAJE.Kill PROCEDURE

  CODE
  _Hide:Access:DIAS_VIAJE.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:DIAS_VIAJE &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DIAS_VIAJE)                         ! destroy the file manager


Hide:Relate:LICENCIA.Init PROCEDURE
  CODE
  _Hide:Access:LICENCIA.Init
  SELF.Init(Access:LICENCIA,1)


Hide:Access:LICENCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIC:Record
  SELF.FileNameValue = 'LICENCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LICENCIA
  PARENT.Init
  Access:LICENCIA &= SELF


Hide:Access:LICENCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LICENCIA &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LICENCIA.PrimeFields PROCEDURE

  CODE
  LIC:LIC_DEPOSITADA = 'N'                                 ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:LICENCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LICENCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LIC:FK_CTA,'LIC:FK_CTA',0)
    SELF.AddKey(LIC:PK_LICENCIA,'LIC:PK_LICENCIA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LICENCIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:EMPLEADOS)

  SELF.AddRelation(Relate:DETALLE_LICENCIA,RI:None,RI:None,DLIC:PK_DETALLE_LICENCIA)
  SELF.AddRelationLink(LIC:LIC_LEGAJO,DLIC:DLIC_LEGAJO)
  SELF.AddRelationLink(LIC:LIC_ANIO,DLIC:DLIC_ANIO)

  SELF.AddRelation(Relate:DIAS_VIAJE)

  SELF.AddRelation(Relate:CTA_CONTABLE)


Hide:Relate:LICENCIA.Kill PROCEDURE

  CODE
  _Hide:Access:LICENCIA.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:LICENCIA &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LICENCIA)                           ! destroy the file manager


Hide:Relate:PARAMETRO_DIAS_VIAJE.Init PROCEDURE
  CODE
  _Hide:Access:PARAMETRO_DIAS_VIAJE.Init
  SELF.Init(Access:PARAMETRO_DIAS_VIAJE,1)


Hide:Access:PARAMETRO_DIAS_VIAJE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PRMV:Record
  SELF.FileNameValue = 'PARAMETRO_DIAS_VIAJE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PARAMETRO_DIAS_VIAJE
  PARENT.Init
  Access:PARAMETRO_DIAS_VIAJE &= SELF


Hide:Access:PARAMETRO_DIAS_VIAJE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PARAMETRO_DIAS_VIAJE &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PARAMETRO_DIAS_VIAJE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PARAMETRO_DIAS_VIAJE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PRMV:PK_PARAMETRO_DIAS_VIAJE,'PRMV:PK_PARAMETRO_DIAS_VIAJE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PARAMETRO_DIAS_VIAJE.Kill PROCEDURE

  CODE
  _Hide:Access:PARAMETRO_DIAS_VIAJE.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:PARAMETRO_DIAS_VIAJE &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PARAMETRO_DIAS_VIAJE)               ! destroy the file manager


Hide:Relate:PARAMETRO_LICENCIA.Init PROCEDURE
  CODE
  _Hide:Access:PARAMETRO_LICENCIA.Init
  SELF.Init(Access:PARAMETRO_LICENCIA,1)


Hide:Access:PARAMETRO_LICENCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PRML:Record
  SELF.FileNameValue = 'PARAMETRO_LICENCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PARAMETRO_LICENCIA
  PARENT.Init
  Access:PARAMETRO_LICENCIA &= SELF


Hide:Access:PARAMETRO_LICENCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PARAMETRO_LICENCIA &= NULL                        ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PARAMETRO_LICENCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PARAMETRO_LICENCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PRML:FK_CONVENIO,'PRML:FK_CONVENIO',0)
    SELF.AddKey(PRML:PK_PARAMETRO_LICENCIA,'PRML:PK_PARAMETRO_LICENCIA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PARAMETRO_LICENCIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONVENIO)


Hide:Relate:PARAMETRO_LICENCIA.Kill PROCEDURE

  CODE
  _Hide:Access:PARAMETRO_LICENCIA.Kill                     ! Kill the file manager
  PARENT.Kill
  Relate:PARAMETRO_LICENCIA &= NULL                        ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PARAMETRO_LICENCIA)                 ! destroy the file manager


Hide:Relate:SECTOR.Init PROCEDURE
  CODE
  _Hide:Access:SECTOR.Init
  SELF.Init(Access:SECTOR,1)


Hide:Access:SECTOR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SEC:Record
  SELF.FileNameValue = 'SECTOR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SECTOR
  PARENT.Init
  Access:SECTOR &= SELF


Hide:Access:SECTOR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SECTOR &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SECTOR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SECTOR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SEC:PK_NOMBRE,'SEC:PK_NOMBRE',0)
    SELF.AddKey(SEC:PK_SECTOR,'SEC:PK_SECTOR',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SECTOR.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:EMPLEADOS)


Hide:Relate:SECTOR.Kill PROCEDURE

  CODE
  _Hide:Access:SECTOR.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:SECTOR &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SECTOR)                             ! destroy the file manager


Hide:Relate:FERIADOS.Init PROCEDURE
  CODE
  _Hide:Access:FERIADOS.Init
  SELF.Init(Access:FERIADOS,1)


Hide:Access:FERIADOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FER:Record
  SELF.FileNameValue = 'FERIADOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FERIADOS
  PARENT.Init
  Access:FERIADOS &= SELF


Hide:Access:FERIADOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FERIADOS &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FERIADOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FERIADOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FER:PK_FERIADOS,'FER:PK_FERIADOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FERIADOS.Kill PROCEDURE

  CODE
  _Hide:Access:FERIADOS.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:FERIADOS &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FERIADOS)                           ! destroy the file manager


Hide:Relate:empch.Init PROCEDURE
  CODE
  _Hide:Access:empch.Init
  SELF.Init(Access:empch,1)


Hide:Access:empch.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= empch:Record
  SELF.FileNameValue = 'empch'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= empch
  PARENT.Init
  Access:empch &= SELF


Hide:Access:empch.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:empch &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:empch.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(empch,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadOnly
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(empch:empch_nroliq,'empch:empch_nroliq',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:empch.Kill PROCEDURE

  CODE
  _Hide:Access:empch.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:empch &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:empch)                              ! destroy the file manager

