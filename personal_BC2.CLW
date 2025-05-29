  MEMBER('personal.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
personal_BC2:DctInit    PROCEDURE
personal_BC2:DctKill    PROCEDURE
personal_BC2:FilesInit  PROCEDURE
  END

Hide:Access:OBSERVACION CLASS(FileManager),TYPE            ! FileManager for OBSERVACION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OBSERVACION CLASS(RelationManager),TYPE        ! RelationManager for OBSERVACION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
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

Hide:Access:RUTA     CLASS(FileManager),TYPE               ! FileManager for RUTA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:RUTA     CLASS(RelationManager),TYPE           ! RelationManager for RUTA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SITUACION_IIBB CLASS(FileManager),TYPE         ! FileManager for SITUACION_IIBB
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SITUACION_IIBB CLASS(RelationManager),TYPE     ! RelationManager for SITUACION_IIBB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SUMINISTRO CLASS(FileManager),TYPE             ! FileManager for SUMINISTRO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SUMINISTRO CLASS(RelationManager),TYPE         ! RelationManager for SUMINISTRO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LOCALIDAD2 CLASS(FileManager),TYPE             ! FileManager for LOCALIDAD2
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LOCALIDAD2 CLASS(RelationManager),TYPE         ! RelationManager for LOCALIDAD2
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CODIGO_POSTAL2 CLASS(FileManager),TYPE         ! FileManager for CODIGO_POSTAL2
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CODIGO_POSTAL2 CLASS(RelationManager),TYPE     ! RelationManager for CODIGO_POSTAL2
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:OBSERVACION2 CLASS(FileManager),TYPE           ! FileManager for OBSERVACION2
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OBSERVACION2 CLASS(RelationManager),TYPE       ! RelationManager for OBSERVACION2
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:OBSERVACION3 CLASS(FileManager),TYPE           ! FileManager for OBSERVACION3
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OBSERVACION3 CLASS(RelationManager),TYPE       ! RelationManager for OBSERVACION3
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:OBSERVACION4 CLASS(FileManager),TYPE           ! FileManager for OBSERVACION4
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OBSERVACION4 CLASS(RelationManager),TYPE       ! RelationManager for OBSERVACION4
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:OBSERVACION5 CLASS(FileManager),TYPE           ! FileManager for OBSERVACION5
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:OBSERVACION5 CLASS(RelationManager),TYPE       ! RelationManager for OBSERVACION5
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:OBSERVACION &Hide:Access:OBSERVACION,AUTO,THREAD
_Hide:Relate:OBSERVACION &Hide:Relate:OBSERVACION,AUTO,THREAD
_Hide:Access:TMPUsosMultiples &Hide:Access:TMPUsosMultiples,AUTO,THREAD
_Hide:Relate:TMPUsosMultiples &Hide:Relate:TMPUsosMultiples,AUTO,THREAD
_Hide:Access:RUTA    &Hide:Access:RUTA,AUTO,THREAD
_Hide:Relate:RUTA    &Hide:Relate:RUTA,AUTO,THREAD
_Hide:Access:SITUACION_IIBB &Hide:Access:SITUACION_IIBB,AUTO,THREAD
_Hide:Relate:SITUACION_IIBB &Hide:Relate:SITUACION_IIBB,AUTO,THREAD
_Hide:Access:SUMINISTRO &Hide:Access:SUMINISTRO,AUTO,THREAD
_Hide:Relate:SUMINISTRO &Hide:Relate:SUMINISTRO,AUTO,THREAD
_Hide:Access:LOCALIDAD2 &Hide:Access:LOCALIDAD2,AUTO,THREAD
_Hide:Relate:LOCALIDAD2 &Hide:Relate:LOCALIDAD2,AUTO,THREAD
_Hide:Access:CODIGO_POSTAL2 &Hide:Access:CODIGO_POSTAL2,AUTO,THREAD
_Hide:Relate:CODIGO_POSTAL2 &Hide:Relate:CODIGO_POSTAL2,AUTO,THREAD
_Hide:Access:OBSERVACION2 &Hide:Access:OBSERVACION2,AUTO,THREAD
_Hide:Relate:OBSERVACION2 &Hide:Relate:OBSERVACION2,AUTO,THREAD
_Hide:Access:OBSERVACION3 &Hide:Access:OBSERVACION3,AUTO,THREAD
_Hide:Relate:OBSERVACION3 &Hide:Relate:OBSERVACION3,AUTO,THREAD
_Hide:Access:OBSERVACION4 &Hide:Access:OBSERVACION4,AUTO,THREAD
_Hide:Relate:OBSERVACION4 &Hide:Relate:OBSERVACION4,AUTO,THREAD
_Hide:Access:OBSERVACION5 &Hide:Access:OBSERVACION5,AUTO,THREAD
_Hide:Relate:OBSERVACION5 &Hide:Relate:OBSERVACION5,AUTO,THREAD


personal_BC2:DctInit PROCEDURE
  CODE
  _Hide:Access:OBSERVACION &= NEW(Hide:Access:OBSERVACION)
  _Hide:Relate:OBSERVACION &= NEW(Hide:Relate:OBSERVACION)
  _Hide:Access:TMPUsosMultiples &= NEW(Hide:Access:TMPUsosMultiples)
  _Hide:Relate:TMPUsosMultiples &= NEW(Hide:Relate:TMPUsosMultiples)
  _Hide:Access:RUTA &= NEW(Hide:Access:RUTA)
  _Hide:Relate:RUTA &= NEW(Hide:Relate:RUTA)
  _Hide:Access:SITUACION_IIBB &= NEW(Hide:Access:SITUACION_IIBB)
  _Hide:Relate:SITUACION_IIBB &= NEW(Hide:Relate:SITUACION_IIBB)
  _Hide:Access:SUMINISTRO &= NEW(Hide:Access:SUMINISTRO)
  _Hide:Relate:SUMINISTRO &= NEW(Hide:Relate:SUMINISTRO)
  _Hide:Access:LOCALIDAD2 &= NEW(Hide:Access:LOCALIDAD2)
  _Hide:Relate:LOCALIDAD2 &= NEW(Hide:Relate:LOCALIDAD2)
  _Hide:Access:CODIGO_POSTAL2 &= NEW(Hide:Access:CODIGO_POSTAL2)
  _Hide:Relate:CODIGO_POSTAL2 &= NEW(Hide:Relate:CODIGO_POSTAL2)
  _Hide:Access:OBSERVACION2 &= NEW(Hide:Access:OBSERVACION2)
  _Hide:Relate:OBSERVACION2 &= NEW(Hide:Relate:OBSERVACION2)
  _Hide:Access:OBSERVACION3 &= NEW(Hide:Access:OBSERVACION3)
  _Hide:Relate:OBSERVACION3 &= NEW(Hide:Relate:OBSERVACION3)
  _Hide:Access:OBSERVACION4 &= NEW(Hide:Access:OBSERVACION4)
  _Hide:Relate:OBSERVACION4 &= NEW(Hide:Relate:OBSERVACION4)
  _Hide:Access:OBSERVACION5 &= NEW(Hide:Access:OBSERVACION5)
  _Hide:Relate:OBSERVACION5 &= NEW(Hide:Relate:OBSERVACION5)
  Relate:OBSERVACION &= _Hide:Relate:OBSERVACION
  Relate:TMPUsosMultiples &= _Hide:Relate:TMPUsosMultiples
  Relate:RUTA &= _Hide:Relate:RUTA
  Relate:SITUACION_IIBB &= _Hide:Relate:SITUACION_IIBB
  Relate:SUMINISTRO &= _Hide:Relate:SUMINISTRO
  Relate:LOCALIDAD2 &= _Hide:Relate:LOCALIDAD2
  Relate:CODIGO_POSTAL2 &= _Hide:Relate:CODIGO_POSTAL2
  Relate:OBSERVACION2 &= _Hide:Relate:OBSERVACION2
  Relate:OBSERVACION3 &= _Hide:Relate:OBSERVACION3
  Relate:OBSERVACION4 &= _Hide:Relate:OBSERVACION4
  Relate:OBSERVACION5 &= _Hide:Relate:OBSERVACION5


personal_BC2:FilesInit PROCEDURE
  CODE
  _Hide:Relate:OBSERVACION.Init
  _Hide:Relate:TMPUsosMultiples.Init
  _Hide:Relate:RUTA.Init
  _Hide:Relate:SITUACION_IIBB.Init
  _Hide:Relate:SUMINISTRO.Init
  _Hide:Relate:LOCALIDAD2.Init
  _Hide:Relate:CODIGO_POSTAL2.Init
  _Hide:Relate:OBSERVACION2.Init
  _Hide:Relate:OBSERVACION3.Init
  _Hide:Relate:OBSERVACION4.Init
  _Hide:Relate:OBSERVACION5.Init


personal_BC2:DctKill PROCEDURE
  CODE
  _Hide:Relate:OBSERVACION.Kill
  DISPOSE(_Hide:Relate:OBSERVACION)
  _Hide:Relate:TMPUsosMultiples.Kill
  DISPOSE(_Hide:Relate:TMPUsosMultiples)
  _Hide:Relate:RUTA.Kill
  DISPOSE(_Hide:Relate:RUTA)
  _Hide:Relate:SITUACION_IIBB.Kill
  DISPOSE(_Hide:Relate:SITUACION_IIBB)
  _Hide:Relate:SUMINISTRO.Kill
  DISPOSE(_Hide:Relate:SUMINISTRO)
  _Hide:Relate:LOCALIDAD2.Kill
  DISPOSE(_Hide:Relate:LOCALIDAD2)
  _Hide:Relate:CODIGO_POSTAL2.Kill
  DISPOSE(_Hide:Relate:CODIGO_POSTAL2)
  _Hide:Relate:OBSERVACION2.Kill
  DISPOSE(_Hide:Relate:OBSERVACION2)
  _Hide:Relate:OBSERVACION3.Kill
  DISPOSE(_Hide:Relate:OBSERVACION3)
  _Hide:Relate:OBSERVACION4.Kill
  DISPOSE(_Hide:Relate:OBSERVACION4)
  _Hide:Relate:OBSERVACION5.Kill
  DISPOSE(_Hide:Relate:OBSERVACION5)


Hide:Relate:OBSERVACION.Init PROCEDURE
  CODE
  _Hide:Access:OBSERVACION.Init
  SELF.Init(Access:OBSERVACION,1)


Hide:Access:OBSERVACION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OBS5:Record
  SELF.FileNameValue = 'OBSERVACION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OBSERVACION
  PARENT.Init
  Access:OBSERVACION &= SELF


Hide:Access:OBSERVACION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OBSERVACION &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OBSERVACION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OBSERVACION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OBS5:PK_OBSERVACION,'OBS5:PK_OBSERVACION',0)
    SELF.AddKey(OBS5:KEY__WA_Sys_OBS_ACTIVO_621C39E3,'OBS5:KEY__WA_Sys_OBS_ACTIVO_621C39E3',0)
    SELF.AddKey(OBS5:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3,'OBS5:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3',0)
    SELF.AddKey(OBS5:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3,'OBS5:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3',0)
    SELF.AddKey(OBS5:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3,'OBS5:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3',0)
    SELF.AddKey(OBS5:FK_OBSERVACION_OBSERVACION_DESTINO,'OBS5:FK_OBSERVACION_OBSERVACION_DESTINO',0)
    SELF.AddKey(OBS5:FK_OBSERVACION_OBSERVACION_TIPO,'OBS5:FK_OBSERVACION_OBSERVACION_TIPO',0)
    SELF.AddKey(OBS5:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3,'OBS5:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS5:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3,'OBS5:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS5:FK_OBSERVACION_MOTIVO_TRABAJO,'OBS5:FK_OBSERVACION_MOTIVO_TRABAJO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OBSERVACION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_OBSERVACION2)
  SELF.AddRelationLink(OBS5:OBS_ID,TOE:TOE_OBS2)


Hide:Relate:OBSERVACION.Kill PROCEDURE

  CODE
  _Hide:Access:OBSERVACION.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:OBSERVACION &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OBSERVACION)                        ! destroy the file manager


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


