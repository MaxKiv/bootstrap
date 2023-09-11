echo "Bootstrapping system"

echo "Boostrapping Ubuntu system"

echo "Downloading apt packages"
# apt
sudo apt update && sudo apt upgrade -y
# font stuff
sudo apt install fontconfig
# unzip
sudo apt install unzip
# fd
sudo apt install fd-find
# ripgrep
sudo apt-get install ripgrep
# compilers
sudo apt-get install clang
sudo apt-get install g++

echo "Downloading Hasklig font"
# font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/Hasklig.zip
unzip Hasklig.zip -d ~/.fonts
fc-cache -fv
rm ./Hasklig.zip

echo "Seting up Tmux"
# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# dotfiles
echo "Downloading dotfiles"
git clone --bare git@github.com:MaxKiv/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

# fzf
echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/git/fzf
~/git/fzf/install

# neovim
echo "Installing Neovim"
sudo apt-get install ninja-build gettext cmake unzip curl
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt-get install neovim

