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

