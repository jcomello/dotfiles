export GIT_EDITOR="nvim"
export EDITOR="nvim"
export AWS_PROFILE=joao.mello

# Config batcat
# alias bat='batcat'

# config exa
alias ls='eza --icons'

# nvim to vim
alias vim='nvim'

# nvim to vi
alias vi='nvim'

# Use `$ open <directory>` to open files from terminal
alias open='xdg-open'

# Timezones for the team
alias team_tz='ontime-cli compare -t CET -t EST -t US/Pacific -t Europe/London -t America/Sao_Paulo'

# OSC Alias
alias iosc='osc -A https://api.suse.de'

# Java config
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home"

# Rust config
export CARGO_TARGET_DIR="~/.cargo/bin"

# Ruby Config
export GEM_HOME=$HOME/.gem/ruby/2.5.9
export PATH=$HOME/.gem/ruby/2.5.9/bin:$PATH

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
. "$HOME/.cargo/env"

# Pyenv config
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/joao.mello/google-cloud-sdk/path.bash.inc' ]; then . '/home/joao.mello/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/joao.mello/google-cloud-sdk/completion.bash.inc' ]; then . '/home/joao.mello/google-cloud-sdk/completion.bash.inc'; fi

# Google credentials setup
export GOOGLE_APPLICATION_CREDENTIALS="~/google_credentials/suse-gce-test-69f6c4325856.json"
