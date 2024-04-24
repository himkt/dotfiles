
function clean_platform_specific_env () {
  prefixes=("$@")

  paths=("${(@s/:/)PATH}")
  cleaned_paths=()

  for path in $paths; do
    match=0
    for prefix in $prefixes; do
      if [[ $path == $prefix* ]]; then
        match=1
        break
      fi
    done
    if [[ $match -eq 0 ]]; then
      cleaned_paths+=$path
    fi
  done

  export PATH=`echo ${(j/:/)cleaned_paths}`
}

function change_platform () {
  local current_platform="$(uname -m)"
  local next_platform="$1"

  if [ "$current_platform" = "$next_platform" ] ; then
    return
  fi

  if type deactivate > /dev/null 2>&1; then
    echo "Automatically deactivate virtualenv"
    deactivate
  fi

  clean_platform_specific_env $HOMEBREW_ROOT $PYENV_ROOT $NODENV_ROOT $RYE_HOME

  case "${next_platform}" in
    arm64*)
      arch -arm64  env PLATFORM_HIST="$PLATFORM_HIST" PATH_HIST="$PATH_HIST" zsh ;;
    x86_64*)
      arch -x86_64 env PLATFORM_HIST="$PLATFORM_HIST" PATH_HIST="$PATH_HIST" zsh ;;
  esac
}

# user facing interface
function use-platform () {
  push_front $1
}

function push_front () {
  local path="$(PWD)"

  if [ -z "$PATH_HIST" ]; then
    PATH_HIST="$path"
    PLATFORM_HIST="$1"
  else
    PATH_HIST="$path,$PATH_HIST"
    PLATFORM_HIST="$1,$PLATFORM_HIST"
  fi
}

function pop_front () {
  if [ -z "$PATH_HIST" ]; then
    return
  fi

  PATH_HIST=$(echo "$PATH_HIST" | awk '{
    sub(/^[^,]*,?/, "")
    print
  }')
  PLATFORM_HIST=$(echo "$PLATFORM_HIST" | awk '{
    sub(/^[^,]*,?/, "")
    print
  }')
}

function get_front_platform() {
  echo "$PLATFORM_HIST" | cut -d , -f 1
}

function get_front_path() {
  echo "$PATH_HIST" | cut -d , -f 1
}

function switch_platform () {
  local platform_file=.apple-silicon-platform

  while [[ $(pwd) != "$(get_front_path)"* ]] ; do
    if [ -z "$(get_front_path)" ] ; then
      break
    fi
    pop_front
  done

  if test -f $platform_file ; then
    if [[ "$(PWD)" != "$(get_front_path)" ]] ; then
      push_front "$(cat $platform_file)"
    fi
  fi

  case "$(get_front_platform)" in
    arm64*)
      change_platform "arm64"  ;;
    x86_64*)
      change_platform "x86_64" ;;
    *)
      change_platform "arm64"  ;;  # default to "arm64"
  esac
}

typeset -a precmd_functions
precmd_functions+=(switch_platform)
