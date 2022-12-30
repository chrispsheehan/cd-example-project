# cd-example-project

- [jsonnet usage](https://argo-cd.readthedocs.io/en/stable/user-guide/jsonnet/)

## Pre-reqs

```sh
brew install --cask docker
brew install kubectl
brew install kubecfg
brew install minikube
brew install argocd
```

## [Install locally](https://argo-cd.readthedocs.io/en/stable/getting_started/)

- Start docker desktop
- `minikube start`
- Run below setup script

```sh
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

## Setup ArgoCD

- Open port-forward tunnel
  - `kubectl port-forward svc/argocd-server -n argocd 8080:443`
- (wait for pods) Obtain default password
  - `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`

## (Optional) Change ArgoCD password

- Login with admin user
  - `argocd login localhost:8080`
- Update password
  - `argocd account update-password`
- Check new password
  - `argocd login localhost:8080`
- Delete initial password secret
  - `kubectl delete secret -n argocd argocd-initial-admin-secret`

## UI

- Access UI via `https://localhost:8080/login?`

## Github required secrets

```sh
DOCKERHUB_TOKEN
DOCKERHUB_USERNAME
GIT_TOKEN // https://github.com/settings/tokens
```

## Deploy app (connect to git)

- *IMPORTANT*: Change `[YOU]` to match your github url in `argocd-app.yaml`

- Connect to Git via `https://localhost:8080/settings/repos?addRepo=true`
  - Make your life easy by marking as public (for testing)

- Create app `kubectl apply -f infra/minikube-app.yaml -n argocd`

- App can be seen at `https://localhost:8080/applications?`

## NOTES

- Argocd will update from the repo every 3 minutes (be patient!)
