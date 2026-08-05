# Note 1: git-prompt.sh is sourced by home-manager's programs.bash.initExtra

# Note 2: GIT_PS1_SHOWDIRTYSTATE = "1", GIT_PS1_SHOWSTASHSTATE = "1" and
# GIT_PS1_SHOWUNTRACKEDFILES = "1" are exported by home-manager's home.sessionVariables

# ----------------------------
# One-time initialization
# ----------------------------

# Cache truecolor detection
if has_truecolor; then
    TRUECOLOR=1
else
    TRUECOLOR=0
fi

# Cache separator
if [[ "$USE_POWERLINE" == "1" ]]; then
    SEP=$' \356\202\261 '
else
    SEP=' > '
fi

# Cache git-prompt availability
if declare -F __git_ps1 >/dev/null 2>&1; then
    HAS_GIT_PS1=1
else
    HAS_GIT_PS1=0
fi


# ----------------------------
# Faster path rendering
# ----------------------------

get_path_display() {
    if [[ "$PROMPT_STYLE" == "breadcrumb" ]]; then
        local p=${PWD/#$HOME/~}
        p=${p#/}
        p=${p//\//$SEP}

        [[ -z "$p" ]] && p="/"
        printf '%s' "$p"
    else
        printf '%s' '\w'
    fi
}


# ----------------------------
# Faster git rendering
# ----------------------------

get_git_colored() {
    (( HAS_GIT_PS1 )) || return

    local git_status_raw
    git_status_raw=$(__git_ps1 "%s")

    [[ -z "$git_status_raw" ]] && return

    local branch_name="${git_status_raw%%[*+$%]*}"
    local state="${git_status_raw#"$branch_name"}"

    local git_colored
    local branch_color dirty_color untracked_color stash_color text_color

    if (( TRUECOLOR )); then
        branch_color="85;255;85"
        dirty_color="255;85;85"
        untracked_color="255;135;0"
        stash_color="0;175;255"
        text_color="100;255;100"

        git_colored="\[\e[38;2;${branch_color}m\](${branch_name}"

        local i char color
        for ((i=0; i<${#state}; i++)); do
            char=${state:i:1}

            case "$char" in
                '*'|'+') color=$dirty_color ;;
                '$')     color=$stash_color ;;
                '%')     color=$untracked_color ;;
                *)        continue ;;
            esac

            git_colored+="\[\e[38;2;${color}m\]${char}\[\e[38;2;${branch_color}m\]"
        done

        git_colored+=")\[\e[38;2;${text_color}m\]"
    else
        git_colored="\[\e[32m\](${branch_name}"

        local i char
        for ((i=0; i<${#state}; i++)); do
            char=${state:i:1}

            case "$char" in
                '*'|'+')
                    git_colored+="\[\e[31m\]${char}\[\e[32m\]"
                    ;;
                '$')
                    git_colored+="\[\e[36m\]${char}\[\e[32m\]"
                    ;;
                '%')
                    git_colored+="\[\e[33m\]${char}\[\e[32m\]"
                    ;;
            esac
        done

        git_colored+=")\[\e[0m\]"
    fi

    printf '%s' "$git_colored"
}


# ----------------------------
# Dynamic prompt update
# ----------------------------

set_ps1() {
    local path_display git_colored

    path_display=$(get_path_display)
    git_colored=$(get_git_colored)

    if (( TRUECOLOR )); then
        local accent1="95;215;255"
        local accent2="68;68;68"
        local text1="28;28;28"
        local text2="255;255;95"
        local text3="238;238;238"

        if [[ "$USE_POWERLINE" == "1" ]]; then
            PS1="\n\342\224\214\342\224\200 \[\e[38;2;${accent1}m\]\356\202\262\[\e[0m\e[48;2;${accent1}m\e[38;2;${text1}m\] \u@\h \[\e[0m\e[48;2;${accent2}m\e[38;2;${accent1}m\]\356\202\260\[\e[38;2;${text2}m\] ${path_display}${git_colored} \[\e[0m\e[38;2;${accent2}m\]\356\202\260\n\[\e[38;2;${text3}m\]\$\[\e[0m\] "
        else
            PS1="\n\342\224\214\342\224\200 [\[\e[38;2;${text3}m\]\u@\h\[\e[0m\]] \[\e[38;2;${text2}m\]${path_display}${git_colored}\[\e[0m\]\n\342\224\224\342\224\200 \[\e[38;2;${text3}m\]\$\[\e[0m\] "
        fi
    else
        PS1="\n┌─ [\[\e[33m\]\u@\h\[\e[0m\]] \[\e[32m\]${path_display}\[\e[33m\]${git_colored}\[\e[0m\]\n└─ \$ "
    fi
}


# ----------------------------
# Let Bash expand it only when needed
# ----------------------------

PROMPT_COMMAND=(
    'history -a'
    'history -n'
)

PS1='$(set_ps1)'
