  MEMBER('MnRel.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
MnRel_BC0:DctInit    PROCEDURE
MnRel_BC0:DctKill    PROCEDURE
MnRel_BC0:FilesInit  PROCEDURE
  END

Hide:Access:Emplea   CLASS(FileManager),TYPE               ! FileManager for Emplea
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Emplea   CLASS(RelationManager),TYPE           ! RelationManager for Emplea
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

Hide:Access:TMPReloj CLASS(FileManager),TYPE               ! FileManager for TMPReloj
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TMPReloj CLASS(RelationManager),TYPE           ! RelationManager for TMPReloj
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TMP_Personal CLASS(FileManager),TYPE           ! FileManager for TMP_Personal
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TMP_Personal CLASS(RelationManager),TYPE       ! RelationManager for TMP_Personal
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:HISRELOJ CLASS(FileManager),TYPE               ! FileManager for HISRELOJ
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:HISRELOJ CLASS(RelationManager),TYPE           ! RelationManager for HISRELOJ
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:HORADEV  CLASS(FileManager),TYPE               ! FileManager for HORADEV
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PreInsert              PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
PreUpdate              PROCEDURE(LONG Pntr,UNSIGNED PutLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:HORADEV  CLASS(RelationManager),TYPE           ! RelationManager for HORADEV
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LGRELOJ  CLASS(FileManager),TYPE               ! FileManager for LGRELOJ
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LGRELOJ  CLASS(RelationManager),TYPE           ! RelationManager for LGRELOJ
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Reloj    CLASS(FileManager),TYPE               ! FileManager for Reloj
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Reloj    CLASS(RelationManager),TYPE           ! RelationManager for Reloj
Init                   PROCEDURE
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

Hide:Access:SEDEINI  CLASS(FileManager),TYPE               ! FileManager for SEDEINI
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SEDEINI  CLASS(RelationManager),TYPE           ! RelationManager for SEDEINI
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LUGAR    CLASS(FileManager),TYPE               ! FileManager for LUGAR
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LUGAR    CLASS(RelationManager),TYPE           ! RelationManager for LUGAR
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SEDE_RELOJ CLASS(FileManager),TYPE             ! FileManager for SEDE_RELOJ
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SEDE_RELOJ CLASS(RelationManager),TYPE         ! RelationManager for SEDE_RELOJ
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SEDE_RELOJ_EMP CLASS(FileManager),TYPE         ! FileManager for SEDE_RELOJ_EMP
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:SEDE_RELOJ_EMP CLASS(RelationManager),TYPE     ! RelationManager for SEDE_RELOJ_EMP
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TARJETA  CLASS(FileManager),TYPE               ! FileManager for TARJETA
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:TARJETA  CLASS(RelationManager),TYPE           ! RelationManager for TARJETA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:EMPLEA2  CLASS(FileManager),TYPE               ! FileManager for EMPLEA2
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EMPLEA2  CLASS(RelationManager),TYPE           ! RelationManager for EMPLEA2
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:Emplea  &Hide:Access:Emplea,AUTO,THREAD
_Hide:Relate:Emplea  &Hide:Relate:Emplea,AUTO,THREAD
_Hide:Access:TMPUsosMultiples &Hide:Access:TMPUsosMultiples,AUTO,THREAD
_Hide:Relate:TMPUsosMultiples &Hide:Relate:TMPUsosMultiples,AUTO,THREAD
_Hide:Access:TMPReloj &Hide:Access:TMPReloj,AUTO,THREAD
_Hide:Relate:TMPReloj &Hide:Relate:TMPReloj,AUTO,THREAD
_Hide:Access:TMP_Personal &Hide:Access:TMP_Personal,AUTO,THREAD
_Hide:Relate:TMP_Personal &Hide:Relate:TMP_Personal,AUTO,THREAD
_Hide:Access:HISRELOJ &Hide:Access:HISRELOJ,AUTO,THREAD
_Hide:Relate:HISRELOJ &Hide:Relate:HISRELOJ,AUTO,THREAD
_Hide:Access:HORADEV &Hide:Access:HORADEV,AUTO,THREAD
_Hide:Relate:HORADEV &Hide:Relate:HORADEV,AUTO,THREAD
_Hide:Access:LGRELOJ &Hide:Access:LGRELOJ,AUTO,THREAD
_Hide:Relate:LGRELOJ &Hide:Relate:LGRELOJ,AUTO,THREAD
_Hide:Access:Reloj   &Hide:Access:Reloj,AUTO,THREAD
_Hide:Relate:Reloj   &Hide:Relate:Reloj,AUTO,THREAD
_Hide:Access:EMPLEADOS &Hide:Access:EMPLEADOS,AUTO,THREAD
_Hide:Relate:EMPLEADOS &Hide:Relate:EMPLEADOS,AUTO,THREAD
_Hide:Access:SEDEINI &Hide:Access:SEDEINI,AUTO,THREAD
_Hide:Relate:SEDEINI &Hide:Relate:SEDEINI,AUTO,THREAD
_Hide:Access:LUGAR   &Hide:Access:LUGAR,AUTO,THREAD
_Hide:Relate:LUGAR   &Hide:Relate:LUGAR,AUTO,THREAD
_Hide:Access:SEDE_RELOJ &Hide:Access:SEDE_RELOJ,AUTO,THREAD
_Hide:Relate:SEDE_RELOJ &Hide:Relate:SEDE_RELOJ,AUTO,THREAD
_Hide:Access:SEDE_RELOJ_EMP &Hide:Access:SEDE_RELOJ_EMP,AUTO,THREAD
_Hide:Relate:SEDE_RELOJ_EMP &Hide:Relate:SEDE_RELOJ_EMP,AUTO,THREAD
_Hide:Access:TARJETA &Hide:Access:TARJETA,AUTO,THREAD
_Hide:Relate:TARJETA &Hide:Relate:TARJETA,AUTO,THREAD
_Hide:Access:EMPLEA2 &Hide:Access:EMPLEA2,AUTO,THREAD
_Hide:Relate:EMPLEA2 &Hide:Relate:EMPLEA2,AUTO,THREAD


MnRel_BC0:DctInit PROCEDURE
  CODE
  _Hide:Access:Emplea &= NEW(Hide:Access:Emplea)
  _Hide:Relate:Emplea &= NEW(Hide:Relate:Emplea)
  _Hide:Access:TMPUsosMultiples &= NEW(Hide:Access:TMPUsosMultiples)
  _Hide:Relate:TMPUsosMultiples &= NEW(Hide:Relate:TMPUsosMultiples)
  _Hide:Access:TMPReloj &= NEW(Hide:Access:TMPReloj)
  _Hide:Relate:TMPReloj &= NEW(Hide:Relate:TMPReloj)
  _Hide:Access:TMP_Personal &= NEW(Hide:Access:TMP_Personal)
  _Hide:Relate:TMP_Personal &= NEW(Hide:Relate:TMP_Personal)
  _Hide:Access:HISRELOJ &= NEW(Hide:Access:HISRELOJ)
  _Hide:Relate:HISRELOJ &= NEW(Hide:Relate:HISRELOJ)
  _Hide:Access:HORADEV &= NEW(Hide:Access:HORADEV)
  _Hide:Relate:HORADEV &= NEW(Hide:Relate:HORADEV)
  _Hide:Access:LGRELOJ &= NEW(Hide:Access:LGRELOJ)
  _Hide:Relate:LGRELOJ &= NEW(Hide:Relate:LGRELOJ)
  _Hide:Access:Reloj &= NEW(Hide:Access:Reloj)
  _Hide:Relate:Reloj &= NEW(Hide:Relate:Reloj)
  _Hide:Access:EMPLEADOS &= NEW(Hide:Access:EMPLEADOS)
  _Hide:Relate:EMPLEADOS &= NEW(Hide:Relate:EMPLEADOS)
  _Hide:Access:SEDEINI &= NEW(Hide:Access:SEDEINI)
  _Hide:Relate:SEDEINI &= NEW(Hide:Relate:SEDEINI)
  _Hide:Access:LUGAR &= NEW(Hide:Access:LUGAR)
  _Hide:Relate:LUGAR &= NEW(Hide:Relate:LUGAR)
  _Hide:Access:SEDE_RELOJ &= NEW(Hide:Access:SEDE_RELOJ)
  _Hide:Relate:SEDE_RELOJ &= NEW(Hide:Relate:SEDE_RELOJ)
  _Hide:Access:SEDE_RELOJ_EMP &= NEW(Hide:Access:SEDE_RELOJ_EMP)
  _Hide:Relate:SEDE_RELOJ_EMP &= NEW(Hide:Relate:SEDE_RELOJ_EMP)
  _Hide:Access:TARJETA &= NEW(Hide:Access:TARJETA)
  _Hide:Relate:TARJETA &= NEW(Hide:Relate:TARJETA)
  _Hide:Access:EMPLEA2 &= NEW(Hide:Access:EMPLEA2)
  _Hide:Relate:EMPLEA2 &= NEW(Hide:Relate:EMPLEA2)
  Relate:Emplea &= _Hide:Relate:Emplea
  Relate:TMPUsosMultiples &= _Hide:Relate:TMPUsosMultiples
  Relate:TMPReloj &= _Hide:Relate:TMPReloj
  Relate:TMP_Personal &= _Hide:Relate:TMP_Personal
  Relate:HISRELOJ &= _Hide:Relate:HISRELOJ
  Relate:HORADEV &= _Hide:Relate:HORADEV
  Relate:LGRELOJ &= _Hide:Relate:LGRELOJ
  Relate:Reloj &= _Hide:Relate:Reloj
  Relate:EMPLEADOS &= _Hide:Relate:EMPLEADOS
  Relate:SEDEINI &= _Hide:Relate:SEDEINI
  Relate:LUGAR &= _Hide:Relate:LUGAR
  Relate:SEDE_RELOJ &= _Hide:Relate:SEDE_RELOJ
  Relate:SEDE_RELOJ_EMP &= _Hide:Relate:SEDE_RELOJ_EMP
  Relate:TARJETA &= _Hide:Relate:TARJETA
  Relate:EMPLEA2 &= _Hide:Relate:EMPLEA2


MnRel_BC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:Emplea.Init
  _Hide:Relate:TMPUsosMultiples.Init
  _Hide:Relate:TMPReloj.Init
  _Hide:Relate:TMP_Personal.Init
  _Hide:Relate:HISRELOJ.Init
  _Hide:Relate:HORADEV.Init
  _Hide:Relate:LGRELOJ.Init
  _Hide:Relate:Reloj.Init
  _Hide:Relate:EMPLEADOS.Init
  _Hide:Relate:SEDEINI.Init
  _Hide:Relate:LUGAR.Init
  _Hide:Relate:SEDE_RELOJ.Init
  _Hide:Relate:SEDE_RELOJ_EMP.Init
  _Hide:Relate:TARJETA.Init
  _Hide:Relate:EMPLEA2.Init


MnRel_BC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:Emplea.Kill
  DISPOSE(_Hide:Relate:Emplea)
  _Hide:Relate:TMPUsosMultiples.Kill
  DISPOSE(_Hide:Relate:TMPUsosMultiples)
  _Hide:Relate:TMPReloj.Kill
  DISPOSE(_Hide:Relate:TMPReloj)
  _Hide:Relate:TMP_Personal.Kill
  DISPOSE(_Hide:Relate:TMP_Personal)
  _Hide:Relate:HISRELOJ.Kill
  DISPOSE(_Hide:Relate:HISRELOJ)
  _Hide:Relate:HORADEV.Kill
  DISPOSE(_Hide:Relate:HORADEV)
  _Hide:Relate:LGRELOJ.Kill
  DISPOSE(_Hide:Relate:LGRELOJ)
  _Hide:Relate:Reloj.Kill
  DISPOSE(_Hide:Relate:Reloj)
  _Hide:Relate:EMPLEADOS.Kill
  DISPOSE(_Hide:Relate:EMPLEADOS)
  _Hide:Relate:SEDEINI.Kill
  DISPOSE(_Hide:Relate:SEDEINI)
  _Hide:Relate:LUGAR.Kill
  DISPOSE(_Hide:Relate:LUGAR)
  _Hide:Relate:SEDE_RELOJ.Kill
  DISPOSE(_Hide:Relate:SEDE_RELOJ)
  _Hide:Relate:SEDE_RELOJ_EMP.Kill
  DISPOSE(_Hide:Relate:SEDE_RELOJ_EMP)
  _Hide:Relate:TARJETA.Kill
  DISPOSE(_Hide:Relate:TARJETA)
  _Hide:Relate:EMPLEA2.Kill
  DISPOSE(_Hide:Relate:EMPLEA2)


Hide:Relate:Emplea.Init PROCEDURE
  CODE
  _Hide:Access:Emplea.Init
  SELF.Init(Access:Emplea,1)


Hide:Access:Emplea.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EPD:Record
  SELF.FileNameValue = 'Emplea'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Emplea
  PARENT.Init
  Access:Emplea &= SELF


Hide:Access:Emplea.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Emplea &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Emplea.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Emplea,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(EPD:Key1_sue,'Servicio Legajo',0)
    SELF.AddKey(EPD:KeyT1_Sue,'x tarjeta1',0)
    SELF.AddKey(EPD:KeyT2_Sue,'EPD:KeyT2_Sue',0)
    SELF.AddKey(EPD:KeyT3_Sue,'EPD:KeyT3_Sue',0)
    SELF.AddKey(EPD:key4_sue,'EPD:key4_sue',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Emplea.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:HORADEV,RI:None,RI:None,HSD:PK_HORADEV)
  SELF.AddRelationLink(EPD:RCod1_Sue,HSD:SERVILEG)

  SELF.AddRelation(Relate:TARJETA)

  SELF.AddRelation(Relate:SEDE_RELOJ_EMP,RI:None,RI:None,SED2:FK_SEDE_RELOJ_EMP_EMPLEADOS1)
  SELF.AddRelationLink(EPD:RCod1_Sue,SED2:SRL_Legajo)


Hide:Relate:Emplea.Kill PROCEDURE

  CODE
  _Hide:Access:Emplea.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Emplea &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Emplea)                             ! destroy the file manager


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
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
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


Hide:Relate:TMPReloj.Init PROCEDURE
  CODE
  _Hide:Access:TMPReloj.Init
  SELF.Init(Access:TMPReloj,1)


Hide:Access:TMPReloj.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TPR:Record
  SELF.FileNameValue = 'TMPReloj'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TMPReloj
  SELF.FileName &= glo:TMPReloj
  PARENT.Init
  Access:TMPReloj &= SELF


Hide:Access:TMPReloj.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TMPReloj &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TMPReloj.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TMPReloj,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TMPReloj.Kill PROCEDURE

  CODE
  _Hide:Access:TMPReloj.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TMPReloj &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TMPReloj)                           ! destroy the file manager


