ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
BUNDLED_COMMANDS=(foreman runnel)

plugins=(brew git gem bundler)

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export VISUAL="vi -f"
alias tmux="TERM=screen-256color tmux"

ZLE_SPACE_SUFFIX_CHARS=$'&|'

alias gcd='git checkout develop'

alias ggpushu='git push origin $(current_branch) -u'
compdef ggpush=git

alias gloga='git log --oneline --decorate --color --graph --all'
compdef _git gloga=git-log

[[ -f ~/.zshrc.local  ]] && source ~/.zshrc.local
