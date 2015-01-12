Switch-AzureMode -Name AzureResourceManager

$subName = "YOURSUBSCRIPTIONNAME"
$userName = "YOURAZUREADADMIN"
$securePassword = ConvertTo-SecureString -String "YOURPASSWORD" -AsPlainText -Force
$name = "GoLang"
$location = "West US"
$siteName = $name + "Site"
$hostingPlanName = $name
$templateFile = "Template.json"

$cred = New-Object System.Management.Automation.PSCredential($userName, $securePassword)
Add-AzureAccount -Credential $cred 

Select-AzureSubscription -SubscriptionName $subName
New-AzureResourceGroup -Name $name -Location $location -TemplateFile $templateFile -siteName $siteName -hostingPlanName $hostingPlanName -siteLocation $location -Force
 
Switch-AzureMode -Name AzureServiceManagement