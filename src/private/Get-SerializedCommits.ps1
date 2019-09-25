function Get-SerializedCommits {
    [cmdletbinding()]
    param(
        [parameter(Mandatory)]
        [string]
        $Filter
    )

    process {
        $committext = (git log $filter --format="%ai`t%H`t%an`t%ae`t%s`t%b")
        return $committext | ConvertFrom-Csv -Delimiter "`t" -Header ("Date", "CommitId", "Author", "Email", "Subject", "Body")
    }
}
