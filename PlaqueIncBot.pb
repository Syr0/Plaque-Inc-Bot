IncludeFile "IO.pb"

Structure Px
  List Points.Pixels()  
EndStructure
Structure InfectCost
  Cost.i
  x.i
  y.i
EndStructure

Enumeration
  #KILL
  #INFECT
  #PIMMELN
EndEnumeration

WinTitle.s = "Plague Inc Evolved"

Global Cooldown = 3000
Global NewMap Pattern.Px()
StrategieModus = #PIMMELN
CoolOk = 0
Global NewMap ExcludeList()
Global NewMap Infectionpoint1.InfectCost()
Global NewMap Infectionpoint2.InfectCost()
Global NewMap Infectionpoint3.InfectCost()
Global NewMap ResistancePoint.InfectCost()
Global NewMap TransportPoint1.InfectCost()
Global NewMap TransportPoint2.InfectCost()
Global NewMap Symptoms.InfectCost()

;{ Infection
Infectionpoint1("Schaf")\x= 642
Infectionpoint1("Schaf")\y= 259

Infectionpoint1("Ratte")\x= 339
Infectionpoint1("Ratte")\y= 355

Infectionpoint1("Vogel")\x= 338
Infectionpoint1("Vogel")\y= 174

Infectionpoint1("Spritze")\x= 638
Infectionpoint1("Spritze")\y= 627

Infectionpoint1("Insekt")\x= 327
Infectionpoint1("Insekt")\y= 635

; Infectionpoint1("Luft")\x= 792
; Infectionpoint1("Luft")\y= 341

Infectionpoint2("Vogel 2")\x= 418
Infectionpoint2("Vogel 2")\y= 217

Infectionpoint2("Ratte 2")\x= 420
Infectionpoint2("Ratte 2")\y= 307

Infectionpoint2("Schaf 2")\x= 570
Infectionpoint2("Schaf 2")\y= 308

Infectionpoint2("Luft 2")\x= 958
Infectionpoint2("Luft 2")\y= 261


Infectionpoint2("Spritze 2")\x= 580
Infectionpoint2("Spritze 2")\y= 577

Infectionpoint2("Insekt 2")\x= 407
Infectionpoint2("Insekt 2")\y= 584

Infectionpoint3("Tiere 3")\x= 502
Infectionpoint3("Tiere 3")\y= 265
;}
;{ Reistance
ResistancePoint("Kalt")\x= 333
ResistancePoint("Kalt")\y= 177

ResistancePoint("Kalt 2")\x= 417
ResistancePoint("Kalt 2")\y= 219
;}
;{ Transport
TransportPoint1("Wasser")\x= 885
TransportPoint1("Wasser")\y= 494

TransportPoint2("Wasser 2")\x= 963
TransportPoint2("Wasser 2")\y= 445
;}
;{ Symptoms
Symptoms("1")\x = 651	
Symptoms("1")\y = 173
Symptoms("2")\x = 729	
Symptoms("2")\y = 217
Symptoms("3")\x = 804	
Symptoms("3")\y = 258
Symptoms("4")\x = 727	
Symptoms("4")\y = 310
Symptoms("5")\x = 651	
Symptoms("5")\y = 357
Symptoms("6")\x = 649	
Symptoms("6")\y = 446
;}

;{
AddElement(Pattern("OK")\Points())
Pattern("OK")\Points()\x = 1374
Pattern("OK")\Points()\y = 583
Pattern("OK")\Points()\Color = $FFFFFF

AddElement(Pattern("OK")\Points())
Pattern("OK")\Points()\x = 1386
Pattern("OK")\Points()\y = 581
Pattern("OK")\Points()\Color = $FFFFFF

AddElement(Pattern("OK")\Points())
Pattern("OK")\Points()\x = 1392
Pattern("OK")\Points()\y = 575
Pattern("OK")\Points()\Color = $FFFFFF

AddElement(Pattern("OK")\Points())
Pattern("OK")\Points()\x = 1393
Pattern("OK")\Points()\y = 585
Pattern("OK")\Points()\Color = $FFFFFF


AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 818
Pattern("WIN")\Points()\y = 469
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 908
Pattern("WIN")\Points()\y = 482
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 907
Pattern("WIN")\Points()\y = 407
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 1001
Pattern("WIN")\Points()\y = 406
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 1000
Pattern("WIN")\Points()\y = 482
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 1091
Pattern("WIN")\Points()\y = 469
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 1068
Pattern("WIN")\Points()\y = 406
Pattern("WIN")\Points()\Color = $FFFFFF

AddElement(Pattern("WIN")\Points())
Pattern("WIN")\Points()\x = 1071
Pattern("WIN")\Points()\y = 445
Pattern("WIN")\Points()\Color = $FFFFFF

;}