Hide:Relate:RUTA.Init PROCEDURE
  CODE
  _Hide:Access:RUTA.Init
  SELF.Init(Access:RUTA,1)


Hide:Access:RUTA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RUT:Record
  SELF.FileNameValue = 'RUTA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RUTA
  PARENT.Init
  Access:RUTA &= SELF


Hide:Access:RUTA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RUTA &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RUTA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RUTA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RUT:PK_RUTA,'RUT:PK_RUTA',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_GRUPO_67C004A0,'RUT:KEY__WA_Sys_RUT_GRUPO_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_ACTIVO_67C004A0,'RUT:KEY__WA_Sys_RUT_ACTIVO_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_ID_67C004A0,'RUT:KEY__WA_Sys_RUT_ID_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_LOTE_REPLICACION_67C004A0,'RUT:KEY__WA_Sys_RUT_LOTE_REPLICACION_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_FECHA_UPDATE_67C004A0,'RUT:KEY__WA_Sys_RUT_FECHA_UPDATE_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_ID_USER_67C004A0,'RUT:KEY__WA_Sys_RUT_ID_USER_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_SINCRONIZA_CRONOGRAMAS_67C004A0,'RUT:KEY__WA_Sys_RUT_SINCRONIZA_CRONOGRAMAS_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_MEDIA_CONSUMO_67C004A0,'RUT:KEY__WA_Sys_RUT_MEDIA_CONSUMO_67C004A0',0)
    SELF.AddKey(RUT:KEY__WA_Sys_RUT_DESCRIPCION_67C004A0,'RUT:KEY__WA_Sys_RUT_DESCRIPCION_67C004A0',0)
    SELF.AddKey(RUT:FK_RUTA_GRUPO,'RUT:FK_RUTA_GRUPO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RUTA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUMINISTRO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,SUM:FK_SUMINISTRO_RUTA)
  SELF.AddRelationLink(RUT:RUT_SUCURSAL,SUM:SUM_SUCURSAL)
  SELF.AddRelationLink(RUT:RUT_GRUPO,SUM:SUM_GRUPO)
  SELF.AddRelationLink(RUT:RUT_ID,SUM:SUM_RUTA)

  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_RUTA)
  SELF.AddRelationLink(RUT:RUT_SUCURSAL,TOE:TOE_SUCURSAL)
  SELF.AddRelationLink(RUT:RUT_GRUPO,TOE:TOE_GRUPO)
  SELF.AddRelationLink(RUT:RUT_ID,TOE:TOE_RUTA)


