#!/usr/bin/zsh
set -e

readonly USE_TMUX=true

# Change default shell to zsh
echo "### Change default shell to zsh"
chsh -s /usr/bin/zsh

# apt update
echo "### apt update"
apt update

# create folder
echo "### create folder"
mkdir -p ~/Downloads
mkdir -p ~/.local/bin
mkdir -p ~/Documents/Github
mkdir -p ~/.config/nvim

# wget
echo "### wget"
apt install -y --no-install-recommends wget
# curl
echo "### curl"
apt install -y --no-install-recommends curl
apt install -y --no-install-recommends ca-certificates
update-ca-certificates
# dpkg
echo "### dpkg"
apt install -y --no-install-recommends dpkg
# git
echo "### git"
apt install -y --no-install-recommends git

# dotfiles
echo "### dotfiles"
cd ~/Documents/Github
git clone https://github.com/tom-shimoda/dotfiles_ubuntu
cd dotfiles_ubuntu
cp -R .config/nvim ~/.config
cp .gitconfig ~
cp .p10k.zsh ~
if "${USE_TMUX}"; then
    cp .tmux.conf ~
    cp .tmux-pane-border ~
    chmod a+x ~/.tmux-pane-border
fi
cp .zshrc ~
cd /

# nvim
echo "### nvim"
cd ~/Downloads
wget --no-check-certificate https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
dpkg -i nvim-linux64.deb
cd /

# nvm
echo "### nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# pyenv (for Ubuntu/Debian/Mint : https://github.com/pyenv/pyenv/wiki )
# echo "### pyenv"
# apt install -y --no-install-recommends build-essential libssl-dev zlib1g-dev \
# libbz2-dev libreadline-dev libsqlite3-dev \
# libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# curl https://pyenv.run | bash

# python
echo "### pthon"
apt install -y --no-install-recommends python3
apt install -y --no-install-recommends python3-pip

# zinit
echo "### zinit"
export NO_INPUT=1
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# fzf
echo "### fzf"
cd ~/Documents/Github
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
cd /

# ripgrep
echo "### ripgrep"
apt install -y --no-install-recommends ripgrep

# bat
echo "### bat"
apt install -y --no-install-recommends bat
ln -s /usr/bin/batcat ~/.local/bin/bat

# delta
echo "### delta"
cd ~/Downloads
wget --no-check-certificate https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb
dpkg -i ./git-delta-musl_0.15.1_amd64.deb
cd /

# tmux
if "${USE_TMUX}"; then
    echo "### tmux"
    apt install -y --no-install-recommends tmux
    cd ~/Documents/Github
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # tmux-powerline
    echo "### tmux-powerline"
    git clone https://github.com/tom-shimoda/tmux-powerline
    cd /
fi

# font
# cd ~/Downloads
# apt install -y --no-install-recommends unzip
# apt install -y --no-install-recommends fontconfig
# wget --no-check-certificate https://github.com/adam7/delugia-code/releases/download/v2111.01.2/delugia-book.zip
# unzip delugia-book.zip
# cp -R delugia-book /usr/share/fonts

# apply dotfiles
echo ""
echo "### Installed successfuly."
echo "Run this command."
echo "> source ~/.zshrc"
echo "> zsh ~/setup.zsh"