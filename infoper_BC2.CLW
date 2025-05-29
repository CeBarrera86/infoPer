  MEMBER('infoper.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
infoper_BC2:DctInit    PROCEDURE
infoper_BC2:DctKill    PROCEDURE
infoper_BC2:FilesInit  PROCEDURE
  END

Hide:Access:HORAS_EXTRA CLASS(FileManager),TYPE            ! FileManager for HORAS_EXTRA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:HORAS_EXTRA CLASS(RelationManager),TYPE        ! RelationManager for HORAS_EXTRA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:HORAS_EXTRA_DENARIUS CLASS(FileManager),TYPE   ! FileManager for HORAS_EXTRA_DENARIUS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:HORAS_EXTRA_DENARIUS CLASS(RelationManager),TYPE ! RelationManager for HORAS_EXTRA_DENARIUS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DETALLE_HORAS_EXTRAS CLASS(FileManager),TYPE   ! FileManager for DETALLE_HORAS_EXTRAS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DETALLE_HORAS_EXTRAS CLASS(RelationManager),TYPE ! RelationManager for DETALLE_HORAS_EXTRAS
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ERP_HORASEXTRA CLASS(FileManager),TYPE         ! FileManager for ERP_HORASEXTRA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ERP_HORASEXTRA CLASS(RelationManager),TYPE     ! RelationManager for ERP_HORASEXTRA
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ERP_REEMBOLSO CLASS(FileManager),TYPE          ! FileManager for ERP_REEMBOLSO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ERP_REEMBOLSO CLASS(RelationManager),TYPE      ! RelationManager for ERP_REEMBOLSO
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CERTIFICADOS CLASS(FileManager),TYPE           ! FileManager for CERTIFICADOS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CERTIFICADOS CLASS(RelationManager),TYPE       ! RelationManager for CERTIFICADOS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CONCEPTO_MEDICO CLASS(FileManager),TYPE        ! FileManager for CONCEPTO_MEDICO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:CONCEPTO_MEDICO CLASS(RelationManager),TYPE    ! RelationManager for CONCEPTO_MEDICO
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DETALLE_AUSENCIA CLASS(FileManager),TYPE       ! FileManager for DETALLE_AUSENCIA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:DETALLE_AUSENCIA CLASS(RelationManager),TYPE   ! RelationManager for DETALLE_AUSENCIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ENFERMEDADES CLASS(FileManager),TYPE           ! FileManager for ENFERMEDADES
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ENFERMEDADES CLASS(RelationManager),TYPE       ! RelationManager for ENFERMEDADES
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:MOTIVO_AUSENCIA CLASS(FileManager),TYPE        ! FileManager for MOTIVO_AUSENCIA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MOTIVO_AUSENCIA CLASS(RelationManager),TYPE    ! RelationManager for MOTIVO_AUSENCIA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:pertel   CLASS(FileManager),TYPE               ! FileManager for pertel
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:pertel   CLASS(RelationManager),TYPE           ! RelationManager for pertel
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:REGIMEN_LICENCIAS_ESPECIALES CLASS(FileManager),TYPE ! FileManager for REGIMEN_LICENCIAS_ESPECIALES
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES CLASS(RelationManager),TYPE ! RelationManager for REGIMEN_LICENCIAS_ESPECIALES
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:datadicn CLASS(FileManager),TYPE               ! FileManager for datadicn
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:datadicn CLASS(RelationManager),TYPE           ! RelationManager for datadicn
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LIQUIDALEG CLASS(FileManager),TYPE             ! FileManager for LIQUIDALEG
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LIQUIDALEG CLASS(RelationManager),TYPE         ! RelationManager for LIQUIDALEG
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SQLBLOB  CLASS(FileManager),TYPE               ! FileManager for SQLBLOB
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SQLBLOB  CLASS(RelationManager),TYPE           ! RelationManager for SQLBLOB
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PER_WEBREC CLASS(FileManager),TYPE             ! FileManager for PER_WEBREC
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PER_WEBREC CLASS(RelationManager),TYPE         ! RelationManager for PER_WEBREC
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:perdoc   CLASS(FileManager),TYPE               ! FileManager for perdoc
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:perdoc   CLASS(RelationManager),TYPE           ! RelationManager for perdoc
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ADETALLE_LICENCIA CLASS(FileManager),TYPE      ! FileManager for ADETALLE_LICENCIA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ADETALLE_LICENCIA CLASS(RelationManager),TYPE  ! RelationManager for ADETALLE_LICENCIA
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::UserGroup CLASS(FileManager),TYPE        ! FileManager for SSEC::UserGroup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::UserGroup CLASS(RelationManager),TYPE    ! RelationManager for SSEC::UserGroup
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AHORAS_EXTRA CLASS(FileManager),TYPE           ! FileManager for AHORAS_EXTRA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AHORAS_EXTRA CLASS(RelationManager),TYPE       ! RelationManager for AHORAS_EXTRA
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:HORAS_EXTRA &Hide:Access:HORAS_EXTRA,AUTO,THREAD
_Hide:Relate:HORAS_EXTRA &Hide:Relate:HORAS_EXTRA,AUTO,THREAD
_Hide:Access:HORAS_EXTRA_DENARIUS &Hide:Access:HORAS_EXTRA_DENARIUS,AUTO,THREAD
_Hide:Relate:HORAS_EXTRA_DENARIUS &Hide:Relate:HORAS_EXTRA_DENARIUS,AUTO,THREAD
_Hide:Access:DETALLE_HORAS_EXTRAS &Hide:Access:DETALLE_HORAS_EXTRAS,AUTO,THREAD
_Hide:Relate:DETALLE_HORAS_EXTRAS &Hide:Relate:DETALLE_HORAS_EXTRAS,AUTO,THREAD
_Hide:Access:ERP_HORASEXTRA &Hide:Access:ERP_HORASEXTRA,AUTO,THREAD
_Hide:Relate:ERP_HORASEXTRA &Hide:Relate:ERP_HORASEXTRA,AUTO,THREAD
_Hide:Access:ERP_REEMBOLSO &Hide:Access:ERP_REEMBOLSO,AUTO,THREAD
_Hide:Relate:ERP_REEMBOLSO &Hide:Relate:ERP_REEMBOLSO,AUTO,THREAD
_Hide:Access:CERTIFICADOS &Hide:Access:CERTIFICADOS,AUTO,THREAD
_Hide:Relate:CERTIFICADOS &Hide:Relate:CERTIFICADOS,AUTO,THREAD
_Hide:Access:CONCEPTO_MEDICO &Hide:Access:CONCEPTO_MEDICO,AUTO,THREAD
_Hide:Relate:CONCEPTO_MEDICO &Hide:Relate:CONCEPTO_MEDICO,AUTO,THREAD
_Hide:Access:DETALLE_AUSENCIA &Hide:Access:DETALLE_AUSENCIA,AUTO,THREAD
_Hide:Relate:DETALLE_AUSENCIA &Hide:Relate:DETALLE_AUSENCIA,AUTO,THREAD
_Hide:Access:ENFERMEDADES &Hide:Access:ENFERMEDADES,AUTO,THREAD
_Hide:Relate:ENFERMEDADES &Hide:Relate:ENFERMEDADES,AUTO,THREAD
_Hide:Access:MOTIVO_AUSENCIA &Hide:Access:MOTIVO_AUSENCIA,AUTO,THREAD
_Hide:Relate:MOTIVO_AUSENCIA &Hide:Relate:MOTIVO_AUSENCIA,AUTO,THREAD
_Hide:Access:pertel  &Hide:Access:pertel,AUTO,THREAD
_Hide:Relate:pertel  &Hide:Relate:pertel,AUTO,THREAD
_Hide:Access:REGIMEN_LICENCIAS_ESPECIALES &Hide:Access:REGIMEN_LICENCIAS_ESPECIALES,AUTO,THREAD
_Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES &Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES,AUTO,THREAD
_Hide:Access:datadicn &Hide:Access:datadicn,AUTO,THREAD
_Hide:Relate:datadicn &Hide:Relate:datadicn,AUTO,THREAD
_Hide:Access:LIQUIDALEG &Hide:Access:LIQUIDALEG,AUTO,THREAD
_Hide:Relate:LIQUIDALEG &Hide:Relate:LIQUIDALEG,AUTO,THREAD
_Hide:Access:SQLBLOB &Hide:Access:SQLBLOB,AUTO,THREAD
_Hide:Relate:SQLBLOB &Hide:Relate:SQLBLOB,AUTO,THREAD
_Hide:Access:PER_WEBREC &Hide:Access:PER_WEBREC,AUTO,THREAD
_Hide:Relate:PER_WEBREC &Hide:Relate:PER_WEBREC,AUTO,THREAD
_Hide:Access:perdoc  &Hide:Access:perdoc,AUTO,THREAD
_Hide:Relate:perdoc  &Hide:Relate:perdoc,AUTO,THREAD
_Hide:Access:ADETALLE_LICENCIA &Hide:Access:ADETALLE_LICENCIA,AUTO,THREAD
_Hide:Relate:ADETALLE_LICENCIA &Hide:Relate:ADETALLE_LICENCIA,AUTO,THREAD
_Hide:Access:SSEC::UserGroup &Hide:Access:SSEC::UserGroup,AUTO,THREAD
_Hide:Relate:SSEC::UserGroup &Hide:Relate:SSEC::UserGroup,AUTO,THREAD
_Hide:Access:AHORAS_EXTRA &Hide:Access:AHORAS_EXTRA,AUTO,THREAD
_Hide:Relate:AHORAS_EXTRA &Hide:Relate:AHORAS_EXTRA,AUTO,THREAD


infoper_BC2:DctInit PROCEDURE
  CODE
  _Hide:Access:HORAS_EXTRA &= NEW(Hide:Access:HORAS_EXTRA)
  _Hide:Relate:HORAS_EXTRA &= NEW(Hide:Relate:HORAS_EXTRA)
  _Hide:Access:HORAS_EXTRA_DENARIUS &= NEW(Hide:Access:HORAS_EXTRA_DENARIUS)
  _Hide:Relate:HORAS_EXTRA_DENARIUS &= NEW(Hide:Relate:HORAS_EXTRA_DENARIUS)
  _Hide:Access:DETALLE_HORAS_EXTRAS &= NEW(Hide:Access:DETALLE_HORAS_EXTRAS)
  _Hide:Relate:DETALLE_HORAS_EXTRAS &= NEW(Hide:Relate:DETALLE_HORAS_EXTRAS)
  _Hide:Access:ERP_HORASEXTRA &= NEW(Hide:Access:ERP_HORASEXTRA)
  _Hide:Relate:ERP_HORASEXTRA &= NEW(Hide:Relate:ERP_HORASEXTRA)
  _Hide:Access:ERP_REEMBOLSO &= NEW(Hide:Access:ERP_REEMBOLSO)
  _Hide:Relate:ERP_REEMBOLSO &= NEW(Hide:Relate:ERP_REEMBOLSO)
  _Hide:Access:CERTIFICADOS &= NEW(Hide:Access:CERTIFICADOS)
  _Hide:Relate:CERTIFICADOS &= NEW(Hide:Relate:CERTIFICADOS)
  _Hide:Access:CONCEPTO_MEDICO &= NEW(Hide:Access:CONCEPTO_MEDICO)
  _Hide:Relate:CONCEPTO_MEDICO &= NEW(Hide:Relate:CONCEPTO_MEDICO)
  _Hide:Access:DETALLE_AUSENCIA &= NEW(Hide:Access:DETALLE_AUSENCIA)
  _Hide:Relate:DETALLE_AUSENCIA &= NEW(Hide:Relate:DETALLE_AUSENCIA)
  _Hide:Access:ENFERMEDADES &= NEW(Hide:Access:ENFERMEDADES)
  _Hide:Relate:ENFERMEDADES &= NEW(Hide:Relate:ENFERMEDADES)
  _Hide:Access:MOTIVO_AUSENCIA &= NEW(Hide:Access:MOTIVO_AUSENCIA)
  _Hide:Relate:MOTIVO_AUSENCIA &= NEW(Hide:Relate:MOTIVO_AUSENCIA)
  _Hide:Access:pertel &= NEW(Hide:Access:pertel)
  _Hide:Relate:pertel &= NEW(Hide:Relate:pertel)
  _Hide:Access:REGIMEN_LICENCIAS_ESPECIALES &= NEW(Hide:Access:REGIMEN_LICENCIAS_ESPECIALES)
  _Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES &= NEW(Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES)
  _Hide:Access:datadicn &= NEW(Hide:Access:datadicn)
  _Hide:Relate:datadicn &= NEW(Hide:Relate:datadicn)
  _Hide:Access:LIQUIDALEG &= NEW(Hide:Access:LIQUIDALEG)
  _Hide:Relate:LIQUIDALEG &= NEW(Hide:Relate:LIQUIDALEG)
  _Hide:Access:SQLBLOB &= NEW(Hide:Access:SQLBLOB)
  _Hide:Relate:SQLBLOB &= NEW(Hide:Relate:SQLBLOB)
  _Hide:Access:PER_WEBREC &= NEW(Hide:Access:PER_WEBREC)
  _Hide:Relate:PER_WEBREC &= NEW(Hide:Relate:PER_WEBREC)
  _Hide:Access:perdoc &= NEW(Hide:Access:perdoc)
  _Hide:Relate:perdoc &= NEW(Hide:Relate:perdoc)
  _Hide:Access:ADETALLE_LICENCIA &= NEW(Hide:Access:ADETALLE_LICENCIA)
  _Hide:Relate:ADETALLE_LICENCIA &= NEW(Hide:Relate:ADETALLE_LICENCIA)
  _Hide:Access:SSEC::UserGroup &= NEW(Hide:Access:SSEC::UserGroup)
  _Hide:Relate:SSEC::UserGroup &= NEW(Hide:Relate:SSEC::UserGroup)
  _Hide:Access:AHORAS_EXTRA &= NEW(Hide:Access:AHORAS_EXTRA)
  _Hide:Relate:AHORAS_EXTRA &= NEW(Hide:Relate:AHORAS_EXTRA)
  Relate:HORAS_EXTRA &= _Hide:Relate:HORAS_EXTRA
  Relate:HORAS_EXTRA_DENARIUS &= _Hide:Relate:HORAS_EXTRA_DENARIUS
  Relate:DETALLE_HORAS_EXTRAS &= _Hide:Relate:DETALLE_HORAS_EXTRAS
  Relate:ERP_HORASEXTRA &= _Hide:Relate:ERP_HORASEXTRA
  Relate:ERP_REEMBOLSO &= _Hide:Relate:ERP_REEMBOLSO
  Relate:CERTIFICADOS &= _Hide:Relate:CERTIFICADOS
  Relate:CONCEPTO_MEDICO &= _Hide:Relate:CONCEPTO_MEDICO
  Relate:DETALLE_AUSENCIA &= _Hide:Relate:DETALLE_AUSENCIA
  Relate:ENFERMEDADES &= _Hide:Relate:ENFERMEDADES
  Relate:MOTIVO_AUSENCIA &= _Hide:Relate:MOTIVO_AUSENCIA
  Relate:pertel &= _Hide:Relate:pertel
  Relate:REGIMEN_LICENCIAS_ESPECIALES &= _Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES
  Relate:datadicn &= _Hide:Relate:datadicn
  Relate:LIQUIDALEG &= _Hide:Relate:LIQUIDALEG
  Relate:SQLBLOB &= _Hide:Relate:SQLBLOB
  Relate:PER_WEBREC &= _Hide:Relate:PER_WEBREC
  Relate:perdoc &= _Hide:Relate:perdoc
  Relate:ADETALLE_LICENCIA &= _Hide:Relate:ADETALLE_LICENCIA
  Relate:SSEC::UserGroup &= _Hide:Relate:SSEC::UserGroup
  Relate:AHORAS_EXTRA &= _Hide:Relate:AHORAS_EXTRA


infoper_BC2:FilesInit PROCEDURE
  CODE
  _Hide:Relate:HORAS_EXTRA.Init
  _Hide:Relate:HORAS_EXTRA_DENARIUS.Init
  _Hide:Relate:DETALLE_HORAS_EXTRAS.Init
  _Hide:Relate:ERP_HORASEXTRA.Init
  _Hide:Relate:ERP_REEMBOLSO.Init
  _Hide:Relate:CERTIFICADOS.Init
  _Hide:Relate:CONCEPTO_MEDICO.Init
  _Hide:Relate:DETALLE_AUSENCIA.Init
  _Hide:Relate:ENFERMEDADES.Init
  _Hide:Relate:MOTIVO_AUSENCIA.Init
  _Hide:Relate:pertel.Init
  _Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES.Init
  _Hide:Relate:datadicn.Init
  _Hide:Relate:LIQUIDALEG.Init
  _Hide:Relate:SQLBLOB.Init
  _Hide:Relate:PER_WEBREC.Init
  _Hide:Relate:perdoc.Init
  _Hide:Relate:ADETALLE_LICENCIA.Init
  _Hide:Relate:SSEC::UserGroup.Init
  _Hide:Relate:AHORAS_EXTRA.Init


infoper_BC2:DctKill PROCEDURE
  CODE
  _Hide:Relate:HORAS_EXTRA.Kill
  DISPOSE(_Hide:Relate:HORAS_EXTRA)
  _Hide:Relate:HORAS_EXTRA_DENARIUS.Kill
  DISPOSE(_Hide:Relate:HORAS_EXTRA_DENARIUS)
  _Hide:Relate:DETALLE_HORAS_EXTRAS.Kill
  DISPOSE(_Hide:Relate:DETALLE_HORAS_EXTRAS)
  _Hide:Relate:ERP_HORASEXTRA.Kill
  DISPOSE(_Hide:Relate:ERP_HORASEXTRA)
  _Hide:Relate:ERP_REEMBOLSO.Kill
  DISPOSE(_Hide:Relate:ERP_REEMBOLSO)
  _Hide:Relate:CERTIFICADOS.Kill
  DISPOSE(_Hide:Relate:CERTIFICADOS)
  _Hide:Relate:CONCEPTO_MEDICO.Kill
  DISPOSE(_Hide:Relate:CONCEPTO_MEDICO)
  _Hide:Relate:DETALLE_AUSENCIA.Kill
  DISPOSE(_Hide:Relate:DETALLE_AUSENCIA)
  _Hide:Relate:ENFERMEDADES.Kill
  DISPOSE(_Hide:Relate:ENFERMEDADES)
  _Hide:Relate:MOTIVO_AUSENCIA.Kill
  DISPOSE(_Hide:Relate:MOTIVO_AUSENCIA)
  _Hide:Relate:pertel.Kill
  DISPOSE(_Hide:Relate:pertel)
  _Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES.Kill
  DISPOSE(_Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES)
  _Hide:Relate:datadicn.Kill
  DISPOSE(_Hide:Relate:datadicn)
  _Hide:Relate:LIQUIDALEG.Kill
  DISPOSE(_Hide:Relate:LIQUIDALEG)
  _Hide:Relate:SQLBLOB.Kill
  DISPOSE(_Hide:Relate:SQLBLOB)
  _Hide:Relate:PER_WEBREC.Kill
  DISPOSE(_Hide:Relate:PER_WEBREC)
  _Hide:Relate:perdoc.Kill
  DISPOSE(_Hide:Relate:perdoc)
  _Hide:Relate:ADETALLE_LICENCIA.Kill
  DISPOSE(_Hide:Relate:ADETALLE_LICENCIA)
  _Hide:Relate:SSEC::UserGroup.Kill
  DISPOSE(_Hide:Relate:SSEC::UserGroup)
  _Hide:Relate:AHORAS_EXTRA.Kill
  DISPOSE(_Hide:Relate:AHORAS_EXTRA)


Hide:Relate:HORAS_EXTRA.Init PROCEDURE
  CODE
  _Hide:Access:HORAS_EXTRA.Init
  SELF.Init(Access:HORAS_EXTRA,1)


Hide:Access:HORAS_EXTRA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HEX:Record
  SELF.FileNameValue = 'HORAS_EXTRA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HORAS_EXTRA
  PARENT.Init
  Access:HORAS_EXTRA &= SELF


Hide:Access:HORAS_EXTRA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HORAS_EXTRA &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HORAS_EXTRA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HORAS_EXTRA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(HEX:PK_HORAS_EXTRA,'HEX:PK_HORAS_EXTRA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HORAS_EXTRA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DETALLE_HORAS_EXTRA,RI:None,RI:None,HEXD:FK_HORASEXTRAS)
  SELF.AddRelationLink(HEX:HEX_ID,HEXD:HEXD_ID)


Hide:Relate:HORAS_EXTRA.Kill PROCEDURE

  CODE
  _Hide:Access:HORAS_EXTRA.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:HORAS_EXTRA &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HORAS_EXTRA)                        ! destroy the file manager


Hide:Relate:HORAS_EXTRA_DENARIUS.Init PROCEDURE
  CODE
  _Hide:Access:HORAS_EXTRA_DENARIUS.Init
  SELF.Init(Access:HORAS_EXTRA_DENARIUS,1)


Hide:Access:HORAS_EXTRA_DENARIUS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HEXCD:Record
  SELF.FileNameValue = 'HORAS_EXTRA_DENARIUS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HORAS_EXTRA_DENARIUS
  PARENT.Init
  Access:HORAS_EXTRA_DENARIUS &= SELF


Hide:Access:HORAS_EXTRA_DENARIUS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HORAS_EXTRA_DENARIUS &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HORAS_EXTRA_DENARIUS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HORAS_EXTRA_DENARIUS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(HEXCD:PK_HORAS_EXTRA_DENARIUS,'HEXCD:PK_HORAS_EXTRA_DENARIUS',0)
    SELF.AddKey(HEXCD:FK_INTRANET,'HEXCD:FK_INTRANET',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HORAS_EXTRA_DENARIUS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DETALLE_HORAS_EXTRA,RI:None,RI:None,HEXD:FK_HSEXTRADENARIUS)
  SELF.AddRelationLink(HEXCD:HEXCD_ID,HEXD:HEXD_DENARIUS)


Hide:Relate:HORAS_EXTRA_DENARIUS.Kill PROCEDURE

  CODE
  _Hide:Access:HORAS_EXTRA_DENARIUS.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:HORAS_EXTRA_DENARIUS &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HORAS_EXTRA_DENARIUS)               ! destroy the file manager


