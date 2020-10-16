[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
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

Copy to a MicroSD card
======================

```
$ dd if=bin/pine64.img of=/dev/sdx bs=64k
```

where sdx is you microsd device.

Links
=====

* https://github.com/apritzel/pine64