Procedure ShowSymptoms()
  Keyboard_PushAndRelease(#VK_Q)
  Delay(100)
  Keyboard_PushAndRelease(#VK_3)
  Delay(100)
EndProcedure
Procedure HideSymptoms()
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
  Mouse_LClickOnPosition(200,800)
EndProcedure
Procedure ShowSkills()
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
  Keyboard_PushAndRelease(#VK_4)
  Delay(50)
EndProcedure
Procedure HideSkills()
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
  Mouse_LClickOnPosition(200,800)
EndProcedure
Procedure ShowSpread()
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
  Keyboard_PushAndRelease(#VK_2)
  Delay(50)
EndProcedure
Procedure HideSpread()
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
  Mouse_LClickOnPosition(200,800)
EndProcedure

Procedure Startup()
  
Mouse_LClickOnPosition(1391,584) : Delay(50)
Mouse_LClickOnPosition(1384,582) : Delay(50)
Mouse_LClickOnPosition(1374,491) : Delay(400)
Mouse_LClickOnPosition(1399,455) : Delay(50)

Mouse_LClickOnPosition(200,800)
Delay(20)
Keyboard_PushAndRelease(#VK_3)

EndProcedure

Procedure CloseStatistics()
  Keyboard_PushAndRelease(#VK_E)
  Delay(200)
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
  Keyboard_PushAndRelease(#VK_Q)
  Delay(50)
EndProcedure

Procedure Rueckentwickeln()
  Image = MakeDesktopScreenshot()
  NewList Position.Pixels()
  ;Links -> Rechts, dann unten
  AddElement(Position()) : Position()\x =344 :   Position()\y = 177 :  Position()\Color = $10103
  AddElement(Position()) : Position()\x =669 :   Position()\y = 176 :  Position()\Color = 0
  AddElement(Position()) : Position()\x =970 :   Position()\y = 161 :  Position()\Color = 0
  AddElement(Position()) : Position()\x =339 :   Position()\y = 603 :  Position()\Color = 0
  AddElement(Position()) : Position()\x =644 :   Position()\y = 619 :  Position()\Color = 0
  AddElement(Position()) : Position()\x =967 :   Position()\y = 623 :  Position()\Color = 0
 

  ForEach Position()
    temp.POINT\x = Position()\x
    temp\y = Position()\y
    c = colorpick(Image,temp) 
;     Debug "Farbe: "+Str(c) +" #"+Str(ListIndex(Position()))
  If c = Position()\Color
    Mouse_LClickOnPosition(Position()\x,Position()\y) : Delay(200)
    Mouse_LClickOnPosition(1178,918):    Delay(200)
    Mouse_LClickOnPosition(1084,621):    Delay(200)
  EndIf
Next
FreeImage(image)

EndProcedure
Procedure CoolResist()
  ShowSkills()
  ForEach ResistancePoint()
    ;Doppelclick
    Mouse_LClickOnPosition(ResistancePoint()\x,ResistancePoint()\y)
    Delay(30)
    Mouse_LClickOnPosition(ResistancePoint()\x,ResistancePoint()\y)
    Delay(30)
    ;Nein falls schon vorhanden war
    Mouse_LClickOnPosition(800,622)
  Next
  HideSkills()
  Delay(50)
  
  ShowSpread()
  ForEach TransportPoint1()
    ;Doppelclick
    Mouse_LClickOnPosition(TransportPoint1()\x,TransportPoint1()\y)
    Delay(30)
    Mouse_LClickOnPosition(TransportPoint1()\x,TransportPoint1()\y)
    Delay(30)
    ;Nein falls schon vorhanden war
  Next
  ForEach TransportPoint2()
    ;Doppelclick
    Mouse_LClickOnPosition(TransportPoint2()\x,TransportPoint2()\y)
    Delay(30)
    Mouse_LClickOnPosition(TransportPoint2()\x,TransportPoint2()\y)
    Delay(30)
    ;Nein falls schon vorhanden war
  Next
  HideSpread()
  Delay(50)
  
EndProcedure

Procedure IncreaseInfectionLevel()
  ShowSpread()
  ForEach Infectionpoint1()
    Mouse_LClickOnPosition(Infectionpoint1()\x,Infectionpoint1()\y)
    Mouse_LClickOnPosition(Infectionpoint1()\x,Infectionpoint1()\y)
    Delay(40)
  Next
;   ForEach Infectionpoint2()
;     Mouse_LClickOnPosition(Infectionpoint2()\x,Infectionpoint2()\y)
;     Mouse_LClickOnPosition(Infectionpoint2()\x,Infectionpoint2()\y)
;     Delay(40)
;   Next
;   ForEach Infectionpoint3()
;     Mouse_LClickOnPosition(Infectionpoint3()\x,Infectionpoint3()\y)
;     Mouse_LClickOnPosition(Infectionpoint3()\x,Infectionpoint3()\y)
;     Delay(40)
;   Next
  HideSpread()
EndProcedure
Procedure IncreaseMortality()
  ;braucht 94 Punkte
  ShowSymptoms()
  ForEach Symptoms()
    Mouse_LClickOnPosition(Symptoms()\x,Symptoms()\y)
    Mouse_LClickOnPosition(Symptoms()\x,Symptoms()\y)
    Delay(100)
  Next
  HideSymptoms()
EndProcedure
Procedure AdvancedMortality()
  
EndProcedure

; t = ElapsedMilliseconds()
WindowHandle = FocusWindow(WinTitle)
MaxWindow(WindowHandle)

Startup()

Repeat
;   Debug "FPS: "+StrF(1000/(ElapsedMilliseconds()-t))
   t= ElapsedMilliseconds()
  Delay(1)
  
  Image = MakeDesktopScreenshot()
  ;{ Exclude Landinfo
  StartDrawing(ImageOutput(Image))
    Box(594,879,754,200,0)
  StopDrawing()
  ;}
  ;{ Klicke auf OK's
  If PixelPatternCheck(image,Pattern("OK")\Points())
    Title.s = SingleOCR(Image,680,410,700,50)
    Keyboard_PushAndRelease(#VK_RETURN)
    If FindString(UCase(Title),"MUTIERT") And (StrategieModus = #PIMMELN Or StrategieModus = #INFECT)
      ShowSymptoms()
      Rueckentwickeln()
      HideSymptoms()
    ElseIf FindString(UCase(Title),"GESAMTE MENSCHHEIT")
      StrategieModus = #kill
      IncreaseMortality()
    EndIf
    Continue
  EndIf
  ;}
  ;{ Win?
  If PixelPatternCheck(image,Pattern("WIN")\Points())
    Break
  EndIf
  ;}
  ;{ BallonKlicker
  NewList PossiblePositions.POINT()
  ;Kreis
  ;oberer Punkt
  If FindImageColor(image,$F6F6F6,5,PossiblePositions())
    
    ;Lösche Exludelist-Zeug
    ForEach PossiblePositions()
      str.s = Str(PossiblePositions()\x)+":"+Str(PossiblePositions()\y)
      If FindMapElement(ExcludeList(),str)
        If t > ExcludeList(str)
          DeleteMapElement(ExcludeList(),str)
        Else
          DeleteElement(PossiblePositions())
        EndIf
      EndIf
    Next
    
    StartDrawing(ImageOutput(Image))
    ForEach PossiblePositions()
      For z = 72 To 76
        If PossiblePositions()\y+z > ImageHeight(image)-1
          Continue
        EndIf
        
        ;Unterer Punkt
        c = Point(PossiblePositions()\x,PossiblePositions()\y+z)
        
        If Red(c)  +30 >= Red($F6F6F6)   And Red(c)  -10 <= Red($F6F6F6)   And
           Green(c)+40 >= Green($F6F6F6) And Green(c)-10 <= Green($F6F6F6) And
           Blue(c) +55 >= Blue($F6F6F6)  And Blue(c) -10 <= Blue($F6F6F6) 
          
          ;Check gegen Grönland
          n = Point(PossiblePositions()\x,PossiblePositions()\y+8)
          If Red(n)  +30 >= Red($F6F6F6)   And Red(n)  -10 <= Red($F6F6F6)   And
             Green(n)+40 >= Green($F6F6F6) And Green(n)-10 <= Green($F6F6F6) And
             Blue(n) +55 >= Blue($F6F6F6)  And Blue(n) -10 <= Blue($F6F6F6) 
            Continue
          EndIf
          n = Point(PossiblePositions()\x,PossiblePositions()\y+z-8)
          If Red(n)  +30 >= Red($F6F6F6)   And Red(n)  -10 <= Red($F6F6F6)   And
             Green(n)+40 >= Green($F6F6F6) And Green(n)-10 <= Green($F6F6F6) And
             Blue(n) +55 >= Blue($F6F6F6)  And Blue(n) -10 <= Blue($F6F6F6) 
            Continue
          EndIf
          
          ;        If c = $F6F6F6
           Circle(PossiblePositions()\x,PossiblePositions()\y,10,#Red)
           Circle(PossiblePositions()\x,PossiblePositions()\y+z,10,#Blue)
          
          trefferlinks = 0
          trefferrechts = 0
          
          For xoff = 30 To 50
            If PossiblePositions()\x+xoff > ImageWidth(image)-1
              Continue
            ElseIf PossiblePositions()\x-xoff < 0
              Continue
            EndIf
            yoff = Round(z/2,#PB_Round_Down)
            
            If PossiblePositions()\y+yoff > ImageHeight(image)-1
              Continue
            EndIf
            
            c = Point(PossiblePositions()\x+xoff,PossiblePositions()\y+yoff)
            
            If Red(c)  +30 >= Red($F6F6F6)   And Red(c)  -10 <= Red($F6F6F6)   And
               Green(c)+40 >= Green($F6F6F6) And Green(c)-10 <= Green($F6F6F6) And
               Blue(c) +55 >= Blue($F6F6F6)  And Blue(c) -10 <= Blue($F6F6F6)
              trefferrechts = xoff
            EndIf
            
            b = Point(PossiblePositions()\x-xoff,PossiblePositions()\y+yoff)
            If Red(b)  +30 >= Red($F6F6F6)   And Red(b)  -10 <= Red($F6F6F6)   And
               Green(b)+40 >= Green($F6F6F6) And Green(b)-10 <= Green($F6F6F6) And
               Blue(b) +55 >= Blue($F6F6F6)  And Blue(b) -10 <= Blue($F6F6F6) 
              trefferlinks = xoff
            EndIf
            If trefferlinks And trefferrechts
               Circle(PossiblePositions()\x+trefferrechts,PossiblePositions()\y+yoff,10,#Green)
               Circle(PossiblePositions()\x-trefferlinks,PossiblePositions()\y+yoff,10,#Green)
              Break
            EndIf
          Next
          
          If trefferlinks And trefferrechts
            str.s = Str(PossiblePositions()\x)+":"+Str(PossiblePositions()\y)
            ExcludeList(str) = ElapsedMilliseconds() + Cooldown
            GetCursorPos_(Mouse.POINT)
            Mouse_LClickOnPosition(PossiblePositions()\x,PossiblePositions()\y+yoff)
            Delay(20)
            Mouse_LClickOnPosition(Mouse\x,Mouse\y)
            Delay(200)
            Break
          EndIf
        EndIf
      Next
    Next
    
    StopDrawing()
  EndIf
  FreeList(PossiblePositions())
  ;}
  ;{ Fehlklicks abwickeln
  Temp.POINT\x = 82
  temp\y = 37
  If Not Colorpick(Image,Temp) = $F1F2F2
    CloseStatistics()
    Delay(200)
  EndIf
  ;}
  ;{ StrategieEntscheidung
  If strategieModus = #PIMMELN
    If ElapsedMilliseconds() -lastDNAUpdate >10000
      DNAPoints = Val(NumberOCR(Image,90,990,65,50))
      lastDNAUpdate = ElapsedMilliseconds()
      If DNAPoints > 0
        If DNAPoints > 46 And CoolOk = 0
          CoolOk = 1
          CoolResist()
        EndIf
        If DNAPoints > 70
          ReadyToChangeMode +1
        EndIf
        If ReadyToChangeMode = 3
          StrategieModus = #INFECT
          ReadyToChangeMode = 0
          IncreaseInfectionLevel()
        EndIf
      EndIf
    EndIf
  ElseIf strategieModus = #INFECT
    temp.POINT\x = 1296
    temp\y = 1010
    c = Colorpick(Image,temp)
    If Red(c) > Blue(c)
      strategieModus = #kill
      IncreaseMortality()
    EndIf

  ElseIf strategieModus = #kill
    If ElapsedMilliseconds() -lastDNAUpdate >10000
      DNAPoints = Val(NumberOCR(Image,90,990,65,50))
      lastDNAUpdate = ElapsedMilliseconds()
      If DNAPoints > 100 And Mortality_1
          AdvancedMortality()
      EndIf
    EndIf
  EndIf
  ;}
  
    FreeImage(image)
Until GetAsyncKeyState_(#VK_ESCAPE)
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 14
; FirstLine = 2
; Folding = wAgA-
; EnableThread
; EnableXP
; DPIAware