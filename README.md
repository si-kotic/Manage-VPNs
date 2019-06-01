# Manage VPNs
This module provides functions which allow you to manage VPN Connections through PowerShell.

The reason I wrote this is because the VPN Management functionality provided by Windows 10 is cumbersome once you have more than a handful of VPN Connections configured.

## Cmdlets
* Connect-VPN
* Disconnect-VPN
* Get-ActiveVPNConnections

## Usage
To install the module, download the files from GitHub and save them to your local device, eg `C:\PowerShellModules\Manage-VPNs\`.  Next run the Import-Module command, providing the full path of the `.psm1` file to the `Name` parameter, eg `Import-Module -Name C:\PowerShellModules\Manage-VPNs\Manage-VPNs.psm1`.
### Connect-VPN
The Connect-VPN cmdlet allows you to connect to a VPN.
#### Parameters
##### VPN
Specifies a VPN to which you wish to connect.  Can be provided as a `string` or as a `VPN Object` such as those returned by `Get-VPNConnection`.
| | |
--- | ---
Type | String or VPN Object
Position | Named
Default value | None
Accept pipeline input | True
Accept wildcard characters | False
Mandatory | True
##### Domain
Specify the domain to which the authenticating user belongs.
| | |
--- | ---
Type | String
Position | Named
Default value | None
Accept pipeline input | False
Accept wildcard characters | False
Mandatory | True
##### UserName
Specify a username with permission to use this VPN.
| | |
--- | ---
Type | String
Position | Named
Default value | None
Accept pipeline input | False
Accept wildcard characters | False
Mandatory | True
##### Password
The value of this parameter should be the password for the authenticating user.

**This parameter should not be explicitly specified when calling the cmdlet and will not autocomplete.  When you execute the command without this paramter you will be prompted to provide it and the value will be masked for security.**
| | |
--- | ---
Type | SecureString
Position | Hidden
Default value | None
Accept pipeline input | False
Accept wildcard characters | False
Mandatory | True
#### Syntax
```powershell
Connect-VPN -VPN "VPN Connection Name"
```
```powershell
Connect-VPN -VPN "VPN Connection Name" -Domain "contoso.com" -UserName "vpnuser"
```
```powershell
Get-VPNConnection "VPN Connection Name" | Connect-VPN
```
#### Example
```
ADMIN C:\Users\simon.brown>Connect-VPN "VPN Connection Name"

cmdlet Connect-VPN at command pipeline position 1
Supply values for the following parameters:
Domain: contoso.com
UserName: vpnuser
Password: ******
Verifying username and password...
Registering your computer on the network...
Successfully connected to VPN Connection Name.
```