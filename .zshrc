# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	zsh-autosuggestions
	zsh-syntax-highlighting
	zoxide
  tmux
  rbw
)

ZOXIDE_CMD_OVERRIDE=cd
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_DEFAULT_SESSION_NAME="dev"
ZSH_TMUX_UNICODE=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias l='eza -lh -s type '
alias la='eza -lah -s type '
alias ls=la
# alias vim=nvim
alias ytp='bash ~/config/.config/ytp/ytp.sh'
alias mupdf='mupdf-gl'

alias ssn='sudo shutdown now'
alias sr='sudo reboot'
alias rd='rm -rf'
alias on="cd ~/Documents/notes && nvim"
alias oc="cd ~/config && nvim"
alias doom='~/.config//emacs/bin/doom'

alias fk="fuck"
alias update="paru -Syyu"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias i="paru"
alias nosleep="xset s off -dpms"
alias qsa="python ~/projects/projectscripts/qs.py"


function killport() {
  local pid=$(lsof -ti :"$1" | head -n1)
  if [[ -n "$pid" ]]; then
    echo "Killing process $pid using port $1"
    kill -9 "$pid"
    # Verify kill succeeded
    sleep 1
    if lsof -ti :"$1" &>/dev/null; then
      echo "Failed to kill process using port $1"
      return 1
    fi
  else
    echo "No process found using port $1"
    return 0
  fi
}

function zo {
    zathura $argv >/dev/null 2>&1 & disown
}

function bw_unlock {
  source ~/config/scripts/bitwarden-unlock.sh
}

# alias emacs="emacsclient -c -nw"
#code shortcuts
alias gitcom="git add . && git commit -m 'update/fixes' && git push -u origin main"
# alias bw='~/config/scripts/bw'

# Startup
#fastfetch


# bun completions
[ -s "/home/stef/.local/share/reflex/bun/_bun" ] && source "/home/stef/.local/share/reflex/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GOPATH="/home/stef/go/"
export QT_QPA_PLATFORM=wayland
export WAYLAND_DISPLAY=wayland-1
# gem
export PATH="$PATH:/home/stef/.local/share/gem/ruby/3.3.0/bin"
export PATH=$PATH:$GOPATH/bin
export PATH="/home/stef/.local/bin:$PATH"

# export BEDROCK_KEYS=$AWS_ACCESS_KEY,$AWS_SECRET_KEY,us-east-1

