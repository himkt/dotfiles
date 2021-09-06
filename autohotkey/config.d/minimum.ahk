#InstallKeybdHook
#UseHook


^a::
  send {HOME}
  return

^e::
  send {END}
  return

#+a::
  send #a
  return

#a::
  send ^a
return
