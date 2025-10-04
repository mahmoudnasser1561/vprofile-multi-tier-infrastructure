# vprofile-multi-tier-infrastructure
automated multi-tier infrastructur provisioning using vagrant

This project automates the provisioning of a **multi-tier web application** using **Vagrant** and shell provisioning scripts.  
It simulates a real-world enterprise application stack with **load balancing, caching, messaging, and database layers**.

---

<img width="4729" height="2587" alt="Untitled Diagram drawio(6)" src="https://github.com/user-attachments/assets/5c92d963-8d46-4f78-9924-198636cc7ade" />

## Architecture Overview
**Components:**
- **Nginx** – Acts as a load balancer, distributing traffic between multiple Tomcat application servers.
- **Tomcat (App Servers)** – Runs the Java web application.
- **RabbitMQ** – Message broker for asynchronous communication.
- **Memcached** – Caching layer for performance optimization.
- **MySQL** – Relational database backend.

---

## Tech Stack

- **Vagrant** – Infrastructure as Code (IaC) for VM provisioning.
- **VirtualBox** – Provider for VMs.
- **Shell Scripts** – Automated installation/configuration of services.
- **Linux (CentOS Stream 9 & Ubuntu Jammy)** – Guest operating systems.

---

## Project Structure
```
└── vagrant
    ├── application.properties
    ├── backend.sh
    ├── memcache.sh
    ├── mysql.sh
    ├── nginx.sh
    ├── rabbitmq.sh
    ├── tomcat.sh
    ├── tomcat_ubuntu.sh
    └── Vagrantfile
```
