function Get-GitComparisonLinks {
    [cmdletbinding()]
    param(
        [parameter()]
        [string]
        $TagSortPattern = "^[Vv]"
    )

    begin {
        $gitUrl = (git remote get-url origin) -replace '\.git$'
        $tags = @("HEAD") + (Get-OrderedGitTags -VersionPattern $TagSortPattern)
    }

    process {
        $i = -1
        while (++$i -lt $tags.count - 2) {
            $versionName = if($tags[$i] -eq "HEAD") {
                "Unreleased"
            } else {
                $tags[$i]
            }

            "[{0}]: {1}/compare/{2}...{3}" -f $versionName, $gitUrl, $tags[$i+1], $tags[$i]
        }
    }
}
