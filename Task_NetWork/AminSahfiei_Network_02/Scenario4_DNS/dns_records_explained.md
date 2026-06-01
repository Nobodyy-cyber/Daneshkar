## 4. MX Record (Mail Exchange Record)

**Description:**
MX records specify the mail servers responsible for receiving email on behalf of a domain.

**Use Case:**
When someone sends an email to `user@gmail.com`, the sending server checks the MX records of `gmail.com` to determine where to deliver the email.

**Example Command:**
dig google.com MX

**Example Output:**
google.com.   IN   MX   10 smtp.google.com.

---

## 5. TXT Record

**Description:**
TXT records store arbitrary text information associated with a domain.

**Use Case:**
TXT records are widely used for email security mechanisms such as SPF, DKIM, and domain verification.

**Example Command:**
dig google.com TXT

**Example Output:**
google.com.   IN   TXT   "v=spf1 include:_spf.google.com ~all"

---

## 6. NS Record (Name Server Record)

**Description:**
NS records specify which DNS servers are authoritative for a domain.

**Use Case:**
They define which servers handle DNS queries for a domain.

**Example Command:**
dig google.com NS

**Example Output:**
google.com.   IN   NS   ns1.google.com.
google.com.   IN   NS   ns2.google.com.

---

## 7. SOA Record (Start of Authority)

**Description:**
The SOA record provides administrative information about a DNS zone, including the primary name server, administrator email, and zone serial number.

**Use Case:**
DNS servers use the SOA record to synchronize zone data and manage DNS updates.

**Example Command:**
dig google.com SOA

**Example Output:**
google.com.   IN   SOA   ns1.google.com. dns-admin.google.com. 123456789 900 900 1800 60

---

# Conclusion

DNS records play an essential role in internet infrastructure by translating domain names into IP addresses and providing important service information such as email routing and domain verification.

Each record type serves a specific purpose:
- A → maps domain to IPv4
- AAAA → maps domain to IPv6
- CNAME → alias for another domain
- MX → email routing
- TXT → verification and security policies
- NS → authoritative name servers
- SOA → administrative information about the DNS zone
