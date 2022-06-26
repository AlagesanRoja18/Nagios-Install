apt install apache2 libapache2-mod-php php
apt install wget unzip zip autoconf gcc libc6 make apache2-utils libgd-dev
useradd nagios
usermod -a -G nagios www-data
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz
tar xzf nagios-4.4.6.tar.gz 
cd nagios-4.4.6/
ls -l
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install
make install-init
make install-commandmode
systemctl enable nagios.service
make install-config
make install-webconf
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
a2enmod cgi
systemctl restart apache2
systemctl start nagios
systemctl enable nagios

