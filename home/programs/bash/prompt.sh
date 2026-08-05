# Note 1: git-prompt.sh is sourced by home-manager's programs.bash.initExtra

# Note 2: GIT_PS1_SHOWDIRTYSTATE = "1", GIT_PS1_SHOWSTASHSTATE = "1" and
# GIT_PS1_SHOWUNTRACKEDFILES = "1" are exported by home-manager's home.sessionVariables

# Set to 0 for plain-text separators without Powerline symbols
USE_POWERLINE=1

# Prompt style: "standard" for \w, "breadcrumb" for custom separators, "simple" for minimal fallback
PROMPT_STYLE="breadcrumb"

# Prompt: multi-line with username@host, path (trimmed), and Git info
PROMPT_DIRTRIM=2

# Function to detect truecolor (24-bit color) support in the terminal.
# Returns 0 if supported, 1 otherwise, by checking environment variables and terminal capabilities.
has_truecolor() {
  # Explicit truecolor hints
  case ${COLORTERM,,} in
  truecolor | 24bit | 24-bit)
    return 0
    ;;
  esac

  # Terminfo truecolor capabilities
  if command -v infocmp >/dev/null 2>&1; then
    if infocmp -1 2>/dev/null | grep -qE '(^|,)(Tc|RGB)($|,)'; then
      return 0
    fi
  fi

  # Common TERM values known to imply truecolor
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

# Fallback function for simple Git branch parsing (used in "simple" PROMPT_STYLE)
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Sub-function to get path display based on PROMPT_STYLE
get_path_display() {
  local path_display="\w" # Default to standard full path

  if [ "$PROMPT_STYLE" = "breadcrumb" ]; then
    local breadcrumb_path=$(echo "$PWD" | sed -e "s:$HOME:~:" -e 's:^/::' -e "s:\([^/]*\)/:\1$sep:g")
    if [[ -z "$breadcrumb_path" ]]; then
      breadcrumb_path="/"
    fi
    path_display="$breadcrumb_path"
  fi

  echo "$path_display"
}

# Sub-function to get colored Git information
get_git_colored() {
  local git_status_raw=""

  if command -v __git_ps1 >/dev/null 2>&1; then
    git_status_raw=$(__git_ps1 "%s")
  fi

  if [ -n "$git_status_raw" ]; then
    local branch_name="${git_status_raw%%[*+$%]*}"
    local state="${git_status_raw#"$branch_name"}"
    local git_colored=""

    if has_truecolor; then
      local branch_color="85;255;85"    # Green for branch name
      local dirty_color="255;85;85"     # Red for dirty/modified indicators
      local untracked_color="255;135;0" # Orange for untracked files
      local stash_color="0;175;255"     # Cyan for stashed changes
      local text_color="100;255;100"    # Green for overall text

      git_colored="\[\e[38;2;${branch_color}m\](${branch_name}"
      for ((i = 0; i < ${#state}; i++)); do
        local char="${state:$i:1}"
        local indicator_color=""
        case "$char" in
        '*' | '+') indicator_color="${dirty_color}" ;;
        '$') indicator_color="${stash_color}" ;;
        '%') indicator_color="${untracked_color}" ;;
        *) continue ;;
        esac
        git_colored+="\[\e[38;2;${indicator_color}m\]${char}\[\e[38;2;${branch_color}m\]"
      done
      git_colored+=")\[\e[38;2;${text_color}m\]"
    else
      local branch_color="32"    # Green for branch name
      local dirty_color="31"     # Red for dirty/modified indicators
      local untracked_color="33" # Yellow (fallback for orange) for untracked files
      local stash_color="36"     # Cyan for stashed changes

      git_colored="\[\e[${branch_color}m\](${branch_name}"
      for ((i = 0; i < ${#state}; i++)); do
        local char="${state:$i:1}"
        local indicator_color=""
        case "$char" in
        '*' | '+') indicator_color="${dirty_color}" ;;
        '$') indicator_color="${stash_color}" ;;
        '%') indicator_color="${untracked_color}" ;;
        *) continue ;;
        esac
        git_colored+="\[\e[${indicator_color}m\]${char}\[\e[${branch_color}m\]"
      done
      git_colored+=")\[\e[0m\]"
    fi

    echo "$git_colored"
  fi
}

set_ps1() {
  local sep
  if [ "${USE_POWERLINE}" = "1" ]; then
    sep=$(printf ' \356\202\261 ')
  else
    sep=' > '
  fi

  local git_colored=$(get_git_colored)
  local path_display=$(get_path_display)

  if [ "$PROMPT_STYLE" = "simple" ]; then
    # Simple fallback prompt using parse_git_branch
    PS1='[\[\e[1;33m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\] \[\e[1;32m\]\W\[\e[0m\]\[\e[33m\]$(parse_git_branch)\[\e[0m\]]\$ '
    return
  fi

  if has_truecolor; then
    local accent_color_1="95;215;255" # Sky Blue for highlights (e.g., username/host background)
    local accent_color_2="68;68;68"   # Dark Gray for path background
    local text_color_1="28;28;28"     # Near Black for text on accent_color_1
    local text_color_2="255;255;95"   # Light Yellow for path text
    local text_color_3="238;238;238"  # Light Gray for prompt symbol ($)

    if [ "${USE_POWERLINE}" = "1" ]; then
      PS1="\n\342\224\214\342\224\200 \[\e[38;2;${accent_color_1}m\]\356\202\262\[\e[0m\e[48;2;${accent_color_1}m\e[38;2;${text_color_1}m\] \u@\h \[\e[0m\e[48;2;${accent_color_2}m\e[38;2;${accent_color_1}m\]\356\202\260\[\e[38;2;${text_color_2}m\] ${path_display}${git_colored} \[\e[0m\e[38;2;${accent_color_2}m\]\356\202\260\n\[\e[38;2;${text_color_3}m\]$\[\e[0m\] "
    else
      PS1="\n\342\224\214\342\224\200 [\[\e[38;2;${text_color_3}m\]\u@\h\[\e[0m\]] \[\e[38;2;${text_color_2}m\]${path_display}${git_colored}\[\e[0m\]\n\342\224\224\342\224\200 \[\e[38;2;${text_color_3}m\]$\[\e[0m\] "
    fi
  else
    # Fallback to basic 16 colors
    PS1="\n┌─ [\[\e[33m\]\u@\h\[\e[0m\]] \[\e[32m\]${path_display}\[\e[33m\]${git_colored}\[\e[0m\]\n└─ \$ "
  fi
}

# Keep history synchronized between shell instances.
# Prompt generation is lazy through PS1 command substitution.
PROMPT_COMMAND=(
  'history -a'
  'history -n'
)

PS1='$(set_ps1)'
