# Enable CI/CD for azure WebAPp audioexporttestservice/Staging
$cicdUrl=$(az webapp deployment container config --enable-cd true --name audioexporttestservice/Staging --resource-group eus-dms-dev-theia --query CI_CD_URL --output tsv)
