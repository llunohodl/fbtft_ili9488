sudo apt-get install -y libncurses5-dev libncursesw5-dev u-boot-tools
git clone https://github.com/friendlyarm/linux.git -b sunxi-4.14.y --depth 1
cd linux
touch .scmversion
make sunxi_defconfig ARCH=arm CROSS_COMPILE=arm-linux-
cd drivers/video/fbdev/
git clone https://github.com/llunohodl/fbtft_ili9488.git ./fbtft
echo source \"drivers/video/fbdev/fbtft/Kconfig\" >> ./Kconfig
echo obj-y += fbtft/ >> ./Makefile
cd ../../../
make -j$(nproc) modules ARCH=arm CROSS_COMPILE=arm-linux-
