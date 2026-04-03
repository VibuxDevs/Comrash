# Comrash fish theme — sourced from: fish -C "source …"
set -q __comrash_fish_init
and return
set -g __comrash_fish_init 1
set -gx COMRASH 1
set -gx COMRASH_NO_BANNER 1

# Mute common startup eye-candy from user config.
function neofetch
    return 0
end
function fastfetch
    return 0
end
function pfetch
    return 0
end
function pokemon-colorscripts
    return 0
end

test -f ~/.config/fish/config.fish
and source ~/.config/fish/config.fish
functions -e neofetch fastfetch pfetch pokemon-colorscripts 2>/dev/null

function fish_prompt
    set -l cr_r (set_color red)
    set -l cr_g (set_color bryellow)
    set -l cr_b (set_color brred)
    set -l cr_x (set_color normal)
    set -l hn (command hostname -s 2>/dev/null)
    if test -z "$hn"
        set -l _parts (string split '.' (command hostname))
        set hn $_parts[1]
    end
    echo -n -s $cr_b '[' $USER '@' $hn ' ' $cr_g (prompt_pwd) $cr_r '] ' '☭ ' $cr_x
end
