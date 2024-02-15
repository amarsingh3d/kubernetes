# kubernetes
Build Single Node kubernetes Cluster using Terraform in Google Cloud.

# Prerequisites
You need these details before we start building GKE cluster on GCP.
- Google Account
- Local Linux box or WSL installed on Windows.
- Terraform
- Gcloud SDK

# After Installing all required tool, you need to initialize  your Gcloud SDK.
- To initilize gcloud use following command.
```
gcloud init
```
- Authenicate your glcoud skd 
```
  gcloud auth login
```
- Setup your default project
```
 gcloud config set project <Project_Id_here>
```
- Example:
```
 gcloud config set project exemplary-point-412614
```
- Enable application authentication
```
gcloud auth application-default login
```


**Terraform** Terraform is open IAC (source Infrastructure) as code tool

# Once GCP authentication completed, clone following git repository.
- git clone
```
git clone git@github.com:amarsingh3d/kubernetes.git
```
-  Change directory to GCP/gke_terraform
```
cd GCP/gke_terraform
```
# Since we are going to setup Dev and Prod environment with seperate tfstate file we need to create and manage two different workspace.
- Create dev work space
```
terraform workspace new dev
```
- Create Prod workspace
```
terraform workspace new prod
```
# To Create Dev infra run following command.
- Switch to dev workspae
```
terraform workspace select dev
```
- Run terraform init if not done already
```
terraform init
```
- Run terraform plan with dev.tfvars file
```
terrafrom plan -var-file=dev.tfvars
```
# To Create Prod infra run following command.
- Switch to dev workspae
```
terraform workspace select prod
```
- Run terraform init if not done already
```
terraform init
```
- Run terraform plan with prod.tfvars file
```
terrafrom plan -var-file=prod.tfvars
```



**Kubernetes:** Kubernetes is an open source system for automatic deployment, scaling, and management of containerized applications.



**MiniKube:** MiniKube is a tool that makes it easy to run a single node kubernetes cluster locally. MiniKube runs a single-node Kubernetes cluster on a Virtual machine inside of your laptop. 

