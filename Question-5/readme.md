# Question - 5

```
Implement role-based access
control (RBAC) in Kubernetes, secure Terraform state files in a remote backend
with encryption, and set up secure channels (SSL/TLS) for data transmission
between the services.
```

- No Real Domain or Ingress Used so no SSL/TLS Implementation
- State File [Encrypted](https://github.com/Muhammad-Irfan324/testing-repo/blob/terraform/backend.tf)
![S3-Bucket-1](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-5/Selection_374.png)
![S3-Bucket-2](https://github.com/Muhammad-Irfan324/testing-repo/blob/main/Question-5/Selection_375.png)

# RBAC in Kind Kubernetes

```
- kubectl create serviceaccount demo-user
- TOKEN=$(kubectl create token demo-user)
- kubectl config set-credentials demo-user --token=$TOKEN
- kubectl config set-context demo-user-context --cluster=kind-k8s-playground --user=demo-user
#### Change Context to new USER
- kubectl config use-context demo-user-context
#### On running get pods you'll get this 
- kubectl get pods
Error from server (Forbidden): pods is forbidden: User "system:serviceaccount:default:demo-user" cannot list resource "pods" in API group "" in the namespace "default"
#### Revert the context to the other working user 

#### And Create a Role

kubectl apply -f - << EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: demo-role
  namespace: default
rules:
  - apiGroups:
      - ""
    resources:
      - pods
    verbs:
      - get
      - list
      - create
      - update
EOF

#### Role Binding

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: demo-role-binding
  namespace: default
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: demo-role
subjects:
  - namespace: default
    kind: ServiceAccount
    name: demo-user
EOF

#### change context again
- kubectl config use-context demo-user-context

#### Now run get pods 

$ kubectl get pods
NAME                        READY   STATUS    RESTARTS   AGE
node-app-5c4b6dd65f-mz5kf   1/1     Running   0          92m

- kubectl run nginx --image=nginx:latest

$ kubectl get pods
NAME                        READY   STATUS    RESTARTS   AGE
nginx                       1/1     Running   0          29s
node-app-5c4b6dd65f-mz5kf   1/1     Running   0          93m

#### Let's delete the pods & see the response 

$ kubectl delete pod nginx
Error from server (Forbidden): pods "nginx" is forbidden: User "system:serviceaccount:default:demo-user" cannot delete resource "pods" in API group "" in the namespace "default"

#### As Expected, it doesn't have delete permission in role verbs
```