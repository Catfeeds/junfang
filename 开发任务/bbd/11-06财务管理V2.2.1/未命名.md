####部署vps服务器
yum -y install wget

wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocksR.sh

chmod +x shadowsocksR.sh

./shadowsocksR.sh 2>&1 | tee shadowsocksR.log

####谷歌BBR安装
yum -y install wget

wget --no-check-certificatehttps://github.com/teddysun/across/raw/master/bbr.sh

chmod +x bbr.sh

./bbr.sh


>
http://www.jianshu.com/p/c6046f6f7572
