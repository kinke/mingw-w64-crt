mingw-w64-crt
=============

Tailored light-weight MinGW-w64 C Runtime (on top of Microsoft's Visual C Runtime) to be built by Clang on Win64
and linked by Microsoft's linker.

It covers most of the C99 functionality missing in Microsoft's runtime (otherwise implemented in virtually all
other C runtimes) and therefore simplifies code portability while allowing you to use common Windows compilers (MS,
Intel etc.) and linkers instead of having to rely on the MinGW-w64 GCC eco-system.

Clang handles GCC-style C code very well and at the same time is able to output Windows COFF objects which may
then be fed to the MS linker. So we use Clang to build a trimmed-down version of the MinGW-w64 runtime library
and are then free to use it with all other MS-compatible compilers (e.g., the D compilers LDC and DMD on Win64).
For example, we get back x87 floating-point (80 bits) support.

Prerequisites: Clang + LLVM >= 3.4 sources, Visual C++ >= 2010, Win64

* Modify your Clang sources (in the tools\clang subdirectory of your LLVM source tree) via provided
  mingw-w64-crt\clang_3.4.patch.
  If you don't have a tool to apply patches, don't worry - the patch is extremely simple. Open it in a text editor
  and perform the self-explanatory changes manually.
* Build Clang.
  If that's your first time: trust me, it's astonishingly smooth and painless. ;)
* Open a Visual Studio Command Prompt (basically a cmd.exe instance with pre-set environment variables).
* Make sure the directory containing your clang.exe is in your PATH environment variable, otherwise set it.
  E.g.: set PATH=C:\my-clang;%PATH%
* Change to this repository's mingw-w64-crt subdirectory.
* Execute compile.bat.
  Clang will compile all modules and put the generated object files into the obj subdirectory.
* Execute link_dynamic.bat and/or link_static.bat to let the MS linker/librarian generate the DLL/static library
  for you.
  Note: you may need to adjust the library paths in link_dynamic.bat as I've used the Win8 SDK.
