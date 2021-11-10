# Install Windows Updates - Unattended

## Description
This script will install Windows Updates by downloading them one by one and installing them without forcing a reboot.  This is great when you are trying to save time across several different computers.

This is was created when we were restarting many old computers that hadn't be started up in 2 years due to COVID-19.
  
## Usage - Local
Make sure there is the appropriate execution policy setup for the device you are running on. From an Administrative Prompt:
```
Set-ExecutionPolicy Unrestricted
```
Unrestricted is reccommended since this isn't code signed in any fashion. After this has been ran you can set this back to Restricted. From an Administrative Prompt:
```
InstallWindowsUpdates.ps1
```

## Usage - Remote
