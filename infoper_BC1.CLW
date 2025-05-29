  MEMBER('infoper.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
infoper_BC1:DctInit    PROCEDURE
infoper_BC1:DctKill    PROCEDURE
infoper_BC1:FilesInit  PROCEDURE
  END

Hide:Access:empc     CLASS(FileManager),TYPE               ! FileManager for empc
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:empc     CLASS(RelationManager),TYPE           ! RelationManager for empc
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CTA_CONTABLE CLASS(FileManager),TYPE           ! FileManager for CTA_CONTABLE
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CTA_CONTABLE CLASS(RelationManager),TYPE       ! RelationManager for CTA_CONTABLE
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PROVISION CLASS(FileManager),TYPE              ! FileManager for PROVISION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PROVISION CLASS(RelationManager),TYPE          ! RelationManager for PROVISION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DETALLE_PROVISION CLASS(FileManager),TYPE      ! FileManager for DETALLE_PROVISION
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DETALLE_PROVISION CLASS(RelationManager),TYPE  ! RelationManager for DETALLE_PROVISION
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TXTAsiento CLASS(FileManager),TYPE             ! FileManager for TXTAsiento
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TXTAsiento CLASS(RelationManager),TYPE         ! RelationManager for TXTAsiento
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::UserInGroup CLASS(FileManager),TYPE      ! FileManager for SSEC::UserInGroup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::UserInGroup CLASS(RelationManager),TYPE  ! RelationManager for SSEC::UserInGroup
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Door CLASS(FileManager),TYPE             ! FileManager for SSEC::Door
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Door CLASS(RelationManager),TYPE         ! RelationManager for SSEC::Door
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::DoorGroup CLASS(FileManager),TYPE        ! FileManager for SSEC::DoorGroup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::DoorGroup CLASS(RelationManager),TYPE    ! RelationManager for SSEC::DoorGroup
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Access CLASS(FileManager),TYPE           ! FileManager for SSEC::Access
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Access CLASS(RelationManager),TYPE       ! RelationManager for SSEC::Access
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Program CLASS(FileManager),TYPE          ! FileManager for SSEC::Program
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Program CLASS(RelationManager),TYPE      ! RelationManager for SSEC::Program
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Procedure CLASS(FileManager),TYPE        ! FileManager for SSEC::Procedure
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Procedure CLASS(RelationManager),TYPE    ! RelationManager for SSEC::Procedure
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::File CLASS(FileManager),TYPE             ! FileManager for SSEC::File
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::File CLASS(RelationManager),TYPE         ! RelationManager for SSEC::File
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Field CLASS(FileManager),TYPE            ! FileManager for SSEC::Field
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Field CLASS(RelationManager),TYPE        ! RelationManager for SSEC::Field
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::PwdLog CLASS(FileManager),TYPE           ! FileManager for SSEC::PwdLog
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::PwdLog CLASS(RelationManager),TYPE       ! RelationManager for SSEC::PwdLog
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Call CLASS(FileManager),TYPE             ! FileManager for SSEC::Call
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Call CLASS(RelationManager),TYPE         ! RelationManager for SSEC::Call
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Edit CLASS(FileManager),TYPE             ! FileManager for SSEC::Edit
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Edit CLASS(RelationManager),TYPE         ! RelationManager for SSEC::Edit
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::User CLASS(FileManager),TYPE             ! FileManager for SSEC::User
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::User CLASS(RelationManager),TYPE         ! RelationManager for SSEC::User
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ERP_ASIENTO CLASS(FileManager),TYPE            ! FileManager for ERP_ASIENTO
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ERP_ASIENTO CLASS(RelationManager),TYPE        ! RelationManager for ERP_ASIENTO
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:HORASEXTRASCVS CLASS(FileManager),TYPE         ! FileManager for HORASEXTRASCVS
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:HORASEXTRASCVS CLASS(RelationManager),TYPE     ! RelationManager for HORASEXTRASCVS
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DETALLE_HORAS_EXTRA CLASS(FileManager),TYPE    ! FileManager for DETALLE_HORAS_EXTRA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DETALLE_HORAS_EXTRA CLASS(RelationManager),TYPE ! RelationManager for DETALLE_HORAS_EXTRA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:empc    &Hide:Access:empc,AUTO,THREAD
_Hide:Relate:empc    &Hide:Relate:empc,AUTO,THREAD
_Hide:Access:CTA_CONTABLE &Hide:Access:CTA_CONTABLE,AUTO,THREAD
_Hide:Relate:CTA_CONTABLE &Hide:Relate:CTA_CONTABLE,AUTO,THREAD
_Hide:Access:PROVISION &Hide:Access:PROVISION,AUTO,THREAD
_Hide:Relate:PROVISION &Hide:Relate:PROVISION,AUTO,THREAD
_Hide:Access:DETALLE_PROVISION &Hide:Access:DETALLE_PROVISION,AUTO,THREAD
_Hide:Relate:DETALLE_PROVISION &Hide:Relate:DETALLE_PROVISION,AUTO,THREAD
_Hide:Access:TXTAsiento &Hide:Access:TXTAsiento,AUTO,THREAD
_Hide:Relate:TXTAsiento &Hide:Relate:TXTAsiento,AUTO,THREAD
_Hide:Access:SSEC::UserInGroup &Hide:Access:SSEC::UserInGroup,AUTO,THREAD
_Hide:Relate:SSEC::UserInGroup &Hide:Relate:SSEC::UserInGroup,AUTO,THREAD
_Hide:Access:SSEC::Door &Hide:Access:SSEC::Door,AUTO,THREAD
_Hide:Relate:SSEC::Door &Hide:Relate:SSEC::Door,AUTO,THREAD
_Hide:Access:SSEC::DoorGroup &Hide:Access:SSEC::DoorGroup,AUTO,THREAD
_Hide:Relate:SSEC::DoorGroup &Hide:Relate:SSEC::DoorGroup,AUTO,THREAD
_Hide:Access:SSEC::Access &Hide:Access:SSEC::Access,AUTO,THREAD
_Hide:Relate:SSEC::Access &Hide:Relate:SSEC::Access,AUTO,THREAD
_Hide:Access:SSEC::Program &Hide:Access:SSEC::Program,AUTO,THREAD
_Hide:Relate:SSEC::Program &Hide:Relate:SSEC::Program,AUTO,THREAD
_Hide:Access:SSEC::Procedure &Hide:Access:SSEC::Procedure,AUTO,THREAD
_Hide:Relate:SSEC::Procedure &Hide:Relate:SSEC::Procedure,AUTO,THREAD
_Hide:Access:SSEC::File &Hide:Access:SSEC::File,AUTO,THREAD
_Hide:Relate:SSEC::File &Hide:Relate:SSEC::File,AUTO,THREAD
_Hide:Access:SSEC::Field &Hide:Access:SSEC::Field,AUTO,THREAD
_Hide:Relate:SSEC::Field &Hide:Relate:SSEC::Field,AUTO,THREAD
_Hide:Access:SSEC::PwdLog &Hide:Access:SSEC::PwdLog,AUTO,THREAD
_Hide:Relate:SSEC::PwdLog &Hide:Relate:SSEC::PwdLog,AUTO,THREAD
_Hide:Access:SSEC::Call &Hide:Access:SSEC::Call,AUTO,THREAD
_Hide:Relate:SSEC::Call &Hide:Relate:SSEC::Call,AUTO,THREAD
_Hide:Access:SSEC::Edit &Hide:Access:SSEC::Edit,AUTO,THREAD
_Hide:Relate:SSEC::Edit &Hide:Relate:SSEC::Edit,AUTO,THREAD
_Hide:Access:SSEC::User &Hide:Access:SSEC::User,AUTO,THREAD
_Hide:Relate:SSEC::User &Hide:Relate:SSEC::User,AUTO,THREAD
_Hide:Access:ERP_ASIENTO &Hide:Access:ERP_ASIENTO,AUTO,THREAD
_Hide:Relate:ERP_ASIENTO &Hide:Relate:ERP_ASIENTO,AUTO,THREAD
_Hide:Access:HORASEXTRASCVS &Hide:Access:HORASEXTRASCVS,AUTO,THREAD
_Hide:Relate:HORASEXTRASCVS &Hide:Relate:HORASEXTRASCVS,AUTO,THREAD
_Hide:Access:DETALLE_HORAS_EXTRA &Hide:Access:DETALLE_HORAS_EXTRA,AUTO,THREAD
_Hide:Relate:DETALLE_HORAS_EXTRA &Hide:Relate:DETALLE_HORAS_EXTRA,AUTO,THREAD


infoper_BC1:DctInit PROCEDURE
  CODE
  _Hide:Access:empc &= NEW(Hide:Access:empc)
  _Hide:Relate:empc &= NEW(Hide:Relate:empc)
  _Hide:Access:CTA_CONTABLE &= NEW(Hide:Access:CTA_CONTABLE)
  _Hide:Relate:CTA_CONTABLE &= NEW(Hide:Relate:CTA_CONTABLE)
  _Hide:Access:PROVISION &= NEW(Hide:Access:PROVISION)
  _Hide:Relate:PROVISION &= NEW(Hide:Relate:PROVISION)
  _Hide:Access:DETALLE_PROVISION &= NEW(Hide:Access:DETALLE_PROVISION)
  _Hide:Relate:DETALLE_PROVISION &= NEW(Hide:Relate:DETALLE_PROVISION)
  _Hide:Access:TXTAsiento &= NEW(Hide:Access:TXTAsiento)
  _Hide:Relate:TXTAsiento &= NEW(Hide:Relate:TXTAsiento)
  _Hide:Access:SSEC::UserInGroup &= NEW(Hide:Access:SSEC::UserInGroup)
  _Hide:Relate:SSEC::UserInGroup &= NEW(Hide:Relate:SSEC::UserInGroup)
  _Hide:Access:SSEC::Door &= NEW(Hide:Access:SSEC::Door)
  _Hide:Relate:SSEC::Door &= NEW(Hide:Relate:SSEC::Door)
  _Hide:Access:SSEC::DoorGroup &= NEW(Hide:Access:SSEC::DoorGroup)
  _Hide:Relate:SSEC::DoorGroup &= NEW(Hide:Relate:SSEC::DoorGroup)
  _Hide:Access:SSEC::Access &= NEW(Hide:Access:SSEC::Access)
  _Hide:Relate:SSEC::Access &= NEW(Hide:Relate:SSEC::Access)
  _Hide:Access:SSEC::Program &= NEW(Hide:Access:SSEC::Program)
  _Hide:Relate:SSEC::Program &= NEW(Hide:Relate:SSEC::Program)
  _Hide:Access:SSEC::Procedure &= NEW(Hide:Access:SSEC::Procedure)
  _Hide:Relate:SSEC::Procedure &= NEW(Hide:Relate:SSEC::Procedure)
  _Hide:Access:SSEC::File &= NEW(Hide:Access:SSEC::File)
  _Hide:Relate:SSEC::File &= NEW(Hide:Relate:SSEC::File)
  _Hide:Access:SSEC::Field &= NEW(Hide:Access:SSEC::Field)
  _Hide:Relate:SSEC::Field &= NEW(Hide:Relate:SSEC::Field)
  _Hide:Access:SSEC::PwdLog &= NEW(Hide:Access:SSEC::PwdLog)
  _Hide:Relate:SSEC::PwdLog &= NEW(Hide:Relate:SSEC::PwdLog)
  _Hide:Access:SSEC::Call &= NEW(Hide:Access:SSEC::Call)
  _Hide:Relate:SSEC::Call &= NEW(Hide:Relate:SSEC::Call)
  _Hide:Access:SSEC::Edit &= NEW(Hide:Access:SSEC::Edit)
  _Hide:Relate:SSEC::Edit &= NEW(Hide:Relate:SSEC::Edit)
  _Hide:Access:SSEC::User &= NEW(Hide:Access:SSEC::User)
  _Hide:Relate:SSEC::User &= NEW(Hide:Relate:SSEC::User)
  _Hide:Access:ERP_ASIENTO &= NEW(Hide:Access:ERP_ASIENTO)
  _Hide:Relate:ERP_ASIENTO &= NEW(Hide:Relate:ERP_ASIENTO)
  _Hide:Access:HORASEXTRASCVS &= NEW(Hide:Access:HORASEXTRASCVS)
  _Hide:Relate:HORASEXTRASCVS &= NEW(Hide:Relate:HORASEXTRASCVS)
  _Hide:Access:DETALLE_HORAS_EXTRA &= NEW(Hide:Access:DETALLE_HORAS_EXTRA)
  _Hide:Relate:DETALLE_HORAS_EXTRA &= NEW(Hide:Relate:DETALLE_HORAS_EXTRA)
  Relate:empc &= _Hide:Relate:empc
  Relate:CTA_CONTABLE &= _Hide:Relate:CTA_CONTABLE
  Relate:PROVISION &= _Hide:Relate:PROVISION
  Relate:DETALLE_PROVISION &= _Hide:Relate:DETALLE_PROVISION
  Relate:TXTAsiento &= _Hide:Relate:TXTAsiento
  Relate:SSEC::UserInGroup &= _Hide:Relate:SSEC::UserInGroup
  Relate:SSEC::Door &= _Hide:Relate:SSEC::Door
  Relate:SSEC::DoorGroup &= _Hide:Relate:SSEC::DoorGroup
  Relate:SSEC::Access &= _Hide:Relate:SSEC::Access
  Relate:SSEC::Program &= _Hide:Relate:SSEC::Program
  Relate:SSEC::Procedure &= _Hide:Relate:SSEC::Procedure
  Relate:SSEC::File &= _Hide:Relate:SSEC::File
  Relate:SSEC::Field &= _Hide:Relate:SSEC::Field
  Relate:SSEC::PwdLog &= _Hide:Relate:SSEC::PwdLog
  Relate:SSEC::Call &= _Hide:Relate:SSEC::Call
  Relate:SSEC::Edit &= _Hide:Relate:SSEC::Edit
  Relate:SSEC::User &= _Hide:Relate:SSEC::User
  Relate:ERP_ASIENTO &= _Hide:Relate:ERP_ASIENTO
  Relate:HORASEXTRASCVS &= _Hide:Relate:HORASEXTRASCVS
  Relate:DETALLE_HORAS_EXTRA &= _Hide:Relate:DETALLE_HORAS_EXTRA


infoper_BC1:FilesInit PROCEDURE
  CODE
  _Hide:Relate:empc.Init
  _Hide:Relate:CTA_CONTABLE.Init
  _Hide:Relate:PROVISION.Init
  _Hide:Relate:DETALLE_PROVISION.Init
  _Hide:Relate:TXTAsiento.Init
  _Hide:Relate:SSEC::UserInGroup.Init
  _Hide:Relate:SSEC::Door.Init
  _Hide:Relate:SSEC::DoorGroup.Init
  _Hide:Relate:SSEC::Access.Init
  _Hide:Relate:SSEC::Program.Init
  _Hide:Relate:SSEC::Procedure.Init
  _Hide:Relate:SSEC::File.Init
  _Hide:Relate:SSEC::Field.Init
  _Hide:Relate:SSEC::PwdLog.Init
  _Hide:Relate:SSEC::Call.Init
  _Hide:Relate:SSEC::Edit.Init
  _Hide:Relate:SSEC::User.Init
  _Hide:Relate:ERP_ASIENTO.Init
  _Hide:Relate:HORASEXTRASCVS.Init
  _Hide:Relate:DETALLE_HORAS_EXTRA.Init


infoper_BC1:DctKill PROCEDURE
  CODE
  _Hide:Relate:empc.Kill
  DISPOSE(_Hide:Relate:empc)
  _Hide:Relate:CTA_CONTABLE.Kill
  DISPOSE(_Hide:Relate:CTA_CONTABLE)
  _Hide:Relate:PROVISION.Kill
  DISPOSE(_Hide:Relate:PROVISION)
  _Hide:Relate:DETALLE_PROVISION.Kill
  DISPOSE(_Hide:Relate:DETALLE_PROVISION)
  _Hide:Relate:TXTAsiento.Kill
  DISPOSE(_Hide:Relate:TXTAsiento)
  _Hide:Relate:SSEC::UserInGroup.Kill
  DISPOSE(_Hide:Relate:SSEC::UserInGroup)
  _Hide:Relate:SSEC::Door.Kill
  DISPOSE(_Hide:Relate:SSEC::Door)
  _Hide:Relate:SSEC::DoorGroup.Kill
  DISPOSE(_Hide:Relate:SSEC::DoorGroup)
  _Hide:Relate:SSEC::Access.Kill
  DISPOSE(_Hide:Relate:SSEC::Access)
  _Hide:Relate:SSEC::Program.Kill
  DISPOSE(_Hide:Relate:SSEC::Program)
  _Hide:Relate:SSEC::Procedure.Kill
  DISPOSE(_Hide:Relate:SSEC::Procedure)
  _Hide:Relate:SSEC::File.Kill
  DISPOSE(_Hide:Relate:SSEC::File)
  _Hide:Relate:SSEC::Field.Kill
  DISPOSE(_Hide:Relate:SSEC::Field)
  _Hide:Relate:SSEC::PwdLog.Kill
  DISPOSE(_Hide:Relate:SSEC::PwdLog)
  _Hide:Relate:SSEC::Call.Kill
  DISPOSE(_Hide:Relate:SSEC::Call)
  _Hide:Relate:SSEC::Edit.Kill
  DISPOSE(_Hide:Relate:SSEC::Edit)
  _Hide:Relate:SSEC::User.Kill
  DISPOSE(_Hide:Relate:SSEC::User)
  _Hide:Relate:ERP_ASIENTO.Kill
  DISPOSE(_Hide:Relate:ERP_ASIENTO)
  _Hide:Relate:HORASEXTRASCVS.Kill
  DISPOSE(_Hide:Relate:HORASEXTRASCVS)
  _Hide:Relate:DETALLE_HORAS_EXTRA.Kill
  DISPOSE(_Hide:Relate:DETALLE_HORAS_EXTRA)


Hide:Relate:empc.Init PROCEDURE
  CODE
  _Hide:Access:empc.Init
  SELF.Init(Access:empc,1)


Hide:Access:empc.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= emp:Record
  SELF.FileNameValue = 'empc'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= empc
  PARENT.Init
  Access:empc &= SELF


Hide:Access:empc.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:empc &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:empc.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(empc,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadOnly
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(emp:empc_nroliq,'emp:empc_nroliq',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:empc.Kill PROCEDURE

  CODE
  _Hide:Access:empc.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:empc &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:empc)                               ! destroy the file manager


Hide:Relate:CTA_CONTABLE.Init PROCEDURE
  CODE
  _Hide:Access:CTA_CONTABLE.Init
  SELF.Init(Access:CTA_CONTABLE,1)


Hide:Access:CTA_CONTABLE.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CTA:Record
  SELF.FileNameValue = 'CTA_CONTABLE'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CTA_CONTABLE
  PARENT.Init
  Access:CTA_CONTABLE &= SELF


Hide:Access:CTA_CONTABLE.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CTA_CONTABLE &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CTA_CONTABLE.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CTA_CONTABLE,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CTA:PK_CTA_CONTABLE,'CTA:PK_CTA_CONTABLE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CTA_CONTABLE.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PROVISION,RI:None,RI:None,PROV:FK_CTALICENCIA)
  SELF.AddRelationLink(CTA:CTA_ID_UNIBIZ,PROV:PROV_LICENCIA)

  SELF.AddRelation(Relate:LICENCIA,RI:None,RI:None,LIC:FK_CTA)
  SELF.AddRelationLink(CTA:CTA_ID_UNIBIZ,LIC:LIC_CTA)


Hide:Relate:CTA_CONTABLE.Kill PROCEDURE

  CODE
  _Hide:Access:CTA_CONTABLE.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:CTA_CONTABLE &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CTA_CONTABLE)                       ! destroy the file manager


Hide:Relate:PROVISION.Init PROCEDURE
  CODE
  _Hide:Access:PROVISION.Init
  SELF.Init(Access:PROVISION,1)


Hide:Access:PROVISION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PROV:Record
  SELF.FileNameValue = 'PROVISION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PROVISION
  PARENT.Init
  Access:PROVISION &= SELF


Hide:Access:PROVISION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PROVISION &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PROVISION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PROVISION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PROV:FK_CTALICENCIA,'PROV:FK_CTALICENCIA',0)
    SELF.AddKey(PROV:PK_PROVISION,'PROV:PK_PROVISION',0)
    SELF.AddKey(PROV:PK_AUX,'PROV:PK_AUX',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PROVISION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:CTA_CONTABLE)

  SELF.AddRelation(Relate:DETALLE_PROVISION,RI:None,RI:CASCADE,PROVD:FK_PROVISION)
  SELF.AddRelationLink(PROV:PROV_ID,PROVD:PROVD_ID)


