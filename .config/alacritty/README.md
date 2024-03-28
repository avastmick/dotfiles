# Notes on installation

## MacOS

Most of my work is on MacOS. 

Alacritty does not work so well on MacOS as it does not have formal Apple certification


### Fixes:

To fix the lack of certification:

```bash
xattr -rd com.apple.quarantine /Applications/Alacritty.app
``` 

To sharpen the fonts:

```bash
defaults write org.alacritty AppleFontSmoothing -int 0
```


