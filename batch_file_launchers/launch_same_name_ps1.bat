@ECHO OFF
:: launch a Powershell script .ps1 from an identically named batch file
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process -NoNewWindow PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0%~n0.ps1""'}" || pause
