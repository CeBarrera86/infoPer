  MODULE('USEREDIT001.CLW')
SSEC::FetchAccess      FUNCTION(),BYTE
SSEC::DeleteAccess     PROCEDURE
SSEC::GrantAccess      PROCEDURE
SSEC::SelectUser       PROCEDURE                      !Browse the SSEC::User File
SSEC::UpdateUIG:Group  PROCEDURE
SSEC::AccessState      FUNCTION(),BYTE
SSEC::BulkAccess       PROCEDURE(BYTE)
SSEC::DenyAccess       PROCEDURE
SSEC::BrowseUserGroup  PROCEDURE                      !Browse the SSEC::User File
SSEC::UpdateUserGroup  PROCEDURE                      !Update the SSEC::User File
  END
