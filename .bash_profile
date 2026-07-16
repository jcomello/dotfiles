export GIT_EDITOR="nvim"
export EDITOR="nvim"
export AWS_PROFILE=joao.mello

# Config batcat
# alias bat='batcat'

# config eza
alias ls='eza --icons'

# nvim to vim
alias vim='nvim'

# Use `$ open <directory>` to open files from terminal
alias open='xdg-open'

# Timezones for the team
alias team_tz='cat ~/dotfiles/team_timezones | ontime-cli compare'

# OSC Alias
alias iosc='osc -A https://api.suse.de'

# ekphos with vim
alias vimek='vim ~/Documents/ekphos/'

# Java config
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home"

# Rust config
export CARGO_TARGET_DIR="$HOME/.cargo/bin"
export PATH="$PATH:$CARGO_TARGET_DIR"

# Ruby Config
# Activate mise as version manager
eval "$(mise activate bash)"

# Starship config
eval "$(starship init bash)"

# Poetry config
# Commented it until find a better solution
# eval "$(poetry env activate)"

# Tmuxifier config
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Golang config
export PATH="$PATH:/usr/local/go/bin"

# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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

# Load FZF theme
source ~/.fzf_theme.sh

# Configure Homebrew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
