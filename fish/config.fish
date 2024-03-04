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


# alias emacs="emacsclient -c -nw"
#code shortcuts
alias gitcom="git add . && git commit -m 'update/fixes' && git push -u origin main"



function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     " λ"
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄"
  set -l dirty    "⨯"
  set -l stash    "≡"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color cyan)
  set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  set -l prompt_string [(whoami)] $fish

  if test "$theme_ignore_ssh_awareness" != 'yes' -a -n "$SSH_CLIENT$SSH_TTY"
    set prompt_string "$fish "(whoami)"@"(hostname -s)" $fish"
  end

  if test $last_command_status -eq 0
    echo -n -s $success_color $prompt_string $normal_color
  else
    echo -n -s $error_color $prompt_string $normal_color
  end

  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    echo -n -s " " $directory_color $cwd $normal_color
    echo -n -s $success_color " " $repository_color [(git_branch_name)] $normal_color " "


    set -l list
    if test "$theme_stash_indicator" = yes; and git_is_stashed
      set list $list $stash
    end
    if git_is_touched
      set list $list $dirty
    end
    echo -n $list

    if test -z "$list"
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  echo -n -s " "
end

#scripts

