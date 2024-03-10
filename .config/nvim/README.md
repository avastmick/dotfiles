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
- [ ] Add in in-lay hints for Rust. Would be nice to have it to switch on and off by a command.
- [ ] Add a prettier rust-analyzer view. This looks like a status line action - see (https://www.reddit.com/r/neovim/comments/1afw5tc/comment/kogjlbt/)
- [ ] Remove unnecessary text highlighting, especially in VISUAL mode. Too much right now, have mapped 'Esc' to 'noh'.
- [ ] Add `nushell` support.
- [X] Fix harpoon configuration.
- [X] Fix icons for `lsp` etc.
- [X] Add shortcut to hide or turn-off cmp. "Ctrl+e" aborts/cancels the completion.
- [X] re-configure prompt to something simpler.

