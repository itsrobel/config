set fish_greeting


set -gx EDITOR nvim
set -Ux JAVAFX $HOME/config/java/javafx-sdk-21.0.2/lib
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser
#genral shortcuts
alias l='eza -lh -s type '
alias la='eza -lah -s type '
alias ssn='sudo shutdown now'
alias sr='sudo reboot'
alias rd='rm -rf'
alias on="cd ~/Documents/notes && nvim"
alias oc="cd ~/config && nvim"
alias doom='~/.config//emacs/bin/doom'

alias update="paru -Syyu"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias i="paru"
alias nosleep="xset s off -dpms"

function zo 
        zathura $argv >/dev/null 2>&1 & disown
end
# alias emacs="emacsclient -c -nw"
#code shortcuts
alias gitcom="git add . && git commit -m 'update/fixes' && git push -u origin main"

source "$HOME/.config/fish/git.fish"
source "$HOME/.config/fish/fish_prompt.fish"
source "$HOME/.config/fish/zoxide.fish"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

