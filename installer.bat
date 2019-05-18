echo copy monodoc
copy .\monodoc.dll .\monodevelop\main\build\bin
@IF %ERRORLEVEL% NEQ 0 EXIT /b 1

cd .\monodevelop\setup\WixSetup
call build.bat
copy .\bin\Release\Setup.msi ..\..\..
cd ..\..\..
