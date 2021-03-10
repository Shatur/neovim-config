# Neovim configuration

## Installation

**Linux**

```bash
git clone --recursive git@github.com:Shatur95/neovim-config.git ~/.config/nvim
```

**Windows**

```bash
git clone --recursive git@github.com:Shatur95/neovim-config.git $env:LOCALAPPDATA/nvim
```

### Plugins

**General**

```vim
call firenvim#install(0) " To enable embedding in browsers via firenvim
```

**Arch Linux**

```bash
yay -S ripgrep nerd-fonts-source-code-pro xkb-switch
```

**Windows**

```bash
scoop bucket add nerd-fonts
sudo scoop install -g ripgrep SourceCodePro-NF
```

### Updating plugins

Plugins are stored as submodules.

**Linux**

```bash
git -C ~/.local/share/nvim/site/pack/Shatur submodule update --remote
```

**Windows**

```bash
git -C $env:LOCALAPPDATA/nvim-data/site/pack/Shatur submodule update --remote
```
