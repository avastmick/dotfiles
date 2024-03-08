# Neovim Configuration

This is my personal `nvim` config.

requirements:

- `lua` based configuration.
- `lsp` 
- `treesitter`
- `telescope`
- `harpoon`
- Rust, Python, HTML, JavaScript and TypeScript support.

non-requirements:

- tabs or buffer line
- tree view or file exlorer
- VSCode-like UI.

## Issues on existing:

The current configuration is based on Primeagen's configuration from 2022. There are small changes, but it is pretty much the same.

Primeagen's new config is here: [neovimrc](https://github.com/ThePrimeagen/neovimrc)

Look at [RustaceanVim](https://github.com/mrcjkb/rustaceanvim)

The current problems are:

- LSP is not well integrated and does not load on project open. Add a "load" shortcut..?
- The viewer is using 'trouble' and it is not well configured.
- Ease of updates - it is pretty fragile.
- It is `packer` based and that plugin manager is no longer actively maintained.
- The LSP configuration is no longer the latest and most up-to-date.
- It is not the prettiest configuration. Ensure that the in-file LSP notifications have nice icons, etc. :)
- No current support for `nushell`

## New Configuration

The could be a new theme in the offing: [tokyonight](https://github.com/folke/tokyonight.nvim)...

Updates the theme for:

- nvim
- alacritty
- tmux
- nushell.
