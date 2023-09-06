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
alias cls="clear"                               # Shorter clear
alias cd..="cd .."                              # I don't like spaces..
alias ..="cd .."                                # Even faster if I want it
alias ~="cd ~"                                  # Go home and whatnot
alias ls='ls -GFh'
alias ll='exa -aghHl --git --color auto --icons'
alias src='source ~/.bashrc'
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
export EDITOR=nvim
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
# macOS things
# ---------------------------------------------------------------------------
alias st='speedtest-cli'
alias sshilo='ssh -oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostKeyAlgorithms=+ssh-dss 192.168.1.101'
export BASH_SILENCE_DEPRECATION_WARNING=1
. "$HOME/.cargo/env"

eval "$(/opt/homebrew/bin/brew shellenv)"
# ---------------------------------------------------------------------------
# config dir things
# ---------------------------------------------------------------------------

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# ---------------------------------------------------------------------------
# nvim conversion
# ---------------------------------------------------------------------------
alias vim='nvim'
alias oldvim='vim'
alias vimconfig='nvim ~/.config/nvim/init.vim'
# ---------------------------------------------------------------------------
# other
# ---------------------------------------------------------------------------
export LS_COLORS="$(vivid generate one-dark)"
export EXA_COLORS="da=1;34"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
