# SSL/TLS Best Practices

## 1. Difference between SSL and TLS
- **SSL (Secure Sockets Layer):** The original security protocol developed by Netscape. All versions (1.0, 2.0, 3.0) are now deprecated and considered insecure due to significant vulnerabilities.
- **TLS (Transport Layer Security):** The modern, secure successor to SSL, standardized by the IETF. In modern infrastructure, what is colloquially referred to as "SSL" is actually the implementation of the **TLS** protocol.

## 2. Difference between Self-signed and CA-signed Certificates
- **Self-signed Certificate:** A certificate signed by the entity it identifies rather than a trusted third party. These are suitable for internal development or testing environments but trigger security warnings in browsers because they cannot be cryptographically verified by a trusted authority.
- **CA-signed Certificate:** A certificate issued and digitally signed by a trusted Certificate Authority (CA) after verifying the applicant's identity. Browsers and operating systems trust these certificates by default, ensuring a secure and seamless experience for end-users.

## 3. Top 5 SSL/TLS Best Practices
1. **Use Modern Protocols:** Always use TLS 1.2 or 1.3. Explicitly disable outdated and vulnerable protocols like SSL 3.0, TLS 1.0, and TLS 1.1.
2. **Prioritize Strong Cipher Suites:** Configure your server to favor ciphers that support Forward Secrecy (FS) and avoid weak algorithms like DES or RC4.
3. **Use Robust Key Lengths:** For RSA-based certificates, use a minimum key length of 2048 bits. For ECC (Elliptic Curve Cryptography), use at least 256 bits.
4. **Automated Lifecycle Management:** Use tools (e.g., Certbot) to manage certificate renewal automatically to prevent service outages caused by expired certificates.
5. **Implement HSTS:** Enable HTTP Strict Transport Security (HSTS) to force browsers to interact with your server exclusively over HTTPS, preventing protocol downgrade attacks.

## 4. Why HTTP is Unsafe and How HTTPS Ensures Security
- **Why HTTP is Unsafe:** HTTP transmits data in **plaintext**. This means any malicious actor positioned between the client and the server (Man-in-the-Middle) can intercept, read, or even modify sensitive information such as login credentials, personal data, or session cookies.
- **How HTTPS Ensures Security:**
  - **Encryption:** All data transferred between the client and server is encrypted, ensuring that even if intercepted, it remains unreadable to unauthorized parties.
  - **Authentication:** Through digital certificates, HTTPS verifies that the server the client is connecting to is legitimate and not an imposter.
  - **Data Integrity:** HTTPS uses Message Authentication Codes (MAC) to ensure that the data has not been tampered with or corrupted during transmission.
