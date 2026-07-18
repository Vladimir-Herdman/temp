#SingleInstance Force

open_terminal_to_filedir(filepath) {
    splitPath filepath, , &dirpath
    Run 'wt.exe -d "' dirpath '" powershell'
}

get_active_window_name() {
    return ProcessGetName(WinGetPID("A"))
}

; #1::
; {
;     ; classname := WinGetClass("A")
;     classname := WinGetTitle("A")
;     MsgBox "This is the window name: " classname
; }

!f::WinMaximize "A"

!+q::WinClose(WinActive("A"))

!+v::
{
    if WinExist("Microsoft Visual Studio")
        WinActivate
    else
        Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio.lnk"
}

!+o::
{
    if WinExist("ahk_exe Obsidian.exe")
        WinActivate
    else
        Run "C:\Users\S5Y2\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk"
}

!+c::
{
    if WinExist("ahk_exe msedge.exe")
        WinActivate
    else
        Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
}

!+e::
{
    if WinExist("ahk_exe explorer.exe")
        WinActivate
    else
        Run "C:\Windows\explorer.exe"
}

!+w:: Run "wsl"
!+u:: Run 'C:\Users\S5Y2\vova\autohotkeys\execute-all-autohotkey-scripts.ahk'

;Will treat like in visual studio, use up and then open to that dir. If terminal
;already open, just focus that one.
!+t::
{
    ;'devenv.exe' is Visual Studio's process name.
    if not get_active_window_name() == "devenv.exe" and not WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") {
        open_terminal_to_filedir("C:\Users\S5Y2\vova\")
        return
    }

    if WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") {
        WinActivate
        return
    }

    original_clipboard_contents := A_Clipboard

    Send "yp"
    Sleep 200
    filepath := A_Clipboard

    if fileExist(filepath)
        open_terminal_to_filedir(filepath)
    else {
        MsgBox "File Not Found - Original clipboard contents (will put back in): `n'" original_clipboard_contents "'`n`nInside current clipboard: `n'" A_Clipboard "'`n`nInside filepath: `n'" filepath "'"
        A_Clipboard := original_clipboard_contents
    }

}
