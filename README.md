# dotfiles

Various configuration files for (Arch) Linux

## Install
The dotfiles are organized to work with GNU Stow. Make sure to install this for easy dotfile management.

`sudo pacman -Syu stow`


## Sync user configuration files
This will symlink the .bashrc file to `~/.bashrc`.

`stow bash`

## Sync root configuration files

This will symlink the pacman.conf file to `/etc/pacman.conf`.
Make sure the file doesn't already exist or a symlink cannot be made.

`sudo stow -t / pacman`



## Special case
### Vscode (code)
To backup vscode extensions:
```bash
    chmod +x code/codeExtensions.sh
    ./code/codeExtensions.sh save
```


To restore vscode extensions:
```bash
    ./code/codeExtensions.sh install
    stow code
```
