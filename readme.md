# Crunch Challenge

## Task description:


# Setup
## Github Repository Configuration
Few steps to setup the repository
## Github Secrets
| Parameter| Environment | Required |
|---|---| --- |
| AWS_ACCESS_KEY_ID_DEV  | DEVELOP | YES |
| AWS_ACCESS_KEY_ID_PLATFORM_DEV | DEVELOP |  YES |
| AWS_ACCESS_KEY_ID_PROD | PRODUCTION | YES |
| AWS_ACCESS_KEY_ID_PLATFORM_PROD | PRODUCTION | YES |

## GitFlow
![](./docs/terraform-pipeline.png)
> **Note:**  Only `dev` and `main` branches deploy to AWS.


# Solution

## Architecture diagram

[](./docs/architecture.png)


## Explanation
### Architecture
### CI/CD Steps
### Monitoring and Alarms