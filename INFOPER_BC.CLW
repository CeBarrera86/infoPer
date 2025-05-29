  MEMBER('infoper.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('infoper_BC0.CLW')
infoper_BC0:DctInit             PROCEDURE
infoper_BC0:DctKill             PROCEDURE
infoper_BC0:FilesInit           PROCEDURE
    END
    MODULE('infoper_BC1.CLW')
infoper_BC1:DctInit             PROCEDURE
infoper_BC1:DctKill             PROCEDURE
infoper_BC1:FilesInit           PROCEDURE
    END
    MODULE('infoper_BC2.CLW')
infoper_BC2:DctInit             PROCEDURE
infoper_BC2:DctKill             PROCEDURE
infoper_BC2:FilesInit           PROCEDURE
    END
    MODULE('infoper_BC3.CLW')
infoper_BC3:DctInit             PROCEDURE
infoper_BC3:DctKill             PROCEDURE
infoper_BC3:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  infoper_BC0:DctInit
  infoper_BC1:DctInit
  infoper_BC2:DctInit
  infoper_BC3:DctInit
  infoper_BC0:FilesInit
  infoper_BC1:FilesInit
  infoper_BC2:FilesInit
  infoper_BC3:FilesInit


DctKill PROCEDURE
  CODE
  infoper_BC0:DctKill
  infoper_BC1:DctKill
  infoper_BC2:DctKill
  infoper_BC3:DctKill

