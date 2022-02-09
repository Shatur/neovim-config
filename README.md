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
paru -S ripgrep nerd-fonts-fira-code lua-language-server clang cmake-language-server stylua-git github-cli python-lsp-server
```

**Windows**

```bash
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install -g ripgrep llvm FiraCode-NF windows-terminal gh python pwsh
pip install cmake-language-server python-lsp-server
```
