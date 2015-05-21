ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
BUNDLED_COMMANDS=(foreman runnel)

plugins=(brew git gem bundler)

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export VISUAL="vi -f"
alias tmux="TERM=screen-256color tmux"

[[ -f ~/.zshrc.local  ]] && source ~/.zshrc.local
