  MEMBER('infoper.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
infoper_BC3:DctInit    PROCEDURE
infoper_BC3:DctKill    PROCEDURE
infoper_BC3:FilesInit  PROCEDURE
  END

Hide:Access:adatadicn CLASS(FileManager),TYPE              ! FileManager for adatadicn
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:adatadicn CLASS(RelationManager),TYPE          ! RelationManager for adatadicn
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:adatadicn &Hide:Access:adatadicn,AUTO,THREAD
_Hide:Relate:adatadicn &Hide:Relate:adatadicn,AUTO,THREAD


infoper_BC3:DctInit PROCEDURE
  CODE
  _Hide:Access:adatadicn &= NEW(Hide:Access:adatadicn)
  _Hide:Relate:adatadicn &= NEW(Hide:Relate:adatadicn)
  Relate:adatadicn &= _Hide:Relate:adatadicn


infoper_BC3:FilesInit PROCEDURE
  CODE
  _Hide:Relate:adatadicn.Init


infoper_BC3:DctKill PROCEDURE
  CODE
  _Hide:Relate:adatadicn.Kill
  DISPOSE(_Hide:Relate:adatadicn)


Hide:Relate:adatadicn.Init PROCEDURE
  CODE
  _Hide:Access:adatadicn.Init
  SELF.Init(Access:adatadicn,1)
  SELF.SetAlias(Relate:datadicn)


Hide:Access:adatadicn.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= datadicnAlias:Record
  SELF.AliasedFile &= Access:datadicn                      !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'adatadicn'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= adatadicn
  PARENT.Init
  Access:adatadicn &= SELF


Hide:Access:adatadicn.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:adatadicn &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:adatadicn.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(adatadicn,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(datadicnAlias:datadicn_clave,'datadicnAlias:datadicn_clave',0)
    SELF.AddKey(datadicnAlias:datadicn_clavepk,'datadicnAlias:datadicn_clavepk',0)
    SELF.AddKey(datadicnAlias:datadicn_nombre,'datadicnAlias:datadicn_nombre',0)
    SELF.AddKey(datadicnAlias:datadicn_valor,'datadicnAlias:datadicn_valor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:adatadicn.Kill PROCEDURE

  CODE
  _Hide:Access:adatadicn.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:adatadicn &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:adatadicn)                          ! destroy the file manager

