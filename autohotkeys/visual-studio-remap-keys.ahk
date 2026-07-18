#SingleInstance Force
;Persistent

get_active_window_name() {
    return ProcessGetName(WinGetPID("A"))
}

#HotIf get_active_window_name() == "devenv.exe" ;Only remaps when inside visualstudio
^o:: Send "^{-}"
^i:: Send "^+{-}"
#HotIf
