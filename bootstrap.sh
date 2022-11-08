echo "Bootstrapping system"

echo "Detected Debian UNIX"

# apt
sudo apt update && sudo apt upgrade -y
sudo apt install fontconfig
sudo apt install unzip

# font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/Hasklig.zip
unzip Hasklig.zip -d ~/.fonts
fc-cache -fv

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
echo "Neovim"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt-get install neovim

