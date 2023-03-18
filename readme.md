# Building Microservices Using ASP .NET 6
This project demostrate a simple microservice solution with the following components
1. API GateWAY
2. Simple test Microservice
3. Docker Compose to launch all apps

## Setup HTTPS Certificate
1. setup https certificate for our project
```
dotnet dev-certs https -v -ep $env:USERPROFILE\.aspnet\https\TestServiceAPI.pfx -p test123
# 2. Trust certificate
dotnet dev-certs https --trust
dotnet dev-certs https --verbose
# set the terminal path to your project 
dotnet user-secrets set "Kestrel:Certificates:Development:Password" "test123"
```


## Setup Azure Container Registry
1. install AZ-CLI tools
2. Use the following ps script to login, and publish to ACR
```
az login
az account set --subscription xxxxxxx
az acr login --name=azcontainerregistryname
docker tag localimage azcontainerregistryname.azurecr.io/imagename:v1.0
docker push azcontainerregistryname.azurecr.io/imagename:v1.0
```

## Swagger
 You can access [swagger through](https://localhost:8001/swagger/index.html)

## Docker
you can build, start, and shutdown your services using docker compose. docker compose script is usually used to setup and run dependent services
```
docker compose build
docker compose up
docker compose down
```