Hide:Relate:DETALLE_HORAS_EXTRAS.Init PROCEDURE
  CODE
  _Hide:Access:DETALLE_HORAS_EXTRAS.Init
  SELF.Init(Access:DETALLE_HORAS_EXTRAS,1)


Hide:Access:DETALLE_HORAS_EXTRAS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DET:Record
  SELF.FileNameValue = 'DETALLE_HORAS_EXTRAS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_HORAS_EXTRAS
  PARENT.Init
  Access:DETALLE_HORAS_EXTRAS &= SELF


Hide:Access:DETALLE_HORAS_EXTRAS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_HORAS_EXTRAS &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DETALLE_HORAS_EXTRAS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DETALLE_HORAS_EXTRAS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DET:PK_DETALLE_HORAS_EXTRAS,'DET:PK_DETALLE_HORAS_EXTRAS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DETALLE_HORAS_EXTRAS.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_HORAS_EXTRAS.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_HORAS_EXTRAS &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_HORAS_EXTRAS)               ! destroy the file manager


Hide:Relate:ERP_HORASEXTRA.Init PROCEDURE
  CODE
  _Hide:Access:ERP_HORASEXTRA.Init
  SELF.Init(Access:ERP_HORASEXTRA,1)


Hide:Access:ERP_HORASEXTRA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ERPHEX:Record
  SELF.FileNameValue = 'ERP_HORASEXTRA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ERP_HORASEXTRA
  SELF.FileName &= GLO:HORASEXTRA_ERP
  PARENT.Init
  Access:ERP_HORASEXTRA &= SELF