Hide:Relate:TMP_Personal.Init PROCEDURE
  CODE
  _Hide:Access:TMP_Personal.Init
  SELF.Init(Access:TMP_Personal,1)


Hide:Access:TMP_Personal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TPE:Record
  SELF.FileNameValue = 'TMP_Personal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TMP_Personal
  PARENT.Init
  Access:TMP_Personal &= SELF


Hide:Access:TMP_Personal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TMP_Personal &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TMP_Personal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TMP_Personal,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TMP_Personal.Kill PROCEDURE

  CODE
  _Hide:Access:TMP_Personal.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:TMP_Personal &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TMP_Personal)                       ! destroy the file manager


Hide:Relate:HISRELOJ.Init PROCEDURE
  CODE
  _Hide:Access:HISRELOJ.Init
  SELF.Init(Access:HISRELOJ,1)


Hide:Access:HISRELOJ.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HIS:Record
  SELF.FileNameValue = 'HISRELOJ'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HISRELOJ
  PARENT.Init
  Access:HISRELOJ &= SELF


Hide:Access:HISRELOJ.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HISRELOJ &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HISRELOJ.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HISRELOJ,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(HIS:PK_HISRELOJ,'HIS:PK_HISRELOJ',1)
    SELF.AddKey(HIS:IX_FECHA,'HIS:IX_FECHA',0)
    SELF.AddKey(HIS:IX_Reloj_Tarjeta,'HIS:IX_Reloj_Tarjeta',0)
    SELF.AddKey(HIS:IX_Reloj_Fecha_Tarjeta,'HIS:IX_Reloj_Fecha_Tarjeta',0)
    SELF.AddKey(HIS:IX_Reloj_Fecha_Tarjeta_Hora,'HIS:IX_Reloj_Fecha_Tarjeta_Hora',0)
    SELF.AddKey(HIS:IX_HISRELOJFechaD,'HIS:IX_HISRELOJFechaD',0)
    SELF.AddKey(HIS:KEY__WA_Sys_HIS_Tarjeta_1CBC4616,'HIS:KEY__WA_Sys_HIS_Tarjeta_1CBC4616',0)
    SELF.AddKey(HIS:KEY__WA_Sys_HIS_Legajo_1CBC4616,'HIS:KEY__WA_Sys_HIS_Legajo_1CBC4616',0)
    SELF.AddKey(HIS:IX_HISRELOJ,'HIS:IX_HISRELOJ',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HISRELOJ.Kill PROCEDURE

  CODE
  _Hide:Access:HISRELOJ.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:HISRELOJ &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HISRELOJ)                           ! destroy the file manager


