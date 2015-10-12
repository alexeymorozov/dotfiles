ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
BUNDLED_COMMANDS=(rails foreman runnel rubocop)

plugins=(brew git gem bundler jira)

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

source $ZSH/oh-my-zsh.sh

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export VISUAL="vi -f"
alias tmux="TERM=screen-256color tmux"

ZLE_SPACE_SUFFIX_CHARS=$'&|'

alias gap='gapa'
alias gdc='gdca'
alias gcd='git checkout develop'

alias ggpu='git push origin $(current_branch) -u'
compdef _git ggpu=git-push

alias gloga='git log --oneline --decorate --color --graph --all'
compdef _git gloga=git-log

alias gtv='git tag -n | gsort -V'

[[ -f ~/.zshrc.local  ]] && source ~/.zshrc.local