Hide:Access:ERP_HORASEXTRA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ERP_HORASEXTRA &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ERP_HORASEXTRA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ERP_HORASEXTRA,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ERP_HORASEXTRA.Kill PROCEDURE

  CODE
  _Hide:Access:ERP_HORASEXTRA.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:ERP_HORASEXTRA &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ERP_HORASEXTRA)                     ! destroy the file manager


Hide:Relate:ERP_REEMBOLSO.Init PROCEDURE
  CODE
  _Hide:Access:ERP_REEMBOLSO.Init
  SELF.Init(Access:ERP_REEMBOLSO,1)


Hide:Access:ERP_REEMBOLSO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ERPREM:Record
  SELF.FileNameValue = 'ERP_REEMBOLSO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ERP_REEMBOLSO
  SELF.FileName &= GLO:REEMBOLSO_ERP
  PARENT.Init
  Access:ERP_REEMBOLSO &= SELF


Hide:Access:ERP_REEMBOLSO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ERP_REEMBOLSO &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ERP_REEMBOLSO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ERP_REEMBOLSO,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ERP_REEMBOLSO.Kill PROCEDURE

  CODE
  _Hide:Access:ERP_REEMBOLSO.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:ERP_REEMBOLSO &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ERP_REEMBOLSO)                      ! destroy the file manager