Hide:Relate:PROVISION.Kill PROCEDURE

  CODE
  _Hide:Access:PROVISION.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:PROVISION &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PROVISION)                          ! destroy the file manager


Hide:Relate:DETALLE_PROVISION.Init PROCEDURE
  CODE
  _Hide:Access:DETALLE_PROVISION.Init
  SELF.Init(Access:DETALLE_PROVISION,1)


Hide:Access:DETALLE_PROVISION.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PROVD:Record
  SELF.FileNameValue = 'DETALLE_PROVISION'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_PROVISION
  PARENT.Init
  Access:DETALLE_PROVISION &= SELF


Hide:Access:DETALLE_PROVISION.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_PROVISION &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DETALLE_PROVISION.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DETALLE_PROVISION,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PROVD:FK_LEGAJO,'PROVD:FK_LEGAJO',0)
    SELF.AddKey(PROVD:FK_PROVISION,'PROVD:FK_PROVISION',0)
    SELF.AddKey(PROVD:PK_PROVISION_DETALLE,'PROVD:PK_PROVISION_DETALLE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DETALLE_PROVISION.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PROVISION)

  SELF.AddRelation(Relate:EMPLEADOS)


Hide:Relate:DETALLE_PROVISION.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_PROVISION.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_PROVISION &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_PROVISION)                  ! destroy the file manager


