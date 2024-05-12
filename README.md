# Neovim configuration

## Installation

**Linux**

```bash
git clone --recursive git@github.com:Shatur/neovim-config.git ~/.config/nvim
cd ~/.config/nvim/pack/plugins/start/telescope-fzf-native.nvim
cmake -S . -B build -D CMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build
```

**Windows**

```bash
git clone --recursive git@github.com:Shatur/neovim-config.git $env:LOCALAPPDATA/nvim
cd $env:LOCALAPPDATA/nvim/pack/plugins/start/telescope-fzf-native.nvim
cmake -S . -B build -D CMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build
```

### Dependencies

**Arch Linux**

```bash
paru -S ripgrep otf-firamono-nerd rust-analyzer lua-language-server clang cmake-language-server stylua github-cli python-lsp-server
```

**Windows**

```bash
scoop bucket add nerd-fonts
scoop bucket add extras
sudo scoop install -g ripgrep rustup llvm FiraMono-NF-Mono windows-terminal gh python pwsh
pip install python-lsp-server
```