Hide:Relate:HORADEV.Init PROCEDURE
  CODE
  _Hide:Access:HORADEV.Init
  SELF.Init(Access:HORADEV,1)


Hide:Access:HORADEV.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HSD:Record
  SELF.FileNameValue = 'HORADEV'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HORADEV
  PARENT.Init
  Access:HORADEV &= SELF


Hide:Access:HORADEV.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HORADEV &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HORADEV.PreInsert PROCEDURE(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(HSD:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  ReturnValue = PARENT.PreInsert(OpCode,AddLen,ErrCode,ErrMsg)
      HSD:FEC_ALTA = TODAY()
      HSD:HOR_ALTA = CLOCK()
  POPERRORS()
  RETURN ReturnValue


Hide:Access:HORADEV.PreUpdate PROCEDURE(LONG Pntr,UNSIGNED PutLen,*CSTRING ErrCode,*CSTRING ErrMsg)

ReturnValue          BYTE,AUTO

Buffer LIKE(HSD:RECORD)
  CODE
  PUSHERRORS()
  IF SELF.SavePreviousBuffer AND NOT(SELF.PreviousBuffer &= NULL)
     Buffer = SELF.PreviousBuffer
  END
  ReturnValue = PARENT.PreUpdate(Pntr,PutLen,ErrCode,ErrMsg)
      HSD:FEC_MODIF = TODAY()
      HSD:HOR_MODIF = CLOCK()
  
  POPERRORS()
  RETURN ReturnValue


Hide:Access:HORADEV.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HORADEV,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(HSD:PK_HORADEV,'HSD:PK_HORADEV',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:HORADEV.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('HSD:TIPO')
    IF INSTRING(']' & CLIP(HSD:TIPO) & '[', ']T[]D[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Trabajadas'',''Devueltas''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:HORADEV.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Emplea)


Hide:Relate:HORADEV.Kill PROCEDURE

  CODE
  _Hide:Access:HORADEV.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:HORADEV &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HORADEV)                            ! destroy the file manager


Hide:Relate:LGRELOJ.Init PROCEDURE
  CODE
  _Hide:Access:LGRELOJ.Init
  SELF.Init(Access:LGRELOJ,1)


Hide:Access:LGRELOJ.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LGR:Record
  SELF.FileNameValue = 'LGRELOJ'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LGRELOJ
  PARENT.Init
  Access:LGRELOJ &= SELF


Hide:Access:LGRELOJ.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LGRELOJ &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LGRELOJ.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LGRELOJ,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LGR:IX_LGRELOJ,'LGR:IX_LGRELOJ',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LGRELOJ.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEDE_RELOJ,RI:None,RI:None,SED:PK_SEDE_RELOJ)
  SELF.AddRelationLink(LGR:NRELOJ,SED:SED_Codigo)


Hide:Relate:LGRELOJ.Kill PROCEDURE

  CODE
  _Hide:Access:LGRELOJ.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:LGRELOJ &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LGRELOJ)                            ! destroy the file manager


Hide:Relate:Reloj.Init PROCEDURE
  CODE
  _Hide:Access:Reloj.Init
  SELF.Init(Access:Reloj,1)


Hide:Access:Reloj.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= REL:Record
  SELF.FileNameValue = 'Reloj'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Reloj
  PARENT.Init
  Access:Reloj &= SELF


Hide:Access:Reloj.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Reloj &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Reloj.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Reloj,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(REL:K_Relo,'Fecha Hora Tarjeta',0)
    SELF.AddKey(REL:K_Tarjeta,'Por Tarjeta',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Reloj.Kill PROCEDURE

  CODE
  _Hide:Access:Reloj.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:Reloj &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Reloj)                              ! destroy the file manager


Hide:Relate:EMPLEADOS.Init PROCEDURE
  CODE
  _Hide:Access:EMPLEADOS.Init
  SELF.Init(Access:EMPLEADOS,1)


Hide:Access:EMPLEADOS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EMP:Record
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
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(EMP:IX_EMPLEADOS_NOM,'EMP:IX_EMPLEADOS_NOM',0)
    SELF.AddKey(EMP:PK_EMPLEADOS,'EMP:PK_EMPLEADOS',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:EMPLEADOS.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 59
    GlobalErrors.SetField('EMP:EMP_Activo')
    IF INSTRING(']' & CLIP(EMP:EMP_Activo) & '[', ']S[]N[]P[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Si'',''No'',''Pasivo''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:EMPLEADOS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEDE_RELOJ_EMP,RI:None,RI:None,SED2:FK_SEDE_RELOJ_EMP_EMPLEADOS1)
  SELF.AddRelationLink(EMP:EMP_Legajo,SED2:SRL_Legajo)

  SELF.AddRelation(Relate:TARJETA,RI:None,RI:None,TAR:FK_TARJETA_EMPLEADOS)
  SELF.AddRelationLink(EMP:EMP_Legajo,TAR:TAR_Legajo)


Hide:Relate:EMPLEADOS.Kill PROCEDURE

  CODE
  _Hide:Access:EMPLEADOS.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:EMPLEADOS &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EMPLEADOS)                          ! destroy the file manager


Hide:Relate:SEDEINI.Init PROCEDURE
  CODE
  _Hide:Access:SEDEINI.Init
  SELF.Init(Access:SEDEINI,1)


Hide:Access:SEDEINI.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SEI:Record
  SELF.FileNameValue = 'SEDEINI'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SEDEINI
  PARENT.Init
  Access:SEDEINI &= SELF


Hide:Access:SEDEINI.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SEDEINI &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SEDEINI.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SEDEINI,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SEI:PK_SEDEINI,'SEI:PK_SEDEINI',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_Reloj_2180FB33,'SEI:KEY__WA_Sys_SED_Reloj_2180FB33',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_RutaRegis_2180FB33,'SEI:KEY__WA_Sys_SED_RutaRegis_2180FB33',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_NombreRegis_2180FB33,'SEI:KEY__WA_Sys_SED_NombreRegis_2180FB33',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_LeerReloj_2180FB33,'SEI:KEY__WA_Sys_SED_LeerReloj_2180FB33',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_Modificar_Datos_2180FB33,'SEI:KEY__WA_Sys_SED_Modificar_Datos_2180FB33',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_Sacar_Partes_2180FB33,'SEI:KEY__WA_Sys_SED_Sacar_Partes_2180FB33',0)
    SELF.AddKey(SEI:KEY__WA_Sys_SED_Armar_Partes_2180FB33,'SEI:KEY__WA_Sys_SED_Armar_Partes_2180FB33',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SEDEINI.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEDE_RELOJ)


Hide:Relate:SEDEINI.Kill PROCEDURE

  CODE
  _Hide:Access:SEDEINI.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:SEDEINI &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SEDEINI)                            ! destroy the file manager


