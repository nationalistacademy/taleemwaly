param(
    [string]$filePath = "theme-backup-original.xml"
)
try {
    $readerSettings = New-Object System.Xml.XmlReaderSettings
    $readerSettings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore
    $reader = [System.Xml.XmlReader]::Create($filePath, $readerSettings)
    while ($reader.Read()) {}
    $reader.Close()
    Write-Host "XML VALIDATION SUCCESS: File $filePath is 100% valid XML!"
} catch {
    Write-Host "XML VALIDATION for $filePath : $($_.Exception.Message)"
}
