<#
Name:
  InstallWindowsUpdates

Description:
  This script will install Windows Updates silently and remotely for computers on an active
  directory domain.

  This is was created when we were restarting many old computers that hadn't be started up
  in 2 years due to COVID-19.

Usage:
  InstallWindowsUpdates.ps1

Updates:
  - 10/11/2019 Script Creation

#>

# Install Nuget Package manager
Install-PackageProvider NuGet -Force |
    Out-Null
# Import the new commands associated with NuGet
Import-PackageProvider NuGet -Force |
    Out-Null
# Trust the scripts from the PowerShell Gallery online
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted |
    Out-Null
# Install the PowerShell WindowsUpdate Module
Install-Module PSWindowsUpdate |
    Out-Null
# Add the commands for WindowsUpdate
Get-Command -Module PSWindowsUpdate |
    Out-Null
# Add the opt-in for Windows Updates without having to manually confirm
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false |
    Out-Null
# Download, Accept, and Install all Windows Updates.  Ignore rebooting to get it all done at once
Install-WindowsUpdate -microsoftupdate -acceptall -ignorereboot |
    Out-Null
# Reboot the computer
Restart-Computer
