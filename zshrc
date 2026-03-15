typeset -U path

export VOLTA_HOME="$HOME/.volta"

path=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$VOLTA_HOME/bin"
    "$HOME/.antigravity/antigravity/bin"
    "/Library/TeX/texbin"
    "/opt/homebrew/bin"
    $path
)

# C
export C_INCLUDE_PATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"

# 🐮♪
_first_cmd=1
precmd() {
    local exit_code=$?
    if [ "$_first_cmd" -eq 1 ]; then
        (( $+commands[cowsay] )) && cowsay "hello"
        (afplay /System/Library/Sounds/Blow.aiff &) 2>/dev/null
        _first_cmd=0
        return
    fi
    if [ $exit_code -eq 0 ]; then
        (afplay /System/Library/Sounds/Tink.aiff &) 2>/dev/null
    else
        (afplay /System/Library/Sounds/Frog.aiff &) 2>/dev/null
    fi
}

# 🤓
alias vi='nvim'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
