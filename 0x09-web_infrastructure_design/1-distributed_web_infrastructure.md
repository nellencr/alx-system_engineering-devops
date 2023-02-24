First, let's start with the basic requirements:

- 2 servers
- 1 web server (Nginx)
- 1 application server
- 1 load-balancer (HAproxy)
- 1 set of application files (your code base)
- 1 database (MySQL)
To satisfy these requirements, we will use the following setup:

**Server 1:**

- Web server (Nginx)
- Load balancer (HAproxy)
- Server 2:

**Application server**
- Database (MySQL)
We will have one set of application files (your code base) that will be deployed to the application server.

Now, let's discuss some specifics about this infrastructure:

Load Balancer: We are adding a load balancer to distribute the incoming requests across the two servers. The load balancer is configured with the Round Robin algorithm, which sends each new request to the next available server in a cyclic order. This ensures that the requests are distributed evenly across the servers.

Active-Passive Setup: The load balancer is enabling an Active-Passive setup. In this setup, one server is designated as the active server, and the other as the passive server. The active server receives all the incoming requests, while the passive server is idle, waiting for the active server to fail. In case of a failure, the passive server takes over as the active server, and the load balancer directs the requests to the new active server. The advantage of this setup is that it provides redundancy, ensuring high availability of the website.

Primary-Replica Cluster: The database is set up as a Primary-Replica (Master-Slave) cluster. In this setup, the primary node is the main database, which is responsible for handling all the write requests. The replica node is a copy of the primary node, which is used for read requests. Whenever a write request is made to the primary node, it is automatically replicated to the replica node, ensuring that the data is consistent across both nodes.

Primary and Replica Nodes: The primary node and the replica node have different roles in the infrastructure. The primary node is responsible for handling all the write requests, ensuring that the data is consistent and up-to-date. The replica node, on the other hand, is responsible for handling read requests, offloading the read workload from the primary node. The replica node also serves as a backup in case the primary node fails.

Now, let's discuss the issues with this infrastructure:

Single Points of Failure (SPOF): This infrastructure has a few single points of failure. The load balancer, the web server, the application server, and the database are all hosted on separate servers, but each server itself is a single point of failure. If any of these servers fail, the website will become unavailable until the issue is resolved.

Security Issues: This infrastructure has several security issues. There is no firewall protecting the servers, which means that they are vulnerable to attacks from the internet. Additionally, the website is not served over HTTPS, which means that the traffic between the server and the client is not encrypted, making it vulnerable to interception.

No Monitoring: There is no monitoring set up for this infrastructure, which means that we will not be able to detect issues or potential failures until they happen. Monitoring would allow us to proactively address any issues, ensuring that the website remains available and secure.
