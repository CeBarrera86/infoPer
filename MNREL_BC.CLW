  MEMBER('MnRel.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('MnRel_BC0.CLW')
MnRel_BC0:DctInit             PROCEDURE
MnRel_BC0:DctKill             PROCEDURE
MnRel_BC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  MnRel_BC0:DctInit
  MnRel_BC0:FilesInit


DctKill PROCEDURE
  CODE
  MnRel_BC0:DctKill

