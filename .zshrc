# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="solarized-powerline"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker npm)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ashish/go/bin:/usr/local/go/bin:/home/ashish/repos/web-shared/bin:/usr/local/elm"
export EDITOR="vim"
export POWERLINE_COMMAND="powerline"

bindkey -v
bindkey "^R" history-incremental-search-backward
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising newSSH agent..."
     #/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     #as above, but less quiet for debugging --mdf
     /usr/bin/ssh-agent > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Prevent ctrl+s from stopping input
stty -ixon

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias gs='git status'
alias gnew='git co -b '
alias gnewr='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gdel='git branch -d '
alias gdelr='git push origin --delete'
alias gp'git push'
alias gu='git up'
alias glog='git log'
alias ghist='git hist'
alias grb='git rebase'
alias tat="tmux a -t"
alias tls="tmux ls"
alias dps="docker ps"
alias b="ssh buildium"
alias tf="tail -f"
alias h='ssh -X holmium'
alias tso="tig origin/"
alias n3="npm install -g npm@3.7.5"
alias n2="npm install -g npm@2.14.22"
denter() {
    docker exec -it $1 bash
}
alias dstopall=docker stop $(docker ps -a -q)
alias drmall="docker stop $(docker ps -a -q)"

alias ts="touch ~/www/web/static-content/scss/app.scss; touch ~/docs/static-content/scss/app.scss; touch ~/www/web/static-content/js/sliding-pane.js; touch ~/docs/static-content/js/common.js; touch ~/www/web/static-content/templates/partials/head.html; touch ~/docs/static-content/templates/partials/head.handlebars"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

fpath=(~/.zsh $fpath)
eval $(thefuck --alias)
