# Neovim configuration

## Installation

**Linux**

```bash
git clone --recursive git@github.com:Shatur95/neovim-config.git ~/.config/nvim
cd ~/.config/nvim/pack/plugins/start/telescope-fzf-native.nvim
make
```

**Windows**

```bash
git clone --recursive git@github.com:Shatur95/neovim-config.git $env:LOCALAPPDATA/nvim
cd $env:LOCALAPPDATA/nvim/pack/plugins/start/telescope-fzf-native.nvim
make
```

### Dependencies

**Arch Linux**

```bash
paru -S ripgrep nerd-fonts-jetbrains-mono xkb-switch lua-language-server clang cmake-language-server stylua-git github-cli
```

**Windows**

```bash
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install -g ripgrep llvm JetBrainsMono-NF-Mono windows-terminal gh python pwsh
pip install cmake-language-server
```

Windows-version of xkb-switch should be downloaded manually:

```bash
(New-Object System.Net.WebClient).DownloadFile("https://github.com/DeXP/xkb-switch-win/releases/download/1.0.0/libxkbswitch64.dll", "$env:LOCALAPPDATA/nvim-data/libxkbswitch64.dll")
```
