# Comrash zsh theme — ZDOTDIR points here
export COMRASH=1
export COMRASH_NO_BANNER=1

# Mute common startup eye-candy from user rc files.
function neofetch { :; }
function fastfetch { :; }
function pfetch { :; }
function pokemon-colorscripts { :; }
[[ -r "$HOME/.zshrc" ]] && source "$HOME/.zshrc"
unfunction neofetch fastfetch pfetch pokemon-colorscripts 2>/dev/null || true

autoload -Uz colors 2>/dev/null && colors
PROMPT="%{$fg_bold[red]%}[%n@%m %{$fg[yellow]%}%~%{$fg_bold[red]%}] ☭ %{$reset_color%}"
