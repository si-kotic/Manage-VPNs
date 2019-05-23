Function Connect-VPN {
    Param (
        [Parameter(ValueFromPipeline=$true)]$VPN,
        [Parameter(Mandatory)]$Domain,
        [Parameter(Mandatory)]$UserName,
        [Parameter(Mandatory)][SecureString]$Password
    )
    $vpnName = $VPN.Name
    $UnsecurePassword = (New-Object PSCredential "user",$Password).GetNetworkCredential().Password
    rasdial.exe $vpnName $username $UnsecurePassword /DOMAIN:$domain
}

Function Disconnect-VPN {
    Param (
        [Parameter(ValueFromPipeline=$true)]$VPN
    )
    $vpnName = $VPN.Name
    rasdial.exe $vpnName /DISCONNECT
}

Function Get-ActiveVPNConnections {
    $rasdial = rasdial.exe
    IF ($rasdial[0] -eq "No Connections") {
        $rasdial[0]
    } ELSEIF ($rasdial[0] -eq "Connected to") {
        Write-Host "Active VPN Connections:"
        $rasdial[1..($rasdial.count-2)]
    }
}