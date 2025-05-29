  MEMBER('personal.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
personal_BC1:DctInit    PROCEDURE
personal_BC1:DctKill    PROCEDURE
personal_BC1:FilesInit  PROCEDURE
  END

Hide:Access:TIPO_CONEXION CLASS(FileManager),TYPE          ! FileManager for TIPO_CONEXION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_CONEXION CLASS(RelationManager),TYPE      ! RelationManager for TIPO_CONEXION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PARAMETRO_CLIENTE_VAL CLASS(FileManager),TYPE  ! FileManager for PARAMETRO_CLIENTE_VAL
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PARAMETRO_CLIENTE_VAL CLASS(RelationManager),TYPE ! RelationManager for PARAMETRO_CLIENTE_VAL
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DEBITO_CREDITO_PENDIENTE CLASS(FileManager),TYPE ! FileManager for DEBITO_CREDITO_PENDIENTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:DEBITO_CREDITO_PENDIENTE CLASS(RelationManager),TYPE ! RelationManager for DEBITO_CREDITO_PENDIENTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CLIENTE_PERFIL CLASS(FileManager),TYPE         ! FileManager for CLIENTE_PERFIL
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CLIENTE_PERFIL CLASS(RelationManager),TYPE     ! RelationManager for CLIENTE_PERFIL
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ESTADO_CIVIL CLASS(FileManager),TYPE           ! FileManager for ESTADO_CIVIL
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ESTADO_CIVIL CLASS(RelationManager),TYPE       ! RelationManager for ESTADO_CIVIL
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_CONSUMO CLASS(FileManager),TYPE           ! FileManager for TIPO_CONSUMO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_CONSUMO CLASS(RelationManager),TYPE       ! RelationManager for TIPO_CONSUMO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_USUARIO CLASS(FileManager),TYPE           ! FileManager for TIPO_USUARIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_USUARIO CLASS(RelationManager),TYPE       ! RelationManager for TIPO_USUARIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LOTE_DETALLE_OBRA CLASS(FileManager),TYPE      ! FileManager for LOTE_DETALLE_OBRA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:LOTE_DETALLE_OBRA CLASS(RelationManager),TYPE  ! RelationManager for LOTE_DETALLE_OBRA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SUMINISTRO_TIPO_EMPRESA CLASS(FileManager),TYPE ! FileManager for SUMINISTRO_TIPO_EMPRESA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SUMINISTRO_TIPO_EMPRESA CLASS(RelationManager),TYPE ! RelationManager for SUMINISTRO_TIPO_EMPRESA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PROFESION_CLIENTE CLASS(FileManager),TYPE      ! FileManager for PROFESION_CLIENTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PROFESION_CLIENTE CLASS(RelationManager),TYPE  ! RelationManager for PROFESION_CLIENTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SUB_UNIDAD_PROVEEDORA CLASS(FileManager),TYPE  ! FileManager for SUB_UNIDAD_PROVEEDORA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SUB_UNIDAD_PROVEEDORA CLASS(RelationManager),TYPE ! RelationManager for SUB_UNIDAD_PROVEEDORA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CLIENTE  CLASS(FileManager),TYPE               ! FileManager for CLIENTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CLIENTE  CLASS(RelationManager),TYPE           ! RelationManager for CLIENTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:EMPRESA  CLASS(FileManager),TYPE               ! FileManager for EMPRESA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EMPRESA  CLASS(RelationManager),TYPE           ! RelationManager for EMPRESA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CLASIFICACION_CLIENTE CLASS(FileManager),TYPE  ! FileManager for CLASIFICACION_CLIENTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CLASIFICACION_CLIENTE CLASS(RelationManager),TYPE ! RelationManager for CLASIFICACION_CLIENTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:COMPROBANTE CLASS(FileManager),TYPE            ! FileManager for COMPROBANTE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:COMPROBANTE CLASS(RelationManager),TYPE        ! RelationManager for COMPROBANTE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:MEDICION CLASS(FileManager),TYPE               ! FileManager for MEDICION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:MEDICION CLASS(RelationManager),TYPE           ! RelationManager for MEDICION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CODIGO_POSTAL CLASS(FileManager),TYPE          ! FileManager for CODIGO_POSTAL
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CODIGO_POSTAL CLASS(RelationManager),TYPE      ! RelationManager for CODIGO_POSTAL
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TIPO_SERVICIO CLASS(FileManager),TYPE          ! FileManager for TIPO_SERVICIO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TIPO_SERVICIO CLASS(RelationManager),TYPE      ! RelationManager for TIPO_SERVICIO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PUNTO_MEDICION CLASS(FileManager),TYPE         ! FileManager for PUNTO_MEDICION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PUNTO_MEDICION CLASS(RelationManager),TYPE     ! RelationManager for PUNTO_MEDICION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ESTADO_OPERATIVO CLASS(FileManager),TYPE       ! FileManager for ESTADO_OPERATIVO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ESTADO_OPERATIVO CLASS(RelationManager),TYPE   ! RelationManager for ESTADO_OPERATIVO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:TIPO_CONEXION &Hide:Access:TIPO_CONEXION,AUTO,THREAD
_Hide:Relate:TIPO_CONEXION &Hide:Relate:TIPO_CONEXION,AUTO,THREAD
_Hide:Access:PARAMETRO_CLIENTE_VAL &Hide:Access:PARAMETRO_CLIENTE_VAL,AUTO,THREAD
_Hide:Relate:PARAMETRO_CLIENTE_VAL &Hide:Relate:PARAMETRO_CLIENTE_VAL,AUTO,THREAD
_Hide:Access:DEBITO_CREDITO_PENDIENTE &Hide:Access:DEBITO_CREDITO_PENDIENTE,AUTO,THREAD
_Hide:Relate:DEBITO_CREDITO_PENDIENTE &Hide:Relate:DEBITO_CREDITO_PENDIENTE,AUTO,THREAD
_Hide:Access:CLIENTE_PERFIL &Hide:Access:CLIENTE_PERFIL,AUTO,THREAD
_Hide:Relate:CLIENTE_PERFIL &Hide:Relate:CLIENTE_PERFIL,AUTO,THREAD
_Hide:Access:ESTADO_CIVIL &Hide:Access:ESTADO_CIVIL,AUTO,THREAD
_Hide:Relate:ESTADO_CIVIL &Hide:Relate:ESTADO_CIVIL,AUTO,THREAD
_Hide:Access:TIPO_CONSUMO &Hide:Access:TIPO_CONSUMO,AUTO,THREAD
_Hide:Relate:TIPO_CONSUMO &Hide:Relate:TIPO_CONSUMO,AUTO,THREAD
_Hide:Access:TIPO_USUARIO &Hide:Access:TIPO_USUARIO,AUTO,THREAD
_Hide:Relate:TIPO_USUARIO &Hide:Relate:TIPO_USUARIO,AUTO,THREAD
_Hide:Access:LOTE_DETALLE_OBRA &Hide:Access:LOTE_DETALLE_OBRA,AUTO,THREAD
_Hide:Relate:LOTE_DETALLE_OBRA &Hide:Relate:LOTE_DETALLE_OBRA,AUTO,THREAD
_Hide:Access:SUMINISTRO_TIPO_EMPRESA &Hide:Access:SUMINISTRO_TIPO_EMPRESA,AUTO,THREAD
_Hide:Relate:SUMINISTRO_TIPO_EMPRESA &Hide:Relate:SUMINISTRO_TIPO_EMPRESA,AUTO,THREAD
_Hide:Access:PROFESION_CLIENTE &Hide:Access:PROFESION_CLIENTE,AUTO,THREAD
_Hide:Relate:PROFESION_CLIENTE &Hide:Relate:PROFESION_CLIENTE,AUTO,THREAD
_Hide:Access:SUB_UNIDAD_PROVEEDORA &Hide:Access:SUB_UNIDAD_PROVEEDORA,AUTO,THREAD
_Hide:Relate:SUB_UNIDAD_PROVEEDORA &Hide:Relate:SUB_UNIDAD_PROVEEDORA,AUTO,THREAD
_Hide:Access:CLIENTE &Hide:Access:CLIENTE,AUTO,THREAD
_Hide:Relate:CLIENTE &Hide:Relate:CLIENTE,AUTO,THREAD
_Hide:Access:EMPRESA &Hide:Access:EMPRESA,AUTO,THREAD
_Hide:Relate:EMPRESA &Hide:Relate:EMPRESA,AUTO,THREAD
_Hide:Access:CLASIFICACION_CLIENTE &Hide:Access:CLASIFICACION_CLIENTE,AUTO,THREAD
_Hide:Relate:CLASIFICACION_CLIENTE &Hide:Relate:CLASIFICACION_CLIENTE,AUTO,THREAD
_Hide:Access:COMPROBANTE &Hide:Access:COMPROBANTE,AUTO,THREAD
_Hide:Relate:COMPROBANTE &Hide:Relate:COMPROBANTE,AUTO,THREAD
_Hide:Access:MEDICION &Hide:Access:MEDICION,AUTO,THREAD
_Hide:Relate:MEDICION &Hide:Relate:MEDICION,AUTO,THREAD
_Hide:Access:CODIGO_POSTAL &Hide:Access:CODIGO_POSTAL,AUTO,THREAD
_Hide:Relate:CODIGO_POSTAL &Hide:Relate:CODIGO_POSTAL,AUTO,THREAD
_Hide:Access:TIPO_SERVICIO &Hide:Access:TIPO_SERVICIO,AUTO,THREAD
_Hide:Relate:TIPO_SERVICIO &Hide:Relate:TIPO_SERVICIO,AUTO,THREAD
_Hide:Access:PUNTO_MEDICION &Hide:Access:PUNTO_MEDICION,AUTO,THREAD
_Hide:Relate:PUNTO_MEDICION &Hide:Relate:PUNTO_MEDICION,AUTO,THREAD
_Hide:Access:ESTADO_OPERATIVO &Hide:Access:ESTADO_OPERATIVO,AUTO,THREAD
_Hide:Relate:ESTADO_OPERATIVO &Hide:Relate:ESTADO_OPERATIVO,AUTO,THREAD


personal_BC1:DctInit PROCEDURE
  CODE
  _Hide:Access:TIPO_CONEXION &= NEW(Hide:Access:TIPO_CONEXION)
  _Hide:Relate:TIPO_CONEXION &= NEW(Hide:Relate:TIPO_CONEXION)
  _Hide:Access:PARAMETRO_CLIENTE_VAL &= NEW(Hide:Access:PARAMETRO_CLIENTE_VAL)
  _Hide:Relate:PARAMETRO_CLIENTE_VAL &= NEW(Hide:Relate:PARAMETRO_CLIENTE_VAL)
  _Hide:Access:DEBITO_CREDITO_PENDIENTE &= NEW(Hide:Access:DEBITO_CREDITO_PENDIENTE)
  _Hide:Relate:DEBITO_CREDITO_PENDIENTE &= NEW(Hide:Relate:DEBITO_CREDITO_PENDIENTE)
  _Hide:Access:CLIENTE_PERFIL &= NEW(Hide:Access:CLIENTE_PERFIL)
  _Hide:Relate:CLIENTE_PERFIL &= NEW(Hide:Relate:CLIENTE_PERFIL)
  _Hide:Access:ESTADO_CIVIL &= NEW(Hide:Access:ESTADO_CIVIL)
  _Hide:Relate:ESTADO_CIVIL &= NEW(Hide:Relate:ESTADO_CIVIL)
  _Hide:Access:TIPO_CONSUMO &= NEW(Hide:Access:TIPO_CONSUMO)
  _Hide:Relate:TIPO_CONSUMO &= NEW(Hide:Relate:TIPO_CONSUMO)
  _Hide:Access:TIPO_USUARIO &= NEW(Hide:Access:TIPO_USUARIO)
  _Hide:Relate:TIPO_USUARIO &= NEW(Hide:Relate:TIPO_USUARIO)
  _Hide:Access:LOTE_DETALLE_OBRA &= NEW(Hide:Access:LOTE_DETALLE_OBRA)
  _Hide:Relate:LOTE_DETALLE_OBRA &= NEW(Hide:Relate:LOTE_DETALLE_OBRA)
  _Hide:Access:SUMINISTRO_TIPO_EMPRESA &= NEW(Hide:Access:SUMINISTRO_TIPO_EMPRESA)
  _Hide:Relate:SUMINISTRO_TIPO_EMPRESA &= NEW(Hide:Relate:SUMINISTRO_TIPO_EMPRESA)
  _Hide:Access:PROFESION_CLIENTE &= NEW(Hide:Access:PROFESION_CLIENTE)
  _Hide:Relate:PROFESION_CLIENTE &= NEW(Hide:Relate:PROFESION_CLIENTE)
  _Hide:Access:SUB_UNIDAD_PROVEEDORA &= NEW(Hide:Access:SUB_UNIDAD_PROVEEDORA)
  _Hide:Relate:SUB_UNIDAD_PROVEEDORA &= NEW(Hide:Relate:SUB_UNIDAD_PROVEEDORA)
  _Hide:Access:CLIENTE &= NEW(Hide:Access:CLIENTE)
  _Hide:Relate:CLIENTE &= NEW(Hide:Relate:CLIENTE)
  _Hide:Access:EMPRESA &= NEW(Hide:Access:EMPRESA)
  _Hide:Relate:EMPRESA &= NEW(Hide:Relate:EMPRESA)
  _Hide:Access:CLASIFICACION_CLIENTE &= NEW(Hide:Access:CLASIFICACION_CLIENTE)
  _Hide:Relate:CLASIFICACION_CLIENTE &= NEW(Hide:Relate:CLASIFICACION_CLIENTE)
  _Hide:Access:COMPROBANTE &= NEW(Hide:Access:COMPROBANTE)
  _Hide:Relate:COMPROBANTE &= NEW(Hide:Relate:COMPROBANTE)
  _Hide:Access:MEDICION &= NEW(Hide:Access:MEDICION)
  _Hide:Relate:MEDICION &= NEW(Hide:Relate:MEDICION)
  _Hide:Access:CODIGO_POSTAL &= NEW(Hide:Access:CODIGO_POSTAL)
  _Hide:Relate:CODIGO_POSTAL &= NEW(Hide:Relate:CODIGO_POSTAL)
  _Hide:Access:TIPO_SERVICIO &= NEW(Hide:Access:TIPO_SERVICIO)
  _Hide:Relate:TIPO_SERVICIO &= NEW(Hide:Relate:TIPO_SERVICIO)
  _Hide:Access:PUNTO_MEDICION &= NEW(Hide:Access:PUNTO_MEDICION)
  _Hide:Relate:PUNTO_MEDICION &= NEW(Hide:Relate:PUNTO_MEDICION)
  _Hide:Access:ESTADO_OPERATIVO &= NEW(Hide:Access:ESTADO_OPERATIVO)
  _Hide:Relate:ESTADO_OPERATIVO &= NEW(Hide:Relate:ESTADO_OPERATIVO)
  Relate:TIPO_CONEXION &= _Hide:Relate:TIPO_CONEXION
  Relate:PARAMETRO_CLIENTE_VAL &= _Hide:Relate:PARAMETRO_CLIENTE_VAL
  Relate:DEBITO_CREDITO_PENDIENTE &= _Hide:Relate:DEBITO_CREDITO_PENDIENTE
  Relate:CLIENTE_PERFIL &= _Hide:Relate:CLIENTE_PERFIL
  Relate:ESTADO_CIVIL &= _Hide:Relate:ESTADO_CIVIL
  Relate:TIPO_CONSUMO &= _Hide:Relate:TIPO_CONSUMO
  Relate:TIPO_USUARIO &= _Hide:Relate:TIPO_USUARIO
  Relate:LOTE_DETALLE_OBRA &= _Hide:Relate:LOTE_DETALLE_OBRA
  Relate:SUMINISTRO_TIPO_EMPRESA &= _Hide:Relate:SUMINISTRO_TIPO_EMPRESA
  Relate:PROFESION_CLIENTE &= _Hide:Relate:PROFESION_CLIENTE
  Relate:SUB_UNIDAD_PROVEEDORA &= _Hide:Relate:SUB_UNIDAD_PROVEEDORA
  Relate:CLIENTE &= _Hide:Relate:CLIENTE
  Relate:EMPRESA &= _Hide:Relate:EMPRESA
  Relate:CLASIFICACION_CLIENTE &= _Hide:Relate:CLASIFICACION_CLIENTE
  Relate:COMPROBANTE &= _Hide:Relate:COMPROBANTE
  Relate:MEDICION &= _Hide:Relate:MEDICION
  Relate:CODIGO_POSTAL &= _Hide:Relate:CODIGO_POSTAL
  Relate:TIPO_SERVICIO &= _Hide:Relate:TIPO_SERVICIO
  Relate:PUNTO_MEDICION &= _Hide:Relate:PUNTO_MEDICION
  Relate:ESTADO_OPERATIVO &= _Hide:Relate:ESTADO_OPERATIVO


personal_BC1:FilesInit PROCEDURE
  CODE
  _Hide:Relate:TIPO_CONEXION.Init
  _Hide:Relate:PARAMETRO_CLIENTE_VAL.Init
  _Hide:Relate:DEBITO_CREDITO_PENDIENTE.Init
  _Hide:Relate:CLIENTE_PERFIL.Init
  _Hide:Relate:ESTADO_CIVIL.Init
  _Hide:Relate:TIPO_CONSUMO.Init
  _Hide:Relate:TIPO_USUARIO.Init
  _Hide:Relate:LOTE_DETALLE_OBRA.Init
  _Hide:Relate:SUMINISTRO_TIPO_EMPRESA.Init
  _Hide:Relate:PROFESION_CLIENTE.Init
  _Hide:Relate:SUB_UNIDAD_PROVEEDORA.Init
  _Hide:Relate:CLIENTE.Init
  _Hide:Relate:EMPRESA.Init
  _Hide:Relate:CLASIFICACION_CLIENTE.Init
  _Hide:Relate:COMPROBANTE.Init
  _Hide:Relate:MEDICION.Init
  _Hide:Relate:CODIGO_POSTAL.Init
  _Hide:Relate:TIPO_SERVICIO.Init
  _Hide:Relate:PUNTO_MEDICION.Init
  _Hide:Relate:ESTADO_OPERATIVO.Init


personal_BC1:DctKill PROCEDURE
  CODE
  _Hide:Relate:TIPO_CONEXION.Kill
  DISPOSE(_Hide:Relate:TIPO_CONEXION)
  _Hide:Relate:PARAMETRO_CLIENTE_VAL.Kill
  DISPOSE(_Hide:Relate:PARAMETRO_CLIENTE_VAL)
  _Hide:Relate:DEBITO_CREDITO_PENDIENTE.Kill
  DISPOSE(_Hide:Relate:DEBITO_CREDITO_PENDIENTE)
  _Hide:Relate:CLIENTE_PERFIL.Kill
  DISPOSE(_Hide:Relate:CLIENTE_PERFIL)
  _Hide:Relate:ESTADO_CIVIL.Kill
  DISPOSE(_Hide:Relate:ESTADO_CIVIL)
  _Hide:Relate:TIPO_CONSUMO.Kill
  DISPOSE(_Hide:Relate:TIPO_CONSUMO)
  _Hide:Relate:TIPO_USUARIO.Kill
  DISPOSE(_Hide:Relate:TIPO_USUARIO)
  _Hide:Relate:LOTE_DETALLE_OBRA.Kill
  DISPOSE(_Hide:Relate:LOTE_DETALLE_OBRA)
  _Hide:Relate:SUMINISTRO_TIPO_EMPRESA.Kill
  DISPOSE(_Hide:Relate:SUMINISTRO_TIPO_EMPRESA)
  _Hide:Relate:PROFESION_CLIENTE.Kill
  DISPOSE(_Hide:Relate:PROFESION_CLIENTE)
  _Hide:Relate:SUB_UNIDAD_PROVEEDORA.Kill
  DISPOSE(_Hide:Relate:SUB_UNIDAD_PROVEEDORA)
  _Hide:Relate:CLIENTE.Kill
  DISPOSE(_Hide:Relate:CLIENTE)
  _Hide:Relate:EMPRESA.Kill
  DISPOSE(_Hide:Relate:EMPRESA)
  _Hide:Relate:CLASIFICACION_CLIENTE.Kill
  DISPOSE(_Hide:Relate:CLASIFICACION_CLIENTE)
  _Hide:Relate:COMPROBANTE.Kill
  DISPOSE(_Hide:Relate:COMPROBANTE)
  _Hide:Relate:MEDICION.Kill
  DISPOSE(_Hide:Relate:MEDICION)
  _Hide:Relate:CODIGO_POSTAL.Kill
  DISPOSE(_Hide:Relate:CODIGO_POSTAL)
  _Hide:Relate:TIPO_SERVICIO.Kill
  DISPOSE(_Hide:Relate:TIPO_SERVICIO)
  _Hide:Relate:PUNTO_MEDICION.Kill
  DISPOSE(_Hide:Relate:PUNTO_MEDICION)
  _Hide:Relate:ESTADO_OPERATIVO.Kill
  DISPOSE(_Hide:Relate:ESTADO_OPERATIVO)


Hide:Relate:TIPO_CONEXION.Init PROCEDURE
  CODE
  _Hide:Access:TIPO_CONEXION.Init
  SELF.Init(Access:TIPO_CONEXION,1)


Hide:Access:TIPO_CONEXION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TCO:Record
  SELF.FileNameValue = 'TIPO_CONEXION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_CONEXION
  PARENT.Init
  Access:TIPO_CONEXION &= SELF


Hide:Access:TIPO_CONEXION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_CONEXION &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_CONEXION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_CONEXION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TCO:PK_TIPO_CONEXION,'TCO:PK_TIPO_CONEXION',0)
    SELF.AddKey(TCO:FK_TIPO_CONEXION_TIPO_EMPRESA,'TCO:FK_TIPO_CONEXION_TIPO_EMPRESA',0)
    SELF.AddKey(TCO:KEY__WA_Sys_TCO_ACTIVO_3D2AAC56,'TCO:KEY__WA_Sys_TCO_ACTIVO_3D2AAC56',0)
    SELF.AddKey(TCO:KEY__WA_Sys_TCO_FACTOR_3D2AAC56,'TCO:KEY__WA_Sys_TCO_FACTOR_3D2AAC56',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TIPO_CONEXION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_EMPRESA3 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('TCO:TCO_TIPO_EMPRESA')
    Save:TIPO_EMPRESA3 = Access:TIPO_EMPRESA.SaveFile()
    TIE:TIE_ID = TCO:TCO_TIPO_EMPRESA
    ReturnValue = Access:TIPO_EMPRESA.TryFetch(TIE:PK_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_EMPRESA')
      END
    END
    Access:TIPO_EMPRESA.RestoreFile(Save:TIPO_EMPRESA3)
  END
  RETURN ReturnValue


Hide:Relate:TIPO_CONEXION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:KEY_KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_CONEXION)
  SELF.AddRelationLink(TCO:TCO_ID,STE:STE_TIPO_CONEXION)


Hide:Relate:TIPO_CONEXION.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_CONEXION.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_CONEXION &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_CONEXION)                      ! destroy the file manager


