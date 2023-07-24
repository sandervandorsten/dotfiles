eval "$(/opt/homebrew/bin/brew shellenv)"

# Configuring Pyenv (added manually during installation)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"