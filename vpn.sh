cp /etc/resolv.conf /etc/resolv1.conf
echo "nameserver 10.4.20.204" > /etc/resolv.conf
cat /etc/resolv1.conf >> /etc/resolv.conf
cd /etc/openvpn/
openvpn --config linux_client.conf