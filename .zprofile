# Homebrew
if [ -d /opt/homebrew/bin ] ; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# Set EDITOR/VISUAL/PAGER
if [[ -z "$EDITOR" ]]; then
  export EDITOR='vim'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='vim'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi
