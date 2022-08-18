# Vi mode
bindkey -v

export TERMINAL="alacritty"

export ZSH="$HOME/dotfiles/oh-my-zsh"

[ -d /Applications ] && export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
[ ! -d /Applications ] && export CHROME_EXECUTABLE=/usr/bin/brave

export GOPATH=$HOME/go
export GOROOT=/usr/local/go

export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.local/bin:/usr/share/depot_tools:$HOME/.cargo/bin

ZSH_THEME="oxide"

#tmux
plugins=(git zsh-autosuggestions)

#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=false
#alias tmux='tmux -u'

ZELLIJ_AUTO_EXIT=true
eval "$(zellij setup --generate-auto-start zsh)"

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

[ -d /usr/share/fzf ] && source /usr/share/fzf/key-bindings.zsh
[ -d /usr/share/fzf ] && source /usr/share/fzf/completion.zsh
[ -d /opt/homebrew/opt/fzf ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[ -d /opt/homebrew/opt/fzf ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
