ZSH=$HOME/.oh-my-zsh
ZSH_THEME="random"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git bundler brew gem)

export PATH="/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
