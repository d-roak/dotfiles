
# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.cargo/env"

export PATH="$PATH:/Users/jpldcarvalho/.dojo/bin"
export RUSTC_WRAPPER="/opt/homebrew/Cellar/sccache/0.5.4/bin/sccache"

. "/Users/jpldcarvalho/.wasmedge/env"

# Vi mode
bindkey -v

bindkey -s ^f 'tmux-sessions\n'

export TERMINAL="alacritty"

export ZSH="$HOME/dotfiles/oh-my-zsh"

[ -d /Applications ] && export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
[ ! -d /Applications ] && export CHROME_EXECUTABLE=/usr/bin/brave

export GOPATH=$HOME/go
[ -d /Applications ] && export GOROOT="$(brew --prefix go@1.20)/libexec"
[ ! -d /Applications ] && export GOROOT=/usr/lib/go
export GO111MODULE=on

export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.local/bin:/usr/share/depot_tools:$HOME/.cargo/bin:$HOME/dotfiles/scripts

ZSH_THEME="oxide"

#tmux
plugins=(git zsh-autosuggestions vi-mode)

#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=false
#alias tmux='tmux -u'

#ZELLIJ_AUTO_EXIT=true
#eval "$(zellij setup --generate-auto-start zsh)"

alias gomobile='GO111MODULE=off gomobile'

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/alias

export EDITOR='nvim'

if [ -x "$(command -v dircolors)" ]; then
   eval "$(dircolors -b ~/dotfiles/dircolors)"
fi

export SPICETIFY_INSTALL="/home/suser/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

eval "$(starship init zsh)"

[ -d /usr/share/fzf ] && source /usr/share/fzf/key-bindings.zsh
[ -d /usr/share/fzf ] && source /usr/share/fzf/completion.zsh
[ -d /opt/homebrew/opt/fzf ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[ -d /opt/homebrew/opt/fzf ] && source /opt/homebrew/opt/fzf/shell/completion.zsh

export PATH="$PATH:/Users/jpldcarvalho/.foundry/bin"
# . "/Users/jpldcarvalho/.starkli/env"
export CAIRO_ROOT="$HOME/.cairo"
# command -v cairo-compile >/dev/null || export PATH="$CAIRO_ROOT/target/release:$PATH"

export PATH="$PATH:/Users/jpldcarvalho/.starklings/dist/starklings:/opt/homebrew/opt/llvm/bin"

alias gcc=/opt/homebrew/opt/llvim/bin/gcc
alias g++=/opt/homebrew/opt/llvm/bin/g++
alias clang=/opt/homebrew/opt/llvm/bin/clang

# bun completions
[ -s "/Users/jpldcarvalho/.bun/_bun" ] && source "/Users/jpldcarvalho/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Users/jpldcarvalho/.protostar/dist/protostar"
export STARKNET_KEYSTORE=~/.starkli-wallets/deployer/keystore.json
export STARKNET_ACCOUNT=~/.starkli-wallets/deployer/account.json