Hide:Relate:CERTIFICADOS.Init PROCEDURE
  CODE
  _Hide:Access:CERTIFICADOS.Init
  SELF.Init(Access:CERTIFICADOS,1)


Hide:Access:CERTIFICADOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CER:Record
  SELF.FileNameValue = 'CERTIFICADOS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CERTIFICADOS
  PARENT.Init
  Access:CERTIFICADOS &= SELF


Hide:Access:CERTIFICADOS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CERTIFICADOS &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CERTIFICADOS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CERTIFICADOS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CER:PK_CER_ID,'CER:PK_CER_ID',0)
    SELF.AddKey(CER:FK_CER_DAU_ID,'CER:FK_CER_DAU_ID',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CERTIFICADOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:DETALLE_AUSENCIA2 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CER:CER_DAU_ID')
    Save:DETALLE_AUSENCIA2 = Access:DETALLE_AUSENCIA.SaveFile()
    DAU:DAU_ID = CER:CER_DAU_ID
    ReturnValue = Access:DETALLE_AUSENCIA.TryFetch(DAU:PK_DAU_ID)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'DETALLE_AUSENCIA')
      END
    END
    Access:DETALLE_AUSENCIA.RestoreFile(Save:DETALLE_AUSENCIA2)
  END
  RETURN ReturnValue


