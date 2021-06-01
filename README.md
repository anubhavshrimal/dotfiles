# My Dotfiles

This is my dotfiles setup for macos and linux.

To reproduce the setup on a new machine, run the following commands:

```bash
cd ~
git clone git@github.com:anubhavshrimal/dotfiles.git .dotfiles
cd .dotfiles/ 
```

## Brewfile

- Install [Homebrew](https://brew.sh) using:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- To install the dependencies and apps using brew:
    - For MacOS
    ```bash
    # Minimal apps
    brew bundle --file=./brewfiles/MinimalBrewfile

    # Extras if needed
    brew bundle --file=./brewfiles/ExtrasBrewfile
    ```

    - For Linux / Cloud desktop
    ```bash
    # Minimal apps
    brew bundle --file=./brewfiles/CloudBrewfile
    ```
- To create a `Brewfile` from old machine run: `brew bundle dump`

## Terminal

### For MacOS

- [Pure](https://github.com/sindresorhus/pure) zsh prompt (already installed using Brewfile setup)
- Install [Powerline fonts](https://github.com/powerline/fonts)
- Import Terminal theme: [Tomorrow Night Eighties](https://github.com/chriskempson/tomorrow-theme/blob/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal)
- Font: `Droid Sans Mono for Powerline`
- Font size: `18`

### For Cloud Desktop

- Pure needs to be installed manually because brew installation doesn't work.
```bash
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh_local/pure"

# Add pure directory path in .zshrc_local
cat >> .zshrc_local
fpath+=$HOME/.zsh_local/pure

# SSH invokes .zprofile first, hence we need to source .zshrc from there
# Add source ~/.zshrc in .zprofile
cat >> .zprofile
source ~/.zshrc
```

## Dotfiles setup

`./install`
