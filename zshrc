ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
BUNDLED_COMMANDS=(rails rubocop runnel)

plugins=(brew git svn gem bundler composer symfony2)

source $ZSH/oh-my-zsh.sh

# autocorrect is more annoying than helpful
unsetopt correct_all

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export VISUAL="vi -f"

alias tmux="TERM=screen-256color-bce tmux"

alias sf='php app/console'
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
