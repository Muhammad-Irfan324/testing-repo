# Question - 3

```
Containerize a simple web application using
Docker. Ensure the Docker images are stored in a secure private registry and
deploy these containers using Kubernetes. The Kubernetes setup should
demonstrate basic monitoring setup and logging using the ELK stack and
Prometheus.
```
 
- Kubernetes Cluster created Locally via [Kind](https://github.com/Muhammad-Irfan324/testing-repo/blob/terraform/kind.tf)
- Containerized the Node Application [workflow](https://github.com/Muhammad-Irfan324/testing-repo/actions/runs/9052740138)
- Image Pushed
![DOCKERHUB](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-3/Selection_368.png)
- Build the image and push it to docker hub private registery
- After pushing it'll update the tag in the manifest 
- Once tag has been updated Argocd will deploy the latest changes on the cluster
![ARGOCD](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-3/Selection_369.png)
- Argocd Deployed via [terraform](https://github.com/Muhammad-Irfan324/testing-repo/blob/terraform/argocd.tf)
- deployment manifest [here](https://github.com/Muhammad-Irfan324/testing-repo/blob/kube-manifest/deployment.yaml)
- Service deployed for deployment [here](https://github.com/Muhammad-Irfan324/testing-repo/blob/kube-manifest/svc.yaml)
- On port Forwarding we can see the node application here
![NODE-APP](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-3/Selection_367.png)
- Prometheus setup [here](https://github.com/Muhammad-Irfan324/testing-repo/blob/terraform/prometheus.tf)
- Port Forwarding for Prometheus 
![PROMETHEUS](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-3/Selection_370.png)
- Didn't Deploy ELK Stack due to lack of resources