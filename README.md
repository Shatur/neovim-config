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
paru -S ripgrep nerd-fonts-cascadia-code xkb-switch lua-language-server clang cmake-language-server stylua-git github-cli
```

**Windows**

```bash
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install -g ripgrep llvm CascadiaCode-NF-Mono windows-terminal gh python pwsh
pip install cmake-language-server
```

Windows-version of xkb-switch should be downloaded manually:

```bash
(New-Object System.Net.WebClient).DownloadFile("https://github.com/DeXP/xkb-switch-win/releases/download/1.0.0/libxkbswitch64.dll", "$env:LOCALAPPDATA/nvim-data/libxkbswitch64.dll")
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
