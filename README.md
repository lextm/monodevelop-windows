Test repo to build MonoDevelop on Windows

|              | Windows |
|:------------:|:-------:|
| Build status | [![Build status](https://img.shields.io/appveyor/ci/lextm/monodevelop-windows/master.svg?label=appveyor&style=flat-square)](https://ci.appveyor.com/project/lextm/monodevelop-windows) |

Tha artifacts (portable ZIP package, and Windows MSI installer) matching MonoDevelop 7.8 release can be downloaded from

https://ci.appveyor.com/project/lextm/monodevelop-windows/build/artifacts

**MonoDevelop 7.x has a hard dependency on GTK# and MSBuild 15, so please install [GTK# for .NET](https://www.monodevelop.com/download/#fndtn-download-win) and [Visual Studio 2017 Build Tools](https://chocolatey.org/packages/visualstudio2017buildtools/15.0.26228.0) before running this build.**

MonoDevelop 8.x is still in active development and unstable, so no plan to ship artifacts for them yet.
