function Get-ChangeLogCommitInfo {
    [CmdletBinding()]
    param(
        [parameter()]
        [string]
        $TagSortPattern = "^[Vv]"
    )

    begin {
        $tags = Get-OrderedGitTags -VersionPattern $TagSortPattern

        $searchUntil = "..HEAD"

        $Output = @()
    }

    process {
        foreach ($tag in $tags) {
            $currentTagIndex = $tags.IndexOf($tag)

            if ($currentTagIndex -eq $tags.Count - 1) {
                $searchUntil = ""
            }

            $commits = Get-SerializedCommits -Filter "$tag$searchUntil"

            if ($searchUntil -eq "..HEAD") {
                $title = "## [Unreleased]"
            } else {
                $title = "## [$tags[$currentTagIndex-1]] - $(get-date $commits[0].Date -Format "dd-MM-yyyy")"
            }

            $Output += $title

            $commits | ForEach-Object -Process {
                $Output += " - $($_.Subject)"
            }

            $Output += ""
            $searchUntil = "refs/tags/$tag"
        }
    }
}
