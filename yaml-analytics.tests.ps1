Describe "Detections" {

    $testCases = Get-ChildItem -Path $detectionsPath -Include "*.yaml", "*.yml" -Exclude "action.yml", "*pipelines.yml", "*variables.yml" -Recurse | ForEach-Object -Process {
        @{
            file       = $_.FullName
            yamlObject = (Get-Content -Path $_.FullName | ConvertFrom-Yaml)
            path       = $_.DirectoryName
            name       = $_.Name
        }
    }

    Context "General" {

        It 'Alias table Should be loaded' {
            $aliasses | Should -Not -BeNullOrEmpty
        }

        It 'Converts from YAML | <Name>' -TestCases $testCases {
            param (
                $file,
                $yamlObject
            )
            $yamlObject | Should -Not -BeNullOrEmpty
        }
    }

    Context "Properties" {

        It 'Alias should not be deprecated | <Name>' -TestCases $testCases {
            param (
                $file,
                $yamlObject
            )
            $query = (($yamlObject.query)) #-split "\n")
            foreach ($value in $aliasses) {
                if ($query -match ($($value.alias) + '\(')) {
                    $value.command | Should -Match $value.alias -Because "'$($value.command)()' is a deprecated value"
                }
            }
        }
    }
}
