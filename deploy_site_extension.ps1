Switch-AzureMode -Name AzureResourceManager

$subName = "Microsoft FTE"
$userName = "wade@wadewegnergmail.onmicrosoft.com"
$securePassword = ConvertTo-SecureString -String "j)MwY9j3E{o" -AsPlainText -Force
$name = "GoLangTest2"
$location = "West US"
$templateFile = "Template.json"
$siteName = $name + "Site"
$hostingPlanName = $name

$cred = New-Object System.Management.Automation.PSCredential($userName, $securePassword)
Add-AzureAccount -Credential $cred 

Select-AzureSubscription -SubscriptionName $subName
New-AzureResourceGroup -Name $name -Location $location -TemplateFile $templateFile -siteName $siteName -hostingPlanName $hostingPlanName -siteLocation $location -Force
 
Switch-AzureMode -Name AzureServiceManagement