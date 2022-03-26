function Write-HostRGB {
    [CmdletBinding()]
    param (
        [string]$Text,
        [int[]]$ForegroundColor = (122, 20, 30),
        [int[]]$BackgroundColor = (10, 55, 23),
        [switch]$NoNewLine

    )
    

    $escape = [char]27 + '['
    $resetAttributes = "$($escape)0m"
        
    $foreground = "$($escape)38;2;$($ForegroundColor[0]);$($ForegroundColor[1]);$($ForegroundColor[2])m"
    $background = "$($escape)48;2;$($BackgroundColor[0]);$($BackgroundColor[1]);$($BackgroundColor[2])m"
        
    Write-Host ($foreground + $background + $Text + $resetAttributes) -NoNewline:$NoNewLine
    
}

$Text = @"

    Welcome to NerdTask - The todo app for Techies!

    Blablabla
"@