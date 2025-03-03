# Dotfiles managed by Chezmoi

## Install & Apply Chezmoi configuration

sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply git@github.com:damacus/dotfiles.git

## Install Homebrew packages

```sh
brew bundle -f ~/Brewfile
```