Hide:Relate:RUTA.Kill PROCEDURE

  CODE
  _Hide:Access:RUTA.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:RUTA &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RUTA)                               ! destroy the file manager


Hide:Relate:SITUACION_IIBB.Init PROCEDURE
  CODE
  _Hide:Access:SITUACION_IIBB.Init
  SELF.Init(Access:SITUACION_IIBB,1)


Hide:Access:SITUACION_IIBB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SIT2:Record
  SELF.FileNameValue = 'SITUACION_IIBB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SITUACION_IIBB
  PARENT.Init
  Access:SITUACION_IIBB &= SELF


Hide:Access:SITUACION_IIBB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SITUACION_IIBB &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SITUACION_IIBB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SITUACION_IIBB,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SIT2:PK_SITUACION_IIBB,'SIT2:PK_SITUACION_IIBB',0)
    SELF.AddKey(SIT2:KEY__WA_Sys_SIB_ACTIVO_78EA90A2,'SIT2:KEY__WA_Sys_SIB_ACTIVO_78EA90A2',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SITUACION_IIBB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_SITUACION_IIBB)
  SELF.AddRelationLink(SIT2:SIB_ID,CLI:CLI_SITUACION_IIBB)


Hide:Relate:SITUACION_IIBB.Kill PROCEDURE

  CODE
  _Hide:Access:SITUACION_IIBB.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:SITUACION_IIBB &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SITUACION_IIBB)                     ! destroy the file manager


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
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_ID_79A9AAB1,'SUM:KEY__WA_Sys_SUM_ID_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_CLIENTE_79A9AAB1,'SUM:KEY__WA_Sys_SUM_CLIENTE_79A9AAB1',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_ESTADO_ADMINISTRATIVO,'SUM:FK_SUMINISTRO_ESTADO_ADMINISTRATIVO',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_SUCURSAL,'SUM:FK_SUMINISTRO_SUCURSAL',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_CODIGO_POSTAL_79A9AAB1,'SUM:KEY__WA_Sys_SUM_CODIGO_POSTAL_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_GRUPO_79A9AAB1,'SUM:KEY__WA_Sys_SUM_GRUPO_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_RUTA_79A9AAB1,'SUM:KEY__WA_Sys_SUM_RUTA_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_SUMINISTRO_ANTERIOR1_79A9AAB1,'SUM:KEY__WA_Sys_SUM_SUMINISTRO_ANTERIOR1_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_sum_orden_lectura_79A9AAB1,'SUM:KEY__WA_Sys_sum_orden_lectura_79A9AAB1',0)
    SELF.AddKey(SUM:KEY_KEY__WA_Sys_SUM_SUMINISTRO_ANTERIOR3_79A9AAB1,'SUM:KEY_KEY__WA_Sys_SUM_SUMINISTRO_ANTERIOR3_79A9AAB1',0)
    SELF.AddKey(SUM:KEY_KEY_KEY__WA_Sys_SUM_SUMINISTRO_ANTERIOR2_79A9AAB1,'SUM:KEY_KEY_KEY__WA_Sys_SUM_SUMINISTRO_ANTERIOR2_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_Sum_Calle_79A9AAB1,'SUM:KEY__WA_Sys_Sum_Calle_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_ALTURA_79A9AAB1,'SUM:KEY__WA_Sys_SUM_ALTURA_79A9AAB1',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_CIIU,'SUM:FK_SUMINISTRO_CIIU',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_FECHA_UPDATE_79A9AAB1,'SUM:KEY__WA_Sys_SUM_FECHA_UPDATE_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_DIRECCION_POSTAL_79A9AAB1,'SUM:KEY__WA_Sys_SUM_DIRECCION_POSTAL_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_FACTURABLE_79A9AAB1,'SUM:KEY__WA_Sys_SUM_FACTURABLE_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_PISO_79A9AAB1,'SUM:KEY__WA_Sys_SUM_PISO_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_DEPARTAMENTO_79A9AAB1,'SUM:KEY__WA_Sys_SUM_DEPARTAMENTO_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_ANEXO_79A9AAB1,'SUM:KEY__WA_Sys_SUM_ANEXO_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_LOTE_REPLICACION_79A9AAB1,'SUM:KEY__WA_Sys_SUM_LOTE_REPLICACION_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_MOROSIDAD_79A9AAB1,'SUM:KEY__WA_Sys_SUM_MOROSIDAD_79A9AAB1',0)
    SELF.AddKey(SUM:KEY__WA_Sys_SUM_FECHA_ESTADO_ADM_79A9AAB1,'SUM:KEY__WA_Sys_SUM_FECHA_ESTADO_ADM_79A9AAB1',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_RUTA,'SUM:FK_SUMINISTRO_RUTA',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_LOCALIDAD,'SUM:FK_SUMINISTRO_LOCALIDAD',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_CODIGO_POSTAL,'SUM:FK_SUMINISTRO_CODIGO_POSTAL',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_CLIENTE,'SUM:FK_SUMINISTRO_CLIENTE',0)
    SELF.AddKey(SUM:FK_SUMINISTRO_EMPRESA,'SUM:FK_SUMINISTRO_EMPRESA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SUMINISTRO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:CLIENTE1      USHORT,AUTO
Save:CLIENTE2      USHORT,AUTO
Save:RUTA4         USHORT,AUTO
Save:RUTA5         USHORT,AUTO
Save:RUTA6         USHORT,AUTO
Save:LOCALIDAD8    USHORT,AUTO
Save:CODIGO_POSTAL9 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('SUM:SUM_EMPRESA')
    Save:CLIENTE1 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = SUM:SUM_EMPRESA
    CLI:CLI_ID = SUM:SUM_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE1)
  OF 2
    GlobalErrors.SetField('SUM:SUM_CLIENTE')
    Save:CLIENTE2 = Access:CLIENTE.SaveFile()
    CLI:CLI_EMPRESA = SUM:SUM_EMPRESA
    CLI:CLI_ID = SUM:SUM_CLIENTE
    ReturnValue = Access:CLIENTE.TryFetch(CLI:PK_CLIENTE)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CLIENTE')
      END
    END
    Access:CLIENTE.RestoreFile(Save:CLIENTE2)
  OF 4
    GlobalErrors.SetField('SUM:SUM_SUCURSAL')
    Save:RUTA4 = Access:RUTA.SaveFile()
    RUT:RUT_SUCURSAL = SUM:SUM_SUCURSAL
    RUT:RUT_GRUPO = SUM:SUM_GRUPO
    RUT:RUT_ID = SUM:SUM_RUTA
    ReturnValue = Access:RUTA.TryFetch(RUT:PK_RUTA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'RUTA')
      END
    END
    Access:RUTA.RestoreFile(Save:RUTA4)
  OF 5
    GlobalErrors.SetField('SUM:SUM_GRUPO')
    Save:RUTA5 = Access:RUTA.SaveFile()
    RUT:RUT_SUCURSAL = SUM:SUM_SUCURSAL
    RUT:RUT_GRUPO = SUM:SUM_GRUPO
    RUT:RUT_ID = SUM:SUM_RUTA
    ReturnValue = Access:RUTA.TryFetch(RUT:PK_RUTA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'RUTA')
      END
    END
    Access:RUTA.RestoreFile(Save:RUTA5)
  OF 6
    GlobalErrors.SetField('SUM:SUM_RUTA')
    Save:RUTA6 = Access:RUTA.SaveFile()
    RUT:RUT_SUCURSAL = SUM:SUM_SUCURSAL
    RUT:RUT_GRUPO = SUM:SUM_GRUPO
    RUT:RUT_ID = SUM:SUM_RUTA
    ReturnValue = Access:RUTA.TryFetch(RUT:PK_RUTA)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'RUTA')
      END
    END
    Access:RUTA.RestoreFile(Save:RUTA6)
  OF 8
    GlobalErrors.SetField('SUM:SUM_LOCALIDAD')
    Save:LOCALIDAD8 = Access:LOCALIDAD.SaveFile()
    LOC2:LOC_ID = SUM:SUM_LOCALIDAD
    ReturnValue = Access:LOCALIDAD.TryFetch(LOC2:PK_LOCALIDAD)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LOCALIDAD')
      END
    END
    Access:LOCALIDAD.RestoreFile(Save:LOCALIDAD8)
  OF 9
    GlobalErrors.SetField('SUM:SUM_CODIGO_POSTAL')
    Save:CODIGO_POSTAL9 = Access:CODIGO_POSTAL.SaveFile()
    CPO:CPO_LOCALIDAD = SUM:SUM_LOCALIDAD
    CPO:CPO_ID = SUM:SUM_CODIGO_POSTAL
    ReturnValue = Access:CODIGO_POSTAL.TryFetch(CPO:PK_CODIGO_POSTAL)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'CODIGO_POSTAL')
      END
    END
    Access:CODIGO_POSTAL.RestoreFile(Save:CODIGO_POSTAL9)
  END
  RETURN ReturnValue


