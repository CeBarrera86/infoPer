infoper$infoper023 s   Detalle de Horas Extras P1$QUICKWINDOW =     �����  Microsoft Sans Serif personal.ico ProcesarHorasExtras �           �   �  t  /     -                   R           _           $                                  ?BROWSE:1     
  �����  0R(2)|M*~HEXD ID~C(0)@n-7@50C|M*~Fecha~@d17@0R(2)|M*~HEXD FECHA TIME~C(0)@t7@35C|M*~Legajo~@n_7@120L(2)|M*~Empleado~C(0)@s50@50C|M*~Hora Inicio~@T4@0C|M*~HEXD INICIO Dot~@s20@0D(4)|M*~HEXD INICIO Hundreds~C(0)@s20@50C|M*~Hora Fin~@T4@0L(2)|M*~HEXD FIN Dot~L(0)@s20@0L(2)|M*~HEXD FIN Hundreds~@s20@43C|M*~Convenio~@s10@30C|M*~Tipo~@s10@0C|M*~Tiempo~@s5@45C|M*~Tiempo~@s8@42C|M*~Denarius~@n_7@0C|M*~_Reembolso~C(1)@n_7@0R(2)|M*~EMP HORAEXTRA~C(0)@s3@68C|M*~Reembolso (%)~@n_7.2@0R(2)|M*~HEXD DIA HABIL~C(1)@n-7@         Browsing the DETALLE_HORAS_EXTRA file �  H         �            x     �   	                  �                                      ����     n-7 ?HEX:HEX_ID        &            �  �  �   �   <   
                                   �         ?GROUP1     
   �  �  �                      l                                     �             Mes ?HEX:HEX_MES:PROMPT     
   �  �  
             �           �   �    ~  �                 n02B ?HEX:HEX_MES            
  �   �  �  @         �  �                                            �      �  A�o ?HEX:HEX_ANIO:PROMPT     
   �  �  
