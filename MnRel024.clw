

   MEMBER('MnRel.clw')                                     ! This is a MEMBER module

                     MAP
                       INCLUDE('MNREL024.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
UltimaLectura        PROCEDURE  (NRELOJ,NLUGAR)            ! Declare Procedure
str                  STRING(1000)                          !
FilesOpened     BYTE(0)

  CODE
  OPEN(TMPUsosMultiples)
  IF NLUGAR <> 0 THEN
  str='select max(fechar)  from personal..lgreloj, personal..lugar where nreloj = lug_sede and lug_codigo = ' & format(Nlugar,@n_4)
  TMPUsosMultiples{PROP:SQL}=str
  ELSE
  str='select max(fechar)  from personal..lgreloj where nreloj = ' & format(nreloj,@n_2)
  TMPUsosMultiples{PROP:SQL}=str
  END

! setclipboard(str)

  next(TMPUsosMultiples)
  CLOSE(TMPUsosMultiples)
  RETURN(TUM:Col01)
!--------------------------------------
OpenFiles  ROUTINE
  Access:TMPUsosMultiples.Open                             ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:TMPUsosMultiples.UseFile                          ! Use File referenced in 'Other Files' so need to inform its FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:TMPUsosMultiples.Close
     FilesOpened = False
  END
