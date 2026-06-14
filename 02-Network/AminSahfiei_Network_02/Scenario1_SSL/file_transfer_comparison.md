# FTP vs SFTP vs SCP Comparison

## 1. Introduction
File transfer between systems is a common task in networking and system administration. 
Three common protocols used for this purpose are **FTP**, **SFTP**, and **SCP**. 
Each of these protocols has different security levels, use cases, and command syntax.

---

## 2. FTP (File Transfer Protocol)

FTP is one of the oldest protocols used for transferring files over a network.

Port: 21

Characteristics:
- Uses separate control and data channels
- Sends data and credentials in plaintext
- Widely supported but considered insecure

Advantages:
- Simple and widely available
- Easy to use in legacy systems

Disadvantages:
- No encryption
- Vulnerable to packet sniffing and man‑in‑the‑middle attacks
- Requires additional firewall configuration for passive mode

Example command:

ftp ftp.ubuntu.com

Common commands inside FTP shell:
ls
get filename
put filename
bye

---

## 3. SFTP (SSH File Transfer Protocol)

SFTP is a secure file transfer protocol that runs over the SSH protocol.

Port: 22

Characteristics:
- Fully encrypted communication
- Uses the same authentication system as SSH
- Supports file browsing and management

Advantages:
- Strong encryption
- Uses single port (22)
- Secure authentication (password or SSH keys)

Disadvantages:
- Slightly slower due to encryption overhead
- Requires SSH access

Example command:

sftp username@server.com

Common commands inside SFTP shell:
ls
get filename
put filename
exit

---

## 4. SCP (Secure Copy Protocol)

SCP is a command-line tool used to copy files securely between systems using SSH.

Port: 22

Characteristics:
- Encrypted using SSH
- Simple file transfer without interactive browsing

Advantages:
- Very simple and fast
- Secure data transfer
- Good for automation scripts

Disadvantages:
- Limited functionality compared to SFTP
- Not designed for interactive file management

Example commands:

Upload file to server:
scp localfile.txt user@server.com:/home/user/

Download file from server:
scp user@server.com:/home/user/file.txt ./

---

## 5. When to Use Each Protocol

FTP:
Used mainly in legacy systems or isolated internal networks. 
Not recommended for production environments due to lack of encryption.

SFTP:
Best choice for secure file transfers over the internet. 
Commonly used in production environments.

SCP:
Best for quick and simple file transfers between servers, 
especially in automation scripts or DevOps workflows.

---

## 6. Summary

FTP is easy to use but insecure.

SFTP is secure and flexible, making it the preferred option in most modern systems.

SCP is secure and fast, ideal for simple file copying tasks between servers.