Hide:Relate:SUMINISTRO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SUMINISTRO_TIPO_EMPRESA,RI:None,RI:None,STE:PK_SUMINISTRO_TIPO_EMPRESA)
  SELF.AddRelationLink(SUM:SUM_EMPRESA,STE:STE_EMPRESA)
  SELF.AddRelationLink(SUM:SUM_CLIENTE,STE:STE_CLIENTE)
  SELF.AddRelationLink(SUM:SUM_ID,STE:STE_SUMINISTRO)

  SELF.AddRelation(Relate:DEBITO_EMPLEADOS,RI:None,RI:None,DEB:Pk_Cliente)
  SELF.AddRelationLink(SUM:SUM_EMPRESA,DEB:DEB_EMPRESA)
  SELF.AddRelationLink(SUM:SUM_CLIENTE,DEB:DEB_CLIENTE)
  SELF.AddRelationLink(SUM:SUM_ID,DEB:DEB_SUMINISTRO)

  SELF.AddRelation(Relate:TOMA_ESTADO)

  SELF.AddRelation(Relate:LOCALIDAD)

  SELF.AddRelation(Relate:CLIENTE)

  SELF.AddRelation(Relate:EMPRESA)

  SELF.AddRelation(Relate:CODIGO_POSTAL)

  SELF.AddRelation(Relate:RUTA)

  SELF.AddRelation(Relate:COMPROBANTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CDE:FK_COMPROBANTE_SUMINISTRO)
  SELF.AddRelationLink(SUM:SUM_EMPRESA,CDE:CDE_EMPRESA)
  SELF.AddRelationLink(SUM:SUM_CLIENTE,CDE:CDE_CLIENTE)
  SELF.AddRelationLink(SUM:SUM_ID,CDE:CDE_SUMINISTRO)

  SELF.AddRelation(Relate:DEBITO_CREDITO_PENDIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,DCP:FK_DEBITO_CREDITO_PENDIENTE_SUMINISTRO)
  SELF.AddRelationLink(SUM:SUM_EMPRESA,DCP:DCP_EMPRESA)
  SELF.AddRelationLink(SUM:SUM_CLIENTE,DCP:DCP_CLIENTE)
  SELF.AddRelationLink(SUM:SUM_ID,DCP:DCP_SUMINISTRO)


