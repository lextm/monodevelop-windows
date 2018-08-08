call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86

echo install dependencies
gacutil /i monodoc.dll
msiexec /i gtk-sharp-2.12.45.msi /quiet /qn /norestart /log install.log
gettext-0.14.4.exe /verysilent /suppressmsgboxes

echo build the source
cd monodevelop

cd main
external\nuget-binary\nuget.exe restore -DisableParallelProcessing
msbuild /t:Restore /p:RestoreDisableParallel=true external\RefactoringEssentials\RefactoringEssentials\RefactoringEssentials.csproj
external\fsharpbinding\.paket\paket.bootstrapper.exe
cd external\fsharpbinding\
.paket\paket.exe restore
cd ..\..
msbuild /p:Configuration=DebugWin32 /p:Platform="Any CPU" Main.sln

echo MonoDevelop.exe is in \monodevelop\main\build\bin directory.
