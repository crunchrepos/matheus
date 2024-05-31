
# FAQ

## How to destroy the PROD environment

Para destruir o ambiente de producao (branch main) é necessário:
1. Setar a variavel de ambiente ENVIRONMENT para prod
```
export ENVIRONMENT=prod
```

2. Setar a variavel de ambiente AWS_REGION para us-east-2
```
export AWS_REGION=us-east-2
```

3. entrar na pasta do arquivo root_terragrunt.hcl, iniciar o backend 
```
cd .infra
```

4. executar o comando terragrunt para destruir o ambiente
```
terragrunt run-all destroy
```