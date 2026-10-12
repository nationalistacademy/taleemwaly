$ErrorActionPreference = "Stop"

$content = [System.IO.File]::ReadAllText("new 1.txt", [System.Text.Encoding]::UTF8)

# Test new 1.txt directly with XmlReader
try {
    $readerSettings = New-Object System.Xml.XmlReaderSettings
    $readerSettings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore
    $reader = [System.Xml.XmlReader]::Create("new 1.txt", $readerSettings)
    while ($reader.Read()) {}
    $reader.Close()
    Write-Host "new 1.txt is 100% valid XML!"
} catch {
    Write-Host "new 1.txt error: $($_.Exception.Message)"
}