Hide:Relate:LUGAR.Init PROCEDURE
  CODE
  _Hide:Access:LUGAR.Init
  SELF.Init(Access:LUGAR,1)


Hide:Access:LUGAR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LUG:Record
  SELF.FileNameValue = 'LUGAR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LUGAR
  PARENT.Init
  Access:LUGAR &= SELF


Hide:Access:LUGAR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LUGAR &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LUGAR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LUGAR,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LUG:PK_LUGAR,'LUG:PK_LUGAR',1)
    SELF.AddKey(LUG:IX_Descripcion,'LUG:IX_Descripcion',0)
    SELF.AddKey(LUG:IX_SEDE,'LUG:IX_SEDE',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LUGAR.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEDE_RELOJ_EMP,RI:RESTRICT,RI:RESTRICT,SED2:FK_SEDE_RELOJ_EMP_LUGAR1)
  SELF.AddRelationLink(LUG:LUG_Codigo,SED2:SRL_Lugar)

  SELF.AddRelation(Relate:SEDE_RELOJ)


Hide:Relate:LUGAR.Kill PROCEDURE

  CODE
  _Hide:Access:LUGAR.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:LUGAR &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LUGAR)                              ! destroy the file manager


Hide:Relate:SEDE_RELOJ.Init PROCEDURE
  CODE
  _Hide:Access:SEDE_RELOJ.Init
  SELF.Init(Access:SEDE_RELOJ,1)


