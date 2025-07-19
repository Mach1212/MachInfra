# MachInfra

## WSL

- thing which deletes everything on boot
- Python thingi

## IDE

### INSTALLING
1. Run `cd nixvim_config && nix build`
2. `alias vi=$PWD/result/bin/nvim`

### GOALS
- Separated by feature so finding what is used for what is easier. If a feature is buggy, go to that file and debug it's plugins.

## IDE OLD

- Many plugins had isolated update paths. Everything needs to be in flake.nix.
- Want more UPDATES.
- Want easier path to add features, lsp, debug, etc.
- Too hard to tell what plugin does what. Keep all in one place with descriptions.
- Need a thing which scans nixvim plugins for new useful plugins
- Keymaps scattered everywhere
