set echo on

set NEWHOME=%HOME%
set NEWHOME=%NEWHOME:/=\%

MKDIR %NEWHOME%\site\wwwroot\gopath
MKDIR %NEWHOME%\site\wwwroot\gopath\bin
MKDIR %NEWHOME%\site\wwwroot\gopath\src

set hr=%time:~0,2%
if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
SET FOLDER=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hr%%time:~3,2%%time:~6,2%

ECHO %FOLDER%

MKDIR %NEWHOME%\site\wwwroot\gopath\src\%FOLDER%

xcopy %DEPLOYMENT_SOURCE% %NEWHOME%\site\wwwroot\gopath\src\%FOLDER% /Y
xcopy /r %DEPLOYMENT_SOURCE%\Web.Config %NEWHOME%\site\wwwroot\Web.Config* /Y

SET GOPATH=%NEWHOME%\site\wwwroot\gopath
SET GOROOT=%NEWHOME%\site\wwwroot\go
SET PATH=%PATH%;%GOPATH%\bin;%NEWHOME%\site\wwwroot\go\bin

ECHO %PATH%

go get %FOLDER%

rem sed -i 's/GOAPPBINARY/%FOLDER%.exe/g' %NEWHOME%\site\wwwroot\Web.Config

rem exit /b 1