Hide:Access:SEDE_RELOJ.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SED:Record
  SELF.FileNameValue = 'SEDE_RELOJ'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SEDE_RELOJ
  PARENT.Init
  Access:SEDE_RELOJ &= SELF


Hide:Access:SEDE_RELOJ.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SEDE_RELOJ &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SEDE_RELOJ.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SEDE_RELOJ,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SED:PK_SEDE_RELOJ,'SED:PK_SEDE_RELOJ',1)
    SELF.AddKey(SED:IX_Descripcion,'SED:IX_Descripcion',0)
    SELF.AddKey(SED:KEY__WA_Sys_SED_Reloj_6B24EA82,'SED:KEY__WA_Sys_SED_Reloj_6B24EA82',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SEDE_RELOJ.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SEDEINI,RI:None,RI:None,SEI:PK_SEDEINI)
  SELF.AddRelationLink(SED:SED_Codigo,SEI:SEI_Sede)

  SELF.AddRelation(Relate:LGRELOJ)

  SELF.AddRelation(Relate:LUGAR,RI:RESTRICT,RI:RESTRICT,LUG:IX_SEDE)
  SELF.AddRelationLink(SED:SED_Codigo,LUG:LUG_Sede)

  SELF.AddRelation(Relate:TARJETA)

  SELF.AddRelation(Relate:SEDE_RELOJ_EMP,RI:None,RI:None,SED2:FK_SEDE_RELOJ_EMP_SEDE_RELOJ1)
  SELF.AddRelationLink(SED:SED_Codigo,SED2:SRL_Sede)


