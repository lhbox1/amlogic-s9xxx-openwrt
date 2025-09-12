#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Add the default password for the 'root' user（Change the empty password to 'password'）
#sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='immortalwrt'" >>package/base-files/files/etc/openwrt_release


#修改默认主机名
sed -i "s/hostname='.*'/hostname='cm311-1a'/g" package/base-files/files/bin/config_generate
# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
sed -i 's/192.168.1.1/192.168.15.55/g' package/base-files/files/bin/config_generate
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
rm -rf package/luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

git clone https://github.com/sbwml/luci-app-openlist2 package/luci-app-openlist2
#passwall
rm -rf feeds/packages/net/sing-box
rm -rf feeds/packages/net/trojan-plus
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/xray-core
rm -rf feeds/packages/net/hysteria
rm -rf feeds/packages/net/dns2socks
rm -rf feeds/packages/net/geoview
rm -rf feeds/packages/net/ipt2socks
rm -rf feeds/packages/net/microsocks
rm -rf feeds/packages/net/naiveproxy
rm -rf feeds/packages/net/shadowsocks-libev
rm -rf feeds/packages/net/shadowsocks-rust
rm -rf feeds/packages/net/shadowsocksr-libev
rm -rf feeds/packages/net/simple-obfs
rm -rf feeds/packages/net/tcping
rm -rf feeds/packages/net/tuic-client
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/v2ray-plugin
rm -rf feeds/packages/net/xray-plugin
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall-packages


git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash

git clone https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky
git clone https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

git clone https://github.com/sbwml/luci-app-mosdns.git package/luci-app-mosdns





#
# Apply patch
# git apply ../config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

