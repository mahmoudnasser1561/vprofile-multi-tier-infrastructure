# vprofile-multi-tier-infrastructure
automated multi-tier infrastructure provisioning using vagrant

This project automates the provisioning of a **multi-tier web application** using **Vagrant** and shell provisioning scripts.  
It simulates a real-world enterprise application stack with **load balancing, caching, messaging, and database layers**.

---

<img width="1202" height="748" alt="p01 drawio" src="https://github.com/user-attachments/assets/13b8d3f4-19a1-4082-9e6f-4dbc76cc7931" />

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

##  Virtual Machines (via Vagrant)

| VM Name  | Role            | OS                    | IP Address    | Memory |
|----------|-----------------|-----------------------|---------------|--------|
| **web01** | Nginx LB        | Ubuntu 22.04 (Jammy) | 192.168.56.11 | 800 MB |
| **app01** | Tomcat App      | CentOS Stream 9       | 192.168.56.12 | 800 MB |
| **app02** | Tomcat App      | CentOS Stream 9       | 192.168.56.13 | 800 MB |
| **mc01**  | Memcached       | CentOS Stream 9       | 192.168.56.14 | 600 MB |
| **db01**  | MySQL DB        | CentOS Stream 9       | 192.168.56.15 | 600 MB |
| **rmq01** | RabbitMQ Broker | CentOS Stream 9       | 192.168.56.16 | 600 MB |

---

## Setup & Usage

### 1. Clone the repository
```bash
git clone https://github.com/mahmoudnasser1561/vprofile-multi-tier-infrastructure
cd vprofile-multi-tier-infrastructure
```
### 2. Bring up the environment
```bash
vagrant up
```
<img width="657" height="243" alt="Screenshot from 2025-10-06 11-30-08" src="https://github.com/user-attachments/assets/c3d54ba0-97e7-4ba0-840c-3e9183c372dd" />

## Checking Nginx Load Balancing
run the file check_lb.sh
```bash
./check_lb
```
<img width="582" height="583" alt="image" src="https://github.com/user-attachments/assets/2ede63b5-3eac-455e-af71-6c1df69e075f" />

---

## Result
### View in Browser
<img width="1289" height="677" alt="Screenshot from 2025-10-30 23-49-50" src="https://github.com/user-attachments/assets/fc57bc52-4cd8-4e01-94f8-7c613f7abf3a" />
<img width="1289" height="560" alt="Screenshot from 2025-10-30 23-50-12" src="https://github.com/user-attachments/assets/df354ee8-8c5a-4c89-85b0-abb639a7e454" />

#### RabbitMQ is working

<img width="1289" height="455" alt="Screenshot from 2025-10-30 23-50-23" src="https://github.com/user-attachments/assets/30164457-7e6b-4917-aaa6-7ea9f118f182" />


##### Time consumed
the whole infra got automatically provisioned in 82 minutes
### AWS IaaS Arch Diagram
<img width="1304" height="1205" alt="vprofile_AWS-Page-2 drawio" src="https://github.com/user-attachments/assets/922a1bcf-cf02-4ab5-970f-f8e071ba7cff" />

<br>
<img width="1289" height="491" alt="Screenshot from 2025-10-30 23-02-16" src="https://github.com/user-attachments/assets/0f966cdc-101f-4a87-88d3-1f1bb2978d43" />
<br>
