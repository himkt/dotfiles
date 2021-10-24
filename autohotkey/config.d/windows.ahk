#InstallKeybdHook
#UseHook


is_terminal()
{
  ifWinActive,ahk_exe WindowsTerminal.exe
    return 1
  return 0
}


; windows shortcut

  #+a::
    send #a
    return

  #+b::
    send #b
    return

  #+c::
    send #c
    return

  #+d::
    send #d
    return

  #+e::
    send #e
    return

  #+f::
    send #f
    return

  #+g::
    send #g
    return

  #+h::
    send #h
    return

  #+i::
    send #i
    return

  #+j::
    send #j
    return

  #+k::
    send #k
    return

  #+l::
    send #l
    return

  #+m::
    send #m
    return

  #+n::
    send #n
    return

  #+o::
    send #o
    return

  #+p::
    send #p
    return

  #+q::
    send #q
    return

  #+r::
    send #r
    return

  #+s::
    send #s
    return

  #+t::
    send #t
    return

  #+u::
    send #u
    return

  #+v::
    send #v
    return

  #+w::
    send #w
    return

  #+x::
    send #x
    return

  #+y::
    send #y
    return

  #+z::
    send #z
    return

; emacs binding
  ^a::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {HOME}
    }
    return

  ^b::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {Left}
    }
    return

  ^d::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {DEL}
    }
    return

  ^e::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {END}
    }
    return

  ^f::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {Right}
    }
    return

  ^n::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {Down}
    }
    return

  ^p::
    if is_terminal() {
      send %A_ThisHotKey%
    } else {
      send {Up}
    }
    return

; mac-style shortcut

  #a::
    send ^a
    return

  #b::
    send ^b
    return

  #c::
    send ^c
    return

  #d::
    send ^d
    return

  #e::
    send ^e
    return

  #f::
    send ^f
    return

  #g::
    send ^g
    return

  #h::
    send ^h
    return

  #i::
    send ^i
    return

  #j::
    send ^j
    return

  #k::
    send ^k
    return

  #l::
    send ^l
    return

  #m::
    send ^m
    return

  #n::
    send ^n
    return

  #o::
    send ^o
    return

  #p::
    send ^p
    return

  #q::
    send ^q
    return

  #r::
    send ^r
    return

  #s::
    send ^s
    return

  #t::
    send ^t
    return

  #u::
    send ^u
    return

  #v::
    send ^v
    return

  #w::
    send ^w
    return

  #x::
    send ^x
    return

  #y::
    send ^y
    return

  #z::
    send ^z
    return
