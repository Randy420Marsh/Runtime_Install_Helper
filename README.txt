#Open powershell as Admin in the current directory and execute commands below to start the script.
#Execution policy should be set automatically back to "Restricted" after execution.

Get-ExecutionPolicy
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Get-ExecutionPolicy
.\Runtime_Install_Helper_v1.2.ps1