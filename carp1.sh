echo "inet 10.30.1.3 255.255.255.0 10.30.1.0 vhid 1 pass foobar carpdev em2" >>/etc/hostname.carp0
echo "pass on em1 proto carp keep state" >>/etc/pf.conf
pfctl -f /etc/pf.conf
sh /etc/netstart




