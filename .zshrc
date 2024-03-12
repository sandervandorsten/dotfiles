# Inject profiling code
# At the beginning of your .zshrc add following: `zmodload zsh/zprof` and at the end add: `zprof`
# This will load zprof mod and display what your shell was doing durung your initialization.
# Source: https://gist.github.com/elalemanyo/cb3395af64ac23df2e0c3ded8bd63b2f
# zmodload zsh/zprof


# Setting locale for perl: https://gist.github.com/madeagency/79dc86e8aa09aa512af5
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sander/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # Define how often auto-update (in days).

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh  # Load oh-my-zsh
source $HOME/.zgenrc      # Load zgen
# source ~/.bash_profile
# User configuration
# Load custom zsh-autocomplete files
# I cloned the plugin to this location, which should be done manually
# `cd ~/Code && git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git`
source ~/Code/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias charm="pycharm ."
alias brewconfig="code ~/.Brewfile"
alias zshconfig="code ~/.zshrc"
alias bashconfig="code ~/.bashrc"
alias bashprofile="code ~/.bash_profile"
alias ohmyzsh="code ~/.oh-my-zsh"
alias zgenconfig="code ~/.zgenrc"
alias gitconfig="code ~/.gitconfig"
alias sshconfig="code ~/.sshconfig"
alias config='/usr/bin/git \
  --git-dir=$HOME/.cfg/ \
  --work-tree=$HOME'            # dotfiles alias
alias lss="/bin/ls"             # Aliasses for exa (better ls)
alias ls="exa"                  # Aliasses for exa (better ls)
alias cat='bat --plain'         # use syntax highlighter 'bat' as alternative to cat. 

# Provide syntax highlighting to -h and --help commands by overriding these entirely with bat. 
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
export BAT_PAGER='never'

# thefuck aliasses (autofix previous commands)
eval $(thefuck --alias)
eval $(thefuck --alias fu)

# move dotfile to dotfile repo
# think this is deprecated
# function dotfile {
#     mv /home/sander/$1 /home/sander/Code/cfg/$1
#     ln -nfs /home/sander/Code/cfg/$1 /home/sander/$1
# }

## Pyenv
# Add pyenv executable to PATH and enable shims by adding the following
# to ~/.profile:export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
export PATH="$PATH:/opt/homebrew/opt/openjdk11/bin"           # Add java runtime 
export PATH="$PATH:/Users/sander/.local/bin"                  # Created by `pipx` on 2023-01-26 16:22:15
export PATH="$PATH:/Applications/PyCharm.app/Contents/MacOS"  # add 'pycharm' to path
# Symlink Java 11 s.t. the system can find it. mentioned in the brew installation docs. Only do this once
# sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

## Google cloud SDK. 
#source: https://formulae.brew.sh/cask/google-cloud-sdk

# To install shell completions, add this to your profile:
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# To add gcloud components to your PATH, add this to your profile:
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

## Docker & Podman

# If Docker is installed for the user use dockers init-zsh.sh script to add docker to the path
user_file_docker="/Users/sander/.docker/init-zsh.sh"
if [ -f "$user_file_docker" ]; then
  # File exists, so execute
  source /Users/sander/.docker/init-zsh.sh || true # Added by Docker Desktop
fi
# Created by Sander van Dorsten on 2023-03-20: Add Docker Desktop for Mac (docker)
# export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# Podman
# https://podman-desktop.io/docs/migrating-from-docker/using-the-docker_host-environment-variable
# export DOCKER_HOST=$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')

# fzf (Fuzzrysearch) configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '\^E' fzf-cd-widget           # Bind key 'Ctrl+E' to search directories 
bindkey "^X\x7f" backward-kill-line   # Delete entire line with command key and backspace

# Add the Schiphol extra pypi repo to env var
export PIP_EXTRA_INDEX_URL=$(grep 'extra-index-url' ~/.pip/pip.conf | awk -F "=" '{print $2}' | tr -d ' ')
export PIP_REQUIRE_VIRTUALENV=true  # Pip requires virtualenv

# # Profiling startup time
# zprof
