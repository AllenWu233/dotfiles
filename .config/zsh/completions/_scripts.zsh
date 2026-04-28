# @author Allen Wu
# @since 2025,2026
# zsh completion for my scripts in ${HOME}/.local/bin/*

_xwl() {
    # complete 1st positional parameter with executables in PATH
    if [ "$CURRENT" -eq 2 ]; then
        compadd - ${(k)commands}
    else
    # complete the rest with the executables' original completion
        shift words
        (( CURRENT-- ))
        _normal
    fi
}
compdef _xwl xwl
