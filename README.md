# azure-website-go-builder

When you commit to Azure websites, you can run a custom deployment script. `deploy.cmd` uses the GoLang SDK to create a binary of the Go files you've committed and then updates Web.Config to use the newly created binary. Last, it kills the w3wp.exe process hosting the site, forcing it to reload.

For this to work it's assumed you've installed the Go SDK. Just run the following two commands from the Kudu command line:

	curl -O https://storage.googleapis.com/golang/go1.4.windows-386.zip

	unzip go1.4.windows-386.zip