# SSH Tunneling and Port Forwarding Guide

SSH tunneling allows secure forwarding of network traffic through an encrypted SSH connection.  
It is commonly used to access internal services, bypass network restrictions, and create secure communication channels.

There are three main types of SSH port forwarding:

- Local Port Forwarding
- Remote Port Forwarding
- Dynamic Port Forwarding (SOCKS Proxy)

--------------------------------------------------

## 1. Local Port Forwarding

Local port forwarding allows a port on the local machine to be forwarded to a service running on a remote server.

Command example:

ssh -L 8080:localhost:80 user@server

Explanation:

8080 → local machine port  
localhost:80 → destination on the remote server  

This means that when a user accesses:

http://localhost:8080

the request will be securely forwarded through SSH to:

server:80

Use Case:

A common use case is accessing a web application that runs on a remote server but is not publicly exposed to the internet.

Example scenario:

A company web dashboard runs on port 80 of an internal server.  
Using SSH local forwarding, a developer can access the service securely through:

http://localhost:8080

--------------------------------------------------

## 2. Remote Port Forwarding

Remote port forwarding allows a port on the remote server to forward traffic to a service running on the local machine.

Command example:

ssh -R 9000:localhost:3000 user@server

Explanation:

9000 → port on the remote server  
localhost:3000 → port on the local machine  

This means that when someone accesses:

server:9000

the traffic will be forwarded to:

localhost:3000 on the client machine.

Use Case:

This is useful when a developer wants to expose a local development server to a remote machine.

Example scenario:

A developer runs a web application locally on port 3000.  
Using remote forwarding, the server can access the application through:

server:9000

--------------------------------------------------

## 3. Dynamic Port Forwarding (SOCKS Proxy)

Dynamic port forwarding creates a SOCKS proxy through an SSH connection.

Command example:

ssh -D 1080 user@server

Explanation:

Port 1080 on the local machine becomes a SOCKS proxy.  
Applications can route their traffic through this proxy, which will then be sent securely through the SSH server.

Use Case:

This method is commonly used to route internet traffic through a secure tunnel.

Example scenario:

A user connects to a remote SSH server and configures the browser to use:

SOCKS proxy → localhost:1080

All browser traffic will then be encrypted and routed through the SSH server.

--------------------------------------------------

## Conclusion

SSH tunneling is a powerful feature for secure networking.

Summary:

Local Port Forwarding  
Forward local port → remote service

Remote Port Forwarding  
Forward remote port → local service

Dynamic Port Forwarding  
Create a SOCKS proxy for secure traffic routing

These techniques are widely used in system administration, development environments, and secure remote access.
