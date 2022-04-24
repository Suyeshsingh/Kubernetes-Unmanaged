#!/bin/sh

echo "Starting update for kubeadm"

#Ask for version number to upgrade to

echo "Please enter the version number to upgrade to: (eg 17,18,19 ...) "
echo "then press[ENTER]:" 
read version_number

echo "Upgrading to version 1.$version_number.00"
sleep 10s

apt-mark unhold kubeadm && \
apt-get update && apt-get install -y kubeadm=1.$version_number.0-00 && \
apt-mark hold kubeadm
apt-get update && \
apt-get install -y --allow-change-held-packages kubeadm=1.$version_number.0-00

echo "upgrading plan"

kubeadm upgrade apply v1.$version_number.0

kubeadm upgrade node

echo "Strating update for kubectl"

apt-mark unhold kubelet kubectl && \
apt-get update && apt-get install -y kubelet=1.$version_number.0-00 kubectl=1.$version_number.0-00 && \
apt-mark hold kubelet kubectl
apt-get update && \
apt-get install -y --allow-change-held-packages kubelet=1.$version_number.0-00 kubectl=1.$version_number.0-00

echo "Restart kubectl"

sudo systemctl daemon-reload
sudo systemctl restart kubelet

echo "update complete"

#This file was created by Suyesh Singh on Apr 7,2022.
