#!/bin/zsh

# To use by Fred

echo "Changing to the Python SDK folder"
cd /Users/fharper/Documents/code/mindee/sdk-python
echo "Checkout main branch"
git checkout main
echo "Pull last updates"
git pull
echo "Delete the dist folder"
rm dist/*
echo "Creating source distribution"
python -m build --sdist
echo "Creating the wheel"
python -m build --wheel
echo "Press any key to upload to PyPi"
read
python -m twine upload --repository mindee dist/*