Hide:Relate:SUMINISTRO.Kill PROCEDURE

  CODE
  _Hide:Access:SUMINISTRO.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SUMINISTRO &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SUMINISTRO)                         ! destroy the file manager


Hide:Relate:LOCALIDAD2.Init PROCEDURE
  CODE
  _Hide:Access:LOCALIDAD2.Init
  SELF.Init(Access:LOCALIDAD2,1)
  SELF.SetAlias(Relate:LOCALIDAD)


Hide:Access:LOCALIDAD2.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LOC:Record
  SELF.AliasedFile &= Access:LOCALIDAD                     !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'LOCALIDAD2'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LOCALIDAD2
  PARENT.Init
  Access:LOCALIDAD2 &= SELF


Hide:Access:LOCALIDAD2.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LOCALIDAD2 &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LOCALIDAD2.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LOCALIDAD2,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LOC:PK_LOCALIDAD,'LOC:PK_LOCALIDAD',0)
    SELF.AddKey(LOC:IX_LOCALIDAD,'LOC:IX_LOCALIDAD',0)
    SELF.AddKey(LOC:FK_LOCALIDAD_SUCURSAL,'LOC:FK_LOCALIDAD_SUCURSAL',0)
    SELF.AddKey(LOC:pklocalidad_Proyecto,'LOC:pklocalidad_Proyecto',0)
    SELF.AddKey(LOC:PKlocalidad_busqueda,'LOC:PKlocalidad_busqueda',0)
    SELF.AddKey(LOC:FK_LOCALIDAD_ZONA_TARIFARIA,'LOC:FK_LOCALIDAD_ZONA_TARIFARIA',0)
    SELF.AddKey(LOC:KEY__WA_Sys_LOC_FECHA_UPDATE_126A6B83,'LOC:KEY__WA_Sys_LOC_FECHA_UPDATE_126A6B83',0)
    SELF.AddKey(LOC:KEY__WA_Sys_LOC_INFORMA_SUCURSAL_126A6B83,'LOC:KEY__WA_Sys_LOC_INFORMA_SUCURSAL_126A6B83',0)
    SELF.AddKey(LOC:KEY__WA_Sys_LOC_ACTIVO_126A6B83,'LOC:KEY__WA_Sys_LOC_ACTIVO_126A6B83',0)
    SELF.AddKey(LOC:KEY__WA_Sys_LOC_LOTE_REPLICACION_126A6B83,'LOC:KEY__WA_Sys_LOC_LOTE_REPLICACION_126A6B83',0)
    SELF.AddKey(LOC:FK_LOCALIDAD_MUNICIPIO,'LOC:FK_LOCALIDAD_MUNICIPIO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LOCALIDAD2.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_LOCALIDAD1)
  SELF.AddRelationLink(LOC:LOC_ID,CLI:CLI_LOCALIDAD_LABORAL)


Hide:Relate:LOCALIDAD2.Kill PROCEDURE

  CODE
  _Hide:Access:LOCALIDAD2.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:LOCALIDAD2 &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LOCALIDAD2)                         ! destroy the file manager


