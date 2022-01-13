## Python SDK New Release Process

### GitHub

We follow the [semantic versioning standard](https://semver.org).

1. Update the version number in ` setup.py`
2. Update `CHANGELOG.md` by adding details about the new version
3. Commit those changes with the message `chg: 🔖 prepare vX.X.X`

#### Draft a new release

1. Create a new tag with the new version number `vX.X.X`
2. Set the release title to the same name
3. Copy the relevant release notes from `CHANGELOG.md`
4. Publish the release

Next step is to deploy the package on PyPI.

### PyPI

### First time setup

You need to add the configuration to be able to publish from your computer, but before that, ensure you have the latest pip version, the building and publishing tools installed:

```python
python -m pip install --upgrade pip
python -m pip install --upgrade build
python -m pip install --upgrade twine
```

In your home directory, create `.pypirc` file with this content by replacing `<TOKEN>` with the proper token information for both sites:

```text
[distutils]
index-servers =
    mindee
    mindee-test

[mindee]
repository = https://upload.pypi.org/legacy/
username = __token__
password = <TOKEN>

[mindee-test]
repository = https://test.pypi.org/legacy/
username = __token__
password = <TOKEN>
```

\* *note that `__token__` in `username` need to stay exactly the same, and not modified with token ID.*

### Steps

1. Remove previous build you may have with `rm dist/*`
2. Build the source distribution `python -m build --sdist`
3. Build the wheel `python -m build --wheel`
4. Upload the package on TestPyPI first `python -m twine upload --repository mindee-test dist/*`
5. Check that everything is fine
6. Upload the package on PyPi `python -m twine upload --repository mindee dist/*`
