# # 3. get admin credentials
# az acr credential show --resource-group eus-dms-dev-theia --name eusdmsdevservicesCR --query "passwords[0].value" --output tsv

# # az identity create --name eusdmsdevmanagedidentity --resource-group eus-dms-dev-theia

# Authorize the managed identity for your registry
# Retrieve the principal ID for the managed identity
$principalId=$(az identity show --resource-group eus-dms-dev-theia --name eusdmsdevmanagedidentity --query principalId --output tsv)

# Retrieve the resource ID for the container registry
$registryId=$(az acr show --name eusdmsdevservicesCR --resource-group eus-dms-dev-theia --query id --output tsv)

# Grant the managed identity permission to access the container registry:
az role assignment create --assignee $principalId --scope $registryId --role "AcrPull"
