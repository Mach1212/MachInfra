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

## TODO
- decrease repeat-delay time
- Lazygit include config w/ work profile
- close all buffers to my right or left / all
- Grok integration
- WCA integration
- Multicursor
- No astrotheme, just my own quick colorscheme
- UI glitch, if in a nix file go to root {} and see red initial color replaced with wack white
- add plugin which adds file templates for new files
- Fix telescope keybinds. Use the new pickers.
- Have flash for / search
- loading animation on doc load <shift-k>
- schemastore for json(like package.json) completion
- rest.nvim for http help
- Quick way to sed global one line or a range.


## IDE OLD

- Many plugins had isolated update paths. Everything needs to be in flake.nix.
- Want more UPDATES.
- Want easier path to add features, lsp, debug, etc.
- Too hard to tell what plugin does what. Keep all in one place with descriptions.
- Need a thing which scans nixvim plugins for new useful plugins
- Keymaps scattered everywhere


