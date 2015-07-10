# Vagrant-based Lab: Anycast via BGP Routing (using OpenBSD)

## Topology

     user
      |
  r2--r1--r3
  |        |
  |        |
  s1      s2

BGP Routers: r1-r3
Servers:     s1,s2

Common IP: 10.30.1.3

## Tests

  host $ vagrant up
  host $ vagrant ssh user
  user $ traceroute 10.30.1.3

  traceroute to 10.30.1.3 (10.30.1.3), 64 hops max, 40 byte packets
   1  10.20.1.11 (10.20.1.11)  0.701 ms  0.562 ms  0.416 ms
   2  10.10.12.12 (10.10.12.12)  0.705 ms  1.064 ms  0.645 ms
   3  10.30.1.3 (10.30.1.3)  0.812 ms  0.969 ms  0.673 ms

  user $ ping 10.30.1.3
  
  host $ vagrant suspend r2

  host $ vagrant suspend r3

  host $ vagrant resume r2


