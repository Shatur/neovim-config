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

### Dependencies

**Arch Linux**

```bash
paru -S fzf ripgrep nerd-fonts-fira-code lua-language-server clang cmake-language-server stylua python-lsp-server
```

**Windows**

```bash
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install -g fzf ripgrep llvm FiraCode-NF-Mono windows-terminal python pwsh
pip install cmake-language-server python-lsp-server
```
