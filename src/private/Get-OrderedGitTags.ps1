function Get-OrderedGitTags {
    [cmdletbinding(DefaultParameterSetName = "desc")]
    param(
        [parameter(ParameterSetName = "aesc")]
        [switch]
        $Ascending,

        [parameter(ParameterSetName = "desc")]
        [switch]
        $Descending,

        [parameter()]
        [string]
        $VersionPattern = '^[Vv]'
    )

    process {
        $Tags = ((git show-ref --tags) -match 'refs/tags') -replace '.+refs/tags/'

        $Tags | Sort-Object { [system.version]($_ -creplace $VersionPattern)} -Descending:$($PSCmdlet.ParameterSetName -eq "desc")
    }
}

