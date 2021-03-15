# DOTFILES
Clone this repo and then create a symlink from it to the .vimrc file:
ln ~/DOTFILES/.vimrc ~/.vimrc

For nvim to use .vimrc copy the following code to ~/.config/nvim/init.vim
```
set runtimepath =/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

For completely fresh start need to first install several packages (not inclusive since I don't remember all of them currently):

- https://github.com/junegunn/vim-plug
- https://github.com/junegunn/fzf
- https://github.com/neoclide/coc.nvim

then open up ~/.vimrc with vim and run ```:PlugInstall``` and ```:CocInstall coc-python```
