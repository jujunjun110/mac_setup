# Configuration Files Setup Script

Write-Host "=== Configuration Setup Script ===" -ForegroundColor Cyan
Write-Host ""

$repoRoot = Split-Path -Parent $PSScriptRoot

# Keyhac Configuration
Write-Host "Setting up Keyhac configuration..." -ForegroundColor Yellow
$keyhacDir = "$env:USERPROFILE\.keyhac"
$keyhacConfigSrc = "$repoRoot\keyhac_config.py"
$keyhacConfigDst = "$keyhacDir\config.py"

if (Test-Path $keyhacConfigSrc) {
    if (-not (Test-Path $keyhacDir)) {
        New-Item -ItemType Directory -Path $keyhacDir -Force | Out-Null
        Write-Host "Created directory: $keyhacDir" -ForegroundColor Green
    }

    Copy-Item -Path $keyhacConfigSrc -Destination $keyhacConfigDst -Force
    Write-Host "Copied Keyhac config to: $keyhacConfigDst" -ForegroundColor Green
} else {
    Write-Host "Warning: keyhac_config.py not found at $keyhacConfigSrc" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Configuration Setup Complete ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "- Launch Keyhac from Start Menu (if not already running)"
Write-Host "- Test: Press CapsLock + P/N/F/B to move cursor"
Write-Host "- Apply Caps2RCtrl.reg for CapsLock → Right Ctrl mapping (requires restart)"
