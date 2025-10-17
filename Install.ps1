# iex (iwr 'https://raw.githubusercontent.com/dfeies/MRLPerf/refs/heads/main/Install.ps1')

Write-Host 'Installing MRLPerf...'

# List of files to download
$fileList = @(
	'README.md',
	'Install.ps1',
	'MRLTriage.cmd',
	'MRLTriage_10s.cmd',
	'MRLTriage.wprp'
)

# Destination folder
$destFolder = "$env:USERPROFILE\Desktop\MRLPerf"

# Create destination folder if it doesn't exist
if (-not (Test-Path $destFolder)) {
	New-Item -ItemType Directory -Path $destFolder | Out-Null
}

# Base URL for downloads
$baseUrl = 'https://raw.githubusercontent.com/dfeies/MRLPerf/refs/heads/main/'

# Download each file
foreach ($file in $fileList) {
	$url = "$baseUrl$file"
	$destPath = Join-Path $destFolder $file
	Invoke-WebRequest -Uri $url -OutFile $destPath -UseBasicParsing
}

Write-Host 'Installed to Desktop\\MRLPerf.'

