@ECHO OFF
:: launch a Powershell script .ps1 from an identically named batch file, and elevate it to Administrator priveleges.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0%~n0.ps1""' -Verb RunAs}" || pause
