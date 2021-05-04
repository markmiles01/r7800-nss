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


cat >> .config <<EOF
CONFIG_KERNEL_BUILD_USER="markmiles01"
CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions @ markmiles01"
EOF

# R7800:
cat >> .config <<EOF
CONFIG_TARGET_ipq806x=y
CONFIG_TARGET_ipq806x_generic_DEVICE_netgear_r7800=y
EOF

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
CONFIG_PACKAGE_luci-app-oaf=y #应用过滤
CONFIG_PACKAGE_luci-app-serverchan=y #微信推送
CONFIG_PACKAGE_luci-app-adguardhome=y #ADguardHome去广告服务
CONFIG_PACKAGE_luci-app-smartdns-compat=y #SmartDns服务
CONFIG_PACKAGE_luci-app-vpn-policy-routing=y #VPN-Policy-Routing
EOF

# Lean:
# cat >> .config <<EOF
# CONFIG_POSTFIX_TLS is not set
# CONFIG_POSTFIX_SASL is not set
# CONFIG_POSTFIX_LDAP is not set
# CONFIG_POSTFIX_CDB is not set
# CONFIG_POSTFIX_SQLITE is not set
# CONFIG_POSTFIX_PCRE is not set
# EOF

# 常用LuCI插件(禁用):
# cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-unblockneteasemusic-go is not set #解锁网易云灰色歌曲
# CONFIG_PACKAGE_luci-app-unblockmusic=y #解锁网易云灰色歌曲
# CONFIG_UnblockNeteaseMusic_Go=y #解锁网易云灰色歌曲
# CONFIG_UnblockNeteaseMusic_NodeJS is not set #解锁网易云灰色歌曲
# CONFIG_PACKAGE_luci-app-hd-idle is not set #磁盘休眠
# EOF

# Passwall插件:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ipt2socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_socks is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_pdnsd=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns2socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs is not set
EOF

# SSR-Plus插件:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_obfs is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_plugin is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Redsocks2=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server is not set
EOF

# ssr-plus-Jo(禁用):
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Shadowsocks is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_V2ray is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Kcptun is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_ShadowsocksR_Server is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Shadowsocks_Server is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_ShadowsocksR_Socks is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Shadowsocks_Socks is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_ipt2socks is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_dnscrypt_proxy is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_dnsforwarder is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_ChinaDNS is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_haproxy is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_privoxy is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_simple-obfs is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_simple-obfs-server is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_udpspeeder is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_udp2raw-tunnel is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_GoQuiet-client is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_GoQuiet-server is not set
# CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_v2ray-plugin is not set
# CONFIG_PACKAGE_luci-app-vssr is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Shadowsocks is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_V2ray is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Shadowsocks_Server is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Socks is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Shadowsocks_Socks is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ipt2socks is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_microsocks is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_dns2socks is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_dnscrypt_proxy is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_dnsforwarder is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ChinaDNS is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_haproxy is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_privoxy is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_simple-obfs is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_simple-obfs-server is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_udpspeeder is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_udp2raw-tunnel is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_GoQuiet-client is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_GoQuiet-server is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_v2ray-plugin is not set
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_luci-app-dockerman_INCLUDE_ttyd=y
# CONFIG_POSTFIX_TLS is not set
# CONFIG_POSTFIX_SASL is not set
# CONFIG_POSTFIX_LDAP is not set
# CONFIG_POSTFIX_CDB is not set
# CONFIG_POSTFIX_SQLITE is not set
# CONFIG_POSTFIX_PCRE is not set
EOF

# VPN相关插件(禁用):
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-vpn-policy-routing=y #VPN-Policy-Routing
CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=y #ipsec VPN服务
CONFIG_PACKAGE_luci-app-ipsec-vpnd=y #IPSec VPN 服务器
CONFIG_PACKAGE_luci-app-pppoe-relay=y #PPPoE穿透
CONFIG_PACKAGE_luci-app-pppoe-server=y #PPPoE服务器
CONFIG_PACKAGE_luci-app-pptp-vpnserver-manyusers=y #pptp VPN
CONFIG_PACKAGE_luci-app-trojan-server=y #Trojan Server
# CONFIG_PACKAGE_luci-app-v2ray-server is not set #V2ray服务器
# CONFIG_PACKAGE_luci-app-brook-server is not set #brook服务端
# CONFIG_PACKAGE_luci-app-ssr-libev-server is not set #ssr-libev服务端
# CONFIG_PACKAGE_luci-app-ssr-python-pro-server is not set #ssr-python服务端
CONFIG_PACKAGE_luci-app-kcptun=y
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set #ssr服务端
EOF

# luci apps :
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-adbyby-plus=y #adbyby去广告	
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-filetransfer=y #系统-文件传输
CONFIG_PACKAGE_luci-app-qos-gargoyle=y #Gargoyle QoS流控
CONFIG_PACKAGE_luci-app-filebrowser=y
CONFIG_PACKAGE_luci-app-autoreboot=y #定时重启
# CONFIG_PACKAGE_luci-app-frpc is not set #Frp内网穿透
# CONFIG_PACKAGE_luci-app-frps is not set #Frp内网穿透服务器
CONFIG_PACKAGE_luci-app-upnp=y #通用即插即用UPnP(端口自动转发)
# CONFIG_PACKAGE_luci-app-softethervpn is not set #SoftEtherVPN服务器
CONFIG_PACKAGE_luci-app-vlmcsd=y #KMS激活服务器
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-ddns=y #DDNS服务
# CONFIG_PACKAGE_luci-app-vsftpd is not set #FTP服务器
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_luci-app-control-mia=y
CONFIG_PACKAGE_luci-app-control-timewol=y
CONFIG_PACKAGE_luci-app-control-webrestriction=y
CONFIG_PACKAGE_luci-app-control-weburl=y
# CONFIG_PACKAGE_luci-app-zerotier is not set #ZeroTier内网穿透
CONFIG_PACKAGE_luci-app-accesscontrol=y #访问时间控制
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-flowoffload=y #Turbo ACC 网络加速
CONFIG_PACKAGE_luci-app-guest-wifi=y #WiFi访客网络
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-cpufreq=y #CPU 性能优化调节
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


sed -i 's/^[ \t]*//g' ./.config



