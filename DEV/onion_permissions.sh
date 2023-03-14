mkdir /home/pi/blog
echo  "HiddenServiceDir /home/pi/blog \nHiddenServicePort 80 127.0.0.1:80" >> /etc/tor/torrc
systemctl restart tor


