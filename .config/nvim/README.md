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

- [X] Fix `lsp` configuration for Rust.
- [X] The standard LSP has a feature where the function is kept at the top while scrolling. This is super useful, but missing in the Rust LSP.
- [ ] Add in in-lay hints for Rust. Would be nice to have it to switch on and off by a command.
- [ ] Add a prettier rust-analyzer view. This looks like a status line action. 
        This is from `fidget` plugin configured in `lsp.lua`. The transparency is not working. It should be configurable using the `winblend` option, but it remains at 100%...
- [ ] Remove unnecessary text highlighting, especially in VISUAL mode. Too much right now, have mapped 'Esc' to 'noh'.
        This is coming from `vim-illuminate` that is called from `lsp.lua`. Just needs to be toned down.
- [ ] Add `nushell` support.
- [X] Fix harpoon configuration.
- [X] Fix icons for `lsp` etc.
- [X] Add shortcut to hide or turn-off cmp. "Ctrl+e" aborts/cancels the completion.
- [X] re-configure prompt to something simpler.

