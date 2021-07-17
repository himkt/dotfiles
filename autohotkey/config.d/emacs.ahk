#InstallKeybdHook
#UseHook


; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
  IfWinActive,ahk_class Emacs ; NTEmacs
    Return 1
  Return 0
}


SetKeyDelay 0

is_pre_x = 0
is_pre_spc = 0


; delete
delete_backward_char()
{
  Send {BS}
  global is_pre_spc = 0
  Return
}

^h::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_backward_char()
  Return


; newline
newline()
{
  Send {Enter}
  global is_pre_spc = 0
  Return
}

^m::
  If is_target()
    Send %A_ThisHotkey%
  Else
    newline()
  Return


; cursor
move_beginning_of_line()
{
  global
  if is_pre_spc
    Send +{HOME}
  Else
    Send {HOME}
  Return
}

move_end_of_line()
{
  global
  if is_pre_spc
    Send +{END}
  Else
    Send {END}
  Return
}

forward_char()
{
  global
  if is_pre_spc
    Send +{Right}
  Else
    Send {Right}
  Return
}

backward_char()
{
  global
  if is_pre_spc
    Send +{Left}
  Else
    Send {Left}
  Return
}

^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_beginning_of_line()
  Return

^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_end_of_line()
  Return

^f::
  If is_target()
    Send %A_ThisHotkey%
  Else
    forward_char()
  Return

^b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    backward_char()
  Return

select_all()
{
  global
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^a
   Return
}

<#a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    select_all()
  Return
