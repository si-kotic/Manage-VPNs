Function Connect-VPN {
    <#
    .LINK
    https://github.com/si-kotic/Manage-VPNs
    #>
    Param (
        [Parameter(ValueFromPipeline=$true,Mandatory)]$VPN,
        [Parameter(Mandatory)]$Domain,
        [Parameter(Mandatory)]$UserName,
        [Parameter(Mandatory,DontShow)][SecureString]$Password
    )
    IF ($VPN.GetType().Name -eq "CimInstance") {
        $vpnName = $VPN.Name
    }
    ELSEIF ($VPN.GetType().Name -eq "String") {
        $vpnName = $VPN
    }
    $UnsecurePassword = (New-Object PSCredential "user",$Password).GetNetworkCredential().Password
    rasdial.exe $vpnName $username $UnsecurePassword /DOMAIN:$domain
}

Function Disconnect-VPN {
    <#
    .LINK
    https://github.com/si-kotic/Manage-VPNs
    #>
    Param (
        [Parameter(ValueFromPipeline=$true)]$VPN = ""
    )
    IF ($VPN.GetType().Name -eq "CimInstance") {
        $vpnName = $VPN.Name
    }
    ELSEIF ($VPN.GetType().Name -eq "String") {
        $vpnName = $VPN
    }
    rasdial.exe $vpnName /DISCONNECT
}

Function Get-ActiveVPNConnections {
    <#
    .LINK
    https://github.com/si-kotic/Manage-VPNs
    #>
    $rasdial = rasdial.exe
    IF ($rasdial[0] -eq "No Connections") {
        $rasdial[0]
    } ELSEIF ($rasdial[0] -eq "Connected to") {
        Write-Host "Active VPN Connections:"
        $rasdial[1..($rasdial.count-2)]
    }
}