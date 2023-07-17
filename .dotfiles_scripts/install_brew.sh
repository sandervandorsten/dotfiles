# install brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/sander/.zprofile 
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install everything using brew
brew bundle --global

