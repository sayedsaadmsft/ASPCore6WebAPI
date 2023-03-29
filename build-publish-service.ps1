# az login
az account set --subscription HC-Dragon-DMS-Dev
az acr login --name=eusdmsdevservicesCR
docker compose build
# docker-compose up --build -d
docker compose push

# docker tag microservices-testserviceapi eusdmsdevservicesCR.azurecr.io/testserviceapi:v1.0
# docker push eusdmsdevservicesCR.azurecr.io/testserviceapi:v1.0

	
# az acr repository list --name eusdmsdevservicesCR.azurecr.io --output table
# docker run -p 8080:80 eusdmsdevservicesCR.azurecr.io/testserviceapi:v1.0

# check if the repository is uploaded to ACR
az acr repository list --name eusdmsdevservicesCR.azurecr.io --repository  testserviceapi/testserviceapi:v1.2 --output table

# check the logs on the running docker image in the container
# docker logs -f <container id>   

# dotnet build TestServiceAPI/TestServiceAPI.csproj

# following steps 
# https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container?tabs=azure-cli&pivots=container-linux
# 1. Create a user identity manager for the service
az identity create --name eusdmsdevmanagedidentity --resource-group eus-dms-dev-theia
# 2. Create Azure container registry
# 3. get admin credentials
az acr credential show --resource-group eus-dms-dev-theia --name eusdmsdevservicesCR --query "passwords[0].value" --output tsv
# 4. Create a service principal for the container registry


# set azure app service docker container image tag to the latest image
az webapp config container set --resource-group eus-dms-dev-theia --name audioexporttestservice-staging --docker-custom-image-name eusdmsdevservicesCR.azurecr.io/testserviceapi:v1.3 --docker-registry-server-url https://eusdmsdevservicesCR.azurecr.io --docker-registry-server-user eusdmsdevservicesCR --docker-registry-server-password <password>
