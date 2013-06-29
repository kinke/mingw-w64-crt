@echo off

set link_options=/NOLOGO /MACHINE:X64

set command_file=%~dp0obj\list.txt
if not exist "%command_file%" (
  echo ERROR: command file "%command_file%" does not exist.
  goto :eof
)

echo.
lib.exe /OUT:"%~dp0mingw-w64-crt.static.lib" %link_options% "@%command_file%"

echo.
if %ERRORLEVEL% NEQ 0 (
  echo Linking error^(s^).
) else (
  echo Linking successful.
)
