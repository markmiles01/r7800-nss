#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.61.1/g' package/base-files/files/bin/config_generate


# cat >> feeds/luci/modules/luci-base/po/zh_Hans/base.po <<EOF

# #: modules/luci-base/root/usr/share/luci/menu.d/luci-base.json:45
# msgid "NAS"
# msgstr "网络存储"
# EOF


#cat >> .config <<EOF
#CONFIG_KERNEL_BUILD_USER="mark"
#CONFIG_KERNEL_BUILD_DOMAIN="stabledatasolutions.com"
#EOF

# R7800:
#cat >> .config <<EOF
#CONFIG_TARGET_ipq806x=y
#CONFIG_TARGET_ipq806x_generic_DEVICE_netgear_r7800=y
#EOF

# 设置固件大小:
# cat >> .config <<EOF
# CONFIG_TARGET_KERNEL_PARTSIZE=28
# CONFIG_TARGET_ROOTFS_PARTSIZE=100
# EOF

# 固件压缩:
# cat >> .config <<EOF
# CONFIG_TARGET_IMAGES_GZIP=y
# EOF

# 编译UEFI固件:
# cat >> .config <<EOF
# CONFIG_EFI_IMAGES=y
# EOF

# IPv6:
cat >> .config <<EOF
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y
EOF

# NFS:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-fs-ext2=y
CONFIG_PACKAGE_kmod-fs-ext3=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-ntfs=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
EOF

# USB3.0:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-nls-cp437=y
CONFIG_PACKAGE_kmod-nls-iso8859-1=y
CONFIG_PACKAGE_block-mount=y
EOF

# samba:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_samba4-server=y
CONFIG_PACKAGE_samba4-client=y
EOF


# luci [standard OpenWRT] app packages:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-serverchan=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-smartdns-compat=y
CONFIG_PACKAGE_luci-app-vpn-policy-routing=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_luci-app-dockerman_INCLUDE_ttyd=y

EOF

# VPN
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-vpn-policy-routing=y
CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=y
CONFIG_PACKAGE_luci-app-ipsec-vpnd=y
CONFIG_PACKAGE_luci-app-pppoe-relay=y
CONFIG_PACKAGE_luci-app-pppoe-server=y
CONFIG_PACKAGE_luci-app-pptp-vpnserver-manyusers=y
CONFIG_PACKAGE_luci-app-trojan-server=y #Trojan Server
CONFIG_PACKAGE_luci-app-kcptun=y
EOF

# luci apps :
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-qos-gargoyle=y
CONFIG_PACKAGE_luci-app-filebrowser=y
CONFIG_PACKAGE_luci-app-autoreboot=y
# CONFIG_PACKAGE_luci-app-frpc is not set
# CONFIG_PACKAGE_luci-app-frps is not set
CONFIG_PACKAGE_luci-app-upnp=y 
# CONFIG_PACKAGE_luci-app-softethervpn is not set
CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-ddns=y
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_luci-app-control-mia=y
CONFIG_PACKAGE_luci-app-control-timewol=y
CONFIG_PACKAGE_luci-app-control-webrestriction=y
CONFIG_PACKAGE_luci-app-control-weburl=y
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-accesscontrol=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-flowoffload=y
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-guest-wifi=y
EOF

# luci themes:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-atmaterial=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-material=y
CONFIG_PACKAGE_luci-theme-bootstrap-mod=y
CONFIG_PACKAGE_luci-theme-openwrt2020=y
CONFIG_PACKAGE_luci-theme-netgear=y
CONFIG_PACKAGE_luci-theme-rosy=y
CONFIG_PACKAGE_luci-theme-Butterfly=y
CONFIG_PACKAGE_luci-theme-Butterfly-dark=y
CONFIG_PACKAGE_luci-theme-opentomato=y
CONFIG_PACKAGE_luci-theme-opentomcat=y
CONFIG_PACKAGE_luci-theme-argon-mod=y
CONFIG_PACKAGE_luci-theme-darkmatter=y
EOF

# MISC: 
cat >> .config <<EOF
CONFIG_PACKAGE_mtr=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_zsh=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_vim-fuller=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_subversion-server=y
CONFIG_PACKAGE_subversion-client=y
EOF