Hide:Relate:CERTIFICADOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DETALLE_AUSENCIA)


Hide:Relate:CERTIFICADOS.Kill PROCEDURE

  CODE
  _Hide:Access:CERTIFICADOS.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:CERTIFICADOS &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CERTIFICADOS)                       ! destroy the file manager


Hide:Relate:CONCEPTO_MEDICO.Init PROCEDURE
  CODE
  _Hide:Access:CONCEPTO_MEDICO.Init
  SELF.Init(Access:CONCEPTO_MEDICO,1)


Hide:Access:CONCEPTO_MEDICO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CME:Record
  SELF.FileNameValue = 'CONCEPTO_MEDICO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CONCEPTO_MEDICO
  PARENT.Init
  Access:CONCEPTO_MEDICO &= SELF


Hide:Access:CONCEPTO_MEDICO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CONCEPTO_MEDICO &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CONCEPTO_MEDICO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CONCEPTO_MEDICO,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CME:PK_CME_ID,'CME:PK_CME_ID',0)
    SELF.AddKey(CME:FK_CME_DAU_ID,'CME:FK_CME_DAU_ID',0)
    SELF.AddKey(CME:FK_CME_CODIGO,'CME:FK_CME_CODIGO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:CONCEPTO_MEDICO.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:DETALLE_AUSENCIA2 USHORT,AUTO
Save:ENFERMEDADES4 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('CME:CME_DAU_ID')
    Save:DETALLE_AUSENCIA2 = Access:DETALLE_AUSENCIA.SaveFile()
    DAU:DAU_ID = CME:CME_DAU_ID
    ReturnValue = Access:DETALLE_AUSENCIA.TryFetch(DAU:PK_DAU_ID)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'DETALLE_AUSENCIA')
      END
    END
    Access:DETALLE_AUSENCIA.RestoreFile(Save:DETALLE_AUSENCIA2)
  OF 4
    GlobalErrors.SetField('CME:CME_CODIGO')
    Save:ENFERMEDADES4 = Access:ENFERMEDADES.SaveFile()
    ENF:ENF_CODIGO = CME:CME_CODIGO
    ReturnValue = Access:ENFERMEDADES.TryFetch(ENF:PK_ENF_CODIGO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'ENFERMEDADES')
      END
    END
    Access:ENFERMEDADES.RestoreFile(Save:ENFERMEDADES4)
  END
  RETURN ReturnValue


