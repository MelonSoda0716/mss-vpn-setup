Write-Host "START: MelonSoda Server VPN�̃Z�b�g�A�b�v���J�n���܂��B"

$VpnName = "MSS VPN"
$VpnUrl = "vpn.melonsoda.tokyo"
$IpRulesPath = ".\data\ip_rules.txt"

Write-Host "STEP1: VPN���\�z���Ă��܂��B"

Add-VpnConnection -Name $VpnName -ServerAddress $VpnUrl -TunnelType "IKEv2" -EncryptionLevel "NoEncryption" -SplitTunneling:$true -RememberCredential -Force

Write-Host "STEP2: ���[����`�t�@�C����ǂݍ���ł��܂��B"

$rules = (Get-Content $IpRulesPath) -as [string[]]

foreach($rule in $rules){

    Add-VpnConnectionRoute $VpnName -DestinationPrefix $rule

}

Write-Host "END  : �Z�b�g�A�b�v���������܂����B�R�}���h�v�����v�g���I�����Ă��������B"