set fish_greeting


set -gx EDITOR nvim
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser
#genral shortcuts
alias l='eza -lah'
alias ssn='sudo shutdown now'
alias sr='sudo reboot'
alias rd='rm -rf'
alias doom='~/.config//emacs/bin/doom'

alias update="paru -Syyu"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias i="paru"



# alias emacs="emacsclient -c -nw"
#code shortcuts
alias gitcom="git add . && git commit -m 'update/fixes' && git push -u origin main"




#scripts
