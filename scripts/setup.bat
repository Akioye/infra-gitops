@echo off
echo Creating EKS cluster... This will take 15-20 minutes.

eksctl create cluster --name gitops-cluster --region us-east-1 --nodegroup-name main --node-type t3.small --nodes 2 --nodes-min 1 --nodes-max 2 --managed

echo Installing ArgoCD...
kubectl create namespace argocd
kubectl create namespace staging
kubectl create namespace production
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo Waiting for ArgoCD to start...
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=300s

echo Applying ArgoCD applications...
kubectl apply -f "C:\Users\1040 G8\k8s-manifests\argocd\staging.yaml"
kubectl apply -f "C:\Users\1040 G8\k8s-manifests\argocd\production.yaml"

echo Done! Run this to get ArgoCD password:
echo kubectl -n argocd get secret argocd-initial-admin-secret -o go-template="{{.data.password | base64decode}}"
echo.
echo Port forward ArgoCD with:
echo kubectl port-forward svc/argocd-server -n argocd 8080:443