# iex (iwr 'https://raw.githubusercontent.com/dfeies/MRLPerf/refs/heads/main/Install.ps1')

Write-Host 'Installing MRLPerf...'
$OutPath = (Join-Path $HOME 'Desktop\MRLPerf')
$OutFile = (Join-Path $OutPath 'Hello.ps1')
$HelloPS = 'https://gist.githubusercontent.com/dfeies/d21f6681bf76c1ff6815451e531166bf/raw/Hello.ps1'
New-Item -Path $OutPath -ItemType Directory -Force | Out-Null
Invoke-WebRequest -Uri $HelloPS -OutFile $OutFile
Write-Host 'Installed on desktop, MRLPerf folder.'