Hide:Relate:PARAMETRO_CLIENTE_VAL.Init PROCEDURE
  CODE
  _Hide:Access:PARAMETRO_CLIENTE_VAL.Init
  SELF.Init(Access:PARAMETRO_CLIENTE_VAL,1)


Hide:Access:PARAMETRO_CLIENTE_VAL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAR:Record
  SELF.FileNameValue = 'PARAMETRO_CLIENTE_VAL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PARAMETRO_CLIENTE_VAL
  PARENT.Init
  Access:PARAMETRO_CLIENTE_VAL &= SELF


Hide:Access:PARAMETRO_CLIENTE_VAL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PARAMETRO_CLIENTE_VAL &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PARAMETRO_CLIENTE_VAL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PARAMETRO_CLIENTE_VAL,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAR:PK_PARAMETRO_CLIENTE_VAL,'PAR:PK_PARAMETRO_CLIENTE_VAL',0)
    SELF.AddKey(PAR:KEY__WA_Sys_PCV_CLIENTE_405131C4,'PAR:KEY__WA_Sys_PCV_CLIENTE_405131C4',0)
    SELF.AddKey(PAR:KEY__WA_Sys_PCV_FECHA_VIGENCIA_405131C4,'PAR:KEY__WA_Sys_PCV_FECHA_VIGENCIA_405131C4',0)
    SELF.AddKey(PAR:KEY__WA_Sys_PCV_PARAMETRO_405131C4,'PAR:KEY__WA_Sys_PCV_PARAMETRO_405131C4',0)
    SELF.AddKey(PAR:KEY__WA_Sys_PCV_FECHA_BAJA_405131C4,'PAR:KEY__WA_Sys_PCV_FECHA_BAJA_405131C4',0)
    SELF.AddKey(PAR:FK_PARAMETRO_CLIENTE_VAL_PARAMETRO,'PAR:FK_PARAMETRO_CLIENTE_VAL_PARAMETRO',0)
    SELF.AddKey(PAR:FK_PARAMETRO_CLIENTE_VAL_SUMINISTRO,'PAR:FK_PARAMETRO_CLIENTE_VAL_SUMINISTRO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PARAMETRO_CLIENTE_VAL.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CLIENTE1      USHORT,AUTO
Save:CLIENTE3      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('PAR:PCV_EMPRESA')
    Save:CLIENTE1 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = PAR:PCV_EMPRESA
    CLI:CLI_ID = PAR:PCV_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE1)
  OF 3
    GlobalErrors.SetField('PAR:PCV_CLIENTE')
    Save:CLIENTE3 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = PAR:PCV_EMPRESA
    CLI:CLI_ID = PAR:PCV_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE3)
  END
  RETURN ReturnValue


