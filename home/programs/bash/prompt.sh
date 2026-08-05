# Note 1: git-prompt.sh is sourced by home-manager's programs.bash.initExtra

# Note 2: GIT_PS1_SHOWDIRTYSTATE = "1", GIT_PS1_SHOWSTASHSTATE = "1" and
# GIT_PS1_SHOWUNTRACKEDFILES = "1" are exported by home-manager's home.sessionVariables

# Git prompt integration is loaded by home-manager's programs.bash.initExtra.
#
# These variables are exported by home-manager's home.sessionVariables:
#   GIT_PS1_SHOWDIRTYSTATE=1
#   GIT_PS1_SHOWSTASHSTATE=1
#   GIT_PS1_SHOWUNTRACKEDFILES=1

# Prompt appearance settings
USE_POWERLINE=1

# Available styles:
#   standard   - Bash \w path format
#   breadcrumb - custom path separators
#   simple     - minimal fallback prompt
PROMPT_STYLE="breadcrumb"

# Bash shortens paths using this value when \w is used
PROMPT_DIRTRIM=2

# ------------------------------------------------------------
# Terminal capability detection
# ------------------------------------------------------------

has_truecolor() {
  case ${COLORTERM,,} in
  truecolor | 24bit | 24-bit)
    return 0
    ;;
  esac

  if command -v infocmp >/dev/null 2>&1; then
    if infocmp -1 2>/dev/null | grep -qE '(^|,)(Tc|RGB)($|,)'; then
      return 0
    fi
  fi

  case ${TERM,,} in
  *-direct | *-truecolor | *-24bit | *-24bits | *-256color)
    return 0
    ;;
  alacritty | foot | ghostty | kitty | konsole | wezterm | iterm2)
    return 0
    ;;
  esac

  return 1
}

# Detect once at shell startup instead of every prompt render
if has_truecolor; then
  TRUECOLOR=1
else
  TRUECOLOR=0
fi

# ------------------------------------------------------------
# Static prompt configuration
# ------------------------------------------------------------

if [[ "$USE_POWERLINE" == "1" ]]; then
  PROMPT_SEPARATOR=$' \356\202\261 '
else
  PROMPT_SEPARATOR=' > '
fi

if declare -F __git_ps1 >/dev/null 2>&1; then
  HAS_GIT_PS1=1
else
  HAS_GIT_PS1=0
fi

# ------------------------------------------------------------
# Path rendering
# ------------------------------------------------------------

get_path_display() {
  if [[ "$PROMPT_STYLE" == "breadcrumb" ]]; then
    local path="${PWD/#$HOME/~}"

    path="${path#/}"
    path="${path//\//$PROMPT_SEPARATOR}"

    [[ -z "$path" ]] && path="/"

    printf '%s' "$path"
  else
    printf '%s' '\w'
  fi
}

# ------------------------------------------------------------
# Git status rendering
# ------------------------------------------------------------

get_git_colored() {
  ((HAS_GIT_PS1)) || return

  local git_status_raw
  git_status_raw=$(__git_ps1 "%s")

  [[ -z "$git_status_raw" ]] && return

  local branch_name="${git_status_raw%%[*+$%]*}"
  local state="${git_status_raw#"$branch_name"}"

  local output=""
  local i char color

  if ((TRUECOLOR)); then
    local branch_color="85;255;85"
    local dirty_color="255;85;85"
    local untracked_color="255;135;0"
    local stash_color="0;175;255"
    local reset_color="100;255;100"

    output="\[\e[38;2;${branch_color}m\](${branch_name}"

    for ((i = 0; i < ${#state}; i++)); do
      char="${state:i:1}"

      case "$char" in
      '*' | '+')
        color="$dirty_color"
        ;;
      '$')
        color="$stash_color"
        ;;
      '%')
        color="$untracked_color"
        ;;
      *)
        continue
        ;;
      esac

      output+="\[\e[38;2;${color}m\]${char}\[\e[38;2;${branch_color}m\]"
    done

    output+=")\[\e[38;2;${reset_color}m\]"
  else
    output="\[\e[32m\](${branch_name}"

    for ((i = 0; i < ${#state}; i++)); do
      char="${state:i:1}"

      case "$char" in
      '*' | '+')
        color="31"
        ;;
      '$')
        color="36"
        ;;
      '%')
        color="33"
        ;;
      *)
        continue
        ;;
      esac

      output+="\[\e[${color}m\]${char}\[\e[32m\]"
    done

    output+=")\[\e[0m\]"
  fi

  printf '%s' "$output"
}

# ------------------------------------------------------------
# Prompt generation
# ------------------------------------------------------------

set_ps1() {
  local path_display git_info

  path_display=$(get_path_display)
  git_info=$(get_git_colored)

  if [[ "$PROMPT_STYLE" == "simple" ]]; then
    PS1='[\[\e[1;33m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\] \[\e[1;32m\]\W\[\e[0m\]\[\e[33m\]$(parse_git_branch)\[\e[0m\]]\$ '
    return
  fi

  if ((TRUECOLOR)); then
    local accent_color_1="95;215;255"
    local accent_color_2="68;68;68"
    local text_color_1="28;28;28"
    local text_color_2="255;255;95"
    local text_color_3="238;238;238"

    if [[ "$USE_POWERLINE" == "1" ]]; then
      PS1="\n\342\224\214\342\224\200 \[\e[38;2;${accent_color_1}m\]\356\202\262\[\e[0m\e[48;2;${accent_color_1}m\e[38;2;${text_color_1}m\] \u@\h \[\e[0m\e[48;2;${accent_color_2}m\e[38;2;${accent_color_1}m\]\356\202\260\[\e[38;2;${text_color_2}m\] ${path_display}${git_info} \[\e[0m\e[38;2;${accent_color_2}m\]\356\202\260\n\[\e[38;2;${text_color_3}m\]\$\[\e[0m\] "
    else
      PS1="\n\342\224\214\342\224\200 [\[\e[38;2;${text_color_3}m\]\u@\h\[\e[0m\]] \[\e[38;2;${text_color_2}m\]${path_display}${git_info}\[\e[0m\]\n\342\224\224\342\224\200 \[\e[38;2;${text_color_3}m\]\$\[\e[0m\] "
    fi
  else
    PS1="\n┌─ [\[\e[33m\]\u@\h\[\e[0m\]] \[\e[32m\]${path_display}\[\e[33m\]${git_info}\[\e[0m\]\n└─ \$ "
  fi
}

# ------------------------------------------------------------
# Bash prompt hooks
# ------------------------------------------------------------

# Keep history synchronized between shell instances.
# Prompt generation is lazy through PS1 command substitution.
PROMPT_COMMAND=(
  'history -a'
  'history -n'
)

PS1='$(set_ps1)'
