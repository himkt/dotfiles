#InstallKeybdHook
#UseHook


is_terminal()
{
  ifWinActive,ahk_exe WindowsTerminal.exe
    return 1
  return 0
}


^a::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {HOME}
  return

^e::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {END}
  return

#+a::
  send #a
  return

#a::
  send ^a
  return