Hide:Relate:PARAMETRO_CLIENTE_VAL.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE)


Hide:Relate:PARAMETRO_CLIENTE_VAL.Kill PROCEDURE

  CODE
  _Hide:Access:PARAMETRO_CLIENTE_VAL.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:PARAMETRO_CLIENTE_VAL &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PARAMETRO_CLIENTE_VAL)              ! destroy the file manager


Hide:Relate:DEBITO_CREDITO_PENDIENTE.Init PROCEDURE
  CODE
  _Hide:Access:DEBITO_CREDITO_PENDIENTE.Init
  SELF.Init(Access:DEBITO_CREDITO_PENDIENTE,1)


Hide:Access:DEBITO_CREDITO_PENDIENTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DCP:Record
  SELF.FileNameValue = 'DEBITO_CREDITO_PENDIENTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DEBITO_CREDITO_PENDIENTE
  PARENT.Init
  Access:DEBITO_CREDITO_PENDIENTE &= SELF


Hide:Access:DEBITO_CREDITO_PENDIENTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DEBITO_CREDITO_PENDIENTE &= NULL                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DEBITO_CREDITO_PENDIENTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DEBITO_CREDITO_PENDIENTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DCP:PK_DEBITO_CREDITO_PENDIENTE,'DCP:PK_DEBITO_CREDITO_PENDIENTE',0)
    SELF.AddKey(DCP:FK_DEBITO_CREDITO_PENDIENTE_CONCEPTO,'DCP:FK_DEBITO_CREDITO_PENDIENTE_CONCEPTO',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_CONCEPTO_42C520C9,'DCP:KEY__WA_Sys_DCP_CONCEPTO_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_FECHA_GENERACION_42C520C9,'DCP:KEY__WA_Sys_DCP_FECHA_GENERACION_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_CANCELADO_42C520C9,'DCP:KEY__WA_Sys_DCP_CANCELADO_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_APLICA_EN_42C520C9,'DCP:KEY__WA_Sys_DCP_APLICA_EN_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_SUMINISTRO_42C520C9,'DCP:KEY__WA_Sys_DCP_SUMINISTRO_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_CLIENTE_42C520C9,'DCP:KEY__WA_Sys_DCP_CLIENTE_42C520C9',0)
    SELF.AddKey(DCP:FK_DEBITO_CREDITO_PENDIENTE_TIPO_COMPROBANTE,'DCP:FK_DEBITO_CREDITO_PENDIENTE_TIPO_COMPROBANTE',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_SUCURSAL_42C520C9,'DCP:KEY__WA_Sys_DCP_SUCURSAL_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_NUMERO_COMP_ORIGEN_42C520C9,'DCP:KEY__WA_Sys_DCP_NUMERO_COMP_ORIGEN_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_CENTRO_ATENCION_42C520C9,'DCP:KEY__WA_Sys_DCP_CENTRO_ATENCION_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_NUMERO_CHEQUE_42C520C9,'DCP:KEY__WA_Sys_DCP_NUMERO_CHEQUE_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_BANCO_42C520C9,'DCP:KEY__WA_Sys_DCP_BANCO_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_TIPO_42C520C9,'DCP:KEY__WA_Sys_DCP_TIPO_42C520C9',0)
    SELF.AddKey(DCP:KEY__WA_Sys_DCP_AUTMAN_42C520C9,'DCP:KEY__WA_Sys_DCP_AUTMAN_42C520C9',0)
    SELF.AddKey(DCP:FK_DEBITO_CREDITO_PENDIENTE_SUMINISTRO,'DCP:FK_DEBITO_CREDITO_PENDIENTE_SUMINISTRO',0)
    SELF.AddKey(DCP:FK_DEBITO_CREDITO_PENDIENTE_CENTRO_ATENCION,'DCP:FK_DEBITO_CREDITO_PENDIENTE_CENTRO_ATENCION',0)
    SELF.AddKey(DCP:FK_DEBITO_CREDITO_PENDIENTE_CLIENTE,'DCP:FK_DEBITO_CREDITO_PENDIENTE_CLIENTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:DEBITO_CREDITO_PENDIENTE.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUMINISTRO2   USHORT,AUTO
Save:SUMINISTRO3   USHORT,AUTO
Save:SUMINISTRO4   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('DCP:DCP_EMPRESA')
    Save:SUMINISTRO2 = Access:SUMINISTRO.SaveFile()
    SUM:SUM_EMPRESA = DCP:DCP_EMPRESA
    SUM:SUM_CLIENTE = DCP:DCP_CLIENTE
    SUM:SUM_ID = DCP:DCP_SUMINISTRO
    ReturnValue = Access:SUMINISTRO.TryFetch(SUM:PK_SUMINISTRO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO')
      END
    END
    Access:SUMINISTRO.RestoreFile(Save:SUMINISTRO2)
  OF 3
    GlobalErrors.SetField('DCP:DCP_CLIENTE')
    Save:SUMINISTRO3 = Access:SUMINISTRO.SaveFile()
    SUM:SUM_EMPRESA = DCP:DCP_EMPRESA
    SUM:SUM_CLIENTE = DCP:DCP_CLIENTE
    SUM:SUM_ID = DCP:DCP_SUMINISTRO
    ReturnValue = Access:SUMINISTRO.TryFetch(SUM:PK_SUMINISTRO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO')
      END
    END
    Access:SUMINISTRO.RestoreFile(Save:SUMINISTRO3)
  OF 4
    GlobalErrors.SetField('DCP:DCP_SUMINISTRO')
    Save:SUMINISTRO4 = Access:SUMINISTRO.SaveFile()
    SUM:SUM_EMPRESA = DCP:DCP_EMPRESA
    SUM:SUM_CLIENTE = DCP:DCP_CLIENTE
    SUM:SUM_ID = DCP:DCP_SUMINISTRO
    ReturnValue = Access:SUMINISTRO.TryFetch(SUM:PK_SUMINISTRO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO')
      END
    END
    Access:SUMINISTRO.RestoreFile(Save:SUMINISTRO4)
  END
  RETURN ReturnValue


Hide:Relate:DEBITO_CREDITO_PENDIENTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE)

  SELF.AddRelation(Relate:SUMINISTRO)


Hide:Relate:DEBITO_CREDITO_PENDIENTE.Kill PROCEDURE

  CODE
  _Hide:Access:DEBITO_CREDITO_PENDIENTE.Kill               ! Kill the file manager
  PARENT.Kill
  Relate:DEBITO_CREDITO_PENDIENTE &= NULL                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DEBITO_CREDITO_PENDIENTE)           ! destroy the file manager


Hide:Relate:CLIENTE_PERFIL.Init PROCEDURE
  CODE
  _Hide:Access:CLIENTE_PERFIL.Init
  SELF.Init(Access:CLIENTE_PERFIL,1)


Hide:Access:CLIENTE_PERFIL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CLP:Record
  SELF.FileNameValue = 'CLIENTE_PERFIL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CLIENTE_PERFIL
  PARENT.Init
  Access:CLIENTE_PERFIL &= SELF


Hide:Access:CLIENTE_PERFIL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CLIENTE_PERFIL &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CLIENTE_PERFIL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CLIENTE_PERFIL,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CLP:PK_CLIENTE_PERFIL,'CLP:PK_CLIENTE_PERFIL',0)
    SELF.AddKey(CLP:KEY__WA_Sys_CLP_CLIENTE_4416D5B0,'CLP:KEY__WA_Sys_CLP_CLIENTE_4416D5B0',0)
    SELF.AddKey(CLP:KEY__WA_Sys_CLP_PREGUNTA_4416D5B0,'CLP:KEY__WA_Sys_CLP_PREGUNTA_4416D5B0',0)
    SELF.AddKey(CLP:KEY__WA_Sys_CLP_RESPUESTA_CODIFICADA_4416D5B0,'CLP:KEY__WA_Sys_CLP_RESPUESTA_CODIFICADA_4416D5B0',0)
    SELF.AddKey(CLP:FK_CLIENTE_PERFIL_PREGUNTA_PERFIL_CLIENTE,'CLP:FK_CLIENTE_PERFIL_PREGUNTA_PERFIL_CLIENTE',0)
    SELF.AddKey(CLP:FK_CLIENTE_PERFIL_ASOCIACION_PREGUNTA_RESPUESTA,'CLP:FK_CLIENTE_PERFIL_ASOCIACION_PREGUNTA_RESPUESTA',0)
    SELF.AddKey(CLP:FK_CLIENTE_PERFIL_CLIENTE,'CLP:FK_CLIENTE_PERFIL_CLIENTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CLIENTE_PERFIL.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CLIENTE1      USHORT,AUTO
Save:CLIENTE2      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CLP:CLP_EMPRESA')
    Save:CLIENTE1 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = CLP:CLP_EMPRESA
    CLI:CLI_ID = CLP:CLP_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE1)
  OF 2
    GlobalErrors.SetField('CLP:CLP_CLIENTE')
    Save:CLIENTE2 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = CLP:CLP_EMPRESA
    CLI:CLI_ID = CLP:CLP_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE2)
  END
  RETURN ReturnValue


Hide:Relate:CLIENTE_PERFIL.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE)


Hide:Relate:CLIENTE_PERFIL.Kill PROCEDURE

  CODE
  _Hide:Access:CLIENTE_PERFIL.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:CLIENTE_PERFIL &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CLIENTE_PERFIL)                     ! destroy the file manager


Hide:Relate:ESTADO_CIVIL.Init PROCEDURE
  CODE
  _Hide:Access:ESTADO_CIVIL.Init
  SELF.Init(Access:ESTADO_CIVIL,1)


Hide:Access:ESTADO_CIVIL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ESC:Record
  SELF.FileNameValue = 'ESTADO_CIVIL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ESTADO_CIVIL
  PARENT.Init
  Access:ESTADO_CIVIL &= SELF


Hide:Access:ESTADO_CIVIL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ESTADO_CIVIL &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ESTADO_CIVIL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ESTADO_CIVIL,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ESC:PK_ESTADO_CIVIL,'ESC:PK_ESTADO_CIVIL',0)
    SELF.AddKey(ESC:KEY__WA_Sys_ESC_ACTIVO_4420F751,'ESC:KEY__WA_Sys_ESC_ACTIVO_4420F751',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ESTADO_CIVIL.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_ESTADO_CIVIL)
  SELF.AddRelationLink(ESC:ESC_CODIGO,CLI:CLI_ESTADO_CIVIL)


Hide:Relate:ESTADO_CIVIL.Kill PROCEDURE

  CODE
  _Hide:Access:ESTADO_CIVIL.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:ESTADO_CIVIL &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ESTADO_CIVIL)                       ! destroy the file manager


Hide:Relate:TIPO_CONSUMO.Init PROCEDURE
  CODE
  _Hide:Access:TIPO_CONSUMO.Init
  SELF.Init(Access:TIPO_CONSUMO,1)


Hide:Access:TIPO_CONSUMO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIC:Record
  SELF.FileNameValue = 'TIPO_CONSUMO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_CONSUMO
  PARENT.Init
  Access:TIPO_CONSUMO &= SELF


