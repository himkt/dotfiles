#InstallKeybdHook
#UseHook


is_terminal()
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


; Mac-style commands (Win + {key})

; cursor
^a::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {HOME}
  return

<#a::
  send ^a
  return

^b::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {Left}
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

; cursor
^d::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {DEL}
  return

; cursor
^e::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {END}
  return

; cursor
^f::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {Right}
  return

^+f::
  if is_terminal()
    send %A_ThisHotKey%
  else
    send ^f
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
  ; vim: c-{p,n}
  if is_terminal()
    send ^n
  else
    send #n
  return

^p::
  ; vim: c-{p,n}
  if is_terminal()
    send %A_ThisHotKey%
  else
    send {Up}
  return

<#r::
  send ^r
  return

<^r::
  ; vim: redo
  if is_terminal()
    ; FIXME (himkt): %A_ThisHotKey%
    send ^r
  else
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
  if is_terminal()
    ; FIXME (himkt): %A_ThisHotKey%
    send ^x
  else
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

<#+Left::
  send ^+{Left}
  return

<^Left::
  send #{Left}
  return

<#Right::
  send ^{Right}
  return

<#+Right::
  send ^+{Right}
  return

<^Right::
  send #{Right}
  return

<#Up::
  send ^{Up}
  return

<#+Up::
  send ^+{Up}
  return

<^Up::
  send #{Up}
  return

<#Down::
  send ^{Down}
  return

<#+Down::
  send ^+{Down}
  return

<^Down::
  send #{Down}
  return

<#Backspace::
  send ^{BS}
  return

<#Enter::
  send ^{Enter}
  return
