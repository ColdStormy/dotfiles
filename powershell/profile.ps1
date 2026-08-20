$global:LastGitRepo = $null

function Invoke-OnGitRepoEnter {
    $repo = git rev-parse --show-toplevel 2>$null

    if ($LASTEXITCODE -eq 0 -and $repo -ne $global:LastGitRepo) {
        $global:LastGitRepo = $repo

        $repoName = Split-Path $repo -Leaf
        Set-Title "Git: $repoName"
        
    }

    if ($LASTEXITCODE -ne 0) {
        $global:LastGitRepo = $null
    }
}

$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;

$modulePath = $PSScriptRoot
$modulePath = Join-Path $modulePath "modules"
$env:PSModulePath += ";" + $modulePath

if (Get-Module -ListAvailable -Name Pwsh-Adsk) {
    Import-Module Pwsh-Adsk -DisableNameChecking
}
Import-Module Pwsh-Utils -DisableNameChecking
Import-Module Pwsh-Prompt -DisableNameChecking
function Prompt() {
    Invoke-OnGitRepoEnter

    $prevCommandOK = $?
    $exitCode = $LastExitCode
    Write-Prompt -LastCommandSucceeded $prevCommandOK -ExitCode $exitCode
    return " "
}
Invoke-Expression (& { (zoxide init powershell | Out-String) })
function gadd {   
    param(
        [ValidateSet("all", "none")]
        [string]$IgnoreSubmodules = "all"
    ) 
    git status --short --ignore-submodules=$IgnoreSubmodules |
        ForEach-Object { $_.Substring(3) } |
        fzf --multi --prompt="git add: " --marker=* |
        ForEach-Object { git add -- $_ }
}

function gs {
    param(
        [ValidateSet("all", "none")]
        [string]$IgnoreSubmodules = "all"
    )

    git status --ignore-submodules=$IgnoreSubmodules --short --branch
}