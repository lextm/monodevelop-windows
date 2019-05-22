Test repo to build MonoDevelop on Windows
=========================================

|              | Windows |
|:------------:|:-------:|
| Build status | [![Build status](https://img.shields.io/appveyor/ci/lextm/monodevelop-windows/master.svg?label=appveyor&style=flat-square)](https://ci.appveyor.com/project/lextm/monodevelop-windows) |

Tha artifacts (portable ZIP package, and Windows MSI installer) matching MonoDevelop 7.8 release.

Downloads
---------
Latest builds/installers can be downloaded from

https://ci.appveyor.com/project/lextm/monodevelop-windows/build/artifacts

**MonoDevelop 7.x has hard dependency on GTK# and MSBuild 15, so please install [GTK# for .NET](https://www.monodevelop.com/download/#fndtn-download-win) and [Visual Studio 2017 Build Tools](https://chocolatey.org/packages/visualstudio2017buildtools/15.0.26228.0) (or simply any Visual Studio 2017 edition) before running it.**

> MonoDevelop 8.x is still in active development and unstable, so there is no plan to ship artifacts for them yet.

Troubleshooting Guide
---------------------
You might try the steps to see what else we can dig out,

1. Open a MonoDevelop instance (like C:\Program Files (x86)\MonoDevelop\bin\MonoDevelop.exe).
1. Instead of creating/opening a project, click Run | Debug Application... menu item.
1. Set Command to C:\Program Files (x86)\MonoDevelop\bin\MonoDevelop.exe.
1. Set Working Directory to C:\Program Files (x86)\MonoDevelop\bin.
1. Click OK.
1. Wait till the second instance of MonoDevelop launches, switch back to the first instance and click View | Pads | Application Output - MonoDevelop.exe to reveal the tracing.
1. Switch back to the second instance, and reproduce the issue.

Now the tracing should show what errors happened. From that we can see how the installer can be improved.
