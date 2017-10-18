# ---------------------------------------------------------------------------
#
# Description:  This is all of my bash aliases and whatnot.
#
# ---------------------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------------------
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
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
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# ---------------------------------------------------------------------------
# Colorize!
# ---------------------------------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#---------------------------------------------------------------------------
# Make vim default editor
#---------------------------------------------------------------------------
export EDITOR=vim

# ---------------------------------------------------------------------------
# Git Aliases!
# ---------------------------------------------------------------------------
alias ga="git add . && git add -u"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gpo="git push origin "
alias gti="git "
alias got="git "
alias get="git "
# ---------------------------------------------------------------------------
# Chef
# ---------------------------------------------------------------------------
alias kt="kitchen test"
alias kc="kitchen converge"
alias kv="kitchen verify"
# ---------------------------------------------------------------------------
# Shit that gets added by other programs
# ---------------------------------------------------------------------------
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexkoch/google-cloud-sdk/path.bash.inc' ]; then source '/Users/alexkoch/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexkoch/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/alexkoch/google-cloud-sdk/completion.bash.inc'; fi