Hide:Relate:SEDE_RELOJ.Kill PROCEDURE

  CODE
  _Hide:Access:SEDE_RELOJ.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:SEDE_RELOJ &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SEDE_RELOJ)                         ! destroy the file manager


Hide:Relate:SEDE_RELOJ_EMP.Init PROCEDURE
  CODE
  _Hide:Access:SEDE_RELOJ_EMP.Init
  SELF.Init(Access:SEDE_RELOJ_EMP,1)


Hide:Access:SEDE_RELOJ_EMP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SED2:Record
  SELF.FileNameValue = 'SEDE_RELOJ_EMP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SEDE_RELOJ_EMP
  PARENT.Init
  Access:SEDE_RELOJ_EMP &= SELF


Hide:Access:SEDE_RELOJ_EMP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SEDE_RELOJ_EMP &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SEDE_RELOJ_EMP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SEDE_RELOJ_EMP,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SED2:PK_SEDE_RELOJ_EMP,'SED2:PK_SEDE_RELOJ_EMP',0)
    SELF.AddKey(SED2:FK_SEDE_RELOJ_EMP_SEDE_RELOJ1,'SED2:FK_SEDE_RELOJ_EMP_SEDE_RELOJ1',0)
    SELF.AddKey(SED2:FK_SEDE_RELOJ_EMP_LUGAR1,'SED2:FK_SEDE_RELOJ_EMP_LUGAR1',0)
    SELF.AddKey(SED2:FK_SEDE_RELOJ_EMP_EMPLEADOS1,'SED2:FK_SEDE_RELOJ_EMP_EMPLEADOS1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SEDE_RELOJ_EMP.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:SEDE_RELOJ1   USHORT,AUTO
Save:LUGAR2        USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('SED2:SRL_Sede')
    Save:SEDE_RELOJ1 = Access:SEDE_RELOJ.SaveFile()
    SED:SED_Codigo = SED2:SRL_Sede
    ReturnValue = Access:SEDE_RELOJ.TryFetch(SED:PK_SEDE_RELOJ)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'SEDE_RELOJ')
      END
    END
    Access:SEDE_RELOJ.RestoreFile(Save:SEDE_RELOJ1)
  OF 2
    GlobalErrors.SetField('SED2:SRL_Lugar')
    Save:LUGAR2 = Access:LUGAR.SaveFile()
    LUG:LUG_Codigo = SED2:SRL_Lugar
    ReturnValue = Access:LUGAR.TryFetch(LUG:PK_LUGAR)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'LUGAR')
      END
    END
    Access:LUGAR.RestoreFile(Save:LUGAR2)
  END
  RETURN ReturnValue


