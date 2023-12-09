# Path to your oh-my-zsh installation.
export ZSH=/home/cweed/.oh-my-zsh
# hack to make weird debug logs go away
# export PYTHONSTARTUP="$HOME/pythonstartup.py"
export PYTHONBREAKPOINT="ipdb.set_trace"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="kphoen"

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure


eval "$(direnv hook zsh)"
# use dir_colors
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
battery
coffee
cp
fabric
git
git-extras
git-flow
gnu-utils
golang
history
history-substring-search
pip
python
redis-cli
rsync
screen
zsh-syntax-highlighting
heroku )

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/postgresql/11/bin/"
# export MANPATH="/usr/local/man:$MANPATH"
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias tmux0='tmux a -t 0'
alias tmux1='tmux a -t 1'
alias tmux2='tmux a -t 2'
alias tmux3='tmux a -t 3'
alias tmux4='tmux a -t 4'
alias s="bash $HOME/dotfiles/scripts/start.sh"
alias n="nvim"
alias v="nvim"
export ATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.local/bin:$PATH
export GOPATH=~/go
alias ag='ag --hidden'
if [[ $TERM == "xterm-kitty" ]]; then
    alias ssh="kitty +kitten ssh"
fi
alias swampremote='ssh -X swamp x2x -west -to :0'
alias sp='./manage.py shell_plus --ipython'
alias rs='./manage.py runserver'

export QMK_HOME="/home/cweed/keyboard_stuff/qmk_firmware"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-mocha.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/opt/mssql-tools/bin"

# Auto start tmux

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach -t 0 || tmux new -s 0
# fi
if [ "$TMUX" ]; then
    toilet --font smblock  "tmux ( `tmux display-message -p '#S'` )"
fi

if [[ $1 == eval ]]
then
    "$@"
set --
fi

. "$HOME/.cargo/env"

export FLYCTL_INSTALL="/home/cweed/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