Hide:Relate:CONCEPTO_MEDICO.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DETALLE_AUSENCIA)

  SELF.AddRelation(Relate:ENFERMEDADES)


Hide:Relate:CONCEPTO_MEDICO.Kill PROCEDURE

  CODE
  _Hide:Access:CONCEPTO_MEDICO.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:CONCEPTO_MEDICO &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CONCEPTO_MEDICO)                    ! destroy the file manager


Hide:Relate:DETALLE_AUSENCIA.Init PROCEDURE
  CODE
  _Hide:Access:DETALLE_AUSENCIA.Init
  SELF.Init(Access:DETALLE_AUSENCIA,1)


Hide:Access:DETALLE_AUSENCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DAU:Record
  SELF.FileNameValue = 'DETALLE_AUSENCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_AUSENCIA
  PARENT.Init
  Access:DETALLE_AUSENCIA &= SELF


Hide:Access:DETALLE_AUSENCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_AUSENCIA &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DETALLE_AUSENCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DETALLE_AUSENCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DAU:CLA_DAU,'DAU:CLA_DAU',0)
    SELF.AddKey(DAU:PK_DAU_ID,'DAU:PK_DAU_ID',0)
    SELF.AddKey(DAU:FK_DAU_NROLEG,'DAU:FK_DAU_NROLEG',0)
    SELF.AddKey(DAU:FK_DAU_MOTIVO,'DAU:FK_DAU_MOTIVO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:DETALLE_AUSENCIA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:MOTIVO_AUSENCIA15 USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 15
    GlobalErrors.SetField('DAU:DAU_MOTIVO')
    Save:MOTIVO_AUSENCIA15 = Access:MOTIVO_AUSENCIA.SaveFile()
    MAU:MAU_CODIGO = DAU:DAU_MOTIVO
    ReturnValue = Access:MOTIVO_AUSENCIA.TryFetch(MAU:PK_MAU_CODIGO)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'MOTIVO_AUSENCIA')
      END
    END
    Access:MOTIVO_AUSENCIA.RestoreFile(Save:MOTIVO_AUSENCIA15)
  END
  RETURN ReturnValue


Hide:Relate:DETALLE_AUSENCIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CERTIFICADOS,RI:None,RI:None,CER:FK_CER_DAU_ID)
  SELF.AddRelationLink(DAU:DAU_ID,CER:CER_DAU_ID)

  SELF.AddRelation(Relate:CONCEPTO_MEDICO,RI:None,RI:None,CME:FK_CME_DAU_ID)
  SELF.AddRelationLink(DAU:DAU_ID,CME:CME_DAU_ID)

  SELF.AddRelation(Relate:MOTIVO_AUSENCIA)


Hide:Relate:DETALLE_AUSENCIA.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_AUSENCIA.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_AUSENCIA &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_AUSENCIA)                   ! destroy the file manager


Hide:Relate:ENFERMEDADES.Init PROCEDURE
  CODE
  _Hide:Access:ENFERMEDADES.Init
  SELF.Init(Access:ENFERMEDADES,1)


Hide:Access:ENFERMEDADES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ENF:Record
  SELF.FileNameValue = 'ENFERMEDADES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ENFERMEDADES
  PARENT.Init
  Access:ENFERMEDADES &= SELF


Hide:Access:ENFERMEDADES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ENFERMEDADES &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ENFERMEDADES.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ENFERMEDADES,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ENF:PK_ENF_CODIGO,'ENF:PK_ENF_CODIGO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ENFERMEDADES.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CONCEPTO_MEDICO,RI:None,RI:None,CME:FK_CME_CODIGO)
  SELF.AddRelationLink(ENF:ENF_CODIGO,CME:CME_CODIGO)


Hide:Relate:ENFERMEDADES.Kill PROCEDURE

  CODE
  _Hide:Access:ENFERMEDADES.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:ENFERMEDADES &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ENFERMEDADES)                       ! destroy the file manager


