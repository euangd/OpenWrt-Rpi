#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERXf
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Add date version
export DATE_VERSION=$(date -d "$(rdate -n -4 -p pool.ntp.org)" +'%Y-%m-%d')
sed -i "s/%C/%C (${DATE_VERSION})/g" package/base-files/files/etc/openwrt_release

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Rename hostname to OpenWrt
pushd package/base-files/files/bin
sed -i 's/ImmortalWrt/OpenWrt/g' config_generate
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd


#d
mkdir /files/lib/firmware/brcm
pushd $/files/lib/firmware/brcm
 sed -i '/files/lib/firmware/brcm/brcmfmac43436-sdio.bin'
 sed -i '/files/lib/firmware/brcm/brcmfmac43436-sdio.txt'
 sed -i '/files/lib/firmware/brcm/brcm/brcmfmac43436s-sdio.bin'
 sed -i '/files/lib/firmware/brcm/brcmfmac43436s-sdio.txt'
popd
