#SingleInstance Force

;Terminal will close after nvim is left.
open_file_in_nvim(filepath) {
    Run 'wt.exe powershell -Command "nvim ' filepath '"'
}

get_active_window_name() {
    return ProcessGetName(WinGetPID("A"))
}

;<window-ctrl-shift-n> - show current clipboard contents.
#^+n:: MsgBox "Inside clipboard: `n'" A_Clipboard "'"

;<ctrl-shift-n> - Open clipboard file in nvim, or try 'yp' in visual studio.
!+n::
{
    filepath := A_Clipboard
    if FileExist(filepath) {
        open_file_in_nvim(filepath)
        return
    }

    ;File not found, try if visual studio open. 'yp' for visual studio filepath keymap.
    if not get_active_window_name() == "devenv.exe" { ;'devenv.exe' is Visual Studio's process name.
        open_file_in_nvim("C:\Users\S5Y2\vova")
        return
    }

    original_clipboard_contents := A_Clipboard

    Send "yp"
    Sleep 200
    filepath := A_Clipboard

    if FileExist(filepath)
        open_file_in_nvim(filepath)
    else {
        MsgBox "File Not Found - Original clipboard contents (will put back in): `n'" original_clipboard_contents "'`n`nInside current clipboard: `n'" A_Clipboard "'`n`nInside filepath: `n'" filepath "'"
        A_Clipboard := original_clipboard_contents
    }
}

!+p::
{
    Run "wsl"
    Sleep 1000
    SendInput "poetry{Enter}"
}
