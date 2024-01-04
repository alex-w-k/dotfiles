source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(/opt/homebrew/bin/brew shellenv)"

source /Users/alex.koch/.config/broot/launcher/bash/br

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alex.koch/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

