set echo on

MKDIR %HOME%/site/wwwroot/gopath
MKDIR %HOME%/site/wwwroot/gopath/bin
MKDIR %HOME%/site/wwwroot/gopath/src

rem set hr=%time:~0,2%
rem if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
rem SET FOLDER=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hr%%time:~3,2%%time:~6,2%

rem MKDIR %HOME%\site\wwwroot\gopath\src\%FOLDER%

rem xcopy %DEPLOYMENT_SOURCE%\site\repository %HOME%\site\wwwroot\gopath\src\%FOLDER% /Y
rem xcopy /r %DEPLOYMENT_SOURCE%\site\repository\Web.Config %HOME%\site\wwwroot\Web.Config* /Y

rem SET GOPATH=%HOME%\site\wwwroot\gopath
rem SET GOROOT=%HOME%\site\wwwroot\go
rem SET PATH=%PATH%;%GOPATH%\bin;%HOME%\site\wwwroot\go\bin

rem go get %FOLDER%

rem sed -i 's/GOAPPBINARY/%FOLDER%.exe/g' %HOME%\site\wwwroot\Web.Config

rem exit /b 1