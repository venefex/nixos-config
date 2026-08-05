# Prompt: multi-line with username@host, path (trimmed), and Git info
PROMPT_DIRTRIM=2

# Source Git prompt helpers if available
if [[ -r /usr/share/git/completion/git-prompt.sh ]]; then
  . /usr/share/git/completion/git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# Simple Git status (branch + indicators)
__git_info() {
  if command -v __git_ps1 >/dev/null 2>&1; then
    local info=$(__git_ps1 " (%s)")
    [[ -n $info ]] && printf '\[\e[33m\]%s\[\e[0m\]' "$info"
  fi
}

set_ps1() {
  PS1='\n┌─ [\[\e[33m\]\u@\h\[\e[0m\]] \[\e[32m\]\w\[\e[0m\]$(__git_info)\n└─ \$ '
}

PROMPT_COMMAND="history -a; history -n; set_ps1"
