#!/bin/bash

ssh-add /Users/jpldcarvalho/.ssh/github.priv

ssh -TND 6969 suser@$1 &
/usr/local/bin/tun2socks -tunAddr 10.0.0.2 -tunGw 10.0.0.1 -proxyType socks -proxyServer 127.0.0.1:6969 &

sleep 1
route delete default
route add -net $1 10.133.28.1
route add -net 10.130.10.25 10.133.28.1
route add -net 10.130.10.26 10.133.28.1
route add default 10.0.0.2
# make it work somewhere in time
# networksetup -setdnsservers "USB 10/100 LAN" 1.1.1.1 8.8.8.8


( trap exit SIGINT ; read -r -d '' _ </dev/tty )
echo cleaning up...
route delete default
route add default 10.133.28.1
route delete $1
route delete 10.130.10.25
route delete 10.130.10.26
# networksetup -setdnsservers "USB 10/100 LAN" "Empty"
