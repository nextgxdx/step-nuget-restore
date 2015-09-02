# nuget-restore step

Executes the `nuget restore` command with leveraging the wercker cache mechanism to improve installation time.

If `nuget restore` fails, it will be retried three times before failing.

## Options

### options
- type: string
- optional: true
- description: Passed through to `nuget restore <options>`

## Example

```yaml
build:
  steps:
    - nuget-restore:
      options: ./path/to/solution.sln
```

# License

The MIT License (MIT)

# Changelog

## 0.0.1

- Initial release
