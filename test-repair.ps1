$ErrorActionPreference = "Stop"

$content = [System.IO.File]::ReadAllText("theme-backup-original.xml", [System.Text.Encoding]::UTF8)

# Replace the corrupted duplicate body tag with the valid head close tag
$corrupted = "<b:if cond='data:story.active'>&lt;!--</b:if>`r`n<body>"
$corruptedLF = "<b:if cond='data:story.active'>&lt;!--</b:if>`n<body>"
$fixed = "&lt;!--</head><b:if cond='!data:blog.adsenseClientId'>--&gt;<b:if cond='!data:story.status'>&lt;/head&gt;</b:if></b:if>"

# We only want to replace the FIRST occurrence (around line 3957), not the real one at line 5515!
$index = $content.IndexOf("<b:if cond='data:story.active'>&lt;!--</b:if>")
if ($index -ge 0 -and $index -lt ($content.Length / 2)) {
    # It is in the first half!
    $endIndex = $content.IndexOf("<body>", $index)
    if ($endIndex -ge 0 -and ($endIndex - $index) -lt 80) {
        $before = $content.Substring(0, $index)
        $after = $content.Substring($endIndex + 6)
        $repairedXml = $before + $fixed + $after
        [System.IO.File]::WriteAllText("theme-backup-repaired.xml", $repairedXml, [System.Text.Encoding]::UTF8)
        Write-Host "Created theme-backup-repaired.xml"
    }
}

# Now validate theme-backup-repaired.xml
$readerSettings = New-Object System.Xml.XmlReaderSettings
$readerSettings.DtdProcessing = [System.Xml.DtdProcessing]::Ignore
$reader = [System.Xml.XmlReader]::Create("theme-backup-repaired.xml", $readerSettings)
try {
    while ($reader.Read()) {}
    $reader.Close()
    Write-Host "SUCCESS! Repaired theme is 100% VALID XML!"
} catch {
    Write-Host "Validation failed: $($_.Exception.Message)"
}
