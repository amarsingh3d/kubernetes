# kubernetes
Build Single Node kubernetes Cluster using MiniKube

**Kubernetes:** Kubernetes is an open source system for automatic deployment, scaling, and management of containerized applications.

**MiniKube:** MiniKube is a tool that makes it easy to run a single node kubernetes cluster locally. MiniKube runs a single-node Kubernetes cluster on a Virtual machine inside of your laptop. 

![image](https://1.bp.blogspot.com/-CXWywEZuyFo/XBixFEQSeKI/AAAAAAAAE80/mV8oIHCQrQwtu9fijU374IFJ_VYdGkEKwCLcBGAs/s1600/kubernetes.jpg)

**Kubernetes Features in MiniKube: 

DNS
Node Port
Dashboard
Enable CNI (container Network Interface)
ConfigMap and Secrets
Ingress
Container Runtime: Docker, rkt, CRI-O and container 
**Prerequisites:**
A Windows Machine with admin access
Installed Virtual box in Windows machine
Installed Powershell 
VT-x or AMD-v Virtualization enabled
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

!.[image].(https://4.bp.blogspot.com/-S4CmYNfZMjo/XBOa12vUoHI/AAAAAAAAE6U/9j3v-A7tsAUiSjPR18Oji9Nkl46sDtJawCLcBGAs/s1600/choco.jpg)