### TO ABLE TO USE STOCK OPKG'S ###
### https://downloads.openwrt.org/releases/21.02.0-rc1/targets/ipq806x/generic/config.buildinfo ###
cat >> .config <<EOF
CONFIG_TARGET_ipq806x=y
CONFIG_TARGET_ipq806x_generic=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_asrock_g10=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_asrock_g10=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_buffalo_wxr-2533dhp=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_buffalo_wxr-2533dhp=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_compex_wpq864=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_compex_wpq864=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_edgecore_ecw5410=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_edgecore_ecw5410=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_linksys_ea7500-v1=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_linksys_ea7500-v1=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_linksys_ea8500=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_linksys_ea8500=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_nec_wg2600hp=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_nec_wg2600hp=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_nec_wg2600hp3=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_nec_wg2600hp3=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_netgear_d7800=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_netgear_d7800=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_netgear_r7500=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_netgear_r7500=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_netgear_r7500v2=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_netgear_r7500v2=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_netgear_r7800=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_netgear_r7800=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_qcom_ipq8064-ap148-legacy=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_qcom_ipq8064-ap148-legacy=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_qcom_ipq8064-ap148=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_qcom_ipq8064-ap148=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_qcom_ipq8064-ap161=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_qcom_ipq8064-ap161=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_qcom_ipq8064-db149=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_qcom_ipq8064-db149=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_tplink_ad7200=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_tplink_ad7200=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_tplink_c2600=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_tplink_c2600=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_tplink_vr2600v=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_tplink_vr2600v=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_ubnt_unifi-ac-hd=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_ubnt_unifi-ac-hd=""
CONFIG_TARGET_DEVICE_ipq806x_generic_DEVICE_zyxel_nbg6817=y
CONFIG_TARGET_DEVICE_PACKAGES_ipq806x_generic_DEVICE_zyxel_nbg6817=""
CONFIG_ALL_KMODS=y
CONFIG_ALL_NONSHARED=y
CONFIG_DEVEL=y
CONFIG_TARGET_PER_DEVICE_ROOTFS=y
CONFIG_AUTOREMOVE=y
CONFIG_BUILDBOT=y
CONFIG_COLLECT_KERNEL_DEBUG=y
CONFIG_IB=y
CONFIG_IMAGEOPT=y
CONFIG_JSON_OVERVIEW_IMAGE_INFO=y
CONFIG_KERNEL_BUILD_DOMAIN="buildhost"
CONFIG_KERNEL_BUILD_USER="builder"
# CONFIG_KERNEL_KALLSYMS is not set
CONFIG_PACKAGE_cgi-io=y
CONFIG_PACKAGE_libiwinfo-lua=y
CONFIG_PACKAGE_liblua=y
CONFIG_PACKAGE_liblucihttp=y
CONFIG_PACKAGE_liblucihttp-lua=y
CONFIG_PACKAGE_libubus-lua=y
CONFIG_PACKAGE_lua=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-app-firewall=y
CONFIG_PACKAGE_luci-app-opkg=y
CONFIG_PACKAGE_luci-base=y
CONFIG_PACKAGE_luci-lib-base=y
CONFIG_PACKAGE_luci-lib-ip=y
CONFIG_PACKAGE_luci-lib-jsonc=y
CONFIG_PACKAGE_luci-lib-nixio=y
CONFIG_PACKAGE_luci-mod-admin-full=y
CONFIG_PACKAGE_luci-mod-network=y
CONFIG_PACKAGE_luci-mod-status=y
CONFIG_PACKAGE_luci-mod-system=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_luci-proto-ppp=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_rpcd=y
CONFIG_PACKAGE_rpcd-mod-file=y
CONFIG_PACKAGE_rpcd-mod-iwinfo=y
CONFIG_PACKAGE_rpcd-mod-luci=y
CONFIG_PACKAGE_rpcd-mod-rrdns=y
CONFIG_PACKAGE_uhttpd=y
CONFIG_PACKAGE_uhttpd-mod-ubus=y
CONFIG_REPRODUCIBLE_DEBUG_INFO=y
CONFIG_SDK=y
CONFIG_TARGET_ALL_PROFILES=y
CONFIG_VERSIONOPT=y
CONFIG_VERSION_BUG_URL=""
CONFIG_VERSION_CODE=""
CONFIG_VERSION_DIST="OpenWrt"
CONFIG_VERSION_FILENAMES=y
CONFIG_VERSION_HOME_URL=""
CONFIG_VERSION_HWREV=""
CONFIG_VERSION_MANUFACTURER=""
CONFIG_VERSION_MANUFACTURER_URL=""
CONFIG_VERSION_NUMBER=""
CONFIG_VERSION_PRODUCT=""
CONFIG_VERSION_REPO="https://downloads.openwrt.org/releases/21.02.0-rc1"
CONFIG_VERSION_SUPPORT_URL=""
EOF

sed -i 's/^[ \t]*//g' ./.config
