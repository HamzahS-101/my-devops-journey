## EC2 Instance Creation and Security Group Configuration

### Setting up the Instances

I have set up three **t2.micro** instances on AWS, each running **Nginx**. These instances were configured using a **user-data** script that automates the installation and startup of Nginx upon instance launch. The script ensures that Nginx is installed, enabled, and running by executing the following commands:  

```bash
#!/bin/bash
sudo yum update -y
sudo sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

I renamed the instances based on their roles: **nginx-reverse-proxy** for handling incoming traffic and SSL termination, and **nginx** and **nginx-2** as backend servers to process application requests behind the proxy.

### Security Group Configuration

I adjusted the security groups for the instances to allow SSH (port 22) and HTTP (port 80) traffic.

### Customising Backend Server Layout (Optional)

As an optional setting, I modified the layout of each backend Nginx server by editing the `/usr/share/nginx/html/index.html` file. This change was made to visually differentiate the two servers (nginx and nginx-2) and confirm that the reverse proxy load balancer is correctly distributing traffic between them.

## Reverse Proxy Configuration  

### Setting Up the A-Record  
To begin, I configured an **A-Record** for the domain `app.hamzahsahal.com`, pointing it to the public IP of the **nginx-reverse-proxy** instance. This ensures that requests to `app.hamzahsahal.com` are directed to the reverse proxy server.  

### Editing the Nginx Configuration  
Next, I modified the **Nginx configuration file** located at `/etc/nginx/nginx.conf`.


The key changes included:  

- Defining an **upstream block** to list the backend servers (`nginx` and `nginx-2`).  
- Creating a **server block** to listen on port `80`, accepting HTTP requests for `app.hamzahsahal.com`.  
- Configuring a **proxy_pass directive** to forward requests to the backend servers.  

The updated configuration looked like this:  

```bash
http {
    upstream backend {
        server 172.31.25.240;
        server 172.31.25.193;
    }

    server {
        listen 80;
        server_name app.hamzahsahal.com;

        location / {
            proxy_pass http://backend;
        }
    }
}
```


### Testing HTTP Access

After saving the configuration, I restarted Nginx using:

```bash
sudo systemctl restart nginx
```

I then tested access to `app.hamzahsahal.com` over HTTP. By refreshing the page, I observed different layouts being served, confirming that the load balancing was working as expected and requests were being properly forwarded to the backend servers.

## SSL Configuration

### Installing Certbot  

To enable SSL on my reverse proxy, I first installed **Certbot** on the **nginx-reverse-proxy** instance. This was done using the following command:  

```bash
sudo yum install certbot python3-certbot-nginx
```

### Stopping Nginx Before SSL Configuration

Before generating the SSL certificate, it's important to stop Nginx as Certbot needs to use port 80 for the challenge. I stopped Nginx using:

```bash
sudo systemctl stop nginx
```

### Generating the SSL Certificate

I then generated the SSL certificate using Certbot with the following command:

```bash
sudo certbot certonly --standalone -d app.hamzahsahal.com
```
The certificate and key files were saved at the following locations:

- Certificate: `/etc/letsencrypt/live/app.hamzahsahal.com/fullchain.pem`
- Private Key: `/etc/letsencrypt/live/app.hamzahsahal.com/privkey.pem`

### Editing the Nginx Configuration

Once the SSL certificate was generated, I edited the Nginx configuration file `(/etc/nginx/nginx.conf)` to enable HTTPS and configure SSL.

The updated configuration included:

- A server block listening on port 443, with SSL enabled.
- Redirecting HTTP traffic (port 80) to HTTPS (port 443) using the `return 301 https://$host;` directive. This line issues a **permanent redirect** from HTTP to HTTPS, ensuring that all traffic is securely routed over SSL.
- Adding the paths to the certificate and key files for SSL encryption.

The final configuration looked like this:

```bash
http {
    upstream backend {
        server 172.31.25.240;
        server 172.31.25.193;
    }

    # HTTP server block to redirect traffic to HTTPS
    server {
        listen 80;
        server_name app.hamzahsahal.com;

        location / {
            return 301 https://$host;
        }
    }

    # HTTPS server block to handle secure traffic
    server {
        listen 443 ssl;
        server_name app.hamzahsahal.com;

        ssl_certificate /etc/letsencrypt/live/app.hamzahsahal.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/app.hamzahsahal.com/privkey.pem;

        location / {
            proxy_pass http://backend;
        }
    }
}
```

### Adjusting Security Groups for HTTPS

To allow HTTPS traffic, I updated the security group for the nginx-reverse-proxy instance. Specifically, I allowed inbound traffic on port 443 (HTTPS) to ensure that external requests could securely access the reverse proxy.

### Testing SSL Configuration

After updating the configuration, I restarted Nginx to apply the changes:

```bash
sudo systemctl restart nginx
```

I then tested the SSL configuration by accessing `https://app.hamzahsahal.com.` The connection was secure, and the traffic was correctly routed to the backend servers, confirming that the SSL setup was working as expected.

Additionally, I tested the HTTP configuration by accessing `http://app.hamzahsahal.com`, which correctly redirected to the HTTPS version `(https://app.hamzahsahal.com)`, verifying that the HTTP to HTTPS redirection was functioning properly.


