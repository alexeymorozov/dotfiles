ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(brew git svn gem bundler composer)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="$PATH":$HOME/chromium/depot_tools
if which brew > /dev/null 2>&1; then
  export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
fi

if [ -d "$HOME/local/bin" ] ; then
    PATH="$HOME/local/bin:$PATH"
    export LD_LIBRARY_PATH="${HOME}/local/lib"
    export LDFLAGS=-L${HOME}/local/lib
    export CPPFLAGS=-I${HOME}/local/include
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias tmux="TERM=screen-256color-bce tmux"

case `uname` in
  Darwin)
    EDITOR="mvim -f"
    ;;
  Linux)
    if which gvim > /dev/null; then
      EDITOR="gvim -f"
    else
      EDITOR="vi -f"
    fi
    ;;
esac
export VISUAL=$EDITOR

export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}"  ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

alias ss=short_svn_status
alias sd=color_svn_diff

short_svn_status() {
  show_branch
  svn status | remove_distraction
}

show_branch() {
  echo '##' `get_branch_name`
}

get_branch_name() {
  svn info | extract_branch_name
}

extract_branch_name() {
  grep 'URL' | sed 's/^.*\///'
}

remove_distraction() {
  grep -v '^X ' |
  grep -v '^$' |
  grep -v 'Performing status on external item at'
}

color_svn_diff() {
  svn diff | less -R
}
