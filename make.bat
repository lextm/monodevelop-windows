call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo install dependencies
gacutil /i monodoc.dll
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

msiexec /i gtk-sharp-2.12.45.msi /quiet /qn /norestart /log install.log
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

gettext-0.14.4.exe /verysilent /suppressmsgboxes
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

cd monodevelop

cd main

echo restore packages
dotnet restore --force
external\nuget-binary\nuget.exe update /self
external\nuget-binary\nuget.exe restore -DisableParallelProcessing -force
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo restore RefactoringEssentials
msbuild /t:Restore /p:RestoreDisableParallel=true external\RefactoringEssentials\RefactoringEssentials\RefactoringEssentials.csproj
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo paket bootstrapper
external\fsharpbinding\.paket\paket.bootstrapper.exe
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

cd external\fsharpbinding\
echo paket restore
.paket\paket.exe restore
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

cd ..\..
echo build main
msbuild /p:Configuration=ReleaseWin32 /p:Platform="Any CPU" Main.sln
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo MonoDevelop.exe is in \monodevelop\main\build\bin directory.
cd ..\..
