
@{
  ExtractFolder = @{
    Source = 'gci Dependencies\PSBuildRelease\BuildTasks | % {move-item $_.fullname .\.build -force}; sleep 1; remove-item .\Dependencies\PSBuildRelease -Force -Recurse'
    DependsOn = 'BR'
    DependencyType = 'Command'
  }
  BuildFolder = @{
    Source = 'Remove-Item .\.build -Force -Recurse -confirm:$false -ErrorAction SilentlyContinue; New-Item -Type Directory -Path .build -Force | Out-Null; New-Item -Type Directory -Path Dependencies -Force | Out-Null'
    DependencyType = 'Command'
  }
  BuildHelpers = 'latest'
  invokebuild = 'latest'
  BR = @{
    Version = 'master'
    Name = 'https://github.com/rdbartram/PSBuildRelease'
    DependsOn = 'BuildFolder'
  }
  Configuration = 'latest'
  PSDependOptions = @{
    Target = '$DependencyFolder\Dependencies'
    AddToPath = $True
  }
  pester = 'latest'
}
