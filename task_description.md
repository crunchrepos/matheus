# Task description:

## Role:
Senior DevOps Engineer 

### Infrastructure Setup:
Use either Terraform or AWS CloudFormation to create and
manage the necessary AWS cloud infrastructure. This should include, but not be
limited to:
-  EC2 instances or ECS/EKS for container orchestration.
- [ x ] RDS or Aurora for the PostgreSQL database.
- [ x ] VPC, Subnets, and Internet Gateway for network configuration.
- Load Balancers (ALB) for distributing incoming application tra\ic.
- Auto Scaling to handle changes in load.

### Dockerization: 
Containerize the given Node.js application using Docker. Ensure
that the Docker setup is optimized for a production environment.
-  Provide a Dockerfile to build the application container.

### CI/CD Pipeline: 
Set up a CI/CD pipeline using AWS CodePipeline, GitHub Actions, or any other CI/CD tool to automate the testing and deployment of the application.
- The pipeline should build the Docker container.
- Run tests to ensure the build is stable.
- Deploy the container to AWS ECS or EKS

### Monitoring and Alarms: 
Utilize AWS CloudWatch to set up monitoring and alarms.
- Track key metrics like CPU usage, memory usage, disk I/O, and network trafic.
- Set up alarms to notify you of potential issues (e.g., high CPU usage, low disk space, or downtime).

### Documentation: 
Provide detailed documentation on the architecture and setup.
- Include an architectural diagram showing the components of your infrastructure.
- Step-by-step instructions on how to deploy the application.
- Guide on how to monitor the application and respond to alarms

## Reference Project
- Express and TypeORM Example: This Node.js application using Express and TypeORM demonstrates basic CRUD operations and will serve as the base for your deployment.
- Repository: [mkosir/typeorm-express-typescript](https://github.com/mkosir/typeorm-express-typescript)
- Utilize included Postman configuration files, instead of the Postman files that come with the project from GitHub

## Deliverables
1. IaC Scripts: Include all Terraform or AWS CloudFormation scripts used to define and provision the cloud infrastructure.
2. Docker Configuration: The Dockerfile and any docker-compose.yml files used.
3. CI/CD Configuration: Configuration files and scripts for the CI/CD pipeline.
4. Operational Documentation: A README.md file that includes:
    - Architectural overview with a diagram.
    - Setup instructions.
    - Monitoring and alarm management guide.
5. Test Suites: Ensure the application has relevant tests and they are documented on how to run them.

## Evaluation Criteria
- Infrastructure as Code Quality: Clean, well-organized, and maintainable code for infrastructure setup.
- CI/CD Implementation: E\iciency and reliability of the pipeline setup.
- Operational Excellence: Monitoring, logging, and alerting setup.
- Documentation: Clarity and completeness of the documentation.
- Containerization: Best practices and optimizations used in the Docker setup.

## Submission Instructions

- Please submit your project via a GitHub repository link. Ensure that all sensitive information, like API keys or credentials, is removed or secured properly in the configuration files. Include clear, concise commit messages and a welldocumented README for setup and deployment instructions.
- Include a URL to the deployed Application
- Ensure you can make requests using included Postman Collection endpoints and Postman environment variables. Note, you will need to update the “host” environment variable accordingly once the Application is deployed.


---