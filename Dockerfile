# boogy/ctfbox
FROM ubuntu:latest
MAINTAINER OmerYe

ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -yq software-properties-common \
    && apt-get update

RUN apt-get install -yq build-essential
RUN apt-get install -yq zsh
RUN apt-get install -yq python2.7
RUN apt-get install -yq python2.7-dev
RUN apt-get install -yq python-dbg
RUN apt-get install -yq python-pil
# RUN apt-get install -yq python-imaging
RUN apt-get install -yq python-pycryptopp
RUN apt-get install -yq python-pyside
RUN apt-get install -yq python-dev
RUN apt-get install -yq python-pip
RUN apt-get install -yq python-virtualenv
RUN apt-get install -yq virtualenvwrapper
RUN apt-get install -yq python3
RUN apt-get install -yq python3-pip
RUN apt-get install -yq python3-dev
RUN apt-get install -yq libqt4-dev
RUN apt-get install -yq libxml2-dev
RUN apt-get install -yq libxslt1-dev
RUN apt-get install -yq libgraphviz-dev
RUN apt-get install -yq libjpeg8
RUN apt-get install -yq libjpeg62-dev
RUN apt-get install -yq libfreetype6
RUN apt-get install -yq libfreetype6-dev
RUN apt-get install -yq apt-utils
RUN apt-get install -yq default-jre
RUN apt-get install -yq libboost-all-dev
RUN apt-get install -yq git
RUN apt-get install -yq sudo
RUN apt-get install -yq p7zip
RUN apt-get install -yq autoconf
# RUN apt-get install -yq libssl-dev
RUN apt-get install -yq libpcap-dev
RUN apt-get install -yq libffi-dev
RUN apt-get install -yq libqt4-dev
RUN apt-get install -yq graphviz-dev
RUN apt-get install -yq cmake
RUN apt-get install -yq clang
RUN apt-get install -yq llvm
RUN apt-get install -yq nasm
RUN apt-get install -yq tmux
RUN apt-get install -yq gdb
RUN apt-get install -yq gdb-multiarch
RUN apt-get install -yq gdbserver
RUN apt-get install -yq foremost
RUN apt-get install -yq ipython
RUN apt-get install -yq ipython3
RUN apt-get install -yq stow
RUN apt-get install -yq virtualenvwrapper
RUN apt-get install -yq ltrace
RUN apt-get install -yq strace
RUN apt-get install -yq socat
RUN apt-get install -yq tcpdump
RUN apt-get install -yq john
RUN apt-get install -yq hydra
RUN apt-get install -yq vim
RUN apt-get install -yq curl
RUN apt-get install -yq wget
RUN apt-get install -yq nmap
RUN apt-get install -yq gcc-multilib
RUN apt-get install -yq g++-multilib
RUN apt-get install -yq netcat
RUN apt-get install -yq openssh-server
RUN apt-get install -yq openssh-client
RUN apt-get install -yq lsof
RUN apt-get install -yq libc6:i386
RUN apt-get install -yq libncurses5:i386
RUN apt-get install -yq libstdc++6:i386
RUN apt-get install -yq libc6-dev-i386
RUN apt-get install -yq squashfs-tools
RUN apt-get install -yq apktool
RUN apt-get install -yq android-tools-adb 
RUN apt-get install -yq android-tools-fastboot 
RUN apt-get install -yq libimage-exiftool-perl
RUN apt-get install -yq qemu
RUN apt-get install -yq qemu-user
RUN apt-get install -yq qemu-user-static
RUN apt-get install -yq man
RUN apt-get install -yq upx
RUN apt-get install -yq php
RUN apt-get install -yq libreadline-dev
RUN apt-get install -yq libconfig-dev
RUN apt-get install -yq libssl1.0-dev
RUN apt-get install -yq lua5.2 liblua5.2-dev
RUN apt-get install -yq libevent-dev
RUN apt-get install -yq libjansson-dev
RUN apt-get install -yq libpython-dev
RUN apt-get install -yq lldb
RUN apt-get install -yq htop
RUN apt-get install -yq wine-stable
RUN apt-get install -yq steghide
RUN apt-get install -yq xxd
RUN apt-get install -yq bison
RUN apt-get install -yq flex
RUN apt-get install -yq libtool
RUN apt-get install -yq libprotobuf-dev
RUN apt-get install -yq protobuf-compiler
RUN apt-get install -yq yarn
RUN apt-get install -yq unzip


