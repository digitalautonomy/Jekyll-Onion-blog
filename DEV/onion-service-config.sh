# onion service for jekyll

echo "HiddenServiceDir /var/lib/tor/torified-blog/" >> /etc/tor/torrc ;
echo "HiddenServicePort 80 0.0.0.0:4000" >> /etc/tor/torrc ;


# onion service for openssh-server

echo "HiddenServiceDir /var/lib/tor/torified-ssh/" >> /etc/tor/torrc ;
echo "HiddenServicePort 22 127.0.0.1:22" >> /etc/tor/torrc ;

# restart tor to apply changes

systemctl restart tor


# print onion links

echo "Enlace del blog:"
cat /var/lib/tor/torified-blog/hostname

echo "Enlace de conexion ssh:"
cat /var/lib/tor/torified-ssh/hostname


