Function CheckInAllFileInLibrary([string]$SiteUrl, [string]$docLibName)
{
    
    $spWeb = Get-SPWeb $SiteUrl
    $getFolder = $spWeb.GetFolder("$docLibName")
    $getFolder.Files | Where { $_.CheckOutStatus -ne "None" } | ForEach
    {
        Write-Host "$($_.Name) is Checked out To: $($_.CheckedOutBy)"
        $_.CheckIn("Checked In By Administrator")
        Write-Host "$($_.Name) Checked In" -ForeGroundColor Green
    }
    $spWeb.Dispose()
}
CheckInAllFileInLibrary -SiteUrl "http://mysharepoint/sites/123" -docLibName "Documents"
