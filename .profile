
. "$HOME/.cargo/env"

source /Users/sander/.docker/init-bash.sh || true # Added by Docker Desktop

# Configuring Pyenv (added manually during installation)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"