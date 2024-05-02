function prepare-default-paths () {
  paths=()
  for path in `cat /etc/paths`; do
    paths+=$path
  done
  echo ${(j/:/)paths}
}

function change-platform () {
  local current_platform="$(uname -m)"
  local next_platform="$1"

  if [ "$current_platform" = "$next_platform" ] ; then
    return
  fi

  # for python virtualenv
  if type deactivate > /dev/null 2>&1; then
    echo "Automatically deactivate virtualenv"
    deactivate
  fi

  case "${next_platform}" in
    arm64*)
      arch -arm64  env PATH="$(prepare-default-paths)" PLATFORM_HIST="$PLATFORM_HIST" PATH_HIST="$PATH_HIST" zsh ;;
    x86_64*)
      arch -x86_64 env PATH="$(prepare-default-paths)" PLATFORM_HIST="$PLATFORM_HIST" PATH_HIST="$PATH_HIST" zsh ;;
  esac
}

# user facing interface
function set-platform () {
  echo "$1" > .apple-silicon-platform
}

# user facing interface
function use-platform () {
  push-front $1
}

function push-front () {
  local path="$(PWD)"

  if [ -z "$PATH_HIST" ]; then
    PATH_HIST="$path"
    PLATFORM_HIST="$1"
  else
    PATH_HIST="$path,$PATH_HIST"
    PLATFORM_HIST="$1,$PLATFORM_HIST"
  fi
}

function pop-front () {
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

function get-front-platform() {
  echo "$PLATFORM_HIST" | cut -d , -f 1
}

function get-front-path() {
  echo "$PATH_HIST" | cut -d , -f 1
}

function switch-platform () {
  local platform_file=.apple-silicon-platform

  while [[ $(pwd) != "$(get-front-path)"* ]] ; do
    if [ -z "$(get-front-path)" ] ; then
      break
    fi
    pop-front
  done

  if test -f $platform_file ; then
    if [[ "$(PWD)" != "$(get-front-path)" ]] ; then
      push-front "$(cat $platform_file)"
    fi
  fi

  # default to "arm64"
  local default_platform="${DEFAULT_APPLE_SILICON_PLATFORM:-arm64}"
  case "$(get-front-platform)" in
    arm64*)
      change-platform "arm64"  ;;
    x86_64*)
      change-platform "x86_64" ;;
    *)
      change-platform $default_platform  ;;
  esac
}

typeset -a precmd_functions
precmd_functions+=(switch-platform)
