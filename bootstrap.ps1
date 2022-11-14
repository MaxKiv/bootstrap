echo "Bootstrapping system"

echo "Bootstrapping windows system"

echo "Setup SSH config"
echo "TODO"

echo "Installing fonts"
iwr -outf C:\Users\max\install-nerdfonts.ps1 https://gist.githubusercontent.com/daretodave/bd08f981ea51240053cfcf073272de25/raw/4ab599950e8e323f21c8c261bb25b210f89bcc55/install-nerdfonts.ps1
cd $HOME\max
.\install-nerdfonts.ps1

echo "Downloading apt packages"
echo "TODO"
# apt
#sudo apt update && sudo apt upgrade -y
# fd
#sudo apt install fd-find
# ripgrep
#sudo apt-get install ripgrep

echo "Seting up Tmux"
# tmux
echo "TODO"
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#tmux source ~/.tmux.conf

# dotfiles
echo "Downloading dotfiles"
git clone --bare git@github.com:MaxKiv/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

# fzf
echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install.ps1

# neovim
echo "Installing Neovim"
echo "TODO"
#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt update
#sudo apt-get install neovim

# TODO path + alacritty.yml & nvim config symlink