�             i  E         �   �    e  ~                 n4B ?HEX:HEX_ANIO            
  �   �    @         �  �  E      (                          �          �      �  s30 ?HEX:HEX_OBSERVACION            
  �   �     @         Q  f  |      �                          o          M      �  Observaci�n ?HEX:HEX_OBSERVACION:PROMPT     
   �  �  
�          	   �  |         �   �    �  �                 Abrir Periodo ?CALLLOOKUP     
  ��������wizopen.ico 	  @      
   Y  h     F                          e          K  u                     Procesar Archivo ?LOOKUPFILE     
  ��������down.ico 	�  D@         �  h  :   F                          �          �                       Archivo Horas Extra ?GLO:HORASEXTRASCVS:PROMPT     
   �  �  
(	             �     0      �   �    w  �                 s100 ?GLO:HORASEXTRASCVS d           
  �   �  �	   @         �  	     >   =                         	          �      �  E&xportar ?EVOEXPORTAR     
  ��������export.ico 	F
  D@         �	  �     F                          �	          |	  �	                     Denarius ?BUTTON1     
  �����  element_new_after.ico 	�
  D@         
  �  :   F                           
          
  0
                     Por Legajo: ?LOC:LEGAJO:PROMPT 
/             �
     \      �   �    �
                     n_7B ?LOC:LEGAJO               �   ����  H@         
    R   X   <                                            s10 ?LOC:CONVENIO 
              �   ����Z   �  TODOS|#TODOS|AP|#AP|ATSA|#ATSA|EC|#EC|FC|#FC|FOE|#FOE|LyF|#LyF|PP|#FP|S|#S|SS|#SS|UTA|#UTA �  @@         �  �      �   X   f                          �          
      �                   ���� �  � Por Convenio: ?STRING1 �             �  �   \      �   �    �                     Estado: ?PROMPT1 
W             �  t  X      �   �    �                     s10 ?LOC:ESTADO 
              �   ����               2  >  �  X   U      �    .  G                              &Select ?SELECT 	(            �  f   �      �   �                                �                         &Insert ?INSERT 	�               �   �   *                                                               &Change ?CHANGE 	            �  �   �   *                                      �                         &Delete ?DELETE 	                   �   *                                      �                         P1$GOL_WOI_3 �    ��������MS Sans Serif �            �   ��   +     h  u                                                                              clock.ico ?IMGOUTI_3 X                        �   �           ?G::I_3               P  &      �                                          �  ��         Preparando datos para Exportacion ?STROUTI_3 J            �  ?         �   �    �                     Aguarde un instante por Favor... ?STROUT2I_3               >  C         �   �                         Cabeceras Horas Extra P17$QUICKWINDOW �    �����  Microsoft Sans Serif personal.ico HorasExtras �           �   ��  :  5  �  �  �               �          �          $0                                 ?BROWSE:1     
  �����  0R(2)|M~HEX ID~C(0)@n-7@32C|M~Mes~@n02@36C|M~A�o~@n4@140L(2)|M~Observaci�n~C(2)@s30@40C|M~Estado~@s1@50C|M~Fecha~@d17@50L(2)|M~Usuario~C(0)@s20@         Browsing the HORAS_EXTRA file �  H         c      }        x  �                     m                                    ����     ?CURRENTTAB %�             �            �                                                          ?TAB:2 &                                                       k   &Select ?SELECT 	              c  d   M      �   �                                [                         &Agregar ?INSERT     
  ��������wainsert.ico 	�            �  �   "  >                          �          �  �                     &Cambiar ?CHANGE     
  ��������wachange.ico 	            b  �   "  A                          j          Y  z                     &Borrar ?DELETE     
  �����  wadelete.ico 	              �  C  "  >                          �          �                       Form HORAS_EXTRA P26$QUICKWINDOW �    �����  Microsoft Sans Serif UpdateHORAS_EXTRA L            �   ��   �   M  �  �  t                           �          $0                                 ?CURRENTTAB %N             A            �   r                                       �                  &1) General ?TAB:1 &               �                                �         HEX ID: ?HEX:HEX_ID:PROMPT 
u            	           �   �                         n-7 ?HEX:HEX_ID        �             `  l  d      (   
                                   \         HEX MES: ?HEX:HEX_MES:PROMPT 
?            �     "      �   �    �                     n3 ?HEX:HEX_MES        �             )  6  d   "   (   
                                   &         HEX ANIO: ?HEX:HEX_ANIO:PROMPT 
            �     0      �   �    �                     n-7 ?HEX:HEX_ANIO        �             �    d   0   (   
                                   �         HEX OBSERVACION: ?HEX:HEX_OBSERVACION:PROMPT 
�         	   r     >      �   �    a                     s30 ?HEX:HEX_OBSERVACION        }          
   �  �  d   >   |   
                                   �         HEX FECHA UPDATE DATE: ?HEX:HEX_FECHA_UPDATE_DATE:PROMPT 
�            [     L      �   �    D                     d17 ?HEX:HEX_FECHA_UPDATE_DATE        r             �  �  d   L   h   
                                   �         HEX FECHA UPDATE TIME: ?HEX:HEX_FECHA_UPDATE_TIME:PROMPT 
�            P     Z      �   �    9                     t7 ?HEX:HEX_FECHA_UPDATE_TIME        L             �  �  d   Z   h   
                                   �         HEX USER: ?HEX:HEX_USER:PROMPT 
�            7     h      �   �    -                     s20 ?HEX:HEX_USER                       �  �  d   h   T   
                                   �         &OK ?OK WAOK.ICO Accept data and close the window Accept data and close the window 	�  @         �  I   z   1        -                          �                      &Cancel ?CANCEL WACANCEL.ICO Cancel operation Cancel operation 	�  @         �  ~   z   1      �  �                          �  �                     &Help ?HELP WAHELP.ICO See Help Window See Help Window 	    @         S  �   z   1      d  t                          M  Y                    Form DETALLE_HORAS_EXTRA P37$QUICKWINDOW      �����  Microsoft Sans Serif UpdateDETALLE_HORAS_EXTRA �/           �   �4  �   �   �     �                           2           $0                                 ?CURRENTTAB %�-             �             ,  �                                       A!                  &1) General ?TAB:1 &{*             :!                                .!      �!   HEXD ID: ?HEXD:HEXD_ID:PROMPT 
�!            �!           �   �    �!                     n-7 ?HEXD:HEXD_ID        |"             �!  �!  `      (   
                                   �!         HEXD FECHA DATE: ?HEXD:HEXD_FECHA_DATE:PROMPT 
�"            _"     "      �   �    N"                     d17 ?HEXD:HEXD_FECHA_DATE        a#             �"  �"  `   "   h   
                                   �"         HEXD FECHA TIME: ?HEXD:HEXD_FECHA_TIME:PROMPT 
�#            D#     0      �   �    3#                     t7 ?HEXD:HEXD_FECHA_TIME        =$             �#  �#  `   0   h   
                                   �#         HEXD LEGAJO: ?HEXD:HEXD_LEGAJO:PROMPT 
�$         	   $$     >      �   �    $                     n-7 ?HEXD:HEXD_LEGAJO         %          
   �$  �$  `   >   (   
                                   }$         HEXD INICIO Time: ?HEXD:HEXD_INICIO_TIME:PROMPT 
�%            %     L      �   �    �$                     s20 ?HEXD:HEXD_INICIO_TIME    �%  T4 &             d%  {%  `   L   T   
                                   `%         HEXD INICIO Hundreds: ?HEXD:HEXD_INICIO_HUNDREDS:PROMPT 
~&            �%     Z      �   �    �%                     s20 ?HEXD:HEXD_INICIO_HUNDREDS    {&  N7 �&             W&  r&  `   Z   T   
                                   S&         HEXD FIN Time: ?HEXD:HEXD_FIN_TIME:PROMPT 
`'            �&     h      �   �    �&                     s20 ?HEXD:HEXD_FIN_TIME    ]'  T4 �'             @'  T'  `   h   T   
                                   <'         HEXD FIN Hundreds: ?HEXD:HEXD_FIN_HUNDREDS:PROMPT 
N(            �'     v      �   �    �'                     s20 ?HEXD:HEXD_FIN_HUNDREDS    K(  N7 �(             *(  B(  `   v   T   
                                   &(         HEXD EMPLEADO: ?HEXD:HEXD_EMPLEADO:PROMPT 
-)            �(     �      �   �    �(                     s50 ?HEXD:HEXD_EMPLEADO 2       �)             )  $)  `   �   �   
                                   )         HEXD CONVENIO: ?HEXD:HEXD_CONVENIO:PROMPT 
*            �)     �      �   �    �)                     s10 ?HEXD:HEXD_CONVENIO 
                      �)  *  `   �   ,   
                                   �)         &2) General (cont.) ?TAB:2 &               t*                                `*      �*   HEXD TIPO: ?HEXD:HEXD_TIPO:PROMPT 
:+            �*           �   �    �*                     s10 ?HEXD:HEXD_TIPO 
       �+             !+  1+  `      ,   
                                   +         HEXD TIEMPO: ?HEXD:HEXD_TIEMPO:PROMPT 
,            �+     "      �   �    �+                     s5 ?HEXD:HEXD_TIEMPO        �,             �+  	,  `   "   (   
                                   �+         HEXD DENARIUS: ?HEXD:HEXD_DENARIUS:PROMPT 
�,            u,     0      �   �    f,                     n-7 ?HEXD:HEXD_DENARIUS                       �,  �,  `   0   (   
                                   �,         &OK ?OK WAOK.ICO Accept data and close the window Accept data and close the window 	7.  @         I-  �   �   1      V-  w-                          E-  M-                    &Cancel ?CANCEL WACANCEL.ICO Cancel operation Cancel operation 	�.  @          .  �   �   1      .  &.                          �-  .                     &Help ?HELP WAHELP.ICO See Help Window See Help Window 	    @          �.  �   �   1      �.  �.                          �.  �.                    Cabecera Horas Extra P47$QUICKWINDOW c/    �����  Microsoft Sans Serif personal.ico UpdateHorasExtras W5           �   ��   �   0  C/  S/  ./               x/          �/          $0                                 ?CURRENTTAB %�3             0            �   m                                       �0                  ?TAB:1 &               y0                                        �0   Mes: ?HEX:HEX_MES:PROMPT     
   �  �  
S1            �0           �   �    �0  �0                 n02 ?HEX:HEX_MES            
  �   �  �1  @         -1  :1     +   1                          C1          )1         A�o: ?HEX:HEX_ANIO:PROMPT     
   �  �  
<2            �1  �         �   �    �1  �1                 n04 ?HEX:HEX_ANIO            
  �   �  �2  @         2  #2  �   +   8                          ,2          2         Observaci�n: ?HEX:HEX_OBSERVACION:PROMPT     
   �  �  
;3            �2     B      �   �    �2  �2                 s30 ?HEX:HEX_OBSERVACION            
  �   �       @         3  "3     Q   �                          +3          	3         &Aceptar ?OK     
  ��������WAOK.ICO Accept data and close the window Accept data and close the window 	�4  @      	   �3  9   |   <      �3  �3              �3          �3  �3                    &Cancelar ?CANCEL     
  ��������WACANCEL.ICO Cancel operation Cancel operation 	    @      
   a4  }   |   <      �4  �4              i4          W4  y4                     Process HORASEXTRASCVS P58$PROGRESSWINDOW B5    �����  Microsoft Sans Serif �7            �   ��   ;   �5  5  25  5                                       D                                 ?PROGRESS:THERMOMETER        #C6             �5  �5        o                        Y@      ?PROGRESS:USERSTRING �6            .6         �   
       -6                      ?PROGRESS:PCTTEXT 7            �6         �   
       �6                     Cancel ?PROGRESS:CANCEL WACANCEL.ICO Cancel Process Cancel Process 	    @         �6  .   *   1      �6  
7                          �6  �6                     Cambiar Hora Extra Denarius P67$QUICKWINDOW �7    �����  Microsoft Sans Serif personal.ico UpdateHExtrasDenarius y>           �   ��   v   n8  �7  �7  y7               �7          �7          $0                                 ?CURRENTTAB %<             b8            �   T                                       �8                  ?TAB:1     
  ��������&               �8                        �8              c9   Reembolsos (%) ?HEXD:HEXD_REEMBOLSO:PROMPT:2         @  �  
�9            59  l   $      �   �    &9  S9                 n_7 ?HEXD:HEXD_DENARIUS               �   �  e:  @         �9  �9     4   /                          �9          �9         C�digo Denarius ?HEXD:HEXD_DENARIUS:PROMPT:2         @  �  
�:            8:     $      �   �    (:  U:                 ?CALLLOOKUP 	F;             �:  F   4                                                                    n_7.2 ?HEXD:HEXD_REEMBOLSOD 
             �   �      @         ;  -;  l   4   D                          6;          ;         &Aceptar ?OK     
  ��������WAOK.ICO Accept data and close the window Accept data and close the window 	�<  @         �;  &   ^   <      �;  �;              �;          �;  �;                    &Cancelar ?CANCEL     
  ��������WACANCEL.ICO Cancel operation Cancel operation 	?=  @      	   l<  t   \   <      �<  �<              t<          b<  �<                     n3 ?HEXCD:HEXCD_ID               �   �  �=  D      
   =  &=  F      /                          /=          =         s3 ?HEXD:HEXD_TIPOHORA                      �=  �=  }      <   
                                   �=         C�digo Horas Extra Denarius P78$QUICKWINDOW C>    �����  Microsoft Sans Serif personal.ico HorasEXtraDenariuis �A           �   �  �   �?  #>  3>  >               X>          e>          $0                                 ?BROWSE:1     
  ��������36C|M~C�digo~@n3@80L(2)|M~Concepto~C(0)@s50@0R(2)|M~HEXCD CODIGO~C(0)@n-7@0L(2)|M~HEXCD TIPO INTRANET~@s10@0L(2)|M~HEXCD TIPO HORA~@s3@         Browsing the HORAS_EXTRA_DENARIUS file u@  H         �>      ?           �   �?                  �>                 �?                   ����     &Select ?SELECT:2 WASELECT.ICO Select the Record Select the Record 	�@  D         :@  �   P   1      Q@  c@                          2@  D@                     ?CURRENTTAB %               �@            
  �                                       IA                  ?TAB:2 &               BA                                             Solicitud Ausencia P86$QUICKWINDOW �A    �����  Microsoft Sans Serif personal.ico SolicitudAusencia              �   ��  ,  �B  �A  �A  �A               �A          �A          $0                                 EMPLEADO/A ?GROUP1        �����  �J            pB        �  �                       xB          eB  C             Nro. de Legajo ?EPL:EMP_LEGAJO:PROMPT       �����  
�C             �B           �   �    �B  C                 N_5 ?EPL:EMP_LEGAJO              �   �  D  @         ZC  jC  $   &   <                          sC          VC        Buscar por Apellido ?CALLLOOKUP:PROMPT       �����  
fD             �C     G      �   �    �C  �C                 ?CALLLOOKUP clients.ico 	�D             ND  -   Y   (   (                                       ZD                     Nombre ?EPL:EMP_NOMBRE:PROMPT       �����  
aE             �D  �         �   �    �D  �D                 s31 ?EPL:EMP_NOMBRE 2             �����  �E   @         8E  HE  �                               QE          4E      �  Direcci�n ?EPL:EMP_DIRECCION:PROMPT       �����  
YF             �E  �   ,      �   �    �E  �E                 s25 ?EPL:EMP_DIRECCION              �����  �F   @      	   -F  @F  �   ,   �                          IF          )F      �  Convenio ?CON:CONV_CONVENIO:PROMPT       ��������
PG          
   �F  �   D      �   �    �F  �F                 s12 ?CON:CONV_CONVENIO              ���������G   @         $G  7G  �   D   �                          @G           G         Nro. Tel. ?EPL:EMP_NRO_TEL:PROMPT       ��������
DH             �G  �   \      �   �    �G  �G                 s15 ?EPL:EMP_NRO_TEL              ���������H   @         H  +H  �   \   k                          4H          H         Nro. Cel. ?EPL:EMP_NRO_CEL:PROMPT       ��������
8I             �H  >  \      �   �    �H  �H                 s15 ?EPL:EMP_NRO_CEL              ���������I   @         I  I  q  \   k                          (I          
I         ?LINE1     ���������I             �I  �          n   �I           E-mail ?EPL:EMP_EMAIL:PROMPT       ��������
jJ             �I  �   s      �   �    �I  �I                 s50 ?EPL:EMP_EMAIL 2             ��������     @         BJ  QJ  �   s   �                          ZJ          >J         DETALLE AUSENCIAS ?GROUP2            �                �J     �   �  �                       �J          �J  �K             ?LIST     
  ��������53L(1)|*~Inicio~C(0)@d17@53L(1)|*~Fin~C(0)@d17@0L(1)|*~DAU DIAS~C(0)@n-7@30C|*~D�as~@s20@92L(1)|*~Motivo~C(0)@s25@300L(1)|M*~Observaciones~C(0)@s255@         �L  �H         @K      VK  
   �   �  p                       FK                 �K                   ����     &Agregar ?INSERT     
    � �  wainsert.ico 	%M  @         pL  
     H                          xL          gL  �L                    &Modificar ?CHANGE     
    � �  wachange.ico 	�M  @          M  V     H                          M          �L  M                    Concepto M�dico ?CONCEPT     
  �   �  	0N   @         �M  �     Z                          �M          �M                         Validar ?VALIDATE     
   �  �  	�N   @         N  �    (                           N          N                         Anular ?CANCEL     
  �   �  	<O   @         �N  �    (                          �N          �N                         &Borrar ?DELETE     
    � �  wadelete.ico 	�O  D         O  $   �   H                          O          O  /O                    Certificado ?CERTIFICATE     
   �� ����	FP   @         �O  K    7                          �O          �O                         Reporte ?REPORTE     
  ��������	     @         -P  �        �   �                    6P          %P                         