![image](https://1.bp.blogspot.com/-CXWywEZuyFo/XBixFEQSeKI/AAAAAAAAE80/mV8oIHCQrQwtu9fijU374IFJ_VYdGkEKwCLcBGAs/s1600/kubernetes.jpg)

**Kubernetes Features in MiniKube:** 

 -DNS
 -Node Port

 -Dashboard

 -Enable CNI (container Network Interface)

 -ConfigMap and Secrets

 -Ingress**

 -Container Runtime: Docker, rkt, CRI-O and container**

**Prerequisites:**
-A Windows Machine with admin access

-Installed Virtual box in Windows machine

-Installed Powershell 

-VT-x or AMD-v Virtualization enabled

**Installation:** 
Follow the steps below for the installation steps:

**Step 1- Install a Hypervisor:**
In my this blog I'm using Windows machine to install MiniKube, So I'll use VirtualBox as a hypervisor. Download and install the latest version of VirtualBox from its official site.

**Step 2-  Install Chocolatey package manager:**
Chocolatey also know as choco, it's a windows package manager. Using choco you can install a package like we do in Linux system. Let's install choco package manager in your windows machine followed by this command.
Open Powershell Run as administrator:
```
PS C:\> Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
Command output should be like this, there are some warnings, you can ignore them.

![image](https://4.bp.blogspot.com/-S4CmYNfZMjo/XBOa12vUoHI/AAAAAAAAE6U/9j3v-A7tsAUiSjPR18Oji9Nkl46sDtJawCLcBGAs/s1600/choco.jpg)

Verify choco installation and check the version
````
PS C:\> choco version
````
![image](https://1.bp.blogspot.com/-8COqrbw_Fpc/XBObXNHzGbI/AAAAAAAAE6c/spvcp5I0fLUTODoH2DIrdjyGZUvm4VmIwCLcBGAs/s1600/choco1.jpg)

**Step 3-  Install Kubernetes-cli:**
Kubernetes-cli knows as kubectl, It is command line utility to create and manage Kubernetes cluster resource.
Run the following command to install kubectl.
```
PS C:\> choco install kubernetes-cli
```
Installation output would be like this
![image](https://4.bp.blogspot.com/-t0VJiL3mRiY/XBOdz8b-pnI/AAAAAAAAE6s/CXkPND0gB5cfJwOQIj02LnbuWsXNEysngCLcBGAs/s1600/choco2.jpg)
Kubernetes-cli installation completed.

**Step 4-  Download and set MiniKube environment path:**
Download and Install Minikube Windows installer from its official repository.
Once download finish keeps it somewhere in a directory and renames it to minikube. and set an environment variable.
-Go to System properties advanced tab
-Environment variable
-Select path under system variable
-click on Edit
-Click on New 
-Paste path where Minikube available and click on Ok.
 in my case, I have it in my download folder. Please follow steps as in the image below.
 ![image](https://4.bp.blogspot.com/-f5Ky4b0n-Rs/XBOhlUyLYbI/AAAAAAAAE68/lVwj6D58Ncox95l269YQLi-h84vMmvBDACLcBGAs/s1600/choco3.jpg)
 Once Minikube Environment path set. We are ready to start Minikube.
 
 **Step 5- Start Minikube**
After successful installation of dependencies and Minikube, it's time to start minikube. run the following command at Powershell to start minikube.
```
PS C:\> minikube start
```
The above command will start kubernetes cluster, download minikube ISO, and create a VM like in below image.
![image](https://4.bp.blogspot.com/-RvZaPraz-Sw/XBOmlhE3_FI/AAAAAAAAE7I/Cz7rPYfeGXQAc0dBqk0RnmFBXzAUhRZXwCLcBGAs/s1600/choco4.jpg)

TO get node details run command kubectl get node:
```
PS C:\> kubectl get node

NAME           STATUS       ROLES      AGE      VERSION
minikube       Ready         master     13d       v1.10.0
```
Your Single node Kubernetes cluster is ready.

**Step 6-  Create your first deployment:**
In order to run your container, we need to create deployment first. let's run the following command to create the deployment. We can use .yml or .json file to create deployment but in this blog, we are using a single command to create deployment and service in step 7. 
```
PS C:\> kubectl run web --image=httpd:2.4 --port=80
```
**Where:**
```
  Kubectl  run              -            command to create a deployment
  web                       -            Deployment name
--image=httpd2.4            -            To define docker image path
--port=80                   -            Define port on which your app running.
```

Verify created Deployment:
```
PS C:\> kubectl get deployment

NAME   DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
web    1         1         1            1           44s
```
Check created pods:
```
PS C:\> kubectl get pods

NAME                 READY     STATUS       RESTARTS       AGE
web-c86cff74-r9rpb   1/1       Running       0             45s
 ```
 our deployment created successfully and the pod is available and running.
**Step 7- Create Service to expose deployment using type NodePort:**
Once deployment created successfully, let's create service to access container application from outside. Kubernetes support multiple methods to expose our deployment i.e. NodePort and LoadBalancer. let's follow the below command to expose our deployment.
```
PS C:\> kubectl expose deployment web --type=NodePort --name=webservice
```
Let's verify exposed service.
```
PS C:\> kubectl get service 


NAME               TYPE           CLUSTER-IP      EXTERNAL-IP       PORT(S)              AGE
kubernetes       ClusterIP      10.96.0.1          <none>           443/TCP              16d
webservice       NodePort       10.101.114.59       <none>          80:31178/TCP         9s
```
Deployment exposed successfully for external access. 

**Step 8- Verify exposed deployment's external access:**
To verify external access of deployment. first, check minikube IP address. Run the following command.
```
PS C:\> minikube ip 

192.168.99.100
```
My Minikube IP address is 192.168.99.100. Now, let's check our exposed service port.
```
PS C:\> kubectl get service 

NAME           TYPE           CLUSTER-IP         EXTERNAL-IP      PORT(S)         AGE
webservice   NodePort         10.101.114.59       <none>          80:31178/TCP    6m
```
So, our exposed deployment running with port 31178. Now Open browser and hit minikube IP and Port 31178 to check external access. 
![image](https://2.bp.blogspot.com/-HSGj6D9gXNE/XBijNin-iHI/AAAAAAAAE8Q/xmA-e3MYjo0orVYfCi-bVKo-JxJTACcyACLcBGAs/s640/m.jpg)
Running Pod is accessible from the outside of my Network using the minikube IP address.

**Step 9- Expose deployment using service Type LoadBalancer:**
In step 7 we exposed our deployment using NodeType service. Now let's use service type Loadbalancer.
```
PS C:\> kubectl expose deployment web --type=LoadBalancer--name=webservicelb
```
Verified created service:
```
PS C:\> kubectl get service

NAME           TYPE           CLUSTER-IP         EXTERNAL-IP           PORT(S)        AGE
kubernetes     ClusterIP      10.96.0.1           <none>               443/TCP        16d
webservice     NodePort       10.101.114.59       <none>               80:31178/TCP   17m
webservicelb   LoadBalancer   10.100.184.197      <pending>            80:30484/TCP   11s
```
Deployment exposed using service type LoadBalancer. Let's verify external access using minikube IP and LoadBalancer port (30484)
![image](https://3.bp.blogspot.com/-HoL41SvENhc/XBilorsCK8I/AAAAAAAAE8c/ITM_qvTlZOwyqQSFLVou4tBD7B8cWL_QACLcBGAs/s640/m1.jpg)

**Step 9-  Scale our deployment:**
Using Kubernetes, we can scale our deployment anytime. our current deployment has a single pod. you can verify it by running a command- kubect get pods. In order to scale our deployment let's use following command.
```
PS C:\> kubectl scale deployment web --replicas=2
```
Above command will scale our deployment and no of running pods will be 2.
let's verify running pods using the command below.
```
PS C:\> kubectl get pods

NAME                     READY          STATUS                    RESTARTS            AGE
web-c86cff74-qntmh       0/1           ContainerCreating             0                 10s
web-c86cff74-r9rpb       1/1           running                       0                 33m
```
We just scaled our deployment and you can see new Pod creation is in progress. Run above command again to verify that both pods are available and running.

```
PS C:\> kubectl get pods

NAME                      READY        STATUS        RESTARTS        AGE
web-c86cff74-qntmh        1/1         Running         0              2m
web-c86cff74-r9rpb        1/1         Running         0              35m
```
Verified and our second pod available and running. 

We have successfully built our single node Kubernetes cluster using Minikube and were able to built deployment, Service and pods.

**Step 10- Delete service:**
Once, you have done with the testing and you want to delete service, run the following command.
```
PS C:\> kubectl delete service/webservicelb
```
**Where**
```
Kubectl  delete                               - is a command
Service                                       -  is a command
webservicelb                                  -  is your service name
```
**Step 11- Delete Deployment:**
In order to stop pods, we need to delete our deployment. run the command below to delete deployment.
```
PS C:\> kubectl delete deployment/web
```
In the above command web is your deployment. replace it with your deployment name to delete.
Successfully deleted deployment and service. Now, if you will run the command kubectl get pods output will be null.
```
PS C:\> kubectl get pods
No resources found.
```
**Step 12- Run Minikube dashboard in the browser:**
Minikube gives us the GUI interface to manage kubernetes cluster resource. To access GUI dashboard run the below com
```
PS C:\> minikube dashboard
Opening http://127.0.0.1:51503/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/ in your default
browser...
```
The above command will open your default browser window and you will see kubernetes cluster resource in the GUI window.

![image](https://2.bp.blogspot.com/-Ph-8TsvJa5k/XBiq8DGFvuI/AAAAAAAAE8o/N4KYQeb4zRAajATm_yS5001mWN7PTU4oQCLcBGAs/s1600/m2.jpg)

**Thanks for reading. Please leave your comments in order to improve**


