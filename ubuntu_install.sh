sudo apt-add-repository ppa:neovim-ppa/stable
apt-get update
sudo apt-get install neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'silent! colorscheme' +'PlugInstall --sync' +qa
