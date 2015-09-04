ln -s ~/settings/.zshrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/settings/.vimrc ~/
ln -s ~/settings/snippets ~/.vim/
ln -s ~/settings/flake8 ~/.config

cp util/disable-keyboard.sh /home/$(logname)/Desktop
chmod +x /home/$(logname)/Desktop/disable-keyboard.sh

cp util/disable-touchepad.sh /home/$(logname)/Desktop
chmod +x /home/$(logname)/Desktop/disable-touchepad.sh

cp util/enable-input.sh /home/$(logname)/Desktop
chmod +x /home/$(logname)/Desktop/enable-input.sh

