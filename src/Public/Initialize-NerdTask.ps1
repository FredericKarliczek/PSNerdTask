function Initialize-NerdTask {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet("FileSystem", "SQLiteDatabase")]
        [string]$DataStorage
    )
    
    $AppdataPath = "$Env:LOCALAPPDATA\PSNerdTask"

    $Configuration = @{
        DataStorage = $DataStorage
    }

    if ($DataStorage -eq "FileSystem") {

        $TasksFolder = New-Item -Path "$AppdataPath\Tasks" -ItemType Directory
        $Configuration.TasksFolder = $TasksFolder.FullName
    }

    if ($DataStorage -eq "SQLiteDatabase") {
        throw "Not implemented yet!"
    }

    ConvertTo-Json -InputObject $Configuration | Out-File -FilePath "$AppdataPath\config.json"
}