Hide:Access:TIPO_CONSUMO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_CONSUMO &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_CONSUMO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_CONSUMO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIC:PK_TIPO_CONSUMO,'TIC:PK_TIPO_CONSUMO',0)
    SELF.AddKey(TIC:FK_TIPO_CONSUMO_TIPO_EMPRESA,'TIC:FK_TIPO_CONSUMO_TIPO_EMPRESA',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_ACTIVO_47A83AC9,'TIC:KEY__WA_Sys_TIC_ACTIVO_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_UTILIZA_FACTOR_PRESION_47A83AC9,'TIC:KEY__WA_Sys_TIC_UTILIZA_FACTOR_PRESION_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_SITUACION_IVA_47A83AC9,'TIC:KEY__WA_Sys_TIC_SITUACION_IVA_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_ABREVIATURA_47A83AC9,'TIC:KEY__WA_Sys_TIC_ABREVIATURA_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_DESCRIPCION_47A83AC9,'TIC:KEY__WA_Sys_TIC_DESCRIPCION_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_TIPO_CONSUMO_47A83AC9,'TIC:KEY__WA_Sys_TIC_TIPO_CONSUMO_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_TARIFA_CONSUMO_47A83AC9,'TIC:KEY__WA_Sys_TIC_TARIFA_CONSUMO_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_TARIFA_RESERVA_47A83AC9,'TIC:KEY__WA_Sys_TIC_TARIFA_RESERVA_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_CARGO_FIJO_47A83AC9,'TIC:KEY__WA_Sys_TIC_CARGO_FIJO_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_FACTURA_MINIMA_47A83AC9,'TIC:KEY__WA_Sys_TIC_FACTURA_MINIMA_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_TRANSPORTE_47A83AC9,'TIC:KEY__WA_Sys_TIC_TRANSPORTE_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_IMPUTACION_CONTABLE_47A83AC9,'TIC:KEY__WA_Sys_TIC_IMPUTACION_CONTABLE_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_UTILIZA_TRANSFORMADOR_47A83AC9,'TIC:KEY__WA_Sys_TIC_UTILIZA_TRANSFORMADOR_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_CARGO_FIJO_DESCUENTO_47A83AC9,'TIC:KEY__WA_Sys_TIC_CARGO_FIJO_DESCUENTO_47A83AC9',0)
    SELF.AddKey(TIC:KEY_KEY__WA_Sys_TIC_TARIFA_CONSUMO_DESCUENTO_47A83AC9,'TIC:KEY_KEY__WA_Sys_TIC_TARIFA_CONSUMO_DESCUENTO_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_ID_USER_47A83AC9,'TIC:KEY__WA_Sys_TIC_ID_USER_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_FECHA_UPDATE_47A83AC9,'TIC:KEY__WA_Sys_TIC_FECHA_UPDATE_47A83AC9',0)
    SELF.AddKey(TIC:KEY__WA_Sys_TIC_LOTE_REPLICACION_47A83AC9,'TIC:KEY__WA_Sys_TIC_LOTE_REPLICACION_47A83AC9',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TIPO_CONSUMO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_EMPRESA3 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('TIC:TIC_TIPO_EMPRESA')
    Save:TIPO_EMPRESA3 = Access:TIPO_EMPRESA.SaveFile()
    TIE:TIE_ID = TIC:TIC_TIPO_EMPRESA
    ReturnValue = Access:TIPO_EMPRESA.TryFetch(TIE:PK_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_EMPRESA')
      END
    END
    Access:TIPO_EMPRESA.RestoreFile(Save:TIPO_EMPRESA3)
  END
  RETURN ReturnValue


Hide:Relate:TIPO_CONSUMO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:FK_SUMINISTRO_TIPO_EMPRESA_TIPO_CONSUMO)
  SELF.AddRelationLink(TIC:TIC_ID,STE:STE_TIPO_CONSUMO)


Hide:Relate:TIPO_CONSUMO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_CONSUMO.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_CONSUMO &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_CONSUMO)                       ! destroy the file manager


Hide:Relate:TIPO_USUARIO.Init PROCEDURE
  CODE
  _Hide:Access:TIPO_USUARIO.Init
  SELF.Init(Access:TIPO_USUARIO,1)


Hide:Access:TIPO_USUARIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIU:Record
  SELF.FileNameValue = 'TIPO_USUARIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_USUARIO
  PARENT.Init
  Access:TIPO_USUARIO &= SELF


Hide:Access:TIPO_USUARIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_USUARIO &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_USUARIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_USUARIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIU:PK_TIPO_USUARIO,'TIU:PK_TIPO_USUARIO',0)
    SELF.AddKey(TIU:KEY__WA_Sys_TIU_ACTIVO_47C8365A,'TIU:KEY__WA_Sys_TIU_ACTIVO_47C8365A',0)
    SELF.AddKey(TIU:FK_TIPO_USUARIO_TIPO_EMPRESA,'TIU:FK_TIPO_USUARIO_TIPO_EMPRESA',0)
    SELF.AddKey(TIU:KEY__WA_Sys_TIU_DESCRIPCION_47C8365A,'TIU:KEY__WA_Sys_TIU_DESCRIPCION_47C8365A',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TIPO_USUARIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_EMPRESA3 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('TIU:TIU_TIPO_EMPRESA')
    Save:TIPO_EMPRESA3 = Access:TIPO_EMPRESA.SaveFile()
    TIE:TIE_ID = TIU:TIU_TIPO_EMPRESA
    ReturnValue = Access:TIPO_EMPRESA.TryFetch(TIE:PK_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_EMPRESA')
      END
    END
    Access:TIPO_EMPRESA.RestoreFile(Save:TIPO_EMPRESA3)
  END
  RETURN ReturnValue


Hide:Relate:TIPO_USUARIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_EMPRESA)

  SELF.AddRelation(Relate:PROYECTO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,PRO:FK_PROYECTO_TIPO_USUARIO)
  SELF.AddRelationLink(TIU:TIU_ID,PRO:PRO_TIPO_USUARIO)

  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_USUARIO)
  SELF.AddRelationLink(TIU:TIU_ID,STE:STE_TIPO_USUARIO)


Hide:Relate:TIPO_USUARIO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_USUARIO.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_USUARIO &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_USUARIO)                       ! destroy the file manager


Hide:Relate:LOTE_DETALLE_OBRA.Init PROCEDURE
  CODE
  _Hide:Access:LOTE_DETALLE_OBRA.Init
  SELF.Init(Access:LOTE_DETALLE_OBRA,1)


Hide:Access:LOTE_DETALLE_OBRA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LTO:Record
  SELF.FileNameValue = 'LOTE_DETALLE_OBRA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LOTE_DETALLE_OBRA
  PARENT.Init
  Access:LOTE_DETALLE_OBRA &= SELF


Hide:Access:LOTE_DETALLE_OBRA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LOTE_DETALLE_OBRA &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LOTE_DETALLE_OBRA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LOTE_DETALLE_OBRA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LTO:PK_LOTE_DETALLE_OBRA,'LTO:PK_LOTE_DETALLE_OBRA',0)
    SELF.AddKey(LTO:KEY__WA_Sys_LTO_EMPRESA_49BAA06D,'LTO:KEY__WA_Sys_LTO_EMPRESA_49BAA06D',0)
    SELF.AddKey(LTO:KEY__WA_Sys_LTO_CLIENTE_49BAA06D,'LTO:KEY__WA_Sys_LTO_CLIENTE_49BAA06D',0)
    SELF.AddKey(LTO:FK_LOTE_DETALLE_OBRA_LOTE,'LTO:FK_LOTE_DETALLE_OBRA_LOTE',0)
    SELF.AddKey(LTO:FK_LOTE_DETALLE_OBRA_CLIENTE,'LTO:FK_LOTE_DETALLE_OBRA_CLIENTE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LOTE_DETALLE_OBRA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CLIENTE2      USHORT,AUTO
Save:CLIENTE3      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('LTO:LTO_EMPRESA')
    Save:CLIENTE2 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = LTO:LTO_EMPRESA
    CLI:CLI_ID = LTO:LTO_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE2)
  OF 3
    GlobalErrors.SetField('LTO:LTO_CLIENTE')
    Save:CLIENTE3 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = LTO:LTO_EMPRESA
    CLI:CLI_ID = LTO:LTO_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE3)
  END
  RETURN ReturnValue


Hide:Relate:LOTE_DETALLE_OBRA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE)


Hide:Relate:LOTE_DETALLE_OBRA.Kill PROCEDURE

  CODE
  _Hide:Access:LOTE_DETALLE_OBRA.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:LOTE_DETALLE_OBRA &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LOTE_DETALLE_OBRA)                  ! destroy the file manager


Hide:Relate:SUMINISTRO_TIPO_EMPRESA.Init PROCEDURE
  CODE
  _Hide:Access:SUMINISTRO_TIPO_EMPRESA.Init
  SELF.Init(Access:SUMINISTRO_TIPO_EMPRESA,1)


Hide:Access:SUMINISTRO_TIPO_EMPRESA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= STE:Record
  SELF.FileNameValue = 'SUMINISTRO_TIPO_EMPRESA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SUMINISTRO_TIPO_EMPRESA
  PARENT.Init
  Access:SUMINISTRO_TIPO_EMPRESA &= SELF


