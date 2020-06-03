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
call mkdp#util#install() " Markdown preview
```

**Arch Linux**

```bash
yay -S fzf ripgrep the_silver_searcher nerd-fonts-source-code-pro xkb-switch

# Install LanguageClient-neovim binary, used for semantic highlighting
cd ~/.local/share/nvim/site/pack/Shatur
./install.sh
```

**Windows**

```bash
scoop bucket add nerd-fonts
sudo scoop install -g fzf ripgrep ag SourceCodePro-NF

cd $env:LOCALAPPDATA/nvim-data/site/pack/Shatur
./install.ps1
```

FZF in scoop comes without Vim plugin, so need to download it manually:

```bash
git clone --depth=1 git@github.com:junegunn/fzf.git $env:LOCALAPPDATA/nvim-data/site/pack/Shatur/start/fzf
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

## Style

I use [vint](https://github.com/Vimjas/vint) for configuration linting.
