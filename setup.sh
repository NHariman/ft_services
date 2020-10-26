# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml - set up kubernetes dashboard UI
# kubectl proxy //access dashboard using the kubectl command-line tool

#!/bin/bash
echo installing kubectl
#
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl" && \
chmod +x ./kubectl && \
mv ./kubectl usr/local/bin/kubectl
#
echo deploy kubernetes web UI dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
#
echo build images
docker build srcs/nginx my_nginx
docker build srcs/phpmyadmin my_pma
docker build srcs/wordpress my_wp
docker build srcs/ftps my_ftps
docker build srcs/grafana my_grafana
#
echo install metallb
kubectl edit configmap -n kube-system kube-proxy
