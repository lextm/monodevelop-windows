copy .\monodevelop\main\external\mono-tools\windoc\WinDoc\lib\monodoc.dll .\monodevelop\setup\WixSetup\Libraries
cd .\monodevelop\setup\WixSetup
call build.bat
copy .\bin\Release\Setup.msi ..\..\..
cd ..\..\..
