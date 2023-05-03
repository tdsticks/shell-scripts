#!/bin/bash

echo "Listing the Python versions:"
pyenv versions

echo "Choose a Project Name and Python Version (two prompts):"
read project_name
read python_ver

echo "Project Name: $project_name"
echo "Python Version: $python_ver"

echo "Building virtual environment"
pyenv virtualenv $python_ver $project_name

root_project_folder="Stickel"

cd ~/Projects/$root_project_folder
mkdir $project_name

cd ~/Projects/$root_project_folder/$project_name

mkdir data
mkdir dev
mkdir doc
# mkdir img

source /Users/steves/.pyenv/versions/$python_ver/envs/$project_name/bin/activate

echo alias "$project_name=\"pyenv deactivate; source /Users/steves/.pyenv/versions/$python_ver/envs/$project_name/bin/activate; cd ~/Projects/$root_project_folder/$project_name/dev/\"" >> ~/.bash_profile
