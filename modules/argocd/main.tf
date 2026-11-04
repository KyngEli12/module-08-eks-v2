# ============================================================
# ARGOCD MODULE — GitOps controller installed via Helm
#
# ArgoCD watches a Git repo and auto-syncs Kubernetes manifests.
# This is the GitOps pattern: Git is the source of truth.
# ============================================================

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

# ArgoCD namespace
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# Install ArgoCD via Helm
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.6"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  # Disable TLS on the server for lab simplicity (HTTP only)
  set {
    name  = "configs.params.server\\.insecure"
    value = "true"
  }

  timeout    = 600
  depends_on = [kubernetes_namespace.argocd]
}

# NOTE: The ArgoCD Application CRD (guestbook demo app) is applied
# via kubectl after Terraform completes — see runbook.sh Step 3b.
# kubernetes_manifest requires a live cluster at plan time, so we
# use kubectl apply instead to avoid the provider init race condition.
