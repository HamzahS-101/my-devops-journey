# Networking Notes

### Computer Networks 

A group of devices connected to each other that allows them to communicate with each other and share resources.

- **Local Area Network (LAN)**: A network that connects devices within a limited area, such as a home, office, or school, enabling fast and secure communication.
- **Wide Area Network (WAN)**: Spans large geographical areas, connecting multiple LANs over long distances using public or private networks like the internet.


### Key Network Components

- **Switches**: It connects devices within the same network. It also manages data flow within a LAN.

- **Router**: Directs traffic between networks as well as connects different networks.

- **Firewalls**: Protects networks from unauthorised access by monitoring and controlling incoming and outgoing network traffic.

- **IP Address**: Unique identifier for devices on a network.
    - **IPv4**: 32-bit address. Format: Four decimal numbers separated by dots.
    - **IPv6**: 128-bit address. Format: Eight groups of four hexadecimal digits separated by colons.

- **MAC Address**: Unique identifier assigned to network interfaces. It operates at the data link layer and helps in directing data to the correct device within a network.

- **Port**: A numerical identifier used by a device to distinguish different types of network traffic, allowing multiple services to run on the same machine (e.g., port 80 for HTTP, port 22 for SSH).

- **Protocol**: A set of rules that define how data is transmitted and received over a network, ensuring proper communication between devices (e.g., TCP, UDP, HTTP, and FTP).
    - **TCP (Transmission Control Protocol)**: It ensures the data arrives in order, without errors, and requires confirmation before proceeding. It's used for things like web browsing (HTTP/HTTPS) and emails.
    - **UDP (User Datagram Protocol)**: It’s faster but doesn’t guarantee delivery or order. It’s used for live streaming, gaming, and other services where speed matters more than reliability.

### OSI Model   

A framework that standardises network communication into **7 layers**, each handling a specific role in data transmission.  

- **Physical Layer** – Transmits raw data as electrical signals, radio waves, or light (e.g., Ethernet cables, Wi-Fi).  
- **Data Link Layer** – Manages device-to-device communication. Ensures data is transferred correctly between network nodes. (e.g., switches, Ethernet).  
- **Network Layer** – Routes data across networks in an IP packet (e.g., routers, IP, ICMP).  
- **Transport Layer** – Ensures reliable or fast data transfer via TCP (reliable) or UDP (faster but less reliable).  
- **Session Layer** – Establishes, maintains, and closes communication sessions (e.g., authentication, API calls).  
- **Presentation Layer** – Formats, encrypts, or compresses data for proper interpretation (e.g., SSL/TLS, JPEG, MP4). Ultimately it converts the data into a usable format for Layer 7.
- **Application Layer** – Provides user-facing services like web browsing and email (e.g., HTTP, FTP, DNS).  


### TCP/IP Model   

A simplified **4-layer model** used for internet communications, mapping closely to real-world networking.  

- **Network Access Layer** – Handles physical transmission of data and MAC addressing (e.g., Ethernet, Wi-Fi).  
- **Internet Layer** – Routes data across networks using IP addresses (e.g., IP, ICMP, ARP).  
- **Transport Layer** – Ensures data delivery using TCP (reliable) or UDP (fast but less reliable).  
- **Application Layer** – Provides network services directly to users (e.g., HTTP, FTP, DNS, SMTP).  

### DNS (Domain Name System)

It translates domain names into IP addresses. It simplifies navigation on the internet and is essential for accessing websites and services.

- **Name Servers**: Servers that store DNS records and help resolve domain names to IP addresses, allowing users to access websites using human-readable names (e.g., `google.com`).

- **Zone Files**: Text files that store DNS records for a domain, including information like A records, MX records, and CNAME records. They are used to configure how a domain should be handled by DNS servers.

- **DNS Records**
  - **A Record**: The A record (Address record) maps a domain to an IPv4 address. It is one of the most common types of DNS records.
  - **AAAA Record**: The AAAA record maps a domain to an IPv6 address, similar to the A record but for the newer IPv6 protocol.
  - **CNAME Record**: The CNAME record (Canonical Name) maps an alias domain name to the canonical (true) domain name. For example, `www.example.com` might be a CNAME for `example.com`.
  - **MX Record**: The MX record (Mail Exchange) directs email to the mail server for the domain. It specifies which server handles email for the domain and the priority of the mail servers.
  - **TXT Record**: The TXT record allows administrators to add arbitrary text to a domain's DNS. It is often used for verification purposes or to store security-related information like SPF (Sender Policy Framework) records.