## install golang latest
RUN add-apt-repository ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -yq golang-go

## super root password
RUN /bin/echo -e "toor\ntoor"|passwd root

## setup a user
RUN useradd -m -s /bin/bash re \
    && usermod -aG sudo re \
    && /bin/echo -e "re\nre"|passwd re \
    && chmod 4750 /home/re \
    && mkdir -p /home/re/tools \
    && chown -R re: /home/re \
    && mkdir -p /etc/sudoers.d \
    && echo "re ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/re \
    && echo "kernel.yama.ptrace_scope = 0" > /etc/sysctl.d/10-ptrace.conf, \
    && sysctl -p

## Other python cool pip modules
RUN python2 -m pip install --force-reinstall pip \
    && python2 -m pip install --upgrade r2pipe \
    && python2 -m pip install --upgrade Pillow \
    && python2 -m pip install --upgrade distorm3 \
    && python2 -m pip install --upgrade pycrypto \
    && python2 -m pip install --upgrade psutil \
    && python2 -m pip install --upgrade pyelftools 

RUN python3 -m pip install --force-reinstall pip \
    && python3 -m pip install --upgrade r2pipe \
    && python3 -m pip install --upgrade Pillow \
    && python3 -m pip install --upgrade distorm3 \
    && python3 -m pip install --upgrade pycrypto \
    && python3 -m pip install --upgrade psutil \
    && python3 -m pip install --upgrade pyelftools 
 
## Install Pwntools
RUN python2 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git
RUN python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3

## Install peda
RUN git clone https://github.com/longld/peda.git /home/re/tools/peda \
    && /bin/echo -en "define load_peda\n  source /home/re/tools/peda/peda.py\nend\n" >> /home/re/.gdbinit \
    && echo "alias peda='gdb -ex load_peda'" >> /home/re/.aliases

## Install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg.git /home/re/tools/pwndbg \
    && cd /home/re/tools/pwndbg \
    && ./setup.sh \
    && /bin/echo -en "\ndefine load_pwndbg\n  source /home/re/tools/pwndbg/gdbinit.py\nend\n" >> /home/re/.gdbinit \
    && echo "alias pwndbg='gdb -ex load_pwndbg'" >> /home/re/.aliases


## Install capstone
RUN git clone https://github.com/aquynh/capstone /home/re/tools/capstone \
    && cd /home/re/tools/capstone \
    && ./make.sh \
    && ./make.sh install \
    && cd /home/re/tools/capstone/bindings/python \
    && python3 setup.py install \
    && python2 setup.py install

## Install tg-cli
RUN git clone --recursive https://github.com/vysheng/tg.git /home/re/tools/tg \
    && cd /home/re/tools/tg \
    && ./configure \
    && make

## Install radare2
#RUN git clone https://github.com/radare/radare2 /home/re/tools/radare2 \
#    && cd /home/re/tools/radare2 \
#    && ./sys/install.sh
RUN apt-get install -y radare2

RUN python3 -m pip install angr

## Install ROPGadget
RUN python2 -m pip install ropgadget
RUN python3 -m pip install ropgadget

## Install neovim
RUN add-apt-repository ppa:neovim-ppa/unstable \
	&& apt-get update \
	&& apt-get install -y neovim

## Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash \
	&& apt-get update \
	&& apt-get install -y nodejs

## Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update \
	&& apt-get install -y yarn

EXPOSE 22 1337 8080 3002 3003 4000
USER re
WORKDIR /home/re

## Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/re/.cargo/bin:${PATH}"

## Install wasabi
#RUN git clone https://github.com/danleh/wasabi /home/re/tools/wasabi \
#    && cd /home/re/tools/wasabi \
#    && cargo install --path .

CMD ["/bin/bash", "-i"]

