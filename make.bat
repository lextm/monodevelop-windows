call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo install dependencies
gacutil /i monodoc.dll
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

msiexec /i gtk-sharp-2.12.45.msi /quiet /qn /norestart /log install.log
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

gettext-0.14.4.exe /verysilent /suppressmsgboxes
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo build the source
cd monodevelop

cd main
external\nuget-binary\nuget.exe restore -DisableParallelProcessing
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

msbuild /t:Restore /p:RestoreDisableParallel=true external\RefactoringEssentials\RefactoringEssentials\RefactoringEssentials.csproj
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

external\fsharpbinding\.paket\paket.bootstrapper.exe
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

cd external\fsharpbinding\
.paket\paket.exe restore
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

cd ..\..
msbuild /p:Configuration=DebugWin32 /p:Platform="Any CPU" Main.sln
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

echo MonoDevelop.exe is in \monodevelop\main\build\bin directory.
