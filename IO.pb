InitNetwork()
UsePNGImageEncoder()
ExamineDesktops()

Structure OCRStruct
  Title.s
  x.i
  y.i
  w.i
  h.i
EndStructure
Structure Pixels
  x.i
  y.i
  Color.i
EndStructure

Global TesseractExe.s = GetCurrentDirectory()+"Tesseract\tesseract.exe"
Global OCRMutex = CreateMutex()
Global NewMap OCRStrings.s()
Global NewMap OCRWatches()

Procedure Mouse_LClickOnPosition(x,y)
  SetCursorPos_(x,y)
  Delay(20)
  mouse_event_(#MOUSEEVENTF_LEFTDOWN,0,0,0,0)
  Delay(20)
  mouse_event_(#MOUSEEVENTF_LEFTUP,0,0,0,0)
EndProcedure  
Procedure Mouse_PushAndRelease(Code)
  keybd_event_(Code, 0, 0,0)
  keybd_event_(Code, 0, #KEYEVENTF_KEYUP,0)
EndProcedure
Procedure Mouse_LClickRelease()
 mouse_event_(#MOUSEEVENTF_LEFTUP,0,0,0,0)
EndProcedure
Procedure Mouse_LClickPush(Delay = 0)
   Delay(delay)
   mouse_event_(#MOUSEEVENTF_LEFTDOWN,0,0,0,0)
   Delay(delay)
EndProcedure
Procedure Mouse_LClick(Delay = 0)
  mouse_event_(#MOUSEEVENTF_LEFTDOWN,0,0,0,0)
  Delay(delay)
  mouse_event_(#MOUSEEVENTF_LEFTUP,0,0,0,0)
EndProcedure
Procedure Mouse_RClick(Delay = 0)
  mouse_event_(#MOUSEEVENTF_RIGHTDOWN,0,0,0,0)
  Delay(delay)
  mouse_event_(#MOUSEEVENTF_RIGHTUP,0,0,0,0)
EndProcedure
Procedure Mouse_RClickRelease()
 mouse_event_(#MOUSEEVENTF_RIGHTUP,0,0,0,0)
EndProcedure
Procedure Mouse_RClickPush(Delay = 0)
   Delay(delay)
   mouse_event_(#MOUSEEVENTF_RIGHTDOWN,0,0,0,0)
   Delay(delay)
EndProcedure
Procedure Mouse_wheelUp()
  in.Input
  in\type = #INPUT_MOUSE
  in\mi\dwFlags = #MOUSEEVENTF_WHEEL
  in\mi\mouseData = 120
  SendInput_(1,@in,SizeOf(input))
  Delay(10)
EndProcedure  
Procedure Mouse_wheelDown()
  in.Input
  in\type = #INPUT_MOUSE
  in\mi\dwFlags = #MOUSEEVENTF_WHEEL
  in\mi\mouseData = -120
  SendInput_(1,@in,SizeOf(input))
  Delay(10)
EndProcedure  

Procedure Keyboard_Push(Code)
  keybd_event_(Code,0,0,0)
  Delay(10)
EndProcedure
Procedure Keyboard_Release(Code)
  keybd_event_(Code,0,#KEYEVENTF_KEYUP,0)
EndProcedure
Procedure Keyboard_PushAndRelease(Code)
  keybd_event_(Code,0,0,0)
  Delay(20)
  keybd_event_(Code,0,#KEYEVENTF_KEYUP,0)
  Delay(20)
EndProcedure

Procedure MakeDesktopScreenshot()
  img = CreateImage(#PB_Any,DesktopWidth(0)-40,DesktopHeight(0))
  hDC = StartDrawing(ImageOutput(img))
  If hDC
    DeskDC = GetDC_(GetDesktopWindow_())
    If DeskDC
      BitBlt_(hDC,0,0,DesktopWidth(0),DesktopHeight(0)-40,DeskDC,0,0,#SRCCOPY)
    EndIf
    ReleaseDC_(GetDesktopWindow_(),DeskDC)
  EndIf
  StopDrawing()
  ProcedureReturn img
EndProcedure
Procedure Colorpick (image, *Position.POINT)
  If *Position\x < 0 Or *Position\x >= ImageWidth(image) Or *Position\y < 0 Or *Position\y >= ImageHeight(image)
    ProcedureReturn -1
  EndIf
  
    StartDrawing(ImageOutput(image))
    color = Point(*Position\x,*Position\y)
    StopDrawing()
    ProcedureReturn color
EndProcedure
Procedure PixelPatternCheck(image,List Pixels.Pixels())
  StartDrawing(ImageOutput(image))
  ForEach Pixels()
    If Not Point(Pixels()\x,Pixels()\y) = Pixels()\Color
      StopDrawing()
      ProcedureReturn 0
    EndIf
  Next
  StopDrawing()
  ProcedureReturn 1
EndProcedure
Procedure PixelPatternThresholdCheck(image,List Pixels.Pixels(),Threshold)
  StartDrawing(ImageOutput(image))
  ForEach Pixels()
    c = Point(Pixels()\x,Pixels()\y)
    If Red(c)  +Threshold > Red(Pixels()\Color)   And Red(c)  -Threshold < Red(Pixels()\Color)   And
       Green(c)+Threshold > Green(Pixels()\Color) And Green(c)-Threshold < Green(Pixels()\Color) And
       Blue(c) +Threshold > Blue(Pixels()\Color)  And Blue(c) -Threshold < Blue(Pixels()\Color) 
    Else
      StopDrawing()
      ProcedureReturn 0
    EndIf
  Next
  StopDrawing()
  ProcedureReturn 1
EndProcedure
Procedure.i FindImageColorDetail(image,RedMin,RedMax,GreenMin,GreenMax,BlueMin,BlueMax,List P.POINT())
StartDrawing(ImageOutput(image))
  For x = 0 To ImageWidth(image)-1
    For y = 0 To ImageHeight(image)-1
      c = Point(x,y)
      If Red(c) > RedMin And Red(c) < RedMax And
         Green(c) > GreenMin And Green(c) < GreenMax And
         Blue(c) > BlueMin And Blue(c) < BlueMax
        StopDrawing()
        AddElement(P())
        P()\x = x
        P()\y = y
      EndIf
    Next
  Next
StopDrawing()
ProcedureReturn 0
EndProcedure
Procedure.i FindImageColor(image,Color,Threshold,List P.POINT())
StartDrawing(ImageOutput(image))
  For x = 0 To ImageWidth(image)-1
    For y = 0 To ImageHeight(image)-1
      c = Point(x,y)
      If Red(c)  +Threshold >= Red(Color)   And Red(c)  -Threshold <= Red(Color)   And
         Green(c)+Threshold >= Green(Color) And Green(c)-Threshold <= Green(Color) And
         Blue(c) +Threshold >= Blue(Color)  And Blue(c) -Threshold <= Blue(Color) 
        AddElement(P())
        P()\x = x
        P()\y = y
      EndIf
    Next
  Next
  StopDrawing()
  ProcedureReturn ListSize(p())
EndProcedure

Procedure DownloadTesseract()
  Downloadlink.s = "https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-v5.0.0-alpha.20210506.exe"
  DownloadSize = 53209536

  Download = ReceiveHTTPFile(Downloadlink, GetTemporaryDirectory()+"TesseractInstaller.exe",#PB_HTTP_Asynchronous)
  Progresswindow = OpenWindow(#PB_Any,DesktopWidth(0)/2-100,200,200,40,"Tesseract Installation",#PB_Window_BorderLess)
  SmartWindowRefresh(Progresswindow,1)
  TextGadget(#PB_Any,0,0,200,20,"Downloading Tesseract Installer: ")
  Progressbar = ProgressBarGadget(#PB_Any,0,20,200,20,0,100)
  If Download
    Repeat
      Progress = HTTPProgress(Download)
      tempp.f =(Progress/ DownloadSize)*100
      SetGadgetState(Progressbar,tempp)
      WaitWindowEvent(1)
    Until Progress = #PB_HTTP_Success Or Progress  = #PB_HTTP_Failed
    
    If Progress = #PB_HTTP_Failed
      Goto FailedDownload
    EndIf
   
    CloseWindow(Progresswindow)
  Else
    FailedDownload:
    CloseWindow(Progresswindow)
    MessageRequester("Error","Download failed. Pls install tesseract manually.")
  EndIf
EndProcedure
Procedure GuidedInstaller()
  program = RunProgram(GetTemporaryDirectory()+"TesseractInstaller.exe","","",#PB_Program_Open )
  If program
    Repeat
      Delay(10)
      handle = FindWindow_(0,"Installer Language")
    Until handle > 0
    SetActiveWindow_(handle)
    Delay(200)
    ;Sprache
    Keyboard_PushAndRelease(#VK_RETURN)
    Delay(200)
    ;Empfehlung
    Keyboard_PushAndRelease(#VK_RETURN)
    ;Lizenz
    Delay(200)
    Keyboard_PushAndRelease(#VK_RETURN)
    ;Benutzer
    Delay(200)
    Keyboard_PushAndRelease(#VK_TAB)
    Keyboard_PushAndRelease(#VK_TAB)
    Keyboard_PushAndRelease(#VK_TAB)
    Keyboard_PushAndRelease(#VK_SPACE)
    Keyboard_PushAndRelease(#VK_RETURN)
    ;Packages
    Delay(200)
    Keyboard_PushAndRelease(#VK_RETURN)
    ;Pfad
    Wunschpfad.s = GetCurrentDirectory()+"Tesseract"
    SetClipboardText(Wunschpfad)
    
    ;Str+A
    Keyboard_Push(#VK_CONTROL)
    Keyboard_Push(#VK_A)
    Delay(100)
    Keyboard_Release(#VK_CONTROL)
    Keyboard_Release(#VK_A)
    Delay(100)
    ;Str+V
    Keyboard_Push(#VK_CONTROL)
    Keyboard_Push(#VK_V)
    Delay(100)
    Keyboard_Release(#VK_CONTROL)
    Keyboard_Release(#VK_V)
    Keyboard_PushAndRelease(#VK_RETURN)
    Delay(100)
    
    ;Startmenü
    Keyboard_PushAndRelease(#VK_TAB)
    Keyboard_PushAndRelease(#VK_TAB)
    Keyboard_PushAndRelease(#VK_SPACE)
    Keyboard_PushAndRelease(#VK_RETURN)
    Delay(6000)
    ;Installation
    Keyboard_PushAndRelease(#VK_RETURN)
    Delay(200)
    Keyboard_PushAndRelease(#VK_RETURN)
    Delay(200)
    
    DeleteFile(GetTemporaryDirectory()+"TesseractInstaller.exe")
    
    ProcedureReturn 1
  Else
    ProcedureReturn 0  
  EndIf
EndProcedure

Procedure OCR(*Parameter.OCRStruct)
  Uniquename.s = Str(*Parameter\x)+Str(*Parameter\y)+Str(*Parameter\h)+Str(*Parameter\w)
  img = MakeDesktopScreenshot()
  ocrimage = GrabImage(img,#PB_Any,*Parameter\x,*Parameter\y,*Parameter\w,*Parameter\h)
  If Not IsImage(ocrimage)
    ProcedureReturn 0
  EndIf
  FreeImage(img)
  SaveImage(ocrimage,GetCurrentDirectory()+Uniquename+".png",#PB_ImagePlugin_PNG)
  FreeImage(ocrimage)
  prog = RunProgram(TesseractExe,Chr(34)+GetCurrentDirectory()+Uniquename+".png"+Chr(34)+" "+Chr(34)+GetCurrentDirectory()+Uniquename+Chr(34),GetCurrentDirectory(),#PB_Program_Hide | #PB_Program_Wait)
  DeleteFile(GetCurrentDirectory()+Uniquename+".png")
  If FileSize(GetCurrentDirectory()+Uniquename+".txt") > 0
    f = ReadFile(#PB_Any,GetCurrentDirectory()+Uniquename+".txt")
    While Not Eof(f)
      ocrtext.s + ReadString(f)
    Wend
    CloseFile(f)
    DeleteFile(GetCurrentDirectory()+Uniquename+".txt")
  EndIf
  LockMutex(OCRMutex)
  OCRStrings(*Parameter\Title) = ocrtext
  UnlockMutex(OCRMutex)
  
EndProcedure
Procedure.s SingleOCR(image,x,y,w,h)
  If Not IsImage(image)
    ProcedureReturn ""
  EndIf
  
  Uniquename.s = Str(x)+Str(y)+Str(h)+Str(w)
  
  ;Bildausschnitt
  ocrimage = GrabImage(image,#PB_Any,x,y,w,h)
  SaveImage(ocrimage,GetCurrentDirectory()+Uniquename+".png",#PB_ImagePlugin_PNG)
;   ShowLibraryViewer("image",ocrimage)
  FreeImage(ocrimage)
  
  prog = RunProgram(TesseractExe,Chr(34)+GetCurrentDirectory()+Uniquename+".png"+Chr(34)+" "+Chr(34)+GetCurrentDirectory()+Uniquename+Chr(34)+" --psm 7",GetCurrentDirectory(),#PB_Program_Hide | #PB_Program_Wait)
  
  DeleteFile(GetCurrentDirectory()+Uniquename+".png")
  If FileSize(GetCurrentDirectory()+Uniquename+".txt") > 0
    f = ReadFile(#PB_Any,GetCurrentDirectory()+Uniquename+".txt")
    While Not Eof(f)
      ocrtext.s + ReadString(f)
    Wend
    CloseFile(f)
    DeleteFile(GetCurrentDirectory()+Uniquename+".txt")
  EndIf
  ProcedureReturn ocrtext
  
EndProcedure
Procedure.s NumberOCR(image,x,y,w,h)
  If Not IsImage(image)
    ProcedureReturn ""
  EndIf
  
  Uniquename.s = Str(x)+Str(y)+Str(h)+Str(w)
  
  ;Bildausschnitt
  ocrimage = GrabImage(image,#PB_Any,x,y,w,h)
  SaveImage(ocrimage,GetCurrentDirectory()+Uniquename+".png",#PB_ImagePlugin_PNG)
;   ShowLibraryViewer("image",ocrimage)
  FreeImage(ocrimage)
  
  prog = RunProgram(TesseractExe,Chr(34)+GetCurrentDirectory()+Uniquename+".png"+Chr(34)+" "+Chr(34)+GetCurrentDirectory()+Uniquename+Chr(34)+" --psm 7 nobatch digits",GetCurrentDirectory(),#PB_Program_Hide | #PB_Program_Wait)
  
  DeleteFile(GetCurrentDirectory()+Uniquename+".png")
  If FileSize(GetCurrentDirectory()+Uniquename+".txt") > 0
    f = ReadFile(#PB_Any,GetCurrentDirectory()+Uniquename+".txt")
    While Not Eof(f)
      ocrtext.s + ReadString(f)
    Wend
    CloseFile(f)
    DeleteFile(GetCurrentDirectory()+Uniquename+".txt")
  EndIf
  ProcedureReturn ocrtext
  
EndProcedure

Procedure InitReadStatusMessages(*ParameterIncoming.OCRStruct)
  ParameterInside.OCRStruct
  CopyStructure(*ParameterIncoming,ParameterInside,OCRStruct)
  Repeat
    ocr(ParameterInside)
  ForEver
EndProcedure
Procedure.s OCRStatus(Text.s)
  LockMutex(OCRMutex)
    Text.s = OCRStrings(Text)
  UnlockMutex(OCRMutex)
  
  ProcedureReturn Text
EndProcedure
Procedure StartOCRWatch(x,y,w,h,Title.s)
  Parameter.OCRStruct
  Parameter\x = x
  Parameter\y = y
  Parameter\w = w
  Parameter\h = h
  Parameter\Title = Title
  OCRWatches(Title) = CreateThread(@InitReadStatusMessages(),Parameter)
  Delay(100)
EndProcedure
Procedure StopOCRWatch(Title.s)
  KillThread(OCRWatches(Title))
  DeleteMapElement(OCRWatches(),Title)
EndProcedure

Procedure FocusWindow(Title.s)
  hwnd = FindWindow_(0,Title)
  SetForegroundWindow_(hwnd)
  Delay(1)
  ProcedureReturn hwnd
EndProcedure
Procedure MaxWindow(hwnd)
  SetWindowPos_(hwnd,0,-8,-31,DesktopWidth(0)+16,DesktopHeight(0)-2,0)
EndProcedure

CompilerIf #PB_Compiler_IsIncludeFile
;Install Tesseract if needed
If FileSize(TesseractExe) <= 0
  DownloadTesseract()
  GuidedInstaller()
EndIf
CompilerElse
  Debug "Nutze mich nur per include"
CompilerEndIf


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 26
; FirstLine = 22
; Folding = AABAA+
; EnableThread
; EnableXP