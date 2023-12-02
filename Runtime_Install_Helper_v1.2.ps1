# Runtime install helper Version 1.2
# Installs all the latest english runtimes
# that you select.

# In Windows 10 just place this scipt in the Downloads folder and open admin powershell window from the file menu
# then just copy paste lines from 10 to 14 and hit enter.
# all files will downloaded to C:\Runtime_Install_Helper\
<#

powershell
Get-ExecutionPolicy
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Get-ExecutionPolicy
./Runtime_Install_Helper_v1.2.ps1

#>

<#
#
#Open powershell as Admin in the current directory and execute commands from above to start the script.
#Execution policy should be set automatically back to "Restricted" after execution.
#
# if the scipt is not in C:\.. you need to use "cd /D X:\" where X is your drive letter. 
# cd is the change directory command and /D is the drive change switch...
# Also you need to change execution policy to allow executing this unsigned scipt.
# For current user (recommended) it seems to work just fine to execute "Set-ExecutionPolicy -Scope CurrentUser RemoteSigned" 
# or globally "Set-ExecutionPolicy unrestricted"
#
# To undo the execution policy change type:
# Set-ExecutionPolicy restricted
# or
# Set-ExecutionPolicy -Scope CurrentUser Restricted
#
# This is done automatically in the end of the sript and not needed...
# if yout get the status of "Current execution policy: Restricted" in the end then the script has worked it's magic.
#>


Write-Host "This script changes the execution policy to RemoteSigned"
Write-Host "Are you sure you want to continue?"
pause
Write-Host "-"

$ok_continue = Read-Host "Are you really sure? (y/n)"

while("y","n" -notcontains $ok_continue)
{
	$ok_continue = Read-Host "y or n?"
}

