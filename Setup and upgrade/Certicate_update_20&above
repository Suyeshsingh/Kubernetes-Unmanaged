#!/bin/sh

echo "Strating certification renewal"

echo "Creating backup"

cd /etc/kubernetes/
mkdir /root/kube-backup
cp -p /etc/kubernetes/*.conf /root/kube-backup
cp -pr /etc/kubernetes/pki /root/kube-backup

echo "Backup complete"

cd /etc/kubernetes/manifests/

echo "Renewing certificates"

kubeadm certs renew all

echo "Renewing complete"

cd /etc/kubernetes/manifests/

echo "Restarting pods"

mv etcd.yaml /tmp/ 
mv kube-apiserver.yaml /tmp/
mv kube-controller-manager.yaml /tmp/ 
mv kube-scheduler.yaml /tmp/

echo "Wait for pods to be stopped"
echo "Service will be paused for 1 Minute to prune the unused pods"
sleep 1m #Wait for 1 min so that the unused pods can be pruned.
echo "Service Resumed"

mv /tmp/etcd.yaml .
mv /tmp/kube-apiserver.yaml .
mv /tmp/kube-controller-manager.yaml .
mv /tmp/kube-scheduler.yaml .

echo "Certificate renewal complete"

#This file was created by Suyesh Singh on Apr 7,2022.
