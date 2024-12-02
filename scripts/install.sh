# Chocolatey install
Write-Host "Installeren Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Installeer .NET SDK 8 met Chocolatey
Write-Host "Installeren .NET SDK 8..."
choco install dotnet-sdk -y --version=8.0.100

# Installeer Git met Chocolatey
Write-Host "Installeren Git..."
choco install git -y

# Clone de GitHub repo
Write-Host "Clonen van de GitHub-repository..."
git clone https://github.com/Thijs529702/EasyDevOps529702.git
Set-Location .\EasyDevOps529702\frontend\EasyDevOpsFrontend\

# Run de .NET app
Write-Host "Starten van de .NET-app..."
dotnet run
