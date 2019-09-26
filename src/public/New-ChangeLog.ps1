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
# $end = $prevtag = "HEAD"
# $file = "C:\temp\release.md"
# $url = (git remote get-url origin) -replace '\.git$'

# Set-Content $file -Value @"
# # Changelog
# All notable changes to this project will be documented in this file.

# The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
# and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


# "@
# $links = @()
# foreach ($tag in $Tags) {
#     $endsearch = "..$end"
#     if($Tags.IndexOf($tag) -eq $tags.Count-1) {
#         $endsearch = ""
#     }

#     $commits = (git log refs/tags/$tag$endsearch --format="%ai`t%H`t%an`t%ae`t%s") | ConvertFrom-Csv -Delimiter "`t" -Header ("Date","CommitId","Author","Email","Subject")

#     if($end -eq "HEAD") {
#         $title  = "## [Unreleased]"
#     } else {
#         $title  = "## [$prevtag] - $(get-date $commits[0].Date -Format "dd-MM-yyyy")"
#     }

#     Add-Content $file -Value $title

#     $commits | % {
#         Add-Content $file " - $($_.Subject)"
#     }

#     Add-Content $file ""

#     $links += "$(if($title -match '(\[.+\])'){$matches[0]}): $url/compare/$tag...$($end -replace '^refs/tags/')"
#     $end = "refs/tags/$tag"
#     $prevtag = $tag
# }

# Add-Content $file -value ""
# Add-Content $file -Value $links
