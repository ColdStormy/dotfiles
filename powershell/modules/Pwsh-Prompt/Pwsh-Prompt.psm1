function Write-Space {
    Write-Host " " -NoNewLine
}

function Write-Prefix {
    Write-Host "❯" -ForegroundColor Magenta -NoNewLine
    Write-Host "❯" -ForegroundColor Green -NoNewLine
}

function Write-Path {
    $currentDirName = $(Split-Path -Path (Get-Location) -Leaf)
    Write-Host "$currentDirName" -ForegroundColor DarkCyan -NoNewLine
}

function Write-Time {
    Write-Host "$(Get-Date -Format 'HH:mm')" -ForegroundColor green -NoNewLine
}

function Test-IsGitRepository {
    try {
        $output = git rev-parse --is-inside-work-tree
        if ($output -eq 'true') {
            return 1
        }
    } catch {
        return 0
    }
    return 0
}

function Write-Git {
    if( Test-IsGitRepository -eq 1 ) {
        $branchName = git rev-parse --abbrev-ref HEAD
        Write-Host "[" -ForegroundColor darkgray -NoNewLine
        Write-Host "$branchName" -ForegroundColor darkgray -NoNewLine
        Write-Host "]" -ForegroundColor darkgray -NoNewLine
        Write-Space
    }
}

function Write-Prompt {
    Param(
        [Parameter(Mandatory=$true)]
        [Bool]
        $LastCommandSucceeded,
        [Parameter(Mandatory=$true)]
        [Int]
        $ExitCode
    )
    Write-Prefix
    Write-Space

    Write-Path
    Write-Space

    Write-Git
    Write-Time
    
    if( -not $LastCommandSucceeded ) {
        Write-Host " ✗" -ForegroundColor Red -NoNewLine
    }
}

Export-ModuleMember -Function Write-Prompt