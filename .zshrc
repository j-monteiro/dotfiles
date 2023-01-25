# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load alias files
for file in ~/.aliases/*; do
  source $file
done

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # set by `omz`
plugins=(asdf git rails docker docker-compose)
source $ZSH/oh-my-zsh.sh
# autocomplete
source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# heroku autocomplete
HEROKU_AC_ZSH_SETUP_PATH=/Users/jmonteiro/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export EDITOR="code -r -w"
export PATH=$HOME/.config/nvim:$PATH

# Git helpers
gss_diff() {
  (gss | grep ? | cut -c 3-) && (gss | grep M | cut -c 3-)
}

git_diff() {
  base=$1
  if [ $# -eq 0 ]
  then
    base='development'
  fi

  (git diff $base --name-only --diff-filter=d -- ':(exclude)db/*')
}

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin && clear
# homebrew new location
export PATH=/opt/homebrew/bin:$PATH
# asdf shims
export PATH=~/.asdf/shims:$PATH
# rust
export PATH=/Users/jmonteiro/.cargo/bin:$PATH
# golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U compinit; compinit
