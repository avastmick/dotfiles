# Dotfiles configuration

This documents the current decisions and future direction of my dotfiles generally, specifically those held under `.config`.

## Current state

The current state is based on a `MacOS` installation of a terminal-based development environment, using the following stack for development:

- Terminal - [Alacritty](https://alacritty.org/). Status - GREEN. Excellent, no need to change.
- Terminal multiplexer - [Tmux](https://github.com/tmux/tmux/wiki). Status - AMBER. Worth evaluation of [Zellij](https://zellij.dev/)
- Editor - [NeoVim](https://neovim.io/). Status - GREEN. Excellent `lua` based configuration that has no errors or significant issues. See `nvim` folder for more details.
- Shell - [NuShell](https://www.nushell.sh/). Status - Green. Worth looking at improving skills and base configuration.

### TODO

- [ ] $env.env-path file: remove redundant additions to $env.PATH and ensure that $env.HOME is used, rather than a hard-coded path.
- [ ] Ensure that the `bash` configuration is up to date and that the integration to `atuin` and `ble` is working. Right now there are issues with the `ble` configuration where it clashes with the terminal theme. Look at [Manual Graphics](https://github.com/akinomyoga/ble.sh/wiki/Manual-%C2%A72-Graphics) for more information.

### Tools

Terminal-based tools freqently used.

- Shell history - [Atuin](https://atuin.sh/). Status - GREEN.
- Music - [Spotify Player](https://github.com/aome510/spotify-player). Status - AMBER. Not the best UX and needs restarting when paused, etc.
- Git - full commandline.
- Database - [LazySQL](https://github.com/jorgerojas26/lazysql). Status - RED. Not working for local Postgres Docker installation due to lack of SSL connection.

## Future state

Look at optimisation, robustness and lack of complex configuration.

- Dotfiles - evaluate a shift to [Nix Homemanager](https://nixos.wiki/wiki/Home_Manager), possibly as a part of a wider move to a whole machine configuration using `Nix` and away from `homebrew` and `apt`, etc.
- Terminal multiplexer - evaluate [Zellij](https://zellij.dev/) to see if it uses less memory than `tmux`.
- Editor - evaluate [Helix](https://helix-editor.com/) to see if the early view on memory usage is carried over in everyday mode. The only significant missing feature is `copilot` or similar.


### Helix

Initial look is promising with the following needs:

- Consistently low memory usage. `Nvim` is good, but checking the usage `hx` is stellar! Does it carry over to everyday usage.
- Check when `copilot` or similar is available.
- Check nicer theming. I have `nvim` set up so prettily, shame to go backwards. Play with a custom theme that gets the elements just so.
