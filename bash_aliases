svndiff()
{
  svn diff "${@}" | colordiff | less -r
}

alias gs='git status -sb'
alias gl='git log'
