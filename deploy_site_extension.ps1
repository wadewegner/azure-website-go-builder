Switch-AzureMode -Name AzureResourceManager

$subName = "YOURSUBSCRIPTIONNAME"
$userName = "YOURAZUREADADMIN"
$securePassword = ConvertTo-SecureString -String "YOURPASSWORD" -AsPlainText -Force
$name = "GoLangTestPowerShell"
$location = "West US"
$siteName = $name + "Site"
$hostingPlanName = $name
$templateFile = "site_extension_template.json"

$cred = New-Object System.Management.Automation.PSCredential($userName, $securePassword)
Add-AzureAccount -Credential $cred 

Select-AzureSubscription -SubscriptionName $subName
New-AzureResourceGroup -Name $name -Location $location -TemplateFile $templateFile -siteName $siteName -hostingPlanName $hostingPlanName -siteLocation $location -Force
 
Switch-AzureMode -Name AzureServiceManagement