[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $SourcePath,
    [Parameter()]
    [string]
    $DestinationPath,
    [Parameter()]
    [string[]]
    $Exclude = @()
)

if (Test-Path -Path $DestinationPath) {
    Write-Host -NoNewline -ForegroundColor DarkYellow "Destination Path "
    Write-Host -NoNewline -ForegroundColor Cyan "$DestinationPath"
    Write-Host -ForegroundColor DarkYellow " does exist already, please remove file or provide different file name"
} else {
    $amountFilesRead = 0

    Get-ChildItem -Filter "*.vcf" -Path $SourcePath |
        ForEach-Object {
            if ($_.Name -notin $Exclude) {
                $fullFileName = $_.FullName
                $currentVcfContent = Get-Content -Path $fullFileName
                $currentVcfContent | Out-File -Append -Encoding utf8NoBOM -FilePath $DestinationPath
                $amountFilesRead++
            }
        }
    
    Write-Host -NoNewline -ForegroundColor DarkYellow "Wrote "
    Write-Host -NoNewline -ForegroundColor Cyan "$amountFilesRead"
    Write-Host -NoNewline -ForegroundColor DarkYellow  " contact files to "
    Write-Host -ForegroundColor Cyan "$DestinationPath"

}

