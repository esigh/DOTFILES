# DOTFILES
For nvim to use .vimrc copy the following code to ~/.config/nvim/init.vim
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
