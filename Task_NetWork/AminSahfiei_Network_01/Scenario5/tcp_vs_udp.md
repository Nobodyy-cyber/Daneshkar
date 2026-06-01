# TCP vs UDP

## 1. Main Differences Between TCP and UDP

1. Connection Type  
TCP is connection-oriented, meaning a connection must be established before data transfer.  
UDP is connectionless and sends data without establishing a connection.

2. Reliability  
TCP is reliable and guarantees packet delivery using acknowledgments and retransmissions.  
UDP does not guarantee delivery and packets may be lost.

3. Speed  
TCP is slower because of error checking and retransmission mechanisms.  
UDP is faster since it sends packets without waiting for acknowledgments.

4. Ordering  
TCP ensures that packets arrive in the correct order.  
UDP does not guarantee packet order.

5. Error Checking  
TCP has strong error checking and recovery mechanisms.  
UDP has minimal error checking.

6. Overhead  
TCP has higher overhead due to connection management and reliability features.  
UDP has lower overhead.

---

## 2. Which Protocol is Better for Each Service

Video Streaming  
UDP is usually preferred because speed is more important than perfect reliability. Small packet loss does not significantly affect the stream.

File Transfer (FTP)  
TCP is used because files must be transferred completely and reliably without data loss.

DNS Query  
UDP is commonly used because DNS queries are small and need very fast responses.

Web Browsing (HTTP/HTTPS)  
TCP is used because reliable data transfer is required for web pages and secure connections.

VoIP Call  
UDP is preferred because real-time communication requires low latency.

Database Query  
TCP is used because database operations require reliable and ordered data transmission.

---

## 3. Checking Active TCP and UDP Ports

The following command can be used to check TCP and UDP ports currently used by the system:

netstat -tuln

Explanation of options:

- t → shows TCP connections
- u → shows UDP connections
- l → shows listening ports
- n → shows numerical addresses instead of resolving hostnames