Hide:Relate:CODIGO_POSTAL2.Init PROCEDURE
  CODE
  _Hide:Access:CODIGO_POSTAL2.Init
  SELF.Init(Access:CODIGO_POSTAL2,1)
  SELF.SetAlias(Relate:CODIGO_POSTAL)


Hide:Access:CODIGO_POSTAL2.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= COD:Record
  SELF.AliasedFile &= Access:CODIGO_POSTAL                 !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'CODIGO_POSTAL2'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CODIGO_POSTAL2
  PARENT.Init
  Access:CODIGO_POSTAL2 &= SELF


Hide:Access:CODIGO_POSTAL2.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CODIGO_POSTAL2 &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CODIGO_POSTAL2.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CODIGO_POSTAL2,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(COD:PK_CODIGO_POSTAL,'COD:PK_CODIGO_POSTAL',0)
    SELF.AddKey(COD:KEY__WA_Sys_CPO_ID_5A0616CF,'COD:KEY__WA_Sys_CPO_ID_5A0616CF',0)
    SELF.AddKey(COD:KEY__WA_Sys_CPO_FECHA_UPDATE_5A0616CF,'COD:KEY__WA_Sys_CPO_FECHA_UPDATE_5A0616CF',0)
    SELF.AddKey(COD:FK_CODIGO_POSTAL_LOCALIDAD,'COD:FK_CODIGO_POSTAL_LOCALIDAD',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CODIGO_POSTAL2.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CLIENTE,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,CLI:FK_CLIENTE_CODIGO_POSTAL)
  SELF.AddRelationLink(COD:CPO_LOCALIDAD,CLI:CLI_LOCALIDAD_RESIDENCIA)
  SELF.AddRelationLink(COD:CPO_ID,CLI:CLI_CODIGO_POSTAL_RESIDENCIA)


