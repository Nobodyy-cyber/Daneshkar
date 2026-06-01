# SSH Connection Timeout Troubleshooting

## Scenario
A user tries to connect to a server using SSH but the connection times out.

Example error:

ssh user@server
ssh: connect to host server port 22: Connection timed out

This guide explains possible causes, diagnostic commands, and solutions.

---

# Possible Causes, Diagnostics, and Solutions

## 1. Firewall Blocking SSH Port

Cause:
A firewall on the server or network is blocking port 22.

Diagnostic Commands:

sudo ufw status
sudo iptables -L
nc -zv server 22
telnet server 22

Solution:

Allow SSH port through the firewall.

sudo ufw allow 22

or

sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

---

## 2. Incorrect IP Address or Port

Cause:
The client is trying to connect to the wrong IP address or the SSH service is running on a different port.

Diagnostic Commands:

ping server
nc -zv server 22

Check SSH configuration on the server:

cat /etc/ssh/sshd_config | grep Port

Solution:

Use the correct IP or specify the correct port.

ssh -p 22 user@server

---

## 3. Network Routing Problem

Cause:
The client cannot reach the server due to routing issues.

Diagnostic Commands:

ip route
traceroute server
ping server

Solution:

Fix the routing configuration or add the correct gateway.

sudo ip route add default via 192.168.1.1

---

## 4. Server Down or SSH Service Not Running

Cause:
The server is offline or the SSH service is not running.

Diagnostic Commands:

ping server
systemctl status ssh
ss -tuln | grep 22

Solution:

Start or restart the SSH service.

sudo systemctl start ssh
sudo systemctl restart ssh

---

## 5. DNS Resolution Failure

Cause:
The hostname cannot be resolved to an IP address.

Diagnostic Commands:

nslookup server
dig server

Solution:

Fix DNS configuration.

Check DNS servers:

cat /etc/resolv.conf

Add a valid DNS server if necessary.

nameserver 8.8.8.8

---

# Testing SSH Timeout

You can test SSH timeout behavior using:

timeout 5 ssh user@server

Other useful connectivity tests:

telnet server 22
nc -zv -w 5 server 22

---

# Summary

SSH timeout issues can occur due to firewall restrictions, incorrect IP or port configuration, routing problems, server downtime, or DNS resolution failures. Systematic diagnostics using networking tools helps identify and resolve the root cause efficiently.
