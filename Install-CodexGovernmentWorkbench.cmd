@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Install-CodexGovernmentWorkbench.ps1"
if errorlevel 1 (
  echo.
  echo 安装未完成，请查看上方提示。
)
pause
