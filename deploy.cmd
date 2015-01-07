@echo off

echo Cleaning up existing folders
rm -f -r %HOME%\site\wwwroot\gopath\

echo Creating folders
MKDIR %HOME%\site\wwwroot\gopath
MKDIR %HOME%\site\wwwroot\gopath\bin
MKDIR %HOME%\site\wwwroot\gopath\src

echo Create app folder variable
set hr=%time:~0,2%
if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
SET FOLDER=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hr%%time:~3,2%%time:~6,2%

echo Create app folder
MKDIR %HOME%\site\wwwroot\gopath\src\%FOLDER%

echo Copy files
xcopy %DEPLOYMENT_SOURCE%\site\repository %HOME%\site\wwwroot\gopath\src\%FOLDER% /Y

echo Set env variables
SET GOPATH=%HOME%\site\wwwroot\gopath
SET GOROOT=%HOME%\site\wwwroot\go
SET PATH=%PATH%;%GOPATH%\bin;%HOME%\site\wwwroot\go\bin

echo Go get
go get %FOLDER%

echo Set command
sed -i 's/GOAPPBINARY/%FOLDER%.exe/g' %HOME%\site\wwwroot\Web.Config