Hide:Access:SUMINISTRO_TIPO_EMPRESA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SUMINISTRO_TIPO_EMPRESA &= NULL                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SUMINISTRO_TIPO_EMPRESA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SUMINISTRO_TIPO_EMPRESA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(STE:PK_SUMINISTRO_TIPO_EMPRESA,'STE:PK_SUMINISTRO_TIPO_EMPRESA',0)
    SELF.AddKey(STE:IX_STE_UNIDAD_PROVEEDORA,'STE:IX_STE_UNIDAD_PROVEEDORA',0)
    SELF.AddKey(STE:IX_STE_MOROSIDAD,'STE:IX_STE_MOROSIDAD',0)
    SELF.AddKey(STE:KEY__WA_Sys_Ste_Tipo_Empresa_49C58D65,'STE:KEY__WA_Sys_Ste_Tipo_Empresa_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_Ste_Cliente_49C58D65,'STE:KEY__WA_Sys_Ste_Cliente_49C58D65',0)
    SELF.AddKey(STE:FK_SUMINISTRO_TIPO_EMPRESA_TIPO_CONSUMO,'STE:FK_SUMINISTRO_TIPO_EMPRESA_TIPO_CONSUMO',0)
    SELF.AddKey(STE:KEY__WA_Sys_Ste_Suministro_49C58D65,'STE:KEY__WA_Sys_Ste_Suministro_49C58D65',0)
    SELF.AddKey(STE:FK_SUMINISTRO_TIPO_EMPRESA_ESTADO_OPERATIVO,'STE:FK_SUMINISTRO_TIPO_EMPRESA_ESTADO_OPERATIVO',0)
    SELF.AddKey(STE:KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_USUARIO,'STE:KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_USUARIO',0)
    SELF.AddKey(STE:KEY_KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_CONEXION,'STE:KEY_KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_CONEXION',0)
    SELF.AddKey(STE:KEY_KEY_KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_SERVICIO,'STE:KEY_KEY_KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_SERVICIO',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_SUB_UNIDAD_PROVEEDORA_49C58D65,'STE:KEY__WA_Sys_STE_SUB_UNIDAD_PROVEEDORA_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_TRANSFORMADOR_49C58D65,'STE:KEY__WA_Sys_STE_TRANSFORMADOR_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_RESERVA_CAPACIDAD_49C58D65,'STE:KEY__WA_Sys_STE_RESERVA_CAPACIDAD_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_FECHA_ESTADO_OPE_49C58D65,'STE:KEY__WA_Sys_STE_FECHA_ESTADO_OPE_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_FECHA_INGRESO_49C58D65,'STE:KEY__WA_Sys_STE_FECHA_INGRESO_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_FECHA_UPDATE_49C58D65,'STE:KEY__WA_Sys_STE_FECHA_UPDATE_49C58D65',0)
    SELF.AddKey(STE:KEY__WA_Sys_STE_LOTE_REPLICACION_49C58D65,'STE:KEY__WA_Sys_STE_LOTE_REPLICACION_49C58D65',0)
    SELF.AddKey(STE:FK_SUMINISTRO_TIPO_EMPRESA_SUB_UNIDAD_PROVEEDORA,'STE:FK_SUMINISTRO_TIPO_EMPRESA_SUB_UNIDAD_PROVEEDORA',0)
    SELF.AddKey(STE:FK_SUMINISTRO_TIPO_EMPRESA_EMPRESA,'STE:FK_SUMINISTRO_TIPO_EMPRESA_EMPRESA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SUMINISTRO_TIPO_EMPRESA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUB_UNIDAD_PROVEEDORA1 USHORT,AUTO
Save:ESTADO_OPERATIVO9 USHORT,AUTO
Save:TIPO_CONSUMO14 USHORT,AUTO
Save:TIPO_USUARIO15 USHORT,AUTO
Save:TIPO_SERVICIO16 USHORT,AUTO
Save:TIPO_CONEXION17 USHORT,AUTO
Save:SUB_UNIDAD_PROVEEDORA21 USHORT,AUTO
Save:SUB_UNIDAD_PROVEEDORA22 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('STE:STE_EMPRESA')
    Save:SUB_UNIDAD_PROVEEDORA1 = Access:SUB_UNIDAD_PROVEEDORA.SaveFile()
    SUB:SUP_EMPRESA = STE:STE_EMPRESA
    SUB:SUP_UNIDAD_PROVEEDORA = STE:STE_UNIDAD_PROVEEDORA
    SUB:SUP_ID = STE:STE_SUB_UNIDAD_PROVEEDORA
    ReturnValue = Access:SUB_UNIDAD_PROVEEDORA.TryFetch(SUB:PK_SUB_UNIDAD_PROVEEDORA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUB_UNIDAD_PROVEEDORA')
      END
    END
    Access:SUB_UNIDAD_PROVEEDORA.RestoreFile(Save:SUB_UNIDAD_PROVEEDORA1)
  OF 9
    GlobalErrors.SetField('STE:STE_ESTADO_OPE')
    Save:ESTADO_OPERATIVO9 = Access:ESTADO_OPERATIVO.SaveFile()
    EOP:EOP_ID = STE:STE_ESTADO_OPE
    ReturnValue = Access:ESTADO_OPERATIVO.TryFetch(EOP:PK_ESTADO_OPERATIVO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ESTADO_OPERATIVO')
      END
    END
    Access:ESTADO_OPERATIVO.RestoreFile(Save:ESTADO_OPERATIVO9)
  OF 14
    GlobalErrors.SetField('STE:STE_TIPO_CONSUMO')
    Save:TIPO_CONSUMO14 = Access:TIPO_CONSUMO.SaveFile()
    TIC:TIC_ID = STE:STE_TIPO_CONSUMO
    ReturnValue = Access:TIPO_CONSUMO.TryFetch(TIC:PK_TIPO_CONSUMO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_CONSUMO')
      END
    END
    Access:TIPO_CONSUMO.RestoreFile(Save:TIPO_CONSUMO14)
  OF 15
    GlobalErrors.SetField('STE:STE_TIPO_USUARIO')
    Save:TIPO_USUARIO15 = Access:TIPO_USUARIO.SaveFile()
    TIU:TIU_ID = STE:STE_TIPO_USUARIO
    ReturnValue = Access:TIPO_USUARIO.TryFetch(TIU:PK_TIPO_USUARIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_USUARIO')
      END
    END
    Access:TIPO_USUARIO.RestoreFile(Save:TIPO_USUARIO15)
  OF 16
    GlobalErrors.SetField('STE:STE_TIPO_SERVICIO')
    Save:TIPO_SERVICIO16 = Access:TIPO_SERVICIO.SaveFile()
    TIS:TIS_ID = STE:STE_TIPO_SERVICIO
    ReturnValue = Access:TIPO_SERVICIO.TryFetch(TIS:PK_TIPO_SERVICIO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_SERVICIO')
      END
    END
    Access:TIPO_SERVICIO.RestoreFile(Save:TIPO_SERVICIO16)
  OF 17
    GlobalErrors.SetField('STE:STE_TIPO_CONEXION')
    Save:TIPO_CONEXION17 = Access:TIPO_CONEXION.SaveFile()
    TCO:TCO_ID = STE:STE_TIPO_CONEXION
    ReturnValue = Access:TIPO_CONEXION.TryFetch(TCO:PK_TIPO_CONEXION)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_CONEXION')
      END
    END
    Access:TIPO_CONEXION.RestoreFile(Save:TIPO_CONEXION17)
  OF 21
    GlobalErrors.SetField('STE:STE_UNIDAD_PROVEEDORA')
    Save:SUB_UNIDAD_PROVEEDORA21 = Access:SUB_UNIDAD_PROVEEDORA.SaveFile()
    SUB:SUP_EMPRESA = STE:STE_EMPRESA
    SUB:SUP_UNIDAD_PROVEEDORA = STE:STE_UNIDAD_PROVEEDORA
    SUB:SUP_ID = STE:STE_SUB_UNIDAD_PROVEEDORA
    ReturnValue = Access:SUB_UNIDAD_PROVEEDORA.TryFetch(SUB:PK_SUB_UNIDAD_PROVEEDORA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUB_UNIDAD_PROVEEDORA')
      END
    END
    Access:SUB_UNIDAD_PROVEEDORA.RestoreFile(Save:SUB_UNIDAD_PROVEEDORA21)
  OF 22
    GlobalErrors.SetField('STE:STE_SUB_UNIDAD_PROVEEDORA')
    Save:SUB_UNIDAD_PROVEEDORA22 = Access:SUB_UNIDAD_PROVEEDORA.SaveFile()
    SUB:SUP_EMPRESA = STE:STE_EMPRESA
    SUB:SUP_UNIDAD_PROVEEDORA = STE:STE_UNIDAD_PROVEEDORA
    SUB:SUP_ID = STE:STE_SUB_UNIDAD_PROVEEDORA
    ReturnValue = Access:SUB_UNIDAD_PROVEEDORA.TryFetch(SUB:PK_SUB_UNIDAD_PROVEEDORA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUB_UNIDAD_PROVEEDORA')
      END
    END
    Access:SUB_UNIDAD_PROVEEDORA.RestoreFile(Save:SUB_UNIDAD_PROVEEDORA22)
  END
  RETURN ReturnValue


Hide:Relate:SUMINISTRO_TIPO_EMPRESA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUMINISTRO)

  SELF.AddRelation(Relate:TIPO_CONEXION)

  SELF.AddRelation(Relate:TIPO_CONSUMO)

  SELF.AddRelation(Relate:TIPO_USUARIO)

  SELF.AddRelation(Relate:PUNTO_MEDICION,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,PME:FK_PUNTO_MEDICION_SUMINISTRO_TIPO_EMPRESA)
  SELF.AddRelationLink(STE:STE_EMPRESA,PME:PME_EMPRESA)
  SELF.AddRelationLink(STE:STE_CLIENTE,PME:PME_CLIENTE)
  SELF.AddRelationLink(STE:STE_SUMINISTRO,PME:PME_SUMINISTRO)
  SELF.AddRelationLink(STE:STE_TIPO_EMPRESA,PME:PME_TIPO_EMPRESA)

  SELF.AddRelation(Relate:SUB_UNIDAD_PROVEEDORA)

  SELF.AddRelation(Relate:EMPRESA)

  SELF.AddRelation(Relate:TIPO_SERVICIO)

  SELF.AddRelation(Relate:ESTADO_OPERATIVO)


Hide:Relate:SUMINISTRO_TIPO_EMPRESA.Kill PROCEDURE

  CODE
  _Hide:Access:SUMINISTRO_TIPO_EMPRESA.Kill                ! Kill the file manager
  PARENT.Kill
  Relate:SUMINISTRO_TIPO_EMPRESA &= NULL                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SUMINISTRO_TIPO_EMPRESA)            ! destroy the file manager


Hide:Relate:PROFESION_CLIENTE.Init PROCEDURE
  CODE
  _Hide:Access:PROFESION_CLIENTE.Init
  SELF.Init(Access:PROFESION_CLIENTE,1)


Hide:Access:PROFESION_CLIENTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PRO2:Record
  SELF.FileNameValue = 'PROFESION_CLIENTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PROFESION_CLIENTE
  PARENT.Init
  Access:PROFESION_CLIENTE &= SELF


Hide:Access:PROFESION_CLIENTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PROFESION_CLIENTE &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PROFESION_CLIENTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PROFESION_CLIENTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PRO2:PK_PROFESION_CLIENTE,'PRO2:PK_PROFESION_CLIENTE',0)
    SELF.AddKey(PRO2:KEY__WA_Sys_prc_descripcion_4E6B1248,'PRO2:KEY__WA_Sys_prc_descripcion_4E6B1248',0)
    SELF.AddKey(PRO2:KEY__WA_Sys_PRC_ACTIVO_4E6B1248,'PRO2:KEY__WA_Sys_PRC_ACTIVO_4E6B1248',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PROFESION_CLIENTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_PROFESION_CLIENTE)
  SELF.AddRelationLink(PRO2:PRC_CODIGO,CLI:CLI_PROFESION)


Hide:Relate:PROFESION_CLIENTE.Kill PROCEDURE

  CODE
  _Hide:Access:PROFESION_CLIENTE.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:PROFESION_CLIENTE &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PROFESION_CLIENTE)                  ! destroy the file manager


Hide:Relate:SUB_UNIDAD_PROVEEDORA.Init PROCEDURE
  CODE
  _Hide:Access:SUB_UNIDAD_PROVEEDORA.Init
  SELF.Init(Access:SUB_UNIDAD_PROVEEDORA,1)


Hide:Access:SUB_UNIDAD_PROVEEDORA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUB:Record
  SELF.FileNameValue = 'SUB_UNIDAD_PROVEEDORA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SUB_UNIDAD_PROVEEDORA
  PARENT.Init
  Access:SUB_UNIDAD_PROVEEDORA &= SELF


Hide:Access:SUB_UNIDAD_PROVEEDORA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SUB_UNIDAD_PROVEEDORA &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SUB_UNIDAD_PROVEEDORA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SUB_UNIDAD_PROVEEDORA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SUB:PK_SUB_UNIDAD_PROVEEDORA,'SUB:PK_SUB_UNIDAD_PROVEEDORA',0)
    SELF.AddKey(SUB:KEY__WA_Sys_SUP_UNIDAD_PROVEEDORA_4EBF4CAC,'SUB:KEY__WA_Sys_SUP_UNIDAD_PROVEEDORA_4EBF4CAC',0)
    SELF.AddKey(SUB:KEY__WA_Sys_SUP_ID_4EBF4CAC,'SUB:KEY__WA_Sys_SUP_ID_4EBF4CAC',0)
    SELF.AddKey(SUB:KEY__WA_Sys_SUP_ACTIVO_4EBF4CAC,'SUB:KEY__WA_Sys_SUP_ACTIVO_4EBF4CAC',0)
    SELF.AddKey(SUB:FK_SUB_UNIDAD_PROVEEDORA_UNIDAD_PROVEEDORA,'SUB:FK_SUB_UNIDAD_PROVEEDORA_UNIDAD_PROVEEDORA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SUB_UNIDAD_PROVEEDORA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:FK_SUMINISTRO_TIPO_EMPRESA_SUB_UNIDAD_PROVEEDORA)
  SELF.AddRelationLink(SUB:SUP_EMPRESA,STE:STE_EMPRESA)
  SELF.AddRelationLink(SUB:SUP_UNIDAD_PROVEEDORA,STE:STE_UNIDAD_PROVEEDORA)
  SELF.AddRelationLink(SUB:SUP_ID,STE:STE_SUB_UNIDAD_PROVEEDORA)


Hide:Relate:SUB_UNIDAD_PROVEEDORA.Kill PROCEDURE

  CODE
  _Hide:Access:SUB_UNIDAD_PROVEEDORA.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:SUB_UNIDAD_PROVEEDORA &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SUB_UNIDAD_PROVEEDORA)              ! destroy the file manager


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
    SELF.AddKey(CLI:KEY__WA_Sys_Cli_Id_4F1F3F5F,'CLI:KEY__WA_Sys_Cli_Id_4F1F3F5F',0)
    SELF.AddKey(CLI:FK_CLIENTE_PROFESION_CLIENTE,'CLI:FK_CLIENTE_PROFESION_CLIENTE',0)
    SELF.AddKey(CLI:FK_CLIENTE_ESTADO_CIVIL,'CLI:FK_CLIENTE_ESTADO_CIVIL',0)
    SELF.AddKey(CLI:FK_CLIENTE_CLASIFICACION_CLIENTE,'CLI:FK_CLIENTE_CLASIFICACION_CLIENTE',0)
    SELF.AddKey(CLI:FK_CLIENTE_SITUACION_IVA,'CLI:FK_CLIENTE_SITUACION_IVA',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_CODIGO_POSTAL_RESIDENCIA_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_CODIGO_POSTAL_RESIDENCIA_4F1F3F5F',0)
    SELF.AddKey(CLI:FK_CLIENTE_LOCALIDAD,'CLI:FK_CLIENTE_LOCALIDAD',0)
    SELF.AddKey(CLI:FK_CLIENTE_ESTADO_CLIENTE,'CLI:FK_CLIENTE_ESTADO_CLIENTE',0)
    SELF.AddKey(CLI:FK_CLIENTE_SITUACION_IIBB,'CLI:FK_CLIENTE_SITUACION_IIBB',0)
    SELF.AddKey(CLI:KEY__WA_Sys_cli_CALLE_residencia_4F1F3F5F,'CLI:KEY__WA_Sys_cli_CALLE_residencia_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_ALTURA_RESIDENCIA_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_ALTURA_RESIDENCIA_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_PISO_RESIDENCIA_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_PISO_RESIDENCIA_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_DEPARTAMENTO_RESIDENCIA_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_DEPARTAMENTO_RESIDENCIA_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_FECHA_UPDATE_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_FECHA_UPDATE_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_LOTE_REPLICACION_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_LOTE_REPLICACION_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_ID_USER_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_ID_USER_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_CLAVE_PERSONAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_CLAVE_PERSONAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_SEXO_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_SEXO_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_LUGAR_NACIMIENTO_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_LUGAR_NACIMIENTO_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_NACIONALIDAD_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_NACIONALIDAD_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_FECHA_NACIMIENTO_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_FECHA_NACIMIENTO_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_POTENCIAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_POTENCIAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_EXENCION_MUNICIPAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_EXENCION_MUNICIPAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_EXENCION_PROVINCIAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_EXENCION_PROVINCIAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_EXENCION_NACIONAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_EXENCION_NACIONAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_EXENCION_PERCEPCION_IVA_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_EXENCION_PERCEPCION_IVA_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_NUMERO_IIBB_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_NUMERO_IIBB_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_CUIT_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_CUIT_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_TELEFONO_LABORAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_TELEFONO_LABORAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_ANEXO_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_ANEXO_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_DEPARTAMENTO_LABORAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_DEPARTAMENTO_LABORAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_PISO_LABORAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_PISO_LABORAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_ALTURA_LABORAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_ALTURA_LABORAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_CALLE_LABORAL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_CALLE_LABORAL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY_KEY__WA_Sys_CLI_CODIGO_POSTAL_LABORAL_4F1F3F5F,'CLI:KEY_KEY__WA_Sys_CLI_CODIGO_POSTAL_LABORAL_4F1F3F5F',0)
    SELF.AddKey(CLI:FK_CLIENTE_LOCALIDAD1,'CLI:FK_CLIENTE_LOCALIDAD1',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_E_MAIL_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_E_MAIL_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_FAX_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_FAX_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_TELEFONO_CELULAR_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_TELEFONO_CELULAR_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_TELEFONO_RESIDENCIA_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_TELEFONO_RESIDENCIA_4F1F3F5F',0)
    SELF.AddKey(CLI:KEY__WA_Sys_CLI_FECHA_INGRESO_4F1F3F5F,'CLI:KEY__WA_Sys_CLI_FECHA_INGRESO_4F1F3F5F',0)
    SELF.AddKey(CLI:FK_CLIENTE_EMPRESA,'CLI:FK_CLIENTE_EMPRESA',0)
    SELF.AddKey(CLI:FK_CLIENTE_CODIGO_POSTAL1,'CLI:FK_CLIENTE_CODIGO_POSTAL1',0)
    SELF.AddKey(CLI:FK_CLIENTE_CODIGO_POSTAL,'CLI:FK_CLIENTE_CODIGO_POSTAL',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CLIENTE.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:EMPRESA1      USHORT,AUTO
Save:LOCALIDAD8    USHORT,AUTO
Save:CODIGO_POSTAL9 USHORT,AUTO
Save:LOCALIDAD18   USHORT,AUTO
Save:CODIGO_POSTAL19 USHORT,AUTO
Save:SITUACION_IVA26 USHORT,AUTO
Save:SITUACION_IIBB28 USHORT,AUTO
Save:CLASIFICACION_CLIENTE35 USHORT,AUTO
Save:ESTADO_CIVIL36 USHORT,AUTO
Save:PROFESION_CLIENTE37 USHORT,AUTO
Save:ESTADO_CLIENTE45 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CLI:CLI_EMPRESA')
    Save:EMPRESA1 = Access:EMPRESA.SaveFile()
    EMP:EMP_ID = CLI:CLI_EMPRESA
    ReturnValue = Access:EMPRESA.TryFetch(EMP:PK_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'EMPRESA')
      END
    END
    Access:EMPRESA.RestoreFile(Save:EMPRESA1)
  OF 8
    GlobalErrors.SetField('CLI:CLI_LOCALIDAD_RESIDENCIA')
    Save:LOCALIDAD8 = Access:LOCALIDAD.SaveFile()
    LOC2:LOC_ID = CLI:CLI_LOCALIDAD_RESIDENCIA
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC2:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD8)
  OF 9
    GlobalErrors.SetField('CLI:CLI_CODIGO_POSTAL_RESIDENCIA')
    Save:CODIGO_POSTAL9 = Access:CODIGO_POSTAL.SaveFile()
    CPO:CPO_LOCALIDAD = CLI:CLI_LOCALIDAD_LABORAL
    CPO:CPO_ID = CLI:CLI_CODIGO_POSTAL_LABORAL
    ReturnValue = Access:CODIGO_POSTAL.TryFetch(CPO:PK_CODIGO_POSTAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CODIGO_POSTAL')
      END
    END
    Access:CODIGO_POSTAL.RestoreFile(Save:CODIGO_POSTAL9)
  OF 18
    GlobalErrors.SetField('CLI:CLI_LOCALIDAD_LABORAL')
    Save:LOCALIDAD18 = Access:LOCALIDAD.SaveFile()
    LOC2:LOC_ID = CLI:CLI_LOCALIDAD_RESIDENCIA
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC2:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD18)
  OF 19
    GlobalErrors.SetField('CLI:CLI_CODIGO_POSTAL_LABORAL')
    Save:CODIGO_POSTAL19 = Access:CODIGO_POSTAL.SaveFile()
    CPO:CPO_LOCALIDAD = CLI:CLI_LOCALIDAD_LABORAL
    CPO:CPO_ID = CLI:CLI_CODIGO_POSTAL_LABORAL
    ReturnValue = Access:CODIGO_POSTAL.TryFetch(CPO:PK_CODIGO_POSTAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CODIGO_POSTAL')
      END
    END
    Access:CODIGO_POSTAL.RestoreFile(Save:CODIGO_POSTAL19)
  OF 26
    GlobalErrors.SetField('CLI:CLI_SITUACION_IVA')
    Save:SITUACION_IVA26 = Access:SITUACION_IVA.SaveFile()
    SIT:SIV_ID = CLI:CLI_SITUACION_IVA
    ReturnValue = Access:SITUACION_IVA.TryFetch(SIT:PK_SITUACION_IVA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SITUACION_IVA')
      END
    END
    Access:SITUACION_IVA.RestoreFile(Save:SITUACION_IVA26)
  OF 28
    GlobalErrors.SetField('CLI:CLI_SITUACION_IIBB')
    Save:SITUACION_IIBB28 = Access:SITUACION_IIBB.SaveFile()
    SIT2:SIB_ID = CLI:CLI_SITUACION_IIBB
    ReturnValue = Access:SITUACION_IIBB.TryFetch(SIT2:PK_SITUACION_IIBB)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SITUACION_IIBB')
      END
    END
    Access:SITUACION_IIBB.RestoreFile(Save:SITUACION_IIBB28)
  OF 35
    GlobalErrors.SetField('CLI:CLI_CLASIFICACION')
    Save:CLASIFICACION_CLIENTE35 = Access:CLASIFICACION_CLIENTE.SaveFile()
    CLC:CLC_CODIGO = CLI:CLI_CLASIFICACION
    ReturnValue = Access:CLASIFICACION_CLIENTE.TryFetch(CLC:PK_CLASIFICACION_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLASIFICACION_CLIENTE')
      END
    END
    Access:CLASIFICACION_CLIENTE.RestoreFile(Save:CLASIFICACION_CLIENTE35)
  OF 36
    GlobalErrors.SetField('CLI:CLI_ESTADO_CIVIL')
    Save:ESTADO_CIVIL36 = Access:ESTADO_CIVIL.SaveFile()
    ESC:ESC_CODIGO = CLI:CLI_ESTADO_CIVIL
    ReturnValue = Access:ESTADO_CIVIL.TryFetch(ESC:PK_ESTADO_CIVIL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ESTADO_CIVIL')
      END
    END
    Access:ESTADO_CIVIL.RestoreFile(Save:ESTADO_CIVIL36)
  OF 37
    GlobalErrors.SetField('CLI:CLI_PROFESION')
    Save:PROFESION_CLIENTE37 = Access:PROFESION_CLIENTE.SaveFile()
    PRO2:PRC_CODIGO = CLI:CLI_PROFESION
    ReturnValue = Access:PROFESION_CLIENTE.TryFetch(PRO2:PK_PROFESION_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'PROFESION_CLIENTE')
      END
    END
    Access:PROFESION_CLIENTE.RestoreFile(Save:PROFESION_CLIENTE37)
  OF 45
    GlobalErrors.SetField('CLI:CLI_ESTADO')
    Save:ESTADO_CLIENTE45 = Access:ESTADO_CLIENTE.SaveFile()
    ECL:ECL_ID = CLI:CLI_ESTADO
    ReturnValue = Access:ESTADO_CLIENTE.TryFetch(ECL:PK_ESTADO_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ESTADO_CLIENTE')
      END
    END
    Access:ESTADO_CLIENTE.RestoreFile(Save:ESTADO_CLIENTE45)
  END
  RETURN ReturnValue


Hide:Relate:CLIENTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  DO AddRelations_3
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DEBITO_EMPLEADOS)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:LOCALIDAD2)

  SELF.AddRelation(Relate:ESTADO_CLIENTE)

  SELF.AddRelation(Relate:SITUACION_IVA)

  SELF.AddRelation(Relate:ESTADO_CIVIL)

  SELF.AddRelation(Relate:PROFESION_CLIENTE)

  SELF.AddRelation(Relate:CLIENTE_ADHERENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CAH:FK_CLIENTE_ADHERENTE_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,CAH:CAH_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,CAH:CAH_CLIENTE)

  SELF.AddRelation(Relate:CLIENTE_DOCUMENTO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLD:FK_CLIENTE_DOCUMENTO_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,CLD:CLD_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,CLD:CLD_CLIENTE)

  SELF.AddRelation(Relate:CLIENTE_PERFIL,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLP:FK_CLIENTE_PERFIL_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,CLP:CLP_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,CLP:CLP_CLIENTE)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:COMPROBANTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CDE:FK_COMPROBANTE_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,CDE:CDE_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,CDE:CDE_CLIENTE)

  SELF.AddRelation(Relate:DEBITO_CREDITO_PENDIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,DCP:FK_DEBITO_CREDITO_PENDIENTE_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,DCP:DCP_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,DCP:DCP_CLIENTE)

  SELF.AddRelation(Relate:LOTE_DETALLE_OBRA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,LTO:FK_LOTE_DETALLE_OBRA_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,LTO:LTO_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,LTO:LTO_CLIENTE)

  SELF.AddRelation(Relate:PADRON_OBRA_CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,PCL:FK_PADRON_OBRA_CLIENTE_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,PCL:PCL_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,PCL:PCL_CLIENTE)

  SELF.AddRelation(Relate:PARAMETRO_CLIENTE_VAL,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,PAR:FK_PARAMETRO_CLIENTE_VAL_SUMINISTRO)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,PAR:PCV_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,PAR:PCV_CLIENTE)

  SELF.AddRelation(Relate:PROYECTO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,PRO:FK_PROYECTO_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,PRO:PRO_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,PRO:PRO_CLIENTE)

  SELF.AddRelation(Relate:RECIBO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,REC:FK_RECIBO_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,REC:REC_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,REC:REC_CLIENTE)

  SELF.AddRelation(Relate:SOLICITUD_SUMINISTRO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,SOL:FK_SOLICITUD_SUMINISTRO_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,SOL:SSU_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,SOL:SSU_CLIENTE)

  SELF.AddRelation(Relate:SUMINISTRO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,SUM:FK_SUMINISTRO_CLIENTE)
  SELF.AddRelationLink(CLI:CLI_EMPRESA,SUM:SUM_EMPRESA)
  SELF.AddRelationLink(CLI:CLI_ID,SUM:SUM_CLIENTE)

  SELF.AddRelation(Relate:EMPRESA)

AddRelations_3 ROUTINE
  SELF.AddRelation(Relate:CLASIFICACION_CLIENTE)

  SELF.AddRelation(Relate:CODIGO_POSTAL)

  SELF.AddRelation(Relate:CODIGO_POSTAL2)

  SELF.AddRelation(Relate:SITUACION_IIBB)


Hide:Relate:CLIENTE.Kill PROCEDURE

  CODE
  _Hide:Access:CLIENTE.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:CLIENTE &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CLIENTE)                            ! destroy the file manager


Hide:Relate:EMPRESA.Init PROCEDURE
  CODE
  _Hide:Access:EMPRESA.Init
  SELF.Init(Access:EMPRESA,1)


Hide:Access:EMPRESA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EMP:Record
  SELF.FileNameValue = 'EMPRESA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EMPRESA
  PARENT.Init
  Access:EMPRESA &= SELF


Hide:Access:EMPRESA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EMPRESA &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EMPRESA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EMPRESA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(EMP:PK_EMPRESA,'EMP:PK_EMPRESA',0)
    SELF.AddKey(EMP:KEY__WA_Sys_EMP_ACTIVO_4F74451A,'EMP:KEY__WA_Sys_EMP_ACTIVO_4F74451A',0)
    SELF.AddKey(EMP:FK_EMPRESA_PAIS,'EMP:FK_EMPRESA_PAIS',0)
    SELF.AddKey(EMP:KEY__WA_Sys_EMP_USA_RUTA_4F74451A,'EMP:KEY__WA_Sys_EMP_USA_RUTA_4F74451A',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EMPRESA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_EMPRESA)
  SELF.AddRelationLink(EMP:EMP_ID,CLI:CLI_EMPRESA)

  SELF.AddRelation(Relate:COMPROBANTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CDE:FK_COMPROBANTE_EMPRESA)
  SELF.AddRelationLink(EMP:EMP_ID,CDE:CDE_EMPRESA)

  SELF.AddRelation(Relate:RECIBO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,REC:FK_RECIBO_EMPRESA)
  SELF.AddRelationLink(EMP:EMP_ID,REC:REC_EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,SUM:FK_SUMINISTRO_EMPRESA)
  SELF.AddRelationLink(EMP:EMP_ID,SUM:SUM_EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:FK_SUMINISTRO_TIPO_EMPRESA_EMPRESA)
  SELF.AddRelationLink(EMP:EMP_ID,STE:STE_EMPRESA)


Hide:Relate:EMPRESA.Kill PROCEDURE

  CODE
  _Hide:Access:EMPRESA.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:EMPRESA &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EMPRESA)                            ! destroy the file manager


Hide:Relate:CLASIFICACION_CLIENTE.Init PROCEDURE
  CODE
  _Hide:Access:CLASIFICACION_CLIENTE.Init
  SELF.Init(Access:CLASIFICACION_CLIENTE,1)


Hide:Access:CLASIFICACION_CLIENTE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CLC:Record
  SELF.FileNameValue = 'CLASIFICACION_CLIENTE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CLASIFICACION_CLIENTE
  PARENT.Init
  Access:CLASIFICACION_CLIENTE &= SELF


Hide:Access:CLASIFICACION_CLIENTE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CLASIFICACION_CLIENTE &= NULL                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CLASIFICACION_CLIENTE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CLASIFICACION_CLIENTE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CLC:PK_CLASIFICACION_CLIENTE,'CLC:PK_CLASIFICACION_CLIENTE',0)
    SELF.AddKey(CLC:KEY__WA_Sys_CLC_ACTIVO_501E5090,'CLC:KEY__WA_Sys_CLC_ACTIVO_501E5090',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CLASIFICACION_CLIENTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_CLASIFICACION_CLIENTE)
  SELF.AddRelationLink(CLC:CLC_CODIGO,CLI:CLI_CLASIFICACION)


Hide:Relate:CLASIFICACION_CLIENTE.Kill PROCEDURE

  CODE
  _Hide:Access:CLASIFICACION_CLIENTE.Kill                  ! Kill the file manager
  PARENT.Kill
  Relate:CLASIFICACION_CLIENTE &= NULL                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CLASIFICACION_CLIENTE)              ! destroy the file manager


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


Hide:Access:COMPROBANTE.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUMINISTRO1   USHORT,AUTO
Save:SUMINISTRO4   USHORT,AUTO
Save:SUMINISTRO5   USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CDE:CDE_EMPRESA')
    Save:SUMINISTRO1 = Access:SUMINISTRO.SaveFile()
    SUM:SUM_EMPRESA = CDE:CDE_EMPRESA
    SUM:SUM_CLIENTE = CDE:CDE_CLIENTE
    SUM:SUM_ID = CDE:CDE_SUMINISTRO
    ReturnValue = Access:SUMINISTRO.TryFetch(SUM:PK_SUMINISTRO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO')
      END
    END
    Access:SUMINISTRO.RestoreFile(Save:SUMINISTRO1)
  OF 4
    GlobalErrors.SetField('CDE:CDE_CLIENTE')
    Save:SUMINISTRO4 = Access:SUMINISTRO.SaveFile()
    SUM:SUM_EMPRESA = CDE:CDE_EMPRESA
    SUM:SUM_CLIENTE = CDE:CDE_CLIENTE
    SUM:SUM_ID = CDE:CDE_SUMINISTRO
    ReturnValue = Access:SUMINISTRO.TryFetch(SUM:PK_SUMINISTRO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO')
      END
    END
    Access:SUMINISTRO.RestoreFile(Save:SUMINISTRO4)
  OF 5
    GlobalErrors.SetField('CDE:CDE_SUMINISTRO')
    Save:SUMINISTRO5 = Access:SUMINISTRO.SaveFile()
    SUM:SUM_EMPRESA = CDE:CDE_EMPRESA
    SUM:SUM_CLIENTE = CDE:CDE_CLIENTE
    SUM:SUM_ID = CDE:CDE_SUMINISTRO
    ReturnValue = Access:SUMINISTRO.TryFetch(SUM:PK_SUMINISTRO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO')
      END
    END
    Access:SUMINISTRO.RestoreFile(Save:SUMINISTRO5)
  END
  RETURN ReturnValue


Hide:Relate:COMPROBANTE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Empleado_Comprobante)

  SELF.AddRelation(Relate:CLIENTE)

  SELF.AddRelation(Relate:EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO)


Hide:Relate:COMPROBANTE.Kill PROCEDURE

  CODE
  _Hide:Access:COMPROBANTE.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:COMPROBANTE &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:COMPROBANTE)                        ! destroy the file manager


Hide:Relate:MEDICION.Init PROCEDURE
  CODE
  _Hide:Access:MEDICION.Init
  SELF.Init(Access:MEDICION,1)


Hide:Access:MEDICION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MDI:Record
  SELF.FileNameValue = 'MEDICION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MEDICION
  PARENT.Init
  Access:MEDICION &= SELF


Hide:Access:MEDICION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MEDICION &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MEDICION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MEDICION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MDI:PK_MEDICION,'MDI:PK_MEDICION',0)
    SELF.AddKey(MDI:KEY__WA_Sys_MDI_SUCURSAL_57149B8B,'MDI:KEY__WA_Sys_MDI_SUCURSAL_57149B8B',0)
    SELF.AddKey(MDI:KEY__WA_Sys_MDI_GRUPO_57149B8B,'MDI:KEY__WA_Sys_MDI_GRUPO_57149B8B',0)
    SELF.AddKey(MDI:FK_MEDICION_TIPO_EMPRESA,'MDI:FK_MEDICION_TIPO_EMPRESA',0)
    SELF.AddKey(MDI:FK_MEDICION_OPERARIO,'MDI:FK_MEDICION_OPERARIO',0)
    SELF.AddKey(MDI:FK_MEDICION_OPERARIO1,'MDI:FK_MEDICION_OPERARIO1',0)
    SELF.AddKey(MDI:FK_MEDICION_OPERARIO2,'MDI:FK_MEDICION_OPERARIO2',0)
    SELF.AddKey(MDI:KEY__WA_Sys_MDI_PERIODO_57149B8B,'MDI:KEY__WA_Sys_MDI_PERIODO_57149B8B',0)
    SELF.AddKey(MDI:KEY__WA_Sys_MDI_ANO_57149B8B,'MDI:KEY__WA_Sys_MDI_ANO_57149B8B',0)
    SELF.AddKey(MDI:FK_MEDICION_EMPRESA_CONTRATISTA,'MDI:FK_MEDICION_EMPRESA_CONTRATISTA',0)
    SELF.AddKey(MDI:KEY__WA_Sys_MDI_ESTADO_57149B8B,'MDI:KEY__WA_Sys_MDI_ESTADO_57149B8B',0)
    SELF.AddKey(MDI:FK_MEDICION_GRUPO,'MDI:FK_MEDICION_GRUPO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:MEDICION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_EMPRESA4 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('MDI:MDI_TIPO_EMPRESA')
    Save:TIPO_EMPRESA4 = Access:TIPO_EMPRESA.SaveFile()
    TIE:TIE_ID = MDI:MDI_TIPO_EMPRESA
    ReturnValue = Access:TIPO_EMPRESA.TryFetch(TIE:PK_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_EMPRESA')
      END
    END
    Access:TIPO_EMPRESA.RestoreFile(Save:TIPO_EMPRESA4)
  END
  RETURN ReturnValue


Hide:Relate:MEDICION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_EMPRESA)

  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_MEDICION)
  SELF.AddRelationLink(MDI:MDI_ID,TOE:TOE_MEDICION)


Hide:Relate:MEDICION.Kill PROCEDURE

  CODE
  _Hide:Access:MEDICION.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:MEDICION &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MEDICION)                           ! destroy the file manager


Hide:Relate:CODIGO_POSTAL.Init PROCEDURE
  CODE
  _Hide:Access:CODIGO_POSTAL.Init
  SELF.Init(Access:CODIGO_POSTAL,1)


Hide:Access:CODIGO_POSTAL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CPO:Record
  SELF.FileNameValue = 'CODIGO_POSTAL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CODIGO_POSTAL
  PARENT.Init
  Access:CODIGO_POSTAL &= SELF


Hide:Access:CODIGO_POSTAL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CODIGO_POSTAL &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CODIGO_POSTAL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CODIGO_POSTAL,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CPO:PK_CODIGO_POSTAL,'CPO:PK_CODIGO_POSTAL',0)
    SELF.AddKey(CPO:KEY__WA_Sys_CPO_ID_5A0616CF,'CPO:KEY__WA_Sys_CPO_ID_5A0616CF',0)
    SELF.AddKey(CPO:KEY__WA_Sys_CPO_FECHA_UPDATE_5A0616CF,'CPO:KEY__WA_Sys_CPO_FECHA_UPDATE_5A0616CF',0)
    SELF.AddKey(CPO:FK_CODIGO_POSTAL_LOCALIDAD,'CPO:FK_CODIGO_POSTAL_LOCALIDAD',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CODIGO_POSTAL.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:LOCALIDAD1    USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CPO:CPO_LOCALIDAD')
    Save:LOCALIDAD1 = Access:LOCALIDAD.SaveFile()
    LOC2:LOC_ID = CPO:CPO_LOCALIDAD
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC2:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD1)
  END
  RETURN ReturnValue


Hide:Relate:CODIGO_POSTAL.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_CODIGO_POSTAL1)
  SELF.AddRelationLink(CPO:CPO_LOCALIDAD,CLI:CLI_LOCALIDAD_LABORAL)
  SELF.AddRelationLink(CPO:CPO_ID,CLI:CLI_CODIGO_POSTAL_LABORAL)

  SELF.AddRelation(Relate:SUMINISTRO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,SUM:FK_SUMINISTRO_CODIGO_POSTAL)
  SELF.AddRelationLink(CPO:CPO_LOCALIDAD,SUM:SUM_LOCALIDAD)
  SELF.AddRelationLink(CPO:CPO_ID,SUM:SUM_CODIGO_POSTAL)


Hide:Relate:CODIGO_POSTAL.Kill PROCEDURE

  CODE
  _Hide:Access:CODIGO_POSTAL.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:CODIGO_POSTAL &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CODIGO_POSTAL)                      ! destroy the file manager


Hide:Relate:TIPO_SERVICIO.Init PROCEDURE
  CODE
  _Hide:Access:TIPO_SERVICIO.Init
  SELF.Init(Access:TIPO_SERVICIO,1)


Hide:Access:TIPO_SERVICIO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TIS:Record
  SELF.FileNameValue = 'TIPO_SERVICIO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TIPO_SERVICIO
  PARENT.Init
  Access:TIPO_SERVICIO &= SELF


Hide:Access:TIPO_SERVICIO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TIPO_SERVICIO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TIPO_SERVICIO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TIPO_SERVICIO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TIS:PK_TIPO_SERVICIO,'TIS:PK_TIPO_SERVICIO',0)
    SELF.AddKey(TIS:KEY__WA_Sys_TIS_ACTIVO_5A11CF1E,'TIS:KEY__WA_Sys_TIS_ACTIVO_5A11CF1E',0)
    SELF.AddKey(TIS:FK_TIPO_SERVICIO_TIPO_EMPRESA,'TIS:FK_TIPO_SERVICIO_TIPO_EMPRESA',0)
    SELF.AddKey(TIS:KEY__WA_Sys_TIS_ES_FACTURABLE_5A11CF1E,'TIS:KEY__WA_Sys_TIS_ES_FACTURABLE_5A11CF1E',0)
    SELF.AddKey(TIS:KEY__WA_Sys_TIS_CONSUMO_DIRECTO_5A11CF1E,'TIS:KEY__WA_Sys_TIS_CONSUMO_DIRECTO_5A11CF1E',0)
    SELF.AddKey(TIS:KEY__WA_Sys_TIS_DESCRIPCION_5A11CF1E,'TIS:KEY__WA_Sys_TIS_DESCRIPCION_5A11CF1E',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TIPO_SERVICIO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:TIPO_EMPRESA3 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('TIS:TIS_TIPO_EMPRESA')
    Save:TIPO_EMPRESA3 = Access:TIPO_EMPRESA.SaveFile()
    TIE:TIE_ID = TIS:TIS_TIPO_EMPRESA
    ReturnValue = Access:TIPO_EMPRESA.TryFetch(TIE:PK_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'TIPO_EMPRESA')
      END
    END
    Access:TIPO_EMPRESA.RestoreFile(Save:TIPO_EMPRESA3)
  END
  RETURN ReturnValue


Hide:Relate:TIPO_SERVICIO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:KEY_KEY_KEY_FK_SUMINISTRO_TIPO_EMPRESA_TIPO_SERVICIO)
  SELF.AddRelationLink(TIS:TIS_ID,STE:STE_TIPO_SERVICIO)


