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

Argument | Value
--- | ---
Type | String or VPN Object
Position | Named
Default value | None
Accept pipeline input | True
Accept wildcard characters | False
Mandatory | True
##### Domain
Specify the domain to which the authenticating user belongs.

Argument | Value
--- | ---
Type | String
Position | Named
Default value | None
Accept pipeline input | False
Accept wildcard characters | False
Mandatory | True
##### UserName
Specify a username with permission to use this VPN.

Argument | Value
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

Argument | Value
--- | ---
Type | SecureString
Position | Hidden
Default value | None
Accept pipeline input | False
Accept wildcard characters | False
Mandatory | True
#### Syntax
```powershell
Connect-VPN -VPN "My VPN Connection"
```
```powershell
Connect-VPN -VPN "My VPN Connection" -Domain "contoso.com" -UserName "vpnuser"
```
```powershell
Get-VPNConnection "My VPN Connection" | Connect-VPN
```
#### Example
```
C:\>Connect-VPN "My VPN Connection"

cmdlet Connect-VPN at command pipeline position 1
Supply values for the following parameters:
Domain: contoso.com
UserName: vpnuser
Password: ******
Verifying username and password...
Registering your computer on the network...
Successfully connected to My VPN Connection.
```

### Disconnect-VPN
The Disconnect-VPN cmdlet allows you to disconnect one or all currently active VPNs.
#### Parameters
##### VPN
Specifies a VPN which you wish to terminate.  Can be provided as a `string` or as a `VPN Object` such as those returned by `Get-VPNConnection`.

Argument | Value
--- | ---
Type | String or VPN Object
Position | Named
Default value | None
Accept pipeline input | True
Accept wildcard characters | False
Mandatory | False
#### Syntax
```powershell
Disconnect-VPN
```
```powershell
Disconnect-VPN -VPN "My VPN Connection"
```
```powershell
Get-VPNConnection "My VPN Connection" | Disconnect-VPN
```
#### Example
```
C:\>Disconnect-VPN
Command completed successfully.
```
### Get-ActiveVPNConnections
The Get-ActiveVPNConnections cmdlet returns a list of all currently active VPNs.
#### Parameters
There are no parameters for this cmdlet.
#### Syntax
```powershell
Get-ActiveVPNConnections
```
#### Example
```
C:\>Get-ActiveVPNConnections
Active VPN Connections:
My VPN Connection
My Second VPN Connection
```