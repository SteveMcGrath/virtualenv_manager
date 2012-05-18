#!/bin/bash

if [ "$(uname)" == "Darwin" ];then
	PROFILE="$HOME/.bash_profile"
else
	PROFILE="$HOME/.bashrc"


if [ ! -d "$HOME/.virtualenvs" ];then
	mkdir -p "$HOME/.virtualenvs"
fi

if [ ! -d "$HOME/.profile_scritps"];then
	mkdir -p "$HOME/.profile_scripts"
	cat profile.sh >> $PROFILE
fi

cp venv.sh $HOME/.profile_scripts/venv.sh
echo "Install Completed."