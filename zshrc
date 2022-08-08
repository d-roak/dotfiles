# Vi mode
bindkey -v

export TERMINAL="st"

export ZSH="$HOME/dotfiles/oh-my-zsh"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.local/bin:/usr/share/depot_tools:$HOME/.cargo/bin:$HOME/.gem/ruby/3.0.0/bin
export CHROME_EXECUTABLE=/usr/bin/brave

ZSH_THEME="oxide"

plugins=(tmux git zsh-autosuggestions)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

alias tmux='tmux -u'
alias gomobile='GO111MODULE=off gomobile'

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/alias

export EDITOR='nvim'

if [ -x "$(command -v dircolors)" ]; then
   eval "$(dircolors -b ~/dotfiles/dircolors)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export SPICETIFY_INSTALL="/home/suser/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# opam configuration
[[ ! -r /home/suser/.opam/opam-init/init.zsh ]] || source /home/suser/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
PATH="$PATH:$HOME/.opam/default/bin"

eval "$(starship init zsh)"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

