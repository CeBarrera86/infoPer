!Definir datos para mail
ThisMail                 CLASS(MailManager)
                         END
ReturnCode               LONG
SavePath		 CSTRING(256)
Subject                  CSTRING(256)
NoteText                 CSTRING(1024)
OriginatorInfo           GROUP,PRE()
Nombre                     CSTRING(256)
Direccion                  CSTRING(256)
                         END
RecipientInfo            GROUP(OriginatorInfo),PRE(GRPRIN),DIM(5)
                         END
AttachInfo               GROUP,PRE(),DIM(5)
PathName                   CSTRING(256)
FileName                   CSTRING(256)
                         END
Originator               GROUP(RecipientGroup),PRE(GRPORI)
                         END
Recipient                GROUP(RecipientGroup),PRE(GRPREC),DIM(5)
                         END
Attach                   GROUP(AttachGroup),PRE(),DIM(5)
                         END