Hide:Relate:SEDE_RELOJ_EMP.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Emplea)

  SELF.AddRelation(Relate:EMPLEADOS)

  SELF.AddRelation(Relate:LUGAR)

  SELF.AddRelation(Relate:SEDE_RELOJ)


Hide:Relate:SEDE_RELOJ_EMP.Kill PROCEDURE

  CODE
  _Hide:Access:SEDE_RELOJ_EMP.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:SEDE_RELOJ_EMP &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SEDE_RELOJ_EMP)                     ! destroy the file manager


Hide:Relate:TARJETA.Init PROCEDURE
  CODE
  _Hide:Access:TARJETA.Init
  SELF.Init(Access:TARJETA,1)


Hide:Access:TARJETA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TAR:Record
  SELF.FileNameValue = 'TARJETA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TARJETA
  PARENT.Init
  Access:TARJETA &= SELF


Hide:Access:TARJETA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TARJETA &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TARJETA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TARJETA,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TAR:PK_TARJETA,'TAR:PK_TARJETA',0)
    SELF.AddKey(TAR:FK_TARJETA_EMPLEADOS,'TAR:FK_TARJETA_EMPLEADOS',0)
    SELF.AddKey(TAR:IX_Reloj,'TAR:IX_Reloj',0)
    SELF.AddKey(TAR:IX_Reloj_Tarjeta,'TAR:IX_Reloj_Tarjeta',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:TARJETA.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:Emplea1       USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('TAR:TAR_Legajo')
    Save:Emplea1 = Access:Emplea.SaveFile()
    EPD:RCod1_Sue = TAR:TAR_Legajo
    ReturnValue = Access:Emplea.TryFetch(EPD:Key1_sue)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'Emplea')
      END
    END
    Access:Emplea.RestoreFile(Save:Emplea1)
  END
  RETURN ReturnValue


