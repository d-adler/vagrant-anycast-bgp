tee /etc/bgpd.conf <<EOF
AS 65001
connect-retry 5
holdtime 10
log updates
router-id 10.20.1.11
network 10.10.12/24
network 10.10.13/24
network 10.20.1/24
neighbor 10.10.12.12 {
  remote-as 65002
  announce all
}
neighbor 10.10.13.13 {
  remote-as 65003
  announce all
}
deny from any prefix 0.0.0.0/0
EOF
chmod go-rw /etc/bgpd.conf
tee -a /etc/rc.conf.local <<EOF
bgpd_flags=""
EOF
/etc/rc.d/bgpd start

