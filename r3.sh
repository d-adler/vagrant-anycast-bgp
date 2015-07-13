tee /etc/bgpd.conf <<EOF
AS 65003
connect-retry 5
holdtime 10
log updates
router-id 10.20.3.13
network 10.20.3/24
network 10.30.1/24
neighbor 10.10.13.11 {
  remote-as 65001
  announce all
}
deny from any prefix 0.0.0.0/0
EOF
chmod go-rw /etc/bgpd.conf
tee -a /etc/rc.conf.local <<EOF
bgpd_flags=""
EOF
/etc/rc.d/bgpd start

