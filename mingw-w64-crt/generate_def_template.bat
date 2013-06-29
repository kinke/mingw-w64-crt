@echo off

set template_file=%~dp0exports.def.template
echo EXPORTS > "%template_file%"

set last_dir=..\
setlocal EnableDelayedExpansion
for /r %%F in (*.c *.s) do (
  set rel_dir=%%~dpF
  set rel_dir=!rel_dir:%~dp0=!
  set name=%%~nF
  if !rel_dir! NEQ !last_dir! (
    echo ; .\!rel_dir! >> "%template_file%"
    set last_dir=!rel_dir!
  )
  echo !name! >> "%template_file%"
)
setlocal DisableDelayedExpansion

echo.
echo .def template "%template_file%" generated.
