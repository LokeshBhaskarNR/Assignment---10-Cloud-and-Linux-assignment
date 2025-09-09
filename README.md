# Assignment---10-Cloud-and-Linux-assignment

## 1. Common Cloud Services
Some common services available in the cloud are:

- Compute (VMs, autoscaling, HPC)
- Storage (block, object, file storage, backups)
- Databases (SQL, NoSQL, managed databases)
- Networking (VPC, load balancers, VPN, firewalls)
- Monitoring and Logging (metrics, alerts, observability)
- Containers (Kubernetes, container registry, orchestration)
- Serverless (functions, event-driven services)
- AI/ML (model training, inference, analytics)
- Security (IAM, encryption, compliance tools)
- DevOps and CI/CD (pipelines, automation tools)
- Analytics and Big Data (data lakes, streaming, warehouses)
- Messaging and Integration (queues, pub/sub, APIs)

---

## 2. Shell Script for System Logs
This script prints CPU, memory, disk usage, and uptime details every 2 minutes into a log file.

**system_report.sh**
```
#!/bin/bash

while true
do
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    LOG_FILE="system_logs_${TIMESTAMP}.txt"

    {
        echo "========== System Report =========="
        echo "Date: $(date)"
        echo "Uptime: $(uptime -p)"
        echo "CPU Info:"
        lscpu | grep 'Model name\|CPU(s)'
        echo "Memory Usage:"
        free -h
        echo "Disk Usage:"
        df -h /
        echo "==================================="
        echo ""
    } > "$LOG_FILE"

    echo "Saved log: $LOG_FILE"
    sleep 120
done
````

Executing the script :

```bash
chmod +x system_report.sh
```

Run in background:

```bash
nohup ./system_report.sh &
```

---

I have attached the script and output log files in the repo...

## 3. User, Group, and Shared Folder

Create a new group:

```bash
sudo groupadd devops_group
```

Create a new user and add it to the group:

```bash
sudo useradd -m -g devops_group devops_user
sudo passwd devops_user
```

Create a shared folder:

```bash
sudo mkdir /shared_folder
```

Assign group ownership and permissions:

```bash
sudo chown :devops_group /shared_folder
sudo chmod 770 /shared_folder
```

