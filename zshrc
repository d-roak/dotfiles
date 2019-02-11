export ZSH="$HOME/dotfiles/oh-my-zsh"

ZSH_THEME="oxide"

plugins=(git tmux zsh-autosuggestions)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

if [ -x "$(command -v dircolors)" ]; then
   eval "$(dircolors -b ~/dotfiles/dircolors)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
