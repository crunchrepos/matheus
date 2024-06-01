
# FAQ

## How to destroy the PROD environment
> *Note:* Make sure that the folder `.terraform` and the files `.terraform.lock.hcl` and `backend.tf` does not exists. (IF THEY EXISTS DELETE!) 

To destroy the production environment (branch main) you need to:
1. Set localy the environment variable `ENVIRONMENT` to prod
```
export ENVIRONMENT=prod
```

2. Set the localy the environment variable `AWS_REGION` to us-east-2
```
export AWS_REGION=us-east-2
```

3. Enter the root_terragrunt.hcl folder, start the backend 
```
cd .infra
terragrunt run-all init
```

4. Run the terragrunt command to destroy the environment
```
terragrunt run-all destroy
```