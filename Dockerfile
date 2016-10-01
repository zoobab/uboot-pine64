FROM ubuntu:14.04
MAINTAINER Benjamin Henrion <zoobab@gmail.com>

RUN apt-get update
RUN apt-get install -yy -q devscripts gcc-aarch64-linux-gnu wget device-tree-compiler bc

ENV user pine64
RUN useradd -d /home/$user -m -s /bin/bash $user
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
RUN chmod 0440 /etc/sudoers.d/$user

USER $user
WORKDIR /home/$user

RUN wget ftp://ftp.denx.de/pub/u-boot/u-boot-2016.09.tar.bz2
RUN tar -xf u-boot-2016.09.tar.bz2

WORKDIR /home/$user/u-boot-2016.09
ENV CROSS_COMPILE aarch64-linux-gnu-
RUN set -e ; make pine64_plus_defconfig
RUN set -e ; make
