# Troubleshooting: Cannot Reach example.com

## Step 1: Check Physical Connection
Command:
ip link show

## Step 2: Check IP Configuration
Command:
ip addr

## Step 3: Check DNS Resolution
Command:
nslookup example.com

## Step 4: Check Routing
Command:
ip route

## Step 5: Check Firewall
Command:
sudo ufw status

## Step 6: Check Application
Command:
curl -I http://example.com

# Possible Root Causes

1. Network cable disconnected
Solution: reconnect cable or enable interface

2. No IP address assigned
Solution: sudo dhclient

3. DNS server problem
Solution: edit /etc/resolv.conf

4. Firewall blocking traffic
Solution: allow ports 80 and 443

5. Web server down
Solution: restart nginx or apache
