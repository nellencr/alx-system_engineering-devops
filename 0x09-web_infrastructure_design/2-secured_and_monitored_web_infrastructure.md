_First, let's start with the basic requirements:_

- 3 servers
- 1 load-balancer (HAproxy)
- 1 web server (Nginx)
- 1 application server
- 1 database (MySQL)
- 3 firewalls
- 1 SSL certificate to serve www.foobar.com over HTTPS
- 3 monitoring clients (data collector for Sumologic or other monitoring services)
_To satisfy these requirements, we will use the following setup:_

**Server 1:**

- Load balancer (HAproxy)
- Firewall
**Server 2:**

- Web server (Nginx)
- Firewall
- Server 3:

**Application server**
- Database (MySQL)
- Firewall
- We will install an SSL certificate on the load balancer to serve www.foobar.com over HTTPS. We will use Sumologic or another monitoring service to monitor the infrastructure. We will install monitoring clients on each of the three servers to collect data.

_Now, let's discuss some specifics about this infrastructure:_

Firewalls: We are adding firewalls to each of the servers to secure the infrastructure. Firewalls prevent unauthorized access to the servers, blocking traffic that does not meet certain criteria, such as source IP address or protocol.

HTTPS: We are serving the traffic over HTTPS to ensure that the communication between the server and the client is encrypted. This ensures that sensitive data, such as passwords or credit card information, is not intercepted by malicious actors.

Monitoring: We are using monitoring to ensure that the infrastructure is running smoothly and to detect issues before they become problems. Monitoring allows us to track metrics such as server uptime, resource usage, and traffic patterns.

Data Collection: The monitoring tool is collecting data by installing clients on each of the servers. These clients collect data from the servers and send it to the monitoring service, where it is analyzed and displayed in dashboards.

QPS Monitoring: If we want to monitor the web server QPS (queries per second), we can install an agent on the web server that collects this data and sends it to the monitoring service. We can then create a dashboard that displays this data in real-time, allowing us to identify spikes or drops in traffic.

Now, let's discuss the issues with this infrastructure:

Terminating SSL at the Load Balancer Level: Terminating SSL at the load balancer level is an issue because it means that the traffic is decrypted at the load balancer before it is forwarded to the web server. This means that if an attacker gains access to the load balancer, they can intercept and read the traffic.

Single MySQL Server Capable of Accepting Writes: Having only one MySQL server capable of accepting writes is an issue because it means that if that server fails, the website will become unavailable until the issue is resolved. To address this, we should set up a MySQL cluster with multiple servers that can handle writes.

Servers with All the Same Components: Having servers with all the same components, such as the database, web server, and application server, might be a problem because it means that if there is a vulnerability in one of these components, all the servers are affected. To address this, we can use different components on different servers, reducing the impact of any vulnerabilities.

Overall, this infrastructure addresses the requirements for hosting www.foobar.com, securing it, serving encrypted traffic, and monitoring it. However, there are some issues that need to be addressed to ensure that the infrastructure is highly available, secure, and resilient.
