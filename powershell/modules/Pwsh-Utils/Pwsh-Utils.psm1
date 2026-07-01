function Diff-Files([string]$f1, [string]$f2)
{
    diff (Get-Content -Path $f1) (Get-Content -Path $f2)
}

function Set-Title([string]$newTitle)
{
    if( $newTitle.Length -eq 0 ) {
        $newTitle = (Split-Path -Path (Get-Location) -Leaf)
    }
        
    $host.ui.RawUI.WindowTitle = $newTitle
}

function Print-Colors() {
    [System.Enum]::getvalues([System.ConsoleColor]) | ForEach-Object {
        Write-Host $_ -ForegroundColor $_
    }
}

Export-ModuleMember -Function *