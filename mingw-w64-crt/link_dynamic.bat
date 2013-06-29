@echo off

set link_options=/NOLOGO /DLL /MACHINE:X64 /DYNAMICBASE /NXCOMPAT msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /LIBPATH:"%VCINSTALLDIR%lib\amd64" /LIBPATH:"%VCINSTALLDIR%atlmfc\lib\amd64" /LIBPATH:"%WindowsSdkDir%lib\win8\um\x64"

set command_file=%~dp0obj\list.txt
if not exist "%command_file%" (
  echo ERROR: command file "%command_file%" does not exist.
  goto :eof
)

set def_file=%~dp0exports.def
if not exist "%def_file%" (
  echo ERROR: module-definition file "%def_file%" does not exist.
  goto :eof
)

echo.
link.exe /OUT:"%~dp0mingw-w64-crt.dll" /IMPLIB:"%~dp0mingw-w64-crt.lib" /DEF:"%def_file%" %link_options% "@%command_file%"

echo.
if %ERRORLEVEL% NEQ 0 (
  echo Linking error^(s^).
) else (
  echo Linking successful.
)
