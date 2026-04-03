# Comrash bash theme — loaded via: bash --rcfile …
# shellcheck shell=bash
export COMRASH=1
export COMRASH_NO_BANNER=1

# Mute common startup eye-candy from user rc files.
neofetch() { :; }
fastfetch() { :; }
pfetch() { :; }
pokemon-colorscripts() { :; }
[[ -r ~/.bashrc ]] && source ~/.bashrc
unset -f neofetch fastfetch pfetch pokemon-colorscripts 2>/dev/null || true

_cr_R='\[\e[31m\]'
_cr_G='\[\e[33m\]'
_cr_B='\[\e[1m\]'
_cr_X='\[\e[0m\]'
export PS1="${_cr_B}${_cr_R}[\u@\h ${_cr_G}\w${_cr_R}] ☭ ${_cr_X}"

unset _cr_R _cr_G _cr_B _cr_X
