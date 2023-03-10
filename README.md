![logo](https://raw.githubusercontent.com/SecureHats/SecureHacks/main/media/sh-banners.png)
=========
[![Build](https://github.com/Azure/bicep/actions/workflows/build.yml/badge.svg)](https://github.com/Azure/bicep/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/Azure/bicep/branch/main/graph/badge.svg)](https://codecov.io/gh/Azure/bicep)
[![Good First Issues](https://img.shields.io/github/issues/Azure/Bicep/good%20first%20issue?color=important&label=good%20first%20issue&style=flat)](https://github.com/Azure/Bicep/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
[![Needs Feedback](https://img.shields.io/github/issues/Azure/Bicep/needs%20feedback?color=blue&label=needs%20feedback%20&style=flat)](https://github.com/Azure/bicep/issues?q=is%3Aopen+is%3Aissue+label%3A%22needs+feedback%22)
# Microsoft Sentinel - Analytics Rules Alias Validator

This GitHub action can be used to validate Microsoft Sentinel Analytics rules in both JSON and YML format.
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
        uses: SecureHats/kusto-alias@v0.1.0-alpha
        with:
          filesPath: templates
          logLevel: Minimal
```

### Inputs

This Action defines the following formal inputs.

| Name | Req | Description
|-|-|-|
| **`filesPath`**  | false | Path to the directory that contain the files to be tested, relative to the root of the project. This path is optional and defaults to the project root, in which case all files across the entire project tree will be discovered.
| **`logLevel`** | false | This indicates the verbosity of the testing engine. The default is set to `Normal` which shows all the passed and failed tests in the output. Optional values are `None, Minimal, Normal, Detailed, Diagnostic` When using `Minimal` only non-passed test results will be shown. The available verbosity options are based on the [pester](https://pester-docs.netlify.app/docs/commands/Invoke-Pester#-show) documentation. 

## Current included tests

> N/A

## Current limitations / Under Development

- [x] Only YAML is supported in the Alpha
- [ ] Support for JSON files
- [ ] Support for ASIM Parsers
