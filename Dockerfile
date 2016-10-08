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

# We will use apritzel patched version with TFTP support, will wait for uptream
# version of next month...
#RUN wget ftp://ftp.denx.de/pub/u-boot/u-boot-2016.09.tar.bz2
#RUN tar -xf u-boot-2016.09.tar.bz2

RUN git clone https://github.com/apritzel/u-boot
RUN cd u-boot && git checkout 4482cfb5d3747eebb3ff6000937b24f885de4bf6

WORKDIR /home/$user/u-boot
ENV CROSS_COMPILE aarch64-linux-gnu-
RUN make pine64_plus_defconfig
RUN make