Hide:Relate:CODIGO_POSTAL2.Kill PROCEDURE

  CODE
  _Hide:Access:CODIGO_POSTAL2.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:CODIGO_POSTAL2 &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CODIGO_POSTAL2)                     ! destroy the file manager


Hide:Relate:OBSERVACION2.Init PROCEDURE
  CODE
  _Hide:Access:OBSERVACION2.Init
  SELF.Init(Access:OBSERVACION2,1)
  SELF.SetAlias(Relate:OBSERVACION)


Hide:Access:OBSERVACION2.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OBS:Record
  SELF.AliasedFile &= Access:OBSERVACION                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'OBSERVACION2'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OBSERVACION2
  PARENT.Init
  Access:OBSERVACION2 &= SELF


Hide:Access:OBSERVACION2.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OBSERVACION2 &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OBSERVACION2.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OBSERVACION2,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OBS:PK_OBSERVACION,'OBS:PK_OBSERVACION',0)
    SELF.AddKey(OBS:KEY__WA_Sys_OBS_ACTIVO_621C39E3,'OBS:KEY__WA_Sys_OBS_ACTIVO_621C39E3',0)
    SELF.AddKey(OBS:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3,'OBS:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3',0)
    SELF.AddKey(OBS:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3,'OBS:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3',0)
    SELF.AddKey(OBS:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3,'OBS:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3',0)
    SELF.AddKey(OBS:FK_OBSERVACION_OBSERVACION_DESTINO,'OBS:FK_OBSERVACION_OBSERVACION_DESTINO',0)
    SELF.AddKey(OBS:FK_OBSERVACION_OBSERVACION_TIPO,'OBS:FK_OBSERVACION_OBSERVACION_TIPO',0)
    SELF.AddKey(OBS:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3,'OBS:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3,'OBS:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS:FK_OBSERVACION_MOTIVO_TRABAJO,'OBS:FK_OBSERVACION_MOTIVO_TRABAJO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OBSERVACION2.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_OBSERVACION3)
  SELF.AddRelationLink(OBS:OBS_ID,TOE:TOE_OBS3)


Hide:Relate:OBSERVACION2.Kill PROCEDURE

  CODE
  _Hide:Access:OBSERVACION2.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OBSERVACION2 &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OBSERVACION2)                       ! destroy the file manager


Hide:Relate:OBSERVACION3.Init PROCEDURE
  CODE
  _Hide:Access:OBSERVACION3.Init
  SELF.Init(Access:OBSERVACION3,1)
  SELF.SetAlias(Relate:OBSERVACION)


Hide:Access:OBSERVACION3.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OBS2:Record
  SELF.AliasedFile &= Access:OBSERVACION                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'OBSERVACION3'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OBSERVACION3
  PARENT.Init
  Access:OBSERVACION3 &= SELF


Hide:Access:OBSERVACION3.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OBSERVACION3 &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OBSERVACION3.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OBSERVACION3,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OBS2:PK_OBSERVACION,'OBS2:PK_OBSERVACION',0)
    SELF.AddKey(OBS2:KEY__WA_Sys_OBS_ACTIVO_621C39E3,'OBS2:KEY__WA_Sys_OBS_ACTIVO_621C39E3',0)
    SELF.AddKey(OBS2:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3,'OBS2:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3',0)
    SELF.AddKey(OBS2:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3,'OBS2:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3',0)
    SELF.AddKey(OBS2:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3,'OBS2:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3',0)
    SELF.AddKey(OBS2:FK_OBSERVACION_OBSERVACION_DESTINO,'OBS2:FK_OBSERVACION_OBSERVACION_DESTINO',0)
    SELF.AddKey(OBS2:FK_OBSERVACION_OBSERVACION_TIPO,'OBS2:FK_OBSERVACION_OBSERVACION_TIPO',0)
    SELF.AddKey(OBS2:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3,'OBS2:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS2:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3,'OBS2:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS2:FK_OBSERVACION_MOTIVO_TRABAJO,'OBS2:FK_OBSERVACION_MOTIVO_TRABAJO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OBSERVACION3.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_OBSERVACION4)
  SELF.AddRelationLink(OBS2:OBS_ID,TOE:TOE_OBS4)


Hide:Relate:OBSERVACION3.Kill PROCEDURE

  CODE
  _Hide:Access:OBSERVACION3.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OBSERVACION3 &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OBSERVACION3)                       ! destroy the file manager


