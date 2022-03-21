# Node.js SDK New Release Process

## GitHub

We follow the [semantic versioning standard](https://semver.org).

1. Update the version number in `package.json`
2. Update `CHANGELOG.md` by adding details about the new version
3. Commit those changes with the message `chg: 🔖 prepare vX.X.X`

### Draft a new release

1. Create a new tag with the new version number `vX.X.X`
2. Set the release title to the same name
3. Copy the relevant release notes from `CHANGELOG.md`
4. Publish the release

Next step is to deploy the package on npm.

## npm

From the command line inside of the Node.js repository folder, run `npm publish`. Note that you need to be a maintainer and connect your user with the npm CLI.
