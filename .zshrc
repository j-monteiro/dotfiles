# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # set by `omz`

plugins=(asdf git rails docker docker-compose)

source $ZSH/oh-my-zsh.sh

# set default editor to be vscode
export EDITOR="code -r -w"

# nvim
export PATH=$HOME/.config/nvim:$PATH
alias vim='nvim'

# Quality aliases
alias rspecdiff='bin/rspec $(gss_diff | grep spec.rb)'
alias rsof='bin/rspec --only-failures'
alias rubocopdiff='rubocop -a $(gss_diff | grep .rb)'
alias reekdiff='reek $(gss_diff)'
alias branchdiff='rubocop -a $(git_diff | grep -v "erb" | grep .rb)'
alias rcop='rubocop'

# Heroku madness
BE_PROD='backend-knok'
BE_QA='knok-qa'
BE_STAGING='knok-backend-test'
alias hr='heroku'
alias hr_personal='hr accounts:set personal'
alias hr_work='hr accounts:set work'
alias hrcp='hrc $BE_PROD'
alias hrcqa='hrc $BE_QA'
alias hrcs='hrc $BE_STAGING'
alias hrc='hr run "rails console -- --noautocomplete" --app $1'
alias hrbash='hr run bash --app $1'
alias hrlogs='hr logs --tail --app $1'
alias hr_new_relic='hr addons:open newrelic --app $1'
alias hrr='heroku releases -a $1'

#jira
alias jirame='jira issue list -a$(jira me) -s"~Done"'
alias jirameall='jira issue list -a$(jira me)'
alias jirahist='jira issue list --history'
alias jiramep='jirame -s "In Progress"'
alias jiramedo='jirame -s "To Do"'
alias jiramer='jirame -s "Review"'
alias jiramerp='jirame -s "Reopen"'

# github
alias ghd='gh dash'
alias prs='gh pr status'
alias prchecks='gh pr checks --watch'
alias prco='gh pr checkout $1'
alias prr='gh pr ready'
alias prc='gh pr create'
alias prme='gh search prs --state=open --review-requested=@me --json=number,title,repository,author --template="{{range .}}{{tablerow (printf \"#%v\" .number | autocolor \"green\") .title (.repository.name | color \"cyan\") (.author.login | color \"yellow\") }}{{end}}"'
alias prdaily='gh search prs --state=closed --author=@me --sort="updated" --order="desc" --json=title,repository,author,closedAt,createdAt,url --template="{{range .}}{{tablerow (printf \"#%v\" .url | autocolor \"cyan\") .createdAt .closedAt .title (.repository.name | color \"cyan\") (.author.login | color \"yellow\") }}{{end}}"'
alias prv='gh pr view'
alias prvw='gh pr view -w'
alias prls='gh pr list -w'
alias runlg='gh run view --log'
alias runr='gh run rerun'
alias runls='gh run list'

# git
alias gf='git fetch'
alias gw='git worktree'
alias gwa='git worktree add'
alias gwd='git worktree remove'
alias gst='git status -s -u'
alias gcfix='git commit --fixup='

# docker
alias compose='docker-compose'

# misc
alias cl='clear'

# rust
alias rust='rustup'

# act
alias act='act --container-architecture linux/amd64 $1'

# tmux
alias srcmux='tmux source ~/.tmux.conf'
alias mux='tmux'

# pomodoro
alias work="echo 'we are working 🎅' | lolcat && timer 45m"
alias pause="echo 'happy break time! ⛄' | lolcat && timer 10m"

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

# autocomplete
source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/jmonteiro/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U compinit; compinit

