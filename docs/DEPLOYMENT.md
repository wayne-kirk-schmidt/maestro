Deployment Guide
================

## Overview
Below we are providing step by step instructions for deploying the infrastructure. 
This will be a mixture of terraform, docker, and ansible commands.　

Prerequisites
=============

Before deploying, please mak sure you have at least the following installed:

- **Terraform** (`>= 1.0.0`)
- **Docker & Docker Compose**
- **Ansible** (`>= 2.10`)
- **AWS Credentials** (if deploying to AWS)
- **SSH Key Pair** for secure access

Directory Structure
===================

And here is the directory structure we will be using/working with.

```plaintext
repo-root/
├── terraform/               # Infrastructure as Code (Terraform)
├── docker/                  # Docker configurations
├── ansible/                 # Ansible playbooks
├── scripts/                 # Utility scripts
├── docs/                    # Documentation
```

## Step 1: Infrastructure Provisioning (Terraform)
1. **Initialize Terraform:**
   ```sh
   cd terraform
   terraform init
   ```
2. **Plan deployment:**
   ```sh
   terraform plan
   ```
3. **Apply Terraform configuration:**
   ```sh
   terraform apply -auto-approve
   ```
4. **Retrieve deployed resources:**
   ```sh
   terraform output
   ```

## Step 2: Build & Start Services (Docker)
1. **Ensure Docker is running**
2. **Build the containers:**
   ```sh
   cd ../docker
   docker-compose build
   ```
3. **Start the services:**
   ```sh
   docker-compose up -d
   ```
4. **Verify running containers:**
   ```sh
   docker ps
   ```

## Step 3: Configuration & Hardening (Ansible)
1. **Run Ansible playbooks to configure services:**
   ```sh
   cd ../ansible
   ansible-playbook -i inventory playbooks/setup.yml
   ```
2. **Verify configuration changes:**
   ```sh
   ansible -m ping all -i inventory
   ```

## Step 4: Accessing Services
| Service       | URL / Command |
|--------------|--------------|
| Kafka        | `localhost:9092` |
| Elasticsearch | `localhost:9200` |
| Kibana       | `localhost:5601` |
| Zammad       | `localhost:3000` |
| i-doit CMDB  | `localhost:4000` |
| Robot Framework | `localhost:5000` |

## Step 5: Monitoring & Logs
- View container logs:
  ```sh
  docker logs <container_name>
  ```
- Monitor system logs:
  ```sh
  tail -f /var/log/syslog
  ```
- Elasticsearch logs:
  ```sh
  docker logs elasticsearch
  ```

## Step 6: Troubleshooting
- If Terraform fails, check state files:
  ```sh
  terraform state list
  ```
- If a Docker container fails to start:
  ```sh
  docker logs <container_name>
  ```
- If Ansible playbooks fail:
  ```sh
  ansible-playbook -i inventory playbooks/setup.yml --verbose
  ```

Next Steps
==========
- Implement **CI/CD pipelines** for automated deployment
- Improve **security policies** for enhanced protection
- Set up **monitoring dashboards** (e.g., Prometheus & Grafana)
