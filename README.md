dotfiles
========

Miscellaneous configuration files for vim, bash etc.


## Installation

**THIS WILL REMOVE YOUR CURRENT CONFIGURATION, CREATE BACKUPS OF YOUR CONFIG FILES**

To install simply clone the project onto your filesystem and run `install.sh`.

### Example installation of selected components
```
./install.sh -c vim,zsh
```

### Example installation, and skipping the vim plugin installation
```
./install.sh --skip-vim-plugins
```
