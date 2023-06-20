#Requires -RunAsAdministrator

$User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

echo "Bootstrapping system"

echo "Bootstrapping windows system"

echo "Installing fonts"
iwr -outf C:\Users\$User\install-nerdfonts.ps1 https://gist.githubusercontent.com/daretodave/bd08f981ea51240053cfcf073272de25/raw/4ab599950e8e323f21c8c261bb25b210f89bcc55/install-nerdfonts.ps1
cd $HOME\
.\install-nerdfonts.ps1

echo "Setup OpenSSH config"
# Windows 10 should have openssh by default
# I track .ssh/config in my dotfiles, should be good by default
ssh -T MaxKiv
ssh -T Max-Kivits

echo "Downloading chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
refreshenv
choco -?

choco install make, llvm, fd, fzf, ripgrep, glow, cmake -y

echo "Seting up Tmux"
# tmux
echo "TODO, this should be fun"
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#tmux source ~/.tmux.conf

# dotfiles
echo "Downloading dotfiles"
git clone --bare git@github.com:MaxKiv/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

# # fzf
# echo "Installing fzf"
# git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
# $HOME/.fzf/install.ps1

# neovim
echo "Installing Neovim"
choco install neovim --pre -y

# Symlink alacritty.yml
New-Item -ItemType SymbolicLink -Path "C:\Users\$User\AppData\Roaming\alacritty\alacritty.yml" -Target "C:\Users\$User\.config\alacritty\alacritty.yml"
# Symlink neovim config
New-Item -ItemType SymbolicLink -Path "C:\Users\$User\AppData\Local\nvim" -Target "C:\Users\$User\.config\nvim"

# Symlink glow binary
New-Item -ItemType SymbolicLink -Target "C:/ProgramData/chocolatey/bin/glow.exe " -Path "C:\Users\$User\.local\bin\glow.exe"

# Alacritty theme
git clone https://github.com/catppuccin/alacritty.git $HOME/.config/alacritty/catppuccin

echo "Done, you should probably reboot..."
