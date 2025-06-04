# yii2-app-deployment

**🌐 Access Application
Your Yii2 app is live at:
👉 http://52.66.132.71:8080/**

**Project Structure:**

├── .github/workflows/
│   └── cicd.yml           # GitHub Actions workflow
├── ansible/
│   ├── inventory.ini        # Ansible inventory with EC2 host
│   └── playbook.yaml        # Ansible playbook for EC2 setup
├── Dockerfile               # Dockerfile for Yii2 app
├── docker-compose.yaml      # Docker Compose config
├── README.md                # This file
└── ...

**Prerequisites:**

An AWS EC2 instance (Ubuntu)
Docker & Docker Compose installed
A GitHub repository

**GitHub Secrets configured:**
EC2_HOST: Public IP or DNS of EC2 instance
EC2_SSH_KEY: Your EC2 PEM key content
DOCKER_USERNAME: Your Docker Hub username
DOCKER_PASSWORD: Your Docker Hub password

**GitHub Actions Workflow (.github/workflows/deploy.yml)**

Provision EC2 with Ansible
Installs Docker, Nginx, PHP, etc.

Build & Push Docker Image
Pushes the Yii2 image to Docker Hub

Deploy via SSH
Pulls the latest Docker image and deploys it using Docker Stack.

Configures Nginx
Nginx config to reverse proxy http://52.66.132.71:8080/


**Deployment Steps (Auto):**

Push code to the main branch
GitHub Actions will:
Build & push Docker image
SSH into EC2
Deploy using docker stack
Configure and reload Nginx






