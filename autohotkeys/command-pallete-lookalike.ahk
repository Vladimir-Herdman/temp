funcmap := Map(
    "vs, vscode, visual studio, visualstudio",   visualstudio,
    "obsidian",                                  obsidian,
    "microsoft edge",                            edge,
    "file explorer",                             explorer,
    "terminal",                                  terminal,
    "wsl",                                       wsl,
    "teams, text",                               teams,
    "outlook, email",                            outlook,
    "update",                                    update,
    "task manager",                              taskmanager,
    "ace",                                       ace,
    "eagle, gaven, blazor",                      eagle,
    "ediscovery, zach, hrfeed",                  eDiscovery,
    "map",                                       ahkmap,
    "current",                                   current,
    "docker",                                    docker,
    "gitcodes",                                  gitcodes,
)

#!Space::
{
    input := InputBox("", "", "w250 h75")
    if input.Result == "Cancel"
        return

    for key, val in funcmap
        if RegExMatch(StrLower(key), StrLower(input.Value)) {
            val()
            return
        }

    MsgBox "No option found. Input was " input.Value
}

#SingleInstance Force

visualstudio() {
    if WinExist("Microsoft Visual Studio")
        WinActivate
    else
        Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio.lnk"
}
obsidian() {
    if WinExist("ahk_exe Obsidian.exe")
        WinActivate
    else
        Run "C:\Users\S5Y2\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk"
}
edge() {
    if WinExist("ahk_exe msedge.exe")
        WinActivate
    else
        Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
}
explorer() {
    if WinExist("ahk_exe explorer.exe")
        WinActivate
    else
        Run "C:\Windows\explorer.exe"
}
terminal() {
    if WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
        WinActivate
    else
        Run 'wt.exe -d "' "C:\Users\S5Y2\vova\" '" powershell'
}
wsl() {
    Run "wsl"
}
teams() {
    if WinExist("ahk_exe ms-teams.exe")
        WinActivate
    else
        Run "ms-teams.exe"
}
outlook() {
    if winexist("ahk_exe olk.exe")
        winactivate
    else
        run "olk.exe"
}
update() {
    Run 'C:\Users\S5Y2\vova\autohotkeys\execute-all-autohotkey-scripts.ahk'
}
taskmanager() {
    if winexist("ahk_exe Taskmgr.exe")
        winactivate
    else
        Send "^+{Esc}"
}
ace() {
    Run "C:\Projects\ACE\Marathon.ACE.slnx"
}
eagle() {
    Run "C:\Projects\EAGLE\EAGLE.slnx"
}
eDiscovery() {
    Run "C:\Projects\eDiscovery-Feed/Mpc.Law.EDiscovery.Feed.sln"
}
ahkmap() {
    Run 'wt.exe powershell -Command "nvim ' "C:\Users\S5Y2\vova\autohotkeys\command-pallete-lookalike.ahk" '"'
    Sleep 2000
    SendInput "{Enter}"
}
current() {
    ; Run "C:\Users\S5Y2\Downloads\Intern_Co-op PDP Discussion Form (2026).docx"
    Run "https://mympc-my.sharepoint.com/personal/vtherdman_marathonpetroleum_com/Documents/Intern_Co-op%20PDP%20Discussion%20Form%20(2026).docx?web=1"
}
docker() {
    Run "C:\Users\S5Y2\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Docker Desktop.lnk"
}
gitcodes() {
    Run 'wt.exe powershell -Command "nvim ' "C:\Users\S5Y2\vova\git\codes.txt" '"'
}
