FROM ubuntu:14.04
MAINTAINER Benjamin Henrion <zoobab@gmail.com>

RUN apt-get update
RUN apt-get install -yy -q devscripts gcc-aarch64-linux-gnu wget device-tree-compiler bc git

ENV user pine64
RUN useradd -d /home/$user -m -s /bin/bash $user
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
RUN chmod 0440 /etc/sudoers.d/$user

USER $user
WORKDIR /home/$user

ENV CROSS_COMPILE=aarch64-linux-gnu-

RUN git clone https://github.com/apritzel/arm-trusted-firmware.git
WORKDIR /home/$user/arm-trusted-firmware
RUN git checkout allwinner
RUN make PLAT=sun50iw1p1 DEBUG=1 bl31

WORKDIR /home/$user
RUN git clone https://github.com/apritzel/u-boot

WORKDIR /home/$user/u-boot
RUN git checkout 4482cfb5d3747eebb3ff6000937b24f885de4bf6
RUN make pine64_plus_defconfig
RUN make
