rm -f -r %HOME%\site\wwwroot\gopath\src\
rm -f -r %HOME%\site\wwwroot\gopath\bin\

MKDIR %HOME%\site\wwwroot\gopath
MKDIR %HOME%\site\wwwroot\gopath\bin
MKDIR %HOME%\site\wwwroot\gopath\src

set hr=%time:~0,2%
if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
SET FOLDER=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hr%%time:~3,2%%time:~6,2%
MKDIR %HOME%\site\wwwroot\gopath\src\%FOLDER%

xcopy %DEPLOYMENT_SOURCE%\site\repository %HOME%\site\wwwroot\gopath\src\%FOLDER% /Y

SET GOPATH=%HOME%\site\wwwroot\gopath
SET GOROOT=%HOME%\site\wwwroot\go
SET PATH=%PATH%;%GOPATH%\bin;%HOME%\site\wwwroot\go\bin

go get %FOLDER%

sed -i 's/GOAPPBINARY/%FOLDER%.exe/g' %HOME%\site\wwwroot\Web.Config