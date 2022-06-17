ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
BUNDLED_COMMANDS=(rails runnel rubocop)

plugins=(brew git gem bundler jira rails)

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# python3 from Homebrew
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/Users/amorozov/Library/Python/3.7/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1

source $ZSH/oh-my-zsh.sh

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export VISUAL="vi -f"
alias tmux="TERM=screen-256color tmux"
unalias guard

ZLE_SPACE_SUFFIX_CHARS=$'&|'

alias gan='git add --intent-to-add --all'
alias gap='gapa'
alias gdc='gdca'
unalias gcm
alias gcm='git branch --list | grep -w master && git checkout master || git checkout main'
alias gcd='git checkout develop'

alias ggpu='git push origin $(current_branch) -u'
compdef _git ggpu=git-push

alias gloga='git log --oneline --decorate --color --graph --all'
compdef _git gloga=git-log

alias gtv='git tag -n | gsort -V'

[[ -f ~/.zshrc.local  ]] && source ~/.zshrc.local
export PATH="/usr/local/opt/perl@5.18/bin:$PATH"
