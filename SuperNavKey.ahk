;=========================
; SuperNavKey
;
;    SuperNavKey is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    SuperNavKey is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with SuperNavKey.  If not, see <http://www.gnu.org/licenses/>.
;
;
;=========================
; Configuration

;CutDownLeft=Numpad1
;CutDown=Numpad2
;CutDownRight=Numpad3
;CutLeft=Numpad4
;ZoomFull=Numpad5
;CutRight=Numpad6
;CutUpLeft=Numpad7
;CutUp=Numpad8
;CutUpRight=Numpad9
;LeftClick=Numpad0
;RightClick=NumpadDot
;StopSuperNavKey=Esc

;CutDownLeft=b
;CutDown=j
;CutDownRight=n
;CutLeft=h
;ZoomFull=w
;CutRight=l
;CutUpLeft=y
;CutUp=k
;CutUpRight=u
;LeftClickEnd=Space
;LeftClick=1
;RightClickEnd=r
;RightClick=3
;GoBackInHistory=a
;StopSuperNavKey=Esc

CutDownLeft=$m
CutDown=$,
CutDownRight=$.
CutLeft=$j
CutRight=$l
CutUpLeft=$u
CutUp=$i
CutUpRight=$o

MoveDownLeft=$+m
MoveDown=$+,
MoveDownRight=$+.
MoveLeft=$+j
MoveRight=$+l
MoveUpLeft=$+u
MoveUp=$+i
MoveUpRight=$+o

ZoomFull=$k

LeftClickEnd=$*f
LeftClick=$*r
ToggleLeftClickDrag=$*4

RightClickEnd=$*d
RightClick=$*e
ToggleRightClickDrag=$*3

