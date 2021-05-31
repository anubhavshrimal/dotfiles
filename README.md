# My Dotfiles

This is my dotfiles setup for macos and linux.

To reproduce the setup on a new machine, run the following commands:

## Brewfile
- Install [Homebrew](https://brew.sh) using:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- To install the dependencies and apps using brew:
```bash
cd dotfiles/
brew bundle
```

- To create a `Brewfile` from old machine run: `brew bundle dump`
- Install [Powerline fonts](https://github.com/powerline/fonts)

## Dotfiles setup

```bash
git clone https://github.com/anubhavshrimal/dotfiles.git
cd dotfiles/
./install
```