Hide:Relate:MOTIVO_AUSENCIA.Init PROCEDURE
  CODE
  _Hide:Access:MOTIVO_AUSENCIA.Init
  SELF.Init(Access:MOTIVO_AUSENCIA,1)


Hide:Access:MOTIVO_AUSENCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MAU:Record
  SELF.FileNameValue = 'MOTIVO_AUSENCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MOTIVO_AUSENCIA
  PARENT.Init
  Access:MOTIVO_AUSENCIA &= SELF


Hide:Access:MOTIVO_AUSENCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MOTIVO_AUSENCIA &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MOTIVO_AUSENCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MOTIVO_AUSENCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(MAU:PK_MAU_DESCRIPCION,'MAU:PK_MAU_DESCRIPCION',0)
    SELF.AddKey(MAU:PK_MAU_CODIGO,'MAU:PK_MAU_CODIGO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MOTIVO_AUSENCIA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DETALLE_AUSENCIA,RI:None,RI:None,DAU:FK_DAU_MOTIVO)
  SELF.AddRelationLink(MAU:MAU_CODIGO,DAU:DAU_MOTIVO)

  SELF.AddRelation(Relate:REGIMEN_LICENCIAS_ESPECIALES,RI:None,RI:None,RLE:FK_RLE_MOTIVO)
  SELF.AddRelationLink(MAU:MAU_CODIGO,RLE:RLE_MOTIVO)


Hide:Relate:MOTIVO_AUSENCIA.Kill PROCEDURE

  CODE
  _Hide:Access:MOTIVO_AUSENCIA.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:MOTIVO_AUSENCIA &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MOTIVO_AUSENCIA)                    ! destroy the file manager


Hide:Relate:pertel.Init PROCEDURE
  CODE
  _Hide:Access:pertel.Init
  SELF.Init(Access:pertel,1)


Hide:Access:pertel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= pertel:Record
  SELF.FileNameValue = 'pertel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= pertel
  PARENT.Init
  Access:pertel &= SELF


Hide:Access:pertel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:pertel &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:pertel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(pertel,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadOnly
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(pertel:pertel_emp,'pertel:pertel_emp',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:pertel.Kill PROCEDURE

  CODE
  _Hide:Access:pertel.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:pertel &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:pertel)                             ! destroy the file manager


Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES.Init PROCEDURE
  CODE
  _Hide:Access:REGIMEN_LICENCIAS_ESPECIALES.Init
  SELF.Init(Access:REGIMEN_LICENCIAS_ESPECIALES,1)


Hide:Access:REGIMEN_LICENCIAS_ESPECIALES.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RLE:Record
  SELF.FileNameValue = 'REGIMEN_LICENCIAS_ESPECIALES'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= REGIMEN_LICENCIAS_ESPECIALES
  PARENT.Init
  Access:REGIMEN_LICENCIAS_ESPECIALES &= SELF


Hide:Access:REGIMEN_LICENCIAS_ESPECIALES.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:REGIMEN_LICENCIAS_ESPECIALES &= NULL              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:REGIMEN_LICENCIAS_ESPECIALES.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(REGIMEN_LICENCIAS_ESPECIALES,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RLE:PK_RLE_ID,'RLE:PK_RLE_ID',0)
    SELF.AddKey(RLE:FK_RLE_CONVENIO,'RLE:FK_RLE_CONVENIO',0)
    SELF.AddKey(RLE:FK_RLE_MOTIVO,'RLE:FK_RLE_MOTIVO',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:MOTIVO_AUSENCIA)

  SELF.AddRelation(Relate:CONVENIO)


Hide:Relate:REGIMEN_LICENCIAS_ESPECIALES.Kill PROCEDURE

  CODE
  _Hide:Access:REGIMEN_LICENCIAS_ESPECIALES.Kill           ! Kill the file manager
  PARENT.Kill
  Relate:REGIMEN_LICENCIAS_ESPECIALES &= NULL              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:REGIMEN_LICENCIAS_ESPECIALES)       ! destroy the file manager


Hide:Relate:datadicn.Init PROCEDURE
  CODE
  _Hide:Access:datadicn.Init
  SELF.Init(Access:datadicn,1)


Hide:Access:datadicn.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= datadicn:Record
  SELF.FileNameValue = 'datadicn'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= datadicn
  PARENT.Init
  Access:datadicn &= SELF


Hide:Access:datadicn.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:datadicn &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:datadicn.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(datadicn,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(datadicn:datadicn_clave,'datadicn:datadicn_clave',0)
    SELF.AddKey(datadicn:datadicn_clavepk,'datadicn:datadicn_clavepk',0)
    SELF.AddKey(datadicn:datadicn_nombre,'datadicn:datadicn_nombre',0)
    SELF.AddKey(datadicn:datadicn_valor,'datadicn:datadicn_valor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:datadicn.Kill PROCEDURE

  CODE
  _Hide:Access:datadicn.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:datadicn &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:datadicn)                           ! destroy the file manager


Hide:Relate:LIQUIDALEG.Init PROCEDURE
  CODE
  _Hide:Access:LIQUIDALEG.Init
  SELF.Init(Access:LIQUIDALEG,1)


Hide:Access:LIQUIDALEG.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LIQ:Record
  SELF.FileNameValue = 'LIQUIDALEG'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LIQUIDALEG
  PARENT.Init
  Access:LIQUIDALEG &= SELF


Hide:Access:LIQUIDALEG.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LIQUIDALEG &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LIQUIDALEG.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LIQUIDALEG,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(LIQ:PK_LIQUIDALEG,'LIQ:PK_LIQUIDALEG',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LIQUIDALEG.Kill PROCEDURE

  CODE
  _Hide:Access:LIQUIDALEG.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:LIQUIDALEG &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LIQUIDALEG)                         ! destroy the file manager


Hide:Relate:SQLBLOB.Init PROCEDURE
  CODE
  _Hide:Access:SQLBLOB.Init
  SELF.Init(Access:SQLBLOB,1)


Hide:Access:SQLBLOB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SQB:Record
  SELF.FileNameValue = 'SQLBLOB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SQLBLOB
  PARENT.Init
  Access:SQLBLOB &= SELF


Hide:Access:SQLBLOB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SQLBLOB &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SQLBLOB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SQLBLOB,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SQLBLOB.Kill PROCEDURE

  CODE
  _Hide:Access:SQLBLOB.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:SQLBLOB &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SQLBLOB)                            ! destroy the file manager


