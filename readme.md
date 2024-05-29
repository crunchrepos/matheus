# Crunch Challenge

## Task description:


# Setup
## Github Repository Configuration
1. Add the following secrets on github.
[Official Documentation](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)

    | Parameter| Environment | Required |
    |---|---| --- |
    | AWS_ACCESS_KEY_ID_DEV  | DEVELOP | YES |
    | AWS_ACCESS_KEY_ID_PLATFORM_DEV | DEVELOP |  YES |
    | AWS_ACCESS_KEY_ID_PROD | PRODUCTION | YES |
    | AWS_ACCESS_KEY_ID_PLATFORM_PROD | PRODUCTION | YES |

2. Fill the files `tfvars/develop.tfvars` and `tfvars/main.tfvars` according to the values for each environment.

3. After the push to the branch, the pipeline will deploy the resources.

## GitFlow
![](./docs/terraform-pipeline.png)
> **Note:**  Only `dev` and `main` branches deploy to AWS.


# Solution

## Architecture diagram

![](./docs/architecture.png)


## Explanation
### Architecture
### CI/CD Steps
### Monitoring and Alarms