if($ok_continue -like "y") { 

Write-Host "-"
Write-Host "Runtime install helper Version 1.2"
Write-Host "Installs all the english runtimes"
Write-Host "that you select."
Write-Host "-"

$ErrorActionPreference = "SilentlyContinue"
Write-Host "Current execution policy:" (Get-ExecutionPolicy)
Write-Host "Changing policy..."
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Write-Host "Current execution policy should now return: "RemoteSigned"" =(Get-ExecutionPolicy)
Write-Host "Ok!"

$visual = Read-Host "Install Visual C++ Redistributable Packages? (y/n)"

while("y","n" -notcontains $visual)
{
	$visual = Read-Host "y or n?"
}

$netfx35 = Read-Host "Install NetFramework 3.5? (y/n)"

while("y","n" -notcontains $netfx35)
{
	$netfx35 = Read-Host "y or n?"
}

$netfx48 = Read-Host "Install NetFramework 4.8? (y/n)"

while("y","n" -notcontains $netfx48)
{
	$netfx48 = Read-Host "y or n?"
}

$dx = Read-Host "DirectX End-User Runtime Web Installer? (y/n)"

while("y","n" -notcontains $dx)
{
	$dx = Read-Host "y or n?"
}

$xna3 = Read-Host "(Optional for XNALara) Microsoft XNA Framework Redistributable 3.0? (y/n)"

while("y","n" -notcontains $xna3)
{
	$xna3 = Read-Host "y or n?"
}

if ($visual -like "y") { 
#INSTALL VISUAL C++
<#
    .SYNOPSIS
        Download all "english" Visual C++ Runtimes
    .PARAMETER  ParameterA
        $OutputPath = Default Path

#>
param(
    [String]$outputPath = "C:\Runtime_Install_Helper\"
)
Write-Host "Download Microsoft Visual C++ 2005, 2008, 2010, 2012, 2013, 2015, 2017, 2019, 2022, NetFramework, XNA Framework, DirectX."
if(! (test-path "$outputPath\VS2005")) { New-Item "$outputPath\VS2005\" -Type directory -Force}
Write-Verbose "Microsoft Visual C++ 2005 SP1 Redistributable Package (x86)" -Verbose
Invoke-WebRequest   "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -OutFile "$outputPath\VS2005\vcredist_x86.exe"
Write-Verbose "Microsoft Visual C++ 2005 SP1 Redistributable Package (x64)" -Verbose
Invoke-WebRequest  "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -OutFile "$outputPath\VS2005\vcredist_x64.exe"
if (! (test-path "$outputPath\VS2008")) { New-Item "$outputPath\VS2008\" -Type directory -Force }
Write-Verbose "Microsoft Visual C++ 2008 SP1 Redistributable Package (x86)" -Verbose
Invoke-WebRequest  "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -OutFile "$outputPath\VS2008\vcredist_x86.exe"
Write-Verbose "Microsoft Visual C++ 2008 SP1 Redistributable Package (x64)" -Verbose
Invoke-WebRequest  "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -OutFile "$outputPath\VS2008\vcredist_x64.exe"
if (! (test-path "$outputPath\VS2010")) { New-Item "$outputPath\VS2010\" -Type directory -Force }
Write-Verbose "Microsoft Visual C++ 2010 SP1 Redistributable Package (x86)" -Verbose
Invoke-WebRequest "https://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe" -OutFile "$outputPath\VS2010\vcredist_x86.exe"
Write-Verbose "Microsoft Visual C++ 2010 SP1 Redistributable Package (x64)" -Verbose
Invoke-WebRequest "https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe" -OutFile "$outputPath\VS2010\vcredist_x64.exe"
if (! (test-path "$outputPath\VS2012")) { New-Item "$outputPath\VS2012\" -Type directory -Force }
Write-Verbose "Microsoft Visual C++ 2012 Update 4 Redistributable Package (x86)" -Verbose
Invoke-WebRequest "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -OutFile "$outputPath\VS2012\vcredist_x86.exe"
Write-Verbose "Microsoft Visual C++ 2012 Update 4 Redistributable Package (x64)" -Verbose
Invoke-WebRequest "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -OutFile "$outputPath\VS2012\vcredist_x64.exe"
if (! (test-path "$outputPath\VS2013")) { New-Item "$outputPath\VS2013\" -Type directory -Force }
Write-Verbose "Microsoft Visual C++ 2013 Redistributable Package (x86)" -Verbose
Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/10912113/5da66ddebb0ad32ebd4b922fd82e8e25/vcredist_x86.exe" -OutFile "$outputPath\VS2013\vcredist_x86.exe"
Write-Verbose "Microsoft Visual C++ 2013 Redistributable Package (x64)" -Verbose
Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/10912041/cee5d6bca2ddbcd039da727bf4acb48a/vcredist_x64.exe" -OutFile "$outputPath\VS2013\vcredist_x64.exe"
if (! (test-path "$outputPath\VS-15-17-19-22")) { New-Item "$outputPath\VS-15-17-19-22\" -Type directory -Force }
Write-Verbose "Visual Studio 2015, 2017, 2019, and 2022 (x86)" -Verbose
Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/144a5711-f076-44fa-bf55-f7e0121eb30c/B7AE307237F869E09F7413691A2CD1944357B5CEE28049C0A0D3430B47BB3EDC/VC_redist.x86.exe" -OutFile "$outputPath\VS-15-17-19-22\vcredist_x86.exe"
Write-Verbose "Visual Studio 2015, 2017, 2019, and 2022(x64)" -Verbose
Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/d22ecb93-6eab-4ce1-89f3-97a816c55f04/37ED59A66699C0E5A7EBEEF7352D7C1C2ED5EDE7212950A1B0A8EE289AF4A95B/VC_redist.x64.exe" -OutFile "$outputPath\VS-15-17-19-22\vcredist_x64.exe"


#xna3
if ($xna3 -like "y") { 
#INSTALL XNA 3.0
<#
    .SYNOPSIS
        Download "english" XNA 3.0 Runtime
    .PARAMETER  ParameterA
        $OutputPath = Default Path


param(
    [String]$outputPath = "C:\RuntimeS\"
)
#>

Write-Host "Download Microsoft XNA Framework Redistributable 3.0"
if(! (test-path "$outputPath\XNA3\")) { New-Item "$outputPath\XNA3\" -Type directory -Force}
Write-Verbose "Microsoft XNA Framework Redistributable 3.0" -Verbose
Invoke-WebRequest   "https://download.microsoft.com/download/0/f/f/0ff8780d-f50a-41ef-a31a-09db7c0589a2/xnafx30_redist.msi" -OutFile "$outputPath\XNA3\xnafx30_redist.msi"
#xna3

}

#dx
if ($dx -like "y") { 
#INSTALL DirectX
<#
    .SYNOPSIS
        Download "english" DirectX Runtime
    .PARAMETER  ParameterA
        $OutputPath = Default Path


param(
    [String]$outputPath = "C:\RuntimeS\"
)
#>

Write-Host "Download DirectX End-User Runtime Web Installer"
if(! (test-path "$outputPath\DX\")) { New-Item "$outputPath\DX\" -Type directory -Force}
Write-Verbose "DirectX End-User Runtime Web Installer" -Verbose
Invoke-WebRequest   "https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe" -OutFile "$outputPath\DX\dxwebsetup.exe"
#dx

}

#netfx48
if ($netfx48 -like "y") { 
#INSTALL NetFx 4.8
<#
    .SYNOPSIS
        Download "english" DirectX Runtime
    .PARAMETER  ParameterA
        $OutputPath = Default Path


param(
    [String]$outputPath = "C:\RuntimeS\"
)
#>
Write-Host "Download .NET Framework 4.8"
if(! (test-path "$outputPath\netfx48\")) { New-Item "$outputPath\NETFX48\" -Type directory -Force}
Write-Verbose ".NET Framework 4.8" -Verbose
Invoke-WebRequest   "https://download.visualstudio.microsoft.com/download/pr/014120d7-d689-4305-befd-3cb711108212/1f81f3962f75eff5d83a60abd3a3ec7b/ndp48-web.exe" -OutFile "$outputPath\NETFX48\ndp48-web.exe"
#netfx48

}

<#
    .SYNOPSIS
        Install all "english" Visual C++ Runtimes
 
    .PARAMETER  ParameterA
        $OutputPath = Default Path

param(
    [String]$outputPath = "C:\RuntimeS\"
)
[String]$outputPath = "C:\RuntimeS\"
#>
 
Write-Host "Install Microsoft Visual C++ 2005, 2008, 2010, 2012, 2013, 2015, 2017, 2019, 2022, NetFramework, XNA Framework, DirectX."
 
foreach ($RedistFile in Get-ChildItem $outputPath -Recurse -Filter "*.exe")
{
    Write-Host "Install " $RedistFile.fullname
    Start-Process  $RedistFile.fullname -ArgumentList '/q' -NoNewWindow -Wait
     
}

foreach ($RedistFile in Get-ChildItem $outputPath -Recurse -Filter "*.msi")
{
    Write-Host "Install " $RedistFile.fullname
    Start-Process  $RedistFile.fullname -ArgumentList '/q' -NoNewWindow -Wait
     
}

#Uncomment below line to autoremove redistrubutable installers

#Remove-Item $outputPath -recurse

}

if ($netfx35 -like "y") { 
#INSTALL .NET FRAMEWORK 3.5
Write-Host "Install .NET FRAMEWORK 3.5"

DISM.EXE /Online /Add-Capability /CapabilityName:NetFx3~~~~
DISM.EXE /Online /Add-Capability /CapabilityName:Language.Basic~~~en-GB~0.0.1.0
}

Write-Host "All done!"

}

#Change execution policy back to default for security reasons

Write-Host "Current execution policy:" (Get-ExecutionPolicy)
Write-Host "Changing execution policy back to default..."
Set-ExecutionPolicy -Scope CurrentUser Restricted
Write-Host "Current execution policy should now return: "Restricted"" =(Get-ExecutionPolicy)
Write-Host "END"

pause