::#Open powershell as Admin in the current directory and execute commands below to start the script.
::#Execution policy should be set automatically back to "Restricted" after execution.

@setlocal enableextensions
@cd /d "%~dp0"

powershell Get-ExecutionPolicy
powershell Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
powershell Get-ExecutionPolicy
powershell .\Runtime_Install_Helper_v1.1.ps1
powershell Set-ExecutionPolicy -Scope CurrentUser Restricted

pause