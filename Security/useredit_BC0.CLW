  MEMBER('useredit.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
useredit_BC0:DctInit    PROCEDURE
useredit_BC0:DctKill    PROCEDURE
useredit_BC0:FilesInit  PROCEDURE
  END

Hide:Access:SSEC::User CLASS(FileManager),TYPE             ! FileManager for SSEC::User
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::User CLASS(RelationManager),TYPE         ! RelationManager for SSEC::User
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::UserInGroup CLASS(FileManager),TYPE      ! FileManager for SSEC::UserInGroup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::UserInGroup CLASS(RelationManager),TYPE  ! RelationManager for SSEC::UserInGroup
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Door CLASS(FileManager),TYPE             ! FileManager for SSEC::Door
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Door CLASS(RelationManager),TYPE         ! RelationManager for SSEC::Door
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::DoorGroup CLASS(FileManager),TYPE        ! FileManager for SSEC::DoorGroup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::DoorGroup CLASS(RelationManager),TYPE    ! RelationManager for SSEC::DoorGroup
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Access CLASS(FileManager),TYPE           ! FileManager for SSEC::Access
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Access CLASS(RelationManager),TYPE       ! RelationManager for SSEC::Access
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Program CLASS(FileManager),TYPE          ! FileManager for SSEC::Program
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Program CLASS(RelationManager),TYPE      ! RelationManager for SSEC::Program
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Procedure CLASS(FileManager),TYPE        ! FileManager for SSEC::Procedure
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Procedure CLASS(RelationManager),TYPE    ! RelationManager for SSEC::Procedure
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::File CLASS(FileManager),TYPE             ! FileManager for SSEC::File
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::File CLASS(RelationManager),TYPE         ! RelationManager for SSEC::File
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Field CLASS(FileManager),TYPE            ! FileManager for SSEC::Field
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Field CLASS(RelationManager),TYPE        ! RelationManager for SSEC::Field
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::PwdLog CLASS(FileManager),TYPE           ! FileManager for SSEC::PwdLog
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::PwdLog CLASS(RelationManager),TYPE       ! RelationManager for SSEC::PwdLog
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Call CLASS(FileManager),TYPE             ! FileManager for SSEC::Call
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Call CLASS(RelationManager),TYPE         ! RelationManager for SSEC::Call
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::Edit CLASS(FileManager),TYPE             ! FileManager for SSEC::Edit
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::Edit CLASS(RelationManager),TYPE         ! RelationManager for SSEC::Edit
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SSEC::UserGroup CLASS(FileManager),TYPE        ! FileManager for SSEC::UserGroup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SSEC::UserGroup CLASS(RelationManager),TYPE    ! RelationManager for SSEC::UserGroup
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:SSEC::User &Hide:Access:SSEC::User,AUTO,THREAD
_Hide:Relate:SSEC::User &Hide:Relate:SSEC::User,AUTO,THREAD
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
_Hide:Access:SSEC::UserGroup &Hide:Access:SSEC::UserGroup,AUTO,THREAD
_Hide:Relate:SSEC::UserGroup &Hide:Relate:SSEC::UserGroup,AUTO,THREAD


useredit_BC0:DctInit PROCEDURE
  CODE
  _Hide:Access:SSEC::User &= NEW(Hide:Access:SSEC::User)
  _Hide:Relate:SSEC::User &= NEW(Hide:Relate:SSEC::User)
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
  _Hide:Access:SSEC::UserGroup &= NEW(Hide:Access:SSEC::UserGroup)
  _Hide:Relate:SSEC::UserGroup &= NEW(Hide:Relate:SSEC::UserGroup)
  Relate:SSEC::User &= _Hide:Relate:SSEC::User
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
  Relate:SSEC::UserGroup &= _Hide:Relate:SSEC::UserGroup


useredit_BC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:SSEC::User.Init
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
  _Hide:Relate:SSEC::UserGroup.Init


useredit_BC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:SSEC::User.Kill
  DISPOSE(_Hide:Relate:SSEC::User)
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
  _Hide:Relate:SSEC::UserGroup.Kill
  DISPOSE(_Hide:Relate:SSEC::UserGroup)


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


Hide:Relate:SSEC::User.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::PwdLog,RI:CASCADE,RI:CASCADE,SPwdLog_:UserKey)
  SELF.AddRelationLink(SUser_:No,SPwdLog_:UserNo)

  SELF.AddRelation(Relate:SSEC::UserInGroup,RI:CASCADE,RI:CASCADE,SUIG_:UserKey)
  SELF.AddRelationLink(SUser_:No,SUIG_:UserNo)

  SELF.AddRelation(Relate:SSEC::Call,RI:CASCADE,RI:CASCADE,SCall_:UserKey)
  SELF.AddRelationLink(SUser_:No,SCall_:UserNo)

  SELF.AddRelation(Relate:SSEC::Access,RI:CASCADE,RI:CASCADE,SAcc_:UserDoorKey)
  SELF.AddRelationLink(SUser_:No,SAcc_:UserNo)