GoBackInHistory=$a
StopSuperNavKey=$Esc
SetMousePosition=$h
ZoomOut=$z
ZoomIn=$x
ReloadScript=$!
MoveToCursorPosition=$c
StartSuperNavKey=^`;
ScrollWheelUp=$[
ScrollWheelDown=$]

;=========================
;=========================







CoordMode, Mouse, Screen

Hotkey, %StartSuperNavKey%, ProcessHotKey
Hotkey, %MoveDownLeft%, ProcessHotKey
Hotkey, %MoveDown%, ProcessHotKey
Hotkey, %MoveDownRight%, ProcessHotKey
Hotkey, %MoveLeft%, ProcessHotKey
Hotkey, %MoveRight%, ProcessHotKey
Hotkey, %MoveUpLeft%, ProcessHotKey
Hotkey, %MoveUp%, ProcessHotKey
Hotkey, %MoveUpRight%, ProcessHotKey
Hotkey, %CutDownLeft%, ProcessHotKey
Hotkey, %CutDown%, ProcessHotKey
Hotkey, %CutDownRight%, ProcessHotKey
Hotkey, %CutLeft%, ProcessHotKey
Hotkey, %CutRight%, ProcessHotKey
Hotkey, %CutUpLeft%, ProcessHotKey
Hotkey, %CutUp%, ProcessHotKey
Hotkey, %CutUpRight%, ProcessHotKey
Hotkey, %ZoomFull%, ProcessHotKey
Hotkey, %LeftClick%, ProcessHotKey
Hotkey, %RightClick%, ProcessHotKey
Hotkey, %LeftClickEnd%, ProcessHotKey
Hotkey, %RightClickEnd%, ProcessHotKey
Hotkey, %GoBackInHistory%, ProcessHotKey
Hotkey, %StopSuperNavKey%, ProcessHotKey
Hotkey, %SetMousePosition%, ProcessHotKey
Hotkey, %ZoomOut%, ProcessHotKey
Hotkey, %ZoomIn%, ProcessHotKey
Hotkey, %ReloadScript%, ProcessHotKey
Hotkey, %ToggleLeftClickDrag%, ProcessHotKey
Hotkey, %ToggleRightClickDrag%, ProcessHotKey
Hotkey, %MoveToCursorPosition%, ProcessHotKey
Hotkey, %ScrollWheelUp%, ProcessHotKey
Hotkey, %ScrollWheelDown%, ProcessHotKey


Hotkey, %MoveDownLeft%, off
Hotkey, %MoveDown%, off
Hotkey, %MoveDownRight%, off
Hotkey, %MoveLeft%, off
Hotkey, %MoveRight%,  off
Hotkey, %MoveUpLeft%, off
Hotkey, %MoveUp%, off
Hotkey, %MoveUpRight%, off
Hotkey, %CutDownLeft%, off
Hotkey, %CutDown%, off
Hotkey, %CutDownRight%, off
Hotkey, %CutLeft%, off
Hotkey, %CutRight%, off
Hotkey, %CutUpLeft%, off
Hotkey, %CutUp%, off
Hotkey, %CutUpRight%, off
Hotkey, %ZoomFull%, off
Hotkey, %LeftClick%, off
Hotkey, %RightClick%, off
Hotkey, %LeftClickEnd%, off
Hotkey, %RightClickEnd%, off
Hotkey, %GoBackInHistory%,  off
Hotkey, %StopSuperNavKey%, off
Hotkey, %SetMousePosition%, off
Hotkey, %ZoomOut%, off
Hotkey, %ZoomIn%, off
Hotkey, %ReloadScript%, off
Hotkey, %ToggleLeftClickDrag%, off
Hotkey, %ToggleRightClickDrag%, off
Hotkey, %MoveToCursorPosition%, off
Hotkey, %ScrollWheelUp%, off
Hotkey, %ScrollWheelDown%, off
Return


ProcessHotKey:
If (A_ThisHotkey=StartSuperNavKey) {
 GoSub TurnSuperNavKeyOn
 Return
}
If (A_ThisHotkey=StopSuperNavKey) {
 GoSub TurnSuperNavKeyOff
 SuperNavKeyToggleOnOff := !SuperNavKeyToggleOnOff
 Return
}
If (A_ThisHotkey=LeftClickEnd) {
 MouseClick, left, CurrentXPosition, CurrentYPosition
 GoSub TurnSuperNavKeyOff
 SuperNavKeyToggleOnOff := !SuperNavKeyToggleOnOff
 Return
}
If (A_ThisHotkey=SetMousePosition) {
 MouseMove, CurrentXPosition, CurrentYPosition, 0
 Return
}
If (A_ThisHotkey=LeftClick) {
 MouseClick, left, CurrentXPosition, CurrentYPosition
 Return
}

If (A_ThisHotkey=ToggleLeftClickDrag) {
 if !GetKeyState("LButton", "P"){
  Click %CurrentXPosition%, %CurrentYPosition% down
 }else{
  Click %CurrentXPosition%, %CurrentYPosition% up
  GoSub TurnSuperNavKeyOff
  SuperNavKeyToggleOnOff := !SuperNavKeyToggleOnOff
 }
 Return
}

If (A_ThisHotkey=ToggleRightClickDrag) {
 if !GetKeyState("RButton", "P"){
  Click %CurrentXPosition%, %CurrentYPosition% right down
 }else{
  Click %CurrentXPosition%, %CurrentYPosition% right up
  GoSub TurnSuperNavKeyOff
  SuperNavKeyToggleOnOff := !SuperNavKeyToggleOnOff
 }
 Return
}

If (A_ThisHotkey=RightClickEnd) {
 MouseClick, right, CurrentXPosition, CurrentYPosition
 GoSub TurnSuperNavKeyOff
 SuperNavKeyToggleOnOff := !SuperNavKeyToggleOnOff
 Return
}
If (A_ThisHotkey=RightClick) {
 MouseClick, right, CurrentXPosition, CurrentYPosition
 Return
}

If (A_ThisHotkey=ScrollWheelUp) {
 Send {WheelUp}
 Return
}

If (A_ThisHotkey=ScrollWheelDown) {
 Send {WheelDown}
 Return
}


If (A_ThisHotkey=ZoomFull) {
 Gosub TurnSuperNavKeyOn
 Return
}

If (A_ThisHotkey=ReloadScript) {
 Reload
 Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
 MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
 IfMsgBox, Yes, Edit
 Return
}

If (A_ThisHotkey=ZoomOut) {
 CountOfVerticalMoves:=CountOfVerticalMoves - 1
 CountOfHorizontalMoves:=CountOfHorizontalMoves - 1
 XChangeDistance:=0
 YChangeDistance:=0
}
If (A_ThisHotkey=ZoomIn) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=0
 YChangeDistance:=0
}

If (A_ThisHotkey=MoveToCursorPosition) {
 CountOfVerticalMoves:=3
 CountOfHorizontalMoves:=3
 MouseGetPos CurrentMousePositionXForMove, CurrentMousePositionYForMove
 CurrentXPosition:=CurrentMousePositionXForMove
 CurrentYPosition:=CurrentMousePositionYForMove
 XChangeDistance:=0
 YChangeDistance:=0
}

If (A_ThisHotkey=MoveDownLeft) {
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 XChangeDistance*=-1 ;make move negative (left)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
}
If (A_ThisHotkey=MoveDown) {
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 XChangeDistance:=0 ;cancel the left/right
}
If (A_ThisHotkey=MoveDownRight) {
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
}
If (A_ThisHotkey=MoveLeft) {
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=0 ;cancel the up/down part
 XChangeDistance*=-1 ;make move negative (left)
}
If (A_ThisHotkey=MoveRight) {
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=0 ;cancel the up/down part
}
If (A_ThisHotkey=MoveUpLeft) {
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 XChangeDistance*=-1 ;make move negative (left)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 YChangeDistance*=-1 ;make move negative (up)
}
If (A_ThisHotkey=MoveUp) {
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 XChangeDistance:=0 ;cancel the left/right
 YChangeDistance*=-1 ;make move negative (up)
}
If (A_ThisHotkey=MoveUpRight) {
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 YChangeDistance*=-1 ;make move negative (up)
}

If (A_ThisHotkey=CutDownLeft) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 XChangeDistance*=-1 ;make move negative (left)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
}
If (A_ThisHotkey=CutDown) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 XChangeDistance:=0 ;cancel the left/right
}
If (A_ThisHotkey=CutDownRight) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
}
If (A_ThisHotkey=CutLeft) {
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=0 ;cancel the up/down part
 XChangeDistance*=-1 ;make move negative (left)
}
If (A_ThisHotkey=CutRight) {
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=0 ;cancel the up/down part
}
If (A_ThisHotkey=CutUpLeft) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 XChangeDistance*=-1 ;make move negative (left)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 YChangeDistance*=-1 ;make move negative (up)
}
If (A_ThisHotkey=CutUp) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 XChangeDistance:=0 ;cancel the left/right
 YChangeDistance*=-1 ;make move negative (up)
}
If (A_ThisHotkey=CutUpRight) {
 CountOfVerticalMoves:=CountOfVerticalMoves + 1
 CountOfHorizontalMoves:=CountOfHorizontalMoves + 1
 XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
 YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)
 YChangeDistance*=-1 ;make move negative (up)
}

If (A_ThisHotkey=GoBackInHistory) {
 if (LastHistoryItemIndex > 1) {
  LastHistoryItemIndex-=1
  CurrentXPosition:=CurrentXPositionHistory%LastHistoryItemIndex%
  CurrentYPosition:=CurrentYPositionHistory%LastHistoryItemIndex%
  CountOfHorizontalMoves:=CountOfHorizontalMovesHistory%LastHistoryItemIndex%
  CountOfVerticalMoves:=CountOfVerticalMovesHistory%LastHistoryItemIndex%
  XChangeDistance:=XChangeDistanceHistory%LastHistoryItemIndex%
  YChangeDistance:=YChangeDistanceHistory%LastHistoryItemIndex%
 }else{
  LastHistoryItemIndex:=0
  GoSub TurnSuperNavKeyOn
  Return
 }
} else {
 LastHistoryItemIndex+=1
 CurrentXPositionHistory%LastHistoryItemIndex%:=CurrentXPosition
 CurrentYPositionHistory%LastHistoryItemIndex%:=CurrentYPosition
 CountOfHorizontalMovesHistory%LastHistoryItemIndex%:=CountOfHorizontalMoves
 CountOfVerticalMovesHistory%LastHistoryItemIndex%:=CountOfVerticalMoves
 XChangeDistanceHistory%LastHistoryItemIndex%:=XChangeDistance
 YChangeDistanceHistory%LastHistoryItemIndex%:=YChangeDistance
}

CurrentXPosition+=XChangeDistance
CurrentYPosition+=YChangeDistance

CurrentXPositionPlus1:=CurrentXPosition+1
CurrentYPositionPlus1:=CurrentYPosition+1

XChangeDistance:=A_ScreenWidth/(2**CountOfHorizontalMoves*2)
YChangeDistance:=A_ScreenHeight/(2**CountOfVerticalMoves*2)

XLeftOfBox:=CurrentXPosition-XChangeDistance
XRightOfBox:=CurrentXPosition+XChangeDistance
YTopOfBox:=CurrentYPosition-YChangeDistance
YBottomOfBox:=CurrentYPosition+YChangeDistance

intBoxWidth:=XChangeDistance*2
intBoxHeight:=YChangeDistance*2

intHalfBoxWidth:=XChangeDistance
intHalfBoxHeight:=YChangeDistance

intHalfBoxWidthMinus1:=XChangeDistance-1
intHalfBoxHeightMinus1:=YChangeDistance-1

Gui, VerticalLineMiddleTopDark: -Caption +ToolWindow +AlwaysOnTop
Gui, VerticalLineMiddleTopDark:Color, Red
Gui, VerticalLineMiddleTopDark:show, x%CurrentXPosition% y%YTopOfBox% w1 h%intHalfBoxHeight% NA

Gui, VerticalLineMiddleTopLight: -Caption +ToolWindow +AlwaysOnTop
Gui, VerticalLineMiddleTopLight:Color, Gray
Gui, VerticalLineMiddleTopLight:show, x%CurrentXPositionPlus1% y%YTopOfBox% w1 h%intHalfBoxHeight% NA

Gui, VerticalLineMiddleBottomDark: -Caption +ToolWindow +AlwaysOnTop
Gui, VerticalLineMiddleBottomDark:Color, Red
Gui, VerticalLineMiddleBottomDark:show, x%CurrentXPosition% y%CurrentYPositionPlus1% w1 h%intHalfBoxHeightMinus1% NA

Gui, VerticalLineMiddleBottomLight: -Caption +ToolWindow +AlwaysOnTop
Gui, VerticalLineMiddleBottomLight:Color, Gray
Gui, VerticalLineMiddleBottomLight:show, x%CurrentXPositionPlus1% y%CurrentYPositionPlus1% w1 h%intHalfBoxHeightMinus1% NA

Gui, VerticalLineLeft: -Caption +ToolWindow +AlwaysOnTop
Gui, VerticalLineLeft:Color, Red
Gui, VerticalLineLeft:show, x%XLeftOfBox% y%YTopOfBox% w1 h%intBoxHeight% NA

Gui, VerticalLineRight: -Caption +ToolWindow +AlwaysOnTop
Gui, VerticalLineRight:Color, Red
Gui, VerticalLineRight:show, x%XRightOfBox% y%YTopOfBox% w1 h%intBoxHeight% NA

Gui, HorizontalLineMiddleLeftDark: -Caption +ToolWindow +AlwaysOnTop
Gui, HorizontalLineMiddleLeftDark:Color, Red
Gui, HorizontalLineMiddleLeftDark:show, x%XLeftOfBox% y%CurrentYPosition% w%intHalfBoxWidth% h1 NA

Gui, HorizontalLineMiddleLeftLight: -Caption +ToolWindow +AlwaysOnTop
Gui, HorizontalLineMiddleLeftLight:Color, Gray
Gui, HorizontalLineMiddleLeftLight:show, x%XLeftOfBox% y%CurrentYPositionPlus1% w%intHalfBoxWidth% h1 NA

Gui, HorizontalLineMiddleRightDark: -Caption +ToolWindow +AlwaysOnTop
Gui, HorizontalLineMiddleRightDark:Color, Red
Gui, HorizontalLineMiddleRightDark:show, x%CurrentXPositionPlus1% y%CurrentYPosition% w%intHalfBoxWidthMinus1% h1 NA

Gui, HorizontalLineMiddleRightLight: -Caption +ToolWindow +AlwaysOnTop
Gui, HorizontalLineMiddleRightLight:Color, Gray
Gui, HorizontalLineMiddleRightLight:show, x%CurrentXPositionPlus1% y%CurrentYPositionPlus1% w%intHalfBoxWidthMinus1% h1 NA

Gui, HorizontalLineTop: -Caption +ToolWindow +AlwaysOnTop
Gui, HorizontalLineTop:Color, Red
Gui, HorizontalLineTop:show, x%XLeftOfBox% y%YTopOfBox% w%intBoxWidth% h1 NA

Gui, HorizontalLineBottom: -Caption +ToolWindow +AlwaysOnTop
Gui, HorizontalLineBottom:Color, Red
Gui, HorizontalLineBottom:show, x%XLeftOfBox% y%YBottomOfBox% w%intBoxWidth% h1 NA

Return ; End ProcessHotKey Section













TurnSuperNavKeyOn:
 Hotkey, %MoveDownLeft%, on
 Hotkey, %MoveDown%, on
 Hotkey, %MoveDownRight%, on
 Hotkey, %MoveLeft%, on
 Hotkey, %MoveRight%,  on
 Hotkey, %MoveUpLeft%, on
 Hotkey, %MoveUp%, on
 Hotkey, %MoveUpRight%, on
 Hotkey, %CutDownLeft%, on
 Hotkey, %CutDown%, on
 Hotkey, %CutDownRight%, on
 Hotkey, %CutLeft%, on
 Hotkey, %CutRight%, on
 Hotkey, %CutUpLeft%, on
 Hotkey, %CutUp%, on
 Hotkey, %CutUpRight%, on
 Hotkey, %ZoomFull%, on
 Hotkey, %LeftClick%, on
 Hotkey, %RightClick%, on
 Hotkey, %LeftClickEnd%, on
 Hotkey, %RightClickEnd%, on
 Hotkey, %GoBackInHistory%,  on
 Hotkey, %StopSuperNavKey%,  on
 Hotkey, %SetMousePosition%, on
 Hotkey, %ZoomOut%, on
 Hotkey, %ZoomIn%, on
 Hotkey, %ReloadScript%, on
 Hotkey, %ToggleLeftClickDrag%, on
 Hotkey, %ToggleRightClickDrag%, on
 Hotkey, %MoveToCursorPosition%, on
 Hotkey, %ScrollWheelUp%, on
 Hotkey, %ScrollWheelDown%, on

 Gui, VerticalLineMiddle:hide
 Gui, VerticalLineLeft:hide
 Gui, VerticalLineRight:hide
 Gui, HorizontalLineMiddle:hide
 Gui, HorizontalLineTop:hide
 Gui, HorizontalLineBottom:hide

 CountOfHorizontalMoves:=0
 CountOfVerticalMoves:=0

 CurrentXPosition := A_ScreenWidth/2
 CurrentYPosition := A_ScreenHeight/2

 CurrentXPositionPlus1:=CurrentXPosition+1
 CurrentYPositionPlus1:=CurrentYPosition+1

 CurrentXPositionMinus1:=CurrentXPosition-1
 CurrentYPositionMinus1:=CurrentYPosition-1

 Gui, VerticalLineMiddleTopDark: -Caption +ToolWindow +AlwaysOnTop
 Gui, VerticalLineMiddleTopDark:Color, Red
 Gui, VerticalLineMiddleTopDark:show, x%CurrentXPosition% y0 w1 h%CurrentYPosition% NA NA

 Gui, VerticalLineMiddleTopLight: -Caption +ToolWindow +AlwaysOnTop
 Gui, VerticalLineMiddleTopLight:Color, Gray
 Gui, VerticalLineMiddleTopLight:show, x%CurrentXPositionPlus1% y0 w1 h%CurrentYPosition% NA NA

 Gui, VerticalLineMiddleBottomDark: -Caption +ToolWindow +AlwaysOnTop
 Gui, VerticalLineMiddleBottomDark:Color, Red
 Gui, VerticalLineMiddleBottomDark:show, x%CurrentXPosition% y%CurrentYPositionPlus1% w1 h%CurrentYPosition% NA NA

 Gui, VerticalLineMiddleBottomLight: -Caption +ToolWindow +AlwaysOnTop
 Gui, VerticalLineMiddleBottomLight:Color, Gray
 Gui, VerticalLineMiddleBottomLight:show, x%CurrentXPositionPlus1% y%CurrentYPositionPlus1% w1 h%CurrentYPosition% NA NA

 Gui, HorizontalLineMiddleLeftDark: -Caption +ToolWindow +AlwaysOnTop
 Gui, HorizontalLineMiddleLeftDark:Color, Red
 Gui, HorizontalLineMiddleLeftDark:show, x0 y%CurrentYPosition% w%CurrentXPosition% h1 NA

 Gui, HorizontalLineMiddleLeftLight: -Caption +ToolWindow +AlwaysOnTop
 Gui, HorizontalLineMiddleLeftLight:Color, Gray
 Gui, HorizontalLineMiddleLeftLight:show, x0 y%CurrentYPositionPlus1% w%CurrentXPosition% h1 NA

 Gui, HorizontalLineMiddleRightDark: -Caption +ToolWindow +AlwaysOnTop
 Gui, HorizontalLineMiddleRightDark:Color, Red
 Gui, HorizontalLineMiddleRightDark:show, x%CurrentXPositionPlus1% y%CurrentYPosition% w%CurrentXPosition% h1 NA

 Gui, HorizontalLineMiddleRightLight: -Caption +ToolWindow +AlwaysOnTop
 Gui, HorizontalLineMiddleRightLight:Color, Gray
 Gui, HorizontalLineMiddleRightLight:show, x%CurrentXPositionPlus1% y%CurrentYPositionPlus1% w%CurrentXPosition% h1 NA



 LastHistoryItemIndex+=1
 CurrentXPositionHistory%LastHistoryItemIndex%:=CurrentXPosition
 CurrentYPositionHistory%LastHistoryItemIndex%:=CurrentYPosition
 CountOfHorizontalMovesHistory%LastHistoryItemIndex%:=CountOfHorizontalMoves
 CountOfVerticalMovesHistory%LastHistoryItemIndex%:=CountOfVerticalMoves
 XChangeDistanceHistory%LastHistoryItemIndex%:=0
 YChangeDistanceHistory%LastHistoryItemIndex%:=0
Return

TurnSuperNavKeyOff:
 Gui, VerticalLineMiddleTopDark:hide
 Gui, VerticalLineMiddleTopLight:hide
 Gui, VerticalLineMiddleBottomDark:hide
 Gui, VerticalLineMiddleBottomLight:hide
 Gui, VerticalLineLeft:hide
 Gui, VerticalLineRight:hide
 Gui, HorizontalLineMiddleLeftDark:hide
 Gui, HorizontalLineMiddleLeftLight:hide
 Gui, HorizontalLineMiddleRightDark:hide
 Gui, HorizontalLineMiddleRightLight:hide
 Gui, HorizontalLineTop:hide
 Gui, HorizontalLineBottom:hide
 CountOfHorizontalMoves:=0
 CountOfVerticalMoves:=0
 Hotkey, %MoveDownLeft%, off
 Hotkey, %MoveDown%, off
 Hotkey, %MoveDownRight%, off
 Hotkey, %MoveLeft%, off
 Hotkey, %MoveRight%,  off
 Hotkey, %MoveUpLeft%, off
 Hotkey, %MoveUp%, off
 Hotkey, %MoveUpRight%, off
 Hotkey, %CutDownLeft%, off
 Hotkey, %CutDown%, off
 Hotkey, %CutDownRight%, off
 Hotkey, %CutLeft%, off
 Hotkey, %CutRight%, off
 Hotkey, %CutUpLeft%, off
 Hotkey, %CutUp%, off
 Hotkey, %CutUpRight%, off
 Hotkey, %ZoomFull%, off
 Hotkey, %LeftClick%, off
 Hotkey, %RightClick%, off
 Hotkey, %LeftClickEnd%, off
 Hotkey, %RightClickEnd%, off
 Hotkey, %GoBackInHistory%,  off
 Hotkey, %StopSuperNavKey%, off
 Hotkey, %SetMousePosition%, off
 Hotkey, %ZoomOut%, off
 Hotkey, %ZoomIn%, off
 Hotkey, %ReloadScript%, off
 Hotkey, %ToggleLeftClickDrag%, off
 Hotkey, %ToggleRightClickDrag%, off
 Hotkey, %MoveToCursorPosition%, off
 Hotkey, %ScrollWheelUp%, off
 Hotkey, %ScrollWheelDown%, off
Return
