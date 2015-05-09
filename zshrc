ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
BUNDLED_COMMANDS=(rails rubocop runnel)

plugins=(brew git gem bundler composer)

source $ZSH/oh-my-zsh.sh

# autocorrect is more annoying than helpful
unsetopt correct_all

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export VISUAL="vi -f"

alias tmux="TERM=screen-256color-bce tmux"
