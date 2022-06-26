sudo apt install apache2 libapache2-mod-php php
sudo apt install wget unzip zip autoconf gcc libc6 make apache2-utils libgd-dev
sudo useradd nagios
sudo usermod -a -G nagios www-data
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz
tar xzf nagios-4.4.6.tar.gz 
cd nagios-4.4.6/
ls -l
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install
sudo make install-init && sudo make install-commandmode
systemctl enable nagios.service
sudo make install-config && sudo make install-webconf  && sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin 
sudo a2enmod cgi
sudo systemctl restart apache2 && sudo systemctl start nagios && sudo systemctl enable nagios

