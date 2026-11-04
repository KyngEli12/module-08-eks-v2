output "argocd_url" {
  value       = "http://<run: kubectl -n argocd get svc argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'>"
  description = "ArgoCD UI URL — run the kubectl command above to get the actual hostname after apply"
}
