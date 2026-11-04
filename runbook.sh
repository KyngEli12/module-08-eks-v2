#!/usr/bin/env bash
# ============================================================
# Module 08 — EKS + ArgoCD GitOps Lab Runbook
# Run each step manually, one at a time.
# ============================================================

# --- STEP 1: Init and apply (~15 min for EKS cluster) ---
# terraform init
# terraform apply
# (type yes to confirm)

# --- STEP 2: Configure kubectl ---
# aws eks update-kubeconfig --region us-east-1 --name eli-eks-lab

# --- STEP 3: Verify cluster ---
# kubectl get nodes
# kubectl get pods -n argocd

# --- STEP 4: Get ArgoCD admin password ---
# kubectl -n argocd get secret argocd-initial-admin-secret \
#   -o jsonpath='{.data.password}' | base64 -d && echo

# --- STEP 5: Get ArgoCD URL ---
# kubectl -n argocd get svc argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

# --- STEP 6: Open ArgoCD in browser ---
# Navigate to the URL from step 5
# Login: admin / (password from step 4)
# Screenshot the ArgoCD dashboard showing the guestbook app synced

# --- STEP 7: Verify app deployed ---
# kubectl get pods -n demo-app
# kubectl get svc -n demo-app

# --- STEP 8: DESTROY (do this as soon as screenshots are taken) ---
# terraform destroy
# (type yes to confirm)

echo "Read the comments above — run each kubectl/terraform command manually."
