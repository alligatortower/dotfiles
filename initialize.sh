ln -s ~/settings/flake8 ~/.config
ln -s settings/.vimrc ~/
ln -s settings/.zshrc ~/
ln -s snippets ~/.vim/

cp util/disable-keyboard.sh /home/$(logname)/Desktop
chmod +x /home/$(logname)/Desktop/disable-keyboard.sh

cp util/disable-touchepad.sh /home/$(logname)/Desktop
chmod +x /home/$(logname)/Desktop/disable-touchepad.sh

cp util/enable-input.sh /home/$(logname)/Desktop
chmod +x /home/$(logname)/Desktop/enable-input.sh