Hide:Relate:TXTAsiento.Init PROCEDURE
  CODE
  _Hide:Access:TXTAsiento.Init
  SELF.Init(Access:TXTAsiento,1)


Hide:Access:TXTAsiento.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TXTA:Record
  SELF.FileNameValue = 'TXTAsiento'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TXTAsiento
  SELF.FileName &= Glo:TxtAsiento
  PARENT.Init
  Access:TXTAsiento &= SELF


Hide:Access:TXTAsiento.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TXTAsiento &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TXTAsiento.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TXTAsiento,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TXTAsiento.Kill PROCEDURE

  CODE
  _Hide:Access:TXTAsiento.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:TXTAsiento &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TXTAsiento)                         ! destroy the file manager


Hide:Relate:SSEC::UserInGroup.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::UserInGroup.Init
  SELF.Init(Access:SSEC::UserInGroup,1)


Hide:Access:SSEC::UserInGroup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUIG_:Record
  SELF.FileNameValue = 'SSEC::UserInGroup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::UserInGroup
  PARENT.Init
  Access:SSEC::UserInGroup &= SELF


Hide:Access:SSEC::UserInGroup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::UserInGroup &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::UserInGroup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::UserInGroup,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SUIG_:UserKey,'SUIG_:UserKey',0)
    SELF.AddKey(SUIG_:UGrpKey,'SUIG_:UGrpKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::UserInGroup.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::UserInGroup.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::UserInGroup &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::UserInGroup)                  ! destroy the file manager


Hide:Relate:SSEC::Door.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Door.Init
  SELF.Init(Access:SSEC::Door,1)


Hide:Access:SSEC::Door.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SDoor_:Record
  SELF.FileNameValue = 'SSEC::Door'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Door
  PARENT.Init
  Access:SSEC::Door &= SELF


Hide:Access:SSEC::Door.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Door &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Door.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Door,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SDoor_:NoKey,'SDoor_:NoKey',1)
    SELF.AddKey(SDoor_:EquateKey,'SDoor_:EquateKey',0)
    SELF.AddKey(SDoor_:DGrpDescKey,'SDoor_:DGrpDescKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Door.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Door.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Door &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Door)                         ! destroy the file manager


Hide:Relate:SSEC::DoorGroup.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::DoorGroup.Init
  SELF.Init(Access:SSEC::DoorGroup,1)


Hide:Access:SSEC::DoorGroup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SDGrp_:Record
  SELF.FileNameValue = 'SSEC::DoorGroup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::DoorGroup
  PARENT.Init
  Access:SSEC::DoorGroup &= SELF


Hide:Access:SSEC::DoorGroup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::DoorGroup &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::DoorGroup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::DoorGroup,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SDGrp_:NoKey,'SDGrp_:NoKey',1)
    SELF.AddKey(SDGrp_:NameKey,'SDGrp_:NameKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::DoorGroup.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::DoorGroup.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::DoorGroup &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::DoorGroup)                    ! destroy the file manager


Hide:Relate:SSEC::Access.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Access.Init
  SELF.Init(Access:SSEC::Access,1)


Hide:Access:SSEC::Access.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SAcc_:Record
  SELF.FileNameValue = 'SSEC::Access'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Access
  PARENT.Init
  Access:SSEC::Access &= SELF


Hide:Access:SSEC::Access.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Access &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Access.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Access,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SAcc_:UserDoorKey,'SAcc_:UserDoorKey',0)
    SELF.AddKey(SAcc_:DoorUserKey,'SAcc_:DoorUserKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Access.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Access.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Access &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Access)                       ! destroy the file manager


Hide:Relate:SSEC::Program.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Program.Init
  SELF.Init(Access:SSEC::Program,1)


Hide:Access:SSEC::Program.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SProg_:Record
  SELF.FileNameValue = 'SSEC::Program'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Program
  PARENT.Init
  Access:SSEC::Program &= SELF


Hide:Access:SSEC::Program.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Program &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Program.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Program,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SProg_:NoKey,'SProg_:NoKey',1)
    SELF.AddKey(SProg_:NameKey,'SProg_:NameKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Program.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Program.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Program &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Program)                      ! destroy the file manager


Hide:Relate:SSEC::Procedure.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Procedure.Init
  SELF.Init(Access:SSEC::Procedure,1)


Hide:Access:SSEC::Procedure.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SProc_:Record
  SELF.FileNameValue = 'SSEC::Procedure'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Procedure
  PARENT.Init
  Access:SSEC::Procedure &= SELF


Hide:Access:SSEC::Procedure.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Procedure &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Procedure.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Procedure,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SProc_:NoKey,'SProc_:NoKey',1)
    SELF.AddKey(SProc_:ProgKey,'SProc_:ProgKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Procedure.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Procedure.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Procedure &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Procedure)                    ! destroy the file manager


Hide:Relate:SSEC::File.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::File.Init
  SELF.Init(Access:SSEC::File,1)


Hide:Access:SSEC::File.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SFile_:Record
  SELF.FileNameValue = 'SSEC::File'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::File
  PARENT.Init
  Access:SSEC::File &= SELF


Hide:Access:SSEC::File.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::File &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::File.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::File,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SFile_:NoKey,'SFile_:NoKey',1)
    SELF.AddKey(SFile_:NameKey,'SFile_:NameKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::File.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::File.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::File &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::File)                         ! destroy the file manager


Hide:Relate:SSEC::Field.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Field.Init
  SELF.Init(Access:SSEC::Field,1)


Hide:Access:SSEC::Field.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SField_:Record
  SELF.FileNameValue = 'SSEC::Field'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Field
  PARENT.Init
  Access:SSEC::Field &= SELF


Hide:Access:SSEC::Field.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Field &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Field.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Field,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SField_:NoKey,'SField_:NoKey',1)
    SELF.AddKey(SField_:FileKey,'SField_:FileKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Field.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Field.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Field &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Field)                        ! destroy the file manager


Hide:Relate:SSEC::PwdLog.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::PwdLog.Init
  SELF.Init(Access:SSEC::PwdLog,1)


Hide:Access:SSEC::PwdLog.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SPwdLog_:Record
  SELF.FileNameValue = 'SSEC::PwdLog'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::PwdLog
  PARENT.Init
  Access:SSEC::PwdLog &= SELF


Hide:Access:SSEC::PwdLog.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::PwdLog &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::PwdLog.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::PwdLog,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SPwdLog_:NoKey,'SPwdLog_:NoKey',1)
    SELF.AddKey(SPwdLog_:UserKey,'SPwdLog_:UserKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::PwdLog.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::PwdLog.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::PwdLog &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::PwdLog)                       ! destroy the file manager


Hide:Relate:SSEC::Call.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Call.Init
  SELF.Init(Access:SSEC::Call,1)


Hide:Access:SSEC::Call.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SCall_:Record
  SELF.FileNameValue = 'SSEC::Call'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Call
  PARENT.Init
  Access:SSEC::Call &= SELF


Hide:Access:SSEC::Call.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Call &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Call.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Call,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SCall_:NoKey,'SCall_:NoKey',1)
    SELF.AddKey(SCall_:DateKey,'SCall_:DateKey',0)
    SELF.AddKey(SCall_:ProcKey,'SCall_:ProcKey',0)
    SELF.AddKey(SCall_:ProcReqKey,'SCall_:ProcReqKey',0)
    SELF.AddKey(SCall_:UserKey,'SCall_:UserKey',0)
    SELF.AddKey(SCall_:FileKey,'SCall_:FileKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Call.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Call.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Call &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Call)                         ! destroy the file manager


Hide:Relate:SSEC::Edit.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::Edit.Init
  SELF.Init(Access:SSEC::Edit,1)


Hide:Access:SSEC::Edit.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SEdit_:Record
  SELF.FileNameValue = 'SSEC::Edit'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::Edit
  PARENT.Init
  Access:SSEC::Edit &= SELF


Hide:Access:SSEC::Edit.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::Edit &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::Edit.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::Edit,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SEdit_:NoKey,'SEdit_:NoKey',1)
    SELF.AddKey(SEdit_:CallKey,'SEdit_:CallKey',0)
    SELF.AddKey(SEdit_:FieldKey,'SEdit_:FieldKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::Edit.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Edit.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Edit &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Edit)                         ! destroy the file manager


Hide:Relate:SSEC::User.Init PROCEDURE
  CODE
  _Hide:Access:SSEC::User.Init
  SELF.Init(Access:SSEC::User,1)


Hide:Access:SSEC::User.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUser_:Record
  SELF.FileNameValue = 'SSEC::User'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SSEC::User
  PARENT.Init
  Access:SSEC::User &= SELF


Hide:Access:SSEC::User.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SSEC::User &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SSEC::User.PrimeFields PROCEDURE

  CODE
  SUser_:PasswordSize = SIZE(SUser_:Password)              ! Assign initial field value
  SUser_:PasswordMaxAge = SSEC::DefaultMaxPwdAge           ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:SSEC::User.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SSEC::User,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SUser_:NoKey,'SUser_:NoKey',1)
    SELF.AddKey(SUser_:NameKey,'SUser_:NameKey',0)
    SELF.AddKey(SUser_:GroupNameKey,'SUser_:GroupNameKey',0)
    SELF.AddKey(SUser_:LevelNdx,'SUser_:LevelNdx',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SSEC::User.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::User.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::User &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::User)                         ! destroy the file manager


Hide:Relate:ERP_ASIENTO.Init PROCEDURE
  CODE
  _Hide:Access:ERP_ASIENTO.Init
  SELF.Init(Access:ERP_ASIENTO,1)


Hide:Access:ERP_ASIENTO.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TRP:Record
  SELF.FileNameValue = 'ERP_ASIENTO'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ERP_ASIENTO
  SELF.FileName &= GLO:NOMBRE_ERP
  PARENT.Init
  Access:ERP_ASIENTO &= SELF


Hide:Access:ERP_ASIENTO.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ERP_ASIENTO &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ERP_ASIENTO.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ERP_ASIENTO,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ERP_ASIENTO.Kill PROCEDURE

  CODE
  _Hide:Access:ERP_ASIENTO.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:ERP_ASIENTO &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ERP_ASIENTO)                        ! destroy the file manager


Hide:Relate:HORASEXTRASCVS.Init PROCEDURE
  CODE
  _Hide:Access:HORASEXTRASCVS.Init
  SELF.Init(Access:HORASEXTRASCVS,1)


Hide:Access:HORASEXTRASCVS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IHE:Record
  SELF.FileNameValue = 'HORASEXTRASCVS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HORASEXTRASCVS
  SELF.FileName &= Glo:HorasExtrasCVS
  PARENT.Init
  Access:HORASEXTRASCVS &= SELF


