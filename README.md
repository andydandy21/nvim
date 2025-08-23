## Requirements

### rust (nightly)

Used with `blink.cmp` plugin for faster code completion

### git (2.4x+)

### nvim (nightly)

`brew install neovim --HEAD`

> If brew is already installed, use: `brew reinstall neovim --HEAD`

### patched font

Patched font for icons used in editor and explorer.
Install from [https://www.nerdfonts.com/](nerdfonts)

### ripgrep

A grep clone built with rust

`brew install ripgrep`

### fzf

a command line fuzzy finder tool.

`brew install fzf`

### bat (with rose-pine theme)

A cat clone with colors. Used for the fzf preview.

```
brew install bat
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
curl --remote-name-all https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine{,-dawn,-moon}.tmTheme
bat cache --build
echo '--theme="rose-pine"' >> "$(bat --config-file)"
```
