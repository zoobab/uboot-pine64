FROM ubuntu:14.04
MAINTAINER Benjamin Henrion <zoobab@gmail.com>

RUN apt-get update
RUN apt-get install -yy -q devscripts gcc-aarch64-linux-gnu wget device-tree-compiler bc git

ENV user pine64
RUN useradd -d /home/${user} -m -s /bin/bash ${user}
RUN echo "${user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${user}
RUN chmod 0440 /etc/sudoers.d/${user}

USER ${user}
WORKDIR /home/${user}

ENV CROSS_COMPILE=aarch64-linux-gnu-

RUN git clone https://github.com/apritzel/arm-trusted-firmware.git
WORKDIR /home/$user/arm-trusted-firmware
RUN git checkout e70dd6ebe65d62d4d4d5873c3d2c900fe5633313
RUN make PLAT=sun50iw1p1 DEBUG=1 bl31

WORKDIR /home/${user}
ENV ubootversion u-boot-2016.11-rc3
RUN wget ftp://ftp.denx.de/pub/u-boot/${ubootversion}.tar.bz2
RUN tar -xf ${ubootversion}.tar.bz2

WORKDIR /home/${user}/${ubootversion}
RUN make pine64_plus_defconfig
RUN make
