Write-Host "START: MelonSoda Server VPNのセットアップを開始します。"

$VpnName = "MSS VPN"
$VpnUrl = "vpn.melonsoda.tokyo"
$IpRulesPath = ".\data\ip_rules.txt"

Write-Host "STEP1: VPNを構築しています。"

Add-VpnConnection -Name $VpnName -ServerAddress $VpnUrl -TunnelType "IKEv2" -EncryptionLevel "NoEncryption" -SplitTunneling:$true -RememberCredential -Force

Write-Host "STEP2: ルール定義ファイルを読み込んでいます。"

$rules = (Get-Content $IpRulesPath) -as [string[]]

foreach($rule in $rules){

    Add-VpnConnectionRoute $VpnName -DestinationPrefix $rule

}

Write-Host "END  : セットアップが完了しました。コマンドプロンプトを終了してください。"