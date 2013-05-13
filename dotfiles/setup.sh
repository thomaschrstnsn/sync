#!/bin/sh
# Script to automatically create dotfile symlinks

FROM="`dirname \`which $0\``"

if [[ -d "$1" ]]; then
	TO="$1"
else
	TO="$PWD"
fi

cd $FROM

echo "Symlinking files from '$FROM' to '$TO'"

for FILE in `find -L . -maxdepth 1 -wholename './.*'`; do
	echo "Creating symlink to $FILE"
	echo

	ln -si "$FROM/$FILE" "$TO/$FILE"
done
