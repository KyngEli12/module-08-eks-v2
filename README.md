# Module 08 — Containerization with EKS & GitOps

Hands-on lab deploying a production-grade Kubernetes cluster on Amazon EKS with a full GitOps pipeline using ArgoCD.

## What This Lab Covers

- **Amazon EKS**: Managed Kubernetes cluster with managed node groups
- **GitOps with ArgoCD**: Declarative continuous deployment from a Git repository
- **Helm**: Kubernetes package management for ArgoCD installation
- **Kubernetes**: Deployments, Services, Ingress, namespaces
- **AWS Load Balancer Controller**: ALB integration for Kubernetes Ingress
- **IAM Roles for Service Accounts (IRSA)**: Fine-grained pod-level AWS permissions
- **Infrastructure as Code**: EKS cluster and all AWS resources via Terraform

## Architecture

```
GitHub Repo (source of truth)
        │
        ▼
    ArgoCD (GitOps controller)
        │  watches & syncs
        ▼
Amazon EKS Cluster
├── Managed Node Group (t3.medium)
├── ArgoCD namespace
├── Application namespace
│   ├── Deployment (app pods)
│   └── Service → ALB Ingress
└── AWS Load Balancer Controller
        │
        ▼
Application Load Balancer (public)
```

## Key Concepts Demonstrated

| Concept | Implementation |
|---|---|
| GitOps | ArgoCD syncs cluster state from Git automatically |
| IRSA | Pod-level IAM roles without node-level credentials |
| Managed Nodes | EKS handles node provisioning and updates |
| ALB Integration | AWS Load Balancer Controller provisions ALBs from Ingress resources |

## Technologies Used

- Amazon EKS (Kubernetes 1.28)
- ArgoCD (GitOps continuous deployment)
- Helm (Kubernetes package manager)
- AWS Load Balancer Controller
- IAM Roles for Service Accounts (IRSA)
- Terraform (EKS cluster, VPC, IAM)
- kubectl

## Portfolio

Part of [Eli's AWS Cloud Architecture Portfolio](https://d2xgifno1trxs4.cloudfront.net) — a 9-module hands-on lab series covering core cloud architecture domains.
