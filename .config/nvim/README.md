# Neovim Configuration

This is my personal `nvim` config.

requirements:

- `lua` based configuration.
- `lsp` 
- `treesitter`
- `telescope` - NOTE: Install `ripgrep` to ensure `.gitignore` is respected.
- `harpoon`
- Rust, Python, HTML, JavaScript and TypeScript support. Primary language is Rust.

The editor should be "pretty" but avoid over the top highlighting and baubles.

non-requirements:

- tabs or buffer line
- tree view or file exlorer
- VSCode-like UI.

## TODO:

- [ ] Add `nushell` support.
- [ ] Look at (https://github.com/tpope/vim-surround)
- [X] Look at noice a command pop-up, rather than at the bottom (https://github.com/folke/noice.nvim)
- [ ] $env.env-path file: remove redundant additions to $env.PATH and ensure that $env.HOME is used, rather than a hard-coded path.

