#-===================================================-#
# Aliases
#-===================================================-#
alias vi='vim'
alias sudo='sudo '
alias watch='watch '
alias k='kubectl '
alias fan='sensors | grep --color=none fan'

# git aliases
alias gcl='git clone --recurse-submodules'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias gst='git status'
alias gsb='git status -sb'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias ga='git add'
alias gaa='git add --all'
alias gca='git commit -v -a'

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

which keyctl >/dev/null 2>&1
[[ "$?" == "0" ]] && keyctl link @u @s
