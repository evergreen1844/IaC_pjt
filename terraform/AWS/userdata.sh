#!/bin/bash

sudo -i

#kubeadm join 10.9.1.207:6443 --token f1ksvk.8878dtnlgva9ly66 \
#        --discovery-token-ca-cert-hash sha256:fa9f24a215ce480824865e1c8dc77eedd2fd5114ed64caa9fb28740e60b8c5e5

kubeadm join 10.9.1.51:6443 --token tsjirq.nruaa0dcbq1whc6u \
        --discovery-token-ca-cert-hash sha256:5b37aac33089df644f7e4104a44d2c4466a033a350a675626c09903e1c961949 
        