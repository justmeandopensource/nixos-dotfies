#-===================================================-#
# Aliases
#-===================================================-#
alias vi='vim'
alias sudo='sudo '
alias watch='watch '
alias k='kubectl '
alias fan='sensors | grep --color=none fan'
alias gcl='git clone --recurse-submodules'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

#-===================================================-#
# Exports
#-===================================================-#
export EDITOR=vim
export PATH=$HOME/opt/scripts:$PATH

#-===================================================-#
# Functions
#-===================================================-#

blink()
{
  [[ -z "$1" ]] && INTERVAL=120 || INTERVAL=$1
  echo "blinking every $INTERVAL seconds"
  while true
    do xdotool key Shift
    sleep $INTERVAL
    echo blink
  done
}

vbox-hostonlyif-remove()
{
  net=$(vboxmanage list hostonlyifs | egrep '^Name:|IPAddress' | grep -B1 172.16.16 | head -1 | awk '{print $2}')
  [[ -n $net ]] && sudo vboxmanage hostonlyif remove $net
}

#-===================================================-#
# Powerlevel10k stuff
#-===================================================-#
[[ ! -f /etc/powerlevel10k/powerlevel10k.zsh-theme ]] || source /etc/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

