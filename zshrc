ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dst"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem composer svn)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

export PATH="$PATH":$HOME/chromium/depot_tools

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

case `uname` in
  Darwin)
    export VISUAL="mvim -f"
    ;;
  Linux)
    export VISUAL="gvim -f"
    ;;
esac

export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# for Homebrew installed rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
