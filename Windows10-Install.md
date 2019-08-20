# Windows 10 (Pro) Notes

**TL;DR:** Just run `./windows10_install.ps1`, job (largely) done.

## Extra components

There is no Scoop `json` for `Wireguard` as yet, so has to be manually installed. See the [Wireguard download page](https://www.wireguard.com/install/) for details.

## Extra Work

SpaceVim does work using the NeoVim QT app and in a PowerShell terminal if the right font is installed.

- Clone the SpaceVim repo
    - `git clone https://github.com/SpaceVim/SpaceVim.git $HOME\.SpaceVim` 
- Copy over custom config into `$HOME\.SpaceVim.d`
- Download the [`install.cmd`](https://spacevim.org/install.cmd) script and run it.