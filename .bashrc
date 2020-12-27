# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# alias
alias zblog='cd ~/zblog || cd ~/repo/private/zblog'
alias nginx_home='cd /usr/local/etc/nginx/'
alias nginx_log='cd /usr/local/var/log/nginx/'
alias protoc='/usr/local/Cellar/protobuf/3.6.0/bin/protoc'
alias gg='cat  ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# docker
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# useful tools:
alias ip='wget http://ipecho.net/plain -O - -q ; echo'
alias wifi_restart='sudo service network-manager restart'
alias zkill="lsof -i:8000 | egrep -o '[0-9]+' | head -1 | xargs kill"

# python repo 
alias ibaymax="source ~/.venv/ibaymax/bin/activate; cd /Users/henry/repo/ibaymax_api/"
alias takachiho="source ~/.venv/takachiho3.7/bin/activate; cd /Users/henry/repo/takachiho"

# PATH
export PATH="$PATH:/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='subl -w'
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function ff() { grep -RIn "$1" . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# ----------------------
# zsh plugins
# ----------------------
# 1. autosuggestions:
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# plugins=(zsh-autosuggestions)

# 2. fzf
# https://github.com/junegunn/fzf
# https://github.com/sindresorhus/pure
# npm install --global pure-prompt
# ZSH_THEME=""
# autoload -U promptinit; promptinit
# # optionally define some options
# PURE_CMD_MAX_EXEC_TIME=10
# PURE_PROMPT_SYMBOL="❯"
# prompt pure

export PATH="$PATH:Users/jetbrains/.local/bin"
