call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
cd monodevelop

cd setup\WixSetup
msbuild WixSetup.wixproj /p:Platform=x86 /p:Configuration=Release
