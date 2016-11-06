About
=====

Builds uboot for Pine64 board with TFTP netboot support.

As of November 2016, the version of u-boot-2016.11-rc3 contains support for
Pine64 TFTP netboot.

Build
=====

Just run:

```
$ ./build.sh
```

And it should build and copy pine64.img to bin/pine64.img.

Pull
====

Automated built image is here (around 580MB):

```
$ docker pull zoobab/uboot-pine64
```


