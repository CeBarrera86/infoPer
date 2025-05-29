  MEMBER('useredit.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('useredit_BC0.CLW')
useredit_BC0:DctInit             PROCEDURE
useredit_BC0:DctKill             PROCEDURE
useredit_BC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  useredit_BC0:DctInit
  useredit_BC0:FilesInit


DctKill PROCEDURE
  CODE
  useredit_BC0:DctKill

