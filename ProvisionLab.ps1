#Note: Because the $ErrorActionPreference is "Stop", this script will stop on first failure.
$ErrorActionPreference = "stop"

$SubscriptionId = ""

"Login to the subscription with your Azure account..."
Login-AzureRmAccount -SubscriptionId $SubscriptionId
#TODO: Use the line below instead of Login above, once you're authenticated.
Select-AzureRmSubscription -SubscriptionId $SubscriptionId | Out-Null

"Creating new resource group for the demo lab..."
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation

"Start deploying the demo lab using the ARM templates..."
New-AzureRmResourceGroupDeployment -Name deployDemoLab -ResourceGroupName $ResourceGroupName `
    -TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json -Verbose `
    -timeZoneId ([TimeZoneInfo]::Local.Id)