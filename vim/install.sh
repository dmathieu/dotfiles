if [[ ! -d ./vim/vim.symlink/bundle/Vundle.vim/.git ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ./vim/vim.symlink/bundle/Vundle.vim
fi

vim +PluginInstall +qall
