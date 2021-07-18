#InstallKeybdHook
#UseHook


is_target()
{
  ; In terminal app, I disable AHK
  ifWinActive,ahk_exe WindowsTerminal.exe
    return 1
  return 0
}


SetKeyDelay 0


; Cursor

^a::
  if is_target()
    send %A_ThisHotkey%
  else
    send {HOME}
  return

^e::
  if is_target()
    send %A_ThisHotkey%
  else
    send {END}
  return

^p::
  if is_target()
    send %A_ThisHotkey%
  else
    send {Up}
  return

^n::
  if is_target()
    send %A_ThisHotkey%
  else
    send {Down}
  return

^f::
  if is_target()
    send %A_ThisHotKey%
  else
    send {Right}
  return

^b::
  if is_target()
    send %A_ThisHotKey%
  else
    send {Left}
  return


; Mac-style commands

<#a::
  if is_target()
    send %A_ThisHotkey%
  else
    send ^a
  return

