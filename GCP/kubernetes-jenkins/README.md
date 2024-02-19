# Jenkins
Setup Jenkins on GKE using PVC

**Jenkins:** Jenkins is an open source devops tool for CICD.

**Prerequesites** we need to have all the following configuration tool installed.
- gcloud SDK
- GKE cluster
- Kubectl

**Clone Git repo:** clone git repo to your system.
```
git clone -b dev git@github.com:amarsingh3d/kubernetes.git
```

- Change directory
```
cd kubernetes/GCP/kubernetes-jenkins
```

- Create PVC 
```
kubectl apply -f pvc.yml
```

- Create deployment
```
kubectl apply -f deployment.yml
```

- Create service as LoadBalancer
```
kubeget apply -f service.yml
```

- Get service and public endpoint to access Jenkins.
```
kubectl get svc
NAME             TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)        AGE
jenkins          LoadBalancer   10.71.246.74   34.42.72.130   80:30499/TCP   9h
```
- copy and hit IP in the browser.
http:// 34.42.72.130

- Get the inital login password - you password is last line.
```
kubectl logs pod/jenkins-8f7df6955-lk4qk | grep password -3
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

492ffe51496a4ee0a5ed2e34a0ec062b

````
