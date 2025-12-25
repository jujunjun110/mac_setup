# Windows Package Manager (winget) Setup Script

Write-Host "=== Windows Setup Script ===" -ForegroundColor Cyan
Write-Host ""

# wingetが利用可能か確認
Write-Host "Checking winget availability..." -ForegroundColor Yellow
try {
    $wingetVersion = winget --version
    Write-Host "winget is available: $wingetVersion" -ForegroundColor Green
} catch {
    Write-Host "Error: winget is not available. Please install App Installer from Microsoft Store." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Installing packages..." -ForegroundColor Yellow
Write-Host ""

# Development Tools
Write-Host "Installing Visual Studio Code..." -ForegroundColor Cyan
winget install --id Microsoft.VisualStudioCode --exact --accept-source-agreements --accept-package-agreements

Write-Host "Installing Sublime Text..." -ForegroundColor Cyan
winget install --id SublimeHQ.SublimeText.4 --exact --accept-source-agreements --accept-package-agreements

Write-Host "Installing GitHub Hub..." -ForegroundColor Cyan
winget install --id GitHub.hub --exact --accept-source-agreements --accept-package-agreements

# Browser
Write-Host "Installing Google Chrome..." -ForegroundColor Cyan
winget install --id Google.Chrome --exact --accept-source-agreements --accept-package-agreements

# Communication
Write-Host "Installing Slack..." -ForegroundColor Cyan
winget install --id SlackTechnologies.Slack --exact --accept-source-agreements --accept-package-agreements

# Productivity
Write-Host "Installing Microsoft 365..." -ForegroundColor Cyan
winget install --id Microsoft.Office --exact --accept-source-agreements --accept-package-agreements

# Keyboard Customization
Write-Host "Installing PowerToys..." -ForegroundColor Cyan
winget install --id Microsoft.PowerToys --exact --accept-source-agreements --accept-package-agreements

Write-Host "Installing Keyhac..." -ForegroundColor Cyan
winget install --id Craftware.Keyhac --exact --accept-source-agreements --accept-package-agreements

# Mouse Customization
Write-Host "Installing Logi Options+..." -ForegroundColor Cyan
winget install --id Logitech.OptionsPlus --exact --accept-source-agreements --accept-package-agreements

# Input Method
Write-Host "Installing Google Japanese Input..." -ForegroundColor Cyan
winget install --id Google.JapaneseIME --exact --accept-source-agreements --accept-package-agreements

Write-Host ""
Write-Host "=== Installation Complete ===" -ForegroundColor Green
