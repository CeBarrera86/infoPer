!Server routines for RuzoMail

  MEMBER
  MAP
    MODULE('MAPI32.DLL')
      MAPILogon(ULONG,ULONG,ULONG,ULONG,ULONG,*ULONG),ULONG,RAW,PASCAL
      MAPILogoff(ULONG,ULONG,ULONG,ULONG),ULONG,RAW,PASCAL
      MAPISendMail(ULONG,ULONG,ULONG,ULONG,ULONG),ULONG,RAW,PASCAL
      MAPIFindNext(ULONG,ULONG,ULONG,ULONG,ULONG,ULONG,ULONG),ULONG,RAW,PASCAL
      MAPIReadMail(ULONG,ULONG,ULONG,ULONG,ULONG,ULONG),ULONG,RAW,PASCAL
      MAPIFreeBuffer(ULONG),ULONG,RAW,PASCAL
    END
    MODULE('Kernell32.DLL')
      CopyMemory(ULONG,ULONG,LONG),PASCAL,RAW
    END
  END

  INCLUDE('MapiMail.inc'),ONCE

MailManager.DeleteMail    PROCEDURE()
  CODE

MailManager.Details       PROCEDURE()
  CODE

MailManager.FindNext      PROCEDURE(BYTE FlagReadOnly)
Flags       ULONG
MessageType CSTRING(10)
MessageID   CSTRING(512)
ReturnCode  BYTE
  CODE
    IF FlagReadOnly
      Flags += MAPI_UNREAD_ONLY
    END
    MessageType = ''
    ReturnCode = MAPIFindNext(SELF.Session,0,0,0,Flags,0,ADDRESS(MessageID))
    IF ReturnCode
      MESSAGE('Error al leer mensajes (Código=' & CLIP(LEFT(FORMAT(ReturnCode,@n-15))) & ')','Error MAPI',ICON:Exclamation)
      RETURN True
    ELSE
      SELF.MessageID = MessageID
      RETURN False
    END

MailManager.FreeBuffer    PROCEDURE()
  CODE

MailManager.Init          PROCEDURE()
  CODE
    SELF.MapiEnabled = GETINI('Mail','MAPI',,'WIN.INI')

MailManager.Kill          PROCEDURE()
  CODE

MailManager.Logoff  PROCEDURE()
Status  LONG
  CODE
    IF NOT SELF.MapiEnabled
      RETURN 0
    END
    IF SELF.LoggedOn
      Status = MAPILogoff(SELF.Session,0,0,0)
      IF NOT Status
        SELF.LoggedOn = False
      END
    END
    RETURN Status

MailManager.Logon PROCEDURE(STRING UserName, STRING UserPassword, BYTE FlagForceDownload, BYTE FlagNewSession, BYTE FlagLogon, BYTE FlagPassword )
Flags       ULONG
ReturnCode  ULONG
Session     ULONG
  CODE
    IF NOT SELF.MapiEnabled
      RETURN False
    END
    IF FlagForceDownload
      Flags += MAPI_FORCE_DOWNLOAD
    END
    IF FlagNewSession
      Flags += MAPI_NEW_SESSION
    END
    IF FlagLogon
      Flags += MAPI_LOGON_UI
    END
    ReturnCode = MAPILogon(0,ADDRESS(UserName),ADDRESS(UserPassword),Flags,0,Session)
    IF NOT ReturnCode
      SELF.LoggedOn = True
      SELF.Session = Session
      RETURN False
    ELSE
      RETURN True
    END

MailManager.ReadMail      PROCEDURE(ULONG SubjectAddress, ULONG NoteTextAddress, BYTE FlagBodyAsFile, BYTE FlagEnvelopeOnly, BYTE FlagPeek, BYTE FlagSuppressAttach)
Flags                 ULONG
MessageAddressAddress ULONG
MessageAddress        ULONG
ReturnCode            LONG
  CODE
    IF FlagBodyAsFile
      Flags += MAPI_BODY_AS_FILE
    END
    IF FlagEnvelopeOnly
      Flags += MAPI_ENVELOPE_ONLY
    END
    IF FlagPeek
      Flags += MAPI_PEEK
    END
    IF FlagSuppressAttach
      Flags += MAPI_SUPPRESS_ATTACH
    END
    ReturnCode = MAPIReadMail(SELF.Session,0,SELF.MessageID,Flags,0,ADDRESS(SELF.MessageGroup))
    IF NOT ReturnCode
      !Aquí hay que copiar de la posición devuelta por MAPIReadMail a las variables nuestras
      !Estas funciones no andan, hay que revisar...
      !CopyMemory(SubjectAddress,SELF.MessageGroup.SubjectAddress,256)
      !CopyMemory(NoteTextAddress,SELF.MessageGroup.NoteTextAddress,256)
    END

MailManager.ResolveName   PROCEDURE()
  CODE

MailManager.SaveMail      PROCEDURE()
  CODE

MailManager.SendDocuments PROCEDURE()
  CODE

MailManager.SendMail      PROCEDURE(BYTE FlagLogon, BYTE FlagNewSession, BYTE FlagDialog)
Flags         ULONG
ReturnCode    LONG
  CODE
    IF FlagLogon
      Flags += MAPI_LOGON_UI
    END
    IF FlagNewSession
      Flags += MAPI_NEW_SESSION
    END
    IF FlagDialog
      Flags += MAPI_DIALOG
    END
    ReturnCode = MAPISendMail(SELF.Session,0,ADDRESS(SELF.MessageGroup),Flags,0)
    IF NOT ReturnCode
      RETURN False
    ELSE
      MESSAGE('Error al enviar el mensaje (Código=' & CLIP(LEFT(FORMAT(ReturnCode,@n-15))) & ')','Error MAPI',ICON:Exclamation)
      RETURN True
    END

MailManager.SetAddress    PROCEDURE()
  CODE