ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
BUNDLED_COMMANDS=(rails rubocop runnel)

plugins=(brew git gem bundler composer)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export VISUAL="vi -f"

alias tmux="TERM=screen-256color-bce tmux"
