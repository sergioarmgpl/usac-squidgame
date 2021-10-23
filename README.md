# USAC SQUID GAME

## Installing gcloud command
```
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init
```  

## Installing helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## Install kubeclt stable version
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```

## Configure kubectl to connect to your cluster
```
gcloud container clusters get-credentials k8s-demo --zone us-central1-c --project sopes1-323620
kubectl get nodes
```

## Installing NGINX ingress controller
```
kubectl create ns nginx-ingress
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx 
helm repo update 
helm install nginx-ingress ingress-nginx/ingress-nginx -n nginx-ingress
kubectl get services -n nginx-ingress
```

## Installing Docker
```
sudo apt-get install docker.io
sudo usermod -aG docker developer
```

## Building myapp image
```
/bin/bash build.sh 
```

## Install Linkerd
```
curl -fsL https://run.linkerd.io/install | sh
linkerd install | kubectl apply -f -
nano ~/.bashrc <- export PATH=$PATH:/home/YOUR_USER/.linkerd2/bin

linkerd install | kubectl apply -f -
linkerd viz install | kubectl apply -f -
linkerd check
linkerd viz install | kubectl apply -f -
linkerd check
```

## Open Linkerd dashboard
```
linkerd viz dashboard
```

## Install a kubectl specific version
```
curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

## Inject NGINX ingress-controller
```
kubectl get deployment nginx-ingress-ingress-nginx-controller -n nginx-ingress  -o yaml | linkerd inject - | kubectl apply -f -
```

## Create the project
```
kubectl  apply -f squidgame.yaml 
kubectl delete -f squidgame.yaml 
```

## Test traffic split
```
export LOADBALANCER_IP=X.X.X.X
for i in {0..100000}; do  curl http://${LOADBALANCER_IP}.nip.io/myapp; done
```
