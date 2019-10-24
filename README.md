# PSKeepAChangeLog

PSKeepAChangeLog provides a series of functions that can be used to generate a standardised change log. The standard for which has been taken from [KeepAChangeLog](https://keepachangelog.com) 📄.

## What is a changelog?
A changelog is a file which contains a curated, chronologically ordered list of notable changes for each version of a project.

## Why keep a changelog?
To make it easier for users and contributors to see precisely what notable changes have been made between each release (or version) of the project.

## Who needs a changelog?
People do. Whether consumers or developers, the end users of software are human beings who care about what's in the software. When the software changes, people want to know why and how.

🐱‍💻 PSKeepAChangeLog is built and tested in Azure DevOps and is distributed via the PowerShell gallery.

[![pester](https://img.shields.io/azure-devops/tests/rdbartram/GitHubPipelines/10.svg?label=pester&logo=azuredevops&style=for-the-badge)](https://dev.azure.com/rdbartram/GithubPipelines/_build/latest?definitionId=3?branchName=master)
[![latest version](https://img.shields.io/powershellgallery/v/PSKeepAChangeLog.svg?label=latest+version&style=for-the-badge)](https://www.powershellgallery.com/packages/PSKeepAChangeLog)
[![downloads](https://img.shields.io/powershellgallery/dt/PSKeepAChangeLog.svg?label=downloads&style=for-the-badge)](https://www.powershellgallery.com/packages/PSKeepAChangeLog)



## Installation

PSKeepAChangeLog is tested to be compatible with Windows PowerShell 5.1 and PowerShell Core 6.x.

Pester comes pre-installed with Windows 10, but we recommend updating, by running this PowerShell command _as administrator_:

```powershell
Install-Module -Name PSKeepAChangeLog -Force
```

or even better, install it into your profile

```powershell
Install-Module -Name PSKeepAChangeLog -Scope CurrentUser -Force
```

## Features

### ChangeLog generation

I know that the keepachangelog guys say not to just dump your git log into your change log. However, I am a fan of automation and standardisation. If you can work to standardise your commit messages, then I can help you standardise your changelog. I think thats a pretty good deal.

```powershell
New-ChangeLog -Path CHANGELOG.md
```

if your tags are not simply numbers or start with v i.e. v1.0, then you can use the TagSortPattern to filter you semantic version strings. The following would support tags such as v-1.0

```powershell
New-ChangeLog -Path CHANGELOG.md -TagSortPattern "[Vv]-"
```


## Further reading

If you're looking to upgrade to the latest version of Windows, you'll get all the benefits of the latest [Storage module](https://docs.microsoft.com/en-us/powershell/module/storage).

## Got questions?

Got questions or you just want to get in touch? Use our issues page or one of these channels:

[![Pester Twitter](https://img.icons8.com/color/96/000000/twitter.png)](https://twitter.com/rd_bartram)
