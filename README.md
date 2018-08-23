# neovim init.vim

My neovim configuration for:

    Common Lisp
    C and C++ (clang)
    Clojure
    Python
    Kotlin
    Java
    SQL (postgresql)

## Installation

External dependencies: `fzf`, `ag`

### OS X

```sh
brew install neovim
```

### Ubuntu

```sh
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get install neovim
```

### Configuration

Install `Plug` for plugin management:

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Clone this repo into `~/.config`:

```sh
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/ogimart/nvim.git
```

Then install the plugins:

```sh
nvim ~/.config/init.el
:PlugInstall
```
