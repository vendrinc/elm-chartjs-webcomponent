## Updating NPM package
1. Update the version number (see more info [here](https://docs.npmjs.com/updating-your-published-package-version-number) )
```npm version <update_type>```

2. Run `npm publish` to update the package (see more info [here](https://docs.npmjs.com/cli/publish))

## Updating Elm package
Elm strongly enforces semantic versioning.

1. Run `elm bump` to update the package version number

2. Run `elm publish` to publish the update