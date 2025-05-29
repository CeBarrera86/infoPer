

   MEMBER('infoper.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('INFOPER027.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('INFOPER024.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
wndViewImage PROCEDURE (ImageExBitmapClass picOrigen,string Titulo)

LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
TheBitmap   IMAGEEXBITMAPCLASS
JpgSaver    ImageExJpegSaverClass
Settings    LIKE(IMAGEEXCONVOLUTIONSETTINGS)
QuickWindow          WINDOW('Visualizar Imagen'),AT(,,260,280),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('wndViewPicture'),SYSTEM
                       REGION,AT(5,25,250,250),USE(?Viewer)
                       BUTTON,AT(24,5,15,15),USE(?ZoomIn),ICON('zoomIn.ico')
                       BUTTON,AT(43,5,15,15),USE(?ZoomOut),ICON('zoomOut.ico')
                       BUTTON,AT(73,5,15,15),USE(?rotateIzq),ICON('rotleft.ico')
                       BUTTON,AT(92,5,15,15),USE(?rotateDer),ICON('rotright.ico')
                       BUTTON,AT(5,5,15,15),USE(?ZoomFit),ICON('ZoomToFit.ico')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

ImgViewer            CLASS(ImageExViewerClass)
                     END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  ImgViewer.Init(QuickWindow, ?Viewer)
  ImgViewer.SetBkColor(0)
  ImgViewer.Bitmap.SetStretchFilter(IMAGEEXSTRETCHFILTER:Nearest)
  ImgViewer.Bitmap.SetDrawMode(IMAGEEXDRAWMODE:Opaque)
  ImgViewer.Bitmap.SetMasterAlpha(255)
  ImgViewer.SetZoomPercent(100)
  ImgViewer.SetAllowFocus(0)
  ImgViewer.SetScrollsVisible(1)
  ImgViewer.SetMouseMode(1*IEMM:PAN + 0*IEMM:ZoomWheel + 1 * IEMM:HOTSPOTS)
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('wndViewImage')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Viewer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  ImgViewer.Bitmap.Assign(picOrigen)    
  QuickWindow{PROP:Text}=Titulo
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ZoomIn
      ThisWindow.Update()
      ImgViewer.ZoomIn()
      Select(?Viewer)
    OF ?ZoomOut
      ThisWindow.Update()
      ImgViewer.ZoomOut()
      Select(?Viewer)
    OF ?rotateIzq
      ThisWindow.Update()
      ImgViewer.Bitmap.Rotate270()
      Select(?Viewer)
    OF ?rotateDer
      ThisWindow.Update()
      ImgViewer.Bitmap.Rotate90()
      Select(?Viewer)
    OF ?ZoomFit
      ThisWindow.Update()
      ImgViewer.ZoomToFit()
      Select(?Viewer)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ExtractFileExt       PROCEDURE  (STRING Filename)          ! Declare Procedure
Path  CSTRING(FILE:MAXFILENAME)
Drive CSTRING(FILE:MAXFILENAME)
Dir   CSTRING(FILE:MAXFILENAME)
Name  CSTRING(FILE:MAXFILENAME)
Ext   CSTRING(FILE:MAXFILENAME)

  CODE
   Path = clip(Filename)

   if fnsplit(Path, Drive, Dir, Name, Ext)
      return clip(ext)
   else
      Return ''
   end
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SaveImage PROCEDURE (ImageExBitmapClass Bmp,BOOL ShowOptions,<string filename>)

Loc:Filename         STRING(255)                           !
Loc:SaveFilename     STRING(255)                           !
Loc:CString          CSTRING(256)                          !
Loc:TiffAppend       SIGNED                                !
LocalRequest         LONG                                  !
OriginalRequest      LONG                                  !
LocalResponse        LONG                                  !
FilesOpened          BYTE                                  !
WindowOpened         LONG                                  !
WindowInitialized    LONG                                  !
ForceRefresh         LONG                                  !
JpegCompression      SIGNED                                !
JpegProgressive      SIGNED                                !
GifPalette           STRING(20)                            !
GifDither            STRING(20)                            !
GifCompression       SIGNED                                !
PngCompression       SIGNED                                !
PngInterlaced        SIGNED                                !
PngSaveAlpha         SIGNED                                !
PcxCompress          SIGNED                                !
Jpeg2000Compression  REAL                                  !
Loc:Result           SIGNED                                !
FileSize             SIGNED                                !
TiffCompr            STRING(20)                            !
TiffResolution       SIGNED                                !
PdfCompression       STRING(20)                            !
PdfPaperWidth        SIGNED                                !
PdfPaperHeight       SIGNED                                !
PsCompression        STRING(20)                            !
PsPaperWidth         SIGNED                                !
PsPaperHeight        SIGNED                                !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
BmpSaver    IMAGEEXBMPSAVERCLASS
JpgSaver    IMAGEEXJPEGSAVERCLASS
TgaSaver    IMAGEEXTARGASAVERCLASS
PngSaver    IMAGEEXPNGSAVERCLASS
PcxSaver    IMAGEEXPCXSAVERCLASS
GifSaver    IMAGEEXGIFSAVERCLASS
TifSaver    IMAGEEXTIFFSAVERCLASS
JP2Saver    IMAGEEXJP2SAVERCLASS
J2KSaver    IMAGEEXJ2KSAVERCLASS
PDFSaver    IMAGEEXPDFSAVERCLASS
PsSaver     IMAGEEXPSSAVERCLASS

PreviewVisible BOOL(True)
Window               WINDOW('Saving options'),AT(,,236,212),FONT('MS Sans Serif',8,,FONT:regular,CHARSET:ANSI), |
  DOUBLE,CENTER,GRAY,SYSTEM
                       SHEET,AT(0,0,161,95),USE(?Sheet1),BELOW
                         TAB('JPEG'),USE(?JpegTab)
                           GROUP('JPEG options'),AT(8,8,145,65),USE(?Group1),BOXED
                             PROMPT('Quality:'),AT(12,20),USE(?JpegCompression:Prompt)
                             SPIN(@n_3),AT(40,20,29,12),USE(JpegCompression),RIGHT,RANGE(0,100)
                             STRING('(100=best, 0=lowest)'),AT(76,20),USE(?String1)
                             CHECK('Pr&ogressive'),AT(40,40),USE(JpegProgressive),RIGHT
                           END
                         END
                         TAB('GIF'),USE(?GifTab)
                           GROUP('GIF options'),AT(8,8,145,65),USE(?Group2),BOXED
                             LIST,AT(60,20,68,12),USE(GifPalette),DROP(5),FROM('Optimal|System|Web')
                             PROMPT('P&alette:'),AT(15,21),USE(?GifPalette:Prompt)
                             PROMPT('&Dithering:'),AT(15,41),USE(?GifDither:Prompt)
                             LIST,AT(60,40,68,12),USE(GifDither),DROP(10),FROM('Nearest|FloydSteinberg|Stucki|Sierra' & |
  '|JaJuNi|SteveArche|Burkes')
                             STRING('Compression:'),AT(16,58),USE(?String11)
                             OPTION,AT(60,56,73,14),USE(GifCompression)
                               RADIO('LZW'),AT(60,58),USE(?GifCompression:Radio1),VALUE('2')
                               RADIO('RLE'),AT(92,58),USE(?GifCompression:Radio2),VALUE('1')
                             END
                           END
                         END
                         TAB('PNG'),USE(?PngTab)
                           GROUP('PNG options'),AT(8,8,145,65),USE(?Group3),BOXED
                             SPIN(@n1),AT(80,20,29,12),USE(PngCompression),RIGHT,RANGE(0,9)
                             PROMPT('&Compression level:'),AT(16,21),USE(?PngCompression:Prompt)
                             STRING('(9=best)'),AT(112,24),USE(?String2)
                             CHECK('&Interlaced'),AT(68,40),USE(PngInterlaced),RIGHT
                             CHECK('&Save alpha channel'),AT(68,52),USE(PngSaveAlpha),RIGHT
                           END
                         END
                         TAB('TIFF'),USE(?TiffTab)
                           GROUP('TIFF options'),AT(8,8,145,65),USE(?Group5),BOXED
                             PROMPT('&Compression:'),AT(16,21),USE(?Prompt5)
                             LIST,AT(72,20,68,12),USE(TiffCompr),DROP(10),FROM('None|CCITT|Group 3|Group 4|LZW|Jpeg|Packbits')
                             PROMPT('&Resolution:'),AT(16,40),USE(?TiffResolution:Prompt)
                             ENTRY(@n_3),AT(72,40),USE(TiffResolution),RIGHT
                             STRING('DPI'),AT(100,41),USE(?String6)
                           END
                         END
                         TAB('PCX'),USE(?PcxTab)
                           GROUP('PCX options'),AT(8,8,145,65),USE(?Group6),BOXED
                             CHECK('use &RLE compression'),AT(16,24),USE(PcxCompress),RIGHT
                           END
                         END
                         TAB('J2000'),USE(?J2000Tab)
                           GROUP('JPEG 2000 options'),AT(8,8,145,65),USE(?Group7),BOXED
                             PROMPT('&Compression:'),AT(16,21),USE(?Jpeg2000Compression:Prompt)
                             SPIN(@n3.1),AT(68,20,29,12),USE(Jpeg2000Compression),RIGHT,RANGE(0,1),STEP(0.1)
                             STRING('(1.0 = lossless)'),AT(68,36),USE(?String3)
                           END
                         END
                         TAB('PDF'),USE(?PdfTab)
                           GROUP('PDF options'),AT(8,8,145,65),USE(?GroupX),BOXED
                             PROMPT('&Compression:'),AT(16,21),USE(?PdfCompression:Prompt)
                             LIST,AT(72,20,68,12),USE(PdfCompression),LEFT,DROP(5),FROM('None|RLE|Group4|Group3|JPEG')
                             PROMPT('Paper &width:'),AT(16,37),USE(?PdfPaperWidth:Prompt)
                             ENTRY(@n_4),AT(72,36),USE(PdfPaperWidth),RIGHT
                             PROMPT('Paper &height:'),AT(16,53),USE(?PdfPaperHeight:Prompt)
                             ENTRY(@n_4),AT(72,52),USE(PdfPaperHeight),RIGHT
                             STRING('points'),AT(104,37),USE(?String7)
                             STRING('points'),AT(104,53),USE(?String7:2)
                           END
                         END
                         TAB('PS'),USE(?PsTab)
                           GROUP('PostScript options'),AT(8,8,145,65),USE(?GroupY),BOXED
                             PROMPT('&Compression:'),AT(16,21),USE(?PsCompression:Prompt)
                             LIST,AT(72,20,68,12),USE(PsCompression),LEFT,DROP(5),FROM('RLE|Group4|Group3|JPEG')
                             PROMPT('Paper &width:'),AT(16,37),USE(?PsPaperWidth:Prompt)
                             ENTRY(@n_4),AT(72,36),USE(PsPaperWidth),RIGHT
                             PROMPT('Paper &height:'),AT(16,53),USE(?PsPaperHeight:Prompt)
                             ENTRY(@n_4),AT(72,52),USE(PsPaperHeight),RIGHT
                             STRING('points'),AT(104,37),USE(?String7:2:2:2)
                             STRING('points'),AT(104,53),USE(?String7:2:2:2:2)
                           END
                         END
                       END
                       BUTTON('OK'),AT(172,8,53,16),USE(?OkButton),LEFT,DEFAULT
                       BUTTON('Cancel'),AT(172,32,53,16),USE(?CancelButton),LEFT
                       BUTTON('&Preview <<<<'),AT(172,56,53,16),USE(?Preview)
                       STRING(@s20),AT(40,200),USE(FileSize)
                       REGION,AT(13,89,210,99),USE(?Viewer)
                       STRING('File size:'),AT(8,200),USE(?String5)
                       GROUP('&Preview'),AT(8,80,221,114),USE(?Group4),BOXED
                       END
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ImageExViewer2       CLASS(ImageExViewerClass)
                     END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(Loc:Result)

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
CreatePreview  ROUTINE

   Do SetOptions
   if Not PreviewVisible then exit.

   ! We save to a blob here to avoid having to deal with temporary files...
   case Upper(ExtractFileExt(loc:savefilename))
   of '.JPG'
      Bmp.SaveToBlob(SQB:IMAGEN, JpgSaver)
   of '.GIF'
      Bmp.SaveToBlob(SQB:IMAGEN, GifSaver)
   of '.PNG'
     if ~Bmp.SaveToBlob(SQB:IMAGEN, PngSaver)
         Message('Saving PNG to blob failed!')
     else
         Message(SQB:IMAGEN{PROP:SIZE})
     end
   of '.TIF'
      Bmp.SaveToBlob(SQB:IMAGEN, TifSaver)
   of '.PCX'
      Bmp.SaveToBlob(SQB:IMAGEN, PcxSaver)
   of '.JP2'
      Bmp.SaveToBlob(SQB:IMAGEN, Jp2Saver)
   of '.J2K'
      Bmp.SaveToBlob(SQB:IMAGEN, J2KSaver)
   of '.PDF'
      Bmp.SaveToBlob(SQB:IMAGEN, PdfSaver)
   of '.PS'
      Bmp.SaveToBlob(SQB:IMAGEN, PsSaver)
   end
   ImageExViewer2.Bitmap.LoadFromBlob(SQB:IMAGEN)

   FileSize = SQB:IMAGEN{PROP:SIZE}

SetOptions  ROUTINE

   case Upper(ExtractFileExt(loc:savefilename))
   of '.JPG'
      JpgSaver.CompressionQuality = JpegCompression
      JpgSaver.Progressive      = JpegProgressive
   of '.GIF'
      Case GifPalette
      of 'Optimal'
         GifSaver.ColorReduction = IECR:QUANTIZE
      of 'System'
         GifSaver.ColorReduction = IECR:WINDOWS256
      of 'Web'
         GifSaver.ColorReduction = IECR:NETSCAPE
      else
         Message('Unknown palette: ' & GifPalette, 'Huh?', Icon:Hand)
      end
      GifSaver.DitherMode = Choice(?GifDither)-1
      GifSaver.Compression = GifCompression
   of '.PNG'
      PngSaver.CompressionLevel = PngCompression
      PngSaver.Interlaced       = PngInterlaced
      PngSaver.SaveAlpha        = PngSaveAlpha
   of '.TIF'
      Case TiffCompr
      of 'None'
         TifSaver.Compression = IECA:NONE
      of 'CCITT'
         TifSaver.Compression = IECA:CCITT
      of 'Group 3'
         TifSaver.Compression = IECA:GROUP3
      of 'Group 4'
         TifSaver.Compression = IECA:GROUP4
      of 'LZW'
         TifSaver.Compression = IECA:LZW
      of 'Jpeg'
         TifSaver.Compression = IECA:JPEG
      of 'Packbits'
         TifSaver.Compression = IECA:PACKBITS
      else
         Message('Error: Unknown Tiff compression!', 'ERROR', ICON:HAND)
      end
      TifSaver.Resolution = 300
   of '.PCX'
      PcxSaver.Compression       = PcxCompress
   of '.JP2' orof '.J2K'
      Jp2Saver.CompressionQuality = Jpeg2000Compression
      J2KSaver.CompressionQuality = Jpeg2000Compression
   of '.PDF'
      Case PdfCompression
      of 'None'
         PdfSaver.Compression   = IECA:None
      of 'Group4'
         PdfSaver.Compression   = IECA:Group4
      of 'Group3'
         PdfSaver.Compression   = IECA:Group3
      of 'RLE'
         PdfSaver.Compression   = IECA:RLE
      of 'JPEG'
         PdfSaver.Compression   = IECA:Jpeg
      else
         Message('Error: Unknown PDF compression!', 'ERROR', ICON:HAND)
      end
      PdfSaver.PaperWidth       = PdfPaperWidth
      PdfSaver.PaperHeight      = PdfPaperHeight
   of '.PS'
      Case PsCompression
      of 'Group4'
         PsSaver.Compression   = IECA:Group4
      of 'Group3'
         PsSaver.Compression   = IECA:Group3
      of 'RLE'
         PsSaver.Compression   = IECA:RLE
      of 'JPEG'
         PsSaver.Compression   = IECA:Jpeg
      else
         Message('Error: Unknown PostScript compression!', 'ERROR', ICON:HAND)
      end
      PsSaver.PaperWidth       = PsPaperWidth
      PsSaver.PaperHeight      = PsPaperHeight
   end

ThisWindow.Ask PROCEDURE

  CODE
   PictureDialogResult# = ImageEx:PictureDialog(, Loc:SaveFilename, 'JPEG images (*.jpg)|*.jpg|Portable network graphic images  (*.png)|*.png|CompuServe images  (*.gif)|*.gif|Windows bitmaps (*.bmp)|*.bmp|ZSoft Paintbrush images (*.pcx)|*.pcx|Truevision images (*.tga)|*.tga|TIFF images (*.tif)|*.tif|Jpeg 2000 Codestream (*.j2k)|*.j2k|Jpeg 2000 file (*.jp2)|*.jp2|Portable Document Format (*.pdf)|*.pdf|PostScript (*.ps)|*.ps', FILE:SAVE+FILE:KEEPDIR+FILE:APPENDEXTENSION+FILE:NOERROR)
   if PictureDialogResult#
  
        ! Since we turned off error reporting for the PictureDialog (FILE:NOERROR)
        ! to be able to append images to existing TIFF files, we'll have to check for
        ! existance of the file ourselves here...
        Loc:Cstring = clip(Loc:SaveFileName)
        if Access(Loc:CString, 0) = 0 ! File exists
           if Upper(ExtractFileExt(loc:SaveFilename)) = '.TIF'
              Case Message('Append image to existing file?', 'CIMP', ICON:QUESTION, BUTTON:YES+BUTTON:NO+BUTTON:CANCEL)
              of Button:Yes
                 Loc:TiffAppend = true
              of Button:No
                 Loc:TiffAppend = false
              else
                 ThisWindow.Kill
              end
           else
              Loc:TiffAppend = false
              if Message('Replace existing file?', 'CIMP', ICON:QUESTION, BUTTON:YES+BUTTON:NO) <> BUTTON:YES
                 ThisWindow.Kill
              end
           end
        end
  
  
      bmp.GetSize(w#, h#)
      PDFSaver.PaperWidth  = w#
      PDFSaver.PaperHeight = h#
  
      PsSaver.PaperWidth  = w#
      PsSaver.PaperHeight = h#
  
      case upper(ExtractFileExt(loc:savefilename))
      of '.BMP'
        LocalResponse = RequestCompleted
        ThisWindow.Kill()
      of '.TGA'
        LocalResponse = RequestCompleted
        ThisWindow.Kill()
      of '.JPG'
        if not ShowOptions
           LocalResponse = RequestCompleted
           ThisWindow.Kill()
        else
           ThisWindow.FirstField = ?JpegTab
        end
      of '.GIF'
        if not ShowOptions
           LocalResponse = RequestCompleted
           ThisWindow.Kill()
        else
           ThisWindow.FirstField = ?GifTab
        end
      of '.PNG'
        if not ShowOptions
           LocalResponse = RequestCompleted
           ThisWindow.Kill()
        else
           ThisWindow.FirstField = ?PngTab
        end
      of '.TIF'
        if not ShowOptions
           LocalResponse = RequestCompleted
           ThisWindow.Kill()
        else
           ThisWindow.FirstField = ?TiffTab
        end
      of '.PCX'
         if not ShowOptions
            LocalResponse = RequestCompleted
            ThisWindow.Kill()
         else
           ThisWindow.FirstField = ?PcxTab
         end
      of '.JP2' orof '.J2K'
         if not ShowOptions
            LocalResponse = RequestCompleted
            ThisWindow.Kill()
         else
           ThisWindow.FirstField = ?J2000Tab
         end
      of '.PDF'
        if not ShowOptions
           LocalResponse = RequestCompleted
           ThisWindow.Kill()
         else
           ThisWindow.FirstField = ?PdfTab
            Disable(?Preview)
            Post(event:Accepted, ?Preview)
        end
      of '.PS'
        if not ShowOptions
           LocalResponse = RequestCompleted
           ThisWindow.Kill()
         else
           ThisWindow.FirstField = ?PsTab
            Disable(?Preview)
            Post(event:Accepted, ?Preview)
        end
      else
        Message('Unsupported file type for saving!')
        Loc:Result = false
        ThisWindow.Kill()
      end
   else
     Loc:Result = false
     THisWindow.Kill()
   end
  ImageExViewer2.Init(Window, ?Viewer)
  ImageExViewer2.SetBkColor(8421504)
  ImageExViewer2.Bitmap.SetStretchFilter(IMAGEEXSTRETCHFILTER:Nearest)
  ImageExViewer2.Bitmap.SetDrawMode(IMAGEEXDRAWMODE:Opaque)
  ImageExViewer2.Bitmap.SetMasterAlpha(255)
  ImageExViewer2.SetChessColor(16777215)
  ImageExViewer2.SetChessSize(15)
  ImageExViewer2.SetZoomPercent(100)
  ImageExViewer2.SetAllowFocus(1)
  ImageExViewer2.SetScrollsVisible(0)
  ImageExViewer2.SetMouseMode(1*IEMM:PAN + 1*IEMM:ZoomWheel + 1 * IEMM:HOTSPOTS)
     ImageExViewer2.Bitmap.Assign(bmp)
  
     ?Sheet1{PROP:WIZARD}  = true
     ?Sheet1{PROP:NOSHEET} = true
  
     JpegCompression = JpgSaver.CompressionQuality
     JpegProgressive = JpgSaver.Progressive
  
     GifPalette = 'Optimal'
     GifDither = 'FloydSteinberg'
  
     ?GifDither{PROP:SELECTED} = 1
  
     PngCompression = PngSaver.CompressionLevel
     PngInterlaced = PngSaver.Interlaced
  
     PcxCompress = PcxSaver.Compression
     Jpeg2000Compression = JP2Saver.CompressionQuality
  
     TiffCompr = 'None'
     TiffResolution = 300
  
     PdfCompression = 'None'
     PdfPaperWidth  = PdfSaver.PaperWidth
     PdfPaperHeight = PdfSaver.PaperHeight
  
     PsCompression = 'RLE'
     PsPaperWidth  = PsSaver.PaperWidth
     PsPaperHeight = PsSaver.PaperHeight
  
     GifCompression = GifSaver.Compression
  
     Do CreatePreview
  
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SaveImage')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?JpegCompression:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Loc:SaveFilename = filename
  Relate:SQLBLOB.Open                                      ! File SQLBLOB used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SQLBLOB.Close
  END
     if LocalResponse = RequestCompleted
        case Upper(ExtractFileExt(loc:savefilename))
        of '.BMP'
           Loc:result = bmp.SaveToFile(loc:savefilename, BmpSaver)
        of '.TGA'
           Loc:Result = bmp.SaveToFile(loc:savefilename, TgaSaver)
        of '.PCX'
           Loc:Result = bmp.SaveToFile(loc:savefilename, PcxSaver)
        of '.JPG'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, JpgSaver)
        of '.GIF'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, GifSaver)
        of '.PNG'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, PngSaver)
        of '.TIF'
           if ~Loc:TiffAppend
              Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, TifSaver)
           else
              Loc:Result = TifSaver.InsertIntoFile(Loc:SaveFilename, -1, Bmp)
           end
        of '.JP2'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, JP2Saver)
        of '.J2K'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, J2KSaver)
        of '.PDF'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, PdfSaver)
        of '.PS'
           Loc:Result = Bmp.SaveToFile(Loc:SaveFilename, PsSaver)
        end
  
        if ~Loc:Result then
           MESSAGE('Error saving file!', 'ImageEx', ICON:HAND)
        end
     else
        loc:result = false
     end
  
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?GifPalette
         Do CreatePreview
      
    OF ?GifDither
         Do CreatePreview
      
    OF ?PngCompression
         Do CreatePreview
      
    OF ?PngInterlaced
         Do CreatePreview
      
    OF ?PdfPaperWidth
         Do CreatePreview
      
    OF ?PdfPaperHeight
         Do CreatePreview
      
    OF ?CancelButton
         LocalResponse = RequestCancelled
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?JpegCompression
         do CreatePreview
      
    OF ?GifCompression
         Do CreatePreview
      
    OF ?PngSaveAlpha
         Do CreatePreview
      
    OF ?TiffCompr
         Do CreatePreview
      
    OF ?PcxCompress
         Do CreatePreview
      
    OF ?Jpeg2000Compression
         Do CreatePreview
      
    OF ?PdfCompression
         Do CreatePreview
      
    OF ?OkButton
      ThisWindow.Update()
         LocalResponse = RequestCompleted
      
         if upper(ExtractFileExt(loc:savefilename)) = '.TIF'
            c# = Bmp.CountColors()
            if c# > 2 and Inrange(Choice(?TiffCompr),2,4)
               if Message('You have selected a monochrome compression format, but your image currently has ' & c# & ' colors. You might want to reduce colors before saving to avoid quality loss. | | Continue saving?', 'ImageEx', ICON:QUESTION, BUTTON:YES+BUTTON:NO) <> BUTTON:YES
                  LocalResponse = RequestCancelled
               END
            end
         end
      
         LocalResponse = RequestCompleted
       POST(EVENT:CloseWindow)
    OF ?Preview
      ThisWindow.Update()
         if PreviewVisible
            PreviewVisible = false
            Window{PROP:HEIGHT} = ?OkButton{PROP:YPOS} + ?Preview{PROP:YPOS} + ?Preview{PROP:HEIGHT}
            ?Preview{PROP:TEXT} = '&Preview >>'
         else
            PreviewVisible = true
            Window{PROP:HEIGHT} = ?OkButton{PROP:YPOS} + ?FileSize{PROP:YPOS} + ?FileSize{PROP:HEIGHT}
            ?Preview{PROP:TEXT} = '&Preview <<<<'
         end
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?PngCompression
         Do CreatePreview
      
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?JpegCompression
         do CreatePreview
      
    OF ?Jpeg2000Compression
         Do CreatePreview
      
    OF ?PdfCompression
         Do CreatePreview
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ExtractFilePath      PROCEDURE  (STRING Filename)          ! Declare Procedure
Path  CSTRING(FILE:MAXFILENAME)
Drive CSTRING(FILE:MAXFILENAME)
Dir   CSTRING(FILE:MAXFILENAME)
Name  CSTRING(FILE:MAXFILENAME)
Ext   CSTRING(FILE:MAXFILENAME)

  CODE
   Path = clip(Filename)
   if fnsplit(Path, Drive, Dir, Name, Ext)
      return clip(Drive) & clip(Dir)
   else
      Return ''
   end
!!! <summary>
!!! Generated from procedure template - Report
!!! Report the SQLBLOB File
!!! </summary>
PrintCert PROCEDURE (ImageExBitmapClass picOrigen, string titulo)

Progress:Thermometer BYTE                                  !
imptitulo            STRING(150)                           !
Process:View         VIEW(DETALLE_AUSENCIA)
                       PROJECT(DAU:DAU_ID)
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
ProgressWindow       WINDOW('Report SQLBLOB'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('SQLBLOB Report'),AT(0,0,210,285),PRE(RPT),PAPER(PAPER:A4),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),MM
                       HEADER,AT(0,3,210,5),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING(@s150),AT(0,0,210,5),USE(imptitulo),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  CENTER
                       END
Detail                 DETAIL,AT(0,0,210,5),USE(?Detail)
                       END
                       FOOTER,AT(0,287,210,5),USE(?Footer)
                         STRING('Date:'),AT(7,0,9,3),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(16,0,23,3),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPage <<#p),AT(183,0,18,3),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(0,8,210,280),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,205,280),USE(?ImageEx)
                       END
                     END
    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(ReportManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Init                   PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
JpgSaver            IMAGEEXJPEGSAVERCLASS
ImageEx4             ImageExImageClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  ImageEx4.Window &= Report
  ImageEx4.FEQ = ?ImageEx
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PrintCert')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:DETALLE_AUSENCIA.Open                             ! File DETALLE_AUSENCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  WinAlertMouseZoom()
  picOrigen.SaveToBlob(SQB:IMAGEN,JPGSAVER)
  imptitulo = titulo
  Do DefineListboxStyle
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:DETALLE_AUSENCIA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, DAU:DAU_ID)
  ThisReport.AddSortOrder(DAU:PK_DAU_ID)
  ThisReport.AddRange(DAU:DAU_ID,)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:DETALLE_AUSENCIA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE(ProcessClass PC,<REPORT R>,<PrintPreviewClass PV>)

  CODE
  PARENT.Init(PC,R,PV)
  WinAlertMouseZoom()


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:DETALLE_AUSENCIA.Close
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
     ImageEx4.LoadFromBlob(SQB:IMAGEN, , )
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Form RECORDATORIOS
!!! </summary>
FormRECORDATORIO PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
Loc:Opcion           BYTE                                  !
Loc:Convenio         BYTE                                  !
Loc:str              STRING(255)                           !
QRecordatorio        QUEUE,PRE()                           !
QLegajo              SHORT                                 !
                     END                                   !
FDCB4::View:FileDropCombo VIEW(CONVENIO)
                       PROJECT(CON:CONV_CONVENIO)
                       PROJECT(CON:CONV_ID)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CON:CONV_CONVENIO
CON:CONV_CONVENIO      LIKE(CON:CONV_CONVENIO)        !List box control field - type derived from field
CON:CONV_ID            LIKE(CON:CONV_ID)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::PWR:Record  LIKE(PWR:RECORD),THREAD
QuickWindow          WINDOW('RECORDATORIO'),AT(,,135,260),FONT('Microsoft Sans Serif',10,,FONT:bold,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('FormRECORDATORIO'),SYSTEM
                       BUTTON('&Aceptar'),AT(34,241,47,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(84,241,47,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       GROUP,AT(56,5,74,75),USE(?Empleado),BOXED
                         BUTTON,AT(110,18,15,15),USE(?CallLookup),ICON('Administrator.ico')
                         ENTRY(@P<<<<#PB),AT(60,19,44,14),USE(EPL:EMP_LEGAJO),FONT(,14,COLOR:Blue,FONT:bold),CENTER
                         COMBO(@s21),AT(61,39,64,14),USE(CON:CONV_CONVENIO),UPR,DROP(5),FORMAT('84L(1)|M@s21@'),FROM(Queue:FileDropCombo), |
  IMM
                         STRING('¡El mensaje se enviará'),AT(60,58,65,8),USE(?STRING1),FONT(,,COLOR:Red,FONT:regular+FONT:italic), |
  TRN
                         STRING('a todos los empleados!'),AT(60,66,65,8),USE(?STRING2),FONT(,,COLOR:Red,FONT:regular+FONT:italic)
                       END
                       GROUP('Fechas'),AT(5,85,125,50),USE(?Fechas),BOXED
                         PROMPT('DESDE:'),AT(10,98,,11),USE(?PWR:PWR_DFECHA_DATE:Prompt),FONT(,12),TRN
                         ENTRY(@d17),AT(56,96,44,14),USE(PWR:PWR_DFECHA_DATE),FONT(,10,,FONT:regular),CENTER,READONLY, |
  REQ
                         BUTTON,AT(110,96,15,15),USE(?Calendar:Desde),ICON('CALENDAR.ICO')
                         PROMPT('HASTA:'),AT(12,116,,11),USE(?PWR:PWR_HFECHA_DATE:Prompt),FONT(,12),TRN
                         ENTRY(@d17),AT(56,114,44,14),USE(PWR:PWR_HFECHA_DATE),FONT(,10,,FONT:regular),CENTER,READONLY, |
  REQ
                         BUTTON,AT(110,114,15,15),USE(?Calendar:Hasta),ICON('CALENDAR.ICO')
                       END
                       TEXT,AT(5,156,125,80),USE(PWR:PWR_TEXTO),FONT(,,,FONT:regular),REQ
                       PROMPT('MENSAJE:'),AT(5,140,40,11),USE(?PWR:PWR_TEXTO:Prompt),FONT(,12),TRN
                       OPTION('Método'),AT(5,5,50,75),USE(Loc:Opcion),BOXED
                         RADIO('Individual'),AT(9,20,42),USE(?OPTION:Individual),FONT(,12),VALUE('1')
                         RADIO('Convenio'),AT(9,40,42),USE(?OPTION:Convenio),FONT(,12),VALUE('2')
                         RADIO('Masivo'),AT(9,60,42),USE(?OPTION:Masivo),FONT(,12),VALUE('3')
                       END
                     END
SSEC::Viewing        BYTE(0)

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Calendar9            CalendarClass
Calendar10           CalendarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB4                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  GLO:oneInstance_FormRECORDATORIO_thread = 0

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Recordatorio'
  OF InsertRecord
    ActionMessage = 'Se agregará nuevo Recordatorio'
  OF ChangeRecord
    ActionMessage = 'El Recordatorio será modificado'
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SSEC::Viewing    = SSEC::ViewRecord
  SSEC::ViewRecord = False
  GlobalErrors.SetProcedureName('FormRECORDATORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PWR:Record,History::PWR:Record)
  SELF.AddHistoryField(?PWR:PWR_DFECHA_DATE,4)
  SELF.AddHistoryField(?PWR:PWR_HFECHA_DATE,8)
  SELF.AddHistoryField(?PWR:PWR_TEXTO,10)
  SELF.AddUpdateFile(Access:PER_WEBREC)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:PER_WEBREC.Open                                   ! File PER_WEBREC used by this procedure, so make sure it's RelationManager is open
  Relate:TMPUsosMultiples.Open                             ! File TMPUsosMultiples used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PER_WEBREC
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  Security.PrepareViewWindow(SSEC::Viewing, ?Cancel)
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?CallLookup)
    ?EPL:EMP_LEGAJO{PROP:ReadOnly} = True
    DISABLE(?CON:CONV_CONVENIO)
    ?PWR:PWR_DFECHA_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar:Desde)
    ?PWR:PWR_HFECHA_DATE{PROP:ReadOnly} = True
    DISABLE(?Calendar:Hasta)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  IF Loc:Opcion = '1'
     HIDE(?STRING1)
     HIDE(?STRING2)
     DISABLE(?CON:CONV_CONVENIO)
     ENABLE(?CallLookup)
     ENABLE(?EPL:EMP_LEGAJO)
  END
  IF Loc:Opcion <> '1'
     DISABLE(?EPL:EMP_LEGAJO)
     DISABLE(?CallLookup)
  END
  IF Loc:Opcion = '2'
     HIDE(?STRING1)
     HIDE(?STRING2)
     DISABLE(?EPL:EMP_LEGAJO)
     DISABLE(?CallLookup)
     ENABLE(?CON:CONV_CONVENIO)
  END
  IF Loc:Opcion <> '2'
     DISABLE(?CON:CONV_CONVENIO)
  END
  IF Loc:Opcion = '3'
     UNHIDE(?STRING1)
     UNHIDE(?STRING2)
     DISABLE(?EPL:EMP_LEGAJO)
     DISABLE(?CallLookup)
     DISABLE(?CON:CONV_CONVENIO)
  END
  IF Loc:Opcion <> '3'
     HIDE(?STRING1)
     HIDE(?STRING2)
  END
  SELF.AddItem(ToolbarForm)
  FDCB4.Init(CON:CONV_CONVENIO,?CON:CONV_CONVENIO,Queue:FileDropCombo.ViewPosition,FDCB4::View:FileDropCombo,Queue:FileDropCombo,Relate:CONVENIO,ThisWindow,GlobalErrors,0,1,0)
  FDCB4.Q &= Queue:FileDropCombo
  FDCB4.AddSortOrder(CON:PK_CONVENIO)
  FDCB4.AddField(CON:CONV_CONVENIO,FDCB4.Q.CON:CONV_CONVENIO) !List box control field - type derived from field
  FDCB4.AddField(CON:CONV_ID,FDCB4.Q.CON:CONV_ID) !Primary key field - type derived from field
  FDCB4.AddUpdateField(CON:CONV_ID,Loc:Convenio)
  ThisWindow.AddItem(FDCB4.WindowComponent)
  FDCB4.DefaultFill = 0
  SELF.SetAlerts()
  !IF SELF.Request = InsertRecord THEN
      EPL:EMP_LEGAJO = ''
      CON:CONV_CONVENIO = ''
  !ELSE
  !    EPL:EMP_LEGAJO = PWR:PWR_LEGAJO
  !END
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:PER_WEBREC.Close
    Relate:TMPUsosMultiples.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  PWR:PWR_DFECHA_TIME = 0
  PWR:PWR_HFECHA_TIME = 0
  PWR:PWR_UFECHA_DATE = TODAY()
  PWR:PWR_UFECHA_TIME = CLOCK()
  PWR:PWR_USER = Glo:Usuario2
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  EPL:EMP_LEGAJO = PWR:PWR_LEGAJO                          ! Assign linking field value
  Access:EMPLEADOS.Fetch(EPL:PK_EMPLEADOS)
  CON:CONV_ID = EPL:EMP_CONVENIO                           ! Assign linking field value
  Access:CONVENIO.Fetch(CON:PK_CONVENIO)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Empleados
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?OK
      IF SELF.Request = ChangeRecord
          PWR:PWR_USER = Glo:Usuario2
          PWR:PWR_UFECHA_DATE = TODAY()
          PWR:PWR_UFECHA_TIME = CLOCK()
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup
      ThisWindow.Update()
      EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        PWR:PWR_LEGAJO = EPL:EMP_LEGAJO
      END
      ThisWindow.Reset(1)
    OF ?EPL:EMP_LEGAJO
      IF EPL:EMP_LEGAJO OR ?EPL:EMP_LEGAJO{PROP:Req}
        EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
        IF Access:EMPLEADOS.TryFetch(EPL:PK_EMPLEADOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            EPL:EMP_LEGAJO = EPL:EMP_LEGAJO
            PWR:PWR_LEGAJO = EPL:EMP_LEGAJO
          ELSE
            CLEAR(PWR:PWR_LEGAJO)
            SELECT(?EPL:EMP_LEGAJO)
            CYCLE
          END
        ELSE
          PWR:PWR_LEGAJO = EPL:EMP_LEGAJO
        END
      END
      ThisWindow.Reset(1)
    OF ?Calendar:Desde
      ThisWindow.Update()
      Calendar9.SelectOnClose = True
      Calendar9.Ask('Seleccionar Día',PWR:PWR_DFECHA_DATE)
      IF Calendar9.Response = RequestCompleted THEN
      PWR:PWR_DFECHA_DATE=Calendar9.SelectedDate
      DISPLAY(?PWR:PWR_DFECHA_DATE)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:Hasta
      ThisWindow.Update()
      Calendar10.SelectOnClose = True
      Calendar10.Ask('Seleccionar Día',PWR:PWR_HFECHA_DATE)
      IF Calendar10.Response = RequestCompleted THEN
      PWR:PWR_HFECHA_DATE=Calendar10.SelectedDate
      DISPLAY(?PWR:PWR_HFECHA_DATE)
      END
      ThisWindow.Reset(True)
    OF ?Loc:Opcion
      IF Loc:Opcion = '1'
         HIDE(?STRING1)
         HIDE(?STRING2)
         DISABLE(?CON:CONV_CONVENIO)
         ENABLE(?CallLookup)
         ENABLE(?EPL:EMP_LEGAJO)
      END
      IF Loc:Opcion <> '1'
         DISABLE(?EPL:EMP_LEGAJO)
         DISABLE(?CallLookup)
      END
      IF Loc:Opcion = '2'
         HIDE(?STRING1)
         HIDE(?STRING2)
         DISABLE(?EPL:EMP_LEGAJO)
         DISABLE(?CallLookup)
         ENABLE(?CON:CONV_CONVENIO)
      END
      IF Loc:Opcion <> '2'
         DISABLE(?CON:CONV_CONVENIO)
      END
      IF Loc:Opcion = '3'
         UNHIDE(?STRING1)
         UNHIDE(?STRING2)
         DISABLE(?EPL:EMP_LEGAJO)
         DISABLE(?CallLookup)
         DISABLE(?CON:CONV_CONVENIO)
      END
      IF Loc:Opcion <> '3'
         HIDE(?STRING1)
         HIDE(?STRING2)
      END
      ThisWindow.Reset()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  !IF (SELF.Request = InsertRecord OR SELF.Request = ChangeRecord) AND Loc:Opcion = 2 THEN
  IF Loc:Opcion = 2 THEN
      Loc:str = 'SELECT EMP_LEGAJO '&|
                'FROM EMPLEADOS '&|
                'WHERE EMP_ACTIVO = ''S'' AND EMP_CONVENIO = ' & Loc:Convenio & ''
  !ELSIF (SELF.Request = InsertRecord OR SELF.Request = ChangeRecord) AND Loc:Opcion = 3 THEN
  ELSIF Loc:Opcion = 3 THEN
      Loc:str = 'SELECT EMP_LEGAJO '&|
                'FROM EMPLEADOS '&|
          'WHERE EMP_ACTIVO = ''S'''
  ELSE
      Loc:str = 'SELECT EMP_LEGAJO '&|
                'FROM EMPLEADOS '&|
                'WHERE EMP_LEGAJO = ' & PWR:PWR_LEGAJO & ''
  END
  
  TMPUsosMultiples{Prop:Sql} = clip(Loc:str)
  
  IF ERRORCODE() THEN STOP(FILEERRORCODE()).
  
  LOOP
      NEXT(TMPUsosMultiples)
      IF ERRORCODE() THEN BREAK.
      PWR:PWR_LEGAJO = TUM:Col01
  ReturnValue = PARENT.TakeCompleted()
  END !Loop
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    IF Security.TakeViewWindowEvent(SSEC::Viewing, ?Cancel)
      CYCLE
    END!IF
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! RECORDATORIOS
!!! </summary>
RecordatoriosDetalles PROCEDURE 

CurrentTab           STRING(80)                            !
BRW2::View:Browse    VIEW(PER_WEBREC)
                       PROJECT(PWR:PWR_LEGAJO)
                       PROJECT(PWR:PWR_DFECHA_DATE)
                       PROJECT(PWR:PWR_HFECHA_DATE)
                       PROJECT(PWR:PWR_TEXTO)
                       PROJECT(PWR:PWR_USER)
                       PROJECT(PWR:PWR_DFECHA)
                       PROJECT(PWR:PWR_HFECHA)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
PWR:PWR_LEGAJO         LIKE(PWR:PWR_LEGAJO)           !List box control field - type derived from field
PWR:PWR_DFECHA_DATE    LIKE(PWR:PWR_DFECHA_DATE)      !List box control field - type derived from field
PWR:PWR_HFECHA_DATE    LIKE(PWR:PWR_HFECHA_DATE)      !List box control field - type derived from field
PWR:PWR_TEXTO          LIKE(PWR:PWR_TEXTO)            !List box control field - type derived from field
PWR:PWR_USER           LIKE(PWR:PWR_USER)             !List box control field - type derived from field
PWR:PWR_DFECHA         LIKE(PWR:PWR_DFECHA)           !Primary key field - type derived from field
PWR:PWR_HFECHA         LIKE(PWR:PWR_HFECHA)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('Detalle de Recordatorios'),AT(,,360,190),FONT('Microsoft Sans Serif',10,,FONT:bold, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('RecordatoriosDetalles'),SYSTEM
                       BUTTON('&Cerrar'),AT(310,172,45,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       GROUP('Recordatorios'),AT(5,5,350,165),USE(?Recordatorios),BOXED
                         LIST,AT(10,15,340,150),USE(?List),FONT(,,,FONT:regular),HVSCROLL,FORMAT('25C|~Legajo~@N' & |
  '5B@35C|~Desde~@D06B@35C|~Hasta~@D06B@200L(1)|M~Mensaje~C(0)@s130@40L(1)|~Creado por~C(0)@s20@'), |
  FROM(Queue:Browse),IMM
                       END
                       BUTTON('&Nuevo'),AT(5,173,45,14),USE(?Insert),FONT(,,00701919h),LEFT,ICON('wainsert.ico')
                       BUTTON('&Modificar'),AT(52,173,45,14),USE(?Change),FONT(,,00701919h),LEFT,ICON('wachange.ico')
                       BUTTON('&Eliminar'),AT(100,173,45,14),USE(?Delete),FONT(,,00701919h),LEFT,ICON('wadelete.ico')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  GLO:oneInstance_RecordatoriosDetalles_thread = 0

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('RecordatoriosDetalles')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Close
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PWR:PWR_LEGAJO',PWR:PWR_LEGAJO)                    ! Added by: BrowseBox(ABC)
  BIND('PWR:PWR_TEXTO',PWR:PWR_TEXTO)                      ! Added by: BrowseBox(ABC)
  BIND('PWR:PWR_USER',PWR:PWR_USER)                        ! Added by: BrowseBox(ABC)
  BIND('PWR:PWR_DFECHA',PWR:PWR_DFECHA)                    ! Added by: BrowseBox(ABC)
  BIND('PWR:PWR_HFECHA',PWR:PWR_HFECHA)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PER_WEBREC.Open                                   ! File PER_WEBREC used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:PER_WEBREC,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse
  BRW2.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW2.RetainRow = 0
  BRW2.AddSortOrder(,PWR:PK_PER_WEBREC)                    ! Add the sort order for PWR:PK_PER_WEBREC for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,PWR:PWR_LEGAJO,,BRW2)          ! Initialize the browse locator using  using key: PWR:PK_PER_WEBREC , PWR:PWR_LEGAJO
  BRW2.AddField(PWR:PWR_LEGAJO,BRW2.Q.PWR:PWR_LEGAJO)      ! Field PWR:PWR_LEGAJO is a hot field or requires assignment from browse
  BRW2.AddField(PWR:PWR_DFECHA_DATE,BRW2.Q.PWR:PWR_DFECHA_DATE) ! Field PWR:PWR_DFECHA_DATE is a hot field or requires assignment from browse
  BRW2.AddField(PWR:PWR_HFECHA_DATE,BRW2.Q.PWR:PWR_HFECHA_DATE) ! Field PWR:PWR_HFECHA_DATE is a hot field or requires assignment from browse
  BRW2.AddField(PWR:PWR_TEXTO,BRW2.Q.PWR:PWR_TEXTO)        ! Field PWR:PWR_TEXTO is a hot field or requires assignment from browse
  BRW2.AddField(PWR:PWR_USER,BRW2.Q.PWR:PWR_USER)          ! Field PWR:PWR_USER is a hot field or requires assignment from browse
  BRW2.AddField(PWR:PWR_DFECHA,BRW2.Q.PWR:PWR_DFECHA)      ! Field PWR:PWR_DFECHA is a hot field or requires assignment from browse
  BRW2.AddField(PWR:PWR_HFECHA,BRW2.Q.PWR:PWR_HFECHA)      ! Field PWR:PWR_HFECHA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW2.AskProcedure = 1                                    ! Will call: FormRECORDATORIO
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PER_WEBREC.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    FormRECORDATORIO
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW2.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW2.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
FirmaRecibos PROCEDURE 

RegKey               CSTRING('j54n78w65pg5f799n6wc4o36y<0>{38}') !
Loc:Path1            CSTRING(201)                          !
Loc:Path2            CSTRING(201)                          !
Loc:errorControl     BYTE                                  !
Loc:namePDF          CSTRING(101)                          !
Loc:indice           SHORT                                 !
Loc:nroleg           SHORT                                 !
Loc:nroliq           LONG                                  !
Loc:tr               CSTRING(3)                            !
Loc:ta               CSTRING(3)                            !
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
queueRecibo         QUEUE(File:queue),PRE(FIL) !Inherit exact declaration of File:queue
                END
Recibo              LONG
Recibos             LONG
QPL                 QuickPDFLite
window               WINDOW('Firma Recibo Sueldos'),AT(,,315,60),FONT('Microsoft Sans Serif',10),DOUBLE,CENTER, |
  GRAY,MDI,MODAL,SYSTEM
                       BUTTON('&Origen'),AT(5,5,55,14),USE(?LookupFile),FONT(,12,,FONT:bold),LEFT,ICON(ICON:Open)
                       ENTRY(@s200),AT(65,6,245,13),USE(Loc:Path1),FONT(,10,,FONT:regular)
                       BUTTON('&Destino'),AT(5,23,55,14),USE(?LookupFile:2),FONT(,12,,FONT:bold),LEFT,ICON(ICON:Save)
                       ENTRY(@s200),AT(65,24,245,13),USE(Loc:Path2)
                       OLE,AT(5,41,14,14),USE(?Ole1),HIDE
                       END
                       PROMPT('Progreso:'),AT(64,41,45,14),USE(?ProgressBar:Prompt),FONT(,14,,FONT:bold)
                       PROGRESS,AT(112,41,80,14),USE(?ProgressBar),RANGE(0,100)
                       BUTTON('&Firmar'),AT(218,41,45,14),USE(?Create),FONT('Microsoft Sans Serif',10,COLOR:Green, |
  FONT:bold)
                       BUTTON('&Cerrar'),AT(266,41,45,14),USE(?Close),FONT('Microsoft Sans Serif',10,COLOR:Red,FONT:bold)
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FileLookup1          SelectFileClass
FileLookup2          SelectFileClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ControlRestricciones        ROUTINE
    num1# = INSTRING('\', Loc:Path1, -1, LEN(Loc:Path1))
    num2# = INSTRING('\', Loc:Path2, -1, LEN(Loc:Path2))
    p1" = Loc:Path1[num1# + 1:LEN(Loc:Path1)]
    p2" = Loc:Path2[num2# + 1:LEN(Loc:Path2)]
    IF Loc:Path1 = '' OR Loc:Path2 = '' THEN !Control de directorios vacíos
        BEEP
        MESSAGE('Debe seleccionar los directorios de Origen y Destino!', 'Directorios', ICON:Exclamation, BUTTON:OK, 1)
        IF Loc:Path1 = '' THEN
            SELECT(?Loc:Path1)
        ELSE
            SELECT(?Loc:Path2)
        END
        Loc:errorControl = 1
    ELSIF Loc:Path1 = Loc:Path2 THEN !Control de directorios iguales
        BEEP
        MESSAGE('Los directorios de Origen y Destino, no pueden ser los mismos!', 'Directorios', ICON:Exclamation, BUTTON:OK, 1)
        Loc:errorControl = 1
    ELSIF p1" <> p2" THEN !Control de carpetas distintas
        BEEP
        MESSAGE('Las carpetas tiene distintos nombres! - Origen: ' & CLIP(p1") & ' <> Destino: ' & CLIP(p2"), 'Directorios', ICON:Exclamation, BUTTON:OK, 1)
        Loc:errorControl = 1
    END
PARAMETROS          ROUTINE
    ! Guardo el nombre del PDF
    Loc:namePDF = CLIP(queueRecibo.Name)
    ! Obtengo algunos valores del nombre del PDF
    Loc:indice = INSTRING('_', Loc:namePDF, -1, LEN(Loc:namePDF))
    Loc:nroleg = Loc:namePDF[Loc:indice + 1 : Loc:indice + 4] ! Obtengo el número de legajo
    Loc:nroliq = Loc:namePDF[1 : Loc:indice - 1] ! Obtengo el número de liquidación
    Loc:tr = Loc:namePDF[1] ! Tipo Recibo
    Loc:ta = Loc:namePDF[2] ! Tipo Anticipo
FirmaFileppo        ROUTINE
    ! Abro imagen de firma PNG
    QPL.AddImageFromFile('\\Adm_pico\docu.net\PERSONAL\FIRMA\firmaAle.png', 0)
    ! Redimensiono la firma
    lWidth# = QPL.ImageWidth() * 0.1
    lHeight# = QPL.ImageHeight() * 0.1
    ! Dibujo la firma en el recibo
    QPL.DrawImage(90, 120, lWidth#, lHeight#)
FirmaPaez           ROUTINE
    ! Abro imagen de firma PNG
    QPL.AddImageFromFile('\\Adm_pico\docu.net\PERSONAL\FIRMA\firmaLeo.png', 0)
    ! Redimensiono la firma
    lWidth# = QPL.ImageWidth() * 0.14
    lHeight# = QPL.ImageHeight() * 0.14
    ! Dibujo la firma en el recibo
    QPL.DrawImage(90, 120, lWidth#, lHeight#)
tipoAnticipo        ROUTINE
    CASE Loc:ta
        OF '1'
            QPL.DrawText(10, 100, 'Distribución de Facturas')
        OF '2'
            QPL.DrawText(10, 100, 'Plus Vacacional')
        OF '3'
            QPL.DrawText(10, 100, 'Adelanto de Sueldo')
        OF '4'
            QPL.DrawText(10, 100, 'Ajuste Liquidación')
        OF '5'
            QPL.DrawText(10, 100, 'Suma Sindical')
        OF '6'
            QPL.DrawText(10, 100, 'Suma No Remunerativa')
        OF '7'
            QPL.DrawText(10, 100, 'Anticipo S.A.C.')
        ELSE
            QPL.DrawText(10, 100, 'Anticipo al Personal')
    END
creaFirma           ROUTINE
    LOOP hoja# = 1 TO QPL.PageCount()
        QPL.SelectPage(hoja#)
        QPL.SetPageSize('A4')
        IF Loc:tr = '3' AND Loc:nroleg = '9191' THEN
            DO FirmaFileppo
        ELSE
            DO FirmaPaez
        END
        ! Se verifica si se trata de una liquidación (4) o un anticipo (6)
        IF Loc:tr = '4' THEN
            ! Establezco los parametros de la fuente
            QPL.SetTextColor(1.0, 0.0, 0.0)
            QPL.SetTextSize(10)
            ! Dibujo el texto
            QPL.DrawText(10, 100, 'Liquidación Final')
        ELSIF Loc:tr = '6' THEN
            ! Establezco los parametros de la fuente
            QPL.SetTextColor(0.0, 0.0, 1.0)
            QPL.SetTextSize(10)
            ! Dibujo el texto
            DO tipoAnticipo
        END
        ! Guardo el recibo firmado
        QPL.SaveToFile(Loc:Path2 & '\' & Loc:namePDF)
    END !Loop 2
preparaRecibo       ROUTINE
    LOOP Recibo = 1 TO Recibos
        GET(queueRecibo, Recibo)
        DO PARAMETROS
        ! Genero liquidación y legajo en la tabla LIQUIDALEG
        CLEAR(LIQ:Record)
        LIQ:LIQ_LEGAJO = Loc:nroleg
        LIQ:LIQ_NROLIQ = Loc:nroliq
        GET(LIQUIDALEG, LIQ:PK_LIQUIDALEG)
        IF ERRORCODE() THEN !NO Existe liquidación en tabla, la agrego
            Access:LIQUIDALEG.Insert()
        END
        QPL.LoadFromFile(Loc:Path1 & '\' & Loc:namePDF, '') ! Cargo el recibo
        QPL.SetMeasurementUnits(1) ! Setea unidades a mm
        DO creaFirma
        ?ProgressBar{PROP:progress} = ?ProgressBar{PROP:progress} + 1
        DISPLAY(?ProgressBar)
    END !Loop 1

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FirmaRecibos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LookupFile
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LIQUIDALEG.Open                                   ! File LIQUIDALEG used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  QPL.Init(Window,?OLE1)
  WinAlertMouseZoom()
  Do DefineListboxStyle
  FileLookup1.Init
  FileLookup1.ClearOnCancel = True
  FileLookup1.Flags=BOR(FileLookup1.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup1.Flags=BOR(FileLookup1.Flags,FILE:Directory)  ! Allow Directory Dialog
  FileLookup1.SetMask('PDFl Files','*.pdf')                ! Set the file mask
  FileLookup1.DefaultDirectory='\\Adm_pico\docu.net\PERSONAL\Recibos_Digitales'
  FileLookup1.WindowTitle='Selecionar Origen'
  FileLookup2.Init
  FileLookup2.ClearOnCancel = True
  FileLookup2.Flags=BOR(FileLookup2.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup2.Flags=BOR(FileLookup2.Flags,FILE:Directory)  ! Allow Directory Dialog
  FileLookup2.SetMask('PDFI Files','*.pdf')                ! Set the file mask
  FileLookup2.DefaultDirectory='\\Adm_pico\docu.net\PERSONAL\Recibos_Firmados'
  FileLookup2.WindowTitle='Selecionar Destino'
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDALEG.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?Create
      !Control de Directorios
      DO ControlRestricciones
      IF Loc:errorControl THEN
          Loc:errorControl = 0
          CYCLE
      END
    OF ?Close
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LookupFile
      ThisWindow.Update()
      Loc:Path1 = FileLookup1.Ask(1)
      DISPLAY
    OF ?LookupFile:2
      ThisWindow.Update()
      Loc:Path2 = FileLookup2.Ask(1)
      DISPLAY
    OF ?Create
      ThisWindow.Update()
      ! Códigos de prueba utilizados
      
      !!CODIGO ORIGINAL
      
      !! Load the image that you'd like to convert to PDF
      !QPL.AddImageFromFile('image.png', 0)
      !
      !! Get the width and height of the image
      !lWidth# = QPL.ImageWidth()
      !lHeight# = QPL.ImageHeight()
      !
      !! Reformat the size of the page in the selected document
      !QPL.SetPageDimensions(lWidth#, lHeight#)
      !
      !! Draw the image onto the page using the specified width/height
      !QPL.DrawImage(0, lHeight#, lWidth#, lHeight#)
      !! Save the document with the text you!ve just written to disk
      !If QPL.SaveToFile('image.pdf') = 1 Then
      !  Message('File image.pdf written successfully')
      !  QPL.OpenInAdobe('image.pdf')
      !Else
      ! Message('Error, file could not be written')
      !End
      
      !!FUNCIÓN PARA RECIBOS DE DOS O MAS HOJAS
      !
      !! Cargo el recibo
      !QPL.LoadFromFile('C:\Clarion10\Examples\QuickPDFLibraryLiteDemoC10\recibo2.pdf', '')
      !QPL.SetMeasurementUnits(1)
      !LOOP hoja# = 1 TO QPL.PageCount()
      !    QPL.SelectPage(hoja#)
      !!    QPL.SetPageDimensions(210,297)
      !    QPL.SetPageSize('A4')
      !    ! Abro imagen de firma PNG
      !    QPL.AddImageFromFile('C:\Clarion10\Examples\QuickPDFLibraryLiteDemoC10\firmaLeo.png', 0)
      !    ! Redimensiono la firma
      !!    lWidth# = QPL.ImageWidth() * 0.4
      !!    lHeight# = QPL.ImageHeight() * 0.4
      !    lWidth# = QPL.ImageWidth() * 0.14
      !    lHeight# = QPL.ImageHeight() * 0.14
      !    ! Dibujo la firma en el recibo
      !!    QPL.DrawImage(280, 340, lWidth#, lHeight#)
      !    QPL.DrawImage(90, 120, lWidth#, lHeight#)
      !    ! Guardo el recibo firmado
      !    QPL.SaveToFile('C:\Clarion10\Examples\QuickPDFLibraryLiteDemoC10\reciboFirmado.pdf')
      !END !Loop
      !MESSAGE(ERRORCODE())
      !! Abro el recibo firmado
      !QPL.OpenInAdobe('C:\Clarion10\Examples\QuickPDFLibraryLiteDemo\reciboFirmado.pdf')
      
      
      !!FUNCIÓN PARA TRABAJAR CON DIRECTORIOS
      !
      !CLEAR(queueRecibo)
      !FREE(queueRecibo)
      !DIRECTORY(queueRecibo, Loc:Path1 & '\*.pdf',ff_:DIRECTORY) !Get all files and directories
      !Recibos = RECORDS(queueRecibo)
      !?ProgressBar{PROP:RangeHigh} = Recibos
      !LOOP Recibo = 1 TO Recibos
      !    GET(queueRecibo, Recibo)
      !    ! Guardo el nombre del PDF
      !    namePDF" = CLIP(queueRecibo.Name)
      !    ! Obtengo algunos valores del nombre del PDF
      !    num# = INSTRING('_', namePDF", -1, LEN(namePDF"))
      !    nroleg" = namePDF"[num# + 1:num# + 4] ! Obtengo el número de legajo
      !    nroliq" = namePDF"[1 : num# - 1] ! Obtengo el número de liquidación
      !    tr" = namePDF"[1] ! Tipo Recibo
      !    ta" = namePDF"[2] ! Tipo Anticipo
      !    ! Genero liquidación y legajo en la tabla LIQUIDALEG
      !    CLEAR(LIQ:Record)
      !    LIQ:LIQ_LEGAJO = nroleg"
      !    LIQ:LIQ_NROLIQ = nroliq"
      !    GET(LIQUIDALEG, LIQ:PK_LIQUIDALEG)
      !    IF ERRORCODE() THEN !NO Existe liquidación en tabla, la agrego
      !        Access:LIQUIDALEG.Insert()
      !    END
      !    ! Cargo el recibo
      !    QPL.LoadFromFile(Loc:Path1 & '\' & namePDF", '')
      !!    QPL.LoadFromFile('C:\Clarion10\Examples\QuickPDFLibraryLiteDemo\recibo2.pdf', '')
      !!    QPL.LoadFromFile('C:\Users\sistemas\Desktop\3082021_1178.pdf','')
      !    MESSAGE(QPL.SelectedDocument())
      !    ! Setea unidades a mm
      !    QPL.SetMeasurementUnits(1)
      !    LOOP hoja# = 1 TO QPL.PageCount()
      !        MESSAGE('Loop 2')
      !        QPL.SelectPage(hoja#)
      !        QPL.SetPageSize('A4')
      !        IF tr" = '3' AND nroleg" = '9191' THEN
      !            ! Abro imagen de firma PNG
      !            QPL.AddImageFromFile('\\Adm_pico\docu.net\PERSONAL\FIRMA\firmaAle.png', 0)
      !            ! Redimensiono la firma
      !            lWidth# = QPL.ImageWidth() * 0.1
      !            lHeight# = QPL.ImageHeight() * 0.1
      !            ! Dibujo la firma en el recibo
      !            QPL.DrawImage(90, 120, lWidth#, lHeight#)
      !            MESSAGE('Firma Fileppo')
      !        ELSE
      !            ! Abro imagen de firma PNG
      !            QPL.AddImageFromFile('\\Adm_pico\docu.net\PERSONAL\FIRMA\firmaLeo.png', 0)
      !            ! Redimensiono la firma
      !            lWidth# = QPL.ImageWidth() * 0.14
      !            lHeight# = QPL.ImageHeight() * 0.14
      !            ! Dibujo la firma en el recibo
      !            QPL.DrawImage(90, 120, lWidth#, lHeight#)
      !            MESSAGE('Firma Paez')
      !        END
      !        ! Se verifica si se trata de una liquidación o un anticipo
      !        IF tr" = '4' THEN
      !            ! Establezco los parametros de la fuente
      !            QPL.SetTextColor(1.0, 0.0, 0.0)
      !            QPL.SetTextSize(10)
      !            ! Dibujo el texto
      !            QPL.DrawText(10, 100, 'Liquidación Final')
      !        ELSIF tr" = '6' THEN
      !            ! Establezco los parametros de la fuente
      !            QPL.SetTextColor(0.0, 0.0, 1.0)
      !            QPL.SetTextSize(10)
      !            ! Dibujo el texto
      !            CASE ta"
      !                OF '1'
      !                    QPL.DrawText(10, 100, 'Distribución de Facturas')
      !                OF '2'
      !                    QPL.DrawText(10, 100, 'Plus Vacacional')
      !                OF '3'
      !                    QPL.DrawText(10, 100, 'Adelanto de Sueldo')
      !                OF '4'
      !                    QPL.DrawText(10, 100, 'Ajuste Liquidación')
      !                OF '5'
      !                    QPL.DrawText(10, 100, 'Suma Sindical')
      !                ELSE
      !                    QPL.DrawText(10, 100, 'Anticipo al Personal')
      !            END
      !        END
      !        ! Guardo el recibo firmado
      !        QPL.SaveToFile(Loc:Path2 & '\' & namePDF")
      !!        QPL.SaveToFile('C:\Clarion10\Examples\QuickPDFLibraryLiteDemo\reciboFirmado.pdf')
      !    END !Loop 2
      !    ?ProgressBar{PROP:progress} = ?ProgressBar{PROP:progress} + 1
      !    DISPLAY(?ProgressBar)
      !END !Loop 1
      !IF NOT QPL.LastErrorCode() THEN
      !    MESSAGE('La firma de recibos de sueldo ha finalizado con éxito!', 'Firmas', ICON:Exclamation, BUTTON:OK, 1)
      !    ?ProgressBar{PROP:progress} = 0
      !    DISPLAY(?ProgressBar)
      !END
      CLEAR(queueRecibo)
      FREE(queueRecibo)
      DIRECTORY(queueRecibo, Loc:Path1 & '\*.pdf',ff_:DIRECTORY) ! FUNCIÓN PARA TRABAJAR CON DIRECTORIOS
      Recibos = RECORDS(queueRecibo)
      ?ProgressBar{PROP:RangeHigh} = Recibos
      DO preparaRecibo
      IF NOT QPL.LastErrorCode() THEN
          MESSAGE('La firma de recibos de sueldo ha finalizado con éxito!', 'Firmas', ICON:Exclamation, BUTTON:OK, 1)
          ?ProgressBar{PROP:progress} = 0
          DISPLAY(?ProgressBar)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! perdoc
!!! </summary>
DocEmp PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(perdoc)
                       PROJECT(perdoc:emp)
                       PROJECT(perdoc:nroleg)
                       PROJECT(perdoc:id)
                       PROJECT(perdoc:coddoc)
                       PROJECT(perdoc:nrodoc)
                       PROJECT(perdoc:exped)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
perdoc:emp             LIKE(perdoc:emp)               !List box control field - type derived from field
perdoc:nroleg          LIKE(perdoc:nroleg)            !List box control field - type derived from field
perdoc:id              LIKE(perdoc:id)                !List box control field - type derived from field
perdoc:coddoc          LIKE(perdoc:coddoc)            !List box control field - type derived from field
perdoc:nrodoc          LIKE(perdoc:nrodoc)            !List box control field - type derived from field
perdoc:exped           LIKE(perdoc:exped)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('perdoc'),AT(,,260,198),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('DocEmp'),SYSTEM
                       LIST,AT(8,30,244,124),USE(?Browse:1),HVSCROLL,FORMAT('36R(2)|M~emp~C(0)@n-7@64R(2)|M~nr' & |
  'oleg~C(0)@n-14@16R(2)|M~id~C(0)@n3@28L(2)|M~coddoc~L(2)@s4@64R(2)|M~nrodoc~C(0)@n-14' & |
  '@44L(2)|M~exped~L(2)@s10@'),FROM(Queue:Browse:1),IMM,MSG('perdoc')
                       BUTTON('&Select'),AT(203,158,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,252,172),USE(?CurrentTab)
                         TAB('&1) perdoc_coddoc'),USE(?Tab:2)
                         END
                         TAB('&2) perdoc_emp'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Close'),AT(154,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(207,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

    omit('***',WE::CantCloseNowSetHereDone=1)  !Getting Nested omit compile error, then uncheck the "Check for duplicate CantCloseNowSetHere variable declaration" in the WinEvent local template
WE::CantCloseNowSetHereDone equate(1)
WE::CantCloseNowSetHere     long
    !***
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('DocEmp')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:perdoc.Open                                       ! File perdoc used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:perdoc,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  WinAlertMouseZoom()
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,perdoc:perdoc_emp)                    ! Add the sort order for perdoc:perdoc_emp for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,perdoc:emp,,BRW1)              ! Initialize the browse locator using  using key: perdoc:perdoc_emp , perdoc:emp
  BRW1.AddSortOrder(,perdoc:perdoc_coddoc)                 ! Add the sort order for perdoc:perdoc_coddoc for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,perdoc:emp,,BRW1)              ! Initialize the browse locator using  using key: perdoc:perdoc_coddoc , perdoc:emp
  BRW1.AddField(perdoc:emp,BRW1.Q.perdoc:emp)              ! Field perdoc:emp is a hot field or requires assignment from browse
  BRW1.AddField(perdoc:nroleg,BRW1.Q.perdoc:nroleg)        ! Field perdoc:nroleg is a hot field or requires assignment from browse
  BRW1.AddField(perdoc:id,BRW1.Q.perdoc:id)                ! Field perdoc:id is a hot field or requires assignment from browse
  BRW1.AddField(perdoc:coddoc,BRW1.Q.perdoc:coddoc)        ! Field perdoc:coddoc is a hot field or requires assignment from browse
  BRW1.AddField(perdoc:nrodoc,BRW1.Q.perdoc:nrodoc)        ! Field perdoc:nrodoc is a hot field or requires assignment from browse
  BRW1.AddField(perdoc:exped,BRW1.Q.perdoc:exped)          ! Field perdoc:exped is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:perdoc.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  if event() = event:VisibleOnDesktop
    ds_VisibleOnDesktop()
  end
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:CloseDown
      if WE::CantCloseNow
        WE::MustClose = 1
        cycle
      else
        self.CancelAction = cancel:cancel
        self.response = requestcancelled
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
        post(event:visibleondesktop)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