Hide:Relate:SSEC::User.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::User.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::User &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::User)                         ! destroy the file manager


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


Hide:Relate:SSEC::UserInGroup.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Access,RI:None,RI:None,SAcc_:UserDoorKey)
  SELF.AddRelationLink(SUIG_:UGrpNo,SAcc_:UserNo)

  SELF.AddRelation(Relate:SSEC::User)

  SELF.AddRelation(Relate:SSEC::UserGroup)


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


Hide:Relate:SSEC::Door.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::DoorGroup)

  SELF.AddRelation(Relate:SSEC::Access,RI:CASCADE,RI:RESTRICT,SAcc_:DoorUserKey)
  SELF.AddRelationLink(SDoor_:No,SAcc_:DoorNo)


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


Hide:Relate:SSEC::DoorGroup.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Door,RI:CASCADE,RI:RESTRICT,SDoor_:DGrpDescKey)
  SELF.AddRelationLink(SDGrp_:No,SDoor_:DGrpNo)


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


Hide:Relate:SSEC::Access.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::UserInGroup)

  SELF.AddRelation(Relate:SSEC::Door)

  SELF.AddRelation(Relate:SSEC::User)


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


Hide:Relate:SSEC::Program.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Procedure,RI:CASCADE,RI:CASCADE,SProc_:ProgKey)
  SELF.AddRelationLink(SProg_:No,SProc_:ProgNo)


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


Hide:Relate:SSEC::Procedure.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Call,RI:CASCADE,RI:CASCADE,SCall_:ProcKey)
  SELF.AddRelationLink(SProc_:No,SCall_:ProcNo)

  SELF.AddRelation(Relate:SSEC::Program)


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


Hide:Relate:SSEC::File.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Field,RI:CASCADE,RI:CASCADE,SField_:FileKey)
  SELF.AddRelationLink(SFile_:No,SField_:FileNo)

  SELF.AddRelation(Relate:SSEC::Call,RI:CASCADE,RI:CASCADE,SCall_:FileKey)
  SELF.AddRelationLink(SFile_:No,SCall_:FileNo)


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


Hide:Relate:SSEC::Field.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Edit,RI:CASCADE,RI:CASCADE,SEdit_:FieldKey)
  SELF.AddRelationLink(SField_:No,SEdit_:FieldNo)

  SELF.AddRelation(Relate:SSEC::File)


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


Hide:Relate:SSEC::PwdLog.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::User)


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


Hide:Relate:SSEC::Call.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Edit,RI:CASCADE,RI:CASCADE,SEdit_:CallKey)
  SELF.AddRelationLink(SCall_:No,SEdit_:CallNo)

  SELF.AddRelation(Relate:SSEC::File)

  SELF.AddRelation(Relate:SSEC::Procedure)

  SELF.AddRelation(Relate:SSEC::User)


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


Hide:Relate:SSEC::Edit.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::Call)

  SELF.AddRelation(Relate:SSEC::Field)


Hide:Relate:SSEC::Edit.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::Edit.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::Edit &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::Edit)                         ! destroy the file manager


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


Hide:Relate:SSEC::UserGroup.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SSEC::UserInGroup,RI:CASCADE,RI:CASCADE,SUIG_:UGrpKey)
  SELF.AddRelationLink(SUGrp_:No,SUIG_:UGrpNo)


Hide:Relate:SSEC::UserGroup.Kill PROCEDURE

  CODE
  _Hide:Access:SSEC::UserGroup.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:SSEC::UserGroup &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SSEC::UserGroup)                    ! destroy the file manager

