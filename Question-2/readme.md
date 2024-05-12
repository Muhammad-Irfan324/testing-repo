# Question - 2

```
Using Jenkins OR GitHub, create a
CI/CD pipeline that automates the testing and deployment of code pushed to a
repository. This pipeline should handle different environments (development,
staging, and production) and incorporate security checks into the deployment
process.
```

- Simple containerized node base application with three different env (dev,stage & prod)
- It also includes a `index.test.js` which will test the application and in case if it doesn't get desired result it will fail the build
- Github Action workflows are written for all environment.
- Once test is passed then it'll build the application and push it to [ECR](https://github.com/Muhammad-Irfan324/testing-repo/blob/terraform/ecr.tf)(ECR also created via Terraform)
- After Image is pushed on ECR, it'll login to EC2 instance and Deploy the container there 
- [dev-workflow](https://github.com/Muhammad-Irfan324/testing-repo/blob/dev/.github/workflows/dev-deployment.yaml)
- [stage-workflow](https://github.com/Muhammad-Irfan324/testing-repo/blob/stage/.github/workflows/stage-deployment.yaml)
- [prod-workflow](https://github.com/Muhammad-Irfan324/testing-repo/blob/prod-v-1/.github/workflows/prod-deployment.yaml)
- In case if it doesn't `index.test.js` is failed it'll failed the [build](https://github.com/Muhammad-Irfan324/testing-repo/actions/runs/9052496102/job/24870223209)
-  one of the build succeded for PROD Env 
![screenshot](https://github.com/Muhammad-Irfan324/testing-repo/tree/main/Question-2/Selection_360.png)
- ECR REPO 
![screenshot](https://github.com/Muhammad-Irfan324/testing-repo/tree/main/Question-2/Selection_361.png)
- Deployed Nginx on EC2 which will serve all three node app env as all are running on different ports
![Nginx](https://github.com/Muhammad-Irfan324/testing-repo/tree/main/Question-2/Selection_363.png)
- By doing Host entries 
![DEV](https://github.com/Muhammad-Irfan324/testing-repo/tree/main/Question-2/Selection_364.png)
![STAGE](https://github.com/Muhammad-Irfan324/testing-repo/tree/main/Question-2/Selection_365.png)
![PROD](https://github.com/Muhammad-Irfan324/testing-repo/tree/main/Question-2/Selection_366.png)
- [DEV-Branch](https://github.com/Muhammad-Irfan324/testing-repo/tree/dev)
- [STAGE-Branch](https://github.com/Muhammad-Irfan324/testing-repo/tree/stage)
- [PROD-Branch](https://github.com/Muhammad-Irfan324/testing-repo/tree/prod-v-1)
- [workflows-for-all](https://github.com/Muhammad-Irfan324/testing-repo/actions)