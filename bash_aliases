svndiff()
{
  svn diff "${@}" | colordiff | less -r
}
