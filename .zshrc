# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# Source zcomet.zsh
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Prompt
zcomet load agkozak/agkozak-zsh-prompt

# Load plugins
zcomet load agkozak/zsh-z
zcomet load ohmyzsh plugins/gitfast

# Lazy-load plugins
zcomet trigger zhooks agkozak/zhooks

# Load these popular plugins last
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

# Run compinit and compile its cache
zcomet compinit

# built-in zsh correction and menu-style selection for completion
setopt CORRECT_ALL
zstyle ':completion:*' menu select

# colored directory listings
alias ls='ls --color=auto'
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Set up various version managers

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT/bin ] ; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# nodenv
if [ -d $HOME/.nodenv/bin ] ; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init - zsh)"
fi

# goenv
export GOENV_ROOT="$HOME/.goenv"
if [ -d $GOENV_ROOT/bin ] ; then
  export PATH="$GOENV_ROOT/bin:$PATH"
  export GOENV_GOPATH_PREFIX="$HOME/.cache/go"
  eval "$(goenv init -)"
  export PATH="$GOROOT/bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
fi
