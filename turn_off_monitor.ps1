# Debugging message: Start of script
Write-Host "Starting script..." -ForegroundColor Green

# Get-DisplayInfo and process its output as objects
Write-Host "Running Get-DisplayInfo to retrieve display information..." -ForegroundColor Yellow
$displayInfo = & Get-DisplayInfo

if (-not $displayInfo) {
    Write-Host "Error: No display information retrieved from Get-DisplayInfo." -ForegroundColor Red
    exit
}

# Output the current display information for debugging
Write-Host "`nCurrent Display Information:" -ForegroundColor Cyan
$displayInfo | Format-Table -AutoSize

# Look for the display with DisplayId 1
$display1 = $displayInfo | Where-Object { $_.DisplayId -eq 1 }

if (-not $display1) {
    Write-Host "`nError: DisplayId 1 not found in the output of Get-DisplayInfo." -ForegroundColor Red
    exit
}

# Debugging: Show the details of DisplayId 1
Write-Host "`nDisplayId 1 Details:" -ForegroundColor Cyan
$display1 | Format-List

# Check the Active status of DisplayId 1 and toggle it
if ($display1.Active) {
    Write-Host "`nDisplayId 1 is currently Active. Disabling it..." -ForegroundColor Yellow
    disable-display 1
} else {
    Write-Host "`nDisplayId 1 is currently Inactive. Enabling it..." -ForegroundColor Yellow
    enable-display 1
}

# Output Get-DisplayInfo after the change
Write-Host "`nRunning Get-DisplayInfo after the change..." -ForegroundColor Yellow
$updatedDisplayInfo = Get-DisplayInfo
Write-Host "`nUpdated Display Information:" -ForegroundColor Cyan
$updatedDisplayInfo | Format-Table -AutoSize
