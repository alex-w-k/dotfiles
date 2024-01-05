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
alias ll='eza -aghHl --git --color auto --icons'
alias src='source ~/.bashrc'
alias pip='pip3'
alias dog='doggo'
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
alias gpob='git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"'
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
alias gpm='git profile-manager'
# ---------------------------------------------------------------------------
# macOS things
# ---------------------------------------------------------------------------
alias st='speedtest-cli'
alias sshilo='ssh -oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostKeyAlgorithms=+ssh-dss 192.168.1.101'
export BASH_SILENCE_DEPRECATION_WARNING=1

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
eval "$(/opt/homebrew/bin/brew shellenv)"
onedark="$(vivid generate one-dark)"
export LS_COLORS=$onedark
export EXA_COLORS="da=1;34"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi


source /Users/alex.koch/.config/broot/launcher/bash/br

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alex.koch/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# Path to the bash it configuration
export BASH_IT="/Users/alex.koch/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='oh-my-posh'

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
eval "$(oh-my-posh init bash --config $HOME/themes/imi.omp.yaml)"
