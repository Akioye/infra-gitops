# 🚀 GitOps Infrastructure — Zero Touch Deployment

> A production-grade GitOps pipeline on AWS EKS that 
> automatically deploys, monitors, and rolls back 
> applications when you push code — no manual steps required.

## 🎬 Demo
[▶️ Watch 3-minute demo on Loom](your-loom-link)

## 🏗️ Architecture
## Architecture Diagram
<p align="center">
    <img src="self-healing-project-architecture.png" width="700" alt="self-healing-project-architecture.png"/>
  </a>
</p>


![Architecture Diagram](architecture/diagram.png)

## 🔧 Tech Stack
- **AWS EKS** — Kubernetes cluster
- **AWS ECR** — Docker image registry
- **Terraform** — Infrastructure as code
- **ArgoCD** — GitOps continuous delivery
- **GitHub Actions** — CI/CD automation
- **Sealed Secrets** — Encrypted secrets in git
- **Docker** — Containerization
- **Slack** — Deployment notifications

## 💡 The Problem It Solves
Most teams deploy manually — someone runs kubectl apply 
or terraform apply by hand. This creates human error, 
no audit trail, and slow recovery when things break.

This pipeline makes git the single source of truth. 
Push code and everything else happens automatically — 
build, test, deploy, notify. Break something? 
One git revert fixes it in under 2 minutes.

## 🚀 How to Run It

**Prerequisites:**
- AWS account with CLI configured
- GitHub account
- Docker Desktop installed
- eksctl, kubectl, terraform installed

**Step 1: Clone both repos**
```bash
git clone https://github.com/Akioye/infra-gitops.git
git clone https://github.com/Akioye/k8s-manifests.git
```

**Step 2: Configure GitHub Secrets**

Add these secrets to `infra-gitops` repo:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
MANIFESTS_TOKEN
SLACK_WEBHOOK_URL

**Step 3: Create S3 bucket for Terraform state**
```bash
aws s3 mb s3://gitops-terraform-state-akioye --region us-east-1
```

**Step 4: Spin up infrastructure**
```bash
./scripts/setup.bat
```
This creates EKS cluster, installs ArgoCD, 
and connects everything automatically.

**Step 5: Push a code change**
```bash
# Edit app/index.js
git add .
git commit -m "your change"
git push
```
Watch GitHub Actions → ArgoCD → Slack do the rest.

**Step 6: Destroy when done**
```bash
./scripts/destroy.bat
```

## 📊 Results
- Deployment time: under 3 minutes from push to live ✅
- Rollback time: under 2 minutes with git revert ✅
- Zero downtime deployments ✅
- Full audit trail of every change in git ✅
- Staging environment catches bugs before production ✅
- Secrets encrypted — safe to store in git ✅

## 📸 Screenshots

**ArgoCD Dashboard — Staging and Production Synced**
![ArgoCD](screenshots/argocd-dashboard.png)

**GitHub Actions — Full Pipeline**
![GitHub Actions](screenshots/github-actions.png)

**Slack Notifications**
![Slack](screenshots/slack-notifications.png)

**App Live on AWS**
![App](screenshots/app-live.png)

## 💰 AWS Cost Estimate
Running this project costs approximately **$5/day** on AWS.

| Resource | Cost |
|---|---|
| EKS control plane | ~$2.40/day |
| 2x t3.small nodes | ~$1.10/day |
| NAT Gateway | ~$1.10/day |
| ECR storage | ~$0.01/day |

Always destroy infrastructure after each session:
```bash
./scripts/destroy.bat
```

## 🧠 What I Learned
- How GitOps works in practice — git as the source of truth 
  for both application and infrastructure
- How ArgoCD self-healing works — any manual change to the 
  cluster gets automatically reverted to match the repo
- How to structure a two-repo GitOps pattern — separating 
  app code from Kubernetes manifests
- How Sealed Secrets encrypts sensitive data so it's safe 
  to commit to a public repo
- How to debug real AWS errors — CloudFormation stack 
  conflicts, VPC subnet dependencies, KMS key issues
- How staging and production environments protect users 
  from broken deployments

## 🔗 Related
- [k8s-manifests repo](https://github.com/Akioye/k8s-manifests) 
  — Kubernetes manifests watched by ArgoCD
