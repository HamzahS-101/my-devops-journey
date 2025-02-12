# Networking Notes

- **Computer Networks**: A group of devices connected to each other that allows them to communicate with each other and share resources.
    - **Local Area Network (LAN)**: A network that connects devices within a limited area, such as a home, office, or school, enabling fast and secure communication.
    - **Wide Area Network (WAN)**: Spans large geographical areas, connecting multiple LANs over long distances using public or private networks like the internet.

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

- **OSI Model** – A framework that standardises network communication into **7 layers**, each handling a specific role in data transmission.  

  - **Physical Layer** – Transmits raw data as electrical signals, radio waves, or light (e.g., Ethernet cables, Wi-Fi).  
  - **Data Link Layer** – Manages device-to-device communication. Ensures data is transferred correctly between network nodes. (e.g., switches, Ethernet).  
  - **Network Layer** – Routes data across networks using IP addresses (e.g., routers, IP, ICMP).  
  - **Transport Layer** – Ensures reliable or fast data transfer via TCP (reliable) or UDP (faster but less reliable).  
  - **Session Layer** – Establishes, maintains, and closes communication sessions (e.g., authentication, API calls).  
  - **Presentation Layer** – Formats, encrypts, or compresses data for proper interpretation (e.g., SSL/TLS, JPEG, MP4). Ultimately it converts the data into a usable format for Layer 7.
  - **Application Layer** – Provides user-facing services like web browsing and email (e.g., HTTP, FTP, DNS).  


