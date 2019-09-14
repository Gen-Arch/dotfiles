# .bashrc
#==========================================================================================
# Source global definitions
#==========================================================================================
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
#==========================================================================================
#local configurarion
#==========================================================================================
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
#==========================================================================================
#Export
#==========================================================================================
export DOT_FILE_PATH="$HOME/dotfiles"
export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin # パス
export EDITOR='vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す
export XDG_CONFIG_HOME=$DOT_FILE_PATH
#==========================================================================================
#Alias
#==========================================================================================
alias_file=$DOT_FILE_PATH/aliasrc
[ -f $alias_file ] && source $alias_file
#==========================================================================================
#Prompt configurarion
#==========================================================================================
source "$DOT_FILE_PATH/scripts/git-prompt.sh"
source "$DOT_FILE_PATH/scripts/git-completion.bash"
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[36;40;1m\] [\u@\h]\[\033[01;34m\] \w\[\033[00m\] \[\033[31m\]$(__git_ps1)\[\033[00m\]\[\033[01;34m\]\$\[\033[00m\]'

#==========================================================================================
#Rbenv
#==========================================================================================
if [[ -e $HOME/.rbenv ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

#==========================================================================================
#Pyenv
#==========================================================================================
if [ -e ~/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
#==========================================================================================
#ndenv
#==========================================================================================
if [ -e ~/.ndenv ]; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi
export SH_LOAD="exit"
