; Run WinRAR
; Paste D:\DesktopTesting\Untitled.rar + Enter
; Alt  E
; Click OK
; List files and check that it has files
; Clian directory
; Close WinRar

#include <Constants.au3>
#include <File.au3>

runProgram()
pasteText("D:\DesktopTesting\Untitled.rar", "[CLASS:WinRarWindow]", "Edit1")
ControlFocus("[CLASS:WinRarWindow]", "", "ComboBox1")
sendKeys("{ENTER}")
Sleep(1000)
ControlFocus("[CLASS:WinRarWindow]", "", "SysListView321")
sendKeys("!e")
Sleep(1000)
sendKeys("{ENTER}")
Sleep(1000)
checkFiles("D:\DesktopTesting\Untitled")
cleanDir("D:\DesktopTesting\Untitled")
closeWinRar()

Func runProgram()

   Run("C:\Program Files\WinRAR\WinRAR.exe")

EndFunc

Func pasteText(Const $textToPaste, Const $windowClass, Const $controlID)
   WinWaitActive($windowClass)
   Sleep(1000)
   ControlSetText($windowClass, "", $controlID, $textToPaste)

EndFunc

Func sendKeys(Const $key)
   Send($key)
EndFunc

Func checkFiles(Const $dir)
   $aFiles = _FileListToArray($dir, '*', 1)
   If IsArray($aFiles) Then
	  MsgBox(0, '', 'В папке' & @LF & '"' & $dir & '"' & @LF & $aFiles[0] & ' файлов.')
   Else
	  MsgBox(0, 'Error', 'В папке' & @LF & '"' & $dir & '"' & @LF & 'нет файлов.')
   EndIf
EndFunc

Func cleanDir($dir)
   DirRemove($dir,1)
   DirCreate($dir)
EndFunc

Func closeWinRar()
   $hWnd = WinWait("[CLASS:WinRarWindow]", "", 1)
   WinClose($hWnd)
EndFunc