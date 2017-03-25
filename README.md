## terraform-install for wercker step

terraform install with support for wercker cache between builds

### how to use

Add ${terraform-version}.(ex: 0.9.1)

```yaml
build:
  steps:
    - davidlluna/terraform-install:
        version: ${terraform-version}
```
