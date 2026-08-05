```bash
# Custom Bash prompt configuration

# Prompt options
# Set to0 for plain-text separators without Powerline symbols
USE_POWERLINE=1
# Prompt style: "standard" for \w, "breadcrumb" for custom separators, "simple" for minimal fallback
PROMPT_STYLE="breadcrumb"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

has_truecolor() {
  case "${COLORTERM}" in
    truecolor|24bit|24-bit|direct)
      return 0
      ;;
  esac

  [[ "$(tput colors 2>/dev/null || echo 0)" -ge 256 ]] || return 1

  case "$TERM" in
    *256*|*truecolor*|*24bit*|kitty|foot|ghostty|wezterm|alacritty|tmux-256color|xterm-256color)
      return 0
      ;;
  esac

  return 1
}

prompt_path() {
  if [[ "$PROMPT_STYLE" != "breadcrumb" ]]; then
    printf '%s' '\w'
    return
  fi

  local sep
  if [[ "$USE_POWERLINE" == 1 ]]; then
    sep=$(printf ' \356\202\261 ')
  else
    sep=' > '
  fi

  local path
  path="${PWD/#$HOME/~}"
  path="${path#/}"

  if [[ -z "$path" ]]; then
    printf '/'
    return
  fi

  printf '%s' "$path" | sed "s|/|${sep}|g"
}

prompt_git() {
  if command -v __git_ps1 >/dev/null 2>&1; then
    local raw
    raw=$(__git_ps1 "%s")

    [[ -z "$raw" ]] && return

    if has_truecolor; then
      printf '\[\e[38;2;85;255;85m\]%s\[\e[0m\]' "$raw"
    else
      printf '\[\e[32m\]%s\[\e[0m\]' "$raw"
    fi
  fi
}

if has_truecolor; then
  PS1='\n\
\[\e[38;2;95;215;255m\]\
\[\e[48;2;95;215;255m\e[38;2;28;28;28m\] \u@\h \
\[\e[0m\e[48;2;68;68;68m\e[38;2;255;255;95m\] \
\[\e[38;2;255;255;95m\]$(prompt_path) $(prompt_git) \
\[\e[0m\e[38;2;68;68;68m\]\
\n\[\e[38;2;238;238;238m\]\$ \[\e[0m\]'
else
  PS1='\n┌─ [\u@\h] $(prompt_path) $(prompt_git)\n└─ \$ '
fi

# Keep history synchronized between terminals
PROMPT_COMMAND="history -a; history -n"
```