Hide:Relate:TARJETA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Emplea,RI:None,RI:None,EPD:Key1_sue)
  SELF.AddRelationLink(TAR:TAR_Legajo,EPD:RCod1_Sue)

  SELF.AddRelation(Relate:EMPLEADOS)

  SELF.AddRelation(Relate:SEDE_RELOJ,RI:None,RI:None,SED:PK_SEDE_RELOJ)
  SELF.AddRelationLink(TAR:TAR_Reloj,SED:SED_Codigo)


Hide:Relate:TARJETA.Kill PROCEDURE

  CODE
  _Hide:Access:TARJETA.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:TARJETA &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TARJETA)                            ! destroy the file manager


Hide:Relate:EMPLEA2.Init PROCEDURE
  CODE
  _Hide:Access:EMPLEA2.Init
  SELF.Init(Access:EMPLEA2,1)
  SELF.SetAlias(Relate:Emplea)


Hide:Access:EMPLEA2.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EMP2:Record
  SELF.AliasedFile &= Access:Emplea                        !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'EMPLEA2'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EMPLEA2
  PARENT.Init
  Access:EMPLEA2 &= SELF


Hide:Access:EMPLEA2.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EMPLEA2 &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EMPLEA2.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EMPLEA2,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = DenyNone
       SELF.OpenMode += ReadWrite
    END
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(EMP2:Key1_sue,'Servicio Legajo',0)
    SELF.AddKey(EMP2:KeyT1_Sue,'x tarjeta1',0)
    SELF.AddKey(EMP2:KeyT2_Sue,'EMP2:KeyT2_Sue',0)
    SELF.AddKey(EMP2:KeyT3_Sue,'EMP2:KeyT3_Sue',0)
    SELF.AddKey(EMP2:key4_sue,'EMP2:key4_sue',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EMPLEA2.Kill PROCEDURE

  CODE
  _Hide:Access:EMPLEA2.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:EMPLEA2 &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EMPLEA2)                            ! destroy the file manager

