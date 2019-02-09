# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/suser/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

export UPDATE_ZSH_DAYS=13

plugins=(git tmux zsh-autosuggestions)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
