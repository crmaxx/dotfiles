#!/bin/sh
echo "Creating emacs.d"
git clone git@github.com:kodx/emacs.d.git ~/.emacs.d
echo "Installing oh-my-zsh"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'zsh' ] && [ "$name" != "VIM.md" ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

for name in zsh/*; do
  target=".oh-my-zsh/$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    echo "Creating $target to .oh-my-zsh"
    ln -s "$PWD/$name" "$target"
  fi
done

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -u ~/.vimrc.bundles +BundleInstall +qa
