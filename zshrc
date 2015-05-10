ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
BUNDLED_COMMANDS=(rails rubocop runnel)

plugins=(brew git gem bundler composer)

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export LC_ALL=en_US.UTF-8
export VISUAL="vi -f"
alias tmux="TERM=screen-256color tmux"
