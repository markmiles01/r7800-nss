#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

#git clone https://github.com/ACwifidude/openwrt
rm -rf bin
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# custom packages
#echo "src-git packages-1 https://github.com/kenzok8/packages-1" >> feeds.conf.default
sed -i '$a src-git kenzok8 https://github.com/kenzok8/jell' feeds.conf.default
#sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git OpenAppFilter https://github.com/OpenWrt-Actions/OpenAppFilter' feeds.conf.default

# git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
# wget -P target/linux/generic/hack-5.4 https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
git clone -b master --single-branch https://github.com/Ansuel/nginx-ubus-module package/nginx-ubus-module
git clone -b master --single-branch https://github.com/Ansuel/uwsg package/uwsg

#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/default-settings package/lean/default-settings
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusic package/lean/UnblockNeteaseMusic
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusicGo package/lean/UnblockNeteaseMusicGo
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/baidupcs-web package/lean/baidupcs-web
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/openwrt-fullconenat package/lean/openwrt-fullconenat

#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/lean/luci-app-accesscontrol
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/lean/luci-app-arpbind
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-baidupcs-web package/lean/luci-app-baidupcs-web
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-cpufreq package/lean/luci-app-cpufreq
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-flowoffload package/lean/luci-app-flowoffload
#svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-unblockmusic package/lean/luci-app-unblockmusic

# mv package/lean/luci-app-cpufreq/po/zh-cn  package/lean/luci-app-cpufreq/po/zh_Hans
# mv package/lean/luci-app-unblockmusic/po/zh-cn package/lean/luci-app-unblockmusic/po/zh_Hans
# mv package/lean/luci-app-flowoffload/po/zh-cn package/lean/luci-app-flowoffload/po/zh_Hans
# mv package/lean/luci-app-autoreboot/po/zh-cn package/lean/luci-app-autoreboot/po/zh_Hans
# mv package/lean/luci-app-arpbind/po/zh-cn package/lean/luci-app-arpbind/po/zh_Hans
# mv package/lean/luci-app-accesscontrol/po/zh-cn package/lean/luci-app-accesscontrol/po/zh_Hans


# UPX UCL
# cp -r lede/tools/upx tools
# cp -r lede/tools/ucl tools
##mkdir -p tools/ucl && wget -P tools/ucl https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/ucl/Makefile
##mkdir -p tools/upx && wget -P tools/upx https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/upx/Makefile

### Makefile
##sed  -i '/^# builddir dependencies/i\tools-y += ucl upx' ./tools/Makefile
##sed  -i '/^# builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' ./tools/Makefile
##sed  -i '/tools-$(CONFIG_TARGET_orion_generic)/atools-y += ucl upx' tools/Makefile
##sed  -i '/dependencies/a\\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

wget -O diffconfig https://downloads.openwrt.org/releases/21.02.0-rc1/targets/ipq806x/generic/config.buildinfo

sed -i 's/+iptables-mod-imq/+kmod-ifb/g' package/feeds/kenzok8/luci-app-qosv4/Makefile
rm -rf package/feeds/kenzok8/luci-app-k3screenctrl
rm -rf package/feeds/kenzok8/luci-app-qbittorrent
rm -rf package/feeds/kenzok8/qBittorrent-Enhanced-Edition
rm -rf package/feeds/kenzok8/MentoHUST-OpenWrt-ipk
rm -rf package/feeds/kenzok8/luci-app-xray
rm -rf package/feeds/kenzok8/luci-app-airwhu

#cd package/lean
# git config --global user.email "markmiles01@gmail.com"
# git config --global user.name "markmiles01"
# git init
# git add .
# git commit -m "lean"
