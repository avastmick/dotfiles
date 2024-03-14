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
- [ ] $env.env-path file: remove redundant additions to $env.PATH and ensure that $env.HOME is used, rather than a hard-coded path.
- [-] re-configure prompt to something simpler. Add username and machine icon. Add time on prompt.
- [ ] Add in in-lay hints for Rust. Would be nice to have it to switch on and off by a command.
- [ ] Remove unnecessary text highlighting, especially in VISUAL mode. Too much right now, have mapped 'Esc' to 'noh'.
        This is coming from `vim-illuminate` that is called from `lsp.lua`. Just needs to be toned down.
- [X] Tmux fixes: 
        - [X] Keyboard scrolling does not work anymore.
        - [X] Theme to match nvim and alacritty.
        - [X] Sort out status bar.
- [X] Add a prettier rust-analyzer view. 
- [X] Fix `lsp` configuration for Rust.
- [X] The standard LSP has a feature where the function is kept at the top while scrolling. This is super useful, but missing in the Rust LSP.
- [X] Fix harpoon configuration.
- [X] Fix icons for `lsp` etc.
- [X] Add shortcut to hide or turn-off cmp. "Ctrl+e" aborts/cancels the completion.

