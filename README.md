# My Dotfiles

This is my dotfiles setup for macos and linux.

To reproduce the setup on a new machine, run the following commands:

```bash
cd ~
git clone https://github.com/anubhavshrimal/dotfiles.git .dotfiles
cd .dotfiles/ 
```

## Brewfile

- Install [Homebrew](https://brew.sh) using:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- To install the dependencies and apps using brew:

```bash
# Minimal apps
brew bundle --file=./brewfiles/MinimalBrewfile

# Extras if needed
brew bundle --file=./brewfiles/ExtrasBrewfile
```

- To create a `Brewfile` from old machine run: `brew bundle dump`

## Terminal

- [Pure](https://github.com/sindresorhus/pure) zsh prompt (already installed using Brewfile setup)
- Install [Powerline fonts](https://github.com/powerline/fonts)
- Import Terminal theme: [Tomorrow Night Eighties](https://github.com/chriskempson/tomorrow-theme/blob/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal)
- Font: `Droid Sans Mono for Powerline`
- Font size: `18`

## Dotfiles setup

`./install`
