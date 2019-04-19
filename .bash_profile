# ---------------------------------------------------------------------------
#
# Description:  This is all of my bash aliases and whatnot.
#
# ---------------------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------------------
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
# ---------------------------------------------------------------------------
# Useful terminal aliases
# ---------------------------------------------------------------------------
alias port="lsof -i -P | grep -i 'listen'"      # Lists what ports are open
                                                # and what is using them
alias cls="clear"                               # Shorter clear
alias cd..="cd .."                              # I don't like spaces..
alias ..="cd .."                                # Even faster if I want it
alias ~="cd ~"                                  # Go home and whatnot
alias bp="vim ~/.bash_profile"                  # Edit this file
alias src="source ~/.bash_profile"              # Reload this file!
alias ls='ls -GFh'
alias ll='exa -abghHlS --git'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
# ---------------------------------------------------------------------------
# Colorize/Customize bash line
# ---------------------------------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#---------------------------------------------------------------------------
# Make vim default editor
#---------------------------------------------------------------------------
export EDITOR=vim
# ---------------------------------------------------------------------------
# Git Aliases!
# ---------------------------------------------------------------------------
alias ga='git add . && git add -u'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gpu='git pull'
alias gpo='git push origin '
alias gti='git '
alias got='git '
alias get='git '
# ---------------------------------------------------------------------------
# Chef
# ---------------------------------------------------------------------------
alias ks='kitchen status'
alias kt='kitchen test'
alias kcr='kitchen create'
alias kc='kitchen converge'
alias kv='kitchen verify'
alias krv='kitchen destroy; kitchen verify'
alias kl='kitchen login'
alias kd="kitchen destroy"
alias bi="berks install"
alias bu="berks update"
alias iv="inspec vendor --overwrite"
# ---------------------------------------------------------------------------
# Other Things
# ---------------------------------------------------------------------------
alias vfuse='/usr/local/vfuse/bin/vfuse'
alias st='speedtest-cli'
# ---------------------------------------------------------------------------
# Work Things
# ---------------------------------------------------------------------------
# This is my personal stuffs! :O
# ---------------------------------------------------------------------------
# Shit that gets added by other programs
# ---------------------------------------------------------------------------
eval "$(chef shell-init bash)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
