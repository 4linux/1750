#!/bin/bash
export POD1=$(kubectl get po -o wide | grep nginx | grep worker01 | awk -F" " '{print $1}')
export POD2=$(kubectl get po -o wide | grep nginx | grep worker02 | awk -F" " '{print $1}')

echo 'NGINX NODE 1 - LOAD BALANCER' > /tmp/index.html
kubectl cp /tmp/index.html $POD1:/usr/share/nginx/html/

echo 'NGINX NODE 2 - LOAD BALANCER' > /tmp/index.html
kubectl cp /tmp/index.html $POD2:/usr/share/nginx/html/
