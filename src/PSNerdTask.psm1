$functionFolders = @('Public', 'Private', 'Classes')
foreach ($folder in $functionFolders)
{
    $folderPath = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if (Test-Path -Path $folderPath)
    {
        Write-Verbose -Message "Importing from $folder"
        $functions = Get-ChildItem -Path $folderPath -Filter '*.ps1' 
        foreach ($function in $functions)
        {
            Write-Verbose -Message "  Importing $($function.BaseName)"
            . $($function.FullName)
        }
    }    
}
$publicFunctions = (Get-ChildItem -Path "$PSScriptRoot\Public" -Filter '*.ps1').BaseName
Export-ModuleMember -Function $publicFunctions
