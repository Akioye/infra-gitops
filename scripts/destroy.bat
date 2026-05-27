@echo off
echo Deleting EKS cluster... This will take 10-15 minutes.

eksctl delete cluster --name gitops-cluster --region us-east-1

echo Cluster deleted. No more AWS charges.
echo Run setup.bat to recreate it next time.