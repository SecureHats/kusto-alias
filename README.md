![logo](https://raw.githubusercontent.com/SecureHats/SecureHacks/main/media/sh-banners.png)
=========
[![Build](https://github.com/Azure/bicep/actions/workflows/build.yml/badge.svg)](https://github.com/Azure/bicep/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/Azure/bicep/branch/main/graph/badge.svg)](https://codecov.io/gh/Azure/bicep)
[![Good First Issues](https://img.shields.io/github/issues/SecureHats/kusto-alias/good%20first%20issue?color=important&label=good%20first%20issue&style=flat)](https://github.com/SecureHats/kusto-alias/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
[![Needs Feedback](https://img.shields.io/github/issues/SecureHats/kusto-alias/needs%20feedback?color=blue&label=needs%20feedback%20&style=flat)](https://github.com/SecureHats/kusto-alias/issues?q=is%3Aopen+is%3Aissue+label%3A%22needs+feedback%22)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/SecureHats/kusto-alias)](https://github.com/SecureHats/kusto-alias/releases/latest)

# Microsoft Sentinel - Analytics Rules Alias Validator

This GitHub action can be used to validate is deprecated operators are used in Microsoft Sentinel Analytics rules currently only in `YML` format.
>Add the following code block to your Github workflow:

```yaml
name: Aliasses
on: push

jobs:
  pester-test:
    name: validate detections
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v3
      
      - name: Validate Sentinel Analytics Rules
        uses: SecureHats/kusto-alias@v0.2.0
        with:
          filesPath: templates
          logLevel:  Detailed
```

### Inputs

This Action defines the following formal inputs.

| Name | Req | Description
|-|-|-|
| **`filesPath`**  | false | Path to the directory that contain the files to be tested, relative to the root of the project. This path is optional and defaults to the project root, in which case all files across the entire project tree will be discovered.
| **`logLevel`** | false | This indicates the verbosity of the testing engine. The default is set to `Normal` which shows all the passed and failed tests in the output. Optional values are `None, Minimal, Normal, Detailed, Diagnostic` When using `Minimal` only non-passed test results will be shown. The available verbosity options are based on the [pester](https://pester-docs.netlify.app/docs/commands/Invoke-Pester#-show) documentation. 

## Example output

![image](https://user-images.githubusercontent.com/40334679/235288882-d4367299-79d0-46f8-8fbe-42df0c648fe4.png)

![image](https://user-images.githubusercontent.com/40334679/235346394-3f1b248d-d0da-41f8-88cb-34a3cd01638b.png)


## Current limitations / Under Development

See backlog

If you encounter any issues, or hae suggestions for improvements, feel free to open an Issue

[Create Issue](../../issues/new/choose)
