# Existing Computer

source: https://www.atlassian.com/git/tutorials/dotfiles

git init --bare $HOME/.cfg  
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'  
config config --local status.showUntrackedFiles no  
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc  
config remote add origin https://github.com/jhanos/dotfile.git  



config status  
config add .vimrc  
config commit -m "Add vimrc"  
config add .bashrc  
config commit -m "Add bashrc"  
config push  

# New computer

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'  
echo ".cfg" >> .gitignore  
git clone --bare https://github.com/jhanos/dotfile $HOME/.cfg  
config checkout  
config config --local status.showUntrackedFiles no  

