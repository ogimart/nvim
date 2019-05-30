# neovim init.vim

My neovim configuration for:

    C++
    Clojure
    Common Lisp
    Go
    Python
    PostgreSQL

External dependencies: `fzf`, `ag`, `pyenv`

## Installation

### OS X neovim

```sh
brew install neovim
```

### Debian neovim

```sh
sudo apt-add-repository ppa:neovim-ppa/stable
apt-get update
sudo apt-get install neovim
```

### Plugins and Configuration

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

```bash
nvim +'silent! colorscheme' +'PlugInstall --sync' +qa
```

### Docker

```Dockerfile
RUN git clone https://github.com/ogimart/nvim.git ~/.config &&\
    .config/nvim/insall.sh
```