Hide:Access:HORASEXTRASCVS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HORASEXTRASCVS &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HORASEXTRASCVS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HORASEXTRASCVS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HORASEXTRASCVS.Kill PROCEDURE

  CODE
  _Hide:Access:HORASEXTRASCVS.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:HORASEXTRASCVS &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HORASEXTRASCVS)                     ! destroy the file manager


Hide:Relate:DETALLE_HORAS_EXTRA.Init PROCEDURE
  CODE
  _Hide:Access:DETALLE_HORAS_EXTRA.Init
  SELF.Init(Access:DETALLE_HORAS_EXTRA,1)


Hide:Access:DETALLE_HORAS_EXTRA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HEXD:Record
  SELF.FileNameValue = 'DETALLE_HORAS_EXTRA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DETALLE_HORAS_EXTRA
  PARENT.Init
  Access:DETALLE_HORAS_EXTRA &= SELF


Hide:Access:DETALLE_HORAS_EXTRA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DETALLE_HORAS_EXTRA &= NULL                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DETALLE_HORAS_EXTRA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DETALLE_HORAS_EXTRA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(HEXD:FK_EMPLEADO,'HEXD:FK_EMPLEADO',0)
    SELF.AddKey(HEXD:FK_HSEXTRADENARIUS,'HEXD:FK_HSEXTRADENARIUS',0)
    SELF.AddKey(HEXD:FK_HORASEXTRAS,'HEXD:FK_HORASEXTRAS',0)
    SELF.AddKey(HEXD:PK_DETALLE_HORAS_EXTRA,'HEXD:PK_DETALLE_HORAS_EXTRA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DETALLE_HORAS_EXTRA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:HORAS_EXTRA)

  SELF.AddRelation(Relate:HORAS_EXTRA_DENARIUS)

  SELF.AddRelation(Relate:EMPLEADOS)


Hide:Relate:DETALLE_HORAS_EXTRA.Kill PROCEDURE

  CODE
  _Hide:Access:DETALLE_HORAS_EXTRA.Kill                    ! Kill the file manager
  PARENT.Kill
  Relate:DETALLE_HORAS_EXTRA &= NULL                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DETALLE_HORAS_EXTRA)                ! destroy the file manager

