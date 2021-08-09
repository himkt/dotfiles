#InstallKeybdHook
#UseHook


is_not_terminal()
{
  ifWinActive,ahk_exe WindowsTerminal.exe
    return 1
  return 0
}

is_vscode()
{
  ifWinActive,ahk_exe Code.exe
    return 0
  return 1
}


SetKeyDelay 0


; Cursor

^a::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {HOME}
  return

^d::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {DEL}
  return

^e::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {END}
  return

^p::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Up}
  return

^n::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Down}
  return

^f::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Right}
  return

^+f::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send ^f
  return

^b::
  if is_not_terminal()
    send %A_ThisHotKey%
  else
    send {Left}
  return


; Mac-style commands (Win + {key})

<#a::
  send ^a
  return

<#b::
  if is_vscode()
    send %A_ThisHotKey%
  else
    send ^b
  return

<#c::
  send ^c
  return

<#d::
  send ^d
  return

; win+d -> win+m
<#m::
  send #d
  return

<#f::
  send ^f
  return

<#j::
  if is_vscode()
    send %A_ThisHotKey%
  else
    send ^j
  return

<#n::
  if is_vscode()
    send %A_ThisHotKey%
  else
    send ^n
  return

<^n::
  send #n
  return

<#r::
  send ^r
  return

<^r::
  send #r
  return

<#s::
  send ^s
  return

<#t::
  send ^t
  return

<#v::
  send ^+v
  return

<^+v::
  send #v
  return

<#w::
  send ^w
  return

<#x::
  send ^x
  return

<^x::
  send #x
  return

<#+z::
  send ^Z
  return

<#z::
  send ^z
  return

<#/::
  send ^/
  return

<#Space::
  send ^{Space}
  return

<#Left::
  send ^{Left}
  return

<^Left::
  send #{Left}
  return

<#Right::
  send ^{Right}
  return

<^Right::
  send #{Right}
  return

<#Up::
  send ^{Up}
  return

<^Up::
  send #{Up}
  return

<#Down::
  send ^{Down}
  return

<^Down::
  send #{Down}
  return