Hide:Relate:OBSERVACION4.Init PROCEDURE
  CODE
  _Hide:Access:OBSERVACION4.Init
  SELF.Init(Access:OBSERVACION4,1)
  SELF.SetAlias(Relate:OBSERVACION)


Hide:Access:OBSERVACION4.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OBS3:Record
  SELF.AliasedFile &= Access:OBSERVACION                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'OBSERVACION4'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OBSERVACION4
  PARENT.Init
  Access:OBSERVACION4 &= SELF


Hide:Access:OBSERVACION4.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OBSERVACION4 &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OBSERVACION4.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OBSERVACION4,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OBS3:PK_OBSERVACION,'OBS3:PK_OBSERVACION',0)
    SELF.AddKey(OBS3:KEY__WA_Sys_OBS_ACTIVO_621C39E3,'OBS3:KEY__WA_Sys_OBS_ACTIVO_621C39E3',0)
    SELF.AddKey(OBS3:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3,'OBS3:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3',0)
    SELF.AddKey(OBS3:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3,'OBS3:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3',0)
    SELF.AddKey(OBS3:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3,'OBS3:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3',0)
    SELF.AddKey(OBS3:FK_OBSERVACION_OBSERVACION_DESTINO,'OBS3:FK_OBSERVACION_OBSERVACION_DESTINO',0)
    SELF.AddKey(OBS3:FK_OBSERVACION_OBSERVACION_TIPO,'OBS3:FK_OBSERVACION_OBSERVACION_TIPO',0)
    SELF.AddKey(OBS3:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3,'OBS3:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS3:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3,'OBS3:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS3:FK_OBSERVACION_MOTIVO_TRABAJO,'OBS3:FK_OBSERVACION_MOTIVO_TRABAJO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OBSERVACION4.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_OBSERVACION5)
  SELF.AddRelationLink(OBS3:OBS_ID,TOE:TOE_OBS5)


Hide:Relate:OBSERVACION4.Kill PROCEDURE

  CODE
  _Hide:Access:OBSERVACION4.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OBSERVACION4 &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OBSERVACION4)                       ! destroy the file manager


Hide:Relate:OBSERVACION5.Init PROCEDURE
  CODE
  _Hide:Access:OBSERVACION5.Init
  SELF.Init(Access:OBSERVACION5,1)
  SELF.SetAlias(Relate:OBSERVACION)


Hide:Access:OBSERVACION5.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OBS4:Record
  SELF.AliasedFile &= Access:OBSERVACION                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'OBSERVACION5'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OBSERVACION5
  PARENT.Init
  Access:OBSERVACION5 &= SELF


Hide:Access:OBSERVACION5.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OBSERVACION5 &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OBSERVACION5.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OBSERVACION5,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OBS4:PK_OBSERVACION,'OBS4:PK_OBSERVACION',0)
    SELF.AddKey(OBS4:KEY__WA_Sys_OBS_ACTIVO_621C39E3,'OBS4:KEY__WA_Sys_OBS_ACTIVO_621C39E3',0)
    SELF.AddKey(OBS4:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3,'OBS4:KEY__WA_Sys_OBS_TIPO_EMPRESA_621C39E3',0)
    SELF.AddKey(OBS4:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3,'OBS4:KEY__WA_Sys_OBS_GENERA_ORDEN_621C39E3',0)
    SELF.AddKey(OBS4:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3,'OBS4:KEY__WA_Sys_OBS_DESCRIPCION_621C39E3',0)
    SELF.AddKey(OBS4:FK_OBSERVACION_OBSERVACION_DESTINO,'OBS4:FK_OBSERVACION_OBSERVACION_DESTINO',0)
    SELF.AddKey(OBS4:FK_OBSERVACION_OBSERVACION_TIPO,'OBS4:FK_OBSERVACION_OBSERVACION_TIPO',0)
    SELF.AddKey(OBS4:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3,'OBS4:KEY__WA_Sys_OBS_TIPO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS4:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3,'OBS4:KEY__WA_Sys_OBS_MOTIVO_TRABAJO_621C39E3',0)
    SELF.AddKey(OBS4:FK_OBSERVACION_MOTIVO_TRABAJO,'OBS4:FK_OBSERVACION_MOTIVO_TRABAJO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OBSERVACION5.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TOMA_ESTADO,RI:RESTRICT_SERVER,RI:RESTRICT_SERVER,TOE:FK_TOMA_ESTADO_OBSERVACION1)
  SELF.AddRelationLink(OBS4:OBS_ID,TOE:TOE_OBS1)


Hide:Relate:OBSERVACION5.Kill PROCEDURE

  CODE
  _Hide:Access:OBSERVACION5.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OBSERVACION5 &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OBSERVACION5)                       ! destroy the file manager

