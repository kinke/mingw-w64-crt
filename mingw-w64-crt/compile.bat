@echo off

set clang_options=-target x86_64-pc-win32 -Xclang -cxx-abi -Xclang microsoft -fno-ms-compatibility -fmsc-version=0 -fvisibility=default -I"%~dp0include" -I"%~dp0..\mingw-w64-headers\crt" -I"%~dp0..\mingw-w64-headers\include" -DKINK_CRT -D__MINGW32__ -D__MINGW64__

echo.

if not exist "%~dp0obj" (md "%~dp0obj")
set command_file=%~dp0obj\list.txt
if exist "%command_file%" (del "%command_file%")

set success=1
setlocal EnableDelayedExpansion
for /r %%F in (*.c *.s) do (
  set rel_path=%%~F
  set rel_path=!rel_path:%~dp0=!
  echo .: !rel_path!
  set object_id=!rel_path:\=.!
  set object=%~dp0obj\!object_id!.obj
  echo !object! >> "%command_file%"
  clang.exe -c "%%F" %clang_options% -o "!object!"
  if !ERRORLEVEL! NEQ 0 (set success=0)
  echo ----------
)
setlocal DisableDelayedExpansion

echo.
if %success% EQU 0 (
  echo Compilation error^(s^).
) else (
  echo Compilation successful.
)
