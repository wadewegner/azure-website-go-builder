# azure-website-go-builder

Yes, [Azure Websites](http://azure.microsoft.com/en-us/services/websites/) can run Go! Check out this post to understand the [basics of running Go in Azure Websites](http://www.wadewegner.com/2014/12/4-simple-steps-to-run-go-language-in-azure-websites/). You can simplify by using a [site extension with resource manager](http://www.wadewegner.com/2015/01/creating-a-go-site-extension-and-resource-template-for-azure/) to get the Go binaries on the machine.

In this repository you'll find the tools you need to configure Azure Websites to automatically compile and host your Go website when you commit using Git. Simply follow the steps in this tutorial to get everything setup and configured.

**Note:** you'll only have to run through this tutorial once. Once configured, all you need to do is commit your Go code and the app is automatically compiled and configured.

**Setup Steps**

1. Clone this repository. `git clone https://github.com/wadewegner/azure-website-go-builder`

2. Either use PowerShell or the Azure Portal to deploy your website along with the [Go Lang Site Extension](https://www.siteextensions.net/packages/golang/).

	**PowerShell Steps**

	1. [Install and configure Azure PowerShell](http://azure.microsoft.com/en-us/documentation/articles/install-configure-powershell/) (if you don't already have it).
	2. Edit the `deploy_site_extension.ps1` file to include your credentials. You can also change names and locations. You can change other settings in the `site_extension_template.json` file if you desire but it's not absolutely necessary.
	3. Run the `deploy_site_extension.ps1` PowerShell script.

		![powershelltest](https://cloud.githubusercontent.com/assets/746259/5703187/7fe69a7c-9a20-11e4-81fc-6aa40f80e5bd.png)

	**Azure Portal Steps**
 
	1. Log into the [Azure Portal](https://portal.azure.com/).
	2. Create a new Azure Website. Feel free to use the free tier if you're testing.

		![portaltest](https://cloud.githubusercontent.com/assets/746259/5703027/1b6da8b2-9a1e-11e4-8489-4ce689bf963f.png)

	3. Once your website is provisioned the website blade will open. Select `Configuration` and `Extensions` then click the `Add` button.
	4. Select the `Go Lang for Azure Websites` site extension, accept the legal terms, and click `OK`.
	
	Give it a moment to install into site extension. You can see progress on the `Notifications` blade.

3. Log into the [Azure Portal](https://portal.azure.com/) (if you're not already there) and open your website blade.

4. Select the `Deployment` tile to configure continuous deployment. Choose the `Local Git Repository` source and click `OK`.

5. Select the `Set deployment credentials` tile and set your password. Don't forget to click `Save`.

6. Select the `Deployment` tile again (it should saw `No deployments found`) and copy your `GIT URL`.

7. Return to your console and add a git remote to your Azure Website.

		git remote add azure https://wadewegner@golangtestportalsite.scm.azurewebsites.net:443/GoLangTestPortalSite.git

8. Add your changes, commit, and push to Azure. Enter your password when prompted.

		git add -A
		git commit -m "Initial setup"
		git push azure master

9. Browse to your website. You should see the following:

	![website](https://cloud.githubusercontent.com/assets/746259/5703410/7aa481e8-9a23-11e4-9212-9e329ecf35b0.png)

That's it! As part of the commit process, Azure Websites runs the `deploy.cmd` file to compile and deploy your application. If you change your `app.go` and push your changes you'll see the updates after the deploy script finishes.

If you have any questions or issues please submit an issue.