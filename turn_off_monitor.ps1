$displayInfo = & Get-DisplayInfo
if (-not $displayInfo) {
    exit
}
$displayInfo | Format-Table -AutoSize
$display1 = $displayInfo | Where-Object { $_.DisplayId -eq 1 }
if (-not $display1) {
    exit
}
$display1 | Format-List
if ($display1.Active) {
    disable-display 1
} else {
    enable-display 1
}
$updatedDisplayInfo = Get-DisplayInfo
$updatedDisplayInfo | Format-Table -AutoSize