Hide:Relate:PER_WEBREC.Init PROCEDURE
  CODE
  _Hide:Access:PER_WEBREC.Init
  SELF.Init(Access:PER_WEBREC,1)


Hide:Access:PER_WEBREC.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PWR:Record
  SELF.FileNameValue = 'PER_WEBREC'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PER_WEBREC
  PARENT.Init
  Access:PER_WEBREC &= SELF


Hide:Access:PER_WEBREC.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PER_WEBREC &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PER_WEBREC.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PER_WEBREC,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PWR:PK_PER_WEBREC,'PWR:PK_PER_WEBREC',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PER_WEBREC.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:EMPLEADOS)


Hide:Relate:PER_WEBREC.Kill PROCEDURE

  CODE
  _Hide:Access:PER_WEBREC.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:PER_WEBREC &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PER_WEBREC)                         ! destroy the file manager


Hide:Relate:perdoc.Init PROCEDURE
  CODE
  _Hide:Access:perdoc.Init
  SELF.Init(Access:perdoc,1)


Hide:Access:perdoc.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= perdoc:Record
  SELF.FileNameValue = 'perdoc'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= perdoc
  PARENT.Init
  Access:perdoc &= SELF


Hide:Access:perdoc.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:perdoc &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:perdoc.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(perdoc,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(perdoc:perdoc_coddoc,'perdoc:perdoc_coddoc',0)
    SELF.AddKey(perdoc:perdoc_emp,'perdoc:perdoc_emp',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:perdoc.Kill PROCEDURE

  CODE
  _Hide:Access:perdoc.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:perdoc &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:perdoc)                             ! destroy the file manager


Hide:Relate:ADETALLE_LICENCIA.Init PROCEDURE
  CODE
  _Hide:Access:ADETALLE_LICENCIA.Init
  SELF.Init(Access:ADETALLE_LICENCIA,1)
  SELF.SetAlias(Relate:DETALLE_LICENCIA)


Hide:Access:ADETALLE_LICENCIA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ADLIC:Record
  SELF.AliasedFile &= Access:DETALLE_LICENCIA              !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'ADETALLE_LICENCIA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ADETALLE_LICENCIA
  PARENT.Init
  Access:ADETALLE_LICENCIA &= SELF


Hide:Access:ADETALLE_LICENCIA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ADETALLE_LICENCIA &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ADETALLE_LICENCIA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ADETALLE_LICENCIA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(ADLIC:PK_DETALLE_LICENCIA,'ADLIC:PK_DETALLE_LICENCIA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ADETALLE_LICENCIA.Kill PROCEDURE

  CODE
  _Hide:Access:ADETALLE_LICENCIA.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:ADETALLE_LICENCIA &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ADETALLE_LICENCIA)                  ! destroy the file manager


Hide:Relate:SSEC::UserGroup.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::UserGroup.Init
  SELF.Init(Access:SSEC::UserGroup,1)
  SELF.SetAlias(Relate:SSEC::User)


Hide:Access:SSEC::UserGroup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUGrp_:Record
  SELF.AliasedFile &= Access:SSEC::User                    !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'SSEC::UserGroup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::UserGroup
  PARENT.Init
  Access:SSEC::UserGroup &= SELF


Hide:Access:SSEC::UserGroup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::UserGroup &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::UserGroup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::UserGroup,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SUGrp_:NoKey,'SUGrp_:NoKey',1)
    SELF.AddKey(SUGrp_:NameKey,'SUGrp_:NameKey',0)
    SELF.AddKey(SUGrp_:GroupNameKey,'SUGrp_:GroupNameKey',0)
    SELF.AddKey(SUGrp_:LevelNdx,'SUGrp_:LevelNdx',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::UserGroup.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::UserGroup.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::UserGroup &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::UserGroup)                    ! destroy the file manager


Hide:Relate:AHORAS_EXTRA.Init PROCEDURE
  CODE
  _Hide:Access:AHORAS_EXTRA.Init
  SELF.Init(Access:AHORAS_EXTRA,1)
  SELF.SetAlias(Relate:HORAS_EXTRA)


Hide:Access:AHORAS_EXTRA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AHEX:Record
  SELF.AliasedFile &= Access:HORAS_EXTRA                   !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'AHORAS_EXTRA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AHORAS_EXTRA
  PARENT.Init
  Access:AHORAS_EXTRA &= SELF


Hide:Access:AHORAS_EXTRA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AHORAS_EXTRA &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AHORAS_EXTRA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AHORAS_EXTRA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AHEX:PK_HORAS_EXTRA,'AHEX:PK_HORAS_EXTRA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AHORAS_EXTRA.Kill PROCEDURE

  CODE
  _Hide:Access:AHORAS_EXTRA.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:AHORAS_EXTRA &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AHORAS_EXTRA)                       ! destroy the file manager

