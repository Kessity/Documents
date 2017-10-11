#!/bin/bash

# echo 关闭utc************************************************************
# sudo timedatectl set-local-rtc 1 --adjust-system-clock
# echo 删除基本不用的插件*************************************************
# sudo apt-get remove libreoffice-common
# sudo apt-get remove unity-webapps-common
# sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca webbrowser-app gnome-sudoku landscape-client-ui-install
# sudo apt-get remove onboard deja-dup
# echo 安装常用软件*******************************************************
# sudo apt install git cmake vim sdcv unrar ctags vim-gnome autoconf ksnapshot libboost-dev libboost-system-dev libboost-thread-dev libboost-filesystem-dev
# sudo apt install apache2 php libapache2-mod-php php-mysql php7.0-dev clang build-essential module-assistant gcc-multilib g++-multilib
# git config --global user.email "1677921708@qq.com"
# git config --global user.name "Kessity"
# sudo apt install build-essential
# sudo apt-get install python-dev python3-dev
# echo 安装经典菜单指示器**************************************************
# sudo add-apt-repository ppa:diesch/testing
# sudo apt-get update
# sudo apt-get install classicmenu-indicator
# echo 安装系统指示器SysPeek************************************************
# sudo add-apt-repository ppa:nilarimogard/webupd8
# sudo apt-get update
# sudo apt-get install syspeek
# 常用链接
# sudo ln -s /usr/bin/vim /usr/bin/v
# echo 安装mysql*************************************************************
# sudo apt-get install mysql-server
# sudo apt-get install mysql-client
# sudo apt-get install libmysqlclient-dev

# cd ~/Public

# echo 安装wps****************************************************
# sudo dpkg -i wps-office_8.1.0.3724-b1p2_i386.deb
# sudo apt install -f
# sudo dpkg -i wps-office_8.1.0.3724-b1p2_i386.deb
# sudo apt-get install libglib2.0-0:i386 libpng12-0:i386 libsm6:i386 libxrender1:i386 libfontconfig1:i386
# echo 安装chm阅读器****************************************************
# sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4_amd64.deb
# sudo dpkg -i chmsee_1.3.0-2ubuntu2_amd64.deb
# sudo apt install -f
# sudo dpkg -i chmsee_1.3.0-2ubuntu2_amd64.deb
# echo 安装google-chrome****************************************************
# sudo dpkg -i google-chrome-stable_current_amd64.deb
# sudo apt install -f
# sudo dpkg -i google-chrome-stable_current_amd64.deb
# echo 安装搜狗拼音*******************************************************
# sudo dpkg -i sogoupinyin_2.1.0.0082_amd64.deb
# sudo apt install -f
# sudo dpkg -i sogoupinyin_2.1.0.0082_amd64.deb
# echo 安装fx阅读器*******************************************************
# ./FoxitReader.enu.setup.2.3.1.2182(r242182).x64.run
# echo 安装蓝灯************************************************************
# sudo dpkg -i ./lantern-installer-beta-64-bit.deb

# echo 安装libevent********************************************************
# cd ~/Public/libevent-2.1.8-stable
# sudo ./configure --prefix=/usr
# echo make命令
# sudo make -j4
# sudo make install -j4

# echo 安装node**********************************************************
# cd ~/Public/node-v6.10.1
# sudo ./configure
# echo make命令
# sudo make -j4
# sudo make install -j4

# echo php-mysql扩展*******************************************************
# cd ~/Public/mysql-45881bd
# phpize
# ./configure --with-php-config=/usr/bin/php-config --with-mysql=/usr
# sudo make
# sudo make install

echo YCM配置*************************************************************
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer

cd ~/Documents
