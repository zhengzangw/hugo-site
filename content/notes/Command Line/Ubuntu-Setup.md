---
title: Ubuntu Setup
date: 2019-03-21
weight: 20
---

## Platform

### Virtual Machine on macosx

Install virtualbox

```sh
    brew cask install virtualbox
```

Download Ubuntu from [Tsinghua Image](https://mirror.tuna.tsinghua.edu.cn/ubuntu-releases/)

LTS version

- 16.04
- 18.04

<!--more-->

Guest Additions CD Image: Device -> Insert Guest Additions CD Image

After installation and restart, turn on Shared Clipboard and Drag and Drop

### Disk on macosx

Install unetbootin and download Ubuntu 16.04 iso

> Note that directly install Ubuntu 18.04 may cause inbuild monitor fail to work

Install refind on mac (need `crsutil disable`)

Make a boot USB. Start from it with option held, and install on my Disk. Divide the disk by four parts

- EFI:
- Swap:
- Ext4:/
- EXt4:/home

After installation complete, open ubuntu on Disk and upgrade it to 18.04

To run Ubuntu on mac, at least three external devices are needed:

- keyboard
- mouse
- network card (for certain network inbuild one fails)

### Cloud

## Users

```sh
useradd newuser
passwd newuser
usermod -s /bin/bash newuser
usermod -d /home/newuser newuser
visudo
# Add below root ALL=(ALL:ALL) ALL
# newuser ALL=(ALL:ALL) ALL
```

## APT

```sh
sudo apt update && sudo apt upgrade
sudo apt install openssh-server # Client default installed, server need to be installed
sudo apt install build-essential man gcc-doc git vim
sudo apt install zsh tldr tree tmux ctags wget net-tools curl cmake
sudo apt install flex bison # for compiler
sudo apt install libreadline-dev libsdl2-dev qemu-system-x86 # For hw
sudo apt install libc6-dev-i386 # For c -m32
sudo apt install g++-multilib # For c++ -m32
sudo apt install texlive-full, linux-tools-common, linux-tools-generic, linux-tools-`uname -r`
```

If apt upgrade fails, try remove the mentioned lock

```sh
sudo rm /var/lib/apt/lists/lock
```

### change source

```bash
sudo gedit /etc/apt/sources.list
```

写入如下内容 （以下是 18.04 的，版本不符请上[清华镜像](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/)）

```config
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
```

## Vim

### Install with lua

```bash
git clone https://github.com/vim/vim
cd vim/src
make distclean
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1 \
            --enable-cscope \
            --enable-multibyte \
            --enable-gui=gtk2\
            --prefix=/usr
make
sudo make install
```

### spf13

```bash
sh <(curl https://j.mp/spf13-vim3 -L)
(update: curl https://j.mp/spf13-vim3 -L -o - | sh)

sudo apt install fonts-inconsolata
```

In ~/.vimrc.local

```bash
let g:indent_guides_enable_on_vim_startup = 0
set wrap
set tags=./tags;/
```

### Uninstall

```bash
sudo mkdir /usr/include/lua5.1/include
sudo cp /usr/include/lua5.1/*.h /usr/include/lua5.1/include/
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm -rf /usr/local/share/vim
sudo rm /usr/bin/vim
```

## zsh

### prezto

#### Install

```bash
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

Add the following content to ~/.zshrc

```zsh
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

Then change shell (not use sudo, otherwise root shell is changed instead of current one)

```bash
chsh -s `which zsh`
```

After that, if some warning appears, change ~/.zshrc to

```bash
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
```

#### plugin

The plugin in ~/.zpreztorc

```zsh
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'git'\
  'history-substring-search'\
  'autosuggestions'\
  'prompt'
```

### update

```zsh
cd $ZPREZTODIR
git pull
git submodule update --init --recursive
```

## CLI apps config

### git

```bash
git config --global user.name "zhengzangw"
git config --global user.email "zhengzangw@163.com"
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore
```

### Tmux

```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

### fzf

```zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### ssh

Config ssh server

```shell
sudo gedit /etc/ssh/sshd_config
#PasswordAuthentication yes
sudo /etc/init.d/ssh restart
cd ~
mkdir .ssh
```

Generate ssh key pair on mac

```sh
ssh-keygen -t rsa
scp id_rsa.pub serveraddress:~/.ssh/
cat *.pub >> authorized_keys
```

Add in mac ssh config

```ssh
Host alias
    User newuser
    HostName serveraddress
    IdentityFile ~/.ssh/id_rsa
```

### ss

```bash
sudo apt install shadowsocks-libev libsodium-dev
```

The second one is for rc4-md5

Setting at `/etc/shadowsocks-libev/config.json`, run with `nohup sudo ss-local -c /etc/shadowsocks-libev/config.json &`

Install Chrome and [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega), select sock5 and `127.0.0.1:port`.

## vscode

### Sync Setting

Sync setting by plugin 'Setting Sync'

- token: \*\*\*
- gist: \*\*\*

Also change following settings:

- titlebarstyle
- menubarvisibility

### Remote

Use Remote-SSH with ssh

## Python

```shell
sudo apt -y install python-dev python3-dev
sudo apt install python2.7 python2.7-dev python3.5 python3.5-dev
```

### pip

```sh
mkdir .pip
vim .pip/pip.conf
```

Add following content to .pip/pip.conf

```shell
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

or use `pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`

```shell
pip install --upgrade pip
```

### virtualenv

```shell
pip install virtualenv virtualenvwrapper
echo "export WORKON_HOME=~/.virtualenvs" >> .bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> .bashrc
exit
source .bashrc
mkvirtualenv ml --python=python3.5
```

## MIPS Cross Compilation

```bash
sudo apt install linux-libc-dev-mips-cross libc6-mips-cross libc6-dev-mips-cross binutils-mips-linux-gnu gcc-mips-linux-gnu g++-mips-linux-gnu
```

## Software

- Language Input: fcitx
- Vscode
- Chrome
- tweaks
  - `sudo apt install gnome-shell-extension-autohidetopbar`
