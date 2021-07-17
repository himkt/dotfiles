#InstallKeybdHook
#UseHook


is_target()
{
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
  IfWinActive,ahk_class Emacs ; NTEmacs
    Return 1
  Return 0
}


SetKeyDelay 0


; Cursor

^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {HOME}
  Return

^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {END}
  Return

; Mac-style commands

<#a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send ^a
  Return

