#Linux framebuffer driver for ili9488

Forked from [tgreenwood93/fbtft_ili9488](https://github.com/tgreenwood93/fbtft_ili9488)

Original driver without ili9488 support [notro/fbtft](https://github.com/notro/fbtft.git)

WiKi for original driver [notro/fbtft/wiki](https://github.com/notro/fbtft/wiki)


#Build

1. Get linux souces for your SBC

For NanoPi Neo Core (build on SBC ):
```
cd ~/
git clone https://github.com/friendlyarm/linux.git -b sunxi-4.14.y --depth 1
cd linux
touch .scmversion
make sunxi_defconfig
```

2. Go to video driver directory

From Linux 3.15 (for NanoPi use this variant): 
```
cd drivers/video/fbdev
git clone https://github.com/llunohodl/fbtft_ili9488.git ./fbtft
```

Before Linux 3.15:
```
cd drivers/video
git clone https://github.com/llunohodl/fbtft_ili9488.git ./fbtft
```

3. Change Kconfig and Makefile for video driver 

From Linux 3.15 (for NanoPi use this variant):

Add to drivers/video/fbdev/Kconfig:   `source "drivers/video/fbdev/fbtft/Kconfig"`
Add to drivers/video/fbdev/Makefile:  `obj-y += fbtft/`

Before Linux 3.15:

Add to drivers/video/Kconfig:   `source "drivers/video/fbtft/Kconfig"`
Add to drivers/video/Makefile:  `obj-y += fbtft/`

4. Run morules build

```
make -j4 modules
```



