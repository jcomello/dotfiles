[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

ESC="\033" # This is the escape sequence
NO_COLOR="$ESC[0m"
IRED="$ESC[1;31m" # ANSI color code for intense/bold red
IGRN="$ESC[1;32m" # ANSI color code for intense/bold green

RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]'

# From http://railstips.org/blog/archives/2009/02/02/bedazzle-your-bash-prompt-with-git-info/
# I had to change 'git-symbolic-ref' to 'git symbolic-ref'
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " ["${ref#refs/heads/}"]" # I wanted my branch wrapped in [], use () or <> or whatever
}

# from http://ariejan.net/2010/04/25/ruby-version-and-gemset-in-your-bash-prompt-yes-sir
function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" != "" ] && version="$version"
  local full="$version$gemset"
  [ "$full" != "" ] && echo "${full}:" # the colon at the end is a delimiter, you could use a space instead
}

#PS1="\h:\W \u\$" # For reference, here's the default OS X prompt
#export PS1="\$(rvm_version)\W \$(parse_git_branch)\$ " # Without the colors

# I had to put the \[ and \] down here, as opposed to $IRED, to avoid wrapping funkiness.
export PS1="\[$NO_COLOR\]\w\[$IGRN\]\$(parse_git_branch)\[$NO_COLOR\] \$ "

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home"

# only for iTerm2 on Mac
# http://www.iterm2.com/#/section/documentation/escape_codes
function setBackground() {
  echo -e "\033]Ph${1}\033\\"
}
alias setBlackBackground='setBackground 000000'

function ssh() {
  if [[ -n "$EC2_SSH_PRIVATE_KEY" ]]
  then
    /usr/bin/ssh -i "$EC2_SSH_PRIVATE_KEY" $@
  else
    /usr/bin/ssh $@
  fi
}

function ec2ssh() {
  INSTANCE="$1"
  shift
  if [[ -z "$INSTANCE" ]]
  then
    echo 'use: ec2ssh $INSTANCE' >&2
    return 2
  fi
  DESCRIBE=$(ec2-describe-instances "$INSTANCE")
  ADDRESS=$(echo "$DESCRIBE" | awk '$1 ~ /^INSTANCE$/ { print $4; }')
  ADDRESS="${ADDRESS% *}"
  if [[ -n "$ADDRESS" ]]
  then
    if [[ `echo "$DESCRIBE" | grep "production"` ]]
    then
      setBackground 250000
    fi
    if [[ `echo "$DESCRIBE" | grep "sandbox"` ]]
    then
      setBackground 000025
    fi
    if [[ -n "$EC2_SSH_PRIVATE_KEY" ]]
    then
      ssh -i "$EC2_SSH_PRIVATE_KEY" -t "$ADDRESS" $@
    else
      ssh -t "$ADDRESS" $@
    fi
    STATUS=$?
    setBackground 000000
    return $STATUS
  else
    return 1
  fi
}

function ec2log() {
  INSTANCE="$1"
  if [[ -z "$INSTANCE" ]]
  then
    echo "Use: $0 instance [logfile]" >&2
    return 1
  fi
  LOGFILE="${2:-/var/log/bootstrap.log}"
  ec2ssh "$INSTANCE" "tail -f '$LOGFILE'"
}

export GIT_EDITOR="nvim"
export EDITOR="nvim"

# Config batcat
alias bat='batcat'

# config exa
alias ls='exa --icons'

# nvim to vim
alias vim='nvim'

# Rust config
source "$HOME/.cargo/env"
export CARGO_TARGET_DIR="~/.cargo/bin"

# Starship config
eval "$(starship init bash)"

# Tmuxifier config
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Lunar Vim config
export PATH=/home/joao.mello/.local/bin:$PATH

# Golang config
export PATH=$PATH:/usr/local/go/bin

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
