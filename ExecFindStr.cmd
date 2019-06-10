@echo off
@echo Searching local disk for patterns defined in .ps1 script.
PowerShell.exe -ExecutionPolicy Bypass -File findStrSite_extensionsConfig.ps1