Hide:Relate:TIPO_SERVICIO.Kill PROCEDURE

  CODE
  _Hide:Access:TIPO_SERVICIO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:TIPO_SERVICIO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TIPO_SERVICIO)                      ! destroy the file manager


Hide:Relate:PUNTO_MEDICION.Init PROCEDURE
  CODE
  _Hide:Access:PUNTO_MEDICION.Init
  SELF.Init(Access:PUNTO_MEDICION,1)


Hide:Access:PUNTO_MEDICION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PME:Record
  SELF.FileNameValue = 'PUNTO_MEDICION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PUNTO_MEDICION
  PARENT.Init
  Access:PUNTO_MEDICION &= SELF


Hide:Access:PUNTO_MEDICION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PUNTO_MEDICION &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PUNTO_MEDICION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PUNTO_MEDICION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PME:PK_PUNTO_MEDICION,'PME:PK_PUNTO_MEDICION',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_SUMINISTRO_5A9B13AC,'PME:KEY__WA_Sys_PME_SUMINISTRO_5A9B13AC',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_CLIENTE_5A9B13AC,'PME:KEY__WA_Sys_PME_CLIENTE_5A9B13AC',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_TIPO_EMPRESA_5A9B13AC,'PME:KEY__WA_Sys_PME_TIPO_EMPRESA_5A9B13AC',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_ID_5A9B13AC,'PME:KEY__WA_Sys_PME_ID_5A9B13AC',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_COINCIDE_DIR_CONSUMO_5A9B13AC,'PME:KEY__WA_Sys_PME_COINCIDE_DIR_CONSUMO_5A9B13AC',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_FECHA_UPDATE_5A9B13AC,'PME:KEY__WA_Sys_PME_FECHA_UPDATE_5A9B13AC',0)
    SELF.AddKey(PME:KEY__WA_Sys_PME_LOTE_REPLICACION_5A9B13AC,'PME:KEY__WA_Sys_PME_LOTE_REPLICACION_5A9B13AC',0)
    SELF.AddKey(PME:FK_PUNTO_MEDICION_SUMINISTRO_TIPO_EMPRESA,'PME:FK_PUNTO_MEDICION_SUMINISTRO_TIPO_EMPRESA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PUNTO_MEDICION.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SUMINISTRO_TIPO_EMPRESA1 USHORT,AUTO
Save:SUMINISTRO_TIPO_EMPRESA2 USHORT,AUTO
Save:SUMINISTRO_TIPO_EMPRESA3 USHORT,AUTO
Save:SUMINISTRO_TIPO_EMPRESA4 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('PME:PME_EMPRESA')
    Save:SUMINISTRO_TIPO_EMPRESA1 = Access:SUMINISTRO_TIPO_EMPRESA.SaveFile()
    STE:STE_EMPRESA = PME:PME_EMPRESA
    STE:STE_CLIENTE = PME:PME_CLIENTE
    STE:STE_SUMINISTRO = PME:PME_SUMINISTRO
    STE:STE_TIPO_EMPRESA = PME:PME_TIPO_EMPRESA
    ReturnValue = Access:SUMINISTRO_TIPO_EMPRESA.TryFetch(STE:PK_SUMINISTRO_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO_TIPO_EMPRESA')
      END
    END
    Access:SUMINISTRO_TIPO_EMPRESA.RestoreFile(Save:SUMINISTRO_TIPO_EMPRESA1)
  OF 2
    GlobalErrors.SetField('PME:PME_CLIENTE')
    Save:SUMINISTRO_TIPO_EMPRESA2 = Access:SUMINISTRO_TIPO_EMPRESA.SaveFile()
    STE:STE_EMPRESA = PME:PME_EMPRESA
    STE:STE_CLIENTE = PME:PME_CLIENTE
    STE:STE_SUMINISTRO = PME:PME_SUMINISTRO
    STE:STE_TIPO_EMPRESA = PME:PME_TIPO_EMPRESA
    ReturnValue = Access:SUMINISTRO_TIPO_EMPRESA.TryFetch(STE:PK_SUMINISTRO_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO_TIPO_EMPRESA')
      END
    END
    Access:SUMINISTRO_TIPO_EMPRESA.RestoreFile(Save:SUMINISTRO_TIPO_EMPRESA2)
  OF 3
    GlobalErrors.SetField('PME:PME_SUMINISTRO')
    Save:SUMINISTRO_TIPO_EMPRESA3 = Access:SUMINISTRO_TIPO_EMPRESA.SaveFile()
    STE:STE_EMPRESA = PME:PME_EMPRESA
    STE:STE_CLIENTE = PME:PME_CLIENTE
    STE:STE_SUMINISTRO = PME:PME_SUMINISTRO
    STE:STE_TIPO_EMPRESA = PME:PME_TIPO_EMPRESA
    ReturnValue = Access:SUMINISTRO_TIPO_EMPRESA.TryFetch(STE:PK_SUMINISTRO_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO_TIPO_EMPRESA')
      END
    END
    Access:SUMINISTRO_TIPO_EMPRESA.RestoreFile(Save:SUMINISTRO_TIPO_EMPRESA3)
  OF 4
    GlobalErrors.SetField('PME:PME_TIPO_EMPRESA')
    Save:SUMINISTRO_TIPO_EMPRESA4 = Access:SUMINISTRO_TIPO_EMPRESA.SaveFile()
    STE:STE_EMPRESA = PME:PME_EMPRESA
    STE:STE_CLIENTE = PME:PME_CLIENTE
    STE:STE_SUMINISTRO = PME:PME_SUMINISTRO
    STE:STE_TIPO_EMPRESA = PME:PME_TIPO_EMPRESA
    ReturnValue = Access:SUMINISTRO_TIPO_EMPRESA.TryFetch(STE:PK_SUMINISTRO_TIPO_EMPRESA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SUMINISTRO_TIPO_EMPRESA')
      END
    END
    Access:SUMINISTRO_TIPO_EMPRESA.RestoreFile(Save:SUMINISTRO_TIPO_EMPRESA4)
  END
  RETURN ReturnValue


Hide:Relate:PUNTO_MEDICION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA)


Hide:Relate:PUNTO_MEDICION.Kill PROCEDURE

  CODE
  _Hide:Access:PUNTO_MEDICION.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:PUNTO_MEDICION &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PUNTO_MEDICION)                     ! destroy the file manager


Hide:Relate:ESTADO_OPERATIVO.Init PROCEDURE
  CODE
  _Hide:Access:ESTADO_OPERATIVO.Init
  SELF.Init(Access:ESTADO_OPERATIVO,1)


Hide:Access:ESTADO_OPERATIVO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EOP:Record
  SELF.FileNameValue = 'ESTADO_OPERATIVO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ESTADO_OPERATIVO
  PARENT.Init
  Access:ESTADO_OPERATIVO &= SELF


Hide:Access:ESTADO_OPERATIVO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ESTADO_OPERATIVO &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ESTADO_OPERATIVO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ESTADO_OPERATIVO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(EOP:PK_ESTADO_OPERATIVO,'EOP:PK_ESTADO_OPERATIVO',0)
    SELF.AddKey(EOP:FK_ESTADO_OPERATIVO_TIPO_EMPRESA,'EOP:FK_ESTADO_OPERATIVO_TIPO_EMPRESA',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_ACTIVO_61081A19,'EOP:KEY__WA_Sys_EOP_ACTIVO_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_ABREVIATURA_61081A19,'EOP:KEY__WA_Sys_EOP_ABREVIATURA_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_ORDEN_TRABAJO_61081A19,'EOP:KEY__WA_Sys_EOP_ORDEN_TRABAJO_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_DESCRIPCION_61081A19,'EOP:KEY__WA_Sys_EOP_DESCRIPCION_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_INCLUYE_AVISO_DEUDA_61081A19,'EOP:KEY__WA_Sys_EOP_INCLUYE_AVISO_DEUDA_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_ES_FACTURABLE_61081A19,'EOP:KEY__WA_Sys_EOP_ES_FACTURABLE_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_SALE_A_LEER_61081A19,'EOP:KEY__WA_Sys_EOP_SALE_A_LEER_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_POSEE_MEDIDOR_61081A19,'EOP:KEY__WA_Sys_EOP_POSEE_MEDIDOR_61081A19',0)
    SELF.AddKey(EOP:KEY__WA_Sys_EOP_BAJA_SUMINISTRO_61081A19,'EOP:KEY__WA_Sys_EOP_BAJA_SUMINISTRO_61081A19',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ESTADO_OPERATIVO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TIPO_EMPRESA)

  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,STE:FK_SUMINISTRO_TIPO_EMPRESA_ESTADO_OPERATIVO)
  SELF.AddRelationLink(EOP:EOP_ID,STE:STE_ESTADO_OPE)


Hide:Relate:ESTADO_OPERATIVO.Kill PROCEDURE

  CODE
  _Hide:Access:ESTADO_OPERATIVO.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:ESTADO_OPERATIVO &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ESTADO_OPERATIVO)                   ! destroy the file manager

