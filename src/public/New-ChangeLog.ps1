function New-ChangeLog {
    [CmdletBinding()]
    param(
        [parameter(Mandatory)]
        [string]
        $Path,

        [parameter()]
        [string]
        $TagSortPattern = "^[Vv]"
    )

    begin {
        $template = Get-Content $PSScriptRoot\template.md
    }

    process {
        $CommitInfo = Get-ChangeLogCommitInfo -TagSortPattern $TagSortPattern

        $release = $template -replace '{{commit_info}}', $CommitInfo

        $links = Get-GitComparisonLinks -TagSortPattern $TagSortPattern

        $release = $release -replace '{{links}}', ($links -join [System.Environment]::NewLine)

        New-Item $Path -ItemType File -Force | Out-Null
        Set-Content -Path $Path -Value $release -Force
    }
}
