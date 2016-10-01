About
=====

Builds uboot for Pine64 board

Pull
====

Automated built image is here (around 580MB):

```
$ docker pull zoobab/uboot-pine64
```

You can get a shell and copy all uboot binaries:

```
$ docker run -it zoobab/uboot-pine64 /bin/bash
pine64@acef4260088a:~/u-boot-2016.09$ ls
Kbuild       Makefile    arch    config.mk  drivers   include  scripts          u-boot            u-boot.bin  u-boot.lds
Kconfig      README      board   configs    dts       lib      snapshot.commit  u-boot-dtb.bin    u-boot.cfg  u-boot.map
Licenses     System.map  cmd     disk       examples  net      test             u-boot-dtb.img    u-boot.dtb  u-boot.srec
MAINTAINERS  api         common  doc        fs        post     tools            u-boot-nodtb.bin  u-boot.img  u-boot.sym
pine64@acef4260088a:~/u-boot-2016.09$ 
```


Todo
====

* TFTP support
