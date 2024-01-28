#!/bin/bash
set -e 
clear

if [[ "$VIRTUAL_ENV" != "" ]]
then
  echo "You must exit the current virtual environment by calling 'deactivate'"
  return
fi

# Ensure we're not currently in the venv and delete if it exists
echo ">>> Cleanup virtual environment"
rm -R env || :

echo ">>> Installing Python prereqs"
python3 -m pip install --user --upgrade pip
python3 -m pip install --user --upgrade virtualenv
python3 -m pip install --user --upgrade pipx
python3 -m pipx ensurepath


echo ">>> Recreating 'env' virtual environment"
python3 -m venv env

echo ">>> Activating 'env' virtual environment"
source env/bin/activate

echo ">>> Installing required packages"
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

echo "To use your virtual environment when running the notebook:"
echo " - close and reopen vscode (so it reloads the list of available environments)"
echo " - close and reopen vscode (so it reloads the list of available environments)"

echo "To use your virtual environment on the command line run the following:"
echo "`source env/bin/activate`"