!MapiMailIncludeFile

OMIT('_EndOfInclude_',_MapiMailPresent_)

_MapiMailPresent_ EQUATE(1)

MAPI_LOGON_UI         EQUATE(1)
MAPI_NEW_SESSION      EQUATE(2)
MAPI_4                EQUATE(4)
MAPI_DIALOG           EQUATE(8)
MAPI_16               EQUATE(16)
MAPI_UNREAD_ONLY      EQUATE(32)
MAPI_ENVELOPE_ONLY    EQUATE(64)
MAPI_PEEK             EQUATE(128)
MAPI_GUARANTEE_FIFO   EQUATE(256)
MAPI_BODY_AS_FILE     EQUATE(512)
MAPI_AB_NOMODIFY      EQUATE(1024)
MAPI_SUPPRESS_ATTACH  EQUATE(2048)
MAPI_FORCE_DOWNLOAD   EQUATE(4096)

MailManager CLASS,MODULE('MapiMail.CLW'),TYPE,LINK('MapiMail.CLW')
MapiEnabled     BYTE
LoggedOn        BYTE
Session         ULONG
MessageID       CSTRING(512)
MessageGroup    GROUP
Reserved              ULONG
SubjectAddress        ULONG
NoteTextAddress       ULONG
MessageTypeAddress    ULONG
DateReceivedAddress   ULONG
ConversationIDAddress ULONG
Flags                 ULONG
OriginatorAddress     ULONG
RecipCount            ULONG
RecipsAddress         ULONG
FileCount             ULONG
FilesAddress          ULONG
                END
DeleteMail      PROCEDURE(),VIRTUAL
Details         PROCEDURE(),VIRTUAL
FindNext        PROCEDURE(BYTE),BYTE,VIRTUAL
FreeBuffer      PROCEDURE(),VIRTUAL
Init            PROCEDURE(),VIRTUAL
Kill            PROCEDURE(),VIRTUAL
Logoff          PROCEDURE(),BYTE,VIRTUAL
Logon           PROCEDURE(STRING, STRING, BYTE, BYTE, BYTE, BYTE),BYTE,VIRTUAL
ReadMail        PROCEDURE(ULONG,ULONG,BYTE,BYTE,BYTE,BYTE),BYTE,VIRTUAL
ResolveName     PROCEDURE(),VIRTUAL
SaveMail        PROCEDURE(),VIRTUAL
SendDocuments   PROCEDURE(),VIRTUAL
SendMail        PROCEDURE(BYTE,BYTE,BYTE),BYTE,VIRTUAL
SetAddress      PROCEDURE(),VIRTUAL
            END

RecipientGroup  GROUP,TYPE
Reserved          ULONG
RecipClass        ULONG
NameAddress       ULONG
AddressAddress    ULONG
EIDSize           ULONG
EntryID           ULONG
                END

AttachGroup     GROUP,TYPE
Reserved          ULONG(0)
Flags             ULONG(0)
InPosition        ULONG
PathNameAddress   ULONG
FileNameAddress   ULONG
FileType          ULONG(0)
                END

_